using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Web.Script.Serialization;
using CrisisInterfere.DistributeRecordService;
using System.Text;
using CrisisInterfere.projrem;
using System.Collections;
using CrisisInterfere.PersonalReportService;
using MyExection;
using CrisisInterfere.FunctionModular.HeartEvaluation.Model;
using CrisisInterfere.MemberArchivesService;

namespace CrisisInterfere.FunctionModular.HeartEvaluation.Ajax
{
    /// <summary>
    /// MyTest 的摘要说明
    /// </summary>
    public class MyTest : IHttpHandler, IRequiresSessionState
    {
        public System.Collections.Concurrent.ConcurrentDictionary<String, String> Con_SelectOptionList = new System.Collections.Concurrent.ConcurrentDictionary<String, String>();//存储选择项记录集合

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Type = Common.GetRequest("type");
            string _code = Common.GetRequest("code");
            string UserPepole = "";
            int UserID = 0;
            UserPepole = Common.GetSessionValue("loginName", context);
            if (UserPepole == null)
                return;
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            UserID = Convert.ToInt32(_uID);
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            switch (Type)
            {
                case "Load"://我的测验列表               
                    int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                    string GaugeName = Common.GetRequest("GaugeName");
                    InitGaugePages(UserID, StarPageIndex, EndPageIndex, GaugeName, EnterpriseCode, context);
                    break;
                case "Guidelanguage"://指导语
                    string ACode = Common.GetRequest("ACode");
                    context.Response.Write(GetAEntity(ACode));
                    break;
                case "Save":

                    Dictionary<string, string> dicSave = new Dictionary<string, string>();

                    if (Common.GetRequest("Code") == "LB_14943307579630")//判断潜在风险评估量表
                    {
                        var belongToCode = Guid.NewGuid();
                        context.Session["BelongToCode"] = belongToCode.ToString();
                        var answerRecord = JsonConvert.DeserializeObject<List<AnswerRecordModel>>(Common.GetRequest("answerRecord"));
                        List<PotentialRisk> lpList = new List<PotentialRisk>();
                        dicSave = JsonConvert.DeserializeObject<Dictionary<string, string>>(Common.GetRequest("RidoJson"));
                        //症状自评量表
                        var symptomsDt = MgrServices.AnswerAddService.GetSubEntityTemp("LB_14810142054270", 0);
                        var symptomsDic = new Dictionary<string, string>();

                        //自尊量表
                        var proudDt = MgrServices.AnswerAddService.GetSubEntityTemp("LB_14811096480630", 0);
                        var proudDic = new Dictionary<string, string>();
                        //社会支持评定量表
                        var ssrsDt = MgrServices.AnswerAddService.GetSubEntityTemp("LB_14810140679820", 0);
                        var ssrsDic = new Dictionary<string, string>();
                        var amountScore = 0;
                        for (int i = 0; i < symptomsDt.Rows.Count; i++)
                        {
                            foreach (var item in dicSave)
                            {
                                if (item.Key == symptomsDt.Rows[i]["SubjectCode"].ToString())
                                {
                                    symptomsDic.Add(item.Key, item.Value);
                                    amountScore += answerRecord.FirstOrDefault(m => m.QuestionName == item.Key).score;
                                    break;
                                }
                            }
                        }
                        var symptomsPr = new PotentialRisk()
                        {
                            AmountCode = "LB_14810142054270",
                            AnswerRecord = symptomsDic,
                            TotalScore = amountScore
                        };
                        lpList.Add(symptomsPr);
                        amountScore = 0;
                        for (int i = 0; i < proudDt.Rows.Count; i++)
                        {
                            foreach (var item in dicSave)
                            {
                                if (item.Key == proudDt.Rows[i]["SubjectCode"].ToString())
                                {
                                    proudDic.Add(item.Key, item.Value);
                                    amountScore += answerRecord.FirstOrDefault(m => m.QuestionName == item.Key).score;
                                    break;
                                }
                            }
                        }
                        var proudPr = new PotentialRisk()
                        {
                            AmountCode = "LB_14811096480630",
                            AnswerRecord = proudDic,
                            TotalScore = amountScore
                        };
                        lpList.Add(proudPr);
                        amountScore = 0;
                        for (int i = 0; i < ssrsDt.Rows.Count; i++)
                        {
                            foreach (var item in dicSave)
                            {
                                if (item.Key == ssrsDt.Rows[i]["SubjectCode"].ToString())
                                {
                                    ssrsDic.Add(item.Key, item.Value);
                                    amountScore += answerRecord.FirstOrDefault(m => m.QuestionName == item.Key).score;
                                    break;
                                }
                            }
                        }
                        var ssrsPr = new PotentialRisk()
                        {
                            AmountCode = "LB_14810140679820",
                            AnswerRecord = ssrsDic,
                            TotalScore = amountScore
                        };
                        lpList.Add(ssrsPr);
                        context.Session["PotentialRiskList"] = lpList;
                        for (int i = 0; i < lpList.Count; i++)
                        {
                            AnswerAddEntity model = new AnswerAddEntity();
                            model._answeradd_record = JsonConvert.SerializeObject(lpList[i].AnswerRecord);//数据保存记录
                            model._amount_code = lpList[i].AmountCode;//量表编码 
                            model._answerpeople = UserPepole;
                            model._u_id = UserID;
                            model._distriid = Common.GetRequest("DID");//分配量表的id
                            model._answer_state = Convert.ToInt32(Common.GetRequest("state"));
                            model._answerisdelete = 0;
                            model._belongToAmount = "LB_14943307579630";
                            model._answeradd_score = lpList[i].TotalScore;
                            model._answer_createtime = DateTime.Now;
                            model._belongToCode = belongToCode.ToString();
                            if (Common.GetRequest("startime") != null && Common.GetRequest("startime") != "")
                            {
                                var aaa = Common.GetRequest("startime");
                                model._answer_starttimer = DateTime.Parse(Common.GetRequest("startime"));
                            }
                            string ANameA = Common.GetRequest("AName");
                            Insert(model, ANameA, context);
                        }
                    }
                    else if (Common.GetRequest("Code") == "LB_15131477237610")//判断潜在风险评估量表
                    {
                        var belongToCode = Guid.NewGuid();
                        context.Session["BelongToCode"] = belongToCode.ToString();
                        AnswerAddEntity model = new AnswerAddEntity();
                        model._answeradd_record = Common.GetRequest("RidoJson");//数据保存记录
                        model._amount_code = Common.GetRequest("Code");//量表编码 
                        model._answerpeople = UserPepole;
                        model._u_id = UserID;
                        model._distriid = Common.GetRequest("DID");//分配量表的id
                        model._answer_state = Convert.ToInt32(Common.GetRequest("state"));
                        model._answerisdelete = 0;
                        model._belongToCode = belongToCode.ToString();
                        if (Common.GetRequest("score") != null && Common.GetRequest("score") != "" && Common.GetRequest("score") != "unified")
                        {
                            model._answeradd_score = Convert.ToInt32(Common.GetRequest("score"));
                            context.Session["IdioctoniaEstimateScore"] = model._answeradd_score;
                        }
                        else
                        {
                            model._answeradd_score = 0;
                        }
                        model._answer_createtime = DateTime.Now;
                        if (Common.GetRequest("startime") != null && Common.GetRequest("startime") != "")
                        {
                            var aaa = Common.GetRequest("startime");
                            model._answer_starttimer = DateTime.Parse(Common.GetRequest("startime"));
                        }
                        string ANameA = Common.GetRequest("AName");
                        Insert(model, ANameA, context);
                    }
                    else
                    {
                        AnswerAddEntity model = new AnswerAddEntity();
                        model._answeradd_record = Common.GetRequest("RidoJson");//数据保存记录
                        model._amount_code = Common.GetRequest("Code");//量表编码 
                        model._answerpeople = UserPepole;
                        model._u_id = UserID;
                        model._distriid = Common.GetRequest("DID");//分配量表的id
                        model._answer_state = Convert.ToInt32(Common.GetRequest("state"));
                        model._answerisdelete = 0;
                        if (Common.GetRequest("score") != null && Common.GetRequest("score") != "" && Common.GetRequest("score") != "unified")
                        {
                            model._answeradd_score = Convert.ToInt32(Common.GetRequest("score"));
                        }
                        else
                        {
                            model._answeradd_score = 0;
                        }
                        model._answer_createtime = DateTime.Now;
                        if (Common.GetRequest("startime") != null && Common.GetRequest("startime") != "")
                        {
                            var aaa = Common.GetRequest("startime");
                            model._answer_starttimer = DateTime.Parse(Common.GetRequest("startime"));
                        }
                        string ANameA = Common.GetRequest("AName");
                        Insert(model, ANameA, context);
                    }
                    break;
                case "GetProblem"://加载题干
                    int T_NumberS = Convert.ToInt32(Common.GetRequest("TNum"));
                    int DID = Convert.ToInt32(Common.GetRequest("DID"));
                    int ARadom = 0;
                    if (Common.GetRequest("ARadom") != null && Common.GetRequest("ARadom") != "")
                    {
                        ARadom = Convert.ToInt32(Common.GetRequest("ARadom"));
                    }

                    InitStemS(_code, T_NumberS, ARadom, DID, context);
                    break;
                case "ContinueAnswer"://继续作答
                    int AnswerID = Convert.ToInt32(Common.GetRequest("AnswerID"));
                    context.Response.Write(GetAnswerAddEntity(AnswerID));
                    break;
                case "UpdateAnswer"://更新我的作答  //这块是继续作答需要更改的代码，危机干预不存在继续作答，所以此处不做修改
                    Dictionary<string, string> dicUpdate = new Dictionary<string, string>();
                    if (Common.GetRequest("Code") == "LB_14943307579630")
                    {
                        List<PotentialRisk> lpList = new List<PotentialRisk>();
                        dicUpdate = JsonConvert.DeserializeObject<Dictionary<string, string>>(Common.GetRequest("RidoJson"));
                        //症状自评量表
                        var symptomsDt = MgrServices.AnswerAddService.GetSubEntityTemp("LB_14810142054270", 0);
                        var symptomsDic = new Dictionary<string, string>();

                        //自尊量表
                        var proudDt = MgrServices.AnswerAddService.GetSubEntityTemp("LB_14811096480630", 0);
                        var proudDic = new Dictionary<string, string>();
                        //社会支持评定量表
                        var ssrsDt = MgrServices.AnswerAddService.GetSubEntityTemp("LB_14810140679820", 0);
                        var ssrsDic = new Dictionary<string, string>();
                        for (int i = 0; i < symptomsDt.Rows.Count; i++)
                        {
                            foreach (var item in dicUpdate)
                            {
                                if (item.Key == symptomsDt.Rows[i]["SubjectCode"])
                                {
                                    symptomsDic.Add(item.Key, item.Value);
                                    break;
                                }
                            }
                        }
                        var symptomsPr = new PotentialRisk()
                        {
                            AmountCode = "LB_14810142054270",
                            AnswerRecord = symptomsDic
                        };
                        lpList.Add(symptomsPr);
                        for (int i = 0; i < proudDt.Rows.Count; i++)
                        {
                            foreach (var item in dicUpdate)
                            {
                                if (item.Key == proudDt.Rows[i]["SubjectCode"])
                                {
                                    proudDic.Add(item.Key, item.Value);
                                    break;
                                }
                            }
                        }
                        var proudPr = new PotentialRisk()
                        {
                            AmountCode = "LB_14811096480630",
                            AnswerRecord = proudDic
                        };
                        lpList.Add(symptomsPr);
                        for (int i = 0; i < ssrsDt.Rows.Count; i++)
                        {
                            foreach (var item in dicUpdate)
                            {
                                if (item.Key == ssrsDt.Rows[i]["SubjectCode"])
                                {
                                    ssrsDic.Add(item.Key, item.Value);
                                    break;
                                }
                            }
                        }
                        var ssrsPr = new PotentialRisk()
                        {
                            AmountCode = "LB_14810140679820",
                            AnswerRecord = ssrsDic
                        };
                        lpList.Add(ssrsPr);
                        for (int i = 0; i < lpList.Count; i++)
                        {
                            AnswerAddEntity models = new AnswerAddEntity();
                            models._answeradd_record = JsonConvert.SerializeObject(lpList[i].AnswerRecord);//数据保存记录
                            models._amount_code = lpList[i].AmountCode;//量表编码                
                            models._answerpeople = UserPepole;
                            models._u_id = UserID;
                            models._distriid = Common.GetRequest("DID");//分配量表的id
                            if (Common.GetRequest("state") != null && Common.GetRequest("state") != "")
                            {
                                models._answer_state = Convert.ToInt32(Common.GetRequest("state"));
                            }
                            else
                            {
                                models._answer_state = 1;
                            }
                            if (Common.GetRequest("score") != null && Common.GetRequest("score") != "" && Common.GetRequest("score") != "unified" && Common.GetRequest("score") != "NaN")
                            {
                                string ss = Common.GetRequest("score");
                                models._answeradd_score = Convert.ToInt32(Common.GetRequest("score"));
                            }
                            else
                            {
                                models._answeradd_score = 0;
                            }
                            if (Common.GetRequest("startime") != null && Common.GetRequest("startime") != "")
                            {
                                string times = Common.GetRequest("startime");
                                models._answer_starttimer = DateTime.Parse(Common.GetRequest("startime"));
                            }
                            if (Common.GetRequest("startime") != null && Common.GetRequest("startime") != "")
                            {
                                string times = Common.GetRequest("startime");
                                models._answer_starttimer = DateTime.Parse(Common.GetRequest("startime"));
                            }
                            models._answerisdelete = 0;
                            models._answer_createtime = DateTime.Now;
                            models._answeradd_id = Convert.ToInt32(Common.GetRequest("AnserID"));
                            string ANameB = Common.GetRequest("AName");
                            update(models, ANameB, context);
                        }
                    }
                    else
                    {
                        AnswerAddEntity models = new AnswerAddEntity();
                        models._answeradd_record = Common.GetRequest("RidoJson");//数据保存记录
                        Dictionary<string, string> dictionary = JsonConvert.DeserializeObject<Dictionary<string, string>>(models._answeradd_record);
                        models._amount_code = Common.GetRequest("Code");//量表编码                
                        models._answerpeople = UserPepole;
                        models._u_id = UserID;
                        models._distriid = Common.GetRequest("DID");//分配量表的id
                        if (Common.GetRequest("state") != null && Common.GetRequest("state") != "")
                        {
                            models._answer_state = Convert.ToInt32(Common.GetRequest("state"));
                        }
                        else
                        {
                            models._answer_state = 1;
                        }
                        if (Common.GetRequest("score") != null && Common.GetRequest("score") != "" && Common.GetRequest("score") != "unified" && Common.GetRequest("score") != "NaN")
                        {
                            string ss = Common.GetRequest("score");
                            models._answeradd_score = Convert.ToInt32(Common.GetRequest("score"));
                        }
                        else
                        {
                            models._answeradd_score = 0;
                        }
                        if (Common.GetRequest("startime") != null && Common.GetRequest("startime") != "")
                        {
                            string times = Common.GetRequest("startime");
                            models._answer_starttimer = DateTime.Parse(Common.GetRequest("startime"));
                        }
                        if (Common.GetRequest("startime") != null && Common.GetRequest("startime") != "")
                        {
                            string times = Common.GetRequest("startime");
                            models._answer_starttimer = DateTime.Parse(Common.GetRequest("startime"));
                        }
                        models._answerisdelete = 0;
                        models._answer_createtime = DateTime.Now;
                        models._answeradd_id = Convert.ToInt32(Common.GetRequest("AnserID"));
                        string ANameB = Common.GetRequest("AName");
                        update(models, ANameB, context);
                    }
                    break;
                case "DeleteAnswer":
                    int AnserIDs = Convert.ToInt32(Common.GetRequest("AnserID"));
                    context.Response.Write(DleteAnswer(AnserIDs));
                    break;
                case "InsertPotentialRiskResult":
                    InsertPotentialRiskResult(context);
                    break;
                case "InsertIdioctoniaEstimateResult":
                    InsertIdioctoniaEstimateResult(context);
                    break;

            }

        }
        #region 获取我的测验列表
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 获取我的测验列表
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="StarPageIndex"></param>
        /// <param name="EndPageIndex"></param>
        /// <param name="GaugeName"></param>
        /// <returns></returns>
        private DataSet GetGaugeTemp(int UserID, int StarPageIndex, int EndPageIndex, string GaugeName, string EnterpriseCode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.DistributeRecordService.GetMytestTable(UserID, StarPageIndex, EndPageIndex, GaugeName, EnterpriseCode);
            }
            catch
            {

            }

            return SourceTemp;
        }

        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/05
        /// 获取我的测验的列表
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="StarPageIndex"></param>
        /// <param name="EndPageIndex"></param>
        /// <param name="GaugeName"></param>
        /// <param name="context"></param>
        private void InitGaugePages(int UserID, int StarPageIndex, int EndPageIndex, string GaugeName, string EnterpriseCode, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetGaugeTemp(UserID, StarPageIndex, EndPageIndex, GaugeName, EnterpriseCode);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        string rid = Common.GetSessionValue("role_type", context);
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            String[] arr =
                            {                            
                                DTR["PageIndex"].ToString(),//序号	0
                                //DTR["Amount_Name"].ToString(),//量表名称1
                                 rid=="3"?DTR["Amount_DisplayName"].ToString():DTR["Amount_Name"].ToString(),
                                MgrServices.AmountService.GetSubjectCountByAmountCode(DTR["Amount_Code"].ToString()),
                                DTR["DistriCreateTime"].ToString(),//分配时间   3                                                                         
                                "",//操作4
                                DTR["A_Dis_ID"].ToString(), //量表分配ID,5
                                DTR["Answer_state"].ToString(),//作答状态，0是未作答，1是已作答，但未答完，2是已作答，3是已过期
                                DTR["IsRetest"].ToString(),//是否允许重新测试 0是不允许，1是允许
                                DTR["IS_Present"].ToString(),//8
                                DTR["Amount_Code"].ToString(),//9
                                DTR["AnswerAdd_ID"].ToString(),//10
                               // DTR["IS_Present"].ToString(),//11 
                            };
                            page.data.Add(arr);

                        }
                    }
                }
                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            {

            }
        }
        #endregion
        #region 获取我的指导语
        public Amount_InfoEntity GetAEntity(string Amount_Code)
        {
            Amount_InfoEntity modle = new Amount_InfoEntity();
            Amount_InfoEntity ds = MgrServices.DistributeRecordService.GetAEntity(Amount_Code);
            modle._amount_guidance = ds._amount_guidance;
            modle._amount_name = ds._amount_name;
            return modle;
        }
        #endregion
        #region
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 获取我的作答记录
        /// </summary>
        /// <param name="AnswerAddID"></param>
        /// <returns></returns>
        public string GetAnswerAddEntity(int AnswerAddID)
        {
            string GetAnswer = "";
            try
            {
                AnswerAddEntity ds = MgrServices.DistributeRecordService.GetAnswerAddEntity(AnswerAddID);

                GetAnswer = ds._answeradd_record;
                return GetAnswer;
            }
            catch
            {
                return GetAnswer;
            }
        }
        #endregion

        #region 我的作答数据
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 根据序号加载题干信息
        /// </summary>
        /// <param name="code">量表编码</param>
        /// <param name="index">题干序号</param>
        /// <param name="context"></param>
        private void InitStem(string code, int index, int ARadom, HttpContext context)
        {
            try
            {
                DataTable sourceTemp = new DataTable();
                sourceTemp = GetStemTemp(code, ARadom);
                StemEntity Stem = new StemEntity();
                List<StemEntity> listT = new List<StemEntity>();
                if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                {

                    foreach (DataRow DTR in sourceTemp.Rows)
                    {
                        if (Convert.ToInt32(DTR["IndexNumber"].ToString()).Equals(index))
                        {
                            Stem = new StemEntity();
                            Stem.Number = Convert.ToInt32(DTR["IndexNumber"].ToString());
                            Stem.StemCode = DTR["SubjectCode"].ToString();
                            Stem.StemName = DTR["SubjectContent"].ToString();
                            Stem.Total = sourceTemp.Rows.Count;
                            listT.Add(Stem);
                            break;
                        }
                    }
                    string json = new JavaScriptSerializer().Serialize(listT);
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }
            }
            catch
            { }
        }
        public DataTable GetStemTemp(string Code, int ARadom)
        {
            DataTable SourceTemp = new DataTable();
            DataTable DB = new DataTable();
            try
            {
                DataTable sdbTemp = new DataTable();
                sdbTemp = MgrServices.DistributeRecordService.GetSubject(Code, ARadom);
                if (sdbTemp != null && sdbTemp.Rows.Count > 0)
                {
                    DataView dv = sdbTemp.DefaultView;
                    DB = dv.ToTable();
                    if (DB != null && DB.Rows.Count > 0)
                    {

                        DB.Columns.Add("IndexNumber", typeof(int));
                        int i = 1;
                        foreach (DataRow dr in DB.Rows)
                        {
                            dr["IndexNumber"] = i;
                            i++;
                        }
                    }


                }

            }
            catch
            {

            }
            return DB;

        }
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 根据题干编码 ，初始化题支信息集合
        /// </summary>
        /// <param name="StemCode">题干编码</param>
        /// <param name="context"></param>
        private void InitOption(string StemCode, HttpContext context)
        {
            try
            {
                DataTable SourceTemp = new DataTable();
                SourceTemp = MgrServices.DistributeRecordService.GetProblem(StemCode);//题支数据集合
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    OptionEntity option = new OptionEntity();
                    List<OptionEntity> List_T = new List<OptionEntity>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        option = new OptionEntity();
                        option.IndexNumber = DTR["OperationNum"].ToString();
                        option.OptionCode = DTR["OperationCode"].ToString();
                        option.Content = DTR["OperationContent"].ToString();
                        option.Faction = Convert.ToInt32(DTR["OperationFraction"].ToString());
                        List_T.Add(option);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(List_T));
                }
            }
            catch
            { }

        }
        /// <summary>
        /// DataRow[]转datatable
        /// </summary>
        /// <param name="rows"></param>
        /// <returns></returns>
        public DataTable ToDataTable(DataRow[] rows)
        {
            if (rows == null || rows.Length == 0) return null;
            DataTable tmp = rows[0].Table.Clone();  // 复制DataRow的表结构
            foreach (DataRow row in rows)
            {

                tmp.Rows.Add(row.ItemArray);  // 将DataRow添加到DataTable中

            }

            return tmp;
        }
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/07
        /// 保存我的做答的记录
        /// </summary>
        /// <param name="entityInfo"></param>
        /// <returns></returns>
        public void Insert(AnswerAddEntity entityInfo, string AName, HttpContext context)
        {
            try
            {
                //增加判断，判断是否在作答过程中管理员取消作答权限，即删除分配记录
                bool isDelete = MgrServices.DistributeRecordService.GetDistrubuteIsDelete(int.Parse(entityInfo._distriid));
                if (isDelete)
                {
                    context.Response.Write("2");
                    return;
                }
                //long msg = MgrServices.DistributeRecordService.Insert(entityInfo);
                long msg = 0;
                if (entityInfo._answer_state == 2)
                {
                    string JsonRecord = Convert.ToString(Common.GetRequest("JsonPid"));
                    msg = ReportInsert(entityInfo._u_id, JsonRecord, entityInfo._answeradd_record, entityInfo._amount_code, AName, entityInfo);
                    if (msg <= 0)
                    {
                        msg = ReportInsert(entityInfo._u_id, JsonRecord, entityInfo._answeradd_record, entityInfo._amount_code, AName, entityInfo);
                    }
                }
                else
                {
                    msg = MgrServices.DistributeRecordService.Insert(entityInfo);
                    if (msg < 0)
                    {
                        msg = MgrServices.DistributeRecordService.Insert(entityInfo);
                    }
                }
                if (entityInfo._amount_code == "LB_15131477237610")
                {
                    context.Response.Write("InsertIdioctoniaEstimateResult");
                    return;
                }
                if (msg > 0)
                {
                    context.Response.Write("1");
                }
                else
                {
                    context.Response.Write("0");
                }
            }
            catch (Exception e)
            {
                throw new CustomException(e.Message, "Insert(AnswerAddEntity entityInfo, string AName, HttpContext context)", "量表提交客户端");
            }
        }
        public bool insertss()
        {
            int state = 0;
            bool result = false;
            int sere = 0;
            //获取类型
            if (Common.GetRequest("state") != null && Common.GetRequest("state") != "")
            {
                state = Convert.ToInt32(Common.GetRequest("state"));
            }
            if (state == 2)
            {
                //获取用户编码
                if (Common.GetRequest("score") != null && Common.GetRequest("score") != "")
                {
                    sere = Convert.ToInt32(Common.GetRequest("score"));
                }

                string json = Convert.ToString(Common.GetRequest("JsonPid"));
                result = MgrServices.DistributeRecordService.Answer(json);
            }
            return result;

        }
        /// <summary>
        /// 生成个体报告
        /// </summary>
        public long ReportInsert(int UID, string Record, string AnswerJson, string Acode, string AName, AnswerAddEntity entityInfo)
        {
            try
            {
                long ss = -1;
                CrisisInterfere.projrem.PersonReport obj = new PersonReport(Acode, AnswerJson, Record, AName, entityInfo._answeradd_score);
                CrisisInterfere.DistributeRecordService.R_ReportEntity entityInfos = new CrisisInterfere.DistributeRecordService.R_ReportEntity();
                string strjosn = JsonConvert.SerializeObject(obj);
                entityInfos._reportjson = strjosn;
                entityInfos._createuid = UID;

                //entityInfo._answeid = answerid;
                entityInfos._r_createdate = DateTime.Now;
                if (obj.DimensionEntitys != null && obj.UserINfos != null)
                {
                    ss = MgrServices.DistributeRecordService.InsetsAnswerPTwo(entityInfo, entityInfos);
                }
                else
                {
                    throw new CustomException("添加出错", " ReportInsert", "添加我的测验");
                }



                return ss;
            }
            catch (Exception ex)
            {

                throw new CustomException(ex.Message, "long ReportInsert(int UID, string Record, string AnswerJson, string Acode, string AName, AnswerAddEntity entityInfo)", "生成个体报告"); ;
            }


        }
        public long UpdateReportInsert(int answerid, int UID, string Record, string AnswerJson, string Acode, string AName, AnswerAddEntity entityInfo)
        {

            CrisisInterfere.projrem.PersonReport obj = new PersonReport(Acode, AnswerJson, Record, AName, entityInfo._answeradd_score);
            CrisisInterfere.PersonalReportService.R_ReportEntity entityInfos = new CrisisInterfere.PersonalReportService.R_ReportEntity();
            string strjosn = JsonConvert.SerializeObject(obj);
            entityInfos._reportjson = strjosn;
            entityInfos._createuid = UID;
            //entityInfo._answeradd_id = answerid;
            entityInfos._answeid = answerid;
            entityInfos._r_createdate = DateTime.Now;
            long ss = -1;
            if (obj.UserINfos != null && obj.DimensionEntitys != null)
            {
                ss = MgrServices.PersonalReportService.R_ReportInsert(entityInfos);

            }
            else
            {
                throw new CustomException("更新出错", " UpdateReportInsert", "更新我的测验");
            }

            return ss;


        }

        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 根据序号加载题干信息
        /// </summary>
        /// <param name="code">量表编码</param>
        /// <param name="index">题干序号</param>
        /// <param name="context"></param>
        private void InitStemS(string code, int index, int ARadom, int DID, HttpContext context)
        {
            try
            {
                int Indexs = 0;
                DataTable sourceTemp = new DataTable();
                if (code.Equals("LB_14811899636250"))
                {
                    // sourceTemp = MgrServices.AnswerAddService.GetMMPI_Subject_Temp();
                    string MMPI_Json = MgrServices.AnswerAddService.GetMMPI_Question();
                    context.Response.Write(MMPI_Json);
                    return;
                }
                else
                {
                    sourceTemp = MgrServices.AnswerAddService.GetSubEntityTemp(code, 0);
                }

                //GetOperationCodeTemp


                List<QModel> listT = new List<QModel>();
                if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                {
                    if (ARadom == 1)
                    {
                        //重新处理sourceTemp
                        //取  DID （分配记录） 对应的作答记录
                        //如果作答记录不为空
                        //重新编排sourceTemp
                        AnswerAddEntity aae = MgrServices.DistributeRecordService.GetAnswerAddEntity_ByDID(DID);
                        DataTable tempTable = sourceTemp.Clone();

                        if (aae != null && aae._answeradd_record.Length > 0)
                        {
                            Dictionary<string, string> answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(aae._answeradd_record);//将用户答题记录json字符串反序列为字典项键值对                        }
                            foreach (var item in answerRecordDic.Keys)
                            {
                                DataRow tempRow = sourceTemp.AsEnumerable().Where(x => x["SubjectCode"].ToString() == item).First();
                                tempTable.ImportRow(tempRow);
                                sourceTemp.Rows.Remove(tempRow);
                            }
                        }
                        int tableLength = sourceTemp.Rows.Count;
                        Random rd = new Random();
                        for (int j = tableLength; j > 0; j--)
                        {
                            DataRow tempRow = sourceTemp.Rows[rd.Next(0, j)];
                            tempTable.ImportRow(tempRow);
                            sourceTemp.Rows.Remove(tempRow);
                        }
                        sourceTemp = tempTable;
                    }

                    Amount_InfoEntity ds = MgrServices.DistributeRecordService.GetAEntity(code);
                    string SubCodeStr = "";
                    foreach (DataRow SunDtr in sourceTemp.Rows)
                    {
                        if (!SubCodeStr.Equals(""))
                        {
                            SubCodeStr += ",'" + SunDtr["SubjectCode"] + "'";
                        }
                        else
                        {
                            SubCodeStr += "'" + SunDtr["SubjectCode"] + "'";
                        }
                    }
                    DataTable OperationTemp = new DataTable();
                    DataTable OperationRelarionTemp = new DataTable();

                    if (!SubCodeStr.Equals(""))
                    {

                        OperationRelarionTemp = MgrServices.DistributeRecordService.GetOperationCodeTemp(SubCodeStr);//查询的是题干和题支的关系集合
                        OperationTemp = MgrServices.DistributeRecordService.GetOperationTemp(SubCodeStr);// 查询的是题支的实体信息集合

                    }


                    StringBuilder sb = new StringBuilder("{'questions':[");
                    foreach (DataRow DTR in sourceTemp.Rows)
                    {
                        Indexs++;
                        QModel model = new QModel();
                        sb.Append("{'question':");
                        string SubjectContent = DTR["SubjectContent"].ToString();
                        if (SubjectContent.Contains("/SubjectImages"))
                        {
                            model.question = DTR["SubjectContent"].ToString();
                        }
                        else
                        {
                            model.question = Indexs + "." + DTR["SubjectContent"].ToString();
                        }
                        string StemCode = DTR["SubjectCode"].ToString();
                        string SubjectCode = "";
                        string IndexNum = "";
                        sb.Append("'" + model.question + "'");
                        DataRow[] OperCodeRW = OperationRelarionTemp.Select(" SubjectCode='" + StemCode + "'");
                        string OPC_Str = "";
                        if (OperCodeRW != null && OperCodeRW.Length > 0)
                        {
                            foreach (DataRow OCDTR in OperCodeRW)
                            {
                                if (!OPC_Str.Equals(""))
                                {
                                    OPC_Str += ",'" + OCDTR["OperationCode"] + "'";
                                }
                                else
                                {
                                    OPC_Str += "'" + OCDTR["OperationCode"] + "'";
                                }

                            }
                        }

                        DataRow[] SourceTemps = OperationTemp.Select(" OperationCode in (" + OPC_Str + ")  ");
                        if (SourceTemps != null && SourceTemps.Length > 0)
                        {
                            sb.Append(",");
                            sb.Append("'answers':[");
                            string OpCode = "";
                            string Factions = "";
                            foreach (DataRow DTRs in SourceTemps)
                            {
                                model.OptionCode = DTRs["OperationCode"].ToString();
                                model.IndexNum = DTRs["OperationNum"].ToString();
                                model.Faction = DTRs["OperationFraction"].ToString();
                                model.answers = DTRs["OperationContent"].ToString();
                                sb.Append("'" + model.answers + "',");//model.answers
                                OpCode += "'" + model.OptionCode + "',";
                                Factions += "'" + model.Faction + "',";
                                SubjectCode += "'" + StemCode + "',";
                                IndexNum += "'" + model.IndexNum + "',";
                            }
                            sb.Append("]" + ",");
                            sb.Append("'OpCode':[" + SubjectCode + "]" + ",");
                            sb.Append("'IndexNum':[" + IndexNum + "]" + ",");
                            sb.Append("'Factions':[" + Factions + "]" + ",");
                            sb.Append("'OptionCode':[" + OpCode + "]}" + ",");
                        }
                    }
                    sb.Append("],");

                    ds._amount_guidance = ds._amount_guidance.Replace("'", "&apos;");
                    ds._amount_guidance = ds._amount_guidance.Replace("\"", "&quot;");
                    ds._amount_displayname = ds._amount_displayname.Replace("'", "&apos;");
                    ds._amount_displayname = ds._amount_displayname.Replace("\"", "&quot;");

                    sb.Append("'Amount_Guidance': [{'AGuidance':" + "'" + ds._amount_guidance + "'},{'AName':" + "'" + ds._amount_displayname + "'}]");
                    sb.Append("}");

                    string json = sb.ToString().Replace("'", "\"");

                    context.Response.Write(json);

                    //context.Response.Write("000000");
                }

            }
            catch
            { }
        }
        #endregion

        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 更新作答表记录
        /// </summary>
        /// <param name="AnswerID"></param>
        /// <returns></returns>
        public void update(AnswerAddEntity model, string AName, HttpContext context)
        {
            try
            {
                bool Updates = MgrServices.DistributeRecordService.Update(model);
                if (Updates)
                {
                    if (model._answer_state == 2)
                    {
                        string JsonRecord = Convert.ToString(Common.GetRequest("JsonPid"));
                        UpdateReportInsert(Convert.ToInt32(model._answeradd_id), model._u_id, JsonRecord, model._answeradd_record,
                            model._amount_code, AName, model);
                    }
                }
                context.Response.Write("1");
            }
            catch
            {
                context.Response.Write("0"); ;
            }
        }



        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 根据id删除我的作答的相应记录
        /// </summary>
        /// <param name="AnswerID"></param>
        /// <returns></returns>
        public bool DleteAnswer(int AnswerId)
        {
            try
            {
                return MgrServices.DistributeRecordService.DeleteAnswer(AnswerId);
            }
            catch
            {
                return false;
            }
        }
        public void InsertPotentialRiskResult(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"].ToString());
            var lpList = context.Session["PotentialRiskList"] as List<PotentialRisk>;
            var belongToCode = context.Session["BelongToCode"].ToString();
            var symptomsScore = lpList.FirstOrDefault(m => m.AmountCode == "LB_14810142054270").TotalScore;//症状自评量表得分
            var proudScore = lpList.FirstOrDefault(m => m.AmountCode == "LB_14811096480630").TotalScore;//自尊量表得分
            var ssrsScore = lpList.FirstOrDefault(m => m.AmountCode == "LB_14810140679820").TotalScore;//社会支持量表得分
            var resultViewModel = new ResultViewModel();
            var warningState = 1;//默认是暂无
            //较低
            if ((symptomsScore <= 160 && ssrsScore < 30 || (symptomsScore <= 160 && ssrsScore >= 30 && ssrsScore <= 38) && (proudScore > 35 || proudScore <= 20)) || (symptomsScore <= 160 && ssrsScore > 38 && (proudScore > 35 || proudScore <= 20)))
            {
                warningState = 2;
            }
            //中等
            if ((symptomsScore > 160 && symptomsScore <= 208 && ssrsScore >= 30) || (symptomsScore > 160 && symptomsScore <= 208 && ssrsScore < 30 && proudScore > 20))
            {
                warningState = 3;
            }
            //较高
            if ((symptomsScore > 160 && symptomsScore <= 208 && ssrsScore < 30 && proudScore <= 20) || (symptomsScore > 208 && ssrsScore > 38) || (symptomsScore > 208 && ssrsScore <= 38 && proudScore > 20))
            {
                warningState = 4;
            }
            //极高
            if (symptomsScore > 208 && ssrsScore <= 38 && proudScore <= 20)
            {
                warningState = 5;
            }
            if (MgrServices.MemberArchivesService.GetMemberArchiveByUserID(userID) == 0)
            {
                var model = new MemberArchiveModel()
                {
                    UserID = userID,
                    CreateTime = DateTime.Now
                };
                MgrServices.MemberArchivesService.AddMemberArchive(model);
            }
            if (MgrServices.AnswerAddService.InsertPotentialRiskResult(belongToCode, warningState) > 0)
            {
                resultViewModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultViewModel));
                return;
            }
            resultViewModel.State = false;
            resultViewModel.Data = "提交失败，未知原因";
            context.Response.Write(JsonConvert.SerializeObject(resultViewModel));

        }
        public void InsertIdioctoniaEstimateResult(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"].ToString());
            var belongToCode = context.Session["BelongToCode"].ToString();
            var score = Convert.ToInt32(context.Session["IdioctoniaEstimateScore"]);
            var warningState = 1;
            var resultViewModel = new ResultViewModel();
            if (score > 50 && score <= 60)
            {
                warningState = 2;
            }
            if (score > 60 && score <= 70)
            {
                warningState = 3;
            }
            if (score > 70 && score < 80)
            {
                warningState = 4;
            }
            if (score >= 80)
            {
                warningState = 5;
            }
            if (MgrServices.MemberArchivesService.GetMemberArchiveByUserID(userID) == 0)
            {
                var model = new MemberArchiveModel()
                {
                    UserID = userID,
                    CreateTime = DateTime.Now
                };
                MgrServices.MemberArchivesService.AddMemberArchive(model);
            }
            if (MgrServices.AnswerAddService.InsertPotentialRiskResult(belongToCode, warningState) > 0)
            {
                resultViewModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultViewModel));
                return;
            }
            resultViewModel.State = false;
            resultViewModel.Data = "提交失败，未知原因";
            context.Response.Write(JsonConvert.SerializeObject(resultViewModel));
        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        /// <summary>
        /// 题支实体类
        /// </summary>
        public class OptionEntity
        {

            private string _indexNumber;
            /// <summary>
            /// 选项编号
            /// </summary>
            public string IndexNumber
            {
                get { return _indexNumber; }
                set { _indexNumber = value; }
            }

            private string _content;
            /// <summary>
            /// 选项内容
            /// </summary>
            public string Content
            {
                get { return _content; }
                set { _content = value; }
            }

            private int _faction;
            /// <summary>
            /// 选项得分
            /// </summary>
            public int Faction
            {
                get { return _faction; }
                set { _faction = value; }
            }

            private string _optionCode;
            /// <summary>
            /// 选项编码
            /// </summary>
            public string OptionCode
            {
                get { return _optionCode; }
                set { _optionCode = value; }
            }
        }
        public class StemEntity
        {

            private int _Number;

            /// <summary>
            /// 题干编号
            /// </summary>
            public int Number
            {
                get { return _Number; }
                set { _Number = value; }
            }

            private string _StemCode;

            /// <summary>
            /// 题干编码
            /// </summary>
            public string StemCode
            {
                get { return _StemCode; }
                set { _StemCode = value; }
            }

            private string _StemName;

            /// <summary>
            /// 题干内容标题
            /// </summary>
            public string StemName
            {
                get { return _StemName; }
                set { _StemName = value; }
            }

            private int _Total;
            /// <summary>
            /// 题干总测试条数
            /// </summary>
            public int Total
            {
                get { return _Total; }
                set { _Total = value; }
            }
        }
    }
}