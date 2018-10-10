using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.StatisticalAnalysis.Ajax
{
    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-12-16
    /// 功能介绍：统计分析逻辑运算
    /// </summary>
    public class Statistical_logic : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;


            string Remarks = context.Request["Remark"];
            switch (Remarks)
            {
                case "Getlogic":
                    InitStatistical(context);
                    break;
                case "TJFX":
                    GetAnalyJson(context);
                    break;

            }

        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-12-16
        /// 功能介绍：输出统计分析数据
        /// </summary>
        public void InitStatistical(HttpContext context)
        {

            try
            {
                string Getlogic = "";
                string lbcode = Common.GetRequest("LB_code");
                string XmlJson = Common.GetRequest("XmlJson");
                Getlogic = MgrServices.StatisticalService.GenerateLogic(XmlJson, lbcode);
                context.Response.Write(Getlogic);
            }
            catch
            {

            }

        }


        public void GetAnalyJson(HttpContext context)
        {
            try
            {

                DataTable sourceTemp = new DataTable();
                sourceTemp = GetGetAnalyTemp();
                string AnalyJson = "";
                if (sourceTemp != null && sourceTemp.Rows.Count > 0)
                {
                    AnalyJson = sourceTemp.Rows[0]["AnalyBaseJson"] == DBNull.Value ? "" : sourceTemp.Rows[0]["AnalyBaseJson"].ToString();
                }
                context.Response.Write(AnalyJson);

            }
            catch
            {


            }

        }

        /// <summary>
        /// 获取统计分析的F对比值
        /// </summary>
        /// <returns></returns>
        private DataTable GetGetAnalyTemp()
        {

            DataTable SourceTemp = new DataTable();

            try
            {
                SourceTemp = MgrServices.StatisticalService.GetAnalyBaseTemp("TJFX");
            }
            catch
            {

            }
            return SourceTemp;
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