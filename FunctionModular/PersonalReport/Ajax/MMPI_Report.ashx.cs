using BR_Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.SpecialCalculationService;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.PersonalReport.Ajax
{
    /// <summary>
    /// MMPI_Report 的摘要说明
    /// </summary>
    public class MMPI_Report : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //string isTimeOut = Common.GetSessionValue("UserID", context);
            //if (isTimeOut == null)
            //    return;
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string Remark = Common.GetRequest("Remark");
            switch (Remark)
            {
                case "GetResult":
                    GetResultJson(context);
                    break;

            }
        }

        /// <summary>
        /// 获取MMPI特殊量表的测评报告数据
        /// </summary>
        /// <param name="context"></param>
        private void GetResultJson(HttpContext context)
        {
            try
            {
                int AID = Convert.ToInt32(Common.GetRequest("A_ID"));
                List<MMPI_Result_Json> MMPI_List = new List<MMPI_Result_Json>();
                MMPI_List = MgrServices.SpecialCalculationService.GetMMPI_Json(AID);
                if (MMPI_List != null && MMPI_List.Count > 0)
                {
                    context.Response.Write(new JavaScriptSerializer().Serialize(MMPI_List));
                }
                else
                {
                    context.Response.Write("NOTHING");
                }
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