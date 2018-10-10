using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using BR_Service;
using Newtonsoft.Json;

namespace CrisisInterfere.FunctionModular.Questionnaire_Record.Ajax
{
    /// <summary>
    /// 创建人：田闯
    /// 创建时间：2017/4/17
    /// 问卷的分配记录模块操作方法类
    /// Questionnaire_Record 的摘要说明
    /// </summary>
    public class Questionnaire_Record : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "LoadAnswerStatusName":
                    InitiDistributeRecordTable(context);
                    break;
                case "BindDis":
                    InitiDistributeRecordTable(context);
                    break;
                case "BeforeDelete":
                    BeforeDelete(context);
                    break;
                case "DeleteDistributeRecord":
                    DeleteDistributeRecord(context);
                    break;
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/17
        /// 获取分配记录数据
        /// </summary>
        /// <param name="context"></param>
        public void InitiDistributeRecordTable(HttpContext context)
        {
            int startPageIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
            int endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
            string quesName = Common.GetRequest("quesName");
            int departmentID = Convert.ToInt32(Common.GetRequest("departmentID"));
            int ansID = Convert.ToInt32(Common.GetRequest("ansID"));
            string loginName = string.Empty;
            if (!string.IsNullOrEmpty(Common.GetRequest("loginName")))
            {
                loginName = Common.GetRequest("loginName");
            }
            DateTime? distriStartTime = null;
            if (!string.IsNullOrEmpty(Common.GetRequest("distriStartTime")))
            {
                distriStartTime = Convert.ToDateTime(Common.GetRequest("distriStartTime"));
            }
            else
            {
                distriStartTime = Convert.ToDateTime("1753-1-1");
            }
            DateTime? distriEndTime = null;
            if (!string.IsNullOrEmpty(Common.GetRequest("distriEndTime")))
            {
                distriEndTime = Convert.ToDateTime(Common.GetRequest("distriEndTime"));
            }
            else
            {
                distriEndTime = Convert.ToDateTime("1753-1-1");
            }
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                int userID = Convert.ToInt32(_uID);
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (enterpriseCode == null)
                    return;
                SourceTemps = MgrServices.QuestionnaireService.InitiDistributeRecordTable(userID, enterpriseCode, ansID, quesName, loginName, departmentID, distriStartTime, distriEndTime, ansID, startPageIndex, endPageIndex);
                if (SourceTemps == null || SourceTemps.Tables[1].Rows.Count == 0)
                {
                    if (startPageIndex > 10)
                    {
                        startPageIndex = startPageIndex - 10;
                        endPageIndex = endPageIndex - 10;
                        SourceTemps = MgrServices.QuestionnaireService.InitiDistributeRecordTable(userID, enterpriseCode, ansID, quesName, loginName, departmentID, distriStartTime, distriEndTime, ansID, startPageIndex, endPageIndex);

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
                            string state = "";//1是未作答，2是已经作答

                            if (DTR["Answer_states"].ToString() == null || DTR["Answer_states"].ToString() == "0")
                            {
                                state = "未作答";
                            }
                            else if (Convert.ToInt32(DTR["Answer_states"]) > 0)
                            {
                                state = "已作答";
                            }
                            String[] arr =
                            {
                                "",//0
                                "<input class='checkDistri' data-uid='"+DTR["Dis_UID"]+"' type='checkbox' data-name='"+DTR["U_LoginName"]+"' id ='"+DTR["id"]+"'>",//1
                                DTR["PageIndex"].ToString(),//2
                                DTR["Name"].ToString(),//3
                                DTR["U_LoginName"].ToString(),//4
                                DTR["U_Name"].ToString(),//5
                                DTR["CreateDate"].ToString(),//分配时间6
                                state,//7
                                DTR["Is_Anonymity"].ToString(),//8
                                DTR["Q_Code"].ToString(),//9
                                DTR["Code"].ToString(),//10
                                DTR["D_name"].ToString(),//11
                                ""//操作12
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
        /// 创建时间：2017/6/5
        /// 在删除分配记录之前先根据分配ID查询一下
        /// 是否有对应的作答记录
        /// </summary>
        /// <returns></returns>
        public void BeforeDelete(HttpContext context)
        {
            try
            {
                string updateID = "";//要更新的分配记录
                string deleteID = "";//要删除的分配记录
                string ids = Common.GetRequest("ids");
                DataTable dt = MgrServices.QuestionnaireService.BeforeDelete(ids);
                if (dt != null && dt.Rows.Count > 0)
                {
                    foreach (DataRow item in dt.Rows)
                    {
                        if (item["anwser"].ToString() == "0")
                            deleteID += item["id"] + ",";
                        else
                            updateID += item["id"] + ",";
                    }
                    String str = Common.ObjectToJson(new string[] { updateID, deleteID });
                    context.Response.Write(str);
                }
            }
            catch
            {
                context.Response.Write("");
            }
        }

        /// <summary>
        /// 删除分配记录信息
        /// </summary>
        /// <param name="context"></param>
        public void DeleteDistributeRecord(HttpContext context)
        {
            var isSuccess = true;
            string[] str = Common.GetRequest("distriID").Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries).ToArray();
            string[] str_dele = Common.GetRequest("deleID").Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries).ToArray();
            if (str.Length == 0 && str_dele.Length == 0)
            {
                context.Response.Write(false);
                return;
            }
            int result = MgrServices.QuestionnaireService.DeleteDistributeRecord(str, str_dele);
            isSuccess = result <= 0 ? false : true;
            context.Response.Write(isSuccess);
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