using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.LetterService;
using CrisisInterfere.projrem;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.Letter.Ajax
{
    /// <summary>
    /// Letter 的摘要说明
    /// </summary>
    public class Letter : IHttpHandler, IRequiresSessionState
    {


        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            
            int UID=0;//seesin
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            UID = Convert.ToInt32(_uID);
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
              int Type = Convert.ToInt32(Common.GetRequest("type"));
              //type:1是收件箱查询列表，2是新建信息添加,3是删除,4是批量删除，5是存草稿，6是获取用户详细信息,7是发件箱分页,8草稿箱分页,
             //9是发件箱单个删除，10是发件箱批量删除,11是获取新建信息->发件人的下拉列表,12编辑更新,13是编辑存稿提交,14是查看用户信息
              switch (Type)
              {
                  case 1:
                      //int UL_ReceveID = 103;//当前用户的id
                      string Title = context.Request["Title"].ToString();
                      int StarIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                      int EndIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                      InboxPages(UID, Title, StarIndex, EndIndex,context);
                      break;
                  case 2:
                      string Receveid = context.Request["receveid"].ToString();
                      string title=context.Request["title"].ToString();;
                      string content=context.Request["content"].ToString();
                      context.Response.Write(Write(Receveid, title, content, 3,UID));//2是新建信息添加
                      break;
                  case 3:
                      string UserID = context.Request["U_ID"].ToString();
                      context.Response.Write(UpdateDelete(UserID));
                      break;
                  case 4:
                        string UserIDs = context.Request["U_IDs"].ToString();
                        UserIDs = UserIDs.Substring(0, UserIDs.Length - 1);
                       context.Response.Write(UpdateDelete(UserIDs));
                       break;
                  case 5:
                      string Receveid01 = context.Request["receveid"].ToString();
                      string title01="";
                      if(Common.GetRequest("title")!=null)
                      {
                          title01 = Common.GetRequest("title").ToString();
                      }
                      string content01=context.Request["content"].ToString();
                      context.Response.Write(Write(Receveid01, title01, content01, 2,UID));
                      break;
                  case 6:
                      int uid = Convert.ToInt32(context.Request["uid"]);
                       context.Response.Write(GetInfo(uid));
                      break;
                  case 7:                  
                      string Titles = context.Request["Titles"].ToString();
                      int StarIndexs = Convert.ToInt32(Common.GetRequest("StarPageIndexs"));
                      int EndIndexs = Convert.ToInt32(Common.GetRequest("EndPageIndexs"));
                      SendPages(UID, Titles, StarIndexs, EndIndexs, context);//senderID
                      break;
                  case 8:
                      string Titled = context.Request["Titles"].ToString();
                      int StarIndexd = Convert.ToInt32(Common.GetRequest("StarPageIndexs"));
                      int EndIndexd = Convert.ToInt32(Common.GetRequest("EndPageIndexs"));
                      DraftPages(UID, Titled, StarIndexd, EndIndexd, context);//senderID
                       break;
                  case 9:
                         string deleteuid = context.Request["deleteuid"].ToString();
                         context.Response.Write(UpdateDeleteSender(deleteuid));
                      break;
                      
                  case 10:
                       string deleteuids = context.Request["deleteuids"].ToString();
                       deleteuids = deleteuids.Substring(0, deleteuids.Length - 1);
                       context.Response.Write(UpdateDeleteSender(deleteuids));
                       break;
                  case 11:
                       InitUserType(UID, EnterpriseCode, context);
                       break;
                  case 12:
                       int UL_ID = Convert.ToInt32(context.Request["uid"]);
                       string UReceveid = context.Request["receveid"].ToString();
                       string Utitle = context.Request["title"].ToString();
                      string Ucontent=context.Request["content"].ToString();
                      context.Response.Write(AllUpdate(UReceveid, Utitle, Ucontent, 3, UID,UL_ID));
                      break;
                  case 13:
                      int UL_IDE = Convert.ToInt32(context.Request["uid"]);
                      string ReceveidD = context.Request["receveid"].ToString();
                      string titleD="";
                      string contentD=context.Request["content"].ToString();
                      context.Response.Write(AllUpdate(ReceveidD, titleD, contentD, 2, UID,UL_IDE));
                      break;
                  case 14:
                      int uids = Convert.ToInt32(context.Request["uid"]);
                      context.Response.Write(GetInfoSender(uids));
                      break;
                  case 15:
                      context.Response.Write(GetTopEntity(UID));
                      break;
                  case 16:
                      string Receveids = context.Request["receveid"].ToString();
                      string titles=context.Request["title"].ToString();;
                      string contents=context.Request["content"].ToString();
                      context.Response.Write(Writes(Receveids, titles, contents, 3,UID));//2是新建信息添加
                      break;

              }
            
        }
        # region 收件箱分页
        public DataSet GetInboxList(int UL_ReceveID, string UL_Title, int StarPageIndex, int EndPageIndex)
        {
            //MgrServices.Letter.GetInboxList()
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.Letter.GetInboxList(UL_ReceveID,UL_Title, StarPageIndex, EndPageIndex);

            }
            catch
            {
                //UserInfoService
            }

            return SourceTemp;
        }
        ///
        private void InboxPages(int UL_ReceveID, string UL_Title, int StarPageIndex, int EndPageIndex, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetInboxList(UL_ReceveID, UL_Title, StarPageIndex, EndPageIndex);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {                        
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            string LoginName = "";
                            if (DTR["UL_SenderType"].ToString() == "1")
                            {

                                LoginName = "系统";
                            }
                            else
                            {
                                LoginName = DTR["U_LoginName"].ToString();

                            }
                            String[] arr =
                            {
                                DTR["UL_ID"].ToString(), //用户ID
                                //"", //选框
                                DTR["PageIndex"].ToString(),//序号	
                                DTR["UL_Note"].ToString(),//登陆名称
                                LoginName,//根据收信人id查询来源人比如系统或者发件人
                                DTR["UL_Time"].ToString(),//创建时间                           
                                "",//操作
                                DTR["UL_JumpType"].ToString(), 
                                DTR["UL_SenderID"].ToString(),
                                 DTR["UL_IsRead"].ToString(),
                                 
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
        #endregion
        /// <summary>
        /// 新建信息--1.新建 2.草稿箱 3.已发送 4.发送成功/未读 5.已查看 
        /// </summary>
        /// <param name="sender">发送到那个用户的id(接受者id)</param>
        /// <param name="Title"></param>
        /// <param name="Content"></param>
        /// /// <param name="Write">3是发送，2是草稿</param>
        /// <returns></returns>
        public bool Write(string Receveid,string Title,string Content,int Write,int UserID)
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
        /// <summary>
        /// 新建信息--1.新建 2.草稿箱 3.已发送 4.发送成功/未读 5.已查看 -系统量表
        /// </summary>
        /// <param name="sender">发送到那个用户的id(接受者id)</param>
        /// <param name="Title"></param>
        /// <param name="Content"></param>
        /// /// <param name="Write">3是发送，2是草稿</param>
        /// <returns></returns>
        public bool Writes(string Receveid, string Title, string Content, int Write, int UserID)
        {

            try
            {
                string JumpType = "1";
                return MgrServices.Letter.BulkInsert(Receveid, Title, Content, Write, UserID, "1", JumpType);
            }
            catch
            {
                return false;
            }
        }
        /// <summary>
        /// 根据用户id查询站内信详细信息
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public string GetInfo(int UserID)
        {
            U_LetterEntity Entity = new U_LetterEntity();      
            U_LetterEntity ds= MgrServices.Letter.GetEntity(UserID);        
            Entity._ul_note = ds._ul_note;
            Entity._ul_title = ds._ul_title;
            Entity._ul_isread = ds._ul_isread;
            if (Entity._ul_isread == 0)
            {
                bool IsReader = MgrServices.Letter.UpdateRead(UserID.ToString());
            }
            string json = JsonConvert.SerializeObject(Entity);
            return json;
        }
        /// <summary>
        /// 更新删除
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool UpdateDelete(string UserID)
        {
           return MgrServices.Letter.UpdateDelte(UserID);
            
        }
        #region 发件箱方法
        public DataSet GetSendList(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex)
        {
            //MgrServices.Letter.GetInboxList()
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.Letter.GetSendTemp(UL_SenderID, UL_Title, StarPageIndex, EndPageIndex);

            }
            catch
            {
                //UserInfoService
            }

            return SourceTemp;
        }
        private void SendPages(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetSendList(UL_SenderID, UL_Title, StarPageIndex, EndPageIndex);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            string LoginName = DTR["U_LoginName"].ToString();
                            
                            String[] arr =
                            {
                                DTR["UL_ID"].ToString(), //用户ID0
                                //"", //选框
                                DTR["PageIndex"].ToString(),//序号	1
                                DTR["UL_Note"].ToString(),//登陆名称2
                                LoginName,//根据收信人id查询来源人比如系统或者发件人3
                                DTR["UL_Time"].ToString(),//创建时间   4                        
                                "",//操作//5
                                DTR["UL_JumpType"].ToString(), //6
                                DTR["UL_SenderID"].ToString()//7
                                //DTR["U_ID"].ToString()//8
                               
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
        /// 发件箱查看
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public string GetInfoSender(int UserID)
        {
            U_LetterEntity Entity = new U_LetterEntity();
            U_LetterEntity ds = MgrServices.Letter.GetEntity(UserID);
            Entity._ul_note = ds._ul_note;
            Entity._ul_title = ds._ul_title;
            Entity._ul_isread = ds._ul_isread;
           
            string json = JsonConvert.SerializeObject(Entity);
            return json;
        }
        /// <summary>
        /// 发件箱更新删除
        /// </summary>
        /// <param name="UserID"></param>
        /// <returns></returns>
        public bool UpdateDeleteSender(string UserID)
        {
            return MgrServices.Letter.UpdateDeleteSender(UserID);

        }
        #endregion

        #region 草稿箱方法
        public DataSet GetDraftList(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex)
        {
            //MgrServices.Letter.GetInboxList()
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.Letter.GetDraftTemp(UL_SenderID, UL_Title, StarPageIndex, EndPageIndex);

            }
            catch
            {
                //UserInfoService
            }

            return SourceTemp;
        }
        private void DraftPages(int UL_SenderID, string UL_Title, int StarPageIndex, int EndPageIndex, HttpContext context)
        {
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetDraftList(UL_SenderID, UL_Title, StarPageIndex, EndPageIndex);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            string LoginName = DTR["U_LoginName"].ToString();                                                 
                            String[] arr =
                            {
                                DTR["UL_ID"].ToString(), //用户ID
                                //"", //选框
                                DTR["PageIndex"].ToString(),//序号	
                                DTR["UL_Note"].ToString(),//登陆名称
                                LoginName,//根据收信人id查询来源人比如系统或者发件人
                                DTR["UL_Time"].ToString(),//创建时间                           
                                "",//操作
                                DTR["UL_JumpType"].ToString(), 
                                DTR["UL_SenderID"].ToString(),
                                DTR["UL_ReceveID"].ToString()//8
                             
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
        #endregion

        #region 获取用户下拉框
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建时间：2016-09-22
        /// 功能介绍：初始化量表类别下拉列表
        /// </summary>
        private void InitUserType(int UserID, string EnterpriseCode, HttpContext context)
        {
            try
            {

                DataTable SourceType = new DataTable();
                SourceType = GetUserType(UserID, EnterpriseCode);
                if (SourceType != null && SourceType.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceType.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["U_LoginName"].ToString();
                        mex.Value = DTR["U_ID"].ToString();
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
        /// 创建人：刘亚娟
        /// 创建时间：2016-09-22
        /// 功能介绍：获取量表类别数据集合
        /// </summary>
        /// <returns></returns>
        private DataTable GetUserType(int UserID, string EnterpriseCode)
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                SourceTemp = MgrServices.Letter.GetUserTypeTemp(UserID, EnterpriseCode);
            }
            catch (Exception ex)
            { }

            return SourceTemp;
        }

        public bool AllUpdate(string ReceveID, string Title, string Content, int Write, int SenderID,int UL_ID)
        {
        
            try
            {
                //Update = true;
                bool Update = MgrServices.Letter.AllUpdate(ReceveID, Title, Content, Write, SenderID, UL_ID);
                return Update;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        #endregion

        public string GetTopEntity(int UL_ReceveID)
        {
            string json = "";
            try
            {
                DataTable dt = MgrServices.Letter.GetTopEntity(UL_ReceveID);
                List<U_LetterModel> list = new List<U_LetterModel>();
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        U_LetterModel model = new U_LetterModel();
                        model._ul_id = Convert.ToInt32(dt.Rows[i]["UL_ID"].ToString());
                        model._ul_title = dt.Rows[i]["UL_Note"].ToString();
                        model._ul_time = Convert.ToDateTime(dt.Rows[i]["UL_Time"].ToString()).ToString("yyyy-MM-dd");
                        model._ul_total = dt.Rows[i]["Total"].ToString();
                        list.Add(model);
                    }
                }
                json = JsonConvert.SerializeObject(list);
                return json;
            }
            catch
            {
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
        public class U_LetterModel
        {
            public int _ul_id { get; set; }
            public string _ul_title { get; set; }
            public string _ul_time { get; set; }
            public string _ul_total { get; set; }
        }
    }
}