using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.SessionState;
using CrisisInterfere.EnterpriseOnlineService;

namespace CrisisInterfere.FunctionModular.BasicSetting
{
    /// <summary>
    /// DepartmentMain1 的摘要说明
    /// 创建人：刘玉京
    /// 创建时间：2016-10-18
    /// 功能介绍：部门管理功能模块一般处理程序
    /// </summary>
    public class DepartmentMain1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            string Remark = Common.GetRequest("Remark");
            string LoginName = "";
            string Encode = "";

            LoginName = Common.GetSessionValue("loginName", context);
            if (LoginName == null)
                return;
            Encode = Common.GetSessionValue("EnterpriseCode", context);
            if (Encode == null)
                return;
            switch (Remark)
            {
                case "OnLoadDep":
                    GetDepartmentTemp(LoginName, context);
                    break;
                case "InitDep":
                    string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                    if (EnterpriseCode == null)
                        return;
                    InitDepStr(EnterpriseCode, context);
                    break;
                case "DepAdd":
                    string en = Common.GetSessionValue("EnterpriseCode", context);
                    if (en == null)
                        return;
                    DepartmentInsert(en, context);
                    break;
                case "befor_delete":
                    BeforDelete(context);
                    break;
                case "de_del":
                    DepartmentDelete(context);
                    break;
                case "sel_ID":
                    DepartmentAselect(context);
                    break;
                case "DepUp":
                    DepartmentD_updeta(context);
                    break;
                case "DepartmentAuthority":
                    GetDepartmentAuthority(LoginName, context);
                    break;
                case "GetDepartments":
                    GetDepartments(LoginName, context);
                    break;
                case "DepartmentAuthorityRole":
                    string RoleTypes = Common.GetRequest("Roletype");
                    GetDepartmentAuthorityRole(LoginName, RoleTypes, context);
                    break;
                case "GetEntity_More":
                    GetEntity_More(context);
                    break;

            }

        }
        /// <summary>
        /// 根据部门id获取部门信息
        /// </summary>
        /// <param name="context"></param>
        private void GetEntity_More(HttpContext context)
        {
            try
            {
                string ids = context.Request["ids"];
                ids = ids.Replace(",", ";");
                List<string> str = ids.Split(new string[] { ";" }, StringSplitOptions.RemoveEmptyEntries).ToList();
                List<CrisisInterfere.DepartmentService.DepartmentEntity> list = MgrServices.Department.Aselect_More(str);
                if (list != null && list.Count > 0)
                {   
                    string json=JsonConvert.SerializeObject(list);
                    context.Response.Write(json);
                }
                else
                    context.Response.Write("");
            }
            catch (Exception)
            {
                throw;
            }
        }
        //private void InitTempTree(HttpContext context)
        //{

        //    try
        //    {
        //        DataTable SourceTemp = MgrServices.Department.Departments();
        //        if (SourceTemp != null && SourceTemp.Rows.Count > 0)
        //        {

        //            StringBuilder str = new StringBuilder();
        //            str.Append("[");
        //            //str.Append("{\"D_ID\":0,\"D_name\":\"无\",\"D_Remark\":\"\",\"D_number\":0,\"D_chiID\":0},");
        //            str.Append(GetTempTreeString(0, SourceTemp, null));
        //            str.Replace(",", "", str.Length - 1, 1);
        //            str.Append("]");
        //            context.Response.Write(str);
        //        }
        //    }
        //    catch
        //    { }
        //}
        private void GetTempTree(int Id, DataTable table, string authtxt, ref PageInfo page, string Encode)
        {
            DataRow[] rows = table.Select(string.Format("D_chiID={0}", Id));

            if (rows.Length > 0)
            {
                foreach (DataRow row in rows)
                {
                    int peopleCount = 0;
                    var num = GetPeopleCountByDepID(Convert.ToInt32(row["D_ID"]), ref peopleCount);
                    String[] arr =
                                    {
                                        row["D_ID"].ToString(), //部门ID
                                        row["D_name"].ToString(), //部门名称
                                        row["D_Remark"].ToString(), //部门描述
                                        //row["D_number"].ToString(), //部门成员数
                                        num.ToString(),
                                        "",  
                                        row["D_chiID"].ToString(), //部门成员数
                                    };
                    page.data.Add(arr);
                    GetTempTree(Convert.ToInt32(row["D_ID"]), table, authtxt, ref page, Encode);
                }
            }
        }
        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-18
        /// 功能介绍：获取当前企业下面的所有部门集合
        /// </summary>
        /// <returns></returns>
        private void GetDepartmentTemp(string LoginName, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                DataTable SourceTemp = MgrServices.Department.DepartmentsA(LoginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"全部\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(0, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        /// <summary>
        /// 创建人：李兆典
        /// 创建时间：2017-1-10
        /// 功能介绍：获取当前企业下面的所有部门集合id为o
        /// </summary>
        /// <returns></returns>
        private void GetDepartments(string LoginName, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                DataTable SourceTemp = MgrServices.Department.DepartmentsA(LoginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    if (Common.GetRequest("mark") == "searchCondition")
                    {
                        str.Append("{\"id\":0,\"text\":\"全部\",\"d_icon\":\"\"},");
                    }
                    str.Append(GetTreeString(-1, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        /// <summary>
        /// 刘亚娟
        /// 权限
        /// </summary>
        /// <param name="LoginName"></param>
        /// <param name="context"></param>
        private void GetDepartmentAuthority(string LoginName, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                DataTable SourceTemp = MgrServices.Department.GetDepartmentAuthority(LoginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(-1, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
                else
                {
                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"}");

                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        private static string GetTreeString(int Id, DataTable table, string authtxt)
        {
            DataRow[] rows;
            if (Id == -1)
                rows = table.AsEnumerable().Where(x => table.AsEnumerable().Where(y => y["D_ID"].ToString() == (x["D_chiID"].ToString())).Count() == 0).ToArray();
            else
                rows = table.Select(string.Format("D_chiID={0}", Id));
            if (rows.Length == 0) return string.Empty;
            StringBuilder str = new StringBuilder();

            foreach (DataRow row in rows)
            {
                //string d_icon = "../" + (string)row["d_icon"];

                string d_icon = "../../CSS/images/Icon/50.png";

                if (!string.IsNullOrEmpty(authtxt) && authtxt.IndexOf(row["D_ID"].ToString()) == -1 && authtxt != "0")
                    d_icon = "../../CSS/images/Icon/50.png";

                str.Append("{\"id\":" + (int)row["D_ID"] + ",\"text\":\"" + row["D_name"].ToString() + "\",\"d_icon\":\"" + d_icon + "\"");

                if (GetTreeString((int)row["D_ID"], table, authtxt).Length > 0)
                {
                    str.Append(",\"children\":[");
                    str.Append(GetTreeString((int)row["D_ID"], table, authtxt));
                    str.Append("]},");
                }
                else
                {
                    str.Append("},");
                }
            }
            return str[str.Length - 1] == ',' ? str.ToString(0, str.Length - 1) : str.ToString();
        }
        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-19
        /// 功能介绍：初始化部门数据集合页面参数格式
        /// </summary>
        private void InitDepStr(string Ecode, HttpContext context)
        {
            try
            {
                PageInfo page = new PageInfo();
                DataTable SourceTemp = new DataTable();
                SourceTemp = GetDepTemp(Ecode, context);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    DataRow[] DTRList = SourceTemp.Select(string.Format("D_chiID={0}", 0));
                    if (DTRList != null && DTRList.Length > 0)
                    {
                        foreach (DataRow DTR in DTRList)
                        {
                            int peopleCount = 0;
                            String[] arr =
                                    {
                                        DTR["D_ID"].ToString(), //部门ID
                                        DTR["D_name"].ToString(), //部门名称
                                        DTR["D_Remark"].ToString(), //部门描述
                                        GetPeopleCountByDepID(Convert.ToInt32(DTR["D_ID"]),ref peopleCount).ToString(),
                                        "",  
                                        DTR["D_chiID"].ToString(), //部门成员数
                                    };
                            page.data.Add(arr);
                            GetTempTree(Convert.ToInt32(DTR["D_ID"].ToString()), SourceTemp, null, ref  page, Ecode);
                        }
                    }
                }
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            { }
        }
        /// <summary>
        /// 插入语句
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentInsert(string EnterpriseCode, HttpContext context)
        {
            try
            {
                var D_name = context.Request["D_name"].Replace(" ", "");
                var D_Remark = context.Request["D_Remark"];
                var D_chiID = context.Request["D_chiID"];
                CrisisInterfere.DepartmentService.DepartmentEntity de = new DepartmentService.DepartmentEntity();
                de._d_name = D_name;
                de._d_remark = D_Remark;
                de._d_chiid = D_chiID;
                de.d_code = EnterpriseCode;
                string _id = Common.GetSessionValue("UserID", context);
                if (_id == null)
                    return;
                de.create_id = Convert.ToInt32(_id);
                long DResult = MgrServices.Department.DepartmentInsert(de);
                if (DResult > 0)
                {
                    DepartmentLicense_InfoEntity entityInfo = new DepartmentLicense_InfoEntity();
                    //插入授权编码关系表
                    entityInfo._licensecode = Common.GetSessionValue("LicenseCode", context);
                    if (entityInfo._licensecode == null)
                        return;

                    //sesion获取用户的授权编码
                    entityInfo._d_id = Convert.ToInt32(DResult);
                    entityInfo._is_delete = 0;
                    entityInfo._createtime = DateTime.Now;
                    EOInsert(entityInfo);
                    context.Response.Write("1");

                }
                else
                {
                    context.Response.Write("0");
                }
            }
            catch
            { }

        }
        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-19
        /// 功能介绍：获取部门集合
        /// </summary>
        /// <returns></returns>
        public DataTable GetDepTemp(string Ecode, HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                    return null;
                SourceTemp = MgrServices.Department.GetDepTemp(loginName, Ecode);
            }
            catch
            {
            }
            return SourceTemp;
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/6/9
        /// 删除部门之前先删除相关用户
        /// </summary>
        /// <param name="context"></param>
        private void BeforDelete(HttpContext context)
        {
            string result = "0";
            try
            {
                int D_ID = Convert.ToInt32(Common.GetRequest("D_ID"));
                //result = MgrServices.DistributeRecordService.BeforDelete(D_ID)==false?"0":"1";
                MgrServices.DistributeRecordService.BeforDelete(D_ID);
                context.Response.Write("1");
            }
            catch
            {
                context.Response.Write(result);
            }
        }
        /// <summary>
        /// 删除一条数据到回收站。
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentDelete(HttpContext context)
        {
            int D_ID = Convert.ToInt32(Common.GetRequest("D_ID"));
            bool result = MgrServices.Department.UPdataDelete(D_ID);
            if (result)
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }
        public void DepartmentAselect(HttpContext context)
        {
            try
            {
                CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();
                int D_ID = Convert.ToInt32(Common.GetRequest("UP_D_ID"));
                model = MgrServices.Department.Aselect(D_ID);
                string json = JsonConvert.SerializeObject(model);
                context.Response.Write(json);
            }
            catch
            { }
        }
        public void DepartmentD_updeta(HttpContext context)
        {
            try
            {
                CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();
                int D_ID = Convert.ToInt32(context.Request["UP_D_IDS"]);
                string D_name = context.Request["D_name"];
                string D_Remark = context.Request["D_Remark"];
                model._d_id = D_ID;
                model._d_remark = D_Remark;
                model._d_name = D_name;
                model._d_chiid = context.Request["ChildID"];
                bool result = MgrServices.Department.updata(model);
                if (result)
                {
                    context.Response.Write("1");
                }
                else
                {
                    context.Response.Write("0");
                }
            }
            catch
            {

            }
        }
        private void GetDepartmentAuthorityRole(string LoginName, string Roletype, HttpContext context)
        {

            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                DataTable SourceTemp = new DataTable();
                if (EnterpriseCode == null)
                    return;
                if (Roletype != "3")
                {
                    SourceTemp = MgrServices.Department.GetDepartmentAuthority(LoginName, EnterpriseCode);
                }

                if ((SourceTemp != null && SourceTemp.Rows.Count > 0) || Roletype == "3")
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(-1, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
                else
                {
                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"}");

                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }
        /// <summary>
        /// 插入授权编码
        /// </summary>
        /// <param name="entityInfo"></param>
        /// <returns></returns>
        public bool EOInsert(DepartmentLicense_InfoEntity entityInfo)
        {

            try
            {
                long EoID = MgrServices.EnterpriseOnlineService.EOInsert(entityInfo);
                if (EoID > 0)
                {
                    return true;
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
        public int GetPeopleCountByDepID(int depID, ref int peopleCount)
        {
            peopleCount += MgrServices.Department.GetPeopleCountByDepID(depID);
            var depList = MgrServices.Department.GetChildDepByDepID(depID);
            if (depList.Count == 0)
            {
                return peopleCount;
            }
            for (int i = 0; i < depList.Count; i++)
            {
                GetPeopleCountByDepID(depList[i], ref peopleCount);
            }
            return peopleCount;
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