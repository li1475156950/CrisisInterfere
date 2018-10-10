using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Reflection;
using System.Data;
using CrisisInterfere.AppointmentConsultService;
namespace CrisisInterfere.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// HeartConsult 的摘要说明
    /// </summary>
    public class AppointmentConsult : IHttpHandler, IRequiresSessionState
    {
        List<string> startDate;
        List<string> endDate;
        List<string> startHourAndMinutes;
        List<string> endHourAndMinutes;

        public void ProcessRequest(HttpContext context)
        {
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "AddDistributeWork":
                    AddDistributeWork(context);
                    break;
                case "AddConsultSubject":
                    AddConsultSubject(context);
                    break;
                case "GetConsultSubject":
                    GetConsultSubject(context);
                    break;
                case "GetDistributeWork":
                    GetDistributeWork(context);
                    break;
                case "GetConsultWay":
                    GetConsultWay(context);
                    break;
                case "GetConsultSubjectInfo":
                    GetConsultSubjectInfo(context);
                    break;
                case "GetAllCounselorInfo":
                    GetAllCounselorInfo(context);
                    break;
                case "GetQuestionType":
                    GetQuestionType(context);
                    break;
                case "UpdateDistributeWork":
                    UpdateDistributeWork(context);
                    break;
                case "DeleteAppointmentInfo":
                    DeleteAppointmentInfo(context);
                    break;
                case "GetUserRoleTypeAndUserID":
                    GetUserRoleTypeAndUserID(context);
                    break;
                case "UserApplyAppointment":
                    UserApplyAppointment(context);
                    break;
                case "GetUserInfo":
                    GetUserInfo(context);
                    break;
                case "DeleteAppointment":
                    DeleteAppointment(context);
                    break;
                case "GetCurrentUserID":
                    GetCurrentUserID(context);
                    break;
                case "AddConsultResultComment":
                    AddConsultResultComment(context);
                    break;
                case "JudgeLoginName":
                    JudgeLoginName(context);
                    break;
                case "CounAppointment":
                    CounAppointment(context);
                    break;
                case "IsAppointment":
                    IsAppointment(context);
                    break;
                case "GetApplyPerson":
                    GetApplyPerson(context);
                    break;
                case "JudgeSubjectRepeat":
                    JudgeSubjectRepeat(context);
                    break;
                case "CancelAppointment":
                    CancelAppointment(context);
                    break;
                case "JudgeAppointmentIsComment":
                    JudgeAppointmentIsComment(context);
                    break;
                case "GetCurrentLoginName":
                    GetCurrentLoginName(context);
                    break;
                case "GetAppointmentIsComment":
                    GetAppointmentIsComment(context);
                    break;
                case "DeleteSubject":
                    DeleteSubject(context);
                    break;
                case "GetRemainingQuota":
                    GetRemainingQuota(context);
                    break;
                case "JudgeIsAppointment":
                    JudgeIsAppointment(context);
                    break;
                case "GetUserRoleTypeByUserID":
                    GetUserRoleTypeByUserID(context);
                    break;
                default:
                    break;
            }
        }
        /// <summary>
        /// 日期判重方法
        /// </summary>
        /// <param name="modelList"></param>
        /// <param name="model"></param>
        /// <returns></returns>
        public bool JudgeDateRepeat(List<DistributeWorkViewModel> modelList, DistributeWorkModel model)
        {
            var count = modelList.Count;
            var isAdd = true;
            var isContainWeek = false;
            string[] newWeekArray = model.DWDistributeWeek.Split(',');
            var newWeekArrayLength = newWeekArray.Length;
            for (int i = 0; i < count; i++)
            {
                isContainWeek = false;
                string[] beforeWeekArray = modelList[i].DistributeWeek.Split(',');
                if (model.DWEndDate < Convert.ToDateTime(modelList[i].StartDate) || model.DWStartDate > Convert.ToDateTime(modelList[i].EndDate))
                {

                    continue;
                }
                for (int j = 0; j < newWeekArrayLength; j++)
                {
                    if (beforeWeekArray.Contains(newWeekArray[j]))
                    {
                        isContainWeek = true;
                        break;
                    }
                }
                if (!isContainWeek)
                {
                    continue;
                }
                if (!(Convert.ToDateTime(model.DWEndHourAndMinutes) <= Convert.ToDateTime(modelList[i].StartHourAndMinutes) || Convert.ToDateTime(model.DWStartHourAndMinutes) >= Convert.ToDateTime(modelList[i].EndHourAndMinutes)))
                {
                    if (startDate == null)
                    {
                        startDate = new List<string>();
                        endDate = new List<string>();
                        startHourAndMinutes = new List<string>();
                        endHourAndMinutes = new List<string>();
                    }
                    if (model.DWStartDate == model.DWEndDate&&model.DWStartDate==Convert.ToDateTime(modelList[i].StartDate))
                    {
                        if (startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count == 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count == 0) 
                        {
                            startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                            endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                            startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                            endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                        }
                        if(startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count > 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count > 0&& startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                        {
                            startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                            endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                            startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                            endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                        }

                    }
                    if (model.DWStartDate == model.DWEndDate && model.DWEndDate == Convert.ToDateTime(modelList[i].EndDate))
                    {
                        if (startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count == 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count == 0)
                        {
                            startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                            endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                            startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                            endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                        }
                        if (startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count > 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                        {
                            startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                            endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                            startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                            endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                        }
                    }
                    if (model.DWStartDate != model.DWEndDate&&modelList[i].StartDate == modelList[i].EndDate)
                    {
                        if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count == 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count == 0)
                        {
                            startDate.Add(modelList[i].StartDate);
                            endDate.Add(modelList[i].EndDate);
                            startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                            endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                        }
                        if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count > 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                        {
                            startDate.Add(modelList[i].StartDate);
                            endDate.Add(modelList[i].EndDate);
                            startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                            endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                        }

                        
                    }
                        if (model.DWStartDate > Convert.ToDateTime(modelList[i].StartDate) && model.DWEndDate < Convert.ToDateTime(modelList[i].EndDate))
                        {
                            if (startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count == 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count == 0)
                            {
                                startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                                endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            if (startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count > 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                            {
                                startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                                endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            
                        }
                        if (model.DWStartDate < Convert.ToDateTime(modelList[i].StartDate) && model.DWEndDate == Convert.ToDateTime(modelList[i].StartDate))
                        {
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count == 0 && endDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count == 0)
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(modelList[i].StartDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count > 0 && endDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(modelList[i].StartDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            
                        }
                        if (model.DWStartDate == Convert.ToDateTime(modelList[i].EndDate) && model.DWEndDate > Convert.ToDateTime(modelList[i].EndDate))
                        {
                            if (startDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count == 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count == 0 )
                            {
                                startDate.Add(modelList[i].EndDate);
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            if (startDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count > 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                            {
                                startDate.Add(modelList[i].EndDate);
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            
                        }
                        if (model.DWStartDate < Convert.ToDateTime(modelList[i].StartDate) && model.DWEndDate > Convert.ToDateTime(modelList[i].EndDate))
                        {
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count == 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count == 0 )
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count > 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                        }
                        if (model.DWStartDate < Convert.ToDateTime(modelList[i].StartDate) && model.DWEndDate > Convert.ToDateTime(modelList[i].StartDate) && model.DWEndDate < Convert.ToDateTime(modelList[i].EndDate))
                        {
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count == 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count == 0 )
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count > 0 && endDate.Where(m => m.ToString() == model.DWEndDate.ToString("yyyy-MM-dd")).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(model.DWEndDate.ToString("yyyy-MM-dd"));
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            
                        }
                        if (model.DWStartDate > Convert.ToDateTime(modelList[i].StartDate) && model.DWEndDate > Convert.ToDateTime(modelList[i].EndDate) && model.DWStartDate < Convert.ToDateTime(modelList[i].EndDate))
                        {
                            if (startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count == 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count == 0 )
                            {
                                startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            if (startDate.Where(m => m.ToString() == model.DWStartDate.ToString("yyyy-MM-dd")).ToList().Count > 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                            {
                                startDate.Add(model.DWStartDate.ToString("yyyy-MM-dd"));
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            
                        }
                        if (model.DWStartDate <= Convert.ToDateTime(modelList[i].StartDate) && model.DWEndDate >= Convert.ToDateTime(modelList[i].EndDate))
                        {
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count == 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count == 0 )
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            if (startDate.Where(m => m.ToString() == modelList[i].StartDate).ToList().Count > 0 && endDate.Where(m => m.ToString() == modelList[i].EndDate).ToList().Count > 0 && startHourAndMinutes.Where(m => m.ToString() == modelList[i].StartHourAndMinutes).ToList().Count == 0 && endHourAndMinutes.Where(m => m.ToString() == model.DWEndHourAndMinutes).ToList().Count == 0)
                            {
                                startDate.Add(modelList[i].StartDate);
                                endDate.Add(modelList[i].EndDate);
                                startHourAndMinutes.Add(modelList[i].StartHourAndMinutes);
                                endHourAndMinutes.Add(modelList[i].EndHourAndMinutes);
                            }
                            
                        }
                    
                    isAdd = false;
                }

            }
            return isAdd;
        }

        /// <summary>
        /// 添加预约方法
        /// </summary>
        /// <param name="context"></param>
        public void AddDistributeWork(HttpContext context)
        {
            var distriModel = JsonConvert.DeserializeObject<DistributeWorkModel>(Common.GetRequest("distributeWorkJson"));
            var userRoleType = Convert.ToInt32(Common.GetRequest("userRoleType"));
            var distriWorkBefore = MgrServices.AppointmentConsultService.GetDistributeWorkByUid(userRoleType, distriModel.DWConsultTeacher).ToList();
            var distriWorkLength = distriWorkBefore.Count;
            if (JudgeDateRepeat(distriWorkBefore, distriModel))
            {
                distriModel.DWCreatePerson = Convert.ToInt32(context.Session["UserID"]);
                distriModel.DWCreateTime = DateTime.Now;
                if (MgrServices.AppointmentConsultService.AddDistributeWork(distriModel) > 0)
                {
                    context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = "添加成功" }));
                    context.Response.End();
                }

            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = false, StartDate = startDate, EndDate = endDate, StartHourAndMinutes = startHourAndMinutes, EndHourAndMinutes = endHourAndMinutes }));


        }
        /// <summary>
        /// 得到左侧咨询师列表信息
        /// </summary>
        /// <param name="context"></param>
        public void GetAllCounselorInfo(HttpContext context)
        {
            var enterpriseCode = context.Session["EnterpriseCode"].ToString();
            var counselorList = MgrServices.AppointmentConsultService.GetAllCounselorByEnterpriseCode(enterpriseCode);
            context.Response.Write(JsonConvert.SerializeObject(counselorList));
        }
        /// <summary>
        /// 得到排班信息方法
        /// </summary>
        /// <param name="context"></param>
        public void GetDistributeWork(HttpContext context)
        {
            var uid = Convert.ToInt32(Common.GetRequest("uid"));
            var userRoleType = Convert.ToInt32(Common.GetRequest("userRoleType"));
            var userID = Convert.ToInt32(context.Session["UserID"]);
            var distriWorkList = MgrServices.AppointmentConsultService.GetDistributeWorkByUid(userRoleType, uid);
            var tempDistriWorkList = distriWorkList;
            for (int i = 0; i <tempDistriWorkList.Count-1; i++)
            {
                var tempList = distriWorkList.Where(m => m.DistributeWorkID == tempDistriWorkList[i].DistributeWorkID).ToList();
                var tempCount = tempList.Count;
                var currentDistributeWork = tempList.Where(m => m.ApplyUserID == userID).ToList();
                if (tempCount > 1 && currentDistributeWork.Count > 0)
                {
                    i = 0;
                    for (int j = 0; j < tempCount; j++)
                    {
                        distriWorkList.Remove(tempList[j]);
                    }
                    distriWorkList.Add(currentDistributeWork[0]);
                }
                if (tempCount > 1 && currentDistributeWork.Count == 0)
                {
                    for (int j = 1; j < tempCount; j++)
                    {
                        distriWorkList.Remove(tempList[j]);
                    }
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(distriWorkList));
        }
        /// <summary>
        /// 获取所有咨询方式方法
        /// </summary>
        /// <param name="context"></param>
        public void GetConsultWay(HttpContext context)
        {
            var consWayList = MgrServices.AppointmentConsultService.GetConsultWay();
            context.Response.Write(JsonConvert.SerializeObject(consWayList));

        }
        /// <summary>
        /// 获取咨询主题方法
        /// </summary>
        /// <param name="context"></param>
        public void GetConsultSubject(HttpContext context)
        {
            var enterpriseCode = context.Session["EnterpriseCode"].ToString();
            var list = MgrServices.AppointmentConsultService.GetConsultSubjectByEnterpriseCode(enterpriseCode);
            context.Response.Write(JsonConvert.SerializeObject(list));
        }
        /// <summary>
        /// 获取咨询主题详细信息方法
        /// </summary>
        /// <param name="context"></param>
        public void GetConsultSubjectInfo(HttpContext context)
        {
            var consultSubjectID = Convert.ToInt32(Common.GetRequest("consultSubjectID"));
            var consultSubjectInfo = MgrServices.AppointmentConsultService.GetConsultSubjectByID(consultSubjectID);
            context.Response.Write(JsonConvert.SerializeObject(consultSubjectInfo));
        }
        /// <summary>
        /// 添加咨询主题方法
        /// </summary>
        /// <param name="context"></param>
        public void AddConsultSubject(HttpContext context)
        {
            var consultSubjectJson = Common.GetRequest("subjectJson");
            var consultSubjectEntity = JsonConvert.DeserializeObject<ConsultSubjectModel>(consultSubjectJson);
            consultSubjectEntity.CSCreatePerson = Convert.ToInt32(context.Session["UserID"]);
            consultSubjectEntity.CSCreateTime = DateTime.Now;
            consultSubjectEntity.EnterpriseCode = context.Session["EnterpriseCode"].ToString();
            var result = MgrServices.AppointmentConsultService.AddConsultSubject(consultSubjectEntity);
            if (result > 0)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = result }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "因为添加主题失败,导致预约信息无法继续添加，请重试" }));

        }
        /// <summary>
        /// 得到问题类型方法
        /// </summary>
        /// <param name="context"></param>
        public void GetQuestionType(HttpContext context)
        {
            var enterpriseCode = context.Session["EnterpriseCode"].ToString();
            var questionTypeList = MgrServices.AppointmentConsultService.GetQuestionType(enterpriseCode);
            context.Response.Write(JsonConvert.SerializeObject(questionTypeList));
        }
        /// <summary>
        /// 更新排班信息方法
        /// </summary>
        /// <param name="context"></param>
        public void UpdateDistributeWork(HttpContext context)
        {
            var distriModelList = JsonConvert.DeserializeObject<List<DistributeWorkModel>>(Common.GetRequest("distributeWorkJson"));
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var count = distriModelList.Count;
            Type temp = typeof(DistributeWorkModel);
            PropertyInfo[] propertyArray = temp.GetProperties();
            DataTable dt = new DataTable();
            dt.TableName = "DistributeWork";
            dt.Columns.Add("DWID", typeof(Int32));
            dt.Columns.Add("CWID", typeof(Int32));
            dt.Columns.Add("CSID", typeof(Int32));
            dt.Columns.Add("QTID", typeof(Int32));
            dt.Columns.Add("DWServiceUserAmount", typeof(Int32));
            dt.Columns.Add("DWStartDate", typeof(DateTime));
            dt.Columns.Add("DWEndDate", typeof(DateTime));
            dt.Columns.Add("DWDistributeWeek", typeof(string));
            dt.Columns.Add("DWStartHourAndMinutes", typeof(string));
            dt.Columns.Add("DWEndHourAndMinutes", typeof(string));
            dt.Columns.Add("DWMoveUpAppTime", typeof(Int32));
            dt.Columns.Add("DWConsultPlace", typeof(string));
            dt.Columns.Add("DWConsultTeacher", typeof(Int32));
            dt.Columns.Add("DWCreatePerson", typeof(Int32));
            dt.Columns.Add("DWCreateTime", typeof(DateTime));
            dt.Columns.Add("IsDelete", typeof(Int32));
            for (int i = 0; i < count; i++)
            {
                DistributeWorkModel model = distriModelList[i];
                model.DWCreateTime = DateTime.Now;
                DataRow dr = dt.NewRow();
                if (distriModelList.Count == 1)
                {
                    dr["DWID"] = distriID;
                }
                foreach (var item in propertyArray)
                {
                    if (item.Name != "ExtensionData" && item.Name != "DWID")
                    {
                        dr[item.Name] = Common.GetObjectPropertyValue<DistributeWorkModel>(model, item.Name);
                    }

                }
                dt.Rows.Add(dr);
            }
            var result = MgrServices.AppointmentConsultService.UpdateAppointmentInfo(dt, distriID);
            if (result)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = "修改成功" }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "修改失败" }));
        }
        public void DeleteAppointmentInfo(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var result = MgrServices.AppointmentConsultService.DeleteDistributeWorkByID(distriID);
            if (result > 0)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = "修改成功" }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "修改失败" }));
        }
        /// <summary>
        /// 获取用户类型
        /// </summary>
        /// <param name="context"></param>
        public void GetUserRoleTypeAndUserID(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"]);
            var userRoleType = MgrServices.UserAddService.GetUserRoleType(userID);
            context.Response.Write(JsonConvert.SerializeObject(new { UserRoleType = userRoleType, UserID = userID }));
        }
        public void GetUserRoleTypeByUserID(HttpContext context)
        {
            var userID = Convert.ToInt32(Common.GetRequest("UserID"));
            var userRoleType = MgrServices.UserAddService.GetUserRoleType(userID);
            context.Response.Write(JsonConvert.SerializeObject(new { UserRoleType = userRoleType, UserID = userID }));
        }
        /// <summary>
        /// 添加用户预约
        /// </summary>
        /// <param name="context"></param>
        public void UserApplyAppointment(HttpContext context)
        {
            var date = Common.GetRequest("date");
            var time = Common.GetRequest("time");
            var counselorID = Convert.ToInt32(Common.GetRequest("counselorID"));
            var distriID = Convert.ToInt32(MgrServices.AppointmentConsultService.GetDistriID(date, time, counselorID));
            var userID = Convert.ToInt32(context.Session["UserID"]);
            var questionTypeID = Convert.ToInt32(Common.GetRequest("questionTypeID"));
            var tel = Common.GetRequest("appTel");
            var questionDescribe = Common.GetRequest("questionDescribe");
            var userRoleTypeID = Convert.ToInt32(Common.GetRequest("userRoleTypeID"));
            AppointmentModel model = new AppointmentModel()
            {
                ASID = 2,
                CreateTime = DateTime.Now,
                DWID = distriID,
                IsDelete = 0,
                QuestionDescribe = questionDescribe,
                RefuseReason = "",
                UserID = userID
            };
            var result = MgrServices.AppointmentConsultService.UserApplyAppointment(model, tel, questionTypeID, userRoleTypeID);
            context.Response.Write(JsonConvert.SerializeObject(new { State = result, Data = "" }));
        }
        /// <summary>
        /// 得到用户信息
        /// </summary>
        /// <param name="context"></param>
        public void GetUserInfo(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"]);
            var userEntity = MgrServices.UserAddService.GetEntitys(userID);
            context.Response.Write(JsonConvert.SerializeObject(new { UserName = userEntity._u_name, LoginName = userEntity._u_loginname, Sex = userEntity._u_sex }));
        }
        /// <summary>
        /// 取消预约的方法
        /// </summary>
        public void DeleteAppointment(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var userID = Convert.ToInt32(context.Session["UserID"]);
            var result = MgrServices.AppointmentConsultService.DeleteAppointment(distriID, userID);
            context.Response.Write(JsonConvert.SerializeObject(new { State = result, Data = "" }));
        }
        /// <summary>
        /// 得到当前用户ID
        /// </summary>
        /// <param name="context"></param>
        public void GetCurrentUserID(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"]);
            context.Response.Write(userID);
        }
        /// <summary>
        /// 添加评价方法
        /// </summary>
        /// <param name="context"></param>
        public void AddConsultResultComment(HttpContext context)
        {
            var level = Convert.ToInt32(Common.GetRequest("level"));
            var appID = Convert.ToInt32(Common.GetRequest("appID"));
            var result = MgrServices.AppointmentConsultService.AddConsultResultComment(appID, level);
            context.Response.Write(JsonConvert.SerializeObject(new { State = result }));
        }
        /// <summary>
        /// 判断登录名是否存在方法
        /// </summary>
        /// <param name="context"></param>
        public void JudgeLoginName(HttpContext context)
        {
            var loginName = Common.GetRequest("loginName");
            var enterpriseCode = context.Session["EnterpriseCode"].ToString();
            var result = MgrServices.UserAddService.CheckUserIsExist(loginName, enterpriseCode);
            if (result > 0)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = "" }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "" }));
        }
        /// <summary>
        /// 主动预约方法
        /// </summary>
        /// <param name="context"></param>
        public void CounAppointment(HttpContext context)
        {
            var date = Common.GetRequest("date");
            var time = Common.GetRequest("time");
            var counselorID = Convert.ToInt32(Common.GetRequest("counselorID"));
            var loginName = Common.GetRequest("loginName");
            var enterpriseCode = context.Session["EnterpriseCode"].ToString();
            var distriID = Convert.ToInt32(MgrServices.AppointmentConsultService.GetDistriID(date, time, counselorID));
            var userID = MgrServices.UserAddService.GetEntityInfo(loginName, enterpriseCode)._u_id;
            //var tel = MgrServices.UserAddService.GetEntityInfo(loginName, enterpriseCode)._u_tel;
            var questionDescribe = Common.GetRequest("questionDescribe");
            var questionTypeID = Convert.ToInt32(Common.GetRequest("questionTypeID"));
            var userRoleTypeID = Convert.ToInt32(Common.GetRequest("userRoleTypeID"));
            AppointmentModel model = new AppointmentModel()
            {
                ASID = 3,
                CreateTime = DateTime.Now,
                DWID = distriID,
                IsDelete = 0,
                QuestionDescribe = questionDescribe,
                RefuseReason = "",
                UserID = userID
            };
            var result = MgrServices.AppointmentConsultService.UserApplyAppointment(model, "", questionTypeID, userRoleTypeID);
            var userList = MgrServices.AppointmentConsultService.RefuseAndReturnDistriID(distriID);
            context.Response.Write(JsonConvert.SerializeObject(new { State = result, Data = userList }));
        }
        /// <summary>
        /// 是否预约方法
        /// </summary>
        /// <param name="context"></param>
        public void IsAppointment(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"].ToString());
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var result = MgrServices.AppointmentConsultService.IsAppointment(distriID, userID);
            context.Response.Write(result);
        }
        /// <summary>
        /// 得到申请人
        /// </summary>
        /// <param name="context"></param>
        public void GetApplyPerson(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var result = MgrServices.AppointmentConsultService.GetApplyPerson(distriID);
            context.Response.Write(result);
        }
        /// <summary>
        /// 判断主题重复
        /// </summary>
        /// <param name="context"></param>
        public void JudgeSubjectRepeat(HttpContext context)
        {
            var subjectName = Common.GetRequest("subjectName");
            var enterpriseCode = context.Session["EnterpriseCode"].ToString();
            var result = MgrServices.AppointmentConsultService.JudgeSubjectRepeat(subjectName, enterpriseCode);
            context.Response.Write(result);
        }
        /// <summary>
        /// 取消预约
        /// </summary>
        /// <param name="context"></param>
        public void CancelAppointment(HttpContext context)
        {
            var distributeWorkID = Convert.ToInt32(Common.GetRequest("distributeWorkID"));
            var appointmentID = Convert.ToInt32(Common.GetRequest("appointmentID"));
            var result = MgrServices.AppointmentConsultService.CancelAppointment(distributeWorkID, appointmentID);
            context.Response.Write(JsonConvert.SerializeObject(new { State = result, Data = "" }));
        }
        public void JudgeAppointmentIsComment(HttpContext context)
        {
            var distributeWorkID = Convert.ToInt32(Common.GetRequest("distributeWorkID"));
            var appointmentID = Convert.ToInt32(Common.GetRequest("appointmentID"));
            var result = MgrServices.AppointmentConsultService.JudgeAppointmentIsComment(distributeWorkID, appointmentID);
            context.Response.Write(result);
        }
        public void GetCurrentLoginName(HttpContext context)
        {
            var loginName = context.Session["loginName"].ToString();
            context.Response.Write(loginName);
        }
        public void GetAppointmentIsComment(HttpContext context)
        {
            var userID = Convert.ToInt32(Common.GetRequest("userID"));
            var questionTypeID = Convert.ToInt32(Common.GetRequest("questionTypeID"));
            var counselorID = Convert.ToInt32(Common.GetRequest("counselorID"));
            var result = MgrServices.AppointmentConsultService.GetAppointmentIsComment(userID, questionTypeID, counselorID);
            context.Response.Write(result);
        }
        public void DeleteSubject(HttpContext context)
        {
            var subjectID = Convert.ToInt32(Common.GetRequest("subjectID"));
            var result = MgrServices.AppointmentConsultService.DeleteSubject(subjectID);
            context.Response.Write(result);
        }
        public void GetRemainingQuota(HttpContext context)
        {
            var distributeWorkID = Convert.ToInt32(Common.GetRequest("distributeWorkID"));
            var result = MgrServices.AppointmentConsultService.GetAppointmentPeopleCount(distributeWorkID);
            context.Response.Write(result);
        }
        public void JudgeIsAppointment(HttpContext context)
        {
            var userID = Convert.ToInt32(context.Session["UserID"]);
            var distributeWorkID = Convert.ToInt32(Common.GetRequest("distributeWorkID"));
            var result = MgrServices.AppointmentConsultService.JudgeIsAppointment(distributeWorkID,userID);
            context.Response.Write(result);
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