using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using BR_Service;
using CrisisInterfere.projrem;

namespace CrisisInterfere.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary> 问题类型 </summary>
    public class QuestionType : IHttpHandler, IRequiresSessionState
    {
        #region # 属性

        public bool IsReusable { get { return false; } }
        private HttpContext Context { get; set; }
        private string EnterpriseCode;

        #endregion

        #region # 请求入口 —— public void ProcessRequest(HttpContext context)
        /// <summary> 请求入口 </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            Context = context;
            // 操作类型
            string operationType = Common.GetRequest("operationType");

            switch (operationType)
            {
                case "Bind":// 绑定列表
                    Bind();
                    break;
                case "Info":
                    GetQutestionTypeInfo();
                    break;
                case "Update":
                    EnterpriseCode = context.Session["EnterpriseCode"].ToString();
                    Update();
                    break;
                case "Del":
                    Delete();
                    break;
                case "CheckName":
                    CheckNameIsRepeat();
                    break;

            }
        }
        #endregion


        #region # 获取UserId —— int GetUserId()
        /// <summary> 获取 UserId </summary>
        /// <returns></returns>
        public int GetUserId()
        {
            // 获取用户Id
            int sessionUId = 0;

            string uId = Common.GetSessionValue("UserID", Context);
            if (uId != null)
            {
                Int32.TryParse(uId, out sessionUId);
            }

            return sessionUId;
        }

        #endregion

        #region # 绑定列表 —— Bind()
        /// <summary> 绑定列表 </summary> 
        public void Bind()
        {
            // 获取session Id
            int uId = GetUserId();
            var startRowIndex = Common.GetRequest("startRowIndex").ToInt();// 行开始下标
            var endRowIndex = Common.GetRequest("endRowIndex").ToInt();// 行结束下标

            // 临时属性
            string tempUserRoleTypeName = "";// 用户权限类型名称
            int tempQTId = 0;// 问题Id
            string tempIsOperation = "0";// 是否可以使用 0：不可以使用 1：可以使用
            string tempUseCount = "0";// 问题使用数量
            string tempQTCreatePerson = "";// 问题创建用户id
            DataTable tempDataTable;// 数据源
            try
            {
                // 实例化分页实体
                PageInfo page = new PageInfo();
                // 获取结果集
                DataSet ds = MgrServices.QuestionTypeService.GetQuestionTypes(uId, Common.GetSessionValue("EnterpriseCode", Context), startRowIndex, endRowIndex);

                // 结果集不为空 或者 为相应结果集数量
                if (ds != null && ds.Tables.Count == 3)
                {
                    // 获取总行数
                    page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0]["total"]);

                    // 获取 用户 权限类别名称
                    tempDataTable = ds.Tables[1];
                    if (tempDataTable.Rows.Count > 0)
                    {
                        tempUserRoleTypeName = ds.Tables[1].Rows[0]["RoleType_Name"].ToString();
                    }

                    // 获取 问题类型集
                    tempDataTable = ds.Tables[2];
                    foreach (DataRow dr in tempDataTable.Rows)
                    {
                        tempQTId = Int32.Parse(dr["QTID"].ToString());//问题id
                        tempUseCount = dr["UseCount1"].ToString() + dr["UseCount2"].ToString() + dr["UseCount3"].ToString() + dr["UseCount4"].ToString();// 问题使用数量
                        tempQTCreatePerson = dr["QTCreatePerson"].ToString();// 创建人Id

                        // 超级管理员可操作 权限
                        if (tempUserRoleTypeName == "超级管理员" && tempUseCount == "0000")
                        {
                            tempIsOperation = "1";
                        }
                        else if (uId.ToString() == tempQTCreatePerson && tempUseCount == "0000") // 普通管理员可操作权限
                        {
                            tempIsOperation = "1";
                        }
                        else
                        {
                            tempIsOperation = "0";
                        }

                        // 返回参数
                        String[] arr =
                            {  
                               tempQTId+"",
                                dr["QTName"].ToString(),
                                dr["Describe"].ToString(),
                                tempIsOperation,
                                dr["EnterpriseCode"].ToString()
                            };
                        page.data.Add(arr);
                    }
                }

                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                Context.Response.Write(json);

            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 查询名称是否重复 —— CheckNameIsRepeat()
        /// <summary> 查询名称是否重复 </summary>
        public void CheckNameIsRepeat()
        {
            try
            {

                string name = Common.GetRequest("txtName");
                // 获取请求Id
                int tempRequstQTID = Common.GetRequest("Identity").ToInt();
                string enterCode = Common.GetSessionValue("EnterpriseCode", Context);

                Dictionary<string, bool> isE = new Dictionary<string, bool>
            {
                {"valid", MgrServices.QuestionTypeService.CheckNameIsRepeat(tempRequstQTID,name,enterCode)}
            };

                String json = Common.ObjectToJson(isE);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 更新数据 —— Update()
        /// <summary> 更新数据 </summary>
        public void Update()
        {
            try
            {

                // 获取请求Id
                int tempRequstQTID = Common.GetRequest("Index").ToInt();


                QuestionTypeService.QuestionType tempQuestionType = new QuestionTypeService.QuestionType();
                tempQuestionType.QTName = Common.GetRequest("Name");
                tempQuestionType.Describe = Common.GetRequest("Describe");
                tempQuestionType.QTCreatePerson = GetUserId();
                tempQuestionType.EnterpriseCode = EnterpriseCode;

                if (tempRequstQTID == 0)
                {
                    MgrServices.QuestionTypeService.AddQuestionType(tempQuestionType);

                }
                else if (tempRequstQTID > 0)
                {
                    tempQuestionType.QTID = tempRequstQTID;
                    MgrServices.QuestionTypeService.EditQuestionType(tempQuestionType);
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 获取问题类型信息 —— GetQutestionTypeInfo()

        /// <summary> 获取问题类型信息 </summary>
        public void GetQutestionTypeInfo()
        {
            try
            {

                // 获取请求Id
                int tempRequstQTID = Common.GetRequest("Index").ToInt();


                QuestionTypeService.QuestionType tempQuestionType = MgrServices.QuestionTypeService.GetQuestionInfo(tempRequstQTID);
                String json = Common.ObjectToJson(tempQuestionType);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 删除 —— Delete()
        /// <summary> 删除 </summary>
        public void Delete()
        {
            try
            {
                // 获取请求Id
                int tempRequstQTID = Common.GetRequest("Index").ToInt();


                int tempCount = MgrServices.QuestionTypeService.DeleteQuestionType(tempRequstQTID);

                String json = Common.ObjectToJson(tempCount);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion
    }
}