using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// ExcelImport 的摘要说明
    /// </summary>
    public class ExcelImport : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            int Type = Convert.ToInt32(Common.GetRequest("type"));
            string Name = Common.GetSessionValue("loginName", context);
            if (Name == null)
                return;
            if (Type == 1)
            {
                string fileName = context.Request["filename"];    //文件路径
                fileName = fileName.Substring(fileName.LastIndexOf('\\') + 1);

                HttpPostedFile uploadFile = context.Request.Files[0];
                //Upload(uploadFile, context);
                context.Response.Write(Upload(uploadFile, Name, context));

            }

        }
        public string Upload(HttpPostedFile fileUpload, string Name, HttpContext context)
        {
            string json = "";
            if (fileUpload == null)
            {
                return json;
            }
            try
            {
                string sheetname = "Sheet1";
                string UploadPath = context.Server.MapPath("/FunctionModular/BasicSetting/SaveFile/");
                string filename = Common.Upload(fileUpload, UploadPath);
                //将硬盘路径转化为服务器路径的文件流      

                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return null;

                //NPOI得到EXCEL的第一种方法                        
                string GetExcel = MgrServices.UserAddService.ExcelImport(filename, Name, EnterpriseCode);
                json = JsonConvert.SerializeObject(GetExcel);
                return json;

            }
            catch
            {
                return json;
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