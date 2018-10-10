using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.projrem;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.StatisticalAnalysis.Ajax
{
    /// <summary>
    /// Statistical 的摘要说明
    /// </summary>
    public class Statistical : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            //InitST
            string type = context.Request["Remark"];
            switch (type)
            {
                case "InitAmount":
                    InitSelAmount(context);
                    break;
                case "OnLoadDep":
                    GetDepartmentTemp(context);
                    break;
                case "OnLoadUserList":
                    InitUserList(context);
                    break;
                case "InitST":
                    InitST(context);
                    break;
            }

        }



        /// <summary>
        /// 初始化量表下拉列表
        /// </summary>
        /// <param name="context"></param>
        public void InitSelAmount(HttpContext context)
        {

            try
            {
                DataTable SourceTemp = new DataTable();
                SourceTemp = GetAmountTemp();
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["Amount_Name"].ToString();
                        mex.Value = DTR["Amount_Code"].ToString();
                        listT.Add(mex);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }

            }
            catch
            {

            }
        }


        /// <summary>
        /// 获取授权的量表数据集合
        /// </summary>
        /// <returns></returns>
        public DataTable GetAmountTemp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", HttpContext.Current);
                if (LicenseCode == null)
                    return null;
                SourceTemp = MgrServices.InspectionWarningService.GetAmountList(LicenseCode);
            }
            catch
            {
            }
            return SourceTemp;
        }



        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-18
        /// 功能介绍：获取当前企业下面的所有部门集合
        /// </summary>
        /// <returns></returns>
        private void GetDepartmentTemp(HttpContext context)
        {

            try
            {
                string LoginName = Common.GetSessionValue("loginName", context);
                if (LoginName == null)
                    return;
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;

                DataTable SourceTemp = MgrServices.Department.Departments(EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    StringBuilder str = new StringBuilder();
                    str.Append("[");
                    str.Append("{\"id\":0,\"text\":\"无\",\"d_icon\":\"\"},");
                    str.Append(GetTreeString(0, SourceTemp, null));
                    str.Replace(",", "", str.Length - 1, 1);
                    str.Append("]");
                    context.Response.Write(str);
                }
            }
            catch
            { }


        }



        private static string GetTreeString(int Id, DataTable table, string authtxt)
        {
            DataRow[] rows = table.Select(string.Format("D_chiID={0}", Id));

            if (rows.Length == 0) return string.Empty; ;
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
        /// 初始化测试用户表
        /// </summary>
        private void InitUserList(HttpContext context)
        {
            try
            {
                DataSet sourceTemp = GetUserTemps();
                PageInfo page = new PageInfo();
                if (sourceTemp != null && sourceTemp.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(sourceTemp.Tables[0].Rows[0][0]);
                    if (page.recordsTotal > 0)
                    {
                        DataTable data = sourceTemp.Tables[1];
                        foreach (DataRow SourceRow in data.Rows)
                        {
                            String[] arr =
                            {
                              //"",
                              SourceRow["AnswerAdd_ID"].ToString(),
                              SourceRow["rindex"].ToString(),                              
                              SourceRow["U_LoginName"].ToString(),
                              SourceRow["U_Name"].ToString(),
                             Convert.ToDateTime(SourceRow["Answer_CreateTime"]).ToString("yyyy-MM-dd HH:mm") 
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






        /// <summary>
        /// 获取待测试的人员信息
        /// </summary>
        /// <returns></returns>
        public DataSet GetUserTemps()
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", HttpContext.Current);
                if (EnterpriseCode == null)
                    return null;
                string Acode = Common.GetRequest("A_Code");
                int D_ID = Convert.ToInt32(Common.GetRequest("DID"));
                string sex = Common.GetRequest("sex");
                int startIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                int Endindex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                DateTime S_Time = Common.GetRequest("ST") == "" ? Convert.ToDateTime("2016-1-1") : Convert.ToDateTime(Common.GetRequest("ST")).AddDays(-1);//部门
                //DateTime S_Time = Convert.ToDateTime(Common.GetRequest("ST"));
                DateTime E_Time = Common.GetRequest("ET") == "" ? Convert.ToDateTime("2016-1-1") : Convert.ToDateTime(Common.GetRequest("ET")).AddDays(1);//部门
                //DateTime E_Time = Convert.ToDateTime(Common.GetRequest("ET")).AddDays(1);
                //DateTime S_Time = Convert.ToDateTime("2016/12/31");
                //DateTime E_Time = Convert.ToDateTime("2016/12/31");
                string _uID = Common.GetSessionValue("UserID", HttpContext.Current);
                if (_uID == null)
                    return null;
                var userID = Convert.ToInt32(_uID);
                var userRoleType = MgrServices.UserAddService.GetUserRoleType(userID);
                SourceTemp = MgrServices.StatisticalService.GetStatisticaUser(userID, userRoleType, Acode, D_ID, sex, EnterpriseCode, startIndex, Endindex, S_Time, E_Time);
            }
            catch
            {
            }
            return SourceTemp;

        }



        public void InitST(HttpContext context)
        {

            try
            {
                DataTable SourceTemp = new DataTable();
                SourceTemp = T_Table();
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        if (DTR["DistributionName"].ToString().Equals(""))
                        {
                            continue;
                        }
                        mex = new ComboxMes();
                        mex.Text = DTR["DistributionName"].ToString();
                        mex.Value = DTR["DistributionName"].ToString();
                        listT.Add(mex);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }



            }
            catch
            {

            }
        }

        /// <summary>
        /// 查询当前的测试类型
        /// </summary>
        /// <returns></returns>
        private DataTable T_Table()
        {

            DataTable temp = new DataTable();
            try
            {

                string Amount_Code = Common.GetRequest("aCode");
                string didstr = Common.GetRequest("Did") == "" ? "0" : Common.GetRequest("Did");
                int DepartmentID = Convert.ToInt32(didstr);
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", HttpContext.Current);
                if (EnterpriseCode == null)
                    return null;
                DateTime S_Time = Convert.ToDateTime(Common.GetRequest("StarTime"));
                DateTime E_Time = Convert.ToDateTime(Common.GetRequest("EndTime"));
                temp = MgrServices.StatisticalService.GetTestType(Amount_Code, DepartmentID, EnterpriseCode, S_Time, E_Time);

            }
            catch
            {

            }

            return temp;
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