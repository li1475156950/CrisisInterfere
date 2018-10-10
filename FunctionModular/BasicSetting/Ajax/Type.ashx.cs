using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using CrisisInterfere.projrem;

namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// Type 的摘要说明
    /// </summary>
    public class Type : IHttpHandler, IRequiresSessionState
    {
        private HttpContext PubliContext;

        public void ProcessRequest(HttpContext context)
        {
            //string isTimeOut = Common.GetSessionValue("UserID", context);
            //if (isTimeOut == null)
            //    return;

            PubliContext = context;
            int Remarks = Convert.ToInt32(Common.GetRequest("Remark"));
            switch (Remarks)
            {
                case 1:
                    InitRoleType(context);
                    break;
                case 2:
                    InitRoleTypeBath(context);
                    break;
            }
        }
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建时间：2016-09-07
        /// 功能介绍：初始化量表类别下拉列表
        /// </summary>
        private void InitRoleType(HttpContext context)
        {
            try
            {

                DataTable SourceType = new DataTable();
                SourceType = GetRoleType(context);
                if (SourceType != null && SourceType.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceType.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["Role_Name"].ToString();
                        mex.Value = DTR["Role_ID"].ToString();
                        mex.Funtype = Convert.ToInt32(DTR["Funtype"]);
                        mex.RoleType = DTR["Role_Type"].ToString();
                        listT.Add(mex);
                    }
                    PubliContext.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }
            }
            catch
            {


            }
        }

        /// <summary>
        /// 创建人：刘亚娟
        /// 创建时间：2016-09-07
        /// 功能介绍：获取角色名称
        /// </summary>
        /// <returns></returns>
        private DataTable GetRoleType(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string _userID = Common.GetSessionValue("UserID", context);
                if (_userID == null)
                    return null;
                var userID = Convert.ToInt32(_userID);
                string _role_type = Common.GetSessionValue("role_type", context);
                if (_role_type == null)
                    return null;
                var role_type = Convert.ToInt32(_role_type);
                SourceTemp = MgrServices.UserAddService.GetRoleTypeTemp(userID, role_type);
            }
            catch (Exception ex)
            { }

            return SourceTemp;
        }
        private void InitRoleTypeBath(HttpContext context)
        {
            try
            {
                string _userID = Common.GetSessionValue("UserID", context);
               
                var userID = Convert.ToInt32(_userID);
                string _role_type = Common.GetSessionValue("role_type", context);             
                var role_type = Convert.ToInt32(_role_type);
                DataTable SourceType = new DataTable();
                SourceType = MgrServices.UserAddService.GetRoleTypeTempBath(userID, role_type); ;
                if (SourceType != null && SourceType.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceType.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["Role_Name"].ToString();
                        mex.Value = DTR["Role_ID"].ToString();
                        mex.Funtype =0;
                        mex.RoleType = DTR["Role_Type"].ToString();
                        listT.Add(mex);
                    }
                    PubliContext.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }
            }
            catch
            {


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