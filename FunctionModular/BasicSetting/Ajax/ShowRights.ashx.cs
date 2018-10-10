using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// ShowRights 的摘要说明
    /// </summary>
    public class ShowRights : IHttpHandler, IRequiresSessionState
    {
        FunctionService.FunctionServiceClient fs = new FunctionService.FunctionServiceClient();
        public void ProcessRequest(HttpContext context)
        {
            //string isTimeOut = Common.GetSessionValue("UserID", context);
            //if (isTimeOut == null)
            //    return;

            string operationType = Common.GetRequest("operationType");
            
            switch (operationType)
            {
                case "LoadFirstFun":
                    LoadFirstFun(context);
                    break;
                case"LoadSecondFun":
                    LoadSecondFun(context);
                    break;
                case"LoadThirdFun":
                    LoadThirdFun(context);
                    break;
                default:
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public void LoadFirstFun(HttpContext context) 
        {
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.FunctionService.GetFunByFunType(1)));
        }
        public void LoadSecondFun(HttpContext context)
        {
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.FunctionService.GetFunByFunType(2)));
        }
        public void LoadThirdFun(HttpContext context)
        {
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.FunctionService.GetFunByFunType(3)));
        }
    }
}