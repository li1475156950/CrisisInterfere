using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CrisisInterfere.IdioctoniaEstimateService;
using BR_Service;
using CrisisInterfere.FunctionModular.RiskWarning.Model;
using System.Text;
using CrisisInterfere.projrem;
using System.Web.SessionState;
using System.IO;
using Svg;
using System.Drawing.Imaging;
using iTextSharp.text.pdf;
namespace CrisisInterfere.FunctionModular.RiskWarning.Ajax
{
    /// <summary>
    /// IdioctoniaAmount 的摘要说明
    /// </summary>
    public class IdioctoniaEstimate : IHttpHandler,IRequiresSessionState
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
        public void InitialTable(HttpContext context)
        {
            DataSet SourceTemps = new DataSet();
            DataTable SourceTemp = new DataTable();
            var sourceDataTable = new DataTable();
            var exportDt = new DataTable();
            exportDt.Columns.Add("登录名", typeof(String));
            exportDt.Columns.Add("姓名", typeof(String));
            exportDt.Columns.Add("性别", typeof(String));
            exportDt.Columns.Add("出生日期", typeof(String));
            exportDt.Columns.Add("部门", typeof(String));
            exportDt.Columns.Add("预警级别", typeof(String));
            exportDt.Columns.Add("测试日期", typeof(String));
            exportDt.Columns.Add("处理情况", typeof(String));
            var searchModel = JsonConvert.DeserializeObject<IdioctoniaEstimateSearchModel>(Common.GetRequest("searchModel"));
            searchModel.UserID = Convert.ToInt32(context.Session["UserID"].ToString());
            try
            {
                SourceTemps = MgrServices.IdioctoniaEstimateService.InitialTable(searchModel);
            }
            catch (Exception)
            {
                
                throw;
            }
            searchModel.EndIndex = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
            sourceDataTable = MgrServices.IdioctoniaEstimateService.InitialTable(searchModel).Tables[1];
            foreach (DataRow DTR in sourceDataTable.Rows)
            {
                var dr = exportDt.NewRow();
                dr["登录名"] = DTR["U_LoginName"].ToString();
                dr["姓名"] = DTR["U_Name"].ToString();
                dr["性别"] = DTR["U_Sex"].ToString();
                dr["出生日期"] = Convert.ToDateTime(DTR["U_Birthday"]).ToString("yyyy-MM-dd");
                dr["部门"] = DTR["D_name"].ToString();
                dr["预警级别"] = DTR["WLName"].ToString();
                dr["测试日期"] = Convert.ToDateTime(DTR["Answer_CreateTime"]).ToString("yyyy-MM-dd");
                dr["处理情况"] = DTR["DisposalState"].ToString();
                exportDt.Rows.Add(dr);
            }
            context.Session["ExportExcel"] = exportDt;
            PageInfo page = new PageInfo();
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
                                DTR["U_ID"].ToString(),
                                "",
                                DTR["PageIndex"].ToString(),
                                DTR["U_LoginName"].ToString(),
                                DTR["U_Name"].ToString(),
                                DTR["U_Sex"].ToString(),
                                Common.CalculateAgeCorrect(Convert.ToDateTime(DTR["U_Birthday"]),DateTime.Now).ToString(),
                                DTR["D_name"].ToString(),
                                DTR["WLName"].ToString(),
                                DTR["Answer_CreateTime"].ToString(),
                                DTR["DisposalState"].ToString(),
                                "",
                                DTR["BelongToCode"].ToString(),
                                DTR["Amount_Code"].ToString(),
                                DTR["U_Tel"].ToString(),
                                DTR["U_EMail"].ToString(),
                                DTR["DistributionName"].ToString()
                            };
                        page.data.Add(arr);
                    }

                }
            }
            
            page.recordsFiltered = page.recordsTotal;
            String json = Common.ObjectToJson(page);
            context.Response.Write(json);
        }
        public void GetDimensionScoreData(HttpContext context)
        {
            var belongToCode = Common.GetRequest("belongToCode");
            var dt = MgrServices.PotentialRiskEstimateService.GetResultTableByBelongToCode(belongToCode);
            var dimension = MgrServices.GroupReportService.GetDimensionByAmountCode(dt.Rows[0]["Amount_Code"].ToString()).ToList();//根据量表Code得到维度
            var answerRecord = dt.Rows[0]["AnswerAdd_Record"].ToString();
            var answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(answerRecord);//将用户答题记录json字符串反序列为字典项键值对
            var model = new IdioctoniaEstimateDimensionScore();
            model.DimensionScore = new List<int>();
            model.DimensionName = new List<string>() { "总评", "绝望", "自杀意念", "负性自我评价", "敌意" };
            for (int i = 0; i < dimension.Count; i++)
            {
                var score = 0;//记录维度总分变量
                var subjectCodes = MgrServices.GroupReportService.GetSubjectCodeByDimensionCode(dimension[i]);//根据维度获取题干Code
                StringBuilder sb = new StringBuilder();
                sb.Append("(");
                foreach (var item in answerRecordDic)
                {
                    //判断出当前所有题干属于当前维度Code的题干

                    if (subjectCodes.Contains(item.Key))
                    {
                        sb.Append("'" + item.Value + "'");
                        sb.Append(",");
                    }

                }
                sb.Remove(sb.Length - 1, 1);
                sb.Append(")");
                score = Convert.ToInt32(MgrServices.GroupReportService.GetSingleScoreBySbjCodeAndOptCode(sb.ToString()));//分数累加
                model.DimensionScore.Add(score);
            }
            context.Response.Write(JsonConvert.SerializeObject(model));
        }
        public void GetDimensionExplain(HttpContext context)
        {
            var idioctoniaEstimateDimesnionExplainModelList = new List<IdioctoniaEstimateDimensionExplainModel>();
            var belongToCode = Common.GetRequest("belongToCode");
            var dt = MgrServices.PotentialRiskEstimateService.GetResultTableByBelongToCode(belongToCode);
            var dimension = MgrServices.GroupReportService.GetDimensionByAmountCode(dt.Rows[0]["Amount_Code"].ToString()).ToList();//根据量表Code得到维度
            var answerRecord = dt.Rows[0]["AnswerAdd_Record"].ToString();
            var answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(answerRecord);//将用户答题记录json字符串反序列为字典项键值对
            var sb = new StringBuilder();
            sb.Append("(");
            for (int i = 0; i < dimension.Count;i++ )
            {
                if (i == dimension.Count - 1)
                {
                    sb.Append("'" + dimension[i] + "'");
                }
                else 
                {
                    sb.Append("'" + dimension[i] + "',");
                }
            }
            sb.Append(")");
            Dictionary<string, string> Dim_Nor_Dic = MgrServices.GroupReportService.NormCodeByDimensionCodeList(sb.ToString()).AsEnumerable().ToDictionary(k => k["DimensionCode"].ToString(), v => v["NormCode"].ToString());//根据维度集合获取常模集合
            sb = new StringBuilder();
            sb.Append("(");
            foreach (var item in Dim_Nor_Dic)
            {
                sb.Append("'");
                sb.Append(item.Value);
                sb.Append("'");
                sb.Append(",");
            }
            sb.Remove(sb.Length - 1, 1);
            sb.Append(")");

            Dictionary<string, List<GroupReportService.ExplainModel>> explainDic = new Dictionary<string, List<GroupReportService.ExplainModel>>();

            System.Data.DataTable tempExplainTable = MgrServices.GroupReportService.GetExplainScoreByNormCodeTable(sb.ToString());
            Dictionary<string, List<CrisisInterfere.GroupReportService.NormWarningModel>> warningDic = MgrServices.GroupReportService.GetNormWarningByNormCodeList(sb.ToString());//常模_预警信息字典
            foreach (var item in Dim_Nor_Dic)
            {
                if (tempExplainTable.AsEnumerable().Count(x => x["NormCode"].ToString() == item.Value) > 0)
                    explainDic[item.Value] = tempExplainTable.AsEnumerable().Where(x => x["NormCode"].ToString() == item.Value)
                        .Select(x => new GroupReportService.ExplainModel()
                        {
                            ExplainCode = x["ExplainCode"].ToString(),
                            ExplainName = x["ExplainName"].ToString(),
                            NormExplain = x["NormExplain"].ToString(),
                            StartFraction = Convert.ToInt32(x["StartFraction"]),
                            EndFraction = Convert.ToInt32(x["EndFraction"]),
                            NormStartAge = Convert.ToInt32(x["NormStartAge"]),
                            NormEndAge = Convert.ToInt32(x["NormEndAge"]),
                            NormSex = Convert.ToInt32(x["NormSex"]),
                            DimensionCode = x["DimensionCode"].ToString(),
                            DimensionName = x["DimensionName"].ToString(),
                            FirstSymbol = x["First_Symbol"].ToString(),
                            SecondSymbol = x["Second_Symbol"].ToString()
                        }).ToList();
            }
            foreach (var item in dimension)
            {
                var idioctoniaEstimateDimesnionExplainModel = new IdioctoniaEstimateDimensionExplainModel();
                var score = 0;//记录维度总分变量
                var subjectCodes = MgrServices.GroupReportService.GetSubjectCodeByDimensionCode(item);//根据维度获取题干Code
                StringBuilder ar = new StringBuilder();
                ar.Append("(");
                foreach (var arItem in answerRecordDic)
                {
                    //判断出当前所有题干属于当前维度Code的题干

                    if (subjectCodes.Contains(arItem.Key))
                    {
                        ar.Append("'" + arItem.Value + "'");
                        ar.Append(",");
                    }

                }
                ar.Remove(ar.Length - 1, 1);
                ar.Append(")");
                score = Convert.ToInt32(MgrServices.GroupReportService.GetSingleScoreBySbjCodeAndOptCode(ar.ToString()));//分数累加
                var norm = Dim_Nor_Dic[item];//根据维度获取常模
                List<GroupReportService.ExplainModel> explainList = explainDic[norm];//根据常模获取分数段
                for (int i = 0; i < explainList.Count; i++)
                {
                    #region 年龄不限制，性别不限制
                    //年龄不限制，性别不限制
                    if (explainList[i].NormEndAge == 0 && explainList[i].NormStartAge == 0 && explainList[i].NormSex == 0)
                    {
                            var firstExpression = true;
                            var secondExpression = true;
                            switch (explainList[i].FirstSymbol)
                            {
                                case "==":
                                    firstExpression = explainList[i].StartFraction == score;
                                    break;
                                case "<=":
                                    firstExpression = explainList[i].StartFraction <= score;
                                    break;
                                case "<":
                                    firstExpression = explainList[i].StartFraction < score;
                                    break;
                                default:
                                    break;
                            }
                            switch (explainList[i].SecondSymbol)
                            {
                                case "==":
                                    secondExpression = explainList[i].EndFraction == score;
                                    break;
                                case "<=":
                                    secondExpression = explainList[i].EndFraction >= score;
                                    break;
                                case "<":
                                    secondExpression = explainList[i].EndFraction > score;
                                    break;
                                default:
                                    break;
                            }
                            if (firstExpression && secondExpression)
                            {
                                idioctoniaEstimateDimesnionExplainModel.DimensionName = explainList[i].DimensionName;
                                idioctoniaEstimateDimesnionExplainModel.NormExplain = explainList[i].NormExplain;
                                idioctoniaEstimateDimesnionExplainModelList.Add(idioctoniaEstimateDimesnionExplainModel);
                            }

                        //rcm.name = explainList[i].ExplainName;
                    }
                    
                    #endregion
                }

            }

            context.Response.Write(JsonConvert.SerializeObject(idioctoniaEstimateDimesnionExplainModelList));
        }
        public void BulkExportExcel(HttpContext context)
        {
            //var commonMethod = new CommonMethod.Ajax.CommonMethod();
            var resultModel = new ResultViewModel();
            var dt = context.Session["ExportExcel"] as DataTable;
            if (dt.Rows.Count <= 0)
            {
                resultModel.State = false;
                resultModel.Data = "当前无数据，批量导出失败";
                context.Response.Write(JsonConvert.SerializeObject(resultModel));
                return;
            }
            CommonMethod.Ajax.CommonMethod.ExportExcelByEPPlus(context, dt, "自杀可能性" + DateTime.Now.ToString("yyyy-MM-dd HHmmss"), "自杀可能性测试人员名单");
        }
        public void GetIdioctoniaEstimateResult(HttpContext context)
        {
            var belongToCode = Common.GetRequest("belongToCode");
            var dt = MgrServices.PotentialRiskEstimateService.GetResultTableByBelongToCode(belongToCode);
            var idioctoniaRiskResultList = new List<Dictionary<string, int>>();
            if (dt.Rows[0]["Amount_Code"].ToString() == "LB_15131477237610")
            {

                var dimension = MgrServices.GroupReportService.GetDimensionByAmountCode(dt.Rows[0]["Amount_Code"].ToString());//根据量表Code得到维度
                var answerRecord = dt.Rows[0]["AnswerAdd_Record"].ToString();
                var answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(answerRecord);//将用户答题记录json字符串反序列为字典项键值对
                var idioctoniaRiskResult = new Dictionary<string, int>();//记录录用户维度分数
                //先计算总评得分，为减少计算时间

                for (int j = 0; j < dimension.Count; j++)
                {
                    var score = 0;//记录维度总分变量
                    var subjectCodes = MgrServices.GroupReportService.GetSubjectCodeByDimensionCode(dimension[j]);//根据维度获取题干Code
                    StringBuilder sb = new StringBuilder();
                    idioctoniaRiskResult = new Dictionary<string, int>();
                    sb.Append("(");
                    foreach (var item in answerRecordDic)
                    {
                        //判断出当前所有题干属于当前维度Code的题干

                        if (subjectCodes.Contains(item.Key))
                        {
                            sb.Append("'" + item.Value + "'");
                            sb.Append(",");
                        }

                    }
                    sb.Remove(sb.Length - 1, 1);
                    sb.Append(")");
                    score = Convert.ToInt32(MgrServices.GroupReportService.GetSingleScoreBySbjCodeAndOptCode(sb.ToString()));//分数累加
                    if (dimension[j] == "WD_15131479937617")
                    {
                        if (score <= 50)
                        {
                            idioctoniaRiskResult.Add("可能性极小", score);
                        }
                        if (score >= 50 && score < 60)
                        {
                            idioctoniaRiskResult.Add("可能性较小", score);
                        }
                        if (score >= 60 && score < 70)
                        {
                            idioctoniaRiskResult.Add("可能性中等", score);
                        }
                        if (score >= 70 && score <= 80)
                        {
                            idioctoniaRiskResult.Add("可能性较大", score);
                        }
                        if (score >= 80)
                        {
                            idioctoniaRiskResult.Add("可能性极大", score);
                        }
                    }
                    if (dimension[j] == "WD_15131480158408")
                    {
                        if (score <= 30)
                        {
                            idioctoniaRiskResult.Add("程度较轻", score);
                        }
                        if (score > 30)
                        {
                            idioctoniaRiskResult.Add("程度较重", score);
                        }
                    }
                    if (dimension[j] == "WD_15131480457773")
                    {
                        if (score <= 15)
                        {
                            idioctoniaRiskResult.Add("程度较轻", score);
                        }
                        if (score > 15)
                        {
                            idioctoniaRiskResult.Add("程度较重", score);
                        }
                    }
                    if (dimension[j] == "WD_15131480649338")
                    {
                        if (score <= 30)
                        {
                            idioctoniaRiskResult.Add("程度较轻", score);
                        }
                        if (score > 30)
                        {
                            idioctoniaRiskResult.Add("程度较重", score);
                        }
                    }
                    if (dimension[j] == "WD_15131480907774")
                    {
                        if (score <= 14)
                        {
                            idioctoniaRiskResult.Add("程度较轻", score);
                        }
                        if (score > 14)
                        {
                            idioctoniaRiskResult.Add("程度较重", score);
                        }
                    }
                    idioctoniaRiskResultList.Add(idioctoniaRiskResult);
                }
            }
            context.Response.Write(JsonConvert.SerializeObject(idioctoniaRiskResultList));
        }
        public void GetWarningState(HttpContext context)
        {
            var belongToCode = Common.GetRequest("belongToCode");
            var warningState = MgrServices.DiscriminateEstimateService.GetWarningStateByBelongToCode(belongToCode);
            context.Response.Write(warningState);
        }

        public void SaveImage(HttpContext context)
        {
            var aa = context.Request.Form["svg"];
            if (context.Request.Form["svg"] != null)
            {
                string tType = "image/png";
                string tSvg = context.Request.Form["svg"].ToString();
                string tFileName = "";

                Random rand = new Random(24 * (int)DateTime.Now.Ticks);
                tFileName = rand.Next().ToString();

                MemoryStream tData = new MemoryStream(Encoding.UTF8.GetBytes(tSvg));

                MemoryStream tStream = new MemoryStream();
                string tTmp = new Random().Next().ToString();

                string tExt = "";
                string tTypeString = "";

                switch (tType)
                {
                    case "image/png":
                        tTypeString = "-m image/png";
                        tExt = "png";
                        break;
                    case "image/jpeg":
                        tTypeString = "-m image/jpeg";
                        tExt = "jpg";
                        break;
                    case "application/pdf":
                        tTypeString = "-m application/pdf";
                        tExt = "pdf";
                        break;
                    case "image/svg+xml":
                        tTypeString = "-m image/svg+xml";
                        tExt = "svg";
                        break;
                }

                if (tTypeString != "")
                {
                    //string tWidth = context.Request.Form["width"].ToString();
                    //string tWidth = "0";
                    Svg.SvgDocument tSvgObj = SvgDocument.Open(tData);
                    switch (tExt)
                    {
                        case "jpg":
                            tSvgObj.Draw().Save(tStream, ImageFormat.Jpeg);
                            break;
                        case "png":

                            tSvgObj.Draw().Save(tStream, ImageFormat.Png);
                            break;
                        case "pdf":
                            PdfWriter tWriter = null;
                            iTextSharp.text.Document tDocumentPdf = null;
                            try
                            {
                                tSvgObj.Draw().Save(tStream, ImageFormat.Png);
                                tDocumentPdf = new iTextSharp.text.Document(new iTextSharp.text.Rectangle((float)tSvgObj.Width, (float)tSvgObj.Height));
                                tDocumentPdf.SetMargins(0.0f, 0.0f, 0.0f, 0.0f);
                                iTextSharp.text.Image tGraph = iTextSharp.text.Image.GetInstance(tStream.ToArray());
                                tGraph.ScaleToFit((float)tSvgObj.Width, (float)tSvgObj.Height);

                                tStream = new MemoryStream();
                                tWriter = PdfWriter.GetInstance(tDocumentPdf, tStream);
                                tDocumentPdf.Open();
                                tDocumentPdf.NewPage();
                                tDocumentPdf.Add(tGraph);
                                tDocumentPdf.CloseDocument();
                            }
                            catch (Exception ex)
                            {
                                throw ex;
                            }
                            finally
                            {
                                tDocumentPdf.Close();
                                tDocumentPdf.Dispose();
                                tWriter.Close();
                                tWriter.Dispose();
                                tData.Dispose();
                                tData.Close();

                            }
                            break;

                        case "svg":
                            tStream = tData;
                            break;
                    }
                    System.IO.MemoryStream ms = new System.IO.MemoryStream(tStream.ToArray());
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms);
                    string savePath = context.Server.MapPath("image/");

                    if (!Directory.Exists(savePath))
                    {
                        Directory.CreateDirectory(savePath);
                    }
                    savePath += tFileName + "." + tExt;
                    string SavePathImage = tFileName + "." + tExt;
                    context.Session["FirstImage"] = savePath;
                    image.Save(savePath, System.Drawing.Imaging.ImageFormat.Png);
                    image.Dispose();
                    context.Response.Write(tFileName + "." + tExt);
                }
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