using BR_Service;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace CrisisInterfere.FunctionModular.BasicSetting
{
    public partial class AddMember : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //string Paths = Server.MapPath("SaveFile/成员批量导入模板(红色为必填项).xls");//路径
            //OptConfig("EportExcel", Paths);
        }
        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void submit1_Click(object sender, EventArgs e)
        {
            try
            {


                //string EportExcel = ConfigurationManager.AppSettings["EportExcel"].ToString();
                //string fileName = "批量导入成员信息.xls";//客户端保存的文件名
             
                //string filePath = EportExcel;
                ////以字符流的形式下载文件
                //FileStream fs = new FileStream(filePath, FileMode.Open);
                //byte[] bytes = new byte[(int)fs.Length];
                //fs.Read(bytes, 0, bytes.Length);
                //fs.Close();
                //Response.ContentType = "application/octet-stream";
                ////通知浏览器下载文件而不是打开
                //Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
                //Response.BinaryWrite(bytes);
                //Response.Flush();
                //Response.End();
            }
            catch
            {
                
            }
        }

        private void OptConfig(string AppKey, string AppValue)
        {
            try
            {
                Assembly Asm = Assembly.GetExecutingAssembly();
                XmlDocument xmlDoc = new XmlDocument();
                //string info = Server.MapPath("../web.config");
              string info =  Server.MapPath("..") + "\\" + "../web.config";
                xmlDoc.Load(info);
                XmlDocument xDoc = new XmlDocument();
                xDoc.Load(info);
                XmlNode xNode;
                XmlElement xElem1;
                XmlElement xElem2;
                xNode = xDoc.SelectSingleNode("//appSettings");
                xElem1 = (XmlElement)xNode.SelectSingleNode("//add[@key='" + AppKey + "']");
                if (xElem1 != null)
                {
                    xElem1.SetAttribute("value", AppValue);
                }
                else
                {
                    xElem2 = xDoc.CreateElement("add");
                    xElem2.SetAttribute("key", AppKey);
                    xElem2.SetAttribute("value", AppValue);
                    xNode.AppendChild(xElem2);
                }
                xDoc.Save(info);
            }
            catch (System.NullReferenceException NullEx)
            {
                throw NullEx;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
       
    }
   
}