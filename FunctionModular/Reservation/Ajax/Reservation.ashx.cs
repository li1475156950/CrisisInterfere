using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.projrem;
using CrisisInterfere.ReservationService;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.Reservation.Ajax
{
    /// <summary>
    /// Reservation 的摘要说明
    /// </summary>
    public class Reservation : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            context.Response.ContentType = "text/plain";
            //1是预约时间添加，2是新主题添加，3是已有主题添加,4是查询已有主题内容，5是根据主题id查询详细内容,6是分页列表-废弃,7是分页列表
            int Type = Convert.ToInt32(context.Request["type"]);
            string LoginName= CookieHelper.GetCookieValue("LoginNameCookie");
            switch (Type)
            {
                case 1:
                   YT_YuYueTimeEntity ModleInfo = new YT_YuYueTimeEntity();
                   ModleInfo._yt_createperson = LoginName;
                   ModleInfo._yt_userid = Convert.ToInt32(Common.GetRequest("Consultant"));
                   ModleInfo._yt_bdate = Convert.ToDateTime(Common.GetRequest("BDate"));
                   ModleInfo._yt_edate = Convert.ToDateTime(Common.GetRequest("EDate"));
                   ModleInfo._yt_week= Common.GetRequest("Week");
                   if (ModleInfo._yt_week.Length > 0)
                   {
                       ModleInfo._yt_week = ModleInfo._yt_week.Substring(0, ModleInfo._yt_week.Length - 1);
                   }
                   ModleInfo._yt_btime = Common.GetRequest("BTime");
                   ModleInfo._yt_etime = Common.GetRequest("EndTime");
                   ModleInfo._yt_conselingtype = Convert.ToInt32(Common.GetRequest("ConselingType"));
                   ModleInfo._yt_conselingaddress = Convert.ToInt32(Common.GetRequest("ConselingAddress"));
                   ModleInfo._yt_createtime = DateTime.Now;
                   context.Response.Write(Insert(ModleInfo));
                   break;
                case 2:
                   YNT_YuyueNewThemEntity YNTmodel = new YNT_YuyueNewThemEntity();
                   YNTmodel._ynt_createperson = LoginName;
                   YNTmodel._ynt_themname = Common.GetRequest("Them");
                   YNTmodel._ynt_describe = Common.GetRequest("content");
                   YNTmodel._ynt_entrycondition = Common.GetRequest("EntryCondition");
                   YNTmodel._ynt_createtime = DateTime.Now;
                   YNTmodel._ynt_str2 = Common.GetRequest("YYID");//获取预约时间id
                   context.Response.Write(YNTInsert(YNTmodel));
                   break;
                case 3:
                   YOT_YuyueOldThemEntity YOTmodel = new YOT_YuyueOldThemEntity();
                   YOTmodel._ynt_id = Convert.ToInt32(Common.GetRequest("Changethem"));
                   YOTmodel._yot_str = Common.GetRequest("CType");//咨询方式
                   YOTmodel._yot_createperson = LoginName;
                   YOTmodel._yot_createtime = DateTime.Now;
                   YOTmodel._yot_str2 = Common.GetRequest("YYID");//获取预约时间id
                   context.Response.Write(YOTInsert(YOTmodel));
                   break;
                case 4:
                   context.Response.Write(InitYNTType());
                   break;
                case 5:
                   int YNTID = Convert.ToInt32(Common.GetRequest("YNTID"));
                    context.Response.Write(GetYNTInfo(YNTID));
                    break;
                case 6:
                    int UserID = 12;
                    int StarPageIndex = 0;
                    int EndPageIndex = 10;
                    InitGaugePages(UserID, StarPageIndex, EndPageIndex,context);
                    break;
                case 7:
                     int UserIDs = 12;
                    int StarPageIndexs = 0;
                    int EndPageIndexs = 10;
                    GetList(UserIDs, StarPageIndexs, EndPageIndexs,context);
                     break;
            }
        } 
        /// <summary>
        /// 新增排版管理
        /// </summary>
        /// <param name="entityInfo"></param>
        /// <returns></returns>
      public  long Insert(YT_YuYueTimeEntity entityInfo)
        {
            try
            {
                return MgrServices.ReservationService.Insert(entityInfo);
            }
            catch(Exception e)
            {
                return -1;
            }
        }
        /// <summary>
        /// 新主题添加
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
      public long YNTInsert(YNT_YuyueNewThemEntity model)
      {
          try
          {
              return MgrServices.ReservationService.YNTInsert(model);
          }
          catch (Exception e)
          {
              return -1;
          }
      }
       /// <summary>
       /// 添加已有主题
       /// </summary>
       /// <param name="model"></param>
       /// <returns></returns>
      public long YOTInsert(YOT_YuyueOldThemEntity model)
      {
          try
          {
              //YT_YuYueTimeEntity YTmodel = new YT_YuYueTimeEntity();
              //YTmodel._yt_conselingtype = CType;
              //Insert(YTmodel);
              return MgrServices.ReservationService.YOTInsert(model);
          }
          catch (Exception e)
          {
              return -1;
          }
      }
      /// <summary>
      /// 创建人：刘亚娟
      /// 创建时间：2016-10-13
      /// 功能介绍：初始化量表类别下拉列表
      /// </summary>
      private string InitYNTType()
      {
          string json = "";
          try
          {

              DataTable SourceType = new DataTable();
              SourceType = GetYNTType();
              if (SourceType != null && SourceType.Rows.Count > 0)
              {
                  ComboxMes mex = new ComboxMes();
                  List<ComboxMes> listT = new List<ComboxMes>();
                  foreach (DataRow DTR in SourceType.Rows)
                  {
                      mex = new ComboxMes();
                      mex.Text = DTR["YNT_ThemName"].ToString();
                      mex.Value = DTR["YNT_ID"].ToString();
                      listT.Add(mex);
                  }
                  json= new JavaScriptSerializer().Serialize(listT);
                 
              }
          }
          catch
          {
              return json;

          }
          return json;
      }

      /// <summary>
      /// 创建人：刘亚娟
      /// 创建时间：2016-09-07
      /// 功能介绍：获取量表类别数据集合
      /// </summary>
      /// <returns></returns>
      private DataTable GetYNTType()
      {
          DataTable SourceTemp = new DataTable();
          try
          {
              SourceTemp = MgrServices.ReservationService.GetYNTThem();
          }
          catch (Exception ex)
          { }

          return SourceTemp;
      }
        /// <summary>
        /// 获取已有主题的详细信息
        /// </summary>
        /// <param name="YNTID"></param>
        /// <returns></returns>
      public string GetYNTInfo(int YNTID)
      {
          YNT_YuyueNewThemEntity model = new YNT_YuyueNewThemEntity();
          YNT_YuyueNewThemEntity ds = MgrServices.ReservationService.GetYNTInfoByID(YNTID);
          model._ynt_themname = ds._ynt_themname;
          model._ynt_describe = ds._ynt_describe;
          model._ynt_entrycondition = ds._ynt_entrycondition;
          string json = JsonConvert.SerializeObject(model);
          return json;
      }
        //废弃预约管理列表
      private void InitGaugePages(int UserID, int StarPageIndex, int EndPageIndex, HttpContext context)
      {

          try
          {
              PageInfo page = new PageInfo();
              DataSet SourceTemps = new DataSet();
              SourceTemps = GetYTTemp(UserID, StarPageIndex, EndPageIndex);
              DataTable SourceTemp = new DataTable();
              if (SourceTemps != null && SourceTemps.Tables.Count > 0)
              {
                  page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                  SourceTemp = SourceTemps.Tables[1];
                  Y_UserYuYueEntity model = new Y_UserYuYueEntity();
                 
                  if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                  {
                      

                      foreach (DataRow DTR in SourceTemp.Rows)
                      {
                          Y_UserYuYueEntity ds = MgrServices.ReservationService.GetEntityBYID(Convert.ToInt32(DTR["YT_ID"]));
                          int aa = Convert.ToInt32(DTR["YT_ID"]);
                          DateTime begin = new DateTime(); ;//我的预约时间表里面的预约日期
                          string Begindata = DTR["YT_BDate"].ToString();
                          string Enddata = DTR["YT_EDate"].ToString();
                          //TimeSpan ts = Enddata - Begindata;
                          DateTime test = new DateTime();
                          string YTTime = DTR["YT_BTime"].ToString() + "-" + DTR["YT_ETime"].ToString(); ;//预约时间表的日期
                          string YUTime="";//我的预约表的日期
                          if (ds != null)
                          {
                              YUTime = ds._yu_time;
                              begin = Convert.ToDateTime(ds._yu_data);
                              
                             
                          }
                          DateTime aaa = Convert.ToDateTime(DateTime.Now.AddDays(1).ToShortDateString().ToString());
                          string Datastate ="";//判断这个日期是否有时间
                          string DataTime = "";//判断这个时间段是否有预约
                         

                          
                          String[] arr =
                            {
                                DTR["YT_ID"].ToString(), //用户ID                                                    
                                DTR["U_LoginName"].ToString(),//登陆名称
                                "",//姓名名称
                                "",//性别
                                "",//姓名名称
                                "",//性别
                               
                                "",//性别
                                "",
                                "",
                                Datastate,
                                DataTime,//10
                                YTTime,//11
                                Begindata,//12
                                Enddata
                               
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
      public DataSet GetYTTemp(int UserID, int StarPageIndex, int EndPageIndex)
      {
          return MgrServices.ReservationService.GetYTTemp(UserID, StarPageIndex, EndPageIndex);
      }
      public void GetList(int UserID, int StarPageIndex, int EndPageIndex,HttpContext context)
      {
          StringBuilder sb = new StringBuilder();  
        string jsonData = string.Empty;

        try
        {
            PageInfo page = new PageInfo();
            DataSet SourceTemps = new DataSet();
            SourceTemps = GetYTTemp(UserID, StarPageIndex, EndPageIndex);
            DataTable SourceTemp = new DataTable();
            if (SourceTemps != null && SourceTemps.Tables.Count > 0)
            {
                page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                SourceTemp = SourceTemps.Tables[1];
                Y_UserYuYueEntity model = new Y_UserYuYueEntity();
                int TotoleCount= Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {

                    List<GetList> list = new List<GetList>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        Y_UserYuYueEntity ds = MgrServices.ReservationService.GetEntityBYID(Convert.ToInt32(DTR["YT_ID"]));
                        int aa = Convert.ToInt32(DTR["YT_ID"]);
                        DateTime begin = new DateTime(); ;//我的预约时间表里面的预约日期
                        DateTime Begindata = Convert.ToDateTime(DTR["YT_BDate"].ToString());
                        DateTime Enddata = Convert.ToDateTime(DTR["YT_EDate"].ToString());
                        TimeSpan ts = Enddata - Begindata;
                        DateTime test = new DateTime();
                        string YTTime = DTR["YT_BTime"].ToString() + "-" + DTR["YT_ETime"].ToString(); ;//预约时间表的日期
                        string YUTime = "";//我的预约表的日期
                        if (ds != null)
                        {
                            YUTime = ds._yu_time;
                            begin = Convert.ToDateTime(ds._yu_data);


                        }                                    

                        GetList models = new GetList();
                        models.Num = TotoleCount;
                        models.id = DTR["YT_ID"].ToString(); //用户ID                                                    
                        models.Name = DTR["U_LoginName"].ToString();//登陆名称
                        for (int i = 0; i < ts.Days+1; i++)
                        {                        
                            test = Begindata.AddDays(i);

                            if (test == DateTime.Now)
                            {

                                models.Week1 = "1";
                                if (begin == DateTime.Now)
                                {
                                    if (YTTime == YUTime)
                                    {
                                        models.Week1 = "r1";//已经预约
                                    }
                                    else
                                    {
                                        models.Week1 = "r0";//没有预约
                                    }
                                }

                            }
                            else if (test == Convert.ToDateTime(DateTime.Now.AddDays(1).ToShortDateString().ToString()))
                            {

                                models.Week2 = "2";
                                if (begin == Convert.ToDateTime(DateTime.Now.AddDays(1).ToShortDateString().ToString()))
                                {
                                    if (YTTime == YUTime)
                                    {
                                        models.Week2 = "r1";//已经预约
                                    }
                                    else
                                    {
                                        models.Week2 = "r0";//没有预约
                                    }
                                }
                            }
                            else if (test == Convert.ToDateTime(DateTime.Now.AddDays(2).ToShortDateString().ToString()))
                            {

                                models.Week3 = "3";
                                if (begin == Convert.ToDateTime(DateTime.Now.AddDays(2).ToShortDateString().ToString()))
                                {
                                    if (YTTime == YUTime)
                                    {
                                        models.Week3 = "r1";//已经预约
                                    }
                                    else
                                    {
                                        models.Week3 = "r0";//没有预约
                                    }
                                }

                            }
                            else if (test == Convert.ToDateTime(DateTime.Now.AddDays(3).ToShortDateString().ToString()))
                            {

                                models.Week4 = "4";
                                if (begin == Convert.ToDateTime(DateTime.Now.AddDays(3).ToShortDateString().ToString()))
                                {
                                    if (YTTime == YUTime)
                                    {
                                        models.Week4 = "r1";//已经预约
                                    }
                                    else
                                    {
                                        models.Week4 = "r0";//没有预约
                                    }
                                }

                            }
                            else if (test == Convert.ToDateTime(DateTime.Now.AddDays(4).ToShortDateString().ToString()))
                            {
                                models.Week5 = "5";
                                if (begin == Convert.ToDateTime(DateTime.Now.AddDays(4).ToShortDateString().ToString()))
                                {
                                    if (YTTime == YUTime)
                                    {
                                        models.Week5 = "r1";//已经预约
                                    }
                                    else
                                    {
                                        models.Week5 = "r0";//没有预约
                                    }
                                }
                            }
                            else if (test == Convert.ToDateTime(DateTime.Now.AddDays(5).ToShortDateString().ToString()))
                            {

                                models.Week6 = "6";
                                if (begin == Convert.ToDateTime(DateTime.Now.AddDays(5).ToShortDateString().ToString()))
                                {
                                    if (YTTime == YUTime)
                                    {
                                        models.Week6 = "r1";//已经预约
                                    }
                                    else
                                    {
                                        models.Week6 = "r0";//没有预约
                                    }
                                }
                            }
                            else if (test == Convert.ToDateTime(DateTime.Now.AddDays(6).ToShortDateString().ToString()))
                            {
                                models.Week7 = "7";
                                if (begin == Convert.ToDateTime(DateTime.Now.AddDays(6).ToShortDateString().ToString()))
                                {
                                    if (YTTime == YUTime)
                                    {
                                        models.Week7 = "r1";//已经预约
                                    }
                                    else
                                    {
                                        models.Week7 = "r0";//没有预约
                                    }
                                }
                            }
                            else
                            {
                                models.Week1 = "r0";//0是没有预约，1是已经预约
                            }
                            
                        }
                        list.Add(models);
                       
                    }
                    string json = JsonConvert.SerializeObject(list);
                    context.Response.Write(json); 
                    
                }
               
            }
        }
        catch
        { }      
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