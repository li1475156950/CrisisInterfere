using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CrisisInterfere.projrem;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// RoleDelrte 的摘要说明
    /// </summary>
    public class RoleDelrte : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            int U_ID = Convert.ToInt32(context.Request["U_ID"]);
            string U_IDs = context.Request["U_IDs"];
            string name = context.Request["name"];
            int type = Convert.ToInt32(context.Request["type"]);

            switch (type)
            {
                case 1:
                    bool result = idDelete(U_ID, context);
                    context.Response.Write(result);
                    break;
                case 2:
                    U_IDs = U_IDs.Substring(0, U_IDs.Length - 1);
                    name = name.Substring(0, name.Length - 1);
                    bool results = onidDeletes(name,U_IDs, context);
                    context.Response.Write(results);
                    break;

                case 3:
                    string state = context.Request["state"];
                    context.Response.Write(idDeleteEmail(U_ID, state));

                    break;
                case 4:
                    U_IDs = U_IDs.Substring(0, U_IDs.Length - 1);
                    
                    string states = context.Request["state"];
                    context.Response.Write(onidDeletesEmail(U_IDs));
                    break;


            }

        }

        public bool idDelete(int U_ID, HttpContext context)
        {
            try
            {
                var name = context.Request["name"].ToString();
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                model.RBTitle = "删除用户-" + name + ""; //标题
                model.RBModularID = 12; //对应模块权限ID
                model.RBTableName = "U_UserInfo"; //删除的表名
                model.RBFieldName = "U_ID"; //删除相对应字段的id
                model.RBFieldValue = U_ID.ToString();//删除列名的id
                model.RBDeleteFieldName = "U_Mark_Delete"; //表的删除字段一般 某某某_Delete
                model.RBDeleteTime = DateTime.Now;
                //CrisisInterfere.UserInfoService.U_UserInfoEntity entity = new UserInfoService.U_UserInfoEntity();
                //entity = MgrServices.UserAddService.GetEntity(context.Session["loginName"]);

                model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                model.EnterpriseCode = enterpriseCode;
                if (model.RBExcutePerson == null)
                    return false;
                bool result = MgrServices.RecycleBinService.PutDataInRecycleBin(model);
                return result;

            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool onidDeletes(string name,string U_IDs, HttpContext context)
        {
             bool result =false;
            try
            {

                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                string[] strs = U_IDs.Split(',');
                string[] names =name.Split(',');
                for (int i = 0; i < strs.Length; i++)
                {
                    CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                    model.RBTitle = "删除用户-" + names[i] + ""; //标题
                    model.RBModularID = 12; //对应模块权限ID
                    model.RBTableName = "U_UserInfo"; //删除的表名
                    model.RBFieldName = "U_ID"; //删除相对应字段的id
                    model.RBFieldValue = strs[i].ToString();//删除列名的id
                    model.RBDeleteFieldName = "U_Mark_Delete"; //表的删除字段一般 某某某_Delete
                    model.RBDeleteTime = DateTime.Now;
                    model.EnterpriseCode = enterpriseCode;
                    //CrisisInterfere.UserInfoService.U_UserInfoEntity entity = new UserInfoService.U_UserInfoEntity();
                    //entity = MgrServices.UserAddService.GetEntity(context.Session["loginName"]);

                    model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                    if (model.RBExcutePerson == null)
                        return false;
                    result= MgrServices.RecycleBinService.PutDataInRecycleBin(model);
                    
                }
                return result;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        //发送邮件
        public bool idDeleteEmail(int U_ID, string state)
        {
            try
            {
                if (state == "待审核")//真删除
                {
                    string email = MgrServices.UserAddService.GetUserEmailByUserID(U_ID);
                    EmailHelper.SendEmail(email, "您的注册申请已通过，您可通过注册的登录名和密码登录系统！", "您的注册申请已通过，您可通过注册的登录名和密码登录系统！");
                    if (MgrServices.UserAddService.deleteUser(U_ID))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else if (state == "已通过")//移入成员管理
                {
                    if (MgrServices.UserAddService.Update_Delete(U_ID))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else if (state == "未通过")
                {
                    if (MgrServices.UserAddService.deleteUser(U_ID))
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }

            }
            catch
            {
                return false;
            }
        }
        public bool onidDeletesEmail(string U_IDs)
        {
            try
            {
                DataTable dt = MgrServices.UserAddService.GetUserEmail(U_IDs);
                if (dt.Rows.Count > 0)
                {
                    string email = "";
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string u_id = dt.Rows[i]["U_ID"].ToString();

                        if (dt.Rows[i]["U_AuditState"].ToString() == "0")//待审核-真删除
                        {
                            email += dt.Rows[i]["U_Email"].ToString() + ",";
                            if (MgrServices.UserAddService.deleteUsers(u_id))
                            {

                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
                        else if (dt.Rows[i]["U_AuditState"].ToString() == "1")//通过-移入成员管理
                        {
                            if (MgrServices.UserAddService.Update_Deletes(u_id))
                            {
                                return true;
                            }
                            else
                            {
                                return false;
                            }
                        }
                        else if (dt.Rows[i]["U_AuditState"].ToString() == "2")
                        {
                            if (MgrServices.UserAddService.deleteUsers(u_id))
                            {
                                return true;
                            }
                        }

                    }
                    if (email.Length > 0)
                    {

                        EmailHelper.SendEmailS(email, "您的注册申请已通过！京师博仁心理测评档案管系统", "您的注册申请已通过！，您可通过注册的登录名和密码登录系统！");
                    }
                    return false;
                }
                else
                {
                    return false;
                }

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