using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace CrisisInterfere.projrem
{
    public static class EmailHelper
    {
        public static void SendEmail(string receiverEmail,string subject,string content)
        {
            //string email = "wkregister566@163.com";
            MailMessage mailMsg = new MailMessage();
            mailMsg.From = new MailAddress("13716821353@163.com");
            mailMsg.To.Add(receiverEmail);
            //mailMsg.Subject = "请激活注册";
            mailMsg.Subject = subject;
            //StringBuilder contentBuilder = new StringBuilder();
            //contentBuilder.Append("请单击以下链接完成激活");
            ////contentBuilder.Append("<a href='http://localhost:15464/cheng.aspx?activecode=" + activeCode + "&userId=" + 1 + "'>激活</a>");
            mailMsg.Body = content;//拼接字符串 
            mailMsg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            //发件方服务器地址 
            client.Host = "smtp.163.com";
            client.Port = 25;
            client.EnableSsl = true;
            //mailMsg.IsBodyHtml = true; 
            NetworkCredential credetial = new NetworkCredential();
            credetial.UserName = "13716821353";
            credetial.Password = "wss193651";
            client.Credentials = credetial;
            client.Send(mailMsg);
        }
        /// <summary>
        /// 发送多个用户
        /// </summary>
        /// <param name="receiverEmail"></param>
        /// <param name="subject"></param>
        /// <param name="content"></param>
        public static void SendEmailS(string receiverEmail, string subject, string content)
        {
            //string email = "wkregister566@163.com";
            MailMessage mailMsg = new MailMessage();
            mailMsg.From = new MailAddress("13716821353@163.com");
            if (receiverEmail.Trim().Length != 0)
            {
                string[] receivers = receiverEmail.Trim().Split(',');
                for (int i = 0; i < receivers.Length; i++)
                {
                    if (receivers[i].Length > 0)
                    {
                        mailMsg.To.Add(receivers[i]);                               //为该电子邮件添加联系人  
                    }
                }
            }  
          
            //mailMsg.Subject = "请激活注册";
            mailMsg.Subject = subject;
            //StringBuilder contentBuilder = new StringBuilder();
            //contentBuilder.Append("请单击以下链接完成激活");
            ////contentBuilder.Append("<a href='http://localhost:15464/cheng.aspx?activecode=" + activeCode + "&userId=" + 1 + "'>激活</a>");
            mailMsg.Body = content;//拼接字符串 
            mailMsg.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            //发件方服务器地址 
            client.Host = "smtp.163.com";
            client.Port = 25;
            client.EnableSsl = true;
            //mailMsg.IsBodyHtml = true; 
            NetworkCredential credetial = new NetworkCredential();
            credetial.UserName = "13716821353";
            credetial.Password = "wss193651";
            client.Credentials = credetial;
            client.Send(mailMsg);
        }
    }
}