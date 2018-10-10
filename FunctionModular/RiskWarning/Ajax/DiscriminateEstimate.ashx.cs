using BR_Service;
using CrisisInterfere.DiscriminateEstimateService;
using CrisisInterfere.FunctionModular.RiskWarning.Model;
using CrisisInterfere.projrem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.RiskWarning.Ajax
{
    /// <summary>
    /// DiscriminateEstimate 的摘要说明
    /// </summary>
    public class DiscriminateEstimate : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            var operationType = Common.GetRequest("operationType");

            System.Reflection.MethodInfo methodInfo = this.GetType().GetMethod(operationType);
            if (methodInfo != null)
            {
                methodInfo.Invoke(this, new object[] { context });
            }
        }
        public void GetUser(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"]);
            var lc = MgrServices.DiscriminateEstimateService.GetUserSelected(userID);
            context.Response.Write(JsonConvert.SerializeObject(lc));
        }
        public void GetCounselor(HttpContext context)
        {
            var counselor = MgrServices.DiscriminateEstimateService.GetCounselor();
            context.Response.Write(JsonConvert.SerializeObject(counselor));
        }
        public void GetQuestionType(HttpContext context)
        {
            List<CommonViewModel> questionType = new List<CommonViewModel>();
          
            questionType = MgrServices.DiscriminateEstimateService.GetQuestionType();
            //CommonViewModel cm = new CommonViewModel();
            //cm.Text = "请选择问题类型";
            //cm.Value = "0";
            //questionType.Add(cm);
            //questionType.Reverse();
            //var aa = JsonConvert.SerializeObject(questionType);
            context.Response.Write(JsonConvert.SerializeObject(questionType));
        }
        public void InitialTable(HttpContext context)
        {
            DataSet SourceTemps = new DataSet();
            DataTable SourceTemp = new DataTable();
            var sourceDataTable = new DataTable();
            var exportDt = new DataTable();
            exportDt.Columns.Add("登录名", typeof(String));
            exportDt.Columns.Add("姓名", typeof(String));
            exportDt.Columns.Add("性别", typeof(String));
            exportDt.Columns.Add("出生日期", typeof(String));
            exportDt.Columns.Add("咨询师", typeof(String));
            exportDt.Columns.Add("预警级别", typeof(String));
            exportDt.Columns.Add("问题类型", typeof(String));
            exportDt.Columns.Add("处理建议", typeof(String));
            exportDt.Columns.Add("评估日期",typeof(String));
            var searchModel = JsonConvert.DeserializeObject<DiscriminateEstimateSearchModel>(Common.GetRequest("searchModel"));
            searchModel.UserID = Convert.ToInt32(context.Session["UserID"].ToString());
            SourceTemps = MgrServices.DiscriminateEstimateService.InitialDiscriminateEstimateTable(searchModel);
            searchModel.EndIndex = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
            sourceDataTable = MgrServices.DiscriminateEstimateService.InitialDiscriminateEstimateTable(searchModel).Tables[1];
            foreach (DataRow DTR in sourceDataTable.Rows)
            {
                var dr = exportDt.NewRow();
                dr["登录名"] = DTR["U_LoginName"].ToString();
                dr["姓名"] = DTR["U_Name"].ToString();
                dr["性别"] = DTR["U_Sex"].ToString();
                dr["出生日期"] = Convert.ToDateTime(DTR["U_Birthday"]).ToString("yyyy-MM-dd");
                dr["咨询师"] = DTR["CounselorName"].ToString();
                dr["预警级别"] = DTR["WLName"].ToString();
                dr["问题类型"] = DTR["QTName"].ToString();
                dr["处理建议"] = DTR["DSID"].ToString();
                dr["评估日期"] = Convert.ToDateTime(DTR["CreateTime"]).ToString("yyyy-MM-dd");
                exportDt.Rows.Add(dr);
            }
            context.Session["ExportExcel"] = exportDt;
            PageInfo page = new PageInfo();
            if (SourceTemps != null && SourceTemps.Tables.Count > 0)
            {
                page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                SourceTemp = SourceTemps.Tables[1];
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        String[] arr =
                            { 
                                DTR["DEID"].ToString(),
                                "",
                                DTR["PageIndex"].ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["U_Sex"].ToString(),
                                Common.CalculateAgeCorrect(Convert.ToDateTime(DTR["U_Birthday"]),DateTime.Now).ToString(),
                                DTR["CounselorName"].ToString(),
                                DTR["WLName"].ToString(),
                                DTR["QTName"].ToString(),
                                DTR["DSID"].ToString(),
                                DTR["CreateTime"].ToString(),
                                "",
                                DTR["D_name"].ToString(),
                                DTR["U_Tel"].ToString(),
                                DTR["U_Email"].ToString(),
                                DTR["DEContent"].ToString(),
                                DTR["U_ID"].ToString()
                            };
                        page.data.Add(arr);
                    }

                }
            }
            page.recordsFiltered = page.recordsTotal;
            String json = Common.ObjectToJson(page);
            context.Response.Write(json);
        }
        public void InitialPotentialRiskEstimateAndIdioctoniaEstimateResult(HttpContext context)
        {
            var userID = Convert.ToInt32(Common.GetRequest("userID"));
            var belongToCodeList = MgrServices.DiscriminateEstimateService.GetBelongToCode(userID);
            context.Session["BelongToCode"] = belongToCodeList;
            var discriminateEstimateReportModel = new DiscriminateEstimateReportModel();
            discriminateEstimateReportModel.PotentialRiskEstimateResultList =new List<List<Dictionary<string,int>>>();
            discriminateEstimateReportModel.IdioctoniaEstimateResultList =new List<List<Dictionary<string,int>>>();
            discriminateEstimateReportModel.PotentialRiskWarningState = new List<string>();
            discriminateEstimateReportModel.IdioctoniaWarningState = new List<string>();
            discriminateEstimateReportModel.PotentialRiskCreateTime = new List<string>();
            discriminateEstimateReportModel.IdioctoniaCreateTime = new List<string>();
            for (int i = 0; i < belongToCodeList.Count; i++)
            {
                var resultDictionaryList = new List<Dictionary<string, int>>();
                var idioctoniaRiskResultList = new List<Dictionary<string, int>>();
                var dt = MgrServices.PotentialRiskEstimateService.GetResultTableByBelongToCode(belongToCodeList[i]);
                if (dt.Rows.Count > 1)
                {
                    var potentialRiskAllScore = 0;
                    for (int j = 0; j < dt.Rows.Count; j++)
                    {
                        var score = 0;
                        var resultDictionary = new Dictionary<string, int>();

                        potentialRiskAllScore += Convert.ToInt32(dt.Rows[j]["AnswerAdd_score"].ToString());
                        if (dt.Rows[j]["Amount_Code"].ToString() == "LB_14810142054270")
                        {
                            score = Convert.ToInt32(dt.Rows[j]["AnswerAdd_score"]);
                            if (score <= 160)
                            {
                                resultDictionary.Add("状态良好", score);
                            }
                            if (score > 160 && score <= 208)
                            {
                                resultDictionary.Add("心理亚健康", score);
                            }
                            if (score > 208)
                            {
                                resultDictionary.Add("状态不佳", score);
                            }
                        }
                        if (dt.Rows[j]["Amount_Code"].ToString() == "LB_14811096480630")
                        {
                            score = Convert.ToInt32(dt.Rows[j]["AnswerAdd_score"]);
                            if (score <= 15)
                            {
                                resultDictionary.Add("自尊水平很低", score);
                            }
                            if (score > 15 && score <= 20)
                            {
                                resultDictionary.Add("自尊水平较低", score);
                            }
                            if (score > 20 && score <= 30)
                            {
                                resultDictionary.Add("自尊水平正常", score);
                            }
                            if (score > 30 && score <= 35)
                            {
                                resultDictionary.Add("自尊水平较高", score);
                            }
                            if (score > 35)
                            {
                                resultDictionary.Add("自尊水平很高", score);
                            }
                        }
                        if (dt.Rows[j]["Amount_Code"].ToString() == "LB_14810140679820")
                        {
                            score = Convert.ToInt32(dt.Rows[j]["AnswerAdd_score"]);
                            if (score < 30)
                            {
                                resultDictionary.Add("社会支持程度低", score);
                            }
                            if (score >= 30 && score <= 38)
                            {
                                resultDictionary.Add("社会支持程度适中", score);
                            }
                            if (score > 38)
                            {
                                resultDictionary.Add("社会支持程度高", score);
                            }
                        }
                        resultDictionaryList.Add(resultDictionary);
                        
                    }
                    discriminateEstimateReportModel.PotentialRiskEstimateResultList.Add(resultDictionaryList);
                    discriminateEstimateReportModel.PotentialRiskWarningState.Add(MgrServices.DiscriminateEstimateService.GetWarningStateByBelongToCode(belongToCodeList[i]));
                    discriminateEstimateReportModel.PotentialRiskCreateTime.Add(dt.Rows[0]["Answer_CreateTime"].ToString());
                    
                }
                if (dt.Rows[0]["Amount_Code"].ToString() == "LB_15131477237610")
                {

                    var dimension = MgrServices.GroupReportService.GetDimensionByAmountCode(dt.Rows[0]["Amount_Code"].ToString());//根据量表Code得到维度
                    var answerRecord = dt.Rows[0]["AnswerAdd_Record"].ToString();
                    var answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(answerRecord);//将用户答题记录json字符串反序列为字典项键值对
                    var idioctoniaRiskResult = new Dictionary<string, int>();//记录录用户维度分数
                    //先计算总评得分，为减少计算时间
                    
                    for (int j = 0; j < dimension.Count; j++)
                    {
                        var score = 0;//记录维度总分变量
                        var subjectCodes = MgrServices.GroupReportService.GetSubjectCodeByDimensionCode(dimension[j]);//根据维度获取题干Code
                        StringBuilder sb = new StringBuilder();
                        idioctoniaRiskResult = new Dictionary<string, int>();
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
                        if (dimension[j] == "WD_15131479937617")
                        {
                            if (score <= 50)
                            {
                                idioctoniaRiskResult.Add("可能性极小", score);
                            }
                            if (score >= 50 && score < 60)
                            {
                                idioctoniaRiskResult.Add("可能性较小", score);
                            }
                            if (score >= 60 && score < 70)
                            {
                                idioctoniaRiskResult.Add("可能性中等", score);
                            }
                            if (score >= 70 && score <= 80)
                            {
                                idioctoniaRiskResult.Add("可能性较大", score);
                            }
                            if (score >= 80)
                            {
                                idioctoniaRiskResult.Add("可能性极大", score);
                            }
                        }
                        if (dimension[j] == "WD_15131480158408")
                        {
                            if (score <= 30)
                            {
                                idioctoniaRiskResult.Add("程度较轻", score);
                            }
                            if (score > 30)
                            {
                                idioctoniaRiskResult.Add("程度较重", score);
                            }
                        }
                        if (dimension[j] == "WD_15131480457773")
                        {
                            if (score <= 15)
                            {
                                idioctoniaRiskResult.Add("程度较轻", score);
                            }
                            if (score > 15)
                            {
                                idioctoniaRiskResult.Add("程度较重", score);
                            }
                        }
                        if (dimension[j] == "WD_15131480649338")
                        {
                            if (score <= 30)
                            {
                                idioctoniaRiskResult.Add("程度较轻", score);
                            }
                            if (score > 30)
                            {
                                idioctoniaRiskResult.Add("程度较重", score);
                            }
                        }
                        if (dimension[j] == "WD_15131480907774")
                        {
                            if (score <= 14)
                            {
                                idioctoniaRiskResult.Add("程度较轻", score);
                            }
                            if (score > 14)
                            {
                                idioctoniaRiskResult.Add("程度较重", score);
                            }
                        }
                        idioctoniaRiskResultList.Add(idioctoniaRiskResult);
                    }
                    discriminateEstimateReportModel.IdioctoniaEstimateResultList.Add(idioctoniaRiskResultList);
                    discriminateEstimateReportModel.IdioctoniaWarningState.Add(MgrServices.DiscriminateEstimateService.GetWarningStateByBelongToCode(belongToCodeList[i]));
                    discriminateEstimateReportModel.IdioctoniaCreateTime.Add(dt.Rows[0]["Answer_CreateTime"].ToString());
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(discriminateEstimateReportModel));
        }
        public void AddDiscriminateEstimateReport(HttpContext context)
        {
            var discernEstimateReportModel = JsonConvert.DeserializeObject<DiscernEstimateReportModel>(Common.GetRequest("discernEstimateReportModel"));
            discernEstimateReportModel.CounselorID = Convert.ToInt32(context.Session["UserID"]);
            discernEstimateReportModel.BelongToCode = context.Session["BelongToCode"] as List<string>;
            if (string.IsNullOrEmpty(discernEstimateReportModel.DiscernEstimateReport))
            {
                discernEstimateReportModel.DiscernEstimateReport = "";
            }
            var resultModel = new ResultViewModel();
            if (MgrServices.DiscriminateEstimateService.AddDiscriminateEstimate(discernEstimateReportModel) > 0)
            {
                resultModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            resultModel.State = false;
            resultModel.Data = "添加鉴别评估报告失败，未知原因";
            context.Response.Write(JsonConvert.SerializeObject(resultModel));
        }
        public void GetPersonalInfo(HttpContext context)
        {
            var userID = Convert.ToInt32(Common.GetRequest("userID"));
            var tempUser = MgrServices.UserAddService.GetEntitys(userID);
            var reportModel = new ReportInfoModel()
            {
                Age = string.IsNullOrEmpty(tempUser._u_birthday)? "": Common.CalculateAgeCorrect(Convert.ToDateTime(tempUser._u_birthday), DateTime.Now).ToString(),
                CellPhone = tempUser._u_tel,
                Department = tempUser.departmentName,
                Email = tempUser._u_email,
                LoginName = tempUser._u_loginname,
                Sex = tempUser._u_sex,
                UserName = tempUser._u_name,
                WarningState = "",
                UserID = tempUser._u_id.ToString()
            };
            context.Response.Write(JsonConvert.SerializeObject(reportModel));
        }
        public void BulkExportExcel(HttpContext context)
        {
            //var commonMethod = new CommonMethod.Ajax.CommonMethod();
            var resultModel = new ResultViewModel();
            var dt = context.Session["ExportExcel"] as DataTable;
            if (dt.Rows.Count <= 0)
            {
                resultModel.State = false;
                resultModel.Data = "当前无数据，批量导出失败";
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            CommonMethod.Ajax.CommonMethod.ExportExcelByEPPlus(context, dt, "鉴别评估" + DateTime.Now.ToString("yyyy-MM-dd HHmmss"), "鉴别评估人员名单");
        }
        public void UpdateDiscriminateEstimate(HttpContext context)
        {
            var discernEstimateReportModel = JsonConvert.DeserializeObject<DiscernEstimateReportModel>(Common.GetRequest("discernEstimateReportModel"));
            var resultModel = new ResultViewModel();
            if (MgrServices.DiscriminateEstimateService.UpdateDiscriminateEstimate(discernEstimateReportModel) > 0) 
            {
                resultModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            resultModel.State = false;
            resultModel.Data = "更新失败，未知原因";
            context.Response.Write(JsonConvert.SerializeObject(resultModel));
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