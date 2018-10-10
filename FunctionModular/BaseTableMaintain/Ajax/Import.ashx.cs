using BR_Service;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.BaseTableMaintain.Ajax
{
    /// <summary>
    /// Import 的摘要说明
    /// </summary>
    public class Import : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            string Mark = Common.GetRequest("mark");
            context.Response.ContentType = "text/plain";
            switch (Mark)
            {
                case "import":


                    string fileName = context.Request["filename"];    //文件路径
                    fileName = fileName.Substring(fileName.LastIndexOf('\\') + 1);

                    HttpPostedFile uploadFile = context.Request.Files[0];
                    int colnum = 0; int rownum = 0;
                    string HTML_Json = Upload(uploadFile, context, fileName, colnum, rownum);

                    context.Response.Write(HTML_Json);
                    break;

            };

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
        }


        IWorkbook hssfworkbook;
        DataSet ds = new DataSet();
        public string Upload(HttpPostedFile fileUpload, HttpContext context, string fileName, int colnum, int rownum)
        {
            string json = "";
            if (fileUpload == null)
            {
                return json;
            }
            try
            {
                string UploadPath = context.Server.MapPath("/FunctionModular/BaseTableMaintain/datafile/");
                string filename = Common.Upload(fileUpload, UploadPath);

                /*----------------------操作读取文件--------------------------*/
                bool type = false;
                try
                {
                    using (FileStream file = new FileStream(filename, FileMode.Open, FileAccess.Read))
                    {

                        if (fileName.Contains(".xlsx"))
                        {
                            hssfworkbook = new XSSFWorkbook(file);
                            type = true;
                        }
                        else if (fileName.Contains(".xls"))
                        {
                            hssfworkbook = new HSSFWorkbook(file);
                            type = false;
                        }
                    }
                    ds = new DataSet();
                    ds = GetDataSet(filename, hssfworkbook, type);

                    DataTable SourceTemp = new DataTable();

                    string colstr = "";
                    string Rowstr = "";
                    if (ds != null && ds.Tables.Count > 0)
                    {
                        SourceTemp = ds.Tables[0];

                        if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                        {
                            for (int i = 0; i < SourceTemp.Columns.Count; i++)
                            {
                                if (!colstr.Equals(""))
                                {
                                    colstr += "," + SourceTemp.Rows[colnum][i];
                                }
                                else
                                {
                                    if (SourceTemp.Rows[colnum][i].ToString().Equals(""))
                                    {
                                        colstr += "~";
                                    }
                                    else
                                    {
                                        colstr += SourceTemp.Rows[colnum][i];
                                    }
                                }
                            }
                            for (int i = rownum; i < SourceTemp.Rows.Count; i++)
                            {
                                if (!Rowstr.Equals(""))
                                {
                                    Rowstr += "," + SourceTemp.Rows[i][0];
                                }
                                else
                                {
                                    if (SourceTemp.Rows[i][0].ToString().Equals(""))
                                    {
                                        Rowstr += "~";
                                    }
                                    else
                                    {
                                        Rowstr += SourceTemp.Rows[0][i];
                                    }
                                }
                            }
                        }
                    }
                    json = MgrServices.IBaseImportService.GetJson(SourceTemp, ref colstr, ref Rowstr);
                    int Addresult = MgrServices.IBaseImportService.AddInport("TSLBRW", json);

                    if (Addresult > 0)
                    {
                        return GetTableHTML(SourceTemp);
                    }
                    else
                    {
                        return "";
                    }







                }
                catch
                {

                }
                return "";

            }
            catch
            {
                return "";
            }


        }

        #region  根据excel获取DataSet







        /// <summary>
        /// 开发人员：刘玉京
        /// 开发日期：2016-12-12
        /// 功能描述 根据Excel获取DataSet
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="hssfworkbook"></param>
        /// <returns></returns>
        private DataSet GetDataSet(string filename, IWorkbook hssfworkbook, bool type)
        {
            DataSet ds = new DataSet();
            try
            {
                ISheet sheet = hssfworkbook.GetSheetAt(0);
                System.Collections.IEnumerator rows = sheet.GetRowEnumerator();

                DataTable dt = new DataTable();
                int index = sheet.GetRow(1).Cells.Count;
                for (int j = 0; j < index; j++)
                {
                    dt.Columns.Add(Convert.ToChar(((int)'A') + j).ToString());
                }

                while (rows.MoveNext())
                {
                    IRow row;
                    if (type)
                    {
                        row = (XSSFRow)rows.Current;
                    }
                    else
                    {
                        row = (HSSFRow)rows.Current;
                    }

                    DataRow dr = dt.NewRow();

                    for (int i = 0; i < row.LastCellNum; i++)
                    {
                        ICell cell = row.GetCell(i);
                        if (cell == null)
                        {
                            dr[i] = null;
                        }
                        else
                        {
                            dr[i] = cell.ToString();
                        }
                    }
                    dt.Rows.Add(dr);
                }
                ds.Tables.Add(dt);
            }
            catch (Exception)
            {

            }
            return ds;
        }
        #endregion


        private string GetTableHTML(DataTable sourceTemp)
        {

            string TableStr = "";

            string TitleHTML = "";
            string BodyHTML = "<tr>";


            for (int r = 0; r < sourceTemp.Rows.Count; r++)
            {

                if (r == 0)
                {
                    for (int c = 0; c < sourceTemp.Columns.Count; c++)
                    {

                        TitleHTML += "<th>" + sourceTemp.Rows[0][c].ToString() + "</th>";


                    }
                }
                else
                {
                    for (int c = 0; c < sourceTemp.Columns.Count; c++)
                    {

                        BodyHTML += " <td>" + sourceTemp.Rows[r][c] + "</td>";
                        if (c == sourceTemp.Columns.Count - 1)
                        {
                            BodyHTML += "</tr><tr>";
                        }
                    }

                }

            }
            BodyHTML += "<tr>";




            TableStr += " <table class=\"table table-striped table-bordered table-hover\"  style=\"width:1500px;\" id=\"JsonTable\">";
            TableStr += "  <thead>";
            TableStr += "      <tr>";
            TableStr += TitleHTML;
            TableStr += "      </tr>";
            TableStr += "  </thead>";
            TableStr += "  <tbody>";
            TableStr += BodyHTML;
            TableStr += "  </tbody>";
            TableStr += " </table>";
            return TableStr;
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