using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using BR_Service;
using Newtonsoft.Json;
using MyExection;

namespace CrisisInterfere.FunctionModular.AdvisoryStatistics.Ajax
{
    /// <summary>
    /// AdvisoryStatistics 的摘要说明
    /// </summary>
    public class AdvisoryStatistics : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string _enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
            int UId = Convert.ToInt32(isTimeOut);

            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "Bind":
                    InitData(context);
                    break;
                case "LoadQuesitonType":
                    LoadQuesitonType(context, _enterpriseCode);
                    break;
                case "BindPersonal":
                    GetIndividualConsultations(context);
                    break;
                case "BindTeam":
                    GetGroupConsultations(context);
                    break;
                case "PersonalStatementInfo":
                    GetPersonalStatementInfo(context);
                    break;
                case "update":
                    UpdateSubject(context);
                    break;
                case "look":
                    LookAdvisory(context);
                    break;
                case "TeamStatementInfo":
                    GetTeamStatementInfo(context);
                    break;
                case "addTeam":
                    AddTeamStatementInfo(context);
                    break;
                case "addPerson":
                    AddPersonStatementInfo(context);
                    break;
                case "Delete":
                    DeleteData(context);
                    break;
                case "getrole":
                    GetRole(context);
                    break;
            }
        }
        /// 创建人：田闯
        /// 创建时间：2017/5/8
        /// 初始化报表界面的数据
        /// <returns></returns>
        private void InitData(HttpContext context)
        {
            try
            {
                int startPage = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                int endPage = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                DateTime? startTime = new DateTime();
                DateTime? endTime = new DateTime();
                string _enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
                int UId = 0;
                string userId = Common.GetSessionValue("UserID", context);
                if (userId != "")
                    UId = Convert.ToInt32(userId);
                if (Common.GetRequest("distriStartTime") != null && Common.GetRequest("distriStartTime") != "")
                    startTime = Convert.ToDateTime(Common.GetRequest("distriStartTime"));
                if (Common.GetRequest("distriEndTime") != null && Common.GetRequest("distriEndTime") != "")
                    endTime = Convert.ToDateTime(Common.GetRequest("distriEndTime"));

                string name = Common.GetRequest("name") == null ? "" : Common.GetRequest("name");
                DataSet source = MgrServices.AdvisoryStatisticsService.InitData(UId, _enterpriseCode, name, startTime, endTime, startPage, endPage);
                if (source != null && source.Tables.Count > 0)
                {
                    PageInfo page = new PageInfo();
                    page.recordsTotal = Convert.ToInt32(source.Tables[0].Rows[0][0]);
                    DataTable table = source.Tables[1];
                    if (table.Rows.Count > 0)
                    {
                        foreach (DataRow item in table.Rows)
                        {
                            String[] str =
                            {
                                "<input class='checkDistri' "+" type='checkbox' name='checkboxname' data-id ='" + item["id"]
                                 +"' data-number='"+item["Number"] + "'>",//0
                                item["PageIndex"].ToString(),//序号  1
                                 item["Number"].ToString(),//报表编号  2
                                 item["Content"].ToString(),//报表标题  3
                                 item["Type"].ToString()=="False"?"个体咨询":"团体咨询",//咨询方式  4
                                 item["CreateTime"].ToString(),//生成时间  5
                                 item["id"].ToString()//ID 6
                            };
                            page.data.Add(str);
                        }
                    }
                    page.recordsFiltered = page.recordsTotal;
                    String json = Common.ObjectToJson(page);
                    context.Response.Write(json);
                }
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/4
        /// 获取问题类型
        /// </summary>
        private void LoadQuesitonType(HttpContext context, string enterpriseCode)
        {
            try
            {
                context.Response.Write(JsonConvert.SerializeObject(MgrServices.AdvisoryStatisticsService.GetQuestiontype(enterpriseCode)));
            }
            catch
            {
            }

        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/4
        /// 获取个体咨询
        /// </summary>
        /// <param name="context"></param>
        private void GetIndividualConsultations(HttpContext context)
        {
            try
            {
                int startpage = 0;
                int endPage = 0;
                DateTime start = new DateTime();
                DateTime end = new DateTime();
                string name = string.Empty;
                int qId = 0;
                int UId = 0;

                string _enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
                string userId = Common.GetSessionValue("UserID", context);
                if (userId != "")
                    UId = Convert.ToInt32(userId);
                if (Common.GetRequest("StartPageIndex") != null)
                    startpage = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                if (Common.GetRequest("EndPageIndex") != null)
                    endPage = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                if (Common.GetRequest("Name") != null)
                    name = Common.GetRequest("Name");
                if (Common.GetRequest("QId") != null)
                    qId = Convert.ToInt32(Common.GetRequest("QId"));
                if (Common.GetRequest("distriStartTime") != "" && Common.GetRequest("distriStartTime") != null)
                    start = Convert.ToDateTime(Common.GetRequest("distriStartTime"));
                if (Common.GetRequest("distriEndTime") != "" && Common.GetRequest("distriEndTime") != null)
                    end = Convert.ToDateTime(Common.GetRequest("distriEndTime"));

                DataSet source = MgrServices.AdvisoryStatisticsService.GetIndividualConsultations(_enterpriseCode, UId, name, qId, start, end, startpage, endPage);
                PageInfo page = new PageInfo();
                if (source != null && source.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(source.Tables[0].Rows[0][0]);
                    DataTable dTable = source.Tables[1];
                    if (dTable.Rows.Count > 0)
                    {
                        foreach (DataRow item in dTable.Rows)
                        {
                            String[] str =
                            {
                                 "<input class='checkDistri' "+" type='checkbox' name='checkboxname' data-id ='" + item["id"]
                                 +"' data-number='"+item["Number"] + "'>",//0
                                 item["RowNumber"].ToString(),//1序号
                                 item["Number"].ToString(),//2个案号
                                 item["U_LoginName"].ToString(),//3登录名
                                 item["U_Name"].ToString(),//4姓名
                                 item["QTName"].ToString(),//5问题类型
                                 item["StartDate"].ToString(),//6接案时间
                                 item["UName"].ToString(),//7咨询师
                            };
                            page.data.Add(str);
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
        /// 创建人：田闯
        /// 创建时间：2017/5/4
        /// 获取团体咨询信息
        /// </summary>
        /// <returns></returns>
        private void GetGroupConsultations(HttpContext context)
        {
            try
            {
                int startpage = 0;
                int endPage = 0;
                DateTime start = new DateTime();
                DateTime end = new DateTime();
                int qId = 0;

                string userId = Common.GetSessionValue("UserID", context);
                int UId = Convert.ToInt32(userId);
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
                if (Common.GetRequest("StartPageIndex") != null)
                    startpage = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                if (Common.GetRequest("EndPageIndex") != null)
                    endPage = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                if (Common.GetRequest("QId") != null)
                    qId = Convert.ToInt32(Common.GetRequest("QId"));
                if (Common.GetRequest("distriStartTime") != "" && Common.GetRequest("distriStartTime") != null)
                    start = Convert.ToDateTime(Common.GetRequest("distriStartTime"));
                if (Common.GetRequest("distriEndTime") != "" && Common.GetRequest("distriEndTime") != null)
                    end = Convert.ToDateTime(Common.GetRequest("distriEndTime"));

                DataSet source = MgrServices.AdvisoryStatisticsService.GetGroupConsultations(UId, qId, enterpriseCode, start, end, startpage, endPage);
                PageInfo page = new PageInfo();
                if (source != null && source.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(source.Tables[0].Rows[0][0]);
                    DataTable dTable = source.Tables[1];
                    if (dTable.Rows.Count > 0)
                    {
                        foreach (DataRow item in dTable.Rows)
                        {
                            String[] str =
                            {
                                 "<input class='checkDistri' "+" type='checkbox' name='checkboxname' data-id ='" + item["id"]
                                 +"' data-number='"+item["Number"] + "'>",//0
                                 item["PageIndex"].ToString(),//1序号
                                 item["Number"].ToString(),//2档案号
                                 item["CSName"].ToString(),//3主题
                                 item["QTName"].ToString(),//4问题类型
                                 item["StartDate"].ToString(),//5接案时间
                                 item["U_LoginName"].ToString(),//6咨询师
                            };
                            page.data.Add(str);
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
        /// 创建人：田闯
        /// 创建时间：217/5/5
        /// 获取个体咨询档案信息
        /// </summary>
        /// <param name="context"></param>
        private void GetPersonalStatementInfo(HttpContext context)
        {
            try
            {
                string id = Common.GetRequest("id");
                string uId = Common.GetSessionValue("UserID", context);
                int UserId = 0;
                if (uId != null)
                    UserId = Convert.ToInt32(uId);
                string title = Common.GetRequest("title");
                int nowId = 0;
                if (Common.GetRequest("nowId") != null && Common.GetRequest("nowId") != "")
                    nowId = Convert.ToInt32(Common.GetRequest("nowId"));

                List<object> obj = new List<object>();

                DataSet source = MgrServices.AdvisoryStatisticsService.GetPersonalStatementInfo(id, UserId);

                string roleName = source.Tables[1].Rows[0][0].ToString();//

                PageInfo page = new PageInfo();
                if (source != null && source.Tables.Count > 0)
                {
                    DataTable table1 = source.Tables[0];
                    var tempTable = table1.AsEnumerable().GroupBy(x => new { D_ID = x.Field<int>("D_ID"), DName = x.Field<string>("D_name") }).Select(x => new
                    {
                        D_ID = x.Key.D_ID,//部门ID  
                        dName = x.Key.DName,//部门名称
                        count = x.Count(y => int.Parse(y["D_ID"].ToString()) == x.Key.D_ID),//人数
                        womenNum = x.Count(y => y["U_Sex"].ToString() == "女"),//女性人数
                        manNum = x.Count(y => y["U_Sex"].ToString() == "男"),//男性人数
                        Severity = 0//严重程度
                    }).ToArray();
                    obj.Add(tempTable);//用来创建表格的数据源，包含部门名称、人数、重点关注人数   0


                    foreach (DataRow item in table1.Rows)
                    {
                        String[] str =
                        {
                            item["D_ID"].ToString(),//部门ID  0
                            item["Id"].ToString(),//ID  1
                            item["StartDate"].ToString(),//开始时间  2
                            item["QTName"].ToString(),//问题类型  3
                            item["Content"].ToString(),//咨询记录JSon  4
                            item["U_Sex"].ToString()//性别  5
                        };
                        page.data.Add(str);
                    }

                }

                obj.Add(page);//生成图表的数据源。  1
                obj.Add(roleName);//角色名称  2
                obj.Add(Common.GetSessionValue("loginName", context));//创建报表的人   3
                obj.Add(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));//创建报表的日期  4
                obj.Add(Common.GetTimeStamp());//报表编号  5

                String json = Common.ObjectToJson(obj);

                obj.Add(nowId);//报表ID  6
                json = Common.ObjectToJson(obj);
                context.Response.Write(json);
            }
            catch
            {
                context.Response.Write(-1);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/9
        /// 获取团体咨询档案的信息
        /// </summary>
        /// <param name="context"></param>
        private void GetTeamStatementInfo(HttpContext context)
        {
            try
            {
                string id = Common.GetRequest("id");
                string uId = Common.GetSessionValue("UserID", context);
                int UserId = 0;
                if (uId != null)
                    UserId = Convert.ToInt32(uId);
                string title = Common.GetRequest("title");

                int nowId = 0;
                if (Common.GetRequest("nowId") != null && Common.GetRequest("nowId") != "")
                    nowId = Convert.ToInt32(Common.GetRequest("nowId"));

                List<object> obj = new List<object>();

                DataSet source = MgrServices.AdvisoryStatisticsService.GetTeamStatementInfo(id, UserId);

                string roleName = source.Tables[1].Rows[0][0].ToString();//
                PageInfo page = new PageInfo();
                if (source != null && source.Tables.Count > 0)
                {
                    DataTable table = source.Tables[0];
                    if (table.Rows.Count > 0)
                    {
                        foreach (DataRow item in table.Rows)
                        {
                            String[] str =
                            {
                                item["Id"].ToString(),//ID  0
                                item["Number"].ToString(),//档案编号  1
                                item["CSName"].ToString(),//主题名称  2
                                item["U_Name"].ToString(),//咨询师姓名  3
                                item["QTName"].ToString(),//问题类型  4
                                item["Content"].ToString()//json  5
                            };
                            page.data.Add(str);
                        }
                    }
                    obj.Add(page);//生成图表的数据源。  0
                    obj.Add(roleName);//角色名称  1
                    obj.Add(Common.GetSessionValue("loginName", context));//创建报表的人   2
                    obj.Add(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));//创建报表的日期  3
                    obj.Add(Common.GetTimeStamp());//报表编号  4

                    String json = Common.ObjectToJson(page);

                    obj.Add(nowId);//报表ID  5
                    json = Common.ObjectToJson(obj);
                    context.Response.Write(json);
                }
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/8
        /// 更新报表的分析建议
        /// </summary>
        /// <param name="context"></param>
        private void UpdateSubject(HttpContext context)
        {
            try
            {
                int id = 0;
                if (Common.GetRequest("id") != "")
                    id = Convert.ToInt32(Common.GetRequest("id"));
                string text = Common.GetRequest("text");
                int result = MgrServices.AdvisoryStatisticsService.UpdateSubject(id, text);
                context.Response.Write(result);
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/8
        /// 查看报表
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private void LookAdvisory(HttpContext context)
        {
            try
            {
                int id = 0;
                if (Common.GetRequest("id") != null && Common.GetRequest("id") != "")
                    id = Convert.ToInt32(Common.GetRequest("id"));

                AdvisoryStatisticsService.AdvisoryStatisticsModel entity = MgrServices.AdvisoryStatisticsService.LookAdvisory(id);
                String json = Common.ObjectToJson(entity);
                context.Response.Write(json);
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/9
        /// 添加团体咨询档案报表
        /// </summary>
        /// <param name="context"></param>
        private void AddTeamStatementInfo(HttpContext context)
        {
            try
            {
                #region

                int result = 0;
                string id = Common.GetRequest("id");
                string uId = Common.GetSessionValue("UserID", context);
                int UserId = 0;
                if (uId != null)
                    UserId = Convert.ToInt32(uId);
                string title = Common.GetRequest("title");

                List<object> obj = new List<object>();

                DataSet source = MgrServices.AdvisoryStatisticsService.GetTeamStatementInfo(id, UserId);

                string roleName = source.Tables[1].Rows[0][0].ToString();//
                PageInfo page = new PageInfo();

                bool contentIsNull = true;//判断是否有咨询记录，只要有一条则代表通过

                if (source != null && source.Tables.Count > 0)
                {
                    DataTable table = source.Tables[0];
                    if (table.Rows.Count > 0)
                    {
                        foreach (DataRow item in table.Rows)
                        {
                            if (item["Content"].ToString() != "")
                                contentIsNull = false;
                            String[] str =
                            {
                                item["Id"].ToString(),//ID  0
                                item["Number"].ToString(),//档案编号  1
                                item["CSName"].ToString(),//主题名称  2
                                item["U_Name"].ToString(),//咨询师姓名  3
                                item["QTName"].ToString(),//问题类型  4
                                item["Content"].ToString()//json  5
                            };
                            page.data.Add(str);
                        }
                    }
                    if (contentIsNull)
                    {
                        context.Response.Write(-2);
                        return;
                    }

                    obj.Add(page);//生成图表的数据源。  0
                    obj.Add(roleName);//角色名称  1
                    obj.Add(Common.GetSessionValue("loginName", context));//创建报表的人   2
                    obj.Add(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));//创建报表的日期  3
                    string number = GetNumber();
                    obj.Add(number);//报表编号  4

                    String json = Common.ObjectToJson(page);

                #endregion

                    string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context); //企业ID  
                    AdvisoryStatisticsService.AdvisoryStatisticsModel entity =
                        new AdvisoryStatisticsService.AdvisoryStatisticsModel();
                    entity.Content = title;
                    entity.CeatePerson = UserId;
                    entity.CreateTime =
                        Convert.ToDateTime(Convert.ToDateTime(obj[3]).ToString("yyyy/MM/dd HH:mm:ss"));
                    entity.Number = number;
                    entity.Result = json;
                    entity.Type = true;
                    entity.EnterpriseCode = enterpriseCode;

                    result = MgrServices.AdvisoryStatisticsService.InsertAdvisoryStatistic(entity);
                    if (result <= 0)
                    {
                        context.Response.Write(-1);
                        return;
                    }
                    object[] arr = { entity.Number, result };
                    context.Response.Write(Common.ObjectToJson(arr));
                }
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/9
        /// 添加个体咨询档案报表
        /// </summary>
        /// <param name="context"></param>
        private void AddPersonStatementInfo(HttpContext context)
        {
            try
            {
                string id = Common.GetRequest("id");
                string uId = Common.GetSessionValue("UserID", context);
                int UserId = 0;
                if (uId != null)
                    UserId = Convert.ToInt32(uId);
                string title = Common.GetRequest("title");

                List<object> obj = new List<object>();

                DataSet source = MgrServices.AdvisoryStatisticsService.GetPersonalStatementInfo(id, UserId);

                string roleName = source.Tables[1].Rows[0][0].ToString();//

                PageInfo page = new PageInfo();
                bool contentIsNull = true;//判断是否有咨询记录，只要有一条则代表通过
                if (source != null && source.Tables.Count > 0)
                {
                    DataTable table1 = source.Tables[0];
                    var tempTable = table1.AsEnumerable().GroupBy(x => new { D_ID = x.Field<int>("D_ID"), DName = x.Field<string>("D_name") }).Select(x => new
                    {
                        D_ID = x.Key.D_ID,//部门ID  
                        dName = x.Key.DName,//部门名称
                        count = x.Count(y => int.Parse(y["D_ID"].ToString()) == x.Key.D_ID),//人数
                        womenNum = x.Count(y => y["U_Sex"].ToString() == "女"),//女性人数
                        manNum = x.Count(y => y["U_Sex"].ToString() == "男"),//男性人数
                        Severity = 0//严重程度
                    }).ToArray();
                    obj.Add(tempTable);//用来创建表格的数据源，包含部门名称、人数、重点关注人数   0

                    foreach (DataRow item in table1.Rows)
                    {
                        if (item["Content"].ToString() != "")
                            contentIsNull = false;
                        String[] str =
                        {
                            item["D_ID"].ToString(),//部门ID  0
                            item["Id"].ToString(),//ID  1
                            item["StartDate"].ToString(),//开始时间  2
                            item["QTName"].ToString(),//问题类型  3
                            item["Content"].ToString(),//咨询记录JSon  4
                            item["U_Sex"].ToString()//性别  5
                        };
                        page.data.Add(str);
                    }

                }
                if (contentIsNull)
                {
                    context.Response.Write(-2);
                    return;
                }
                obj.Add(page);//生成图表的数据源。  1
                obj.Add(roleName);//角色名称  2
                obj.Add(Common.GetSessionValue("loginName", context));//创建报表的人   3
                obj.Add(DateTime.Now.ToString("yyyy/MM/dd HH:mm:ss"));//创建报表的日期  4
                string number = GetNumber();
                obj.Add(number);//报表编号  5

                String json = Common.ObjectToJson(obj);

                string _enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
                AdvisoryStatisticsService.AdvisoryStatisticsModel entity =
                    new AdvisoryStatisticsService.AdvisoryStatisticsModel();
                entity.Content = title;
                entity.CeatePerson = UserId;
                entity.CreateTime = Convert.ToDateTime(Convert.ToDateTime(obj[4]).ToString("yyyy/MM/dd HH:mm:ss"));
                entity.Number = number;
                entity.Result = json;
                entity.Type = false;
                entity.EnterpriseCode = _enterpriseCode;

                int result = MgrServices.AdvisoryStatisticsService.InsertAdvisoryStatistic(entity);
                if (result <= 0)
                {
                    context.Response.Write(-1);
                    return;
                }
                object[] arr = { entity.Number, result };
                context.Response.Write(Common.ObjectToJson(arr));
            }
            catch
            {
                context.Response.Write(-1);
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/9
        /// 删除报表
        /// </summary>
        /// <param name="context"></param>
        private void DeleteData(HttpContext context)
        {
            try
            {
                string id = string.Empty;
                string name = string.Empty;
                string userID = Common.GetSessionValue("UserID", context);
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                long userId = 0;
                if (userID != "")
                    userId = Convert.ToInt64(userID);

                if (Common.GetRequest("id") != null)
                    id = Common.GetRequest("id");
                if (Common.GetRequest("name") != null)
                    name = Common.GetRequest("name");
                string[] idList = id.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                string[] nameList = name.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                if (idList.Length == 0 || nameList.Length == 0)
                { context.Response.Write(-1); return; }

                int result = 0;

                //判断当前用户的身份，往回收站中删除时填入不同的字段
                string roleName = MgrServices.AdvisoryStatisticsService.GetRoleName(userId);
                string deleteField = "Is_Delete";
                if (roleName == "超级管理员")
                    deleteField = "Super_Delete";

                for (int i = 0; i < idList.Length; i++)
                {
                    CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                    model.RBTitle = "删除咨询统计-" + nameList[i]; //标题
                    model.RBModularID = 34; //对应模块权限ID
                    model.RBTableName = "AdvisoryStatistics"; //删除的表名
                    model.RBFieldName = "id"; //删除相对应字段的id
                    model.RBFieldValue = idList[i].ToString(); //删除列名的id
                    model.RBDeleteFieldName = deleteField; //表的删除字段一般 某某某_Delete
                    model.RBDeleteTime = DateTime.Now;
                    model.EnterpriseCode = enterpriseCode;

                    model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                    if (model.RBExcutePerson == null)
                    {
                        context.Response.Write(result);
                        return;
                    }
                    result = MgrServices.RecycleBinService.PutDataInRecycleBin(model) == true ? 1 : 0;
                }
                context.Response.Write(result);

            }
            catch
            {
            }
        }

        private void GetRole(HttpContext context)
        {
            try
            {
                string id = Common.GetSessionValue("UserID", context);
                long u_Id = 0;
                if (id != "")
                    u_Id = Convert.ToInt64(id);
                string role = MgrServices.AdvisoryStatisticsService.GetRoleName(u_Id);
                int result = role == "超级管理员" ? 1 : 2;
                context.Response.Write(result);
            }
            catch
            {
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/16
        /// 生成报表编号
        /// </summary>
        private string GetNumber()
        {
            Random rd = new Random();
            try
            {
                string result = "";
                bool existNumber = false;
                do
                {
                    int temp = rd.Next(0, 100000000);
                    result += DateTime.Now.ToString("yyyyMMdd") + temp.ToString("00000000");
                    object isExist = MgrServices.AdvisoryStatisticsService.CheckNumber(result);
                    if (isExist == null)
                        return result;
                    else
                        existNumber = (bool)isExist;
                } while (existNumber);
                return result;

            }
            catch (Exception ex)
            {
                new CustomException(ex.Message, "CrisisInterfere.FunctionModular.AdvisoryStatistics.Ajax.GetNumber()", "生成报表编号");
                return "";
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