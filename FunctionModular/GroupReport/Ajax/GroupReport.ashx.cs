using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using BR_Service;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.GroupReport.Ajax
{
    /// <summary>
    /// GroupReport 的摘要说明
    /// </summary>
    public class GroupReport : IHttpHandler,IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string operationType = Common.GetRequest("OperationType");
            switch (operationType)
            {
                case"Bind":
                    Bind(context);
                    break;
                case "DeleteGroupReport":
                    DeleteGroupReport(context);
                    break;
                default:
                    break;
            }
        }
        public void Bind(HttpContext context)
        {
            var reportName = Common.GetRequest("reportName");
            var startDate = Common.GetRequest("startDate");
            var endDate = Common.GetRequest("endDate");
            var startPageIndex = Convert.ToInt32(Common.GetRequest("startPageIndex"));
            var endPageIndex = Convert.ToInt32(Common.GetRequest("endPageIndex"));
            var enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;
            string _userID = Common.GetSessionValue("UserID", context);
            if (_userID == null)
                return;
            var userID = Convert.ToInt32(_userID);
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = MgrServices.GroupReportService.InitiGroupReportTable(userID,reportName,startDate,endDate,startPageIndex,endPageIndex,enterpriseCode);
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
                                "<input class='checkGroupReport' data-amountCode ='"+DTR["Amount_Code"]+"' data-grID='"+DTR["GR_ID"]+"' data-ReportName='"+DTR["GR_Name"]+"' type='checkbox'>",
                                DTR["PageIndex"].ToString(),
                                DTR["GR_Name"].ToString(),
                                DTR["GR_CreateTime"].ToString(),
                                ""
                                

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
        public void DeleteGroupReport(HttpContext context)
        {
            bool isSuccess = true;
            var grid = Common.GetRequest("grid");
            var Report = Common.GetRequest("ReportName");
            string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            var ReportName =Report.Split(',');
            var gridArray = grid.Split(',');
            for (int i = 0; i < gridArray.Length; i++)
			{
			    if(!string.IsNullOrEmpty(gridArray[i]))
                {
                    CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                    model.RBTitle = "删除团体报告-"+ReportName[i];   //标题
                    model.RBModularID = 17; //对应模块权限ID
                    model.RBTableName = "Group_Report"; //删除的表名
                    model.RBFieldName = "GR_ID"; //删除相对应字段的id
                    model.RBFieldValue = gridArray[i];//删除的具体id
                    model.RBDeleteFieldName = "GR_IsDelete"; //删除的字段
                    model.RBDeleteTime = DateTime.Now;
                    model.EnterpriseCode = enterpriseCode;
                    model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                    if (model.RBExcutePerson == null)
                        return;
                    isSuccess = MgrServices.RecycleBinService.PutDataInRecycleBin(model);
                    if(!isSuccess)
                    {
                        break;
                    }
                }
			}
            
            context.Response.Write(isSuccess);
            //if(MgrServices.GroupReportService.DeleteGroupReport(grid))
            //{
            //    context.Response.Write(true);
            //}
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