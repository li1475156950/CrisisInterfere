using BR_Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using CrisisInterfere.BasicSetting_UserInfo;
using CrisisInterfere.FunctionService;
using CrisisInterfere.projrem;

namespace CrisisInterfere
{
    /// <summary>
    /// logins 的摘要说明
    /// </summary>
    public class logins : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Type = Common.GetRequest("Type");
            switch (Type)
            {
                case "userlogin":
                    userlogin(context);
                    break;
                default:
                    break;
            }
        }
        public void userlogin(HttpContext context)
        {
            String GetpayStateNanme = context.Request["callbackparam"];

            context.Session["loginName"] = null;
            context.Session["UserID"] = null;
            context.Session["U_Img"] = null;
            context.Session["EnterpriseCode"] = null;
            context.Session["role_type"] = null;
            context.Session["U_Name"] = null;
            context.Session["UserID"] = null;
            string userId = HttpContext.Current.User.Identity.Name;
            //userId = "G441224200410212914";
            if (userId != null && userId != "")
            {
                U_UserInfoEntity model = new U_UserInfoEntity();
                long result = 0;
                CrisisInterfere.RoleService.RoleEntity Roles = MgrServices.RoleService.IsRole(3, "sysadmin");
                int DID = MgrServices.Department.GetDepartmentByName("sysadmin");
                if (Roles != null)
                {
                    U_UserInfoEntity entity = new U_UserInfoEntity();
                    var IsUser = MgrServices.UserAddService.IsExistsUser(userId);
                    if (IsUser)
                    {
                        entity = MgrServices.UserAddService.GetEntity(userId);
                        context.Session["loginName"] = userId;
                        context.Session["UserID"] = entity._u_id;
                        //context.Session["U_Img"] = entity._u_img;
                        if (entity._u_img != null && entity._u_img != "")
                        {
                            context.Session["U_Img"] = entity._u_img;
                        }
                        else { context.Session["U_Img"] = ""; }

                        context.Session["EnterpriseCode"] = entity._enterpriseCode;
                        context.Session["role_type"] = entity._role_types;
                        context.Session["U_Name"] = entity._u_name;
                        context.Session["UserID"] = entity._u_id;
                        context.Response.Write(GetpayStateNanme + "([ { strte:\"" + 0 + "\"}])");
                    }
                    else
                    {

                        U_UserInfoEntity Umodel = new U_UserInfoEntity();
                        model._department_id = DID.ToString();
                       
                        model._u_loginname = userId;
                        model._u_password = MD5Helper.Upper32("123456");
                        model._u_name = userId;
                        model._u_sex = "女";
                        model._student_id = "";
                        model._u_birthday = DateTime.Now.ToString();
                        model._u_email = "";
                        model._u_tel = "";
                        model._u_parentstel = "";
                        model._u_parentsemail = "";
                        model._r_id = Roles.Role_ID.ToString();
                        model._u_age = "0";
                        model._u_remark = "";
                        model._u_addfield = "";
                        model._departmentauthority = "";
                        model._enterpriseCode = "";
                        model._u_mark_delete = "0";
                        model._u_auditstate = "1";
                        result = MgrServices.UserAddService.U_UserInfoAdd(model);
                        if (result>0)
                        {

                            entity = MgrServices.UserAddService.GetEntity(userId);
                            context.Session["loginName"] = userId;
                            context.Session["UserID"] = entity._u_id;
                            //context.Session["U_Img"] = entity._u_img;
                            if (entity._u_img != null && entity._u_img != "")
                            {
                                context.Session["U_Img"] = entity._u_img;
                            }
                            else { context.Session["U_Img"] = ""; }

                            context.Session["EnterpriseCode"] = entity._enterpriseCode;
                            context.Session["role_type"] = entity._role_types;
                            context.Session["U_Name"] = entity._u_name;
                            context.Session["UserID"] = entity._u_id;
                            SetSessionFunctionByRoleID(Convert.ToInt32(entity._r_id), context);//将对应的权限放到Session里面
                            GetRoleFuntion(context);
                            context.Response.Write(GetpayStateNanme + "([ { strte:\"" + 0 + "\"}])");
                        }
                        else
                        {
                            context.Response.Write(GetpayStateNanme + "([ { strte:\"" + 1 + "\"}])");
                        }
                    }
                }
                else
                {
                    context.Response.Write(GetpayStateNanme + "([ { strte:\"" + 1 + "\"}])");
                }
            }
            else
            {
                context.Response.Write(GetpayStateNanme + "([ { strte:\"" + 1 + "\"}])");
            }

        }
        public void SetSessionFunctionByRoleID(int RoleID, HttpContext context)
        {
            try
            {
                List<RF_Entity> RfList = new List<RF_Entity>();
                List<RF_Entity> ALL_RfList = new List<RF_Entity>();

                ALL_RfList = MgrServices.FunctionService.GetRF_AD();//获取的是所有的权限
                RfList = MgrServices.FunctionService.GetRoleAndFunctionByRoleID(RoleID);//获取的是当前按钮的权限
                context.Session["ALL_RfList"] = ALL_RfList;//所有权限的Session
                context.Session["RfList"] = RfList;//当前登陆人权限的Session
            }
            catch
            {


            }
        }
        public void GetRoleFuntion(HttpContext context)
        {
            string Roletype = "";
            int Rolefuntion = 0;
            if (context.Session["role_type"] != null)
            {
                Roletype = context.Session["role_type"].ToString();
            }
            if (Roletype == "2")
            {
                var currentUserID = context.Session["UserID"].ToString();
                var sessionUserID = "";
                if (context.Session["CurrentUserID"] != null)
                {
                    sessionUserID = context.Session["CurrentUserID"].ToString();
                }
                if (context.Session["SecondMenu"] != null && context.Session["FirstMenu"] != null)
                {
                    var tempFirstMenu = context.Session["FirstMenu"] as List<FunctionService.FunctionEntity>;
                    foreach (var item in tempFirstMenu)
                    {
                        if (item.Fun_Name == "预约咨询")
                        {
                            Rolefuntion = 2;
                        }
                    }
                }
            }
            context.Session["GetRoleType"] = Rolefuntion;
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