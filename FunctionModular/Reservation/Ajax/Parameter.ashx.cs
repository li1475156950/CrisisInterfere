using BR_Service;
using System;
using System.Data;
using System.Web;
using CrisisInterfere.ParameterService;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.Reservation.Ajax
{
    /// <summary>
    /// Parameter 的摘要说明
    /// </summary>
    public class Parameter : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //
            //1咨询方式；2咨询地点；3问题类型；4
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string type = Convert.ToString(context.Request["Type"]);
            switch (type)
            {
                case "Way":
                    WayCelect(context);
                    break;
                case "Place":
                    PlacePlace(context);
                    break;
                case "Problem":
                    Problem(context);
                    break;
                case "select":
                    Select(context);
                    break;
                case "update":
                    updateParameter(context);
                    break;
                case "delete":
                    deleteParameter(context);
                    break;
                case "Insert":
                    InsertParameter(context);
                    break;
            }

        }

        public void WayCelect(HttpContext context)
        {
            try
            {
                int Starindex = Convert.ToInt32(context.Request["Starindex"]);
                int Endindex = Convert.ToInt32(context.Request["Endindex"]);
                DataTable dt = new DataTable();
                PageInfo page = new PageInfo();
                DataSet ds = MgrServices.ParameterService.WayJson(Starindex, Endindex);
                page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                dt = ds.Tables[1];
                if (ds != null && ds.Tables.Count > 0)
                {
                    foreach (DataRow item in dt.Rows)
                    {
                        string[] arr =
                         {                   
                         item["ParameterID"].ToString(),//ID
                         item["ParameterName"].ToString(),//方式
                         item["descr"].ToString(),//描述
                         "",
                         };
                        page.data.Add(arr);
                    }
                    page.recordsFiltered = page.recordsTotal;
                    string json = Common.ObjectToJson(page);
                    context.Response.Write(json);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public void PlacePlace(HttpContext context)
        {
            try
            {
                int Starindex = Convert.ToInt32(context.Request["Starindex"]);
                int Endindex = Convert.ToInt32(context.Request["Endindex"]);
                DataTable dt = new DataTable();
                PageInfo page = new PageInfo();
                DataSet ds = MgrServices.ParameterService.PlaceJson(Starindex, Endindex);
                page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                dt = ds.Tables[1];
                if (ds != null && ds.Tables.Count > 0)
                {
                    foreach (DataRow item in dt.Rows)
                    {
                        string[] arr =
                         {
                         item["ParameterID"].ToString(),//ID
                         item["ParameterName"].ToString(),//方式
                         item["descr"].ToString(),//描述
                        "",
                         };
                        page.data.Add(arr);
                    }
                    page.recordsFiltered = page.recordsTotal;
                    string json = Common.ObjectToJson(page);
                    context.Response.Write(json);
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void Problem(HttpContext context)
        {

            try
            {
                int Starindex = Convert.ToInt32(context.Request["Starindex"]);
                int Endindex = Convert.ToInt32(context.Request["Endindex"]);
                DataTable dt = new DataTable();
                PageInfo page = new PageInfo();
                DataSet ds = MgrServices.ParameterService.ProblemJson(Starindex, Endindex);
                page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                dt = ds.Tables[1];
                if (ds != null && ds.Tables.Count > 0)
                {
                    foreach (DataRow item in dt.Rows)
                    {
                        string[] arr =
                         {
                         item["ParameterID"].ToString(),//ID
                         item["ParameterName"].ToString(),//方式
                         item["descr"].ToString(),//描述
                         "",
                         };
                        page.data.Add(arr);
                    }
                    page.recordsFiltered = page.recordsTotal;
                    string json = Common.ObjectToJson(page);
                    context.Response.Write(json);
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void Select(HttpContext context)
        {
            int ParameterID = Convert.ToInt32(context.Request["ParameterID"]);

            ParameterService.ParameterEntity pe = MgrServices.ParameterService.ParameterSelect(ParameterID);
            string json = Common.ObjectToJson(pe);
            context.Response.Write(json);
        }
        public void updateParameter(HttpContext context)
        {
            int ParameterID =Convert.ToInt32(context.Request["ParameterID"]);
            string ParameterName = context.Request["ParameterName"];
            string descrs = context.Request["descr"];
            int ParameterType =Convert.ToInt32(context.Request["ParameterType"]);
            ParameterEntity pe = new ParameterEntity();
            pe._parameterid = ParameterID;
            pe._parametername = ParameterName;
            pe._descr = descrs;
            pe._parametertype = ParameterType;
            bool result =MgrServices.ParameterService.ParameterUpdata(pe);
            context.Response.Write(result);
        }

        public void deleteParameter(HttpContext context)
        {
            int ParameterID = Convert.ToInt32(context.Request["ParameterID"]);
            bool result = MgrServices.ParameterService.Parameterdelete(ParameterID);
            context.Response.Write(result);
        }

        public void InsertParameter(HttpContext context)
        {
            string ParameterName =context.Request["ParameterName"];
            string descr = context.Request["descr"];
            int ParameterType = Convert.ToInt32(context.Request["ParameterType"]);
            int P_Delete =Convert.ToInt32("0");
            ParameterEntity pe = new ParameterEntity();
            pe._parametername = ParameterName;
            pe._descr = descr;
            pe._parametertype = ParameterType;
            pe._p_delete = P_Delete;
            bool result = MgrServices.ParameterService.ParameterInsert(pe);
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