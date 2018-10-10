using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using BR_Service;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.LoginAndRegister.Ajax
{
    /// <summary>
    /// Test 的摘要说明
    /// </summary>
    public class Test : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case"GetAmountDimensionTree":
                    GetAmountDimensionTree(context);
                    break;
                default:
                    break;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
        public void GetAmountDimensionTree(HttpContext context)
        {
            //DataSet dt = MgrServices.AmountService.GetAmountDimensionTree(Convert.ToInt32(Common.GetRequest("amountID")),Convert.ToInt32(Common.GetRequest("amountTypeID")));
            //int a = dt.Tables.Count;
            //context.Response.Write(dt);
        }
    }
}