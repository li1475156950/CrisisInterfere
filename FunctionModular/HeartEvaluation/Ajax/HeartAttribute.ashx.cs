using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using CrisisInterfere.projrem;

namespace CrisisInterfere.FunctionModular.HeartEvaluation.Ajax
{

    /// <summary>
    /// HeartAttribute 的摘要说明
    /// 创建人：刘玉京
    /// 创建时间：2016-09-07
    /// 功能介绍：量表管理控件属性逻辑处理程序
    /// </summary>
    public class HeartAttribute : IHttpHandler, IRequiresSessionState
    {
        private HttpContext PubliContext;
        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            PubliContext = context;
            string Remarks = Common.GetRequest("Remark");
            //AmountType量表类型，AmountsName量表名称
            switch (Remarks)
            {
                case "AmountType":
                    InitAmountType(context);
                    break;
                case "AmountsName":
                    LoadAnswerStatusName(context);
                    break;
                //case "Amount_select":
                //    //Amount_select();
                //    break;
            }
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-09-07
        /// 功能介绍：初始化量表类别下拉列表
        /// </summary>
        private void InitAmountType(HttpContext context)
        {
            try
            {

                DataTable SourceTemp = new DataTable();
                SourceTemp = GetAmountType(context);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["AmountType_Name"].ToString();
                        mex.Value = DTR["Amount_TypeID"].ToString();
                        listT.Add(mex);
                    }
                    PubliContext.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }
            }
            catch
            {


            }
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-07-09
        /// 功能介绍：获取量表类别数据集合
        /// </summary>
        /// <returns></returns>
        private DataTable GetAmountType(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (LicenseCode == null)
                    return null;
                SourceTemp = MgrServices.AmountTypeService.GetAmountTypeTemp(LicenseCode);
            }
            catch (Exception ex)
            { }

            return SourceTemp;
        }
        /// <summary>
        /// 创建人:刘亚娟
        /// 创建时间：2016.10.21
        /// 功能:获取量表名称
        /// </summary>
        /// <param name="context"></param>
        public void LoadAnswerStatusName(HttpContext context)
        {
            try
            {
                context.Response.Write(JsonConvert.SerializeObject(MgrServices.AnswerStatusService.GetAllAnswerStatus()));
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        ///获取量表名称
        /// </summary>
        public void Amount_select(HttpContext context)
        {
            try
            {
                string json = JsonConvert.SerializeObject(MgrServices.AnswerStatusService.GetAllAnswerStatus());
                context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
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