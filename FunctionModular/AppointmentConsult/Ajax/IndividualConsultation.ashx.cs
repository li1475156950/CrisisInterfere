using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using BR_Service;
using CrisisInterfere.IndividualConsultationService;
using CrisisInterfere.projrem;

namespace CrisisInterfere.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// IndividualConsultation 的摘要说明
    /// </summary>
    public class IndividualConsultation : IHttpHandler, IRequiresSessionState
    {
        #region # 属性

        public bool IsReusable { get { return false; } }
        private HttpContext Context { get; set; }


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
                case "ConsultationInfo":// 获取问题类型及用户
                    GetConsultationInfo();
                    break;
                case "RelatedInfo":// 获取 获取关联信息
                    GetRelatedInfo();
                    break;
                case "NotRelated":// 获取未关联记录信息
                    GetNotRelated();
                    break;
                case "Number":// 加载个案号
                    GetNumber();
                    break;
                case "Del":// 删除
                    Delete(context);
                    break;
                case "BatchDel": // 批量删除
                    BatchDelete();
                    break;
                case "SaveFile":// 保存基本信息
                    SaveFile();
                    break;
                case "SaveRecord":// 保存记录集信息
                    SaveRecord();
                    break;
                case "SaveSummary":// 保存结案总结信息
                    SaveSummary();
                    break;
                case "Info":// 获取个案信息
                    GetInfo();
                    break;
            }
        }
        #endregion



        #region # 获取个案号 —— GetNumber()
        /// <summary>获取个案号  GT_八位日期+随机数字</summary>
        public void GetNumber()
        {
            Random rd = new Random();
            try
            {
                string result;
                bool existNumber = false;
                do
                {
                    result = "GT_";
                    byte[] buffer = Guid.NewGuid().ToByteArray();
                    int temp = BitConverter.ToInt32(buffer, rd.Next(0, 13));
                    result += DateTime.Now.ToString("yyyyMMdd") + temp.ToString("X");
                    object isExist = MgrServices.IndividualConsultationService.ExistNumber(result);
                    if (isExist == null)
                        return;
                    else
                        existNumber = (bool)isExist;
                } while (existNumber);
                String json = Common.ObjectToJson(result);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region # 获取个体档案集 —— Bind()
        /// <summary> 绑定列表 </summary> 
        public void Bind()
        {
            // 获取session Id
            int uId = Common.GetSessionValue("UserID", Context).ToInt();
            int startRowIndex = Common.GetRequest("startRowIndex").ToInt();// 行开始下标
            int endRowIndex = Common.GetRequest("endRowIndex").ToInt();// 行结束下标
            string keywords = Common.GetRequest("keywords");// 关键字 
            string status = Common.GetRequest("status");// 状态
            string startTime = Common.GetRequest("startTime");// 开始时间 
            string endTime = Common.GetRequest("endTime");// 结束时间

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
                DataSet ds = MgrServices.IndividualConsultationService.GetIndividualConsultations(uId, keywords, status, startTime, endTime, startRowIndex, endRowIndex);

                // 结果集不为空 或者 为相应结果集数量
                if (ds != null && ds.Tables.Count == 2)
                {

                    // 获取总行数
                    page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0]["total"]);


                    // 获取 问题类型集
                    tempDataTable = ds.Tables[1];
                    foreach (DataRow dr in tempDataTable.Rows)
                    {
                        // 返回参数
                        String[] arr =
                            {  
                                dr["Id"].ToString(),
                                dr["Number"].ToString(),
                                dr["U_LoginName"].ToString(),
                                dr["U_Name"].ToString(),
                                dr["QTName"].ToString(),
                                dr["SummaryTime"].ToString() == ""?"": Convert.ToDateTime( dr["SummaryTime"]).ToString("yyyy/MM/dd HH:mm"),
                                dr["StartDate"] == DBNull.Value?"": Convert.ToDateTime( dr["StartDate"]).ToString("yyyy/MM/dd HH:mm"),
                                "" ,
                                ""
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

        #region # 获取问题类型及用户 —— GetConsultationInfo()
        /// <summary> </summary>
        public void GetConsultationInfo()
        {
            try
            {

                // 个案Id
                int fileId = Common.GetRequest("index").ToInt();
                // 总数据集
                DataTable data = MgrServices.IndividualConsultationService.GetConsultationInfoByConsultTeacher(Common.GetSessionValue("UserID", Context).ToInt(), fileId);

                String json = Common.ObjectToJson(data);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 获取关联信息 —— GetRelatedInfo()
        /// <summary> 获取关联信息 </summary>
        public void GetRelatedInfo()
        {
            try
            {
                int uId = Common.GetRequest("userId").ToInt();// 用户Id
                int questionTypeId = Common.GetRequest("questionTypeId").ToInt(); // 问题类型Id

                DataTable tempIndividualConsultation = MgrServices.IndividualConsultationService.GetConsultationInfo(questionTypeId, uId, Common.GetSessionValue("UserID", Context).ToInt());
                if (tempIndividualConsultation.Rows.Count > 0)
                {
                    tempIndividualConsultation.Columns.Add("StartTimeNew", typeof(string));
                    tempIndividualConsultation.Rows[0]["StartTimeNew"] = Convert.ToDateTime(tempIndividualConsultation.Rows[0]["StartTime"]).ToString("yyyy/MM/dd HH:mm");
                }
                String json = Common.ObjectToJson(tempIndividualConsultation);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region # 获取未关联记录信息 —— GetNotRelated()
        /// <summary> 获取未关联记录信息 </summary>
        public void GetNotRelated()
        {
            try
            {

                int uId = Common.GetRequest("userId").ToInt();// 用户Id
                int questionTypeId = Common.GetRequest("questionTypeId").ToInt(); // 问题类型Id 

                DataTable tempIndividualConsultation = MgrServices.IndividualConsultationService.GetConsultationTime(questionTypeId, uId, Common.GetSessionValue("UserID", Context).ToInt());
                tempIndividualConsultation.Columns.Add("StartTimeNew", typeof(string));
                foreach (DataRow dr in tempIndividualConsultation.Rows)
                {
                    dr["StartTimeNew"] = Convert.ToDateTime(dr["StartTime"]).ToString("yyyy/MM/dd HH:mm");

                }
                String json = Common.ObjectToJson(tempIndividualConsultation);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }

        }

        #endregion

        #region # 获取个案信息 —— GetInfo()
        /// <summary> 获取未关联记录信息 </summary>
        public void GetInfo()
        {
            try
            {

                int id = Common.GetRequest("identity").ToInt();// 用户Id 
                string isEdit = Common.GetRequest("isEdit");// 是否编辑

                IndividualConsultationFileModel result = MgrServices.IndividualConsultationService.GetIndividualConsultationInfo(id);

                String json = Common.ObjectToJson(result);
                Context.Response.Write(json);

            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion


        #region # 保存基本信息 —— SaveFile()
        /// <summary> 保存基本信息 </summary>
        public void SaveFile()
        {
            try
            {

                int result = Common.GetRequest("identity").ToInt();// 基本信息Id

                if (result == 0)
                {
                    IndividualConsultationFileModel icfm = new IndividualConsultationFileModel()
                                {
                                    Number = Common.GetRequest("number"),
                                    QuestionTypeId = Common.GetRequest("questionType").ToInt(),
                                    UserId = Common.GetRequest("userId").ToInt(),
                                    MaritalStatus = Common.GetRequest("maritalStatus"),
                                    Culture = Common.GetRequest("culture"),
                                    Phone = Common.GetRequest("phone"),
                                    ConsultantId = Common.GetSessionValue("UserID", Context).ToInt(),
                                    StartDate = DateTime.Now
                                };
                    // 第一次为保存
                    result =
                        MgrServices.IndividualConsultationService.AddIndividualConsultationFile(icfm);
                }
                else
                {
                    // 多次为修改
                    MgrServices.IndividualConsultationService.EditIndividualConsultationFile(new IndividualConsultationFileModel()
                    {
                        Id = result,
                        Number = Common.GetRequest("number"),
                        QuestionTypeId = Common.GetRequest("questionType").ToInt(),
                        UserId = Common.GetRequest("userId").ToInt(),
                        MaritalStatus = Common.GetRequest("maritalStatus"),
                        Culture = Common.GetRequest("culture"),
                        Phone = Common.GetRequest("phone"),
                        ConsultantId = Common.GetSessionValue("UserID", Context).ToInt(),
                        StartDate = DateTime.Now
                    });

                }

                String json = Common.ObjectToJson(result);
                Context.Response.Write(json);

            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region # 保存记录信息 —— SaveRecord()
        /// <summary> 保存记录信息 </summary>
        public void SaveRecord()
        {

            try
            {
                int fileId = Common.GetRequest("identity").ToInt();// 基本信息Id
                string records = Common.GetRequest("records");// 记录集

                int result =
                    MgrServices.IndividualConsultationService.EditIndividualConsultationRecord(new IndividualConsultationRecordModel()
                    {
                        IndividualConsultationFileId = fileId,
                        Content = records

                    });

                String json = Common.ObjectToJson(result);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region # 保存结案总结 —— SaveSummary()

        /// <summary> 保存结案总结 </summary>
        public void SaveSummary()
        {
            try
            {

                int fileId = Common.GetRequest("identity").ToInt(); // 基本信息Id
                int consultingEffect = Common.GetRequest("consultingEffect").ToInt(); // 咨询效果评估
                string content = Common.GetRequest("content"); // 总结内容
                string contents = Common.GetRequest("contents"); // 其他总结内容
                bool canSummary = Common.GetRequest("canSummary").ToBool(); // 是否结案
                int result =
                    MgrServices.IndividualConsultationService.AddIndividualConsultationSummary(new IndividualConsultationSummaryModel
                        ()
                    {
                        IndividualConsultationFileId = fileId,
                        ConsultingEffect = consultingEffect,
                        Content = content,
                        OtherContent = contents

                    }, canSummary);
                String json = Common.ObjectToJson(result);
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
        public void Delete(HttpContext context)
        {
            try
            {
                //问题类型Id
                string tempQtIdList = Common.GetRequest("id").Trim().TrimEnd(',');
                string[] tempQtId = tempQtIdList.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                string tempQtNameList = Common.GetRequest("name").Trim().TrimEnd(',');
                string[] tempQtName = tempQtNameList.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                bool result = false;

                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);

                for (int i = 0; i < tempQtId.Length; i++)
                {

                    CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                    model.RBTitle = "删除个体咨询档案-" + tempQtName[i]; //标题
                    model.RBModularID = 32; //对应模块权限ID
                    model.RBTableName = "IndividualConsultationFile"; //删除的表名
                    model.RBFieldName = "Id"; //删除相对应字段的id
                    model.RBFieldValue = tempQtId[i].ToString();//删除列名的id
                    model.RBDeleteFieldName = "IsDelete"; //表的删除字段一般 某某某_Delete
                    model.RBDeleteTime = DateTime.Now;
                    model.RBExcutePerson = Common.GetSessionValue("loginName", Context);
                    model.EnterpriseCode = enterpriseCode;

                    if (model.RBExcutePerson == null)
                        return;
                    result = Convert.ToBoolean(MgrServices.RecycleBinService.PutDataInRecycleBin(model));
                }
                Context.Response.Write(result);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 批量删除 —— BatchDelete()
        /// <summary> 删除 </summary>
        public void BatchDelete()
        {
            try
            {

                // 获取请求Id
                string tempRequstQtid = Common.GetRequest("ids");

                // 去除最后一个‘，’
                if (tempRequstQtid != "")
                    tempRequstQtid = tempRequstQtid.Substring(0, tempRequstQtid.Length - 1);

                // 执行
                int tempCount = MgrServices.IndividualConsultationService.BatchDeleteIndividualConsultation(tempRequstQtid);

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