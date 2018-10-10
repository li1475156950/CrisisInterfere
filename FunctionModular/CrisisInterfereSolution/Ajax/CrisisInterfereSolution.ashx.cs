using BR_Service;
using CrisisInterfere.CrisisInterfereSolutionService;
using CrisisInterfere.projrem;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.CrisisInterfereSolution.Ajax
{
    /// <summary>
    /// CrisisInterfereSolution 的摘要说明
    /// </summary>
    public class CrisisInterfereSolution : IHttpHandler
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
            var searchModel = JsonConvert.DeserializeObject<CrisisInterfereSolutionSearchModel>(Common.GetRequest("searchModel"));
            try
            {
                SourceTemps = MgrServices.CrisisInterfereSolutionService.InitialTable(searchModel);
            }
            catch (Exception)
            {

                throw;
            }
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
                                "",
                                DTR["PageIndex"].ToString(),
                                DTR["CISTitle"].ToString(),
                                DTR["STName"].ToString(),
                                "",
                                DTR["CISID"].ToString()
                            };
                        page.data.Add(arr);
                    }

                }
            }

            page.recordsFiltered = page.recordsTotal;
            String json = Common.ObjectToJson(page);
            context.Response.Write(json);
        }
        public void GetCrisisInterfereSolutionByID(HttpContext context)
        {
            var cISID = Convert.ToInt32(Common.GetRequest("CISID"));
            context.Response.Write(MgrServices.CrisisInterfereSolutionService.GetCrisisInterfereSolutionContentByID(cISID));
        }
        public void AddCrisisInterfereSolution(HttpContext context)
        {
            var model = JsonConvert.DeserializeObject<CrisisInterfereSolutionModel>(Common.GetRequest("entityStr"));
            var resultModel = new ResultViewModel();
            if (MgrServices.CrisisInterfereSolutionService.AddCrisisInterfereSolution(model) > 0)
            {
                resultModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            resultModel.State = false;
            resultModel.Data = "添加解决方案失败";
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