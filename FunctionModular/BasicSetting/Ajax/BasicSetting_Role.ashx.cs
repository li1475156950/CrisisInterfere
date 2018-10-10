using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrisisInterfere;
using Newtonsoft.Json;
using CrisisInterfere.FunctionModular.BasicSetting.ViewModel;
using System.Data;
using CrisisInterfere.FunctionService;
using BR_Service;
using CrisisInterfere.RoleService;
using System.Web.SessionState;
using System.Text;
namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// BasicSetting_Role 的摘要说明
    /// </summary>
    public class BasicSetting_Role : IHttpHandler, IRequiresSessionState
    {


        public void ProcessRequest(HttpContext context)
        {
            string type = context.Request.QueryString["operationType"];
            string session_UserID = Common.GetSessionValue("UserID", context);
            if (session_UserID == null)
                return;

            int U_ID = Convert.ToInt32(session_UserID);
            switch (type)
            {
                case "Add":
                    AddRole(context);
                    break;
                case "Bind":
                    string role_Name = "";
                    int role_Type = 0;
                    //if (string.IsNullOrEmpty(Common.GetRequest("Role_Name")))
                    //{
                    //    role_Name = string.Empty;
                    //}
                    //else
                    //{
                    //    role_Name = Common.GetRequest("Role_Name");
                    //}
                    if (!string.IsNullOrEmpty(Common.GetRequest("Role_Type")))
                    {
                        role_Type = Convert.ToInt32(Common.GetRequest("Role_Type"));
                    }
                    int startPageIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                    int endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                    InitRoleList(role_Name, role_Type, startPageIndex, endPageIndex, context);
                    break;
                case "Update":
                    var roleID = Convert.ToInt32(Common.GetForm("RoleID"));
                    var roleName = Common.GetForm("RoleName");
                    var roleDescribe = Common.GetForm("RoleDescribe");
                    Update(roleID, roleName, roleDescribe, context);
                    break;
                case "Delete":
                    Delete(context);
                    break;
                case "LoadFun":
                    int funType = Convert.ToInt32(Common.GetRequest("funType"));
                    int funID = 0;
                    if (!string.IsNullOrEmpty(Common.GetRequest("funID")))
                    {
                        funID = Convert.ToInt32(Common.GetRequest("funID"));
                    }

                    GetAllFun(funType, funID, context);
                    break;
                case "LoadSelect":
                    GetRoleType(context);
                    break;
                case "LoadRoleFun":

                    GetRoleFun(context);
                    break;
                case "AddRoleFun":
                    var arrayRoleID = Common.GetRequest("arrayRoleID");
                    AddRoleFun(arrayRoleID, context);
                    break;
                case "JudgeRoleName":
                    JudgeRoleName(U_ID, context);
                    break;
                case "Getrole":
                    ///获取的单个实体
                    Getroles(context);
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
        public void AddRole(HttpContext context)
        {
            string roleName = Common.GetRequest("roleName").Replace(" ", "");
            string createPerson = Common.GetSessionValue("UserID", context);
            if (createPerson == null)
                return;
            string roleDescribe = Common.GetRequest("roleDescribe");
            var roleType = Convert.ToInt32(Common.GetRequest("roleType"));
            RoleService.RoleEntity re = new CrisisInterfere.RoleService.RoleEntity();
            re.Role_Name = roleName;
            re.Role_CreatePerson = createPerson;
            re.Role_Describe = roleDescribe;
            re.Role_Type = roleType;
            re.Role_CreateTime = DateTime.Now;

            context.Response.Write(MgrServices.RoleService.AddRole(re));
        }
        public void InitRoleList(string role_Name, int role_Type, int startPageIndex, int endPageIndex, HttpContext context)
        {
            List<RoleViewModel> lr = new List<RoleViewModel>();
            var enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;

            try
            {
                PageInfo page = new PageInfo();
                string _userID = Common.GetSessionValue("UserID", context);
                if (_userID == null)
                    return;
                var userID = Convert.ToInt32(_userID);
                DataSet SourceTemps = new DataSet();
                SourceTemps = MgrServices.RoleService.InitRoleList(userID, enterpriseCode, role_Name, startPageIndex, endPageIndex);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            var MemberCount = MgrServices.RoleService.GetMemberCount(Convert.ToInt32(DTR["Role_ID"].ToString()));
                            String[] arr =
                            {                                
                                "<label data-name="+DTR["Role_Name"]+" data-id="+DTR["Role_ID"]+">"+DTR["PageIndex"]+"</label>",
                                DTR["Role_Name"].ToString(),//角色名称
                                DTR["RoleType_Name"].ToString(),
                                MemberCount.ToString(),
                                DTR["Role_Describe"].ToString(),//角色描述
                                "",//操作
                                DTR["Role_Type"].ToString()
                                
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
        public void Update(int roleID, string roleName, string roleDescribe, HttpContext context)
        {
            RoleService.RoleEntity rs = new RoleService.RoleEntity();
            rs.Role_ID = roleID;
            rs.Role_Name = roleName.Replace(" ", "");
            rs.Role_Describe = roleDescribe;
            rs.Role_EditTime = DateTime.Now;
            rs.Role_Type = Convert.ToInt32(Common.GetRequest("roleType"));
            rs.Role_EditPerson = Common.GetSessionValue("UserID", context);
            if (rs.Role_EditPerson == null)
                return;
            context.Response.Write(MgrServices.RoleService.Update(rs));
        }
        public void Delete(HttpContext context)
        {
            var roleID = Convert.ToInt32(Common.GetForm("RoleID"));
            context.Response.Write(MgrServices.RoleService.Delete(roleID));
        }
        public void GetAllFun(int funType, int funID, HttpContext context)
        {
            PageInfo pg = new PageInfo();
            List<FunctionService.FunctionEntity> lf = null;
            if (context.Session["funList"] == null)
            {
                lf = MgrServices.FunctionService.GetAllFun().ToList();
                context.Session["funList"] = lf;
            } 
            else
            {
                lf = context.Session["funList"] as List<FunctionEntity>;
            }
            List<FunctionEntity> firstFun = lf.Where(m => m.Fun_Type == 1).ToList();

            if (funType == 1)
            {
                context.Response.Write(JsonConvert.SerializeObject(firstFun));
                context.Response.End();
            }
            if (funType == 2)
            {
                List<FunctionEntity> secondFun = lf.Where(m => m.Fun_Type == 2 && m.Fun_ParentID == funID).ToList();
                context.Response.Write(JsonConvert.SerializeObject(secondFun));
            }

            if (funType == 3)
            {
                List<FunctionEntity> thirdFun = lf.Where(m => m.Fun_Type == 3 && m.Fun_ParentID == funID).ToList();
                context.Response.Write(JsonConvert.SerializeObject(thirdFun));
            }
        }
        public void GetRoleType(HttpContext context)
        {
            string _userID = Common.GetSessionValue("UserID", context);
            if (_userID == null)
                return;
            var userID = Convert.ToInt32(_userID);
            var str = MgrServices.RoleService.GetRoleTypeList(userID);
            string json = JsonConvert.SerializeObject(str);
            context.Response.Write(json);
        }
        public void GetRoleFun(HttpContext context)
        {
            int roleID = Convert.ToInt32(Common.GetRequest("roleID"));
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.FunctionService.GetRoleFun(roleID)));
        }
        public void Getroles(HttpContext context)
        {
            int roleID = Convert.ToInt32(context.Request["roleID"]);
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.RoleService.Getrole(roleID)));
        }
        public void AddRoleFun(string arrayRoleID, HttpContext context)
        {
            int roleID = Convert.ToInt32(Common.GetRequest("roleID"));
            bool isSuccess = true;
            var isContainAppointmentConsultFunID = false;
            var userIDList = new List<int>();
            List<int> roleFunNow = JsonConvert.DeserializeObject<List<int>>(arrayRoleID);//权限编辑页面所勾选的所有权限
            //var tempNewFunList = Common.Clone<int>(roleFunNow);//临时克隆新权限集合，用于判断是否有咨询管理模块
            List<int> roleFunBefore = MgrServices.FunctionService.GetRoleFun(roleID).ToList();//角色旧权限
            List<int> appointmentConsultFunIDList = new List<int> {29};
            //循环比较两个角色集合的不同，删除新权限和旧权限的交集，也就是剩余新权限集合的插入和旧权限集合的删除
            for (int i = 1; i <= roleFunNow.Count; i++)
            {
                if (roleFunBefore.Contains(roleFunNow[i - 1]))
                {
                    int temp = roleFunNow[i - 1];
                    //删除新旧角色权限交集
                    roleFunNow.Remove(temp);
                    roleFunBefore.Remove(temp);
                    i = 0;
                }
                if (i == roleFunNow.Count + 1)
                {
                    break;
                }
            }
            #region 判断是否拥有预约管理模块，并添加咨询师
            
            
            for (int i = 0; i < appointmentConsultFunIDList.Count; i++)
            {
                if (roleFunNow.Contains(appointmentConsultFunIDList[i]))
                {
                    userIDList = MgrServices.UserAddService.GetUserIDByRoleAndEnterpriseCode(roleID,context.Session["EnterpriseCode"].ToString());
                    break;
                }
            }
            if(userIDList.Count>0)
            {
                DataTable dt = new DataTable();
                dt.TableName = "Counselor";
                dt.Columns.Add("UID",typeof(Int32));
                dt.Columns.Add("CouSkilledField",typeof(String));
                dt.Columns.Add("CouIntroduce",typeof(String));
                dt.Columns.Add("CounseType",typeof(Int32));
                for (int i = 0; i < userIDList.Count; i++)
                {
                    DataRow dr = dt.NewRow();
                    dr["UID"] = userIDList[i];
                    dr["CouSkilledField"] = "";
                    dr["CouIntroduce"] = "";
                    dr["CounseType"] = DBNull.Value;
                    dt.Rows.Add(dr);
                }
                MgrServices.UserAddService.AddCounselor(dt);
            }
            #endregion
            #region 判断是否用户预约管理权限，删除咨询师
            for (int i = 0; i < appointmentConsultFunIDList.Count; i++)
            {
                if (roleFunNow.Contains(appointmentConsultFunIDList[i]))
                {
                    isContainAppointmentConsultFunID = true;
                    break;
                }
            }
            if (!isContainAppointmentConsultFunID)
            {
                userIDList = MgrServices.UserAddService.GetUserIDByRoleAndEnterpriseCode(roleID, context.Session["EnterpriseCode"].ToString());
                if (userIDList.Count > 0)
                {
                    for (int i = 0; i < userIDList.Count; i++)
                    {
                        MgrServices.UserAddService.DeleteCounselor(userIDList[i]);
                    }
                }
            }
            
            #endregion
            //执行权限添加方法,使用sqlbulk添加数据,传DataTable对象
            if (roleFunNow.Count() != 0)
            {
                DataTable dt = new DataTable();
                dt.TableName = "RoleAndFunction";
                dt.Columns.Add("RoleID", typeof(Int32));
                dt.Columns.Add("FunID", typeof(Int32));
                for (int i = 0; i < roleFunNow.Count; i++)
                {
                    DataRow dr = dt.NewRow();
                    dr["RoleID"] = roleID;
                    dr["FunID"] = roleFunNow[i];
                    dt.Rows.Add(dr);
                }
                try
                {
                    MgrServices.FunctionService.AddRoleFun(dt);

                }
                catch (Exception)
                {

                    isSuccess = false;
                }


            }
            //执行权限删除方法
            if (roleFunBefore.Count() != 0)
            {
                try
                {
                    for (int i = 0; i < roleFunBefore.Count; i++)
                    {
                        MgrServices.FunctionService.Delete(roleID, roleFunBefore[i]);
                    }
                }
                catch (Exception)
                {

                    isSuccess = false;
                }
            }
            context.Response.Write(isSuccess);
        }
        public void JudgeRoleName(int U_Id, HttpContext context)
        {
            object roleID = Common.GetRequest("roleID");
            int resultid = (roleID == null || roleID.ToString() == "") ? 0 : Convert.ToInt32(roleID);
            string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;
            context.Response.Write(MgrServices.RoleService.JudgeRoleName(Common.GetRequest("roleName"), resultid, enterpriseCode, U_Id));
        }
    }
}