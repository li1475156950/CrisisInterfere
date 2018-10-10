using BR_Service;
using CrisisInterfere.DynamicEstimateService;
using CrisisInterfere.projrem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.RiskWarning.Ajax
{
    /// <summary>
    /// DynamicEstimate 的摘要说明
    /// </summary>
    public class DynamicEstimate : IHttpHandler, IRequiresSessionState
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
        public void GetNowLoginName(HttpContext context)
        {
            string name = context.Session["loginName"].ToString();
            context.Response.Write(name);
        }
        public void InitialTable(HttpContext context)
        {
            var SourceTemps = new DataSet();
            var sourceDataTable = new DataTable();
            var SourceTemp = new DataTable();
            var exportDt = new DataTable();
            exportDt.Columns.Add("登录名", typeof(String));
            exportDt.Columns.Add("姓名", typeof(String));
            exportDt.Columns.Add("性别", typeof(String));
            exportDt.Columns.Add("出生日期", typeof(String));
            exportDt.Columns.Add("部门",typeof(String));
            exportDt.Columns.Add("预警级别", typeof(String));
            exportDt.Columns.Add("评估日期", typeof(String));
            var searchModel = JsonConvert.DeserializeObject<DynamicEstimateSearchModel>(Common.GetRequest("searchModel"));
            searchModel.UserID = Convert.ToInt32(context.Session["UserID"].ToString());
            SourceTemps = MgrServices.DynamicEstimateService.InitialDynamicEstimateTable(searchModel);
            searchModel.EndIndex = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
            sourceDataTable = MgrServices.DynamicEstimateService.InitialDynamicEstimateTable(searchModel).Tables[1];
            foreach (DataRow DTR in sourceDataTable.Rows)
            {
                var dr = exportDt.NewRow();
                dr["登录名"] = DTR["U_LoginName"].ToString();
                dr["姓名"] = DTR["U_Name"].ToString();
                dr["性别"] = DTR["U_Sex"].ToString();
                dr["出生日期"] = Convert.ToDateTime(DTR["U_Birthday"]).ToString("yyyy-MM-dd");
                dr["部门"] = DTR["D_name"].ToString();
                dr["预警级别"] = DTR["WLName"].ToString();
                dr["评估日期"] = Convert.ToDateTime(DTR["CreateTime"]).ToString("yyyy-MM-dd");
                exportDt.Rows.Add(dr);
            }
            context.Session["ExportExcel"] = exportDt;
            var page = new PageInfo();
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
                                "",
                                DTR["PageIndex"].ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["U_Sex"].ToString(),
                               DTR["U_Birthday"].ToString()==""?"": Common.CalculateAgeCorrect(Convert.ToDateTime(DTR["U_Birthday"]),DateTime.Now).ToString(),
                                DTR["D_name"].ToString(),
                                DTR["WLName"].ToString(),
                                DTR["CreateTime"].ToString(),
                                "",
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
        public void AddDynamicEstimate(HttpContext context)
        {
            var dynamicEstimateReportModel = JsonConvert.DeserializeObject<DynamicEstimateReportModel>(Common.GetRequest("dynamicEstimateReportModel"));
            dynamicEstimateReportModel.CounselorID = Convert.ToInt32(context.Session["UserID"]);
            var resultModel = new ResultViewModel();
            if (MgrServices.DynamicEstimateService.AddDynamicEstimate(dynamicEstimateReportModel) > 0)
            {
                resultModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            resultModel.State = false;
            resultModel.Data = "添加动态评估失败，未知原因";
            context.Response.Write(JsonConvert.SerializeObject(resultModel));
        }
        public void GetDynamicEstimateReportInfo(HttpContext context)
        {
            var userID = Common.GetRequest("userID");
            var modelList = MgrServices.DynamicEstimateService.GetDynamicEstimateByUserID(userID);
            context.Response.Write(JsonConvert.SerializeObject(modelList));
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
            CommonMethod.Ajax.CommonMethod.ExportExcelByEPPlus(context, dt, "动态评估" + DateTime.Now.ToString("yyyy-MM-dd HHmmss"), "动态评估人员名单");
        }
        public void DeleteDynamic(HttpContext context)
        {
            var id = Convert.ToInt32(Common.GetRequest("id"));
            var resultModel = new ResultViewModel();
            if (MgrServices.DynamicEstimateService.DeleteDynamicEstimate(id) > 0)
            {
                resultModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            resultModel.State = false;
            resultModel.Data = "删除失败,原因不明";
            context.Response.Write(JsonConvert.SerializeObject(resultModel));
        }
        public void AbsoluteDeleteDynamicEstimate(HttpContext context)
        {
            var userID = Convert.ToInt32(Common.GetRequest("userID"));
            var resultModel = new ResultViewModel();
            if (MgrServices.DynamicEstimateService.AbsoluteDeleteDynamicEstimate(userID)>0)
            {
                resultModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            resultModel.State = false;
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