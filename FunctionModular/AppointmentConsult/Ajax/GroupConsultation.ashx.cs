using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using BR_Service;
using CrisisInterfere.projrem;
using System.Data;
using CrisisInterfere.GroupConsultationService;

namespace CrisisInterfere.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// GroupConsultation 的摘要说明
    /// </summary>
    public class GroupConsultation : IHttpHandler, IRequiresSessionState
    {
        #region # 属性

        public bool IsReusable { get { return false; } }
        private HttpContext Context { get; set; }


        #endregion
        public void ProcessRequest(HttpContext context)
        {
            Context = context;
            context.Response.ContentType = "text/plain";
            string operationType = Common.GetRequest("operationType");

            switch (operationType)
            {
                case "Bind":// 绑定列表
                    Bind();
                    break;
                case "Number":
                    GetNumber();
                    break;
                case "ConsultationInfo":
                    GetConsultationInfo();
                    break;
                case "RelatedInfo":// 获取 获取关联信息
                    GetRelatedInfo();
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
                case "NotRelated":// 获取未关联记录信息
                    GetGroupNotRelated();
                    break;
                case "GetGroupInfo":// 获取团体档案详细信息
                    GetInfo();
                    break;
                case "GetQuestionType":
                    GetQuestionType();
                    break;
                case "BatchDel": //批量删除
                    BatchDelete(context);
                    break;
                case "Del":
                    Delete();
                    break;
            }
        }

        #region # 获取个案号 —— GetNumber()
        /// <summary>获取个案号  GT_八位日期+随机数字</summary>
        public void GetNumber()
        {
            try
            {
                string result = "QT_";
                byte[] buffer = Guid.NewGuid().ToByteArray();
                int temp = BitConverter.ToInt32(buffer, new Random().Next(0, 13));

                if (temp.ToString().Length <= 8)
                    temp = Number(temp);

                result += DateTime.Now.ToString("yyyyMMdd") + temp.ToString("X");

                String json = Common.ObjectToJson(@result);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/24
        /// 递归判断随机生成的数字位数是否小于八位
        /// <=8位的时候，ToString("X")生成的字符串会不足八位，最后生成的编码也就不足19位
        /// </summary>
        /// <param name="num"></param>
        /// <returns></returns>
        private int Number(int num)
        {
            if (num.ToString().Length <= 8)
            {
                byte[] buffer = Guid.NewGuid().ToByteArray();
                num = BitConverter.ToInt32(buffer, new Random().Next(0, 13));
                if (num.ToString().Length <= 8)
                    num = Number(num);
            }
            return num;
        }
        #endregion

        #region # 获取团体档案集 —— Bind()
        /// <summary>
        /// 创建人:刘亚娟
        /// 创建时间：2017-4-14
        /// 绑定列表
        /// </summary>
        public void Bind()
        {
            string EnterpriseCode = "";
            if (Context.Session["EnterpriseCode"] != null)
            {
                EnterpriseCode = Context.Session["EnterpriseCode"].ToString();
            }
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
                DataSet ds = MgrServices.GroupConsultationService.GetGroupConsultations(uId, keywords, status, startTime, endTime, startRowIndex, endRowIndex, EnterpriseCode);

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
                                dr["CSName"].ToString(),                             
                                dr["QTName"].ToString(),                             
                                dr["StartDate"].ToString() == ""?"": Convert.ToDateTime( dr["StartDate"]).ToString("yyyy/MM/dd HH:mm"),
                                dr["SummaryTime"].ToString() ,
                                "",
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

        #region 获取问题类型--在参数设置
        public void GetQuestionType()
        {
            string EnterpriseCode = "";
            if (Context.Session["EnterpriseCode"] != null)
            {
                EnterpriseCode = Context.Session["EnterpriseCode"].ToString();
            }
            DataTable dt = MgrServices.GroupConsultationService.GetQuestionType(EnterpriseCode);
            String json = Common.ObjectToJson(dt);
            Context.Response.Write(json);

        }
        #endregion

        #region # 获取主题及问题类型 —— GetConsultationInfo()
        /// <summary> </summary>
        public void GetConsultationInfo()
        {
            try
            {

                //个案Id
                int fileId = 2017418;
                int UTeacherID = 0;
                if (Common.GetSessionValue("UserID", Context) != null)
                {
                    UTeacherID = Common.GetSessionValue("UserID", Context).ToInt();
                }

                // 总数据集
                DataTable data = MgrServices.GroupConsultationService.GetGroupConsultationInfoByConsultTeacher(UTeacherID, fileId);

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
                int uId = 0;// 用户Id
                int questionTypeId = Common.GetRequest("ThemTypeId").ToInt(); // 问题类型Id

                DataTable UserListByThem = MgrServices.GroupConsultationService.GetConsultationInfo(questionTypeId, uId, Common.GetSessionValue("UserID", Context).ToInt());
                String json = Common.ObjectToJson(UserListByThem);
                Context.Response.Write(json);
                //PageInfo page = new PageInfo();
                //if (UserListByThem.Rows.Count > 0)
                //{
                //    foreach (DataRow dr in UserListByThem.Rows)
                //    {
                //        // 返回参数
                //        String[] arr =
                //            {  
                //                dr["U_ID"].ToString(),
                //                dr["U_LoginName"].ToString(),
                //                dr["U_Name"].ToString(),
                //                dr["U_Sex"].ToString(),
                //                dr["U_Age"].ToString(),
                //                dr["D_name"].ToString(),

                //            };
                //        page.data.Add(arr);
                //    }
                //}
                //String json = Common.ObjectToJson(page);
                //Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion

        #region # 获取未关联记录信息 —— GetNotRelated()
        /// <summary> 获取未关联记录信息 </summary>
        public void GetGroupNotRelated()
        {
            try
            {

                int uId = 0;// 用户Id
                int ThemTypeId = Common.GetRequest("ThemTypeId").ToInt(); // 问题类型Id 

                DataTable tempGroupConsultation = MgrServices.GroupConsultationService.GetGroupConsultationTime(ThemTypeId, uId, Common.GetSessionValue("UserID", Context).ToInt());
                tempGroupConsultation.Columns.Add("StartTimeNew", typeof(string));
                foreach (DataRow dr in tempGroupConsultation.Rows)
                {
                    dr["StartTimeNew"] = Convert.ToDateTime(dr["StartTime"]).ToString("yyyy/MM/dd HH:mm");

                }
                String json = Common.ObjectToJson(tempGroupConsultation);
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
                string EnterpriseCode = "";
                if (Context.Session["EnterpriseCode"] != null)
                {
                    EnterpriseCode = Context.Session["EnterpriseCode"].ToString();
                }
                long result = Common.GetRequest("identity").ToInt();// 基本信息Id
                int UserID = 0;
                if (Context.Session["UserID"] != null)
                {
                    UserID = Convert.ToInt32(Context.Session["UserID"]);
                }
                if (result == 0)
                {
                    // 第一次为保存
                    GroupConsultationFileEntity GFile = new GroupConsultationFileEntity();
                    GFile._number = Common.GetRequest("number");
                    GFile._csname = Common.GetRequest("csname");
                    GFile._groupdescribe = Common.GetRequest("groupdescribe").ToString();//团体介绍
                    GFile._u_id = UserID;//咨询师
                    GFile._qtid = Common.GetRequest("QID").ToInt();
                    GFile._startdate = DateTime.Now;
                    //_summarytime = Common.GetRequest("phone"),
                    GFile._isdelete = 0;
                    GFile._users = "";
                    GFile._EnterpriseCode = EnterpriseCode;
                    result = MgrServices.GroupConsultationService.InsertGroupConsultationFile(GFile);


                }
                else
                {
                    GroupConsultationFileEntity GFile = new GroupConsultationFileEntity();
                    GFile._id = Convert.ToInt32(result);
                    GFile._number = Common.GetRequest("number");
                    GFile._csname = Common.GetRequest("csname");
                    GFile._groupdescribe = Common.GetRequest("groupdescribe").ToString();//团体介绍
                    GFile._u_id = UserID;//咨询师
                    GFile._qtid = Common.GetRequest("QID").ToInt();
                    GFile._startdate = DateTime.Now;
                    //_summarytime = Common.GetRequest("phone"),
                    GFile._isdelete = 0;
                    GFile._users = "";
                    GFile._EnterpriseCode = EnterpriseCode;
                    long results = MgrServices.GroupConsultationService.UpdateFile(GFile);
                    if (results <= 0)
                    {
                        result = results;
                    }

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
                GroupConsultationRecordEntity GroupEntity = new GroupConsultationRecordEntity();
                GroupEntity._ici_id = fileId;
                GroupEntity._content = records;//咨询记录
                bool result = MgrServices.GroupConsultationService.UpdateRecord(GroupEntity);//咨询记录
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
                bool result = false;
                int fileId = Common.GetRequest("identity").ToInt(); // 基本信息Id
                int IsEditId = Common.GetRequest("IsEditId").ToInt();
                int consultingEffect = Common.GetRequest("consultingEffect").ToInt(); // 咨询效果评估
                string content = Common.GetRequest("content"); // 总结内容
                string contents = Common.GetRequest("contents"); // 其他总结内容
                string Contentval = Common.GetRequest("Contentval");
                GroupConsultationSummaryEntity GroupSummary = new GroupConsultationSummaryEntity();
                GroupSummary._ici_id = fileId;
                GroupSummary._consultingeffect = consultingEffect;
                GroupSummary._content = content;
                GroupSummary._othercontent = contents;

                if (Contentval == "1")
                {
                    GroupSummary.summarytime = DateTime.Now;
                }
                result = MgrServices.GroupConsultationService.UpdateSummary(GroupSummary);
                //添加
                //if (IsEditId == 0)
                //{                  
                //    if (Contentval == "1")
                //    {
                //        GroupSummary.summarytime = DateTime.Now;                        
                //    }                    

                //    result = MgrServices.GroupConsultationService.InsertGroupConsultationSummary(GroupSummary);

                //}
                //else
                //{
                //    if (Contentval == "1")
                //    {
                //        GroupSummary.summarytime = DateTime.Now;
                //    }
                //    result = MgrServices.GroupConsultationService.UpdateSummary(GroupSummary);
                //    //更新
                //}
                String json = Common.ObjectToJson(result);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 获取团体档案信息 —— GetInfo()--查看
        /// <summary> 获取未关联记录信息 </summary>
        public void GetInfo()
        {
            try
            {
                string UTeahcers = Context.Session["loginName"].ToString();
                if (Context.Session["U_Name"] != null)
                {
                    UTeahcers = Context.Session["U_Name"].ToString();
                }



                int id = Common.GetRequest("identity").ToInt();// 用户Id 
                string isEdit = Common.GetRequest("isEdit");// 是否编辑
                DataRow tempDr;
                GroupFileModel GroupEntity = new GroupFileModel();
                DataSet ds = MgrServices.GroupConsultationService.GetGroupConsultationInfo(id);//根据团体档案的id查询详细信息
                if (ds != null)
                {
                    DataTable dt1 = ds.Tables[0];
                    DataTable dt2 = ds.Tables[1];
                    DataTable dt3 = ds.Tables[2];
                    if (dt1.Rows.Count > 0)
                    {
                        GroupEntity.Number = dt1.Rows[0]["Number"].ToString();
                        GroupEntity.ThemName = dt1.Rows[0]["CSName"].ToString();
                        GroupEntity.QuestionTypeId = dt1.Rows[0]["QTID"].ToString();
                        GroupEntity.GroupDescribe = dt1.Rows[0]["GroupDescribe"].ToString();
                        GroupEntity.Users = dt1.Rows[0]["Users"].ToString();
                        GroupEntity.QTName = dt1.Rows[0]["QTName"].ToString();
                        //GroupEntity.UTeahcers = UTeahcers;//咨询师姓名

                    }
                    if (dt2.Rows.Count > 0)
                    {
                        tempDr = dt2.Rows[0];
                        GroupEntity.Record = tempDr.ToModel<GroupConsultationRecordEntitys>();
                    }
                    if (dt3.Rows.Count > 0)
                    {
                        tempDr = dt3.Rows[0];
                        GroupEntity.Summary = tempDr.ToModel<GroupConsultationSummaryEntitys>();
                    }
                }
                String json = Common.ObjectToJson(GroupEntity);
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

                //问题类型Id
                int tempQtId = Common.GetRequest("id").ToInt();

                int tempCount = MgrServices.GroupConsultationService.DeleteGroupConsultation(tempQtId);

                String json = Common.ObjectToJson(tempCount);
                Context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        #region # 批量删除 —— BatchDelete()
        /// <summary> 删除 </summary>
        public void BatchDelete(HttpContext context)
        {
            try
            {
                int result = 0;
                // 获取请求Id
                string tempRequstQtid = Common.GetRequest("ids");
                string tempRequestQtName = Common.GetRequest("names");
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);

                string[] QT_Id = tempRequstQtid.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
                string[] QT_Name = tempRequestQtName.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

                for (int i = 0; i < QT_Id.Length; i++)
                {
                    CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                    model.RBTitle = "删除团体咨询档案-" + QT_Name[i]; //标题
                    model.RBModularID = 33; //对应模块权限ID
                    model.RBTableName = "GroupConsultationFile"; //删除的表名
                    model.RBFieldName = "Id"; //删除相对应字段的id
                    model.RBFieldValue = QT_Id[i].ToString(); //删除列名的id
                    model.RBDeleteFieldName = "IsDelete"; //表的删除字段一般 某某某_Delete
                    model.RBDeleteTime = DateTime.Now;
                    model.EnterpriseCode = enterpriseCode;

                    model.RBExcutePerson = Common.GetSessionValue("loginName", Context);
                    if (model.RBExcutePerson == null)
                    {
                        Context.Response.Write(result);
                        return;
                    }
                    result = MgrServices.RecycleBinService.PutDataInRecycleBin(model) == true ? 1 : 0;
                }
                Context.Response.Write(result);

                //// 去除最后一个‘，’
                //if (tempRequstQtid != "")
                //    tempRequstQtid = tempRequstQtid.Substring(0, tempRequstQtid.Length - 1);
                //if (tempRequestQtName != "")
                //    tempRequestQtName = tempRequestQtName.Substring(0, tempRequestQtName.Length - 1);

                // 执行
                //  int tempCount = MgrServices.GroupConsultationService.BatchDeleteGroupConsultation(tempRequstQtid);

                // String json = Common.ObjectToJson(tempCount);
                // Context.Response.Write(json);

            }
            catch (Exception)
            {

                throw;
            }
        }

        #endregion

        public class GroupFileModel
        {
            /// <summary> 个案号 </summary>    
            public string Number { get; set; }
            /// <summary> 咨询师主题 </summary>       
            public string ThemName { get; set; }
            /// <summary> 问题类型名称 </summary>
            public string GroupDescribe { get; set; }
            public string QuestionTypeId { get; set; }
            public string Users { get; set; }
            public string UTeahcers { get; set; }
            public string QTName { get; set; }

            public GroupConsultationRecordEntitys Record { get; set; }

            /// <summary> 个体咨询总结 </summary>           
            public GroupConsultationSummaryEntitys Summary { get; set; }
        }
        public class GroupConsultationRecordEntitys
        {
            public int ICI_Id { get; set; }
            public string Content { get; set; }
        }
        public class GroupConsultationSummaryEntitys
        {
            public int ICI_Id { get; set; }
            public string ConsultingEffect { get; set; }
            public string Content { get; set; }
            public string OtherContent { get; set; }
        }
    }
}