using BR_Service;
using CrisisInterfere.projrem;
using CrisisInterfere.RecycleBinService;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.CommonMethod.Ajax
{
    /// <summary>
    /// CommonMethod 的摘要说明
    /// </summary>
    public class CommonMethod : IHttpHandler, IRequiresSessionState
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
        public void PutDataToRecycleBin(HttpContext context)
        {
            var model = JsonConvert.DeserializeObject<List<RecycleBinModel>>(Common.GetRequest("recycleBinModelList"));
            var resultModel = new ResultViewModel();
            var successCount = 0;
            for (int i = 0; i < model.Count; i++)
            {
                model[i].RBDeleteTime = DateTime.Now;
                model[i].EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                model[i].RBExcutePerson = Common.GetSessionValue("loginName", context);
                if (MgrServices.RecycleBinService.PutDataInRecycleBin(model[i]))
                {
                    successCount++;
                }
            }
            if (successCount > 0)
            {
                resultModel.State = true;
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            resultModel.State = false;
            return;
        }
        public static void ExportExcelByEPPlus(HttpContext context, DataTable dt, string fileName,string headerName)
        {
            using (OfficeOpenXml.ExcelPackage pck = new OfficeOpenXml.ExcelPackage())
            {
                string sheetName = string.IsNullOrEmpty(dt.TableName) ? "sheet1" : dt.TableName;
                OfficeOpenXml.ExcelWorksheet ws = pck.Workbook.Worksheets.Add(sheetName);

                ws.Cells[2,1].LoadFromDataTable(dt, true);//从A4的单元格加载datatable中的数据  

                OfficeOpenXml.Style.ExcelBorderStyle borderStyle = OfficeOpenXml.Style.ExcelBorderStyle.Thin;
                System.Drawing.Color borderColor = System.Drawing.Color.FromArgb(0, 0, 0);

                using (OfficeOpenXml.ExcelRange rng = ws.Cells[1, 1, dt.Rows.Count + 2, dt.Columns.Count])
                {
                    rng.Style.Font.Name = "宋体";
                    rng.Style.Font.Size = 11;
                    rng.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                    rng.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(255, 255, 255));
                    rng.Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                    rng.Style.VerticalAlignment = OfficeOpenXml.Style.ExcelVerticalAlignment.Center;

                    rng.Style.Border.Top.Style = borderStyle;
                    rng.Style.Border.Top.Color.SetColor(borderColor);

                    rng.Style.Border.Bottom.Style = borderStyle;
                    rng.Style.Border.Bottom.Color.SetColor(borderColor);

                    rng.Style.Border.Right.Style = borderStyle;
                    rng.Style.Border.Right.Color.SetColor(borderColor);
                }

                //Format the header row  
                using (OfficeOpenXml.ExcelRange rng = ws.Cells[1, 1, 1, dt.Columns.Count])//1行1列到1行n列  
                {
                    rng.Merge = true;//合并单元格  
                    rng.Style.Font.Bold = true;
                    rng.Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                    rng.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(255, 255, 255));
                    rng.Style.Font.Color.SetColor(System.Drawing.Color.FromArgb(0, 0, 0));
                    rng.Value = headerName;
                }
                using (OfficeOpenXml.ExcelRange rng = ws.Cells[2, 1, 2, dt.Columns.Count])//1行1列到1行n列  
                {
                    rng.Style.Font.Bold = true;
                    rng.Style.HorizontalAlignment = OfficeOpenXml.Style.ExcelHorizontalAlignment.Center;
                    rng.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(255, 255, 255));
                    rng.Style.Font.Color.SetColor(System.Drawing.Color.FromArgb(0, 0, 0));
                }
                //返回到客户端    
                context.Response.Clear();
                context.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                context.Response.AddHeader("content-disposition", string.Format("attachment; filename={0}.xlsx", HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8)));
                context.Response.ContentEncoding = System.Text.Encoding.UTF8;

                context.Response.BinaryWrite(pck.GetAsByteArray());
                context.Response.Flush();
                context.ApplicationInstance.CompleteRequest();//解决捕获的“由于代码已经过优化...”的try catch异常  
                //HttpContext.Current.Response.End();  
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