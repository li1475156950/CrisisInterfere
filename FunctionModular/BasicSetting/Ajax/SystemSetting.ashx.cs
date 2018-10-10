using BR_Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrisisInterfere.SystemSettingService;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// SystemSetting 的摘要说明
    /// </summary>
    public class SystemSetting : IHttpHandler, IRequiresSessionState
    {
        

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string IP = Convert.ToString(context.Request["IP"]);
            string Emailtype = Convert.ToString(context.Request["Emailtype"]);
            string Emailname = Convert.ToString(context.Request["Emailname"]);
            string EmaliPwd = Convert.ToString(context.Request["EmaliPwd"]);
            int SystemID=1;
            SystemSettingEntity model = new SystemSettingEntity();
            model._ipaddress = IP;
            model._emailtype = Emailtype;
            model._emailname = Emailname;
            model._emailpwd = EmaliPwd;
            model._systemid = SystemID;
            if (MgrServices.SystemSettingService.SSUpdate(model))
            { 
             context.Response.Write("1");
            }
            else
            {
           context.Response.Write("0");
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