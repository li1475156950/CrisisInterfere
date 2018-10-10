using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrisisInterfere.projrem;
using System.Web.SessionState;
using System.Text;
using System.Data;
namespace CrisisInterfere.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// AutisticDisorder 的摘要说明
    /// </summary>
    public class AutisticDisorder : IHttpHandler, IRequiresSessionState
    {
        List<UserDimensionScoreModel<string>> lus = new List<UserDimensionScoreModel<string>>();
        string amountCode;
        string enterpriseCode;

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;

            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case "GetReportTitle":
                    GetReportTitle(context);
                    break;
                case "GetAmountIntroduce":
                    GetAmountIntroduce(context);
                    break;
                case "InitiAverageStateTable":
                    InitiAverageStateTable(context);
                    break;
                case "GetAverageChartData":
                    GetAverageChartData(context);
                    break;
                case "LoadReportBasicInfo":
                    LoadReportBasicInfo(context);
                    break;
                case "GetCategory":
                    GetCategory(context);
                    break;
                case "GetScoreList":
                    GetScoreList(context);
                    break;
                default:
                    break;
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
        public void InitiAverageStateTable(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            lus = context.Session["UserDimensionScore_Autistic"] as List<UserDimensionScoreModel<string>>;
            if (lus == null)
            {
                lus = GetUsersDimensionScore(grID);//得到用户各维度分数(可能会含有四则运算的表达式)
                context.Session["UserDimensionScore_Autistic"] = lus;
            }
            List<UserDimensionScoreModel<string>> tranUsersDimensionScore = new List<UserDimensionScoreModel<string>>();//声明使用四则运算的算法转化后的用户维度分数
            Dictionary<string, string> dimensionName = new Dictionary<string, string>();//维度Code和维度名称
            Dictionary<string, string> explainName = null;//维度Code和维度解释
            Dictionary<string, string> dimensionAverage = new Dictionary<string, string>();//维度分数平均分
            Dictionary<string, string> dimensionMaxNum = new Dictionary<string, string>();//维度分数最大值
            Dictionary<string, string> dimensionMinNum = new Dictionary<string, string>();//维度分数最小值
            Dictionary<string, string> dimensionStandardMinus = new Dictionary<string, string>();//维度分数标准差
            Calculate cal = new Calculate();

            StringBuilder sb = new StringBuilder();//拼接维度Code字符串
            sb.Append("(");
            //获取维度Code和维度名称----维度Code和维度介绍字典项
            foreach (var item in lus[0].DimensionAndScore)
            {
                dimensionName.Add(item.Key, lus[0].DimensionName[item.Key]);
                sb.Append("'");
                sb.Append(item);
                sb.Append("'");
                sb.Append(",");

            }
            sb.Remove(sb.Length - 1, 1);
            sb.Append(")");

            explainName = MgrServices.GroupReportService.GetNormExplainByDimensionCodeList(sb.ToString());

            //将用户维度分数使用四则运算进行转化
            for (int i = 0; i < lus.Count; i++)
            {
                UserDimensionScoreModel<string> tranDimensionScoreModel = new UserDimensionScoreModel<string>();
                Dictionary<string, string> tranDimensionScore = new Dictionary<string, string>();
                foreach (var item in lus[i].DimensionAndScore)
                {
                    decimal result;
                    Queue<string> qs = cal.SplitExpress(item.Value);

                    List<string> ls = cal.InorderToPostorder(qs);
                    cal.IsResult(ls, out result);
                    //瑞文量表代码
                    //if (amountCode == "LB_14814373314360")
                    //{
                    //    var tempTable = MgrServices.StatisticalService.GetAnalyBaseTemp("TSLBRW");
                    //    var referString = tempTable.Rows[0]["AnalyBaseMark"].ToString();
                    //    var referTable = JsonConvert.DeserializeObject<List<RWModel>>(referString);
                    //    for (int j = 0; j < referTable.Count; j++)
                    //    {
                    //        if(lus[i].UserAge>=17)
                    //        {
                    //            var tempReferList = referTable.Where(m=>m.ZZB==lus[i].UserAge).ToList();
                    //            for (int k = 0; k < tempReferList.Count; k++)
                    //            {


                    //            }
                    //        }
                    //    }
                    //}
                    if (amountCode == "LB_14809953564280" || amountCode == "LB_14809270976120" || amountCode == "LB_14810979035220")
                    {
                        tranDimensionScore.Add(item.Key, Math.Floor(result).ToString());
                    }
                    else
                    {
                        tranDimensionScore.Add(item.Key, Math.Round(result, 2).ToString());
                    }

                }
                tranDimensionScoreModel.DimensionAndScore = tranDimensionScore;
                tranDimensionScoreModel.UserID = lus[i].UserID;
                tranUsersDimensionScore.Add(tranDimensionScoreModel);
            }
            //求平均值、最大值、最小值
            foreach (var item in tranUsersDimensionScore[0].DimensionAndScore)
            {
                decimal average = 0;
                decimal maxNum = Convert.ToDecimal(item.Value);
                decimal minNum = Convert.ToDecimal(item.Value);
                decimal totalScore = Convert.ToDecimal(item.Value);
                for (int i = 1; i < tranUsersDimensionScore.Count; i++)
                {
                    foreach (var itemK in tranUsersDimensionScore[i].DimensionAndScore)
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

                average = Math.Round((decimal)totalScore / tranUsersDimensionScore.Count, 2, MidpointRounding.AwayFromZero);
                dimensionAverage.Add(item.Key, average.ToString());
                dimensionMaxNum.Add(item.Key, maxNum.ToString());
                dimensionMinNum.Add(item.Key, minNum.ToString());
            }
            //求标准差
            foreach (var item in dimensionAverage)
            {
                decimal scoreCount = 0;
                decimal standardMinus = 0;
                for (int i = 0; i < tranUsersDimensionScore.Count; i++)
                {
                    foreach (var itemK in tranUsersDimensionScore[i].DimensionAndScore)
                    {
                        if (item.Key == itemK.Key)
                        {
                            scoreCount += (Convert.ToDecimal(item.Value) - Convert.ToDecimal(itemK.Value)) * (Convert.ToDecimal(item.Value) - Convert.ToDecimal(itemK.Value));
                        }
                    }
                }
                double result = Convert.ToDouble(scoreCount / tranUsersDimensionScore.Count);
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
            context.Session["DimensionName"] = dimensionName;
            context.Session["AverageScoreChartModel"] = asc;
            context.Response.Write(htmlContent);
        }
        public List<UserDimensionScoreModel<string>> GetUsersDimensionScore(int grID)
        {
            var listStr = MgrServices.GroupReportService.GetUserIDListAndAmountCode(grID);//根据GR_ID得到用户ID集合和量表Code
            #region 声明变量

            string userIDListTemp;//用户ID集合，字符串
            string ansIDListTemp;//作答记录ID集合，字符串
            Dictionary<string, DataRow> answerRecordListDic = null;//实际作答记录字典， key:用户ID，value：数据行（作答记录ID,实际作答Json，创建时间，用户ID，用户年龄）
            Dictionary<string, string> dimension;//维度集合
            Dictionary<string, List<string>> dimension_subjectCodesDic = new Dictionary<string, List<string>>();//维度_题干集合字典
            Dictionary<string, string> formulaStrDic;//公式字典：key：维度，value：公式字符串
            Dictionary<string, int> scoreDic;//分数字典： key：题支，value：题支分数

            #endregion
            #region 第一步实现

            userIDListTemp = listStr[1];//用户ID集合字符串临时变量
            ansIDListTemp = listStr[2];//作答记录ID集合字符串临时变量
            if (userIDListTemp[userIDListTemp.Length - 1] == ',')
                userIDListTemp = userIDListTemp.Remove(userIDListTemp.Length - 1);
            if (ansIDListTemp[ansIDListTemp.Length - 1] == ',')
                ansIDListTemp = ansIDListTemp.Remove(ansIDListTemp.Length - 1);

            amountCode = listStr[0];//量表Code
            string[] userIDListArray = userIDListTemp.Split(',');//将用户ID集合字符串分割成用户ID数组
            string[] ansIDListArray = ansIDListTemp.Split(',');//作答记录ID数组，与用户一一对应        
            #endregion

            var maxScoreOptionArray = new string[] { "TZ_148111893927314", "TZ_148111893927824", "TZ_148111893928134", "TZ_148111893928444", "TZ_148111893928854", "TZ_148111893929164", "TZ_148111893929474", "TZ_148111893929884", "TZ_148111893930094", "TZ_1481118939303104", "TZ_1481118939307114", "TZ_1481118939311124", "TZ_1481118939314134", "TZ_1481118939317144", "TZ_1481118939320154" };
            #region 第二步实现
            System.Data.DataTable answerRecordTable = MgrServices.GroupReportService.GetAnswerAddRecordByAnsIDList(enterpriseCode, "(" + ansIDListTemp + ")");


            answerRecordListDic = answerRecordTable.AsEnumerable().Select(x => new { AnswerID = x["AnswerAdd_ID"].ToString(), DataRow = x })
               .ToDictionary(k => k.AnswerID, v => v.DataRow);//获取实际作答记录字典， key:用户ID，value：数据行（作答记录ID,实际作答Json，创建时间，用户ID，用户年龄）
            #endregion
            #region 第三步实现

            dimension = MgrServices.GroupReportService.GetDimensionByAmountCode_Name(amountCode).Where(m => m.Key != "WD_14810164599358").ToDictionary(x => x.Key, v => v.Value);//根据量表Code得到维度

            StringBuilder dimensionList = new StringBuilder();
            #region 组装维度List字符串
            dimensionList.Append("(");
            foreach (var item in dimension.Keys)
            {
                dimensionList.Append("'");
                dimensionList.Append(item);
                dimensionList.Append("'");
                dimensionList.Append(",");
            }
            dimensionList.Remove(dimensionList.Length - 1, 1);
            dimensionList.Append(")");

            #endregion

            System.Data.DataTable temp = MgrServices.GroupReportService.GetSubjectCodeByDimensionCodeList(dimensionList.ToString());//根据维度List获取题干Code集合

            foreach (var item in dimension.Keys)
            {
                dimension_subjectCodesDic[item] = temp.AsEnumerable().Where(x => x["DimensionCode"].ToString() == item).Select(x => x["SubjectCode"].ToString()).ToList();
            }

            System.Data.DataTable formulaStrTable = MgrServices.GroupReportService.GetFormulaStrByDimensionCodeList(dimensionList.ToString());

            formulaStrDic = formulaStrTable.AsEnumerable().Select(x => new { DimensionCode = x["DimensionCode"].ToString(), FormulaStr = x["FormulaStr"].ToString() })
               .ToDictionary(k => k.DimensionCode, v => v.FormulaStr);//获取该量表下所有有公式的维度，key：维度code ；value：公式字符串

            System.Data.DataTable scoreTable = MgrServices.GroupReportService.GetScoreTableByAmount_Code(amountCode);

            scoreDic = scoreTable.AsEnumerable().Select(x => new { OperationCode = x["OperationCode"].ToString(), OperationFraction = x["OperationFraction"].ToString() })
               .ToDictionary(k => k.OperationCode, v => int.Parse(v.OperationFraction));//获取该量表下所有题支的分数，key：题支code ；value：题支分数
            #endregion

            List<UserDimensionScoreModel<string>> lus = new List<UserDimensionScoreModel<string>>();//记录用户维度分数集合
            for (int i = 0; i < userIDListArray.Length; i++)
            {
                UserDimensionScoreModel<string> uds = new UserDimensionScoreModel<string>();
                var tempCount = 0;
                if (!string.IsNullOrEmpty(userIDListArray[i]))
                {
                    Dictionary<string, string> answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(answerRecordListDic[ansIDListArray[i]]["AnswerAdd_Record"].ToString());//将用户答题记录json字符串反序列为字典项键值对
                    Dictionary<string, string> dimensionScore = new Dictionary<string, string>();//记录录用户维度分数
                    Dictionary<string, string> dimensionName = new Dictionary<string, string>();//记录维度名称
                    foreach (var dimensionKey in dimension.Keys)
                    {
                        var score = 0;//记录维度总分变量
                        var scoreStr = "";//记录启用公式的维度公式算法变量
                        var subjectCodes = dimension_subjectCodesDic[dimensionKey];//根据维度获取题干Code

                        StringBuilder sb = new StringBuilder();
                        sb.Append("(");
                        foreach (var item in answerRecordDic)
                        {
                            //判断出当前所有题干属于当前维度Code的题干

                            if (subjectCodes.Contains(item.Key))
                            {
                                score += scoreDic[item.Value];
                            }
                            if (maxScoreOptionArray.Contains(item.Value))
                            {
                                tempCount++;
                            }

                        }

                        uds.MaxScoreOptionCount = tempCount;
                        //判断是否启用公式计算
                        if (formulaStrDic.Keys.Contains(dimensionKey))
                        {
                            scoreStr = formulaStrDic[dimensionKey].Replace("Score", score.ToString());//将公式中的Score替换成总分
                        }
                        if (!string.IsNullOrEmpty(scoreStr))
                        {
                            dimensionScore.Add(dimensionKey, scoreStr);
                        }
                        else
                        {
                            dimensionScore.Add(dimensionKey, score.ToString());
                        }
                        dimensionName.Add(dimensionKey, dimension[dimensionKey]);

                    }
                    if (amountCode == "LB_14811056565390")
                    {
                        var tempScore = Convert.ToDecimal(dimensionScore["WD_14811065403903"]) - Convert.ToDecimal(dimensionScore["WD_14811065528432"]) + Convert.ToDecimal(dimensionScore["WD_14811067041457"]) - Convert.ToDecimal(dimensionScore["WD_14811067223797"]);
                        dimensionScore["WD_14878397969252"] = tempScore.ToString();
                    }
                    if (amountCode == "LB_14808297050440")
                    {
                        var tempScore = 15 + 2 * Convert.ToDecimal(dimensionScore["WD_14808306722554"]) + 3 * Convert.ToDecimal(dimensionScore["WD_14808307493593"]) - Convert.ToDecimal(dimensionScore["WD_14808307873796"]) + 5 * Convert.ToDecimal(dimensionScore["WD_14808308367415"]) - Convert.ToDecimal(dimensionScore["WD_14808308810653"]);
                        dimensionScore["WD_14808306500643"] = tempScore.ToString();
                    }
                    uds.DimensionAndScore = dimensionScore;
                    uds.DimensionName = dimensionName;
                    uds.UserID = Convert.ToInt32(userIDListArray[i]);

                    var userBirth = Convert.ToDateTime(answerRecordListDic[ansIDListArray[i]]["U_Birthday"].ToString());
                    var reportCreateTime = Convert.ToDateTime(answerRecordListDic[ansIDListArray[i]]["Answer_CreateTime"].ToString());
                    //瑞文年龄计算代码
                    //if (amountCode == "LB_14814373314360")
                    //{
                    //    uds.UserAge = Common.CalculateAgeCorrectRW(userBirth, reportCreateTime);
                    //}
                    uds.UserAge = Common.CalculateAgeCorrect(userBirth, reportCreateTime);
                    uds.UserSex = answerRecordListDic[ansIDListArray[i]]["U_Sex"].ToString();
                    lus.Add(uds);
                }
            }
            return lus;
        }
        public void GetAverageChartData(HttpContext context)
        {
            var modelJson = context.Session["AverageScoreChartModel"] as AverageScoreChartModel;
            context.Response.Write(JsonConvert.SerializeObject(modelJson));

        }
        public void LoadReportBasicInfo(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            var amountName = MgrServices.GroupReportService.GetReportTitle(grID);
            var reportCreateTime = MgrServices.GroupReportService.GetGroupReportCreateTime(grID);
            var listStr = MgrServices.GroupReportService.GetUserIDListAndAmountCode(grID);//根据GR_ID得到用户ID集合和量表Code
           
            var userIDListTemp = listStr[1];//用户ID集合字符串临时变量
            var dates = listStr[2];
            string[] dateArray = dates.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);//将用户ID集合字符串分割成用户ID数组
            var peopleCount = dateArray.Length;
            List<DateTime> ld = new List<DateTime>();
            if (dates[dates.Length - 1] == ',')
                dates = dates.Remove(dates.Length - 1);

            var maxMinTime = MgrServices.GroupReportService.GetAnswerCreateTimeByUIDList("(" + dates + ")");

            var maxTime = Convert.ToDateTime(maxMinTime[0]);
            var minTime = Convert.ToDateTime(maxMinTime[1]);

            var htmlContent = "<tr><td>测试量表：" + amountName + "</td><td>测评人数：" + peopleCount + "</td></tr><tr><td>生成时间：" + Convert.ToDateTime(reportCreateTime).ToString("d") + "</td><td>测评日期：" + minTime.ToString("d") + "-" + maxTime.ToString("d") + "</td>";
            context.Response.Write(htmlContent);
        }
        //获取比率表横坐标项目名
        public void GetCategory(HttpContext context)
        {
            context.Response.Write(JsonConvert.SerializeObject(context.Session["DimensionName"]));
        }



        public void GetScoreList(HttpContext context)
        {
            var grID = Convert.ToInt32(Common.GetRequest("grID"));
            lus = context.Session["UserDimensionScore_Autistic"] as List<UserDimensionScoreModel<string>>;
            if (lus == null)
            {
                lus = GetUsersDimensionScore(grID);//得到用户各维度分数(可能会含有四则运算的表达式)
                context.Session["UserDimensionScore_Autistic"] = lus;
            }
            List<decimal> scoreList = new List<decimal>();
            List<int> maxScoreOptionCount = new List<int>();
            for (int i = 0; i < lus.Count; i++)
            {
                foreach (var item in lus[i].DimensionAndScore)
                {
                    scoreList.Add(Convert.ToDecimal(item.Value));
                }
                maxScoreOptionCount.Add(lus[i].MaxScoreOptionCount);
            }
            context.Response.Write(JsonConvert.SerializeObject(new { ScoreList = scoreList, MaxScoreOptionCount = maxScoreOptionCount }));
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