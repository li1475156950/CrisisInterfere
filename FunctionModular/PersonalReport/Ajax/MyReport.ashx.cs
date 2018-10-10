using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using CrisisInterfere.BasicSetting_UserInfo;

namespace CrisisInterfere.FunctionModular.PersonalReport.Ajax
{
    /// <summary>
    /// MyReport 的摘要说明
    /// </summary>
    public class MyReport : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            var Jsons = "";
            var Type = context.Request["type"];
            if (Type == "0")
            {
                Jsons = context.Request["Json"];
                context.Session["Json"] = Jsons;
            }
            else if(Type=="1")
            {
                Jsons = context.Session["Json"].ToString();
            }
            else if (Type == "3")
            {
               Jsons= GetUserInfo(context);
            }
            context.Response.Write(Jsons);
        }

        public string GetUserInfo(HttpContext context)
        {
            U_UserInfoEntity entity = new U_UserInfoEntity();
            string loginName = context.Request["loginName"];
            entity = MgrServices.UserAddService.GetEntity(loginName);
          string json=  JsonConvert.SerializeObject(entity);
          return json;
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