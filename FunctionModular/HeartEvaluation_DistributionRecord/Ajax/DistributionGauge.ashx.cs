using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CrisisInterfere.DistributeRecordService;
using System.Web.SessionState;
using CrisisInterfere.projrem;
using Newtonsoft.Json;

namespace CrisisInterfere.FunctionModular.HeartEvaluation_DistributionRecord.Ajax
{
    /// <summary>
    /// DistributionGauge 的摘要说明
    /// </summary>
    public class DistributionGauge : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Type = Common.GetRequest("type");
            int CreapepleID = 0;
            string CreateName = Common.GetSessionValue("loginName", context);
            if (CreateName == null)
                return;
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            CreapepleID = Convert.ToInt32(_uID);
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            switch (Type)
            {
                case "GetUserInfo":
                    int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));

                   
                    int departmentID = context.Request["departmentID"] == "" ? 0 : Convert.ToInt32(context.Request["departmentID"]);//部门
                    int Sel_RoleType = 0;
                    if (Common.GetRequest("Sel_RoleType") != null && Common.GetRequest("Sel_RoleType") != "")
                    {
                         Sel_RoleType = Convert.ToInt32(Common.GetRequest("Sel_RoleType")); //角色
                    }
                    string user_infos = "";
                    if (Common.GetRequest("user_infos") != null && Common.GetRequest("user_infos") != "")
                    {
                        user_infos = Convert.ToString(Common.GetRequest("user_infos")); //角色
                    }                  
                    InitGaugePages(CreateName, StarPageIndex, EndPageIndex, CreapepleID, EnterpriseCode, departmentID, Sel_RoleType, user_infos, context);                                    
                    break;
                case "Insert":
                    string U_IDs = Common.GetRequest("U_IDs");
                    //U_IDs = U_IDs.Substring(0, U_IDs.Length - 1);
                    //int ss=  Convert.ToInt32(Common.GetRequest("Notice"));
                    context.Response.Write(DInsert(U_IDs, CreapepleID));
                    break;
            }
        }
        private DataSet GetGaugeTemp(string CreateName, int StarPageIndex, int EndPageIndex, int UID, string EnterpriseCode, int departmentID, int Sel_RoleType, string user_infos)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.DistributeRecordService.GetDistrubuteUserInfo(CreateName, StarPageIndex, EndPageIndex, UID, EnterpriseCode, departmentID, Sel_RoleType, user_infos);
            }
            catch
            {

            }

            return SourceTemp;
        }


        private void InitGaugePages(string CreateName, int StarPageIndex, int EndPageIndex, int UID, string EnterpriseCode, int departmentID, int Sel_RoleType,string user_infos, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetGaugeTemp(CreateName, StarPageIndex, EndPageIndex, UID, EnterpriseCode, departmentID, Sel_RoleType, user_infos);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    //var tempTable = MgrServices.UserAddService.GetAdminInfoByUserID(Convert.ToInt32(HttpContext.Current.Session["UserID"]));
                    SourceTemp = SourceTemps.Tables[1];
                    //DataRow dr = SourceTemp.NewRow();
                    //dr["U_ID"] = tempTable.Rows[0]["U_ID"];
                    //dr["PageIndex"] = SourceTemp.Rows.Count + 1;
                    //dr["U_LoginName"] = tempTable.Rows[0]["U_LoginName"];
                    //dr["Role_Name"] = tempTable.Rows[0]["Role_Name"];
                    //dr["D_name"] = tempTable.Rows[0]["D_name"];
                    //SourceTemp.Rows.Add(dr);
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            String[] arr =
                            {
                                DTR["U_ID"].ToString(), //用ID
                                "", //选框
                                DTR["PageIndex"].ToString(),//序号	
                                DTR["U_LoginName"].ToString(),//用户登录名
                                DTR["U_Name"].ToString(),//用户名称
                                DTR["Role_Name"].ToString(),//角色名称
                                DTR["D_name"].ToString(),//部门名称                       
                             
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
        public string DInsert(string UDs, int CreatPepleID)
        {
            string json = "";
            DistributionSetEntity model = new DistributionSetEntity();
            State st = new State();
            if (UDs != null && UDs != "")
            {
                int RandomValue = 0;
                DateTime starttime = DateTime.Now;
                DateTime endtime = DateTime.Now;
                int notice = Convert.ToInt32(Common.GetRequest("Notice"));
                string TestType = Common.GetRequest("TestType");


                int Retest = 0;
                if (Common.GetRequest("Retest") != null && Common.GetRequest("Retest") != "")
                {
                    Retest = Convert.ToInt32(Common.GetRequest("Retest"));
                }
                string NoticeName = "";
                string NoticeC = Common.GetRequest("NoticeC");
                if (NoticeC != null && NoticeC != "")
                {
                    NoticeName = NoticeC;
                }
                else
                {
                    NoticeName = "您有一个新的测评！";
                }
                int LookR = Convert.ToInt32(Common.GetRequest("LookR"));
                var data = Common.GetRequest("StarTime");
                if (Common.GetRequest("StarTime") != null && Common.GetRequest("StarTime") != "")
                {
                    model._answerstarttime = DateTime.Parse(Common.GetRequest("StarTime"));
                }
                else 
                {
                    model._answerstarttime = DateTime.Parse("0001-01-01");
                }
                if (Common.GetRequest("EndTime") != null && Common.GetRequest("EndTime") != "")
                {
                    model._answerendtime = DateTime.Parse(Common.GetRequest("EndTime"));
                }
                else
                {
                    model._answerendtime = DateTime.Parse("0001-01-01");
                }

                if (Common.GetRequest("RandomValue") != null && Common.GetRequest("RandomValue") != "")
                {
                    RandomValue = Convert.ToInt32(Common.GetRequest("RandomValue"));
                }
                if (notice == 1)//0是不发送，3是全是发送，1是站内信，2是邮件
                {

                    Write(UDs, "", NoticeName, 3, CreatPepleID);
                }
                else if (notice == 2)
                {
                    RemindByEmail(UDs, NoticeName);
                }
                else if (notice == 3)
                {
                    Write(UDs, "", NoticeName, 3, CreatPepleID);
                    RemindByEmail(UDs, NoticeName);
                }
               
                model._distributionname = TestType;
                model._is_again = Retest;
                model._u_id = CreatPepleID;
                model._is_notice = notice;
                model._is_seereport = LookR;
                
               
                model._is_present = RandomValue;
                model._sendcontent = NoticeC;
               
                long DID = MgrServices.DistributeRecordService.InsertDistributionSet(model);
                int IntDID = 0;
                IntDID = Convert.ToInt32(DID);
                //关系表添加
                model._is_notice = notice;
                string[] sArray = UDs.Split(',');
                string amode = "";
                st.Sucess = 0;
                if (Common.GetRequest("ACode") != null && Common.GetRequest("ACode") != "")
                {
                    amode = Common.GetRequest("ACode");
                    //amode = amode.Substring(0, amode.Length - 1);
                    string[] sArrays = amode.Split(',');
                   List<string> ACode = sArrays.ToList();
                   List<string> UserA = sArray.ToList();
                    
                   var list = MgrServices.DistributeRecordService.BulkInsert(ACode, UserA, IntDID, CreatPepleID);
                   st.Fail = list.Fail;
                   st.Sucess = list.Sucess;
                    //foreach (string str in sArrays)//量表
                    //{
                    //    if (str != "0")
                    //    {
                    //        Amount_Distribution_RelationEntity AModel = new Amount_Distribution_RelationEntity();
                    //        AModel._amount_code = str;

                    //        foreach (string i in sArray)//用户
                    //        {

                    //            long aa = MgrServices.DistributeRecordService.GetCount(str, Convert.ToInt32(i));
                    //            if (aa == 0)
                    //            {
                    //                st.Sucess += 1;

                    //                if (DID > 0)
                    //                {

                    //                    AModel._createtime = DateTime.Now;
                    //                    AModel._distributionsetid = DID;
                    //                    AModel._u_id = Convert.ToInt32(i.ToString());
                    //                    AModel._disuid = CreatPepleID;
                    //                    long AID = MgrServices.DistributeRecordService.AInsert(AModel);

                    //                }
                    //            }
                    //            else
                    //            {
                    //                st.Fail = st.Fail + 1;
                    //            }
                    //        }

                    //    }
                    //    else
                    //    {

                    //        st.Fail = sArray.Length + sArrays.Length;
                    //    }
                    //}
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
        //邮件提醒
        public void RemindByEmail(string UDs, string NoticeName)
        {
            try
            {
                string[] receiveID = UDs.Split(',');
                string subject = "测评提醒";
                string content = NoticeName;
                for (int i = 0; i < receiveID.Length; i++)
                {
                    if (!string.IsNullOrEmpty(receiveID[i]))
                    {
                        string email = MgrServices.UserAddService.GetUserEmailByUserID(Convert.ToInt32(receiveID[i]));
                        EmailHelper.SendEmail(email, subject, content);
                    }

                }
            }
            catch
            { }

        }
        //站内信
        public bool Write(string Receveid, string Title, string Content, int Write, int UserID)
        {

            try
            {
                string JumpType = "0";
                return MgrServices.Letter.BulkInsert(Receveid, Title, Content, Write, UserID,"1",JumpType);
            }
            catch
            {
                return false;
            }
        }
        public class State
        {
            public int Sucess { get; set; }
            public int Fail { get; set; }
            /// <summary>
            /// 分配失败的用户名称
            /// </summary>
            public string FailName { get; set; }
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