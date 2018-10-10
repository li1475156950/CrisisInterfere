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
namespace CrisisInterfere.FunctionModular.Warning.ajax
{
    /// <summary>
    /// Warning 的摘要说明
    /// </summary>
    public class Warning : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string type = context.Request["type"];
            switch (type)
            {
                case "OnLoadDep":
                    GetDepartmentTemp(context);
                    break;
                case "InitAmount":
                    InitSelAmount(context);
                    break;
                case "InitWD":
                    InitSelWD(context);
                    break;
                case "LoadWring":
                    LoadWring(context);
                    break;
                case "Del_ByCode":
                    Del_ByCode(context);
                    break;
                case "Del_ByCodeList":
                    Del_ByCodeList(context);
                    break;
            }
        }

        public DataSet GetWarningTemp(HttpContext context)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                //  type=LoadWring&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&SatrtTime=' + startTime + '&EndTime=' + endTime + '&sex=' + sex + '&AcodeStr=' + LB_Code_Str + '&WcodeStr=' + WD_Code_Str + '&LogingName' + loginName
                int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));//开始页码
                int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));//结束页码
                DateTime SatrtTime = Common.GetRequest("SatrtTime") == "" ? Convert.ToDateTime("1900-01-01") : Convert.ToDateTime(Common.GetRequest("SatrtTime")).AddDays(-1);//开始时间
                DateTime EndTime = Common.GetRequest("EndTime") == "" ? Convert.ToDateTime("1900-01-01") : Convert.ToDateTime(Common.GetRequest("EndTime")).AddDays(1);//结束时间
                string sex = Common.GetRequest("sex");//性别
                string AcodeStr = Common.GetRequest("AcodeStr");//量表编码
                string WcodeStr = Common.GetRequest("WcodeStr");//维度编码
                string LogingName = Common.GetRequest("LogingName");//登录名
                int BM = Convert.ToInt32(Common.GetRequest("bm"));

                if (AcodeStr != null && AcodeStr.Length > 0)
                {
                    var strList = AcodeStr.Split(',');
                    if (strList != null && strList.Length > 0)
                    {
                        AcodeStr = "";
                        for (var k = 0; k < strList.Length; k++)
                        {
                            if (AcodeStr != "")
                            {
                                AcodeStr += ",\'" + strList[k] + "\'";
                            }
                            else
                            {
                                AcodeStr += "\'" + strList[k] + "\'";
                            }
                        }

                    }
                }

                if (WcodeStr != null && WcodeStr.Length > 0)
                {

                    var wdList = WcodeStr.Split(',');
                    if (wdList != null && wdList.Length > 0)
                    {
                        WcodeStr = "";
                        for (var t = 0; t < wdList.Length; t++)
                        {

                            if (WcodeStr != "")
                            {
                                WcodeStr += ",\'" + wdList[t] + "\'";
                            }
                            else
                            {
                                WcodeStr += "\'" + wdList[t] + "\'";
                            }

                        }
                    }
                }

                string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (LicenseCode == null)
                    return null;
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return null;
                int U_ID = Convert.ToInt32(_uID);
                string currentLoginName = Common.GetSessionValue("loginName", context);
                if (currentLoginName == null)
                    return null;
                SourceTemp = MgrServices.InspectionWarningService.Get_ShowIWTemp(SatrtTime, EndTime, currentLoginName, LogingName, sex, BM, AcodeStr, WcodeStr, StarPageIndex, EndPageIndex, LicenseCode, U_ID);
            }
            catch
            {

            }
            return SourceTemp;
        }

        public DataTable GetIW_Temp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {

                DateTime StarTime = Convert.ToDateTime(Common.GetRequest("_StarTime"));//开始时间
                DateTime EndTime = Convert.ToDateTime(Common.GetRequest("_EndTime"));//结束时间
                string U_LoginName = Common.GetRequest("_U_LoginName");//登录名
                string U_Sex = Common.GetRequest("_U_Sex");//测评人员性别
                int Department_ID = Convert.ToInt32(Common.GetRequest("_Department_ID"));//部门ID
                string Amount_Code = Common.GetRequest("_Amount_Code");//量表编码
                string DimensionCode = Common.GetRequest("_DimensionCode");//维度编码
                int StartPage = Convert.ToInt32(Common.GetRequest("_StartPage"));//开始条数
                int EndPage = Convert.ToInt32(Common.GetRequest("_EndPage"));//结束条数

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
                string d_icon = "";
                //string d_icon = "../../CSS/images/Icon/50.png";

                if (!string.IsNullOrEmpty(authtxt) && authtxt.IndexOf(row["D_ID"].ToString()) == -1 && authtxt != "0")
                    //d_icon = "../../CSS/images/Icon/50.png";
                    d_icon = "";
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
                        mex.Text = DTR["Amount_DisplayName"].ToString();
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
        /// 创建人：刘玉京
        /// 创建时间：2016-12-11
        /// 功能介绍：根据量表编码查询量表下对应的维度
        /// </summary>
        /// <returns></returns>
        public DataTable Wd_Temp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string Acode = Common.GetRequest("aCode");
                SourceTemp = MgrServices.InspectionWarningService.GetA_WD(Acode);
            }
            catch
            {
            }
            return SourceTemp;
        }



        /// <summary>
        /// 初始化维度下拉列表
        /// </summary>
        /// <param name="context"></param>
        public void InitSelWD(HttpContext context)
        {

            try
            {
                DataTable SourceTemp = new DataTable();
                SourceTemp = Wd_Temp();
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["DimensionName"].ToString();
                        mex.Value = DTR["DimensionCode"].ToString();
                        listT.Add(mex);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }

            }
            catch
            {

            }
        }


        public void LoadWring(HttpContext context)
        {
            try
            {
                PageInfo page = new PageInfo();
                string WcodeStr = Common.GetRequest("WcodeStr");//维度编码
                DataSet SourceTemp = new DataSet();
                SourceTemp = GetWarningTemp(context);

                if (SourceTemp != null && SourceTemp.Tables.Count > 0)
                {

                    page.recordsTotal = Convert.ToInt32(SourceTemp.Tables[0].Rows[0][0]);
                    if (page.recordsTotal > 0)
                    {
                        DataTable data = SourceTemp.Tables[1];
                        foreach (DataRow SourceRow in data.Rows)
                        {
                            string temp = SourceRow["RowIndex"].ToString();
                            string Level = SourceRow["NormWarningLevel_Level"].ToString().Replace(")", "").Replace("(", "").Replace("（", "").Replace("）", "");
                            String[] arr =
                            {
                              "",
                              SourceRow["RowIndex"].ToString(),
                              SourceRow["U_LoginName"].ToString(), 
                              SourceRow["U_Name"].ToString(),                              
                              SourceRow["U_Sex"].ToString(), 
                              SourceRow["D_name"].ToString(), 
                              SourceRow["Amount_DisplayName"].ToString(), 
                              SourceRow["DimensionName"].ToString(), 
                              Level, 
                              SourceRow["Answer_CreateTime"].ToString(), 
                              "",SourceRow["AnswerAdd_ID"].ToString(),//11
                              SourceRow["CrisisList_Code"].ToString(),//12
                              SourceRow["Amount_Code"].ToString(),//13                             
                            };
                            page.data.Add(arr);
                        }
                    }
                    page.recordsFiltered = page.recordsTotal;
                    String json = Common.ObjectToJson(page);
                    context.Response.Write(json);

                }
                else
                {
                    page.recordsFiltered = page.recordsTotal;
                    String json = Common.ObjectToJson(page);
                    context.Response.Write(json);
                }
            }
            catch
            { }
        }



        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-12-31
        /// 功能介绍：根据预警编码删除危机预警
        /// </summary>
        public void Del_ByCode(HttpContext context)
        {
            try
            {
                string C_Code = Common.GetRequest("CID");
                int delresult = MgrServices.InspectionWarningService.DelCrisisListByCode(C_Code);
                context.Response.Write(delresult);
            }
            catch
            {

            }

        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-12-31
        /// 功能介绍：根据危机预警编码集合删除危机预警
        /// </summary>
        public void Del_ByCodeList(HttpContext context)
        {
            try
            {
                string C_Code_Str = Common.GetRequest("CID_List");
                int delresult = MgrServices.InspectionWarningService.DelCrisisListByCodeList(C_Code_Str);
                context.Response.Write(delresult);
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