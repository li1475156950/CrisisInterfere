using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.AppointmentConsult.Ajax
{
    /// <summary>
    /// DisposeAppointment 的摘要说明
    /// </summary>
    public class DisposeAppointment : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "LoadAppointment":
                    LoadAppointment(context);
                    break;
                case "GetAppointmentInfo":
                    GetAppointmentInfo(context);
                    break;
                case "AcceptApply":
                    AcceptApply(context);
                    break;
                case "RefuseApply":
                    RefuseApply(context);
                    break;
                case "GetAppointmentHeaderInfo":
                    GetAppointmentHeaderInfo(context);
                    break;
                case "GetAwaitStateAppointment":
                    GetAwaitStateAppointment(context);
                    break;
                case "GetServiceUserCount":
                    GetServiceUserCount(context);
                    break;
                default:
                    break;
            }
        }
        public void LoadAppointment(HttpContext context)
        {
            var startPageIndex = Convert.ToInt32(Common.GetRequest("startPageIndex"));
            var endPageIndex = Convert.ToInt32(Common.GetRequest("endPageIndex"));
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            PageInfo page = new PageInfo();
            DataSet SourceTemps = new DataSet();
            SourceTemps = MgrServices.AppointmentConsultService.GetAppointment(startPageIndex, endPageIndex, distriID);
            DataTable SourceTemp = new DataTable();
            if (SourceTemps != null && SourceTemps.Tables.Count > 0)
            {
                page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                SourceTemp = SourceTemps.Tables[1];
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        String[] arr =
                            {   
                                "<input type='checkbox' class='childCheck' data-appID = '"+DTR["APPID"]+"' data-userID='"+DTR["UserID"]+"'/>",
                                DTR["PageIndex"].ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["U_Sex"].ToString(),
                                DTR["D_name"].ToString(),
                                DTR["QTName"].ToString(),
                                "",//操作
                                DTR["ASName"].ToString()
                            };
                        page.data.Add(arr);

                    }

                }
            }
            page.recordsFiltered = page.recordsTotal;
            String json = Common.ObjectToJson(page);
            context.Response.Write(json);
        }
        public void GetAppointmentInfo(HttpContext context)
        {
            var appID = Convert.ToInt32(Common.GetRequest("appID"));
            var model = MgrServices.AppointmentConsultService.GetAppointmentInfo(appID);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void AcceptApply(HttpContext context)
        {
            var appIDArray = Common.GetRequest("appID").Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var peopleCount = MgrServices.AppointmentConsultService.GetAppointmentPeopleCount(distriID);
            var serviceUserCount = MgrServices.AppointmentConsultService.GetExpectationServicePeopleCount(distriID);
            var length = appIDArray.Length;
            var throughtCreditPeopleCount = 0;
            var result = 0;
            var isSuccess = true;
            if (length > peopleCount&&peopleCount!=0&&serviceUserCount!=0)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "选择人数超过剩余名额" }));
                context.Response.End();
            }
            for (int i = 0; i < length; i++)
            {
                result = MgrServices.AppointmentConsultService.AcceptApply(distriID,Convert.ToInt32(appIDArray[i]));
                if (result > 0)
                {
                    throughtCreditPeopleCount = MgrServices.AppointmentConsultService.GetThroughtCreditPeopleCount(distriID);
                }
                else
                {
                    isSuccess = false;
                    break;
                }
            }
            if (isSuccess)
            {


                context.Response.Write(JsonConvert.SerializeObject(new { State = true, Data = serviceUserCount-throughtCreditPeopleCount, ServiceUserCount = serviceUserCount }));

            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = false, Data = "未知原因引发的错误，可能只成功了部分人的请求，请刷新页面后再处理" }));
            }


        }
        public void RefuseApply(HttpContext context)
        {
            var appID = Convert.ToInt32(Common.GetRequest("appID"));
            var refuseReason = Common.GetRequest("refuseReason");
            var result = MgrServices.AppointmentConsultService.RefuseApply(appID, refuseReason);
            if (result > 0)
            {
                context.Response.Write(JsonConvert.SerializeObject(new { State = true }));
                context.Response.End();
            }
            context.Response.Write(JsonConvert.SerializeObject(new { State = false }));
        }
        public void GetAppointmentHeaderInfo(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var model = MgrServices.AppointmentConsultService.GetAppointmentHeaderInfo(distriID);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetAwaitStateAppointment(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var tempList = MgrServices.AppointmentConsultService.GetAwaitStateAppointment(distriID);
            context.Response.Write(JsonConvert.SerializeObject(tempList));
        }
        public void GetServiceUserCount(HttpContext context)
        {
            var distriID = Convert.ToInt32(Common.GetRequest("distriID"));
            var serviceUserCount = MgrServices.AppointmentConsultService.GetExpectationServicePeopleCount(distriID);
            context.Response.Write(serviceUserCount);
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