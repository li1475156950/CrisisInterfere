using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using CrisisInterfere.projrem;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// Audit 的摘要说明
    /// </summary>
    public class Audit : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            context.Response.ContentType = "text/plain";
            int Type = Convert.ToInt32(Common.GetRequest("type"));
            //1是审核注册列表;2我是单个接受,3是批量接受，4是单个拒绝，5是批量拒绝
            switch (Type)
            {
                case 1:
                  string AuditType = context.Request["AutiType"].ToString();
                //AuditType = context.Request["AuditType"];
                int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                InitGaugePages(AuditType, StarPageIndex, EndPageIndex, context);
                break;
                case 2:
                int UID = Convert.ToInt32(context.Request["U_ID"]);
                context.Response.Write(UpdateAccepByID(UID));
                break;
                case 3:
                string U_IDs = context.Request["U_IDs"];
                context.Response.Write(UpdateAccep(U_IDs));            
                break;
                case 4:
                int uid = Convert.ToInt32(context.Request["UID"]);
                context.Response.Write(UpdateRefuseByID(uid));
                break;
                case 5:
                string UIDs = context.Request["UIDs01"];
                context.Response.Write(UpdateRefuse(UIDs));
                break;
            }
            
        }
        // 审核自助注册列表
        /// </summary>
        /// <param name="U_ID"></param>
        /// <param name="R_ID"></param>
        /// <param name="Name"></param>
        /// <param name="Department_ID"></param>
        /// <param name="RoleName"></param>
        /// <param name="U_Sex"></param>
        /// <param name="StarPageIndex"></param>
        /// <param name="EndPageIndex"></param>
        /// <returns></returns>
        private DataSet GetAuditTemp(string AuditType, int StarPageIndex, int EndPageIndex)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.UserAddService.GetAuditList(AuditType, StarPageIndex, EndPageIndex);

            }
            catch
            {
                //UserInfoService
            }

            return SourceTemp;
        }

        private void InitGaugePages(string AuditType, int StarPageIndex, int EndPageIndex, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetAuditTemp(AuditType, StarPageIndex, EndPageIndex);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {


                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            string U_AuditState = "";
                            if (DTR["U_AuditState"].ToString() == "0")
                            {
                                U_AuditState = "待审核";
                            }
                            else if (DTR["U_AuditState"].ToString() == "1")
                            {
                                U_AuditState = "已通过";
                            }
                            else if (DTR["U_AuditState"].ToString() == "2")
                            {
                                U_AuditState = "未通过";
 
                            }
                            String[] arr =
                            {
                                DTR["U_ID"].ToString(), //用户ID
                                //"", //选框
                                DTR["PageIndex"].ToString(),//序号	
                                DTR["U_LoginName"].ToString(),//登陆名称
                                DTR["U_Name"].ToString(),//姓名名称
                                DTR["U_Sex"].ToString(),//性别
                                DTR["U_Createtime"].ToString(),//申请时间 
                                U_AuditState,//6
                                "",//操作
                                DTR["D_name"].ToString(),//所属部门
                            };
                            page.data.Add(arr);

                        }


                    }
                }
                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);

            }
            catch
            {

            }
        }
        public bool UpdatePwd(string UserID)
        {
            try
            {
                UserID = UserID.Substring(0, UserID.Length - 1);
                return MgrServices.UserAddService.UpdatePwd(UserID);
            }
            catch
            {
                return false;
            }
        }
        /// <summary>
        /// 批量接受
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        /// 
        public bool UpdateAccep(string UserID) {
            try
            {
                UserID = UserID.Substring(0, UserID.Length - 1);
                DataTable dt = MgrServices.UserAddService.GetUserEmail(UserID);
                string email = "";
                if (dt.Rows.Count > 0)
                {
                    
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        email += dt.Rows[i]["U_Email"].ToString()+",";
                      
                    }
                    
                }
                if (email.Length > 0)
                {
                    email = email.Substring(0, email.Length - 1);
                }
                EmailHelper.SendEmailS(email, "您的注册申请已通过，您可通过注册的登录名和密码登录系统！京师博仁心理测评档案管系统", "您的注册申请已通过，您可通过注册的登录名和密码登录系统！京师博仁心理测评档案管系统");
                return MgrServices.UserAddService.UpdateAccep(UserID);
            }
            catch
            { return false; }
        }
        /// <summary>
        /// 单个接受
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool UpdateAccepByID(int UserID)
        {
            try
            {
                string email = MgrServices.UserAddService.GetUserEmailByUserID(UserID);
                EmailHelper.SendEmail(email, "您的注册申请已通过，您可通过注册的登录名和密码登录系统！", "您的注册申请已通过，您可通过注册的登录名和密码登录系统！");
                return MgrServices.UserAddService.UpdateAccepByID(UserID);
            }
            catch
            { return false; }
        }
        string aa = "";
       /// <summary>
       /// 单个拒绝
       /// </summary>
       /// <param name="UserID"></param>
       /// <returns></returns>
        public bool UpdateRefuseByID(int UserID)

        {
            try
            {
                //根据id获取用户的游戏
                string email = MgrServices.UserAddService.GetUserEmailByUserID(UserID);
                EmailHelper.SendEmail(email, "您的注册申请被拒绝！京师博仁心理测评档案管系统", "您的注册申请被拒绝！京师博仁心理测评档案管系统");
                return MgrServices.UserAddService.UpdateRefuseByID(UserID);
            }
            catch
            {
                return false;
            }
        }
        /// <summary>
        /// 批量拒绝
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool UpdateRefuse(string UserID) {
            try
            {
                UserID = UserID.Substring(0, UserID.Length - 1);
                DataTable dt = MgrServices.UserAddService.GetUserEmail(UserID);
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string email = dt.Rows[i]["U_Email"].ToString();
                        EmailHelper.SendEmail(email, "您的注册申请被拒绝！京师博仁心理测评档案管系统", "您的注册申请被拒绝！京师博仁心理测评档案管系统");
                    }
                }
               
                return MgrServices.UserAddService.UpdateRefuse(UserID);
            }
            catch
            {
                return false;
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