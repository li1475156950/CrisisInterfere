using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.TeachingPlan
{
    /// <summary>
    /// Ajax 的摘要说明
    /// </summary>
    public class Ajax : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";         
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "Bind":// 绑定列表
                    Bind(context);
                    break;              
            }

          
        }
        public void Bind(HttpContext context)
        {
            int startRowIndex = Convert.ToInt32(Common.GetRequest("startRowIndex"));// 行开始下标
            int endRowIndex = Convert.ToInt32(Common.GetRequest("endRowIndex"));// 行结束下标
            DataSet ds = MgrServices.GroupConsultationService.GetTeachingPlanList(startRowIndex, endRowIndex);// 数据源
            DataTable tempDataTable;// 数据源
            try
            {
                // 实例化分页实体
                PageInfo page = new PageInfo();
                // 获取结果集


                // 结果集不为空 或者 为相应结果集数量
                if (ds != null && ds.Tables.Count == 2)
                {

                    // 获取总行数
                    page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0]["total"]);
                    // 获取 问题类型集
                    tempDataTable = ds.Tables[1];
                    foreach (DataRow dr in tempDataTable.Rows)
                    {

                        // 返回参数
                        String[] arr =
                            {  
                              
                                dr["PageIndex"].ToString(),                               
                                dr["CTitle"].ToString(),
                                dr["CPath"].ToString(),                             
                                dr["Qtype"].ToString(),                                                          
                                ""
                               
                            };
                        page.data.Add(arr);
                    }
                }

                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);

            }
            catch (Exception)
            {

                throw;
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