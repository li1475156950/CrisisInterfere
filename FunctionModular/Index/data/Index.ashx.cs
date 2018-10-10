using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using CrisisInterfere.FunctionService;
using CrisisInterfere.IndexService;

namespace CrisisInterfere.FunctionModular.Index
{
    /// <summary>
    /// Index 的摘要说明
    /// 创建人：刘玉京
    /// 创建时间：2016-10-09
    /// 功能介绍：桌面逻辑服务
    /// </summary>
    public class Index : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/html";
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
            {
                context.Response.Write("as");
                return;
            }
            
            string remark = Common.GetRequest("Remark");
            switch (remark)
            {
                case "SetModel":
                    InitIndexModel(context);//初始化带设置主页模块
                    break;
                case "SaveSetModel":
                    string ModularStr = Common.GetRequest("ModularStr");
                    SaveModelSet(context, ModularStr);
                    break;
                case "LoadModular":
                    LoadModular(context);
                    break;
                case "InitWelcome":
                    InitWelecome(context);
                    break;
                case "LoadLeftMenu":
                    //         System.Diagnostics.Stopwatch stopwatch01 = new Stopwatch();
                    //stopwatch01.Start(); //  开始监视代码运行时间
                    LoadLeftMenu(context);
                    //stopwatch01.Stop(); //  停止监视    
                    //TimeSpan timespan01 = stopwatch01.Elapsed; //  获取当前实例测量得出的总时间 
                    //double seconds01 = timespan01.TotalSeconds;  //  总秒数 
                    break;
                case "SetFunction":
                    SetFunction(context);
                    break;
                case "GetIndexModularViewCount":
                    GetIndexModularViewCount(context);
                    break;
                case "getRole":
                    getRole(context);
                    break;
            }
        }
        /// <summary>
        /// 获取当前用户的身份
        /// </summary>
        /// <param name="context"></param>
        private void getRole(HttpContext context)
        {
            string rid = Common.GetSessionValue("role_type", context);
            context.Response.Write(rid);
            return;
        }
        /// <summary>
        /// 初始化主页设置模块
        /// </summary>
        /// <param name="context"></param>
        private void InitIndexModel(HttpContext context)
        {
            try
            {

                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                {
                    context.Response.Write("as");
                    return;
                }
                    
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                {
                    context.Response.Write("as");
                    return;
                }
                    
                DataSet SourceTemp = new DataSet();
                SourceTemp = GetIndexTemp(loginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Tables.Count > 0)
                {
                    DataTable dt1 = SourceTemp.Tables[0];
                    if (dt1 != null && dt1.Rows.Count > 0)
                    {
                        ModelEntyty entity = new ModelEntyty();
                        List<ModelEntyty> list = new List<ModelEntyty>();
                        foreach (DataRow Dtr in dt1.Rows)
                        {
                            entity = new ModelEntyty();
                            entity.Model_ID = Convert.ToInt32(Dtr["Fun_ID"]);
                            entity.Model_Name = Dtr["Fun_Name"].ToString();
                            entity.Model_Type = Convert.ToInt32(Dtr["Fun_Type"]);
                            entity.Model_ParentID = Convert.ToInt32(Dtr["Fun_ParentID"] == DBNull.Value ? "0" : Dtr["Fun_ParentID"].ToString());
                            entity.IfSet = Convert.ToInt32(Dtr["CK"]);
                            entity._Fun_Class = Convert.ToString(Dtr["Fun_Class"]);
                            list.Add(entity);
                        }
                        DataTable dt2 = SourceTemp.Tables[1];
                        string ids = "";
                        if (dt2 != null && dt2.Rows.Count > 0)
                            ids = dt2.Rows[0][0].ToString();
                        context.Response.Write(new JavaScriptSerializer().Serialize(new object[] { list, ids}));
                        return;
                    }
                }
            }
            catch
            {
                context.Response.Write("as");
            }
        }



        /// <summary>
        /// 执行快捷设置保存操作
        /// </summary>
        /// <param name="context"></param>
        /// <param name="ModularSetStr"></param>
        /// <returns></returns>
        private void SaveModelSet(HttpContext context, string ModularSetStr)
        {
            int result = 0;
            try
            {
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                {
                    context.Response.Write("as");
                    return;
                }
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                {
                    context.Response.Write("as");
                    return;
                }

                result = MgrServices.IndexService.SaveModelSet(loginName, ModularSetStr, EnterpriseCode);
            }
            catch
            {
                context.Response.Write("as");
                return;
            }
            context.Response.Write(result);
        }




        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：根据登录名查询企业授权到的功能模块
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private DataSet GetIndexTemp(string loginName, string EnterpriseCode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.IndexService.GetModularTemp(loginName, EnterpriseCode);
            }
            catch
            {
            }
            return SourceTemp;

        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-17
        /// 功能介绍：初始化主页面欢迎语
        /// </summary>
        private void InitWelecome(HttpContext context)
        {
            try
            {
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                {
                    context.Response.Write("as");
                    return;
                }
                context.Response.Write(loginName);
            }
            catch
            {
                context.Response.Write("as");
                return;
            }
            return;
        }


        private void LoadModular(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string loginName = Common.GetSessionValue("loginName", context);
                if (loginName == null)
                {
                    context.Response.Write("as");
                    return;
                }
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                {
                    context.Response.Write("as");
                    return;
                }
                SourceTemp = MgrServices.IndexService.GetModularStrByLoginName(loginName, EnterpriseCode);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ModelEntyty entity = new ModelEntyty();
                    List<ModelEntyty> list = new List<ModelEntyty>();
                    foreach (DataRow Dtr in SourceTemp.Rows)
                    {
                        entity = new ModelEntyty();
                        entity.Model_ID = Convert.ToInt32(Dtr["Fun_ID"]);
                        entity.Model_Name = Dtr["Fun_Name"] == DBNull.Value ? "" : Dtr["Fun_Name"].ToString();
                        entity.Model_Type = Convert.ToInt32(Dtr["Fun_Type"]);
                        entity.HtmlUrl = Dtr["Fun_Url"] == DBNull.Value ? "" : Dtr["Fun_Url"].ToString();
                        entity._Fun_Class = Convert.ToString(Dtr["Fun_Class"]);
                        list.Add(entity);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(list));
                    return;
                }
                else
                {
                    context.Response.Write("");
                    return;
                }
            }
            catch
            {
                context.Response.Write("as");
                return;
            }
        }
        /// <summary>
        /// 创建人:李超
        /// 创建日期:2016/11/2
        /// 功能介绍:根据当前用户加载左侧导航菜单方法
        /// </summary>
        /// <param name="context"></param>
        public void LoadLeftMenu(HttpContext context)
        {
            var currentUserID = context.Session["UserID"].ToString();
            var sessionUserID = "";
            if (context.Session["CurrentUserID"] != null)
            {
                sessionUserID = context.Session["CurrentUserID"].ToString();
            }
            if (context.Session["SecondMenu"] != null && context.Session["FirstMenu"] != null && sessionUserID == currentUserID)
            {
                var tempSecondMenu = context.Session["SecondMenu"] as List<FunctionService.FunctionEntity>;
                var tempFirstMenu = context.Session["FirstMenu"] as List<FunctionService.FunctionEntity>;
                context.Response.Write(JsonConvert.SerializeObject(new { secondMenu = tempSecondMenu, firstMenu = tempFirstMenu }));
                context.Response.End();
            }
            var loginName = Common.GetSessionValue("loginName", context);
            if (loginName == null)
            {
                context.Response.Write("as");
                return;
            }
            var EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
            {
                context.Response.Write("as");
                return;
            }
            var us = MgrServices.UserAddService.GetEntityInfo(loginName, EnterpriseCode);//根据当前登录用户名获取当前登录用户信息
            List<int> secondFunIDList = MgrServices.FunctionService.GetRoleFun(Convert.ToInt32(us._r_id));//得到当前用户的三级权限ID
            List<FunctionService.FunctionEntity> secondMenu = new List<FunctionService.FunctionEntity>();//实例化一个二级菜单集合
            DataRow[] WD_DTR;
            DataTable dt = MgrServices.FunctionService.GetFunByFID();
            for (int i = 0; i < secondFunIDList.Count; i++)//循环查找三级权限父ID的二级权限
            {
                //var funEntity = MgrServices.FunctionService.GetEntity(lThirdFunID[i]);
                //var secondFunEntity = MgrServices.FunctionService.GetEntity(funEntity.Fun_ParentID);
                FunctionEntity model = new FunctionEntity();
                WD_DTR = dt.Select("  Fun_ID ='" + secondFunIDList[i] + "' ");
                if (WD_DTR.Length > 0)
                {

                    var WD_DTRs = dt.Select("  Fun_ID ='" + secondFunIDList[i] + "' ");
                    model.Fun_ID = Convert.ToInt32(WD_DTRs[0]["Fun_ID"]);
                    model.Fun_Name = WD_DTRs[0]["Fun_Name"].ToString();
                    model.Fun_ParentID = Convert.ToInt32(WD_DTRs[0]["Fun_ParentID"]);
                    model.Fun_Type = Convert.ToInt32(WD_DTRs[0]["Fun_Type"]);
                    model.Fun_Url = WD_DTRs[0]["Fun_Url"].ToString();
                    model.Fun_Class = WD_DTRs[0]["Fun_Class"].ToString();
                }
                secondMenu.Add(model);
            }
            //去除二级权限重复数据
            secondMenu = secondMenu.OrderBy(x => x.Fun_ID).ToList(); ;
            List<FunctionService.FunctionEntity> firstMenu = new List<FunctionService.FunctionEntity>();//实例化一级菜单
            for (int i = 0; i < secondMenu.Count; i++)//循环二级菜单Fun_ID得到一级菜单
            {
                FunctionEntity funEntity = new FunctionEntity();
                //var funEntitys = MgrServices.FunctionService.GetEntity(secondMenu[i].Fun_ParentID);
                var WD_DTRs = dt.Select("Fun_ID ='" + secondMenu[i].Fun_ParentID + "' ");
                if (WD_DTRs.Length > 0)
                {
                    funEntity.Fun_ID = Convert.ToInt32(WD_DTRs[0]["Fun_ID"]);
                    funEntity.Fun_Name = WD_DTRs[0]["Fun_Name"].ToString();
                    if (WD_DTRs[0]["Fun_ParentID"].ToString().Length > 0)
                    {
                        funEntity.Fun_ParentID = Convert.ToInt32(WD_DTRs[0]["Fun_ParentID"]);
                    }
                    funEntity.Fun_Sort = Convert.ToInt32(WD_DTRs[0]["Fun_Sort"]);
                    funEntity.Fun_Type = Convert.ToInt32(WD_DTRs[0]["Fun_Type"]);
                    funEntity.Fun_Url = WD_DTRs[0]["Fun_Url"].ToString();
                    funEntity.Fun_Class = WD_DTRs[0]["Fun_Class"].ToString();
                }

                if (funEntity != null)
                {
                    firstMenu.Add(funEntity);
                }
            }
            for (int i = 0; i < firstMenu.Count; i++)  //外循环是循环的次数
            {
                for (int j = firstMenu.Count - 1; j > i; j--)  //内循环是 外循环一次比较的次数
                {

                    if (firstMenu[i].Fun_ID == firstMenu[j].Fun_ID)
                    {
                        firstMenu.RemoveAt(j);
                    }
                }
            }
            firstMenu = firstMenu.OrderBy(m=>m.Fun_Sort).ToList();
            //去除一级权限重复值
            context.Session["SecondMenu"] = secondMenu;
            context.Session["FirstMenu"] = firstMenu;
            context.Session["CurrentUserID"] = context.Session["UserID"];
            context.Response.Write(JsonConvert.SerializeObject(new { secondMenu = secondMenu, firstMenu = firstMenu }));
            return;
        }
        public void GetIndexModularViewCount(HttpContext context)
        {
            var searchModel = new IndexModularSearchModel();
            searchModel.UserID = Convert.ToInt32(context.Session["UserID"].ToString());
            var viewModel = MgrServices.IndexService.GetIndexModularViewCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(viewModel));
            return;
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


        public void SetFunction(HttpContext context)
        {
            try
            {
                List<RF_Entity> RfList = new List<RF_Entity>();
                List<RF_Entity> ALL_RfList = new List<RF_Entity>();

                if (context.Session["RfList"] != null)
                {
                    RfList = (List<RF_Entity>)context.Session["RfList"];
                }
                else
                {
                    context.Response.Write("LoginOutTime");
                    return;
                }


                if (context.Session["ALL_RfList"] != null)
                {
                    ALL_RfList = (List<RF_Entity>)context.Session["ALL_RfList"];
                }
                else
                {
                    context.Response.Write("LoginOutTime");
                    return;
                }
                FunctionJson fjson = new FunctionJson();
                fjson.All_RF = ALL_RfList;
                fjson.EV_RF = RfList;
                context.Response.Write(new JavaScriptSerializer().Serialize(fjson));
                return;
            }
            catch
            {
                context.Response.Write("as");
                return;

            }
            //context.Session["ALL_RfList"] = ALL_RfList;//所有权限的Session
            //context.Session["RfList"] = RfList;//当前登陆人权限的Session
        }
    }


    /// <summary>
    /// 主页模块实体
    /// </summary>
    public class ModelEntyty
    {

        private int _Model_ID;

        /// <summary>
        /// 模块ID
        /// </summary>
        public int Model_ID
        {
            get { return _Model_ID; }
            set { _Model_ID = value; }
        }
        private string _Model_Name;

        /// <summary>
        /// 模块名称
        /// </summary>
        public string Model_Name
        {
            get { return _Model_Name; }
            set { _Model_Name = value; }
        }


        private int _Model_Type;

        /// <summary>
        /// 模块类型
        /// </summary>
        public int Model_Type
        {
            get { return _Model_Type; }
            set { _Model_Type = value; }
        }

        private int _Model_ParentID;

        /// <summary>
        /// 模块父级ID
        /// </summary>
        public int Model_ParentID
        {
            get { return _Model_ParentID; }
            set { _Model_ParentID = value; }
        }


        private string _HtmlUrl;

        /// <summary>
        /// 跳转地址
        /// </summary>
        public string HtmlUrl
        {
            get { return _HtmlUrl; }
            set { _HtmlUrl = value; }
        }

        public string _Fun_Class;
        public string Fun_Class
        {
            get { return _Fun_Class; }
            set { _Fun_Class = value; }
        }

        private int _ifSet;
        /// <summary>
        /// 模块是否是快捷按钮1：是 0：否
        /// </summary>
        public int IfSet
        {
            get { return _ifSet; }
            set { _ifSet = value; }
        }
    }

    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-12-25
    /// 功能介绍：获取页面所有权限的JSON
    /// </summary>
    public class FunctionJson
    {

        private List<RF_Entity> _All_RF;

        public List<RF_Entity> All_RF
        {
            get { return _All_RF; }
            set { _All_RF = value; }
        }

        private List<RF_Entity> _EV_RF;

        public List<RF_Entity> EV_RF
        {
            get { return _EV_RF; }
            set { _EV_RF = value; }
        }
    }
}