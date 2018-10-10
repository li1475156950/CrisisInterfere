using BR_Service;
using CrisisInterfere.MemberArchivesService;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.ArchivesManagement.Ajax
{
    /// <summary>
    /// MemberArchives 的摘要说明
    /// </summary>
    public class MemberArchives : IHttpHandler,IRequiresSessionState
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
            var SourceTemps = new DataSet();
            var SourceTemp = new DataTable();
            var searchModel = JsonConvert.DeserializeObject<MemberArchivesSearchModel>(Common.GetRequest("searchModel"));
            searchModel.UserID = Convert.ToInt32(context.Session["UserID"].ToString());
            SourceTemps = MgrServices.MemberArchivesService.InitialTable(searchModel);
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
                                Common.CalculateAgeCorrect(Convert.ToDateTime(DTR["U_Birthday"]),DateTime.Now).ToString(),
                                DTR["D_name"].ToString(),
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
        public void GetConsultRecord(HttpContext context)
        {
            var userID = Convert.ToInt32(Common.GetRequest("userID"));
            var resultList = MgrServices.MemberArchivesService.GetConsultRecord(userID);
            context.Response.Write(JsonConvert.SerializeObject(resultList));
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