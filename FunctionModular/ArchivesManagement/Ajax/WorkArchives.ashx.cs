using BR_Service;
using CrisisInterfere.WorkArchivesService;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.ArchivesManagement.Ajax
{
    /// <summary>
    /// WorkArchives 的摘要说明
    /// </summary>
    public class WorkArchives : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var operationType = Common.GetRequest("operationType");
            System.Reflection.MethodInfo methodInfo = this.GetType().GetMethod(operationType);
            if (methodInfo != null)
            {
                methodInfo.Invoke(this, new object[] { context });
            }
        }
        public void GetPotentialRiskWarningPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetPotentialRiskWarningPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetIdioctoniaWarningPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetIdioctoniaWarningPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetDiscernEstimateWarningPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetDiscernEstimateWarningPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetDynamicEstimateWarningPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetDynamicEstimateWarningPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetCounselorWorkStatisticsByDepartmentID(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetCounselorWorkStatisticsByDepartmentID(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetQuestionTypeConsultPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetQuestionTypeConsultPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetQuestionTypeSeriousLevelPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetQuestionTypeSeriousLevelPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetSeriousLevelPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetSeriousLevelPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetDisposalDistributionPeopleCount(HttpContext context)
        {
            var searchModel = JsonConvert.DeserializeObject<WorkArchivesSearchModel>(Common.GetRequest("searchModel"));
            var model = MgrServices.WorkArchivesService.GetDisposalDistributionPeopleCount(searchModel);
            context.Response.Write(JsonConvert.SerializeObject(model));
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