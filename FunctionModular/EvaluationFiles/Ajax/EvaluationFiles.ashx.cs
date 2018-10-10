using BR_Service;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using Svg;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.EvaluationFiles.Ajax
{
    /// <summary>
    /// EvaluationFiles 的摘要说明
    /// </summary>
    public class EvaluationFiles : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            string Type = Common.GetRequest("type");
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            string LoginNames = Common.GetSessionValue("loginName", context);
            if (LoginNames == null)
                return;
            int UserID = 0;
            string _userID = Common.GetSessionValue("UserID", context);
            if (_userID == null)
                return;
            UserID = Convert.ToInt32(_userID);
            switch (Type)
            {
                case "Load":

                    int StarPageIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                    int EndPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                    string LoginName = Common.GetRequest("LoginName");
                    string GaugeName = Common.GetRequest("GaugeName");
                    InitGaugePages(LoginNames, StarPageIndex, EndPageIndex, LoginName, GaugeName, EnterpriseCode, context);
                    break;
                case "LoadAmountName":
                    context.Response.Write(LoadAmountName());
                    break;
                case "GetView":
                    string Acode = Common.GetRequest("Acode");
                    string UserName = Common.GetRequest("UserName");
                    int UID = Convert.ToInt32(Common.GetRequest("UIDs"));
                    InitGetView(UserName, Acode, EnterpriseCode, UID, context);
                    break;
                case "GetAnswerR":
                    string Acodes = Common.GetRequest("A_code");
                    InitWDPages(Acodes, context);
                    break;
                case "deletes":
                    deletes(context);
                    break;
                case "SaveImage":
                    SaveImage(context);
                    break;
            }
        }
        #region 获取我的测验列表
        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/08
        /// 获取我的测验列表
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="StarPageIndex"></param>
        /// <param name="EndPageIndex"></param>
        /// <param name="GaugeName"></param>
        /// <returns></returns>
        private DataSet GetGaugeTemp(string UName, int StarPageIndex, int EndPageIndex, string loginName, string AName, string EnterpriseCode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.DistributeRecordService.GetEvaluationTable(UName, StarPageIndex, EndPageIndex, loginName, AName, EnterpriseCode);
            }
            catch
            {

            }

            return SourceTemp;
        }

        /// <summary>
        /// 创建人：刘亚娟
        /// 创建日期：2016/11/05
        /// 获取我的测验的列表
        /// </summary>
        /// <param name="UserID"></param>
        /// <param name="StarPageIndex"></param>
        /// <param name="EndPageIndex"></param>
        /// <param name="GaugeName"></param>
        /// <param name="context"></param>
        private void InitGaugePages(string LoginNames, int StarPageIndex, int EndPageIndex, string loginName, string AName, string EnterpriseCode, HttpContext context)
        {

            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetGaugeTemp(LoginNames, StarPageIndex, EndPageIndex, loginName, AName, EnterpriseCode);
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    if (SourceTemps.Tables[1].Rows.Count == 0)
                    {
                        if (StarPageIndex > 10)
                        {
                            StarPageIndex = StarPageIndex - 10;
                            EndPageIndex = EndPageIndex - 10;
                            SourceTemps = GetGaugeTemp(LoginNames, StarPageIndex, EndPageIndex, loginName, AName, EnterpriseCode);
                        }
                    }
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            String[] arr =
                            {    
                                DTR["AnswerAdd_ID"].ToString(),//0
                                "",//1
                                DTR["PageIndex"].ToString(),//序号	  2 
                                DTR["U_LoginName"].ToString(),//登陆名称3
                                DTR["U_Name"].ToString(),//姓名4
                                DTR["D_name"].ToString(),//部门5
                                DTR["Amount_Name"].ToString(), //量表名称 6                                 
                                "",//操作7
                                DTR["Amount_Code"].ToString(),//8量表编码
                                  DTR["U_ID"].ToString(),//9
                               
                             
                            };
                            page.data.Add(arr);

                        }
                    }
                }
                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch
            {

            }
        }
        #endregion
        public string LoadAmountName()
        {
            string json = "";
            try
            {
                json = JsonConvert.SerializeObject(MgrServices.AmountService.GetAllAmountName());
                return json;
            }
            catch
            {
                return json;
            }
        }
        private void InitGetView(string LoginNames, string Amount_Code, string EnterpriseCode, int U_ID, HttpContext context)
        {

            try
            {
                StringBuilder sb = new StringBuilder();
                List<GetViewModels> list = new List<GetViewModels>();

                DataSet SourceTemps = new DataSet();
                SourceTemps = MgrServices.DistributeRecordService.GetViewFiles(LoginNames, Amount_Code, EnterpriseCode, U_ID);
                DataTable dt = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    GetViewModel model = new GetViewModel();
                    dt = SourceTemps.Tables[0];
                    if (dt != null && dt.Rows.Count > 0)
                    {

                        model.LoginName = dt.Rows[0]["U_LoginName"].ToString();
                        model.Name = dt.Rows[0]["U_Name"].ToString();
                        model.Sex = dt.Rows[0]["U_Sex"].ToString();
                        model.D_name = dt.Rows[0]["D_name"].ToString();
                        model.U_Birthday = dt.Rows[0]["U_Birthday"].ToString();
                        model.AmountIntroduce = dt.Rows[0]["AmountIntroduce"].ToString();
                        model.AllCount = Convert.ToInt32(dt.Rows[0]["counts"].ToString());
                        model.Amount_Name = dt.Rows[0]["Amount_Name"].ToString();
                        string ss = dt.Rows[0]["U_Age"].ToString();
                        if (dt.Rows[0]["U_Age"] != DBNull.Value && dt.Rows[0]["U_Age"] != "")
                        {
                            model.Ages = Convert.ToInt32(dt.Rows[0]["U_Age"].ToString());
                        }
                        else
                        {
                            model.Ages = 0;
                        }
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            GetViewModels models = new GetViewModels();
                            models.score = dt.Rows[i]["AnswerAdd_score"].ToString();
                            models.Answer_CreateTime = dt.Rows[i]["Answer_CreateTime"].ToString();
                            models.AnswerJson = dt.Rows[i]["AnswerAdd_Record"].ToString();
                            list.Add(models);


                        }
                    }
                    string UserInfo = JsonConvert.SerializeObject(model);
                    string AnswerInfo = JsonConvert.SerializeObject(list);
                    sb.Append("{");
                    sb.Append("'UserInfo':" + UserInfo + ",");

                    sb.Append("'AnswerInfo':" + AnswerInfo);
                    sb.Append("}");
                    string json = sb.ToString();
                    context.Response.Write(json);

                }


            }
            catch
            {

            }
        }
        /// <summary>
        /// 加载测试结果维度解释明细
        /// </summary>
        public void InitWDPages(string Acode, HttpContext context)
        {
            try
            {
                int maxs = 0;
                int mins = 0;
                int indexs = 0;
                DataSet SourceTemp = new DataSet();
                SourceTemp = GetDimensionTepByACode(Acode);
                DataTable OperationTemp = new DataTable();
                DataTable DimensionTemp = new DataTable();
                DataTable ResultTemp = new DataTable();
                if (SourceTemp != null && SourceTemp.Tables.Count > 0)
                {
                    OperationTemp = SourceTemp.Tables[0];
                    DimensionTemp = SourceTemp.Tables[1];
                    ResultTemp = SourceTemp.Tables[2];

                }

                int ScoringMode = 0;//计分方式参数 0：:原始计分  1：:转化计分

                string AnswerJson = Common.GetRequest("An_json");

                String[] StrArr;
                if (AnswerJson != "" && AnswerJson.Length > 0)
                {
                    AnswerJson = AnswerJson.Replace("{", "").Replace("}", "");
                    StrArr = AnswerJson.Split(',');
                }
                else
                {
                    StrArr = null;
                }
                if (DimensionTemp != null && DimensionTemp.Rows.Count > 0)
                {
                    indexs++;
                    DimensionEntity info = new DimensionEntity();
                    List<DimensionEntity> infoList = new List<DimensionEntity>();
                    foreach (DataRow dtr in DimensionTemp.Rows)
                    {
                        ScoringMode = dtr["ScoringMode"] == DBNull.Value ? 0 : Convert.ToInt32(dtr["ScoringMode"].ToString());
                        info = new DimensionEntity();
                        info.D_Code = dtr["DimensionCode"].ToString();
                        info.WD_Name = dtr["DimensionName"].ToString();
                        DataRow[] WD_DTR;
                        DataTable WdMaxmin = new DataTable();//根据维度求最大值最小值
                        if (ResultTemp != null && ResultTemp.Rows.Count > 0)
                        {

                            WD_DTR = ResultTemp.Select("  DimensionCode ='" + dtr["DimensionCode"].ToString() + "' ");
                            WdMaxmin = MgrServices.PresentationService.GetDMaxMin(info.D_Code);
                            if (WdMaxmin.Rows.Count > 0)
                            {
                                int minvalue = Convert.ToInt32(WdMaxmin.Rows[0]["TT2"]);//原始分
                                if (indexs != 1)
                                {
                                    if (minvalue < mins)
                                    {
                                        mins = minvalue;
                                    }
                                }
                                else
                                {
                                    mins = minvalue;
                                }
                                int maxvalue = Convert.ToInt32(WdMaxmin.Rows[0]["TT"]);

                                if (indexs != 1)
                                {
                                    if (maxvalue > maxs)
                                    {
                                        maxs = maxvalue;
                                    }
                                }
                                else
                                {
                                    maxs = maxvalue;
                                }
                            }
                        }
                        else
                        {
                            WD_DTR = null;
                        }
                        if (OperationTemp != null && OperationTemp.Rows.Count > 0)
                        {
                            DataRow[] SubDtr = OperationTemp.Select("   DimensionCode='" + info.D_Code + "' ");
                            double _Score = 0;
                            if (StrArr != null && StrArr.Length > 0)
                            {

                                if (SubDtr != null && SubDtr.Length > 0)
                                {

                                    foreach (DataRow Std in SubDtr)
                                    {

                                        string tzcode = Std["OperationCode"].ToString();

                                        foreach (string str in StrArr)
                                        {

                                            String[] optList = str.Split(':');
                                            if (optList != null && optList.Length > 0)
                                            {
                                                string tz_Code = optList[1].Replace("\"", "");
                                                if (tzcode.Equals(tz_Code))
                                                {
                                                    _Score = _Score + Convert.ToDouble(Std["OperationFraction"].ToString());
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                }

                            }
                            info.Score = _Score;
                            info.ScoreType = ScoringMode;
                            if (ScoringMode.Equals(1))//等于1的时候是转化分
                            {
                                string FormulaStr = dtr["FormulaStr"] == DBNull.Value ? "" : dtr["FormulaStr"].ToString();
                                info.FormulaStr = FormulaStr;
                                if (FormulaStr.Trim() != "")
                                {
                                    FormulaStr = FormulaStr.Replace("Score", _Score.ToString());
                                    info.ConversionFormula = FormulaStr;
                                    //info.ConversionScore = Convert.ToDouble(CalcByCalcParenthesesExpression(FormulaStr));//C#组内计算，比较耗服务器资源，还是换到客户端吧
                                }
                                else
                                {
                                    info.ConversionFormula = _Score.ToString();
                                }

                            }
                            else
                            {
                                info.ConversionFormula = _Score.ToString();
                            }

                            List<CMModel> cmlists = new List<CMModel>();
                            if (WD_DTR != null && WD_DTR.Length > 0)
                            {

                                foreach (DataRow S_Dtr in WD_DTR)
                                {

                                    CMModel cmmodels = new CMModel();
                                    cmmodels.StartScore = S_Dtr["StartFraction"].ToString() + S_Dtr["First_Symbol"] + "Scores";
                                    cmmodels.EndScore = "Scores" + S_Dtr["Second_Symbol"] + S_Dtr["EndFraction"].ToString();
                                    cmmodels.Result = S_Dtr["NormExplain"].ToString();
                                    cmmodels.Proposal = S_Dtr["NormProposal"].ToString();
                                    cmmodels.NormName = S_Dtr["ExplainName"].ToString();
                                    cmmodels.NormSex = S_Dtr["NormSex"].ToString();
                                    cmmodels.NormStartAge = S_Dtr["NormStartAge"].ToString();
                                    cmmodels.NormEndAge = S_Dtr["NormEndAge"].ToString();
                                    cmlists.Add(cmmodels);
                                }

                            }
                            info.MinScore = mins;
                            info.MaxScore = maxs;
                         
                            info.CmmodelList = cmlists;

                        }
                        infoList.Add(info);
                    }
                    string SourceJson = new JavaScriptSerializer().Serialize(infoList);
                    context.Response.Write(SourceJson);

                }

            }
            catch
            {

            }


        }
        #region  把图表转换成图片
        /// <summary>
        /// 把图表转成图片
        /// </summary>
        /// <param name="context"></param>

        public void SaveImage(HttpContext context)
        {
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
        #endregion
        /// <summary>
        /// 根据量表编码查询量表对应的维度集合
        /// </summary>
        /// <returns></returns>
        public DataSet GetDimensionTepByACode(string Acode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {

                int AnswerID = 0;

                SourceTemp = MgrServices.PresentationService.GetDimensionTemp(Acode, AnswerID);
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
        public class GetViewModel
        {
            public string LoginName { get; set; }
            public string Name { get; set; }
            public string Sex { get; set; }
            public string U_Birthday { get; set; }
            public string D_name { get; set; }
            public string Amount_Name { get; set; }
            public string AmountIntroduce { get; set; }//指导语        
            public int AllCount { get; set; }
            public int Ages { get; set; }
        }
        public class GetViewModels
        {

            public string Answer_CreateTime { get; set; }//介绍时间

            public string score { get; set; }
            public string AnswerJson { get; set; }
        }

        public void deletes(HttpContext context)
        {
            bool result = false;
            try
            {
                string data = context.Request["chenum"];
                string name = context.Request["name"];
                string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                string[] d = data.Split(',');//得到当前的数组集合
                string[] names = name.Split(',');//得到当前的数组集合
                if (d.Length > 0)
                {
                    for (int i = 0; i < d.Length; i++)
                    {
                        CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                        model.RBTitle = "删除测评档案-" + names[i]; //标题
                        model.RBModularID = 37; //对应模块权限ID
                        model.RBTableName = "ArchivesMeasurement"; //删除的表名
                        model.RBFieldName = "ArchivesID"; //删除相对应字段的id
                        model.RBFieldValue = d[i].ToString();//删除列名的id
                        model.RBDeleteFieldName = "is_Delete"; //表的删除字段一般 某某某_Delete
                        model.RBDeleteTime = DateTime.Now;
                        model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                        model.EnterpriseCode = EnterpriseCode;
                        if (model.RBExcutePerson == null)
                            return;
                        result = Convert.ToBoolean(MgrServices.RecycleBinService.InsertRecycleBin(model));
                    }
                }
                context.Response.Write(result);
            }
            catch (Exception ex)
            {
                context.Response.Write(result);
            }
        }
        public class DimensionEntity
        {

            private string _WD_Name;
            /// <summary>
            /// 维度名称
            /// </summary>
            public string WD_Name
            {
                get { return _WD_Name; }
                set { _WD_Name = value; }
            }

            private string _D_Code;
            /// <summary>
            /// 维度编码
            /// </summary>
            public string D_Code
            {
                get { return _D_Code; }
                set { _D_Code = value; }
            }


            private double _Score;
            /// <summary>
            /// 维度得分
            /// </summary>
            public double Score
            {
                get { return _Score; }
                set { _Score = value; }
            }


            private string _result;
            /// <summary>
            /// 测评结果
            /// </summary>
            public string Result
            {
                get { return _result; }
                set { _result = value; }
            }

            private string _proposal;
            /// <summary>
            /// 测评建议
            /// </summary>
            public string Proposal
            {
                get { return _proposal; }
                set { _proposal = value; }
            }

            public string _json;
            /// <summary>
            /// 修改的维度的json
            /// </summary>
            public string Json
            {
                get { return _json; }
                set { _json = value; }
            }
            public string _newjson;
            public string NewJson
            {
                get { return _newjson; }
                set { _newjson = value; }
            }

            private string _NormName;
            /// <summary>
            /// 常模状态
            /// </summary>
            public string NormName
            {
                get { return _NormName; }
                set { _NormName = value; }
            }
            //private List<TZ> _TGList;
            ////题干编码集合
            //public List<TZ> TGList
            //{
            //    get { return _TGList; }
            //    set { _TGList = value; }
            //}
            private List<CMModel> _cmlist;
            public List<CMModel> CmmodelList
            {
                get { return _cmlist; }
                set { _cmlist = value; }
            }

            private double _conversionScore;//转化分
            /// <summary>
            /// 转化分
            /// </summary>
            public double ConversionScore
            {
                get { return _conversionScore; }
                set { _conversionScore = value; }
            }
            private int scoretype;
            public int ScoreType
            {
                get { return scoretype; }
                set { scoretype = value; }
            }

            private string _ConversionFormula;
            /// <summary>
            /// 转化公式
            /// </summary>
            public string ConversionFormula
            {
                get { return _ConversionFormula; }
                set { _ConversionFormula = value; }
            }


            private List<TZ> tz_List;
            /// <summary>
            /// 题支数据集合
            /// </summary>
            public List<TZ> Tz_List
            {
                get { return tz_List; }
                set { tz_List = value; }
            }
            private String allscore;
            public String Allscore
            {
                get { return allscore; }
                set { allscore = value; }
            }
            private int minscore;
            public int MinScore
            {
                get { return minscore; }
                set { minscore = value; }
            }
           private int maxscore;
           public int MaxScore
           {
               get { return maxscore; }
               set { maxscore = value; }
           }
           private string formulastr;
           public string FormulaStr
           {
               get { return formulastr; }
               set { formulastr = value; }
           }
           
        }

        public class TZ
        {

            private string _tz_Code;
            /// <summary>
            /// 题支编码
            /// </summary>
            public string Tz_Code
            {
                get { return _tz_Code; }
                set { _tz_Code = value; }
            }


            private string _tz_OperationNum;
            /// <summary>
            /// 题支选项编号
            /// </summary>
            public string Tz_OperationNum
            {
                get { return _tz_OperationNum; }
                set { _tz_OperationNum = value; }
            }

            private int _Sort;
            /// <summary>
            /// 排序位置（题干序号）
            /// </summary>
            public int Sort
            {
                get { return _Sort; }
                set { _Sort = value; }
            }
        }
        public class CMModel
        {
            public string _startscore;
            /// <summary>
            /// 维度得分
            /// </summary>
            public string StartScore
            {
                get { return _startscore; }
                set { _startscore = value; }
            }
            public string _endscore;
            /// <summary>
            /// 维度得分
            /// </summary>
            public string EndScore
            {
                get { return _endscore; }
                set { _endscore = value; }
            }
            private string _result;
            /// <summary>
            /// 测评结果
            /// </summary>
            public string Result
            {
                get { return _result; }
                set { _result = value; }
            }

            private string _proposal;
            /// <summary>
            /// 测评建议
            /// </summary>
            public string Proposal
            {
                get { return _proposal; }
                set { _proposal = value; }
            }
            private string _NormName;
            public string NormName
            {
                get { return _NormName; }
                set { _NormName = value; }
            }
            private string _normsex;
            public string NormSex
            {
                get { return _normsex; }
                set { _normsex = value; }
            }

            private string _normstartage;
            public string NormStartAge
            {
                get { return _normstartage; }
                set { _normstartage = value; }
            }
            private string _normendage;
            public string NormEndAge
            {
                get { return _normendage; }
                set { _normendage = value; }
            }
        }
    }
}