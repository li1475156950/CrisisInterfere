using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.SessionState;
using CrisisInterfere.BasicSetting_UserInfo;
using CrisisInterfere.projrem;

namespace CrisisInterfere.FunctionModular.PersonalInfo.Ajax
{
    /// <summary>
    /// PersonalInfo 的摘要说明
    /// </summary>
    public class PersonalInfo : IHttpHandler, IRequiresSessionState
    {


        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "SaveFile":
                    SaveFile(context);
                    break;
                case "LoadUserInfo":
                    LoadUserInfo(context);
                    break;
                case "LoadUserPic":
                    LoadUserPic(context);
                    break;
                case "Update":
                    Update(context);
                    break;
                case "CheckCurrentPwd":
                    CheckCurrentPwd(context);
                    break;
                case "AlterPwd":
                    AlterPwd(context);
                    break;
                case "LoadDepartmentFun":
                    LoadDepartmentFun(context);
                    break;
                default:
                    break;
            }
        }
        public void SaveFile(HttpContext context)
        {
            string basePath = "/upload/";
            string name;
            basePath = System.Web.HttpContext.Current.Server.MapPath(basePath);
            HttpFileCollection files = System.Web.HttpContext.Current.Request.Files;
            if (!System.IO.Directory.Exists(basePath))
            {
                System.IO.Directory.CreateDirectory(basePath);
            }
            var suffix = files[0].ContentType.Split('/');
            //获取文件格式  
            //var _suffix = suffix[1].Equals("jpeg", StringComparison.CurrentCultureIgnoreCase) ? "" : suffix[1];
            var _suffix = suffix[1] + "" + DateTime.Now.Ticks;
            var _temp = DateTime.Now.Ticks + System.Web.HttpContext.Current.Request["name"];
            //如果不修改文件名，则创建随机文件名  
            if (!string.IsNullOrEmpty(_temp))
            {
                name = _temp;
            }
            else
            {
                Random rand = new Random(24 * (int)DateTime.Now.Ticks);
                name = rand.Next() + "." + _suffix;
            }
            //文件保存  
            var full = basePath + name;
            files[0].SaveAs(full);
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            us._u_img = "../../../upload/" + name;
            context.Session["U_Img"] = "../../../upload/" + name;
            MgrServices.UserAddService.UpdateUserInfo(us);
            context.Session["userInfoEntity"] = us;
            var _result = "{\"jsonrpc\" : \"2.0\", \"result\" : null, \"id\" : \"" + name + "\"}";
            System.Web.HttpContext.Current.Response.Write(_result);

        }
        public void LoadUserInfo(HttpContext context)
        {
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            U_UserInfoEntity wu = MgrServices.UserAddService.GetEntityInfo(context.Session["loginName"].ToString(), EnterpriseCode);
           context.Session["userInfoEntity"] = wu;
           UTemplateEntity UT=  MgrServices.UserAddService.GetUTEntity();
           wu._AddFiletemplate = UT._addfiletemplate;
            context.Response.Write(JsonConvert.SerializeObject(wu));
        }
        public void Update(HttpContext context)
        {
            var RFType = 0;
            if (Common.GetRequest("RFType") != null)
            {
                RFType = Convert.ToInt32(Common.GetRequest("RFType"));
            }
            var isSave = true;
            List<SelfDefinedInfo> sd = JsonConvert.DeserializeObject<List<SelfDefinedInfo>>(Common.GetForm("strJson"));
            for (int i = 0; i < sd.Count; i++)
            {
                if (sd[i] == null)
                {
                    sd.Remove(sd[i]);
                }
            }
            U_UserInfoEntity beforeUS = context.Session["userInfoEntity"] as U_UserInfoEntity;
            U_UserInfoEntity us = beforeUS;
            us._u_name = Common.GetForm("userName");
            us._u_sex = Common.GetForm("gender");
            us._u_birthday = Common.GetForm("bornDate");
            us._student_id = Common.GetForm("stuID");
            us._u_email = Common.GetForm("email");
            us._u_tel = Common.GetForm("phone");
            us._u_remark = Common.GetForm("guide");
            us._u_address = Common.GetForm("address");
            us._u_parentsemail = Common.GetForm("parentsEmail");
            us._u_parentstel = Common.GetForm("parentsPhone");
            us._u_audittime = Common.GetForm("bornDate");
            us._u_time = DateTime.Now.ToString("yyyy-MM-dd");
            us._u_addfield = JsonConvert.SerializeObject(sd);
            //U_UserInfoEntity us = new U_UserInfoEntity()
            //{
            //    _u_name = Common.GetForm("userName"),
            //    _u_sex = Common.GetForm("gender"),
            //    _u_birthday = Common.GetForm("bornDate"),
            //    _student_id = Common.GetForm("stuID"),
            //    _u_email = Common.GetForm("email"),
            //    _u_tel = Common.GetForm("phone"),
            //    _u_remark = Common.GetForm("memberDescribe"),
            //    _u_parentsemail = Common.GetForm("parentsEmail"),
            //    _u_parentstel = Common.GetForm("parentsPhone"),

            //    _enterpriseCode = beforeUS._enterpriseCode,
            //    _department_id = beforeUS._department_id,
            //    _r_id = beforeUS._r_id,
            //    _u_address = beforeUS._u_address,
            //    _u_age = beforeUS._u_age,
            //    _u_auditid = beforeUS._u_auditid,
            //    _u_auditstate = beforeUS._u_auditstate,
            //    _u_audittime = Common.GetForm("bornDate"),
            //    _u_id = beforeUS._u_id,
            //    _u_img = beforeUS._u_img,
            //    _u_loginname = beforeUS._u_loginname,
            //    _u_mark_delete = beforeUS._u_mark_delete,
            //    _u_password = beforeUS._u_password,
            //    _u_str = beforeUS._u_str,

            //    _u_addfield = JsonConvert.SerializeObject(sd),
            //    _u_time = beforeUS._u_time,
            //    departmentName = beforeUS.departmentName,
            //    ExtensionData = beforeUS.ExtensionData,
            //    role_describe = beforeUS.role_describe,
            //    role_type = beforeUS.role_type,
            //    u_createperson = beforeUS.u_createperson,
            //    u_createtime = beforeUS.u_createtime
            //};
            if (sd.Count == 0)
            {
                beforeUS._u_addfield = JsonConvert.SerializeObject(sd);
            } 
            //Type type = typeof(U_UserInfoEntity);
            //PropertyInfo[] properties = type.GetProperties();
            //foreach (var item in properties)
            //{
            //    if (GetObjectPropertyValue<U_UserInfoEntity>(us, item.Name) != GetObjectPropertyValue<U_UserInfoEntity>(beforeUS, item.Name))
            //    {

            //        isSave = true;
            //    }
            //}
            List<SelfDefinedInfo> sds = JsonConvert.DeserializeObject<List<SelfDefinedInfo>>(Common.GetForm("strJsons"));
            for (int i = 0; i < sds.Count; i++)
            {
                if (sds[i] == null)
                {
                    sds.Remove(sd[i]);
                }
            }
            if (isSave)
            {
                //修改
                if (RFType == 4)
                {
                    CounselorModel CounselorModels = new CounselorModel();
                    CounselorModels.CouIntroduce = Common.GetRequest("GoodField");
                    CounselorModels.CouSkilledField = Common.GetRequest("U_Consult");
                    CounselorModels.CounseType = 4;
                    bool result = MgrServices.UserAddService.UpdateUserInfoTwo(us, CounselorModels);
                    if (result)
                    { 
                        UTemplateEntity UT = new UTemplateEntity();
                      
                        UT._addfiletemplate = JsonConvert.SerializeObject(sds);
                         UT._createtime = DateTime.Now;
                         UT._u_id = 1;
                         MgrServices.UserAddService.UTemplateUpdate(UT);
                        context.Session["userInfoEntity"] = us;
                        context.Response.Write(JsonConvert.SerializeObject(new { State = true }));
                    }
                    else
                    {
                        context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
                    }
                }
                else
                {
                    if (MgrServices.UserAddService.UpdateUserInfo(us))
                    {
                        UTemplateEntity UT = new UTemplateEntity();
                        UT._addfiletemplate = JsonConvert.SerializeObject(sds);
                        UT._createtime = DateTime.Now;
                        UT._u_id = 1;
                        MgrServices.UserAddService.UTemplateUpdate(UT);
                        context.Session["userInfoEntity"] = us;
                        context.Response.Write(JsonConvert.SerializeObject(new { State = true }));
                    }
                    else
                    {
                        context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
                    }
                }
            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false, Error = "个人信息未变更，此次更改属无效操作" }));
            }

        }
        /// <summary>
        /// 创建人:李超
        /// 创建时间:2016/9/28
        /// 功能介绍:根据类型和属性名称得到属性值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <param name="propertyname"></param>
        /// <returns></returns>
        public string GetObjectPropertyValue<T>(T t, string propertyname)
        {
            Type type = typeof(T);

            PropertyInfo property = type.GetProperty(propertyname);

            if (property == null) return string.Empty;

            object o = property.GetValue(t, null);

            if (o == null) return string.Empty;

            return o.ToString();
        }
        public void LoadUserPic(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            context.Response.Write(us._u_img);
        }
        public void CheckCurrentPwd(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            Dictionary<string, bool> ds = new Dictionary<string, bool>();
            if (us._u_password != MD5Helper.Upper32(Common.GetRequest("currentPwd")))
            {
                ds.Add("valid", false);
            }
            else
            {
                ds.Add("valid", true);
            }
            context.Response.Write(JsonConvert.SerializeObject(ds));
            context.Response.End();
        }
        public void AlterPwd(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            us._u_password = MD5Helper.Upper32(Common.GetRequest("newPwd"));
            bool isSuccess = MgrServices.UserAddService.updetapwds(us);
            if (isSuccess)
            {
                context.Session["userInfoEntity"] = us;
            }
            context.Response.Write(isSuccess);
            context.Response.End();
        }
        /// <summary>
        /// 创建人:李超
        /// 创建时间:2016/10/28
        /// 功能介绍:查看当前用户是否为管理员,并返回其所拥有的权限
        /// </summary>
        public void LoadDepartmentFun(HttpContext context)
        {
            U_UserInfoEntity us = context.Session["userInfoEntity"] as U_UserInfoEntity;
            if (us == null)
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                    return;
                us = MgrServices.UserAddService.GetEntityInfo(loginName, EnterpriseCode);
            }
            if (Convert.ToInt32(us._r_id) != 1)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = JsonConvert.SerializeObject(MgrServices.FunctionService.GetAdminFunByUserID(Convert.ToInt32(us._u_id))) }));

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