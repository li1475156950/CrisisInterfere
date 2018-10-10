using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.HeartEvaluation.Ajax
{
    /// <summary>
    /// 创建人:李超
    /// 创建日期:2016/11/3
    /// 类阐述:查看结果业务逻辑一般处理程序
    /// </summary>
    public class ViewResult : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case "Bind":
                    Bind(context);
                    break;
                case "DeleteViewResult":
                    DeleteViewResult(context);
                    break;
                case "LookType":
                    GetLookType(context);
                    break;
            }
        }
        public void Bind(HttpContext context)
        {
            var pageStartIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
            var pageEndIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
            string amountID = context.Request["nameLB"] == "" ? "" : context.Request["nameLB"].ToString();//部门
            // int amountID = 0;
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                string rid = Common.GetSessionValue("role_type", context);

                var userID = Convert.ToInt32(_uID);
                SourceTemps = MgrServices.AnswerAddService.InitiViewResultTable(userID, amountID, pageStartIndex, pageEndIndex);
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
                                 "<input class='checkAnswerAdd' data-name= '"+DTR["Amount_DisplayName"]+"' data-id='"+DTR["AnswerAdd_ID"]+"' type='checkbox' />",
                                 DTR["PageIndex"].ToString(),
                                 rid=="3"?DTR["Amount_DisplayName"].ToString():DTR["Amount_Name"].ToString(),
                                 DTR["Answer_CreateTime"].ToString(),                           
                                 "",//操作
                                 DTR["Amount_Code"].ToString(),//5
                                 DTR["Amount_Source"].ToString(),//6
                                 DTR["AnswerAdd_ID"].ToString(),//7
                                 DTR["BelongToAmount"].ToString()==""?DTR["Amount_Code"].ToString():DTR["BelongToAmount"].ToString(),
                                 DTR["BelongToCode"].ToString()
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
        /// 创建人:李超
        /// 创建时间:2016/11/4
        /// 方法阐述:创建删除查看结果的方法
        /// </summary>
        /// <param name="context"></param>
        public void DeleteViewResult(HttpContext context)
        {
            try
            {
                bool result = false;

                string[] str = Common.GetRequest("answerAddID").Split(',');
                string[] name = context.Request["name"].Split(',');
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                for (int i = 0; i < str.Length; i++)
                {
                    if (!string.IsNullOrEmpty(str[i]))
                    {
                        CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                        model.RBTitle = "删除查看结果-" + name[i] + ""; //标题
                        model.RBModularID = 20; //对应模块权限ID
                        model.RBTableName = "AnswerAdd"; //删除的表名
                        model.RBFieldName = "AnswerAdd_ID"; //删除相对应字段的id
                        model.RBFieldValue = str[i].ToString();//删除列名的id
                        model.RBDeleteFieldName = "AnswerIsDelete"; //表的删除字段一般 某某某_Delete
                        model.RBDeleteTime = DateTime.Now;
                        model.EnterpriseCode = enterpriseCode;
                        model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                        if (model.RBExcutePerson == null)
                            return;
                        result = Convert.ToBoolean(MgrServices.RecycleBinService.PutDataInRecycleBin(model));

                    }
                }
                context.Response.Write(result);
            }
            catch (Exception ex)
            {
                context.Response.Write(false);
            }
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-12-30
        /// 功能介绍：检测当前结果的查看状态
        /// </summary>
        /// <param name="context"></param>
        public void GetLookType(HttpContext context)
        {
            try
            {
                int AID = Convert.ToInt32(Common.GetRequest("A_ID"));
                int type = MgrServices.AnswerAddService.GetLookType(AID);
                context.Response.Write(type);

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