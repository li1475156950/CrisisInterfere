using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using CrisisInterfere.BasicSetting_UserInfo;

namespace CrisisInterfere.FunctionModular.PersonalReport.Ajax
{
    /// <summary>
    /// AddTemplate 的摘要说明
    /// </summary>
    public class AddTemplate : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
             string operationType = Common.GetRequest("operationType");
             switch (operationType)
             {
                 case "LoadTemplate":
                     LoadTemplate(context);
                     break;
                 case "Save":
                     Save(context);
                     break;
             }
        }

        public void LoadTemplate(HttpContext context)
        {
            UTemplateEntity UT = MgrServices.UserAddService.GetUTEntity();

            context.Response.Write(JsonConvert.SerializeObject(UT));
        }
        public void Save(HttpContext context)
        {
            UTemplateEntity UT = new UTemplateEntity();
            UT._addfiletemplate = context.Request["strJson"];
            UT._createtime = DateTime.Now;
            UT._u_id = 1;
           bool result=   MgrServices.UserAddService.UTemplateUpdate(UT);
           context.Response.Write(JsonConvert.SerializeObject(result));
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