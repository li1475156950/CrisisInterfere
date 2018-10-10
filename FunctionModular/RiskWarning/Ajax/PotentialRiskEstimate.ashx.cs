using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CrisisInterfere.PotentialRiskEstimateService;
using Newtonsoft.Json;
using CrisisInterfere.DistributeRecordService;
using CrisisInterfere.projrem;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.RiskWarning.Ajax
{
    /// <summary>
    /// PotentialRiskEsimate 的摘要说明
    /// </summary>
    public class PotentialRiskEstimate : IHttpHandler, IRequiresSessionState
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
        public void InitialTable(HttpContext context)
        {
            DataSet SourceTemps = new DataSet();
            DataTable SourceTemp = new DataTable();
            var sourceDataTable = new DataTable();
            var exportDt = new DataTable();
            exportDt.Columns.Add("登录名",typeof(String));
            exportDt.Columns.Add("姓名", typeof(String));
            exportDt.Columns.Add("性别", typeof(String));
            exportDt.Columns.Add("出生日期", typeof(String));
            exportDt.Columns.Add("部门", typeof(String));
            exportDt.Columns.Add("预警级别", typeof(String));
            exportDt.Columns.Add("测试日期", typeof(String));
            exportDt.Columns.Add("处理情况", typeof(String));
            var searchModel = JsonConvert.DeserializeObject<PotentialRiskEstimateSearchModel>(Common.GetRequest("searchModel"));
            searchModel.UserID = Convert.ToInt32(context.Session["UserID"].ToString());
            SourceTemps = MgrServices.PotentialRiskEstimateService.InitialPotentialRiskEstimateTable(searchModel);
            searchModel.EndIndex = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
            sourceDataTable = MgrServices.PotentialRiskEstimateService.InitialPotentialRiskEstimateTable(searchModel).Tables[1];
            foreach (DataRow DTR in sourceDataTable.Rows)
            {
                var dr = exportDt.NewRow();
                dr["登录名"] = DTR["U_LoginName"].ToString();
                dr["姓名"] = DTR["U_Name"].ToString();
                dr["性别"] = DTR["U_Sex"].ToString();
                dr["出生日期"] = Convert.ToDateTime(DTR["U_Birthday"]).ToString("yyyy-MM-dd");
                dr["部门"] = DTR["D_name"].ToString();
                dr["预警级别"] = DTR["WLName"].ToString();
                dr["测试日期"] = Convert.ToDateTime(DTR["Answer_CreateTime"]).ToString("yyyy-MM-dd");
                dr["处理情况"] = DTR["DisposalState"].ToString();
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
                                DTR["U_ID"].ToString(),
                                "",
                                DTR["PageIndex"].ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["U_Sex"].ToString(),
                                Common.CalculateAgeCorrect(Convert.ToDateTime(DTR["U_Birthday"]),DateTime.Now).ToString(),
                                DTR["D_name"].ToString(),
                                DTR["WLName"].ToString(),
                                DTR["Answer_CreateTime"].ToString(),
                                DTR["DisposalState"].ToString(),
                                "",
                                DTR["BelongToCode"].ToString(),
                                DTR["Amount_Code"].ToString(),
                                DTR["AmountType_Name"].ToString(),
                                DTR["U_Email"].ToString(),
                                DTR["U_Tel"].ToString(),
                                DTR["DistributionName"].ToString()
                            };
                        page.data.Add(arr);
                    }

                }
            }
            page.recordsFiltered = page.recordsTotal;
            String json = Common.ObjectToJson(page);
            context.Response.Write(json);
        }
        public void DistributeIdioctoniaAmount(HttpContext context)
        {
            string json = "";
            var resultViewModel = new ResultViewModel();
            var model = new DistributionSetEntity();
            var uIDArray = Common.GetRequest("uIDArray");
            var st = new State();
            long DID =0;
            if (uIDArray != null && uIDArray != "")
            {
                var sArray = JsonConvert.DeserializeObject<string[]>(uIDArray);
                bool result = false;
                for (int i = 0; i < sArray.Length; i++)
                {
                    var RandomValue = 0;
                    var starttime = DateTime.Now;
                    var endtime = DateTime.Now;
                    var notice = 1;
                    var TestType = "1";
                    var Retest = 0;
                    var LookR = 0;
                    var answerStartTime = DateTime.Now;
                    var answerEndTime = DateTime.Now.AddDays(14);
                    model._answerstarttime = answerStartTime;
                    model._answerendtime = answerEndTime;
                    RandomValue = 0;

                    if (notice == 1)//0是不发送，3是全是发送，1是站内信，2是邮件
                    {

                        Write(sArray[i], "", "您有一个新的测评", 3, Convert.ToInt32(context.Session["UserID"]));
                    }
                    //else if (notice == 2)
                    //{
                    //    RemindByEmail(uIDArray, "您有一个新测评");
                    //}
                    //else if (notice == 3)
                    //{
                    //    Write(uIDArray, "", "您有一个新测评", 3, Convert.ToInt32(context.Session["UserID"]));
                    //    RemindByEmail(uIDArray, "您有一个新测评");
                    //}

                    model._distributionname = TestType;
                    model._is_again = Retest;
                    model._u_id = Convert.ToInt32(context.Session["UserID"]);
                    model._is_notice = notice;
                    model._is_seereport = LookR;
                    model._is_notice = notice;
                     DID = MgrServices.DistributeRecordService.InsertDistributionSet(model);
                    model._is_present = RandomValue;
                    model._sendcontent = "";
                    result = true;
                }
                int IntDID = 0;
                IntDID = Convert.ToInt32(DID);
                //关系表添加
                string amode = "";
                st.Sucess = 0;
                amode = Common.GetRequest("AmountCode");
                //amode = amode.Substring(0, amode.Length - 1);
                string[] sArrays = amode.Split(',');
                List<string> ACode = sArrays.ToList();
                List<string> UserA = sArray.ToList();
                var list = MgrServices.DistributeRecordService.BulkInsert(ACode, UserA, IntDID, Convert.ToInt32(context.Session["UserID"]));
                st.Fail = list.Fail;
                st.Sucess = list.Sucess;
                resultViewModel.State = result;
                context.Response.Write(JsonConvert.SerializeObject(resultViewModel));
            }

            else
            {
                resultViewModel.State = false;
                resultViewModel.Data = "分配失败，未知原因";
                context.Response.Write(JsonConvert.SerializeObject(resultViewModel));
            }
        }
        public void RemindByEmail(string UDs, string NoticeName)
        {
            try
            {
                string[] receiveID = UDs.Split(',');
                string subject = "测评提醒";
                string content = NoticeName;
                for (int i = 0; i < receiveID.Length; i++)
                {
                    if (!string.IsNullOrEmpty(receiveID[i]))
                    {
                        string email = MgrServices.UserAddService.GetUserEmailByUserID(Convert.ToInt32(receiveID[i]));
                        EmailHelper.SendEmail(email, subject, content);
                    }

                }
            }
            catch
            { }

        }
        //站内信
        public bool Write(string Receveid, string Title, string Content, int Write, int UserID)
        {

            try
            {
                string JumpType = "0";
                return MgrServices.Letter.BulkInsert(Receveid, Title, Content, Write, UserID, "1", JumpType);
            }
            catch
            {
                return false;
            }
        }
        public void GetResultTable(HttpContext context)
        {
            var belongToCode = Common.GetRequest("belongToCode");
            var dt = new DataTable();

            dt = MgrServices.PotentialRiskEstimateService.GetResultTableByBelongToCode(belongToCode);
            context.Session["ResultTable"] = dt;
            var resultDictionary = new Dictionary<string, int>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var score = 0;
                if (dt.Rows[i]["Amount_Code"].ToString() == "LB_14810142054270")
                {
                    score = Convert.ToInt32(dt.Rows[i]["AnswerAdd_score"]);
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
                if (dt.Rows[i]["Amount_Code"].ToString() == "LB_14811096480630")
                {
                    score = Convert.ToInt32(dt.Rows[i]["AnswerAdd_score"]);
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
                if (dt.Rows[i]["Amount_Code"].ToString() == "LB_14810140679820")
                {
                    score = Convert.ToInt32(dt.Rows[i]["AnswerAdd_score"]);
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
            }
            context.Response.Write(JsonConvert.SerializeObject(resultDictionary));
        }
        public void GetDimensionExplain(HttpContext context)
        {
            var dt = context.Session["ResultTable"] as DataTable;
            var dimensionExplain = new Dictionary<string, string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var explain = "";
                var score = 0;
                if (dt.Rows[i]["Amount_Code"].ToString() == "LB_14810142054270")
                {
                    score = Convert.ToInt32(dt.Rows[i]["AnswerAdd_score"]);
                    if (score <= 160)
                    {
                        explain = "您在该量表上的总得分较低，表明您的心理健康状况良好。主要表现为：您很少因心理原因出现身体不适感；能积极面对社会和生活中的各种问题，信任他人，对人友善；一般没有过于焦虑、悲伤等情况。";
                    }
                    if (score > 160 && score <= 208)
                    {
                        explain = "您在该量表上的总得分处于中间状态，表明您的心理目前处于亚健康状态。可能表现为：可能会有一个或几个比较明显的症状表现，比如，可能出现因心理原因而引起的头晕、头痛、心慌、胸闷、胃部不适，而且这之前常出现痛苦体验或压抑等情绪。";
                    }
                    if (score > 208)
                    {
                        explain = "您在该量表上的总得分较高，表明您的心理健康状况不佳。可能表现为：您在生活中可能遇到一些比较严重的困难，并且深受其扰，常处于极端消极的心境当中。这种不良心境反过来又严重影响了您的工作效率、人际关系和生活质量。";
                    }
                    dimensionExplain.Add("症状自评", explain);
                }
                if (dt.Rows[i]["Amount_Code"].ToString() == "LB_14811096480630")
                {
                    score = Convert.ToInt32(dt.Rows[i]["AnswerAdd_score"]);
                    if (score <= 15)
                    {
                        explain = "您在该量表上的得分偏低，表示您的自尊水平可能很低，可能表现为：存在一定的自卑感，对自己缺乏信心，尤其是在陌生人和老师面前；认为自己没有价值，对自己不满意，难以接纳自己的缺点；有时甚至认为自己一无是处，不能把事情做好；觉得自己是一个失败者，对自我的总体评价和看法持消极态度。";
                    }
                    if (score > 15 && score <= 20)
                    {
                        explain = "您在该量表上的得分较低，表示您的自尊水平可能较低，可能表现为：常认为自己不如别人，不能很好地接纳自己，当受到朋友和家属批评时，自我感觉就趋于糟糕；而当得到积极的反馈时，又趋向于自我感觉极良好；大多数时候对自己持否定态度，认为自己身上的缺点多于优点；感觉他人不够尊重自己等。";
                    }
                    if (score > 20 && score <= 30)
                    {
                        explain = "您在该量表上的得分处于中间状态，表示您的自尊水平处于大多数人的平均水平，可能表现为：您对自己有一个比较客观的认识，能很好地接纳自己，有一定的自尊，虽然认为有些事情受到能力、努力以外的因素影响，但还是比较赞同一份耕耘一份收获。";
                    }
                    if (score > 30 && score <= 35)
                    {
                        explain = "您在该量表上的得分较高，表示您的自尊水平较高，可能表现为：对自己比较自信，自我感觉良好；在大多数场合下，您都对自我持肯定态度，总体比较满意，不会因为在陌生人或老师面前感到紧张，也不会因为没有经验就不敢尝试；认为自己是个有价值和有用的人；认同自己的较多优点；自信能像大多数人一样把事情做好等。";
                    }
                    if (score > 35)
                    {
                        explain = "您在该量表上的得分很高，表示您的自尊水平很高，可能表现为：在几乎所有场合下，都对自己充满了自信，认为自己是有价值的，对自己的价值持有肯定态度；并倾向于将成功较多归功于自身的能力和努力；多数情况下为自己感到自豪，对自己感到很满意；受到他人的尊重，觉得自己几乎没什么缺点等。";
                    }
                    dimensionExplain.Add("自尊", explain);
                }
                if (dt.Rows[i]["Amount_Code"].ToString() == "LB_14810140679820")
                {
                    score = Convert.ToInt32(dt.Rows[i]["AnswerAdd_score"]);
                    if (score <= 30)
                    {
                        explain = "您的得分较低，表明您所感受到的社会支持较弱，可能表现为：经常独处，跟家人、朋友很少接触，很少从亲戚朋友处得到帮助，几乎不参加任何团体活动，遇到烦恼和困难事时喜欢一个人独自承受，感觉不到来自家人或朋友等的支持，几乎不与他们交流。";
                    }
                    if (score >= 30 && score <= 38)
                    {
                        explain = "您的得分处于中间状态，表明您所感受到的社会支持水平一般。可能表现为：您独处的时候较多，跟家人、朋友的接触频率不是太高，不会广泛交友，遇到烦恼只跟关系比较亲密的亲友诉说，从亲戚朋友处得到的帮助不是太多，但必要时他们也会给你一定的支持、鼓励与帮助，您也会参加少数自己感兴趣的团体活动。";
                    }
                    if (score > 38)
                    {
                        explain = "您的得分较高，表明您所感受到的社会支持较强。主要表现为：您跟家人、朋友之间的接触很多，遇到烦恼和困难时有很多朋友可以倾诉，也可以从亲朋好友处得到很多帮助和鼓励，对于自己喜欢的各种团体活动，也会积极主动地去参加。";
                    }
                    dimensionExplain.Add("社会支持", explain);
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(dimensionExplain));
        }
        public void GetSuggestion(HttpContext context)
        {
            var belongToCode = Common.GetRequest("belongToCode");
            var suggestion = MgrServices.PotentialRiskEstimateService.GetSuggestionByBelongToCode(belongToCode);
            context.Response.Write(suggestion);
        }
        public void AddSuggestion(HttpContext context)
        {
            var suggestion = Common.GetRequest("suggestion");
            var belongToCode = Common.GetRequest("belongToCode");
            var result = new ResultViewModel();
            if (MgrServices.PotentialRiskEstimateService.AddSuggestion(suggestion, belongToCode) > 0)
            {
                result.State = true;
                context.Response.Write(JsonConvert.SerializeObject(result));
                return;
            }
            result.State = false;
            result.Data = "添加失败";
            context.Response.Write(JsonConvert.SerializeObject(result));
        }
        public void GetPotentialRiskEstimateReportInfoByBelongToCode(HttpContext context)
        {
            var belongToCode = Common.GetRequest("belongToCode");
            var result = MgrServices.PotentialRiskEstimateService.GetPotentialRiskEstimateReportInfoByBelongToCode(belongToCode);
            result.Age = Common.CalculateAgeCorrect(Convert.ToDateTime(result.Age), DateTime.Now).ToString();
            context.Response.Write(JsonConvert.SerializeObject(result));
        }
        public void BulkExportExcel(HttpContext context)
        {
            //var commonMethod = new CommonMethod.Ajax.CommonMethod();
            var resultModel = new ResultViewModel();
            var dt = context.Session["ExportExcel"] as DataTable;
            if(dt.Rows.Count<=0)
            {
                resultModel.State = false;
                resultModel.Data="当前无数据，批量导出失败";
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            CommonMethod.Ajax.CommonMethod.ExportExcelByEPPlus(context,dt, "潜在风险评估" + DateTime.Now.ToString("yyyy-MM-dd HHmmss"),"潜在风险评估人员名单");
            resultModel.State = true;
            resultModel.Data = "导出成功";
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

