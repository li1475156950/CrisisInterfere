using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using CrisisInterfere.projrem;
namespace CrisisInterfere.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// ClinicalImpression 的摘要说明
    /// </summary>
    public class ClinicalImpression : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            
            string operationType = context.Request["operationType"].ToString();

            System.Reflection.MethodInfo methodInfo = this.GetType().GetMethod(operationType);
            if (methodInfo != null)
            {
                methodInfo.Invoke(this, new object[] { context });
            } 
        }
        public void GetReportTitle(HttpContext context)
        {
            
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var reportTitle = MgrServices.GroupReportService.GetReportTitle(grID);
            context.Session["ReportTitle"] = reportTitle;
            context.Response.Write(reportTitle);

        }
        public void GetAmountIntroduce(HttpContext context)
        {
            
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var amountIntroduce = MgrServices.GroupReportService.GetAmountIntroduce(grID);
            context.Session["AmountIntroduce"] = amountIntroduce;
            context.Response.Write(amountIntroduce);
        }
        public List<UserDimensionScoreModel<decimal>> GetUsersDimensionScore(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var amountCode = "";
            var listStr = MgrServices.GroupReportService.GetUserIDListAndAmountCode(grID);//根据GR_ID得到用户ID集合和量表Code
            var userIDListTemp = listStr[1];//用户ID集合字符串临时变量
            var ansIDListTemp = listStr[2];
            amountCode = listStr[0];//量表Code
            string[] userIDListArray = userIDListTemp.Split(',');//将用户ID集合字符串分割成用户ID数组
            string[] ansIDListArray = ansIDListTemp.Split(',');
            List<string> dimension = MgrServices.GroupReportService.GetDimensionByAmountCode(amountCode).Where(m => m.ToString() != "WD_14810164599358").ToList();//根据量表Code得到维度
            List<UserDimensionScoreModel<decimal>> lus = new List<UserDimensionScoreModel<decimal>>();//记录用户维度分数集合
            for (int i = 0; i < userIDListArray.Length; i++)
            {
                UserDimensionScoreModel<decimal> uds = new UserDimensionScoreModel<decimal>();
                if (!string.IsNullOrEmpty(userIDListArray[i]))
                {
                    var answerRecord = MgrServices.GroupReportService.GetAnswerAddRecord(Convert.ToInt32(userIDListArray[i]), Convert.ToInt32(ansIDListArray[i]), amountCode);//根据用户ID，量表Code得到答题记录
                    Dictionary<string, string> answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(answerRecord);//将用户答题记录json字符串反序列为字典项键值对
                    Dictionary<string, decimal> dimensionScore = new Dictionary<string, decimal>();//记录录用户维度分数
                    var thirdQuestionMark = 0;
                    var fourthQuestionMark = 0;
                    for (int j = 0; j < dimension.Count; j++)
                    {
                        var score = 0;//记录维度总分变量
                        var scoreStr = "";//记录启用公式的维度公式算法变量
                        Calculate cal = new Calculate();
                        var subjectCodes = MgrServices.GroupReportService.GetSubjectCodeByDimensionCode(dimension[j]);//根据维度获取题干Code
                        StringBuilder sb = new StringBuilder();
                        sb.Append("(");
                        foreach (var item in answerRecordDic)
                        {
                            //判断出当前所有题干属于当前维度Code的题干

                            if (subjectCodes.Contains(item.Key))
                            {
                                sb.Append("'" + item.Value + "'");
                                sb.Append(",");
                            }

                        }
                        sb.Remove(sb.Length - 1, 1);
                        sb.Append(")");
                        score = Convert.ToInt32(MgrServices.GroupReportService.GetSingleScoreBySbjCodeAndOptCode(sb.ToString()));//分数累加
                        //判断是否启用公式计算
                        if (MgrServices.GroupReportService.GetScoreModel(dimension[j]) > 0)
                        {
                            scoreStr = MgrServices.GroupReportService.GetFormulaStrByDimensionCode(dimension[j]).Replace("Score", score.ToString());//将公式中的Score替换成总分
                            decimal result;
                            Queue<string> qs = cal.SplitExpress(scoreStr);
                            List<string> ls = cal.InorderToPostorder(qs);
                            cal.IsResult(ls, out result);
                            scoreStr = result.ToString();
                        }
                        if (dimension[j] == "WD_14963919010893")
                        {
                            thirdQuestionMark = Convert.ToInt32(MgrServices.GroupReportService.GetSingleScoreBySbjCodeAndOptCode("('" + answerRecordDic["TG_14963918652662"] + "')"));
                            fourthQuestionMark = Convert.ToInt32(MgrServices.GroupReportService.GetSingleScoreBySbjCodeAndOptCode("('" + answerRecordDic["TG_14963918652571"] + "')"));
                            score = fourthQuestionMark - thirdQuestionMark;
                        }
                        if (!string.IsNullOrEmpty(scoreStr))
                        {
                            dimensionScore.Add(dimension[j], Convert.ToDecimal(scoreStr));
                        }
                        else
                        {
                            dimensionScore.Add(dimension[j], score);
                        }
                    }
                    
                    
                    uds.DimensionAndScore = dimensionScore;
                    uds.UserID = Convert.ToInt32(userIDListArray[i]);
                    var userBirth = Convert.ToDateTime(MgrServices.UserAddService.GetEntitys(Convert.ToInt32(userIDListArray[i]))._u_birthday);
                    var reportCreateTime = MgrServices.DistributeRecordService.GetAnswerAddEntity(Convert.ToInt32(ansIDListArray[i]))._answer_createtime;
                    //瑞文年龄计算代码
                    //if (amountCode == "LB_14814373314360")
                    //{
                    //    uds.UserAge = Common.CalculateAgeCorrectRW(userBirth, reportCreateTime);
                    //}
                    uds.UserAge = Common.CalculateAgeCorrect(userBirth, reportCreateTime);
                    lus.Add(uds);
                }
            }
            return lus;
        }
        public void InitiAverageStateTable(HttpContext context)
        {
            
            var lus = GetUsersDimensionScore(context);//得到用户各维度分数(可能会含有四则运算的表达式)
            Dictionary<string, string> dimensionName = new Dictionary<string, string>();//维度Code和维度名称
            Dictionary<string, string> explainName = new Dictionary<string, string>();//维度Code和维度解释
            Dictionary<string, string> dimensionAverage = new Dictionary<string, string>();//维度分数平均分
            Dictionary<string, string> dimensionMaxNum = new Dictionary<string, string>();//维度分数最大值
            Dictionary<string, string> dimensionMinNum = new Dictionary<string, string>();//维度分数最小值
            Dictionary<string, string> dimensionStandardMinus = new Dictionary<string, string>();//维度分数标准差
            Calculate cal = new Calculate();
            //获取维度Code和维度名称----维度Code和维度介绍字典项
            for (int i = 0; i < 1; i++)
            {
                foreach (var item in lus[0].DimensionAndScore)
                {
                    dimensionName.Add(item.Key, MgrServices.GroupReportService.GetDimensionName(item.Key));

                }
            }

            //求平均值、最大值、最小值
            foreach (var item in lus[0].DimensionAndScore)
            {
                decimal average = 0;
                decimal maxNum = Convert.ToDecimal(item.Value);
                decimal minNum = Convert.ToDecimal(item.Value);
                decimal totalScore = Convert.ToDecimal(item.Value);
                for (int i = 1; i < lus.Count; i++)
                {
                    foreach (var itemK in lus[i].DimensionAndScore)
                    {
                        if (item.Key == itemK.Key)
                        {
                            totalScore += Convert.ToDecimal(itemK.Value);
                            if (maxNum < Convert.ToDecimal(itemK.Value))
                            {
                                maxNum = Convert.ToDecimal(itemK.Value);
                            }
                            if (minNum > Convert.ToDecimal(itemK.Value))
                            {
                                minNum = Convert.ToDecimal(itemK.Value);
                            }
                        }
                    }
                }

                average = Math.Round((decimal)totalScore / lus.Count, 2, MidpointRounding.AwayFromZero);
                dimensionAverage.Add(item.Key, average.ToString());
                dimensionMaxNum.Add(item.Key, maxNum.ToString());
                dimensionMinNum.Add(item.Key, minNum.ToString());
            }
            //求标准差
            foreach (var item in dimensionAverage)
            {
                decimal scoreCount = 0;
                decimal standardMinus = 0;
                for (int i = 0; i < lus.Count; i++)
                {
                    foreach (var itemK in lus[i].DimensionAndScore)
                    {
                        if (item.Key == itemK.Key)
                        {
                            scoreCount += (Convert.ToDecimal(item.Value) - Convert.ToDecimal(itemK.Value)) * (Convert.ToDecimal(item.Value) - Convert.ToDecimal(itemK.Value));
                        }
                    }
                }
                double result = Convert.ToDouble(scoreCount / lus.Count);
                standardMinus = Math.Round(Convert.ToDecimal(Math.Sqrt(result)), 2, MidpointRounding.AwayFromZero);
                dimensionStandardMinus.Add(item.Key, standardMinus.ToString());
            }
            var htmlContent = "";
            List<string> detailTable = new List<string>();
            foreach (var item in dimensionName)
            {
                detailTable.Add(item.Value);
                detailTable.Add(dimensionAverage[item.Key]);
                detailTable.Add(dimensionStandardMinus[item.Key]);
                detailTable.Add(dimensionMaxNum[item.Key]);
                detailTable.Add(dimensionMinNum[item.Key]);
                htmlContent += "<tr><td>" + item.Value + "</td><td>" + dimensionAverage[item.Key] + "</td><td>" + dimensionStandardMinus[item.Key] + "</td><td>" + dimensionMaxNum[item.Key] + "</td><td>" + dimensionMinNum[item.Key] + "</td></tr>";
            }
            context.Session["DetailTable"] = detailTable;
            //AverageState;Model am = new AverageStateModel()
            //{
            //    DimensionAverage = dimensionAverage,
            //    DimensionMaxNum = dimensionMaxNum,
            //    DimensionMinNum = dimensionMinNum,
            //    DimensionName = dimensionName,
            //    DimensionStandardMinus = dimensionStandardMinus,
            //    ExplainName = explainName,
            //    GrgodicCount =dimensionAverage.Count
            //};
            var signCount = 0;
            string strCate = "";
            foreach (var item in dimensionName)
            {
                signCount++;
                if (signCount == dimensionName.Count)
                {
                    strCate += item.Value;
                }
                else
                {
                    strCate += item.Value + ",";
                }

            }
            List<Decimal> ld = new List<decimal>();
            foreach (var item in dimensionAverage)
            {
                ld.Add(Convert.ToDecimal(item.Value));
            }
            AverageScoreChartModel asc = new AverageScoreChartModel();
            asc.name = strCate;
            asc.data = ld;
            context.Session["AverageScoreChartModel"] = asc;
            context.Response.Write(htmlContent);
        }

        public void LoadReportBasicInfo(HttpContext context)
        {
            
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var amountName = MgrServices.GroupReportService.GetReportTitle(grID);
            var reportCreateTime = MgrServices.GroupReportService.GetGroupReportCreateTime(grID);
            var listStr = MgrServices.GroupReportService.GetUserIDListAndAmountCode(grID);//根据GR_ID得到用户ID集合和量表Code
            context.Session["GRInfoList"] = listStr;
            var userIDListTemp = listStr[1];//用户ID集合字符串临时变量
            var dates = listStr[2];
            string[] dateArray = dates.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);//将用户ID集合字符串分割成用户ID数组
            var peopleCount = dateArray.Length;
            List<DateTime> ld = new List<DateTime>();
            for (int i = 0; i < dateArray.Length; i++)
            {
                if (!string.IsNullOrEmpty(dateArray[i]))
                {
                    ld.Add(Convert.ToDateTime(MgrServices.GroupReportService.GetAnswerCreateTimeByUID(Convert.ToInt32(dateArray[i]))));
                }
            }
            var maxTime = ld[0];
            var minTime = ld[0];
            for (int i = 0; i < ld.Count; i++)
            {
                if (maxTime < ld[i])
                {
                    maxTime = ld[i];
                }
                if (minTime > ld[i])
                {
                    minTime = ld[0];
                }
            }
            List<string> ls = new List<string>();
            ls.Add("测试量表：" + amountName);
            ls.Add("测评人数：" + peopleCount);
            ls.Add("生成时间：" + reportCreateTime);
            ls.Add("测评日期：" + minTime.ToString("d") + "-" + maxTime.ToString("d"));
            context.Session["BasicInfoTableData"] = ls;
            var htmlContent = "<tr><td>测试量表：" + amountName + "</td><td>测评人数：" + peopleCount + "</td></tr><tr><td>生成时间：" + Convert.ToDateTime(reportCreateTime).ToString("d") + "</td><td>测评日期：" + minTime.ToString("d") + "-" + maxTime.ToString("d") + "</td>";
            context.Response.Write(htmlContent);
        }
        public void GetRateData(HttpContext context)
        {
            
            var userScoreList = GetUsersDimensionScore(context);
            var mildCount = 0;
            var seriousCount = 0;
            var advanceCount = 0;
            var deteriorateCount = 0;
            var lowDrugValueCount = 0;
            var heightDrugValueCount = 0;
            decimal mildRate = 0;
            decimal seriousRate = 0;
            decimal advanceRate = 0;
            decimal deteriorateRate = 0;
            decimal lowDrugValueRate = 0;
            decimal heightDrugValueRate = 0;
            for (int i = 0; i < userScoreList.Count; i++)
            {
                foreach (var item in userScoreList[i].DimensionAndScore)
                {
                    if (item.Key == "WD_14963918781772")
                    {
                        if (item.Value >= 0 && item.Value <= 3)
                        {
                            mildCount++;
                        }
                        if(item.Value>3)
                        {
                            seriousCount++;
                        }
                    }
                    if (item.Key == "WD_14963918902035")
                    {
                        if (item.Value >= 0 && item.Value <= 3)
                        {
                            advanceCount++;
                        }
                        if (item.Value > 3)
                        {
                            deteriorateCount++;
                        }
                    }
                    if (item.Key == "WD_14963919010893")
                    {
                        if (item.Value <1)
                        {
                            lowDrugValueCount++;
                        }
                        if (item.Value >=1 )
                        {
                            heightDrugValueCount++;
                        }
                    }
                }
            }
            mildRate = Math.Round(Convert.ToDecimal((decimal)mildCount / userScoreList.Count), 4, MidpointRounding.AwayFromZero);
            seriousRate = Math.Round(Convert.ToDecimal((decimal)seriousCount / userScoreList.Count), 4, MidpointRounding.AwayFromZero);
            advanceRate = Math.Round(Convert.ToDecimal((decimal)advanceCount / userScoreList.Count), 4, MidpointRounding.AwayFromZero);
            deteriorateRate = Math.Round(Convert.ToDecimal((decimal)deteriorateCount / userScoreList.Count), 4, MidpointRounding.AwayFromZero);
            lowDrugValueRate = Math.Round(Convert.ToDecimal((decimal)lowDrugValueCount / userScoreList.Count), 4, MidpointRounding.AwayFromZero);
            heightDrugValueRate = Math.Round(Convert.ToDecimal((decimal)heightDrugValueCount / userScoreList.Count), 4, MidpointRounding.AwayFromZero);
            context.Response.Write(JsonConvert.SerializeObject(new { MildRate = mildRate, SeriousRate = seriousRate,AdvanceRate = advanceRate, DeteriorateRate = deteriorateRate, LowDrugValueRate = lowDrugValueRate, HeightDrugValueRate = heightDrugValueRate, MildCount = mildCount,SeriousCount = seriousCount,AdvanceCount = advanceCount,DeteriorateCount = deteriorateCount,LowDrugValueCount = lowDrugValueCount,HeightDrugValueCount = heightDrugValueCount}));

        }
        public void GetAverageChartData(HttpContext context)
        {
            
            var modelJson = context.Session["AverageScoreChartModel"] as AverageScoreChartModel;
            context.Response.Write(JsonConvert.SerializeObject(modelJson));

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}