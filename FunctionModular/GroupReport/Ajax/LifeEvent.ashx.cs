using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using CrisisInterfere.projrem;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// LifeEvent 的摘要说明
    /// </summary>
    public class LifeEvent : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
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
                case "LoadReportBasicInfo":
                    LoadReportBasicInfo(context);
                    break;
                case "InitiAverageStateTable":
                    InitiAverageStateTable(context);
                    break;
                case "GetScoreList":
                    GetScoreList(context);
                    break;
                case "GetAverageChartData":
                    GetAverageChartData(context);
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
            List<string> dimension = MgrServices.GroupReportService.GetDimensionByAmountCode(amountCode);//根据量表Code得到维度
            List<UserDimensionScoreModel<decimal>> lus = new List<UserDimensionScoreModel<decimal>>();//记录用户维度分数集合
            for (int i = 0; i < userIDListArray.Length; i++)
            {
                UserDimensionScoreModel<decimal> uds = new UserDimensionScoreModel<decimal>();
                if (!string.IsNullOrEmpty(userIDListArray[i]))
                {
                    var score = MgrServices.GroupReportService.GetScoreByAnswerID(Convert.ToInt32(Convert.ToInt32(ansIDListArray[i])));//根据用户ID，量表Code得到答题记录
                    Dictionary<string, decimal> dimensionScore = new Dictionary<string, decimal>();//记录录用户维度分数
                    dimensionScore.Add(dimension[0], score);
                    uds.DimensionAndScore = dimensionScore;
                    uds.UserID = Convert.ToInt32(userIDListArray[i]);
                    var userBirth = Convert.ToDateTime(MgrServices.UserAddService.GetEntitys(Convert.ToInt32(userIDListArray[i]))._u_birthday);
                    var reportCreateTime = MgrServices.DistributeRecordService.GetAnswerAddEntity(Convert.ToInt32(ansIDListArray[i]))._answer_createtime;
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
        public void GetScoreList(HttpContext context)
        {
            var lus = GetUsersDimensionScore(context);
            List<decimal> ld = new List<decimal>();
            for (int i = 0; i < lus.Count; i++)
            {
                foreach (var item in lus[i].DimensionAndScore)
                {
                    ld.Add(item.Value);
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(ld));
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