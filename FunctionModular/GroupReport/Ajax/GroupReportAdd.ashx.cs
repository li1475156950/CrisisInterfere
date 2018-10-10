using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.projrem;
using CrisisInterfere.RoleService;
using CrisisInterfere.TestTypeService;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// 创建人:李超
    /// 创建日期:2016/11/19
    /// 一般处理程序介绍:处理团体报告业务逻辑的一般处理程序
    /// </summary>
    public class GroupReportAdd : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case "InitiAmountName":
                    InitiAmountName(context);
                    break;
                case "InitiRole":
                    InitiRole(context);
                    break;
                case "InitiTestType":
                    InitiTestType(context);
                    break;
                case "Bind":
                    InitiMemberChoose(context);
                    break;
                case "CreateGroupReport":
                    CreateGroupReport(context);
                    break;
                case "JundgeReportName":
                    JundgeReportName(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 创建人:李超
        /// 创建时间:2016/11/19
        /// 方法阐述:初始化量表名称
        /// </summary>
        /// <param name="context"></param>
        public void InitiAmountName(HttpContext context)
        {
            try
            {
                var enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (enterpriseCode == null)
                    return;
                DataTable SourceTemp = new DataTable();
                SourceTemp = MgrServices.AmountService.GetGRAmountNameList(enterpriseCode).Tables[0];
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["Amount_DisplayName"].ToString();
                        mex.Value = DTR["Amount_Code"].ToString();
                        listT.Add(mex);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }

            }
            catch
            {

            }
        }
        /// <summary>
        /// 创建人:李超
        /// 创建日期:2016/11/19
        /// 方法阐述:得到所有角色绑定到select下拉框中
        /// </summary>
        /// <param name="context"></param>
        public void InitiRole(HttpContext context)
        {
            List<RoleEntity> lr = MgrServices.RoleService.GetAllRole();
            if (lr.Count > 0)
            {
                ComboxMes mex = new ComboxMes();
                List<ComboxMes> listT = new List<ComboxMes>();
                foreach (var DTR in lr)
                {
                    mex = new ComboxMes();
                    mex.Text = DTR.Role_Name;
                    mex.Value = DTR.Role_ID.ToString();
                    listT.Add(mex);
                }
                context.Response.Write(new JavaScriptSerializer().Serialize(listT));
            }
        }
        /// <summary>
        /// 创建人:李超
        /// 创建日期:2016/11/21
        /// 方法阐述:加载测试类型下拉框
        /// </summary>
        /// <param name="context"></param>
        public void InitiTestType(HttpContext context)
        {
            List<TestTypeEntity> te = new List<TestTypeEntity>();
            te = MgrServices.TestTypeService.GetAllTestType();
            if (te.Count > 0)
            {
                ComboxMes mex = new ComboxMes();
                List<ComboxMes> listT = new List<ComboxMes>();
                foreach (var DTR in te)
                {
                    mex = new ComboxMes();
                    mex.Text = DTR.TTName;
                    mex.Value = DTR.TTID.ToString();
                    listT.Add(mex);
                }
                context.Response.Write(new JavaScriptSerializer().Serialize(listT));
            }
        }
        /// <summary>
        /// 创建人:李超
        /// 创建日期:2016/11/21
        /// 方法阐述:加载添加团体报告选择成员列表
        /// </summary>
        /// <param name="context"></param>
        public void InitiMemberChoose(HttpContext context)
        {
            string _userID = Common.GetSessionValue("UserID", context);
            if (_userID == null)
                return;
            CrisisInterfere.AnswerAddService.MemberChooseQueryModel model = new AnswerAddService.MemberChooseQueryModel()
            {
                AmountCode = Common.GetRequest("amountCode"),
                DepartmentID = Convert.ToInt32(Common.GetRequest("departmentID")),
                EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex")),
                Gender = Common.GetRequest("gender"),
                //MaxAge = Convert.ToInt32(Common.GetRequest("maxAge")),
                //MinAge = Convert.ToInt32(Common.GetRequest("minAge")),
                RoleID = Convert.ToInt32(Common.GetRequest("roleID")),
                StartPageIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex")),
                TestName = Common.GetRequest("testName").Trim(),
                UserID = Convert.ToInt32(_userID)
            };
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = MgrServices.AnswerAddService.InitiMemberChoose(model);
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
                                "<input class='checkMemberChoose' data-uid='"+DTR["U_ID"]+"' data-amountcode='"+DTR["Amount_Code"]+"' data-answerAddID='"+DTR["AnswerAdd_ID"]+"' data-loginName='"+DTR["U_LoginName"]+"' data-userName='"+DTR["U_Name"]+"' data-department='"+DTR["D_Name"]+"' data-age='"+DTR["U_Age"]+"' data-gender='"+DTR["U_Sex"]+"' data-submitDate = '"+DTR["Answer_CreateTime"]+"' type='checkbox'>",
                                DTR["PageIndex"].ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["Answer_CreateTime"].ToString(),
                                

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
        public void CreateGroupReport(HttpContext context)
        {
            var reportName = Common.GetRequest("reportName");
            var amountCode = Common.GetRequest("amountCode");
            var userIDList = Common.GetRequest("userIDList");
            var ansIDList = Common.GetRequest("ansIDList");
            var createPerson = Common.GetSessionValue("UserID", context);
            if (createPerson == null)
                return;
            if (MgrServices.GroupReportService.AddGroupReport(ansIDList,reportName, amountCode, userIDList, createPerson))
            {
                context.Response.Write(true);
            }

        }
        public void JundgeReportName(HttpContext context)
        {
            var reportName = Common.GetRequest("reportName");
            var enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;
            context.Response.Write(MgrServices.GroupReportService.GetReportByReportName(reportName,enterpriseCode)>0);
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