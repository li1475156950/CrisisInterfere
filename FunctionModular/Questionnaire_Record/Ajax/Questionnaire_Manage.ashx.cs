using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using BR_Service;

namespace CrisisInterfere.FunctionModular.Questionnaire_Record.Ajax
{
    /// <summary>
    /// Questionnaire_Manage 的摘要说明
    /// </summary>
    public class Questionnaire_Manage : IHttpHandler, IRequiresSessionState
    {
        #region 类中变量

        private string _uId = string.Empty;//用户ID
        private string _enterpriseCode = string.Empty;//企业编码

        #endregion

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            _enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
            _uId = Common.GetSessionValue("UserID", context);//企业ID  

            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "Bind"://绑定数据
                    InitiQuestionnaireTable(context);
                    break;
                case "delete"://删除数据
                    DeleteQuestionnaire(context);
                    break;
                case "look"://预览问卷
                    LookQuestionnaire(context);
                    break;
                case "copy"://复制问卷
                    CopyQuestionnaire(context);
                    break;
                case "update"://修改问卷
                    UpdateQuestionnaire(context);
                    break;
                case "checkName"://验证文件名称是否重复
                    CheckNameRepeat(context);
                    break;
                case "updateData"://修改问卷
                    UpdateQuestionnaire_Data(context);
                    break;
                case "AnswerGather":
                    AnswerGather(context);
                    break;
                case "getResponse":
                    GetResponse(context);
                    break;
                case "CheckAnwser":
                    CheckQuestionnaire_IsAnwser(context);
                    break;
            }
        }

        private void InitiQuestionnaireTable(HttpContext context)
        {
            try
            {
                int startPageIndex = 0;
                int endPageIndex = 0;
                if (Common.GetRequest("StartPageIndex") != null)
                    startPageIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                if (Common.GetRequest("EndPageIndex") != null)
                    endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                string questionnaireName = (Common.GetRequest("questionnaireName")).ToString();
                int? state = Convert.ToInt32(Common.GetRequest("state"));
                DateTime? startTime = null;
                if (!string.IsNullOrEmpty(Common.GetRequest("startTime")))
                {
                    startTime = Convert.ToDateTime(Common.GetRequest("startTime"));
                }
                else
                {
                    startTime = Convert.ToDateTime("1753-1-1");
                }
                DateTime? endTime = null;
                if (!string.IsNullOrEmpty(Common.GetRequest("endTime")))
                {
                    endTime = Convert.ToDateTime(Common.GetRequest("endTime"));
                }
                else
                {
                    endTime = Convert.ToDateTime("1753-1-1");
                }

                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                string uId = Common.GetSessionValue("UserID", context);
                if (uId == null)
                    return;
                var userId = Convert.ToInt32(uId);

                SourceTemps = MgrServices.QuestionnaireService.GetQuestionnaireInfo(userId, questionnaireName, state, startTime, endTime, _enterpriseCode, startPageIndex, endPageIndex);
                if (SourceTemps != null && SourceTemps.Tables[1].Rows.Count == 0)
                {
                    if (startPageIndex > 10)
                    {
                        startPageIndex = startPageIndex - 10;
                        endPageIndex = endPageIndex - 10;
                        SourceTemps = MgrServices.QuestionnaireService.GetQuestionnaireInfo(userId, questionnaireName, state, startTime, endTime, _enterpriseCode, startPageIndex, endPageIndex);

                    }
                }

                DataTable SourceTemp = new DataTable();
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
                                "",//0
                                "<input class='checkDistri' data-uid=\"" + DTR["UID"]+"\" data-code=\""+DTR["Code"]+"\" data-role=\""+DTR["RoleName"]+"\" type='checkbox' name='checkboxname' data-id ='" + DTR["id"] + "' data-name=\""+DTR["Name"]+"\"" + ">",//1
                                DTR["PageIndex"].ToString(),//2
                                DTR["Name"].ToString(),//3
                                DTR["CreatDate"].ToString(),//4
                                DTR["State"].ToString()=="0"?"未分配":"已分配",//5
                                DTR["id"].ToString(),//6
                                DTR["Code"].ToString(),//7
                                DTR["UID"].ToString(),//8
                                DTR["RoleName"].ToString(),//9
                                DTR["U_LoginName"].ToString(),//10
                                DTR["Is_Finish"].ToString(),//11
                                DTR["IsAnwser"].ToString(),//12是否作答
                                "" //操作13
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

        private void DeleteQuestionnaire(HttpContext context)
        {
            try
            {
                int result = 0;
                string quesId = string.Empty;
                string name = string.Empty;

                if (Common.GetRequest("id") != null)
                    quesId = Common.GetRequest("id");
                if (Common.GetRequest("names") != null)
                    name = Common.GetRequest("names");
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);

                string[] quesIds = quesId.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                string[] names = name.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                if (quesIds.Length > 0)
                {
                    for (int i = 0; i < quesIds.Length; i++)
                    {
                        CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                        model.RBTitle = "删除问卷管理-" + names[i]; //标题
                        model.RBModularID = 23; //对应模块权限ID
                        model.RBTableName = "Questionnaire_Info"; //删除的表名
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

            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建日期：2017/4/11
        /// 根据问卷编码，获取对应题干、题支信息
        /// 组合成JSon传到前台
        /// </summary>
        /// <param name="context"></param>
        private void LookQuestionnaire(HttpContext context)
        {
            try
            {
                string code = string.Empty;
                if (Common.GetRequest("quesCode") != null)
                    code = Common.GetRequest("quesCode");
                DataTable souce = MgrServices.QuestionnaireService.PreviewQuestionnaire(code);
                if (souce != null && souce.Rows.Count > 0)
                {
                    List<Questionnaire_CustomAdd.Questionnaire_JSonEntity> jsonList = new List<Questionnaire_CustomAdd.Questionnaire_JSonEntity>();


                    for (int i = 0; i < souce.Rows.Count; i++)
                    {
                        if (i == 0 || (souce.Rows[i]["S_Code"].ToString() != souce.Rows[i - 1]["S_Code"].ToString()))
                        {
                            Questionnaire_CustomAdd.Questionnaire_JSonEntity json = new Questionnaire_CustomAdd.Questionnaire_JSonEntity();
                            json.TG_Info = new Questionnaire_CustomAdd.Questionnaire_TG();
                            json.TG_Info.TG_Content = souce.Rows[i]["S_Content"].ToString();
                            json.TG_Info.Instruction = souce.Rows[i]["Instruction"].ToString();
                            json.TG_Info.Name = souce.Rows[i]["Name"].ToString();
                            json.TG_Info.TG_Type = Convert.ToInt32(souce.Rows[i]["Type"]);
                            json.TG_Info.TG_Code = souce.Rows[i]["S_Code"].ToString();
                            json.TG_Info.QuestionCode = souce.Rows[i]["Q_Code"].ToString();
                            json.TG_Info.TG_Sort = Convert.ToInt32(souce.Rows[i]["Sort"]);
                            if (souce.Rows[i]["Score"] != DBNull.Value)
                                json.TG_Info.TG_Score = souce.Rows[i]["Score"].ToString();
                            else
                                json.TG_Info.TG_Score = "";
                            json.TG_Info.TG_TrueAnswer = souce.Rows[i]["TrueAnwser"].ToString();

                            json.TZ_Info = new List<Questionnaire_CustomAdd.Questionnaire_TZ>();
                            if (json.TG_Info.TG_Type != 2 && json.TG_Info.TG_Type != 3)
                            {
                                for (int j = 0; j < souce.Rows.Count; j++)
                                {
                                    if (souce.Rows[j]["S_Code"].ToString() == json.TG_Info.TG_Code)
                                    {
                                        Questionnaire_CustomAdd.Questionnaire_TZ tz =
                                            new Questionnaire_CustomAdd.Questionnaire_TZ();
                                        tz.TZ_Code = souce.Rows[j]["O_Code"].ToString();
                                        tz.SerialNumber = souce.Rows[j]["SerialNumber"].ToString();
                                        tz.TZ_Content = souce.Rows[j]["O_Content"].ToString();
                                        tz.TZ_Num = Convert.ToInt32(souce.Rows[j]["SortCode"]);
                                        if (souce.Rows[j]["Fraction"] == DBNull.Value)
                                            tz.TZ_Score = "";
                                        else
                                            tz.TZ_Score = souce.Rows[j]["Fraction"].ToString();
                                        if (souce.Rows[j]["SkipCode"] != DBNull.Value)
                                            tz.TZ_Skip = souce.Rows[j]["SkipCode"].ToString();
                                        else
                                            tz.TZ_Skip = "";
                                        json.TZ_Info.Add(tz);
                                    }
                                }
                            }
                            jsonList.Add(json);
                        }
                    }
                    context.Response.Write(Common.ObjectToJson(jsonList));
                }
            }
            catch
            {
                context.Response.Write("");
            }
        }
        /// <summary>
        /// 复制问卷
        /// </summary>
        /// <param name="context"></param>
        private void CopyQuestionnaire(HttpContext context)
        {
            LookQuestionnaire(context);
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建日期：2017/4/13
        /// 点击修改按钮显示问卷题干题支信息
        /// </summary>
        /// <param name="context"></param>
        private void UpdateQuestionnaire(HttpContext context)
        {
            LookQuestionnaire(context);
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/14 9：20
        /// 验证问卷名称是否重复
        /// </summary>
        /// <param name="context"></param>
        private void CheckNameRepeat(HttpContext context)
        {
            int result = 0;

            string queName = string.Empty;
            if (Common.GetRequest("name") != null)
                queName = Common.GetRequest("name");
            string enterpriseCode = string.Empty;
            if (Common.GetSessionValue("EnterpriseCode", context) != null)
                enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            string quesCode = string.Empty;
            if (Common.GetRequest("code") != null)
                quesCode = Common.GetRequest("code");
            try
            {
                result = MgrServices.QuestionnaireService.CheckNameRepeat(queName, enterpriseCode, quesCode);
                context.Response.Write(result);
            }
            catch
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建日期：2017/4/13 18：18
        /// 更新修改后的问卷题支题干信息
        /// </summary>
        /// <param name="context"></param>
        private void UpdateQuestionnaire_Data(HttpContext context)
        {
            int result = 0;


            string queName = string.Empty;
            if (Common.GetRequest("name") != null)
                queName = Common.GetRequest("name");
            string instruct = string.Empty;
            if (Common.GetRequest("Guidance") != null)
                instruct = Common.GetRequest("Guidance");
            string json = string.Empty;
            if (Common.GetRequest("Json") != null)
                json = Common.GetRequest("Json");
            string quesCode = string.Empty;
            if (Common.GetRequest("code") != null)
                quesCode = Common.GetRequest("code");

            bool isFinish = Common.GetRequest("Is_Finish") == "true" ? true : false;//问卷是否完成

            try
            {
                result = MgrServices.QuestionnaireService.UpdateQuestionnaire(quesCode, json, queName, instruct, isFinish);
                context.Response.Write(result);
            }
            catch
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/27
        /// 根据问卷编码，获取所有该企业下作答的作答记录  
        /// </summary>
        /// <param name="context"></param>
        private void AnswerGather(HttpContext context)
        {
            try
            {
                string uName = string.Empty;
                string qCode = string.Empty;
                string dname = "";
                DateTime startTime = new DateTime();
                DateTime endTime = new DateTime();
                int startPage = 0;
                int endPage = 0;
                int UserId = 0;

                string _uId = Common.GetSessionValue("UserID", context);
                if (_uId != "")
                    UserId = Convert.ToInt32(_uId);

                if (Common.GetRequest("UName") != "")
                    uName = Common.GetRequest("UName");
                if (Common.GetRequest("Q_Code") != "")
                    qCode = Common.GetRequest("Q_Code");
                if (Common.GetRequest("D_ID") != "")
                    dname = Common.GetRequest("D_ID");
                if (Common.GetRequest("StartTime") != "")
                    startTime = Convert.ToDateTime(Common.GetRequest("StartTime"));
                if (Common.GetRequest("EndTime") != "")
                    endTime = Convert.ToDateTime(Common.GetRequest("EndTime"));
                if (Common.GetRequest("StartPageIndex") != "")
                    startPage = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                if (Common.GetRequest("EndPageIndex") != "")
                    endPage = Convert.ToInt32(Common.GetRequest("EndPageIndex"));


                PageInfo page = new PageInfo();
                DataSet sourceSet = MgrServices.QuestionnaireService.AnwserGather(UserId, qCode, uName, _enterpriseCode, dname, startTime, endTime,
                    startPage, endPage);
                if (sourceSet != null && sourceSet.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(sourceSet.Tables[0].Rows[0][0]);
                    DataTable sourceTable = sourceSet.Tables[1];
                    if (sourceTable != null && sourceTable.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in sourceTable.Rows)
                        {
                            String[] str =
                            {
                                "<input class='checkDistri' data-qdCode=\'"+DTR["QD_Code"]+"\'" +" data-qCode= \'"+DTR["Q_Code"]+
                                "\' type='checkbox' id ='"+DTR["id"]+"'>",//0
                                DTR["id"].ToString(),//作答ID 1
                                DTR["QD_Code"].ToString(),//分配编码 2
                                DTR["Q_Code"].ToString(),//问卷编码 3
                                DTR["Is_Anonymity"].ToString(),//是否是匿名作答的 4
                                DTR["Score"].ToString(),//得分 5
                                DTR["StartDate"].ToString(),//开始作答时间 6
                                DTR["U_LoginName"].ToString(),//登录名 7
                                DTR["U_Name"].ToString(),//姓名 8
                                DTR["D_name"].ToString(),//部门名称 9
                                DTR["PageIndex"].ToString(),//10

                            };
                            page.data.Add(str);
                        }
                    }
                }

                page.recordsFiltered = page.recordsTotal;
                context.Response.Write(Common.ObjectToJson(page));
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/10
        /// 根据问卷获取对应的作答记录
        /// </summary>
        /// <returns></returns>
        private void GetResponse(HttpContext context)
        {
            try
            {
                string code = string.Empty;
                if (Common.GetRequest("qcode") != null)
                    code = Common.GetRequest("qcode");
                string userID = Common.GetSessionValue("UserID", context);
                if (userID == null)
                    return;
                _enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
                int uId = Convert.ToInt32(Common.GetSessionValue("UserID", context));//企业ID 

                DataTable source = MgrServices.QuestionnaireService.GetResponse(code, uId, _enterpriseCode);
                PageInfo page = new PageInfo();
                if (source != null && source.Rows.Count > 0)
                {
                    foreach (DataRow item in source.Rows)
                    {
                        String[] str =
                        {
                            item["AnsRecord"].ToString(),//作答记录  0
                            item["AnwserPath"].ToString(),//题干的跳转路径
                            item["Score"].ToString(),//得分
                        };
                        page.data.Add(str);
                    }
                }
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            {
                context.Response.Write("");
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/6/2
        /// 在问卷修改并点击保存的时候，判断该问卷是否已经被作答
        /// 或者有人正在作答，有则阻止修改操作
        /// </summary>
        /// <param name="qCode">问卷编码</param>
        /// <returns></returns>
        private void CheckQuestionnaire_IsAnwser(HttpContext context)
        {
            try
            {
                string qcode = Common.GetRequest("_qcode");

                object obj = MgrServices.QuestionnaireService.CheckQuestionnaire_IsAnwser(qcode);
                context.Response.Write(Convert.ToInt32(obj));
            }
            catch
            {
                context.Response.Write(-1);
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