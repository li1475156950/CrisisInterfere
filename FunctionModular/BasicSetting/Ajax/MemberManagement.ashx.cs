using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.projrem;
using System.Web.SessionState;
using System.Text;
using CrisisInterfere.BasicSetting_UserInfo;
namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// MemberManagement 的摘要说明
    /// </summary>
    public class MemberManagement : IHttpHandler, IRequiresSessionState
    {
        private HttpContext PubliContext;
        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");1是成员管理列表；2是查看；3是重置密码；4是批量重置密码；5是批量添加,
            //6是修改校验用户名是否存在,7是获取权限

            int Type = Convert.ToInt32(Common.GetRequest("type"));
            string Name = Common.GetSessionValue("loginName", context);//登录名或者姓名
            if (Name == null)
                return;
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            switch (Type)
            {
                case 1:
                    int U_ID = 0;
                    string _id = Common.GetSessionValue("UserID", context);
                    if (_id == null)
                        return;
                    U_ID = Convert.ToInt32(_id);

                    int R_ID = 0;
                    string LoginName = context.Request["LoginName"].ToString();
                    string Department_ID = context.Request["departmentname"];
                    string U_Sex = context.Request["sex"];
                    string RoleName = context.Request["RoleName"];
                    if (RoleName == "0")
                    {
                        RoleName = "";
                    }
                    int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));

                    InitGaugePages(U_ID, R_ID, LoginName, Department_ID, RoleName, U_Sex, EnterpriseCode, StarPageIndex, EndPageIndex, context);
                    break;
                case 2:
                    int UserID = Convert.ToInt32(context.Request["uid"]);
                    GetUserInfoByID(UserID, context);
                    break;
                case 3:
                    int UID = Convert.ToInt32(context.Request["U_ID"]);
                    context.Response.Write(UpdatePwdByID(UID));
                    break;
                case 4:
                    string Userid = context.Request["U_IDs"];
                    context.Response.Write(UpdatePwd(Userid));
                    break;
                case 5:
                    BatchaddModel model = new BatchaddModel();
                    model.R_ID = Common.GetRequest("RoleNameAll");
                    model.CreatePeple = Name;
                    model.department = Common.GetRequest("department");
                    model.NumStart = Convert.ToInt32(Common.GetRequest("NumStart"));
                    model.NumEnd = Convert.ToInt32(Common.GetRequest("NumEnd"));
                    model.UserNameR = Common.GetRequest("UserNameR");
                    model.nametype = Convert.ToInt32(Common.GetRequest("nametype"));
                    model.username_ty = Common.GetRequest("username_ty");
                    model.UserName03 = Common.GetRequest("UserName03");
                    model.UserName04 = Common.GetRequest("UserName04");
                    model.PwdR = Common.GetRequest("PwdR");
                    model.Pwd = Common.GetRequest("Pwd");
                    model.EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                    if (model.EnterpriseCode == null)
                        return;
                    context.Response.Write(BathAdd(model));
                    break;
                case 6:
                    string ULoginName = context.Request["LoginName"].ToString();
                    int UserIDs = Convert.ToInt32(Common.GetRequest("UserID"));
                    IsExistsUser(ULoginName, UserIDs, context);
                    break;
                case 7:
                    context.Response.Write(GetUserFun(Name, 12));
                    break;
                case 8:
                    context.Response.Write(GetTreeString());
                    break;
                case 9:
                    string loginName = Common.GetRequest("LoginNameAdd");
                    IsExistsUserByE(EnterpriseCode, loginName, context);
                    break;
                case 10:
                    GetRoleFuntion(context);
                    break;
                case 11:
                    TransferDepartment(context);
                    break;
            }
            //}
        }
        /// <summary>
        /// 批量转移成员部门
        /// </summary>
        /// <param name="context"></param>
        private void TransferDepartment(HttpContext context)
        {
            try
            {
                string[] UIDs = context.Request["U_IDs"].ToString().Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                int did = Convert.ToInt32(context.Request["D_ID"]);
               bool val= MgrServices.UserAddService.TransferDepartment(UIDs.ToList(),did);
               context.Response.Write(val.ToString());
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建时间：2016-09-07
        /// 功能介绍：根据相关的页面参数，查询成员管理数据集合
        /// </summary>
        /// <param name="Amount_TypeID">量表类型ID</param>
        /// <param name="Amount_Name">量表名称</param>
        /// <param name="Amount_Source">量表来源</param>
        /// <param name="StarPageIndex">开始页码</param>
        /// <param name="EndPageIndex">结束页码</param>
        /// <returns></returns>
        private DataSet GetUserInfoTemp(string loginName, int U_ID, int R_ID, string Name, string Department_ID, string RoleName, string U_Sex, string EnterpriseCode, int StarPageIndex, int EndPageIndex)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.UserAddService.GetUserInfoList(loginName, U_ID, R_ID, Name, Department_ID, RoleName, U_Sex, EnterpriseCode, StarPageIndex, EndPageIndex);

            }
            catch
            {
                //UserInfoService
            }

            return SourceTemp;
        }

        private void InitGaugePages(int U_ID, int R_ID, string Name, string Department_ID, string RoleName, string U_Sex, string EnterpriseCode, int StarPageIndex, int EndPageIndex, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                    return;
                SourceTemps = GetUserInfoTemp(loginName, U_ID, R_ID, Name, Department_ID, RoleName, U_Sex, EnterpriseCode, StarPageIndex, EndPageIndex);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {


                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            //string RFType = "0";
                            //if (DTR["UID"] != null && DTR["UID"] != "")
                            //{
                            //    RFType = "4";
                            //}
                            //else
                            //{
                            //    RFType = "0";
                            //}
                            String[] arr =
                            {
                                DTR["U_ID"].ToString(), //用户ID
                                //"", //选框
                                DTR["PageIndex"].ToString(),//序号	
                                DTR["U_LoginName"].ToString(),//登陆名称
                                DTR["U_Name"].ToString(),//姓名名称
                                DTR["U_Sex"].ToString(),//性别
                                DTR["Role_Name"].ToString(),//角色名称                            
                                DTR["D_name"].ToString(),//所属部门
                                "",//操作
                                DTR["Department_ID"].ToString(),
                                DTR["U_Address"].ToString(),
                                DTR["U_Remark"].ToString(),
                                DTR["U_Birthday"].ToString(),
                                DTR["U_Tel"].ToString(),
                                DTR["U_EMail"].ToString()
                               
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
        //获取查看的数据
        public void GetUserInfoByID(int UserID, HttpContext context)
        {
            try
            {
                U_UserInfoEntity Model = new U_UserInfoEntity();
                U_UserInfoEntity ds = MgrServices.UserAddService.GetUserList(UserID);
                //部门id
                Model._u_id = ds._u_id;
                if (ds._u_str != null && ds._u_str != "")
                {
                    Model._u_str = ds._u_str;
                }
                else
                {
                    Model._u_str = "无";
                }
                if (ds._u_loginname != null && ds._u_loginname != "")
                {
                    Model._u_loginname = ds._u_loginname;
                }
                if (ds._u_name != null && ds._u_name != "")
                {
                    Model._u_name = ds._u_name;
                }
                else
                {
                    Model._u_name = "无";
                }
                if (ds._u_sex != null && ds._u_sex != "")
                {
                    Model._u_sex = ds._u_sex;
                }
                else
                {
                    Model._u_sex = "无";
                }
                if (ds._departmentauthority != null)
                    Model._departmentauthority = ds._departmentauthority;
                if (ds._student_id != null && ds._student_id != "")
                {
                    Model._student_id = ds._student_id;
                }
                else
                {
                    Model._student_id = "无";
                } if (ds._u_birthday != null && ds._u_birthday != "")
                {
                    Model._u_birthday = ds._u_birthday;
                }
                else
                {
                    Model._u_birthday = "无";

                }
                if (ds._u_email != null && ds._u_email != "")
                {
                    Model._u_email = ds._u_email;
                }
                else
                {
                    Model._u_email = "无";
                }
                if (ds._u_tel != null && ds._u_tel != "")
                {
                    Model._u_tel = ds._u_tel;
                }
                else
                {
                    Model._u_tel = "无";
                }
                if (ds._u_remark != null && ds._u_remark != "")
                {
                    Model._u_remark = ds._u_remark;    //成员描述

                }
                else
                {
                    Model._u_remark = "无";
                }
                if (ds._u_parentsemail != null && ds._u_parentsemail != "")
                {
                    Model._u_parentsemail = ds._u_parentsemail;
                }
                else
                {
                    Model._u_parentsemail = "无";
                }
                if (ds._u_parentstel != null && ds._u_parentstel != "")
                {
                    Model._u_parentstel = ds._u_parentstel;

                }
                else
                {
                    Model._u_parentstel = "无";

                }
                string json = JsonConvert.SerializeObject(Model);
                context.Response.Write(json);
            }
            catch
            { }

        }
        public bool UpdatePwdByID(int UID)
        {
            try
            {
                return MgrServices.UserAddService.UpdatePwdByID(UID);
            }
            catch
            {
                return false;
            }
        }
        /// <summary>
        /// 根据用户ID重置密码
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
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
        public int BathAdd(BatchaddModel model)
        {
            try
            {
                return MgrServices.UserAddService.Batchadd(model);
            }
            catch
            { return 0; }



        }
        //校验修改时用户名是否存在
        public void IsExistsUser(string userName, int UserID, HttpContext context)
        {
            try
            {
                bool isExists = MgrServices.UserAddService.IsExistsUsers(userName, UserID);
                Dictionary<string, bool> ds = new Dictionary<string, bool>();
                if (isExists)
                {

                    ds.Add("valid", false);
                }
                else
                {
                    ds.Add("valid", true);

                }
                string aa = JsonConvert.SerializeObject(ds);
                context.Response.Write(JsonConvert.SerializeObject(ds));
            }
            catch
            { }
        }
        public string GetUserFun(string Name, int FunParenID)
        {
            try
            {
                DataTable GetUserFunP = MgrServices.UserAddService.GetUserFun(Name, FunParenID);
                StringBuilder sb = new StringBuilder();
                string jsonData = string.Empty;
                sb.Append("{\"Module\":[");
                if (GetUserFunP != null && GetUserFunP.Rows.Count > 0)
                {
                    foreach (DataRow DTR in GetUserFunP.Rows)
                    {
                        jsonData = "{\"FunID\":" + "\"" + DTR["FunID"].ToString() + "\"},";
                        sb.Append(jsonData);
                    }

                    sb = sb.Remove(sb.Length - 1, 1);

                }

                sb.Append("]}");
                return sb.ToString();
            }
            catch
            {
                return null;
            }
        }
        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-18
        /// 功能介绍：获取当前企业下面的所有部门集合
        /// </summary>
        /// <returns></returns>
        private static string GetTreeString()
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                DataTable TreeTable = MgrServices.UserAddService.GetTree();

                sb.Append("[");
                foreach (DataRow dr in TreeTable.Rows)
                {
                    sb.Append("{");
                    sb.AppendFormat("\"name\":\"{0}\",", dr["D_name"].ToString());
                    sb.AppendFormat("\"id\":\"{0}\",", dr["D_ID"].ToString());
                    sb.AppendFormat("\"pId\":\"{0}\",", dr["D_chiID"].ToString());
                    sb.AppendFormat("\"icon\":\"{0}\",", "+");
                    sb.AppendFormat("\"open\":\"{0}\",", true);
                    sb.AppendFormat("\"checked\":\"{0}\"", false);
                    sb.Append("},");
                }
                if (sb.ToString().EndsWith(","))
                {
                    sb.Remove(sb.Length - 1, 1);
                }
                sb.Append("]");
                return sb.ToString();
            }
            catch
            {
                return null;
            }
        }
        public void IsExistsUserByE(string Ecode, string userName, HttpContext context)
        {

            try
            {
                Dictionary<string, bool> IsE = new Dictionary<string, bool>();
                if (MgrServices.UserAddService.IsExistsUserByE(Ecode, userName))
                {
                    IsE.Add("valid", false);
                }
                else
                {
                    IsE.Add("valid", true);
                }
                context.Response.Write(JsonConvert.SerializeObject(IsE));
            }
            catch
            {

            }
        }

        //判断是否是咨询师
        public void GetRoleFuntion(HttpContext context)
        {
            int GetFuntionType = 0;

            if (context.Session["GetRoleType"] != null)
            {
                GetFuntionType = Convert.ToInt32(context.Session["GetRoleType"]);
            }
            context.Response.Write(GetFuntionType);
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