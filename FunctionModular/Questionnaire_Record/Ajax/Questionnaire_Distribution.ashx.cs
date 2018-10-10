using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using BR_Service;
using Newtonsoft.Json;
using CrisisInterfere.DistributeRecordService;
using CrisisInterfere.FunctionModular.HeartEvaluation_DistributionRecord.Ajax;

namespace CrisisInterfere.FunctionModular.Questionnaire_Record.Ajax
{
    /// <summary>
    /// 创建人：田闯 
    /// 创建时间：2017/4/14 16：09
    /// 问卷分配时间处理类
    /// </summary>
    public class Questionnaire_Distribution : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string createName = Common.GetSessionValue("loginName", context);
            if (createName == null)
                return;
            string _uId = Common.GetSessionValue("UserID", context);
            if (_uId == null)
                return;
            int creapepleId = Convert.ToInt32(_uId);
            string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (enterpriseCode == null)
                return;

            string type = Common.GetRequest("type");
            switch (type)
            {
                case "GetUserInfo":
                    int starPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));

                    int departmentId = context.Request["departmentID"] == "" ? 0 : Convert.ToInt32(context.Request["departmentID"]);//部门
                    int selRoleType = 0;
                    if (Common.GetRequest("Sel_RoleType") != null && Common.GetRequest("Sel_RoleType") != "")
                    {
                        selRoleType = Convert.ToInt32(Common.GetRequest("Sel_RoleType")); //角色
                    }
                    string userInfos = "";
                    if (Common.GetRequest("user_infos") != null && Common.GetRequest("user_infos") != "")
                    {
                        userInfos = Convert.ToString(Common.GetRequest("user_infos")); //角色
                    }
                    InitGaugePages(createName, starPageIndex, endPageIndex, creapepleId, enterpriseCode, departmentId, selRoleType, userInfos, context);
                    break;
                case "Insert":
                    string U_IDs = Common.GetRequest("U_IDs");
                    string names = Common.GetRequest("name");
                    U_IDs = U_IDs.Substring(0, U_IDs.Length - 1);
                    context.Response.Write(DInsert(U_IDs,names, creapepleId, context));
                    break;
            }
        }
        private DataSet GetGaugeTemp(string createName, int starPageIndex, int endPageIndex, int uid, string enterpriseCode, int departmentId, int selRoleType, string userInfos)
        {
            DataSet sourceTemp = new DataSet();
            try
            {
                sourceTemp = MgrServices.DistributeRecordService.GetDistrubuteUserInfo(createName, starPageIndex, endPageIndex, uid, enterpriseCode, departmentId, selRoleType, userInfos);
            }
            catch
            {
            }
            return sourceTemp;
        }

        private void InitGaugePages(string createName, int starPageIndex, int endPageIndex, int uid, string enterpriseCode, int departmentId, int selRoleType, string userInfos, HttpContext context)
        {
            try
            {
                PageInfo page = new PageInfo();
                DataSet sourceTemps = new DataSet();
                sourceTemps = GetGaugeTemp(createName, starPageIndex, endPageIndex, uid, enterpriseCode, departmentId, selRoleType, userInfos);
                DataTable sourceTemp = new DataTable();
                if (sourceTemps != null && sourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(sourceTemps.Tables[0].Rows[0][0]);
                    sourceTemp = sourceTemps.Tables[1];
                    if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow dtr in sourceTemp.Rows)
                        {
                            String[] arr =
                            {
                                dtr["U_ID"].ToString(), //用ID
                                "", //选框
                                dtr["PageIndex"].ToString(),//序号	
                                dtr["U_LoginName"].ToString(),//用户登录名
                                dtr["U_Name"].ToString(),//用户名称
                                dtr["Role_Name"].ToString(),//角色名称
                                dtr["D_name"].ToString(),//部门名称                       
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
        public string DInsert(string UDs,string name, int CreatPepleID, HttpContext context)
        {
            string json = "";
            DistributionGauge.State st = new DistributionGauge.State();
            if (UDs != null && UDs != "")
            {
                string NoticeName = "";
                NoticeName = "您有一个新的问卷！";
                string[] sArray = UDs.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                string[] nameArr = name.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                string amode = "";
                st.Sucess = 0;
                if (Common.GetRequest("QCode") != null && Common.GetRequest("QCode") != "")
                {
                    amode = Common.GetRequest("QCode");
                    bool _anonymity = true;//允许匿名作答
                    if (Common.GetRequest("Anonymity") != null)
                    {
                        string temp = Common.GetRequest("Anonymity");
                        _anonymity = temp == "1" ? true : false;
                    }
                    amode = amode.Substring(0, amode.Length - 1);
                    string[] sArrays = amode.Split(',');
                    Int64 _uId = 0;
                    if (Common.GetSessionValue("UserID", context) != null)
                        _uId = Convert.ToInt64(Common.GetSessionValue("UserID", context));
                    int sumCount = 0;
                    foreach (string str in sArrays)//问卷
                    {
                        if (str != "0")
                        {
                            Questionnaire_Distribution_RelationEntity QModel = new Questionnaire_Distribution_RelationEntity();
                            QModel._qCode = str;
                            int index = 0;
                            foreach (string i in sArray)//用户
                            {
                                long aa = MgrServices.QuestionnaireService.GetCount(str, Convert.ToInt32(i));
                                if (aa == 0)
                                {
                                    st.Sucess += 1;
                                    QModel._createTime = DateTime.Now;
                                    QModel._disUId = i;
                                    QModel._uId = _uId;
                                    QModel._is_Anonymity = _anonymity;
                                    QModel._is_Delete = false;
                                    QModel._qCode = str;
                                    QModel._code = "QD_" + Common.GetTimeStampIW(sumCount);
                                    long QID = MgrServices.DistributeRecordService.QInsert(QModel);

                                    sumCount++;
                                }
                                else
                                {
                                    st.FailName += nameArr[index]+",";
                                    st.Fail = st.Fail + 1;
                                }
                                index++;
                            }
                        }
                        else
                        {
                            st.Fail = sArray.Length + sArrays.Length;
                        }
                    }
                }
                json = JsonConvert.SerializeObject(st);
                return json;
            }
            else
            {
                json = "{}";
                return json;
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