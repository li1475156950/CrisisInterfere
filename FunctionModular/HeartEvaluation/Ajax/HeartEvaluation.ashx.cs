using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.HeartEvaluation.Ajax
{
    /// <summary>
    /// Handler1 的摘要说明
    /// </summary>
    public class Handler1 : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string Type = Common.GetRequest("type");
            switch (Type)
            {
                case "init":
                    int Amount_TypeID = 0;
                    int Amount_Source = 0;
                    int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                    string Amount_Name = Convert.ToString(context.Request["Amount_Name"]);
                    string EnterpriseCode = "";
                    if (Convert.ToInt32(context.Request["Amount_TypeID"]) != 0)
                    {
                        Amount_TypeID = Convert.ToInt32(context.Request["Amount_TypeID"]);
                    }
                    if (Convert.ToInt32(context.Request["Amount_Source"]) != 0)
                    {
                        Amount_Source = Convert.ToInt32(context.Request["Amount_Source"]);
                    }
                    if (context.Session["EnterpriseCode"] != null)
                    {
                        EnterpriseCode = context.Session["EnterpriseCode"].ToString();
                    }
                    InitGaugePages(Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex, EnterpriseCode, context);
                    break;
                case "DelAmount":
                    string Acode = Common.GetRequest("ACode");
                    int Aid = Convert.ToInt32(Common.GetRequest("AId"));
                    string Aname = Common.GetRequest("AName");
                    DelAmount(Acode, Aid, Aname, context);
                    break;
                case "JundgeIsAlter":
                    JundgeIsAlter(context);
                    break;
                case "LoadAmountType":
                    LoadAmountType(context);
                    break;
                case "LoadAmount":
                    LoadAmount(context);
                    break;
                case "LoadCheckedAmount":
                    LoadCheckedAmount(context);
                    break;
                case "AddCheckedAmount":
                    AddCheckedAmount(context);
                    break;
                case "Bind":
                    Bind(context);
                    break;
                case "JudgeAmountCombinationName":
                    JudgeAmountCombinationName(context);
                    break;
                case "AddAmountCombination":
                    AddAmountCombination(context);
                    break;
                case "UpdateAmountCombination":
                    UpdateAmountCombination(context);
                    break;
                case "DeleteAmountCombination":
                    DeleteAmountCombination(context);
                    break;
                case "GetAmountCodeByACID":
                    GetAmountCodeByACID(context);
                    break;
                default:
                    break;

            }
        }


        public void DelAmount(string Acode, int Aid, string Aname, HttpContext context)
        {
            int result = 0;
            try
            {
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                model.RBTitle = "删除量表管理-" + Aname; //标题
                model.RBModularID = 14; //对应模块权限ID
                model.RBTableName = "Amount_Info"; //删除的表名
                model.RBFieldName = "Amount_ID"; //删除相对应字段的id
                model.RBFieldValue = Aid.ToString(); //删除列名的id
                model.RBDeleteFieldName = "Is_Delete"; //表的删除字段一般 某某某_Delete
                model.RBDeleteTime = DateTime.Now;
                model.EnterpriseCode = enterpriseCode;
                model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                if (model.RBExcutePerson == null)
                {
                    context.Response.Write(result);
                    return;
                }
                result = MgrServices.RecycleBinService.PutDataInRecycleBin(model) == true ? 1 : 0;
                //int result = MgrServices.AmountService.DisplayAmount(Acode);
                context.Response.Write(result);

            }
            catch
            {
                context.Response.Write(result);
            }
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-09-07
        /// 功能介绍：根据相关的页面参数，查询量表数据集合
        /// </summary>
        /// <param name="Amount_TypeID">量表类型ID</param>
        /// <param name="Amount_Name">量表名称</param>
        /// <param name="Amount_Source">量表来源</param>
        /// <param name="StarPageIndex">开始页码</param>
        /// <param name="EndPageIndex">结束页码</param>
        /// <returns></returns>
        private DataSet GetGaugeTemp(HttpContext context, int Amount_TypeID, string Amount_Name, int Amount_Source, int StarPageIndex, int EndPageIndex)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (LicenseCode == null)
                    return null;
                SourceTemp = MgrServices.AmountService.GetAmountTemp(Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex, LicenseCode);
            }
            catch
            {

            }

            return SourceTemp;
        }


        private void InitGaugePages(int Amount_TypeID, string Amount_Name, int Amount_Source, int StarPageIndex, int EndPageIndex, string EnterpriseCode, HttpContext context)
        {

            try
            {


                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetGaugeTemp(context, Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex);
                if (SourceTemps.Tables[1].Rows.Count == 0)
                {
                    if (StarPageIndex > 10)
                    {
                        StarPageIndex = StarPageIndex - 10;
                        EndPageIndex = EndPageIndex - 10;
                        SourceTemps = GetGaugeTemp(context, Amount_TypeID, Amount_Name, Amount_Source, StarPageIndex, EndPageIndex);
                    }
                }
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {


                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            string SourceName = "";
                            string A_Soure = "";
                            A_Soure = DTR["Amount_Source"] == DBNull.Value || DTR["Amount_Source"].ToString() == "" ? "0" : DTR["Amount_Source"].ToString();
                            //SourceName = Convert.ToInt32(A_Soure);
                            double Speed = 0;
                            Speed = 1 + Convert.ToInt32(DTR["Speed"].ToString());
                            switch (A_Soure)
                            {
                                case "0":
                                    SourceName = "未知";
                                    Speed = 100;
                                    break;
                                case "1":
                                    SourceName = "系统量表";
                                    Speed = 100;
                                    break;
                                case "2":
                                    SourceName = "组合量表";
                                    Speed = (Speed / 3.00) * 100;
                                    break;
                                case "3":
                                    SourceName = "自编量表";
                                    Speed = (Speed / 4.00) * 100;
                                    break;

                            }

                            String[] arr =
                            {
                                DTR["Amount_Code"].ToString(), //量表ID 
                                DTR["PageIndex"].ToString(),//序号	
                                DTR["Amount_Name"].ToString(),//量表名称
                                DTR["Amount_DisplayName"].ToString(),//显示名称
                                DTR["AmountType_Name"].ToString(),//量表类别
                                //DTR["Amount_SubjectNum"].ToString(),//题目数量
                                MgrServices.AmountService.GetSubjectCountByAmountCode(DTR["Amount_Code"].ToString()),
                               DTR["Start_ApplyPeoples"].ToString(),//+"-"+ DTR["End_ApplyPeoples"].ToString(),//适用人群 
                                SourceName,//量表来源
                                DTR["AmountCreatePersonName"].ToString(),
                                Speed.ToString(),//量表完成度
                                "",//操作
                                EnterpriseCode,
                                DTR["Amount_ID"].ToString(),//量表ID
                            };
                            page.data.Add(arr);


                        }

                        //       <option value="0">不限</option>
                        //<option value="1">系统量表</option>
                        //<option value="2">组合量表</option>
                        //<option value="3">自编量表</option>
                    }
                }
                page.recordsFiltered = page.recordsTotal;
                List<string[]> result = page.data.Distinct().ToList();
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            {

            }
        }
        public void JundgeIsAlter(HttpContext context)
        {
            var loginName = Common.GetSessionValue("loginName", context);
            if (loginName == null)
                return;
            var currentLoginName = Common.GetRequest("loginName");
            string _userID = Common.GetSessionValue("UserID", context);
            if (_userID == null)
                return;
            var currentUserID = Convert.ToInt32(_userID);
            var roleType = Convert.ToInt32(MgrServices.UserAddService.GetUserRoleType(currentUserID));
            if (roleType == 1)
            {
                context.Response.Write(true);
                context.Response.End();
            }
            if (loginName == currentLoginName)
            {
                context.Response.Write(true);
                context.Response.End();
            }
            context.Response.Write(false);
            context.Response.End();
        }
        public void LoadAmountType(HttpContext context)
        {
            var at = MgrServices.AmountService.GetAmountTypeModelList();
            context.Response.Write(JsonConvert.SerializeObject(at));
        }
        public void LoadAmount(HttpContext context)
        {
            var amount = MgrServices.AmountService.GetAmountList();
            context.Response.Write(JsonConvert.SerializeObject(amount));
        }
        public void LoadCheckedAmount(HttpContext context)
        {
            var acID = Convert.ToInt16(Common.GetRequest("acID"));
            var checkedAmount = MgrServices.AmountService.GetCheckedAmountCode(acID);
            context.Response.Write(JsonConvert.SerializeObject(checkedAmount));
        }
        public void AddCheckedAmount(HttpContext context)
        {
            int acID = Convert.ToInt32(Common.GetForm("acID"));
            string arrayACID = Common.GetForm("arrayACID");
            bool isSuccess = true;
            List<string> checkedAmountNow = JsonConvert.DeserializeObject<List<string>>(arrayACID);
            List<string> checkedAMountBefore = MgrServices.AmountService.GetCheckedAmountCode(acID);
            //for (int i = 1; i <= checkedAmountNow.Count; i++)
            //{
            //    if (checkedAMountBefore.Contains(checkedAmountNow[i - 1]))
            //    {
            //        string temp = checkedAmountNow[i - 1];
            //        //删除新旧角色权限交集
            //        checkedAmountNow.Remove(temp);
            //        checkedAMountBefore.Remove(temp);
            //        i = 0;
            //    }
            //    if (i == checkedAmountNow.Count + 1)
            //    {
            //        break;
            //    }
            //}

            for (int i = 0; i < checkedAMountBefore.Count; i++)
            {
                if (checkedAmountNow.IndexOf(checkedAMountBefore[i]) >= 0)
                {
                    checkedAmountNow.Remove(checkedAMountBefore[i]);
                    checkedAMountBefore.RemoveAt(i);
                    i--;
                }
            }
            //删除之前的量表
            if (checkedAMountBefore.Count() != 0)
            {
                try
                {
                    for (int i = 0; i < checkedAMountBefore.Count; i++)
                    {
                        MgrServices.AmountService.DeleteAmountCombination(acID, checkedAMountBefore[i]);
                    }
                }
                catch (Exception)
                {

                    isSuccess = false;
                }
            }
            //添加现在选中的
            if (checkedAmountNow.Count() != 0)
            {
                DataTable dt = new DataTable();
                dt.TableName = "AmountCombination_Relation";
                dt.Columns.Add("ACID", typeof(Int32));
                dt.Columns.Add("AmountCode", typeof(string));
                for (int i = 0; i < checkedAmountNow.Count; i++)
                {
                    DataRow dr = dt.NewRow();
                    dr["ACID"] = acID;
                    dr["AmountCode"] = checkedAmountNow[i];
                    dt.Rows.Add(dr);
                }
                try
                {
                    MgrServices.AmountService.AddCheckedAmountCombination(dt);

                }
                catch (Exception)
                {

                    isSuccess = false;
                }
            }
            context.Response.Write(isSuccess);
        }
        public void Bind(HttpContext context)
        {
            try
            {
                PageInfo page = new PageInfo();
                int StarIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
                int EndIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                DataSet sourceTemps = new DataSet();
                sourceTemps = MgrServices.AmountService.InitialAmountCombinationTable(StarIndex, EndIndex);
                if (sourceTemps != null && sourceTemps.Tables.Count > 0 && sourceTemps.Tables[1].Rows.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt16(sourceTemps.Tables[0].Rows[0][0]);
                    DataTable SourceTemp = sourceTemps.Tables[1];
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        var str = GetAmountCombinationStr(Convert.ToInt32(DTR["ACID"]));
                        var tempStr = str.Replace(",", "&emsp;");
                        String[] arr =
                            {

                               DTR["ACID"].ToString(),
                               "",
                               DTR["PageIndex"].ToString(),
                               DTR["ACName"].ToString(),
                               tempStr,
                               str.Split(new string[]{","},StringSplitOptions.RemoveEmptyEntries).Length.ToString(),
                               str,
                               ""
                         
                            };
                        page.data.Add(arr);
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
        public void JudgeAmountCombinationName(HttpContext context)
        {
            var acName = Common.GetRequest("acName");
            var acID = Convert.ToInt32(Common.GetRequest("acID"));
            context.Response.Write(MgrServices.AmountService.JudgeAmountCombinationName(acName, acID) > 0);
        }
        public void AddAmountCombination(HttpContext context)
        {
            var acName = Common.GetRequest("acName");
            context.Response.Write(MgrServices.AmountService.AddAmountCombination(acName) > 0);
        }
        public void UpdateAmountCombination(HttpContext context)
        {
            var acID = Convert.ToInt16(Common.GetRequest("acID"));
            var acName = Common.GetRequest("acName");
            context.Response.Write(MgrServices.AmountService.UpdateAmountCombination(acID, acName) > 0);
        }
        public void DeleteAmountCombination(HttpContext context)
        {
            var acID = Convert.ToInt16(Common.GetRequest("acID"));
            context.Response.Write(MgrServices.AmountService.DeleteAmountCombination(acID, "") > 0);
        }
        public string GetAmountCombinationStr(int acID)
        {
            return MgrServices.AmountService.GetAmountCombinationStrByACID(acID);
        }
        public void GetAmountCodeByACID(HttpContext context)
        {
            var acID = Convert.ToInt32(Common.GetRequest("acID"));
            context.Response.Write(JsonConvert.SerializeObject(MgrServices.AmountService.GetAmountCodeByACID(acID)));
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