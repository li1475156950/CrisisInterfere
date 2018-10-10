using BR_Service;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using CrisisInterfere.projrem;
namespace CrisisInterfere.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// DefenseWay 的摘要说明
    /// </summary>
    public class DefenseWay : IHttpHandler, IRequiresSessionState
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
                case "GetUsersDimensionScore":
                    GetUsersDimensionScore(context);
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
        public void GetUsersDimensionScore(HttpContext context)
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
            List<UserDimensionScoreModelInt> lus = new List<UserDimensionScoreModelInt>();//记录用户维度分数集合
            for (int i = 0; i < userIDListArray.Length; i++)
            {
                UserDimensionScoreModelInt uds = new UserDimensionScoreModelInt();
                if (!string.IsNullOrEmpty(userIDListArray[i]))
                {
                    var answerRecord = MgrServices.GroupReportService.GetAnswerAddRecord(Convert.ToInt32(userIDListArray[i]), Convert.ToInt32(ansIDListArray[i]), amountCode);//根据用户ID，量表Code得到答题记录
                    Dictionary<string, string> answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(answerRecord);//将用户答题记录json字符串反序列为字典项键值对
                    List<decimal> dimensionScore = new List<decimal>();//记录录用户维度分数
                    for (int j = 0; j < dimension.Count; j++)
                    {
                        decimal score = 0;//记录维度总分变量
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
                                sb.Append("'");
                                sb.Append(item.Value);
                                sb.Append("'");
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
                        if (dimension[j] == "WD_14812023305178")
                        {
                            score = score / (decimal)10;
                        }
                        if (!string.IsNullOrEmpty(scoreStr))
                        {
                            dimensionScore.Add(Convert.ToDecimal(scoreStr));
                        }
                        else
                        {
                            dimensionScore.Add(score);
                        }

                    }
                    uds.ScoreList = dimensionScore;
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
            context.Response.Write(JsonConvert.SerializeObject(lus));
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
        //获取比率表横坐标项目名



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}