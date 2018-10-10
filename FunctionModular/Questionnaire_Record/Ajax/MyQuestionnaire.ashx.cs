using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using BR_Service;
using CrisisInterfere.projrem;
using CrisisInterfere.QuestionnaireService;

namespace CrisisInterfere.FunctionModular.Questionnaire_Record.Ajax
{
    /// <summary>
    /// MyQuestionnaire 的摘要说明
    /// </summary>
    public class MyQuestionnaire : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string UserPepole = "";
            int UserID = 0;
            UserPepole = Common.GetSessionValue("loginName", context);
            if (UserPepole == null)
                return;
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            UserID = Convert.ToInt32(_uID);
            string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;

            string type = Common.GetRequest("type");
            switch (type)
            {
                case "Load"://我的问卷列表               
                    int starPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                    string gaugeName = Common.GetRequest("GaugeName");
                    InitGaugePages(UserID, starPageIndex, endPageIndex, gaugeName, enterpriseCode, context);
                    break;
                case "GetProblem"://加载题干
                    string qCode = Common.GetRequest("Q_Code");
                    InitStemS(qCode, context);
                    break;
                case "UpdateAnswer"://重新作答
                    UpdateAnwser(context);
                    break;
                case "ContinueAnswer"://继续作答
                    GetAnwserEntity(context);
                    break;
                case "SaveAnwser"://保存作答记录
                    SaveAnwser(context);
                    break;
                case "AnwserRecord":
                    starPageIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                    endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                    DateTime start = new DateTime();
                    DateTime end = new DateTime();
                    if (Common.GetRequest("StartTime") != "")
                        start = Convert.ToDateTime(Common.GetRequest("StartTime"));
                    if (Common.GetRequest("EndTime") != "")
                        end = Convert.ToDateTime(Common.GetRequest("EndTime"));
                    string queName = Common.GetRequest("quesName");
                    AnwserRecord(UserID, queName, start, end, starPageIndex, endPageIndex, context);
                    break;
                case "Delete":
                    DeleteAnwserRecord(context);
                    break;
                case "CalculateScore":
                    CalculateScore(context);
                    break;
                case "InitSurveyResult":
                    InitSurveyResult(context);
                    break;
            }
        }

        /// <summary>
        /// 创建人：田闯
        /// 创建日期：2017/04/18
        /// 获取我的问卷列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="starPageIndex"></param>
        /// <param name="endPageIndex"></param>
        /// <param name="gaugeName"></param>
        /// <param name="enterpriseCode"></param>
        /// <returns></returns>
        private DataSet GetGaugeTemp(int userId, int starPageIndex, int endPageIndex, string gaugeName, string enterpriseCode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.QuestionnaireService.GetMyQuestionnaire(userId, starPageIndex, endPageIndex, gaugeName, enterpriseCode);
            }
            catch
            {

            }

            return SourceTemp;
        }

        /// <summary>
        /// 创建人：田闯
        /// 创建日期：2017/04/18
        /// 获取我的问卷列表
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="starPageIndex"></param>
        /// <param name="endPageIndex"></param>
        /// <param name="gaugeName"></param>
        /// <param name="context"></param>
        private void InitGaugePages(int userId, int starPageIndex, int endPageIndex, string gaugeName, string enterpriseCode, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet sourceTemps = new DataSet();
                sourceTemps = GetGaugeTemp(userId, starPageIndex, endPageIndex, gaugeName, enterpriseCode);
                DataTable sourceTemp = new DataTable();
                if (sourceTemps != null && sourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(sourceTemps.Tables[0].Rows[0][0]);
                    sourceTemp = sourceTemps.Tables[1];
                    if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                    {
                        string state = "作答";
                        foreach (DataRow DTR in sourceTemp.Rows)
                        {
                            //将问卷的作答状态的判断放在后台
                            if ((DTR["SubmitDate"].ToString() == "" ||
                                 Convert.ToDateTime(DTR["SubmitDate"].ToString()) ==
                                 Convert.ToDateTime("1900/1/1 0:00:00")) && DTR["QD_Code"].ToString() == "")
                                state = "作答";
                            else if (((DTR["SubmitDate"].ToString() != "" &&
                                       Convert.ToDateTime(DTR["SubmitDate"].ToString()) !=
                                       Convert.ToDateTime("1900/1/1 0:00:00")) && DTR["QD_Code"].ToString() != ""))
                                state = "已作答";
                            else if ((DTR["SubmitDate"].ToString() == "" ||
                                      Convert.ToDateTime(DTR["SubmitDate"].ToString()) ==
                                      Convert.ToDateTime("1900/1/1 0:00:00")) && DTR["QD_Code"].ToString() != "")
                                state = "继续作答";

                            String[] arr =
                            {                            
                                DTR["PageIndex"].ToString(),//序号	0
                                DTR["Name"].ToString(),//问卷名称1
                                MgrServices.QuestionnaireService.GetQuestionnaire_SubjectCount(DTR["Q_Code"].ToString()).ToString(),//2
                                DTR["CreateDate"].ToString(),//分配时间   3                                                                         
                                "",//操作4
                                DTR["id"].ToString(), //问卷分配ID,5
                                DTR["SubmitDate"].ToString(),//作答提交时间6
                                DTR["QD_Code"].ToString(),//作答表中的分配code7
                                DTR["Q_Code"].ToString(),//问卷编码8
                                DTR["Is_Anonymity"].ToString(),//是否允许匿名作答9
                                DTR["DisUID"].ToString(),//分配给用户ID10
                                DTR["U_ID"].ToString(),//谁分配的11
                                DTR["Code"].ToString(),//分配Code12
                                DTR["Instruction"].ToString(),//问卷说明13
                                DTR["Aid"].ToString(),//问卷作答ID14
                                state//15
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
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/19
        /// 获取问卷的题干，题支信息
        /// </summary>
        /// <param name="code"></param>
        /// <param name="context"></param>
        private void InitStemS(string code, HttpContext context)
        {
            try
            {
                bool Anonymity = false;
                string QD_Code = Common.GetRequest("Code");//分配编码
                if (Common.GetRequest("Anonymity") != "")
                    Anonymity = Convert.ToBoolean(Common.GetRequest("Anonymity"));//是否允许匿名作答
                DataTable sourceTemp = MgrServices.QuestionnaireService.GetSubjectEntity(code);
                if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                {
                    Questionnaire_InfoEntity ds = MgrServices.QuestionnaireService.GetEntity(code);
                    string SubCodeStr = "";
                    foreach (DataRow SunDtr in sourceTemp.Rows)
                    {
                        if (!SubCodeStr.Equals(""))
                        {
                            SubCodeStr += ",'" + SunDtr["Code"] + "'";
                        }
                        else
                        {
                            SubCodeStr += "'" + SunDtr["Code"] + "'";
                        }
                    }
                    DataTable OperationTemp = new DataTable();
                    DataTable OperationRelarionTemp = new DataTable();
                    if (!SubCodeStr.Equals(""))
                    {
                        OperationRelarionTemp = MgrServices.QuestionnaireService.GetOperation_Subject_Temp(SubCodeStr);//查询的是题干和题支的关系集合
                        OperationTemp = MgrServices.QuestionnaireService.GetOperationTemp(SubCodeStr);// 查询的是题支的实体信息集合
                    }
                    StringBuilder sb = new StringBuilder("{\"questions\":[");
                    foreach (DataRow DTR in sourceTemp.Rows)
                    {
                        QuestionnaireModel model = new QuestionnaireModel();
                        sb.Append("{\"question\":");
                        //题干标题
                        string SubjectContent = DTR["Content"].ToString();
                        model.question = DTR["Sort"].ToString() + "." + DTR["Content"].ToString();
                        //题干类型
                        model.s_type = Convert.ToInt32(DTR["Type"]);
                        model.sub_score = DTR["Score"].ToString();
                        model.sub_true = DTR["TrueAnwser"].ToString();
                        string StemCode = DTR["Code"].ToString();
                        string SubjectCode = "";
                        string IndexNum = "";
                        sb.Append("\"" + model.question + "\",");
                        sb.Append("\"subType\":\"" + model.s_type + "\",");
                        sb.Append("\"TrueAnwser\":\"" + model.sub_true + "\",");
                        sb.Append("\"Score\":\"" + model.sub_score + "\"");


                        DataRow[] OperCodeRW = OperationRelarionTemp.Select(" S_Code='" + StemCode + "'");
                       List< string> OPC_Str = new List<string>();
                        if (OperCodeRW != null && OperCodeRW.Length > 0)
                        {
                            foreach (DataRow OCDTR in OperCodeRW)
                            {
                                //if (!OPC_Str.Equals(""))
                                //{
                                    OPC_Str.Add (OCDTR["O_Code"].ToString());
                                //}
                                //else
                                //{
                                //    OPC_Str += "'" + OCDTR["O_Code"] + "'";
                                //}

                            }
                        }
                        string OpCode = "";
                        string Factions = "";
                        string SkipCode = "";
                        string SerialNumber = "";
                        if (OPC_Str.Count != 0)
                        {
                            //OperationTemp.DefaultView.Sort = "id asc";//让表格中的数据按照ID进行升序排列
                            var SourceTemps = OperationTemp.AsEnumerable().Where(x => OPC_Str.Contains(x["Code"].ToString())).ToArray();

                           // DataRow[] SourceTemps = OperationTemp.Select(" Code in (" + OPC_Str + ")  ");
                            if (SourceTemps != null && SourceTemps.Length > 0)
                            {
                                sb.Append(",");
                                sb.Append("\"answers\":[");
                                foreach (DataRow DTRs in SourceTemps)
                                {
                                    model.o_code = DTRs["Code"].ToString();//题支编码
                                    model.o_index = DTRs["SortCode"].ToString();//题支序号
                                    model.o_score = DTRs["Fraction"].ToString();//题支分值
                                    model.serialNumber = DTRs["SerialNumber"].ToString();//题支选项内容
                                    model.o_content = DTRs["Content"].ToString();//题支内容
                                    model.skipcode = DTRs["SkipCode"].ToString();
                                    sb.Append("\"" + model.o_content + "\",");
                                    OpCode += "\"" + model.o_code + "\",";
                                    Factions += "\"" + model.o_score + "\",";
                                    SubjectCode += "\"" + StemCode + "\",";
                                    IndexNum += "\"" + model.o_index + "\",";
                                    SkipCode += "\"" + model.skipcode + "\",";
                                    SerialNumber += "\"" + model.serialNumber + "\",";
                                }
                                sb.Append("]" + ",");
                                sb.Append("\"SubCode\":[" + SubjectCode + "]" + ",");
                                sb.Append("\"IndexNum\":[" + IndexNum + "]" + ",");
                                sb.Append("\"Factions\":[" + Factions + "]" + ",");
                                sb.Append("\"OptionCode\":[" + OpCode + "]" + ",");
                                sb.Append("\"SerialNumber\":[" + SerialNumber + "]" + ",");
                                sb.Append("\"SkipCode\":[" + SkipCode + "]}" + ",");
                            }
                        }
                        else
                        {
                            sb.Append(",");
                            sb.Append("\"answers\":[");
                            sb.Append("]" + ",");
                            sb.Append("\"SubCode\":[" + "\"" + StemCode + "\"," + "]" + ",");
                            sb.Append("\"IndexNum\":[" + IndexNum + "]" + ",");
                            sb.Append("\"Factions\":[" + Factions + "]" + ",");
                            sb.Append("\"OptionCode\":[" + OpCode + "]}" + ",");
                        }

                    }

                    sb.Append("],");
                    ds._instruction = ds._instruction.Replace("'", "&apos;");
                    ds._instruction = ds._instruction.Replace("\"", "&quot;");
                    ds._name = ds._name.Replace("'", "&apos;");
                    ds._name = ds._name.Replace("\"", "&quot;");
                    sb.Append("\"Questionnaire_Guidance\": [{\"QGuidance\":" + "\"" + ds._instruction + "\"},{\"QName\":" + "\"" + ds._name + "\"},{\"Anonymity\":\"" + Anonymity + "\"}]");
                    sb.Append("}");

                    string json = sb.ToString();//.Replace("\"", "\'");                   
                    context.Response.Write(json);
                }
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/20
        /// 更新一条作答记录        
        /// </summary>
        /// <param name="context"></param>
        private void UpdateAnwser(HttpContext context)
        {
            try
            {
                Questionnaire_Respondence respon = new Questionnaire_Respondence();
                long ansId = 0;
                string qCode = "";
                DateTime startTime = new DateTime();
                string jSon = "";
                string path = "";
                string qdCode = "";
                string _score = "";
                bool Is_Anonymity = false;
                if (Common.GetRequest("QD_Code") != null)
                    qdCode = Common.GetRequest("QD_Code");
                if (Common.GetRequest("AnserID") != null)
                    ansId = Convert.ToInt64(Common.GetRequest("AnserID"));
                if (Common.GetRequest("Q_Code") != null)
                    qCode = Common.GetRequest("Q_Code");
                if (Common.GetRequest("startime") != null)
                    startTime = Convert.ToDateTime(Common.GetRequest("startime"));
                if (Common.GetRequest("AnwserPath") != null)
                    path = Common.GetRequest("AnwserPath");
                if (Common.GetRequest("Submit") != "1900-01-01" && Common.GetRequest("Submit") != null)
                    respon.SubmitTime = Convert.ToDateTime(Common.GetRequest("Submit"));
                if (Common.GetRequest("Score") != null)
                    _score = Common.GetRequest("Score");
                if (Common.GetRequest("Is_Anonymity") != null)
                    Is_Anonymity = Convert.ToBoolean(Common.GetRequest("Is_Anonymity"));

                float score = 0;
                if (_score != "")
                    score = (float)Convert.ToDouble(_score);

                jSon = Common.GetRequest("Json");
                respon.QD_Code = qdCode;
                respon.StartTime = startTime;
                respon.AnsRecord = jSon;
                respon.AnwserPath = path;
                respon.Id = ansId;
                respon.Score = score;
                respon.Is_Anonymity = Is_Anonymity;

                int result = MgrServices.QuestionnaireService.UpdateAnswer(respon) == false ? 0 : 1;
                context.Response.Write(result);
            }
            catch
            {
            }

        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/20
        /// 继续作答
        /// </summary>
        /// <param name="context"></param>
        private void GetAnwserEntity(HttpContext context)
        {
            string[] GetAnswer = new string[2];
            try
            {
                string aCode = string.Empty;
                if (Common.GetRequest("AnswerID") != null)
                    aCode = Common.GetRequest("AnswerID");
                Questionnaire_Respondence ds = MgrServices.QuestionnaireService.GetEntity_Respod(aCode);

                GetAnswer[0] = ds.AnsRecord;
                GetAnswer[1] = ds.AnwserPath;

                String json = Common.ObjectToJson(GetAnswer);
                context.Response.Write(json);
            }
            catch
            {
                context.Response.Write(GetAnswer);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/24
        /// 保存作答记录
        /// </summary>
        /// <param name="context"></param>
        private void SaveAnwser(HttpContext context)
        {
            int result = 0;
            try
            {
                string jSon = "";
                string qdCode = "";
                string qCode = "";
                string _uID = "";
                string path = "";
                string _score = "";
                bool Is_Anonymity = false;
                DateTime start = new DateTime();
                _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                int UserID = Convert.ToInt32(_uID);
                if (Common.GetRequest("Is_Anonymity") != null)
                    Is_Anonymity = Convert.ToBoolean(Common.GetRequest("Is_Anonymity"));
                if (Common.GetRequest("QD_Code") != null)
                    qdCode = Common.GetRequest("QD_Code");
                if (Common.GetRequest("Json") != null)
                    jSon = Common.GetRequest("Json");
                if (Common.GetRequest("Q_Code") != null)
                    qCode = Common.GetRequest("Q_Code");
                if (Common.GetRequest("startime") != null)
                    start = Convert.ToDateTime(Common.GetRequest("startime"));
                if (Common.GetRequest("AnwserPath") != null)
                    path = Common.GetRequest("AnwserPath");
                if (Common.GetRequest("Score") != null)
                    _score = Common.GetRequest("Score");
                float score = 0;
                if (_score != "")
                    score = (float)Convert.ToDouble(_score);

                Questionnaire_Respondence respond = new Questionnaire_Respondence();
                respond.AnsRecord = jSon;
                respond.Q_Code = qCode;
                respond.QD_Code = qdCode;
                respond.StartTime = start;
                respond.U_ID = UserID;
                respond.Score = score;
                if (Common.GetRequest("Submit") == "1900-01-01" || Common.GetRequest("Submit") == null)
                    respond.SubmitTime = null;
                else
                    respond.SubmitTime = DateTime.Now;
                respond.Is_Delete = false;
                respond.AnwserPath = path;
                respond.Is_Anonymity = Is_Anonymity;

                result = MgrServices.QuestionnaireService.SaveAnwserRecord(respond);
                context.Response.Write(result);
            }
            catch
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/25
        /// 获取我的作答记录信息
        /// </summary>
        /// <param name="context"></param>
        private void AnwserRecord(int userId, string queName, DateTime? start, DateTime? end, int starPageIndex, int endPageIndex, HttpContext context)
        {
            try
            {
                PageInfo page = new PageInfo();
                DataSet sourceTemps = new DataSet();
                sourceTemps = MgrServices.QuestionnaireService.GetAnwserRecord(userId, queName, start, end, starPageIndex, endPageIndex);
                DataTable sourceTemp = new DataTable();
                if (sourceTemps != null && sourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(sourceTemps.Tables[0].Rows[0][0]);
                    sourceTemp = sourceTemps.Tables[1];
                    if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in sourceTemp.Rows)
                        {
                            String[] arr =
                            {                            
                                "<input class='checkDistri' data-uid='"+DTR["U_ID"]+"' type='checkbox' id ='"+DTR["id"]+"'>",//0
                                DTR["PageIndex"].ToString(),//序号	1
                                DTR["QD_Code"].ToString(),//分配编码 2
                                DTR["U_ID"].ToString(),//用户ID 3
                                DTR["SubmitDate"].ToString(),//提交日期 4
                                DTR["Score"].ToString(),//得分 5
                                DTR["Name"].ToString(),//问卷名称 6
                                DTR["id"].ToString(),//作答ID 7
                                DTR["Code"].ToString()//问卷编码 8
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
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/26
        /// 删除作答记录
        /// </summary>
        /// <param name="context"></param>
        private void DeleteAnwserRecord(HttpContext context)
        {
            int result = 0;
            try
            {
                string id = string.Empty;
                string name = string.Empty;
                string source = string.Empty;
                if (Common.GetRequest("id") != null)
                    id = Common.GetRequest("id");
                if (Common.GetRequest("name") != null)
                    name = Common.GetRequest("name");
                if (Common.GetRequest("source") != null)
                    source = Common.GetRequest("source");
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                int modularId = 25;//模块权限ID--调查结果 
                if (source == "作答记录")
                    modularId = 27;
                //result = MgrServices.QuestionnaireService.DeleteAnwserRecord(id) == true ? 1 : 0;
                string[] quesIds = id.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                string[] names = name.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                if (quesIds.Length > 0)
                {
                    for (int i = 0; i < quesIds.Length; i++)
                    {
                        CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                        model.RBTitle = "删除" + source + "-" + names[i]; //标题
                        model.RBModularID = modularId; //对应模块权限ID
                        model.RBTableName = "Questionnaire_Respondence"; //删除的表名
                        model.RBFieldName = "id"; //删除相对应字段的id
                        model.RBFieldValue = quesIds[i].ToString(); //删除列名的id
                        model.RBDeleteFieldName = "Is_Delete"; //表的删除字段一般 某某某_Delete
                        model.RBDeleteTime = DateTime.Now;
                        model.EnterpriseCode = enterpriseCode;
                        model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                        if (model.RBExcutePerson == null)
                        {
                            context.Response.Write(result);
                            return;
                        }
                        result = MgrServices.RecycleBinService.PutDataInRecycleBin(model) == true ? 1 : 0;
                    }
                }
                context.Response.Write(result);
            }
            catch
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/26
        /// 计算提交之后的问卷分值
        /// </summary>
        /// <param name="tzId">题支的编码集合</param>
        /// <returns></returns>
        private void CalculateScore(HttpContext context)
        {
            try
            {
                string tzId = string.Empty;

                if (Common.GetRequest("tzlist") != null)
                    tzId = Common.GetRequest("tzlist");


                double result = MgrServices.QuestionnaireService.CalculateScore(tzId);
                context.Response.Write(result);
            }
            catch
            {
                context.Response.Write(-1);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/27
        /// 初始化调查结果主界面的数据
        /// </summary>
        /// <returns></returns>
        private void InitSurveyResult(HttpContext context)
        {
            try
            {
                int UserID = 0;
                string queName = "";
                int startPage = 0;
                int endPage = 0;
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (enterpriseCode == null)
                    return;
                UserID = Convert.ToInt32(_uID);
                if (Common.GetRequest("Name") != "")
                    queName = Common.GetRequest("Name");
                if (Common.GetRequest("StartPage") != "")
                    startPage = Convert.ToInt32(Common.GetRequest("StartPage"));
                if (Common.GetRequest("EndPage") != "")
                    endPage = Convert.ToInt32(Common.GetRequest("EndPage"));

                PageInfo page = new PageInfo();
                DataSet sourceTable = MgrServices.QuestionnaireService.InitSurveyResult(UserID, enterpriseCode, queName, startPage, endPage);
                if (sourceTable != null && sourceTable.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(sourceTable.Tables[0].Rows[0][0]);
                    DataTable dataSource = sourceTable.Tables[1];
                    if (dataSource != null && dataSource.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in dataSource.Rows)
                        {
                            String[] str =
                            {
                                DTR["PageIndex"].ToString(),//0
                                DTR["Name"].ToString(),//问卷名称 1
                                DTR["Counts"].ToString(),//作答人数 2
                                DTR["Code"].ToString(),//问卷编码 3
                                DTR["SumScore"].ToString()//作答得分 4
                            };
                            page.data.Add(str);
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
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}