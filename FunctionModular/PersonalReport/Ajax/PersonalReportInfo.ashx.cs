using BR_Service;
using CalcExpression;
using iTextSharp.text.pdf;
using Newtonsoft.Json;
using Svg;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using CrisisInterfere.PersonalReportService;
using CrisisInterfere.projrem;
namespace CrisisInterfere.FunctionModular.PersonalReport.Ajax
{
    /// <summary>
    /// PersonalReportInfo 的摘要说明
    /// </summary>
    public class PersonalReportInfo : IHttpHandler, IRequiresSessionState
    {
        RedisHelper redisContext = new RedisHelper(true);
        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            string remark = Common.GetRequest("Remark");
            int CreateUID = 0;
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            CreateUID = Convert.ToInt32(_uID);
            switch (remark)
            {
                case "InitPages":
                    InitPages(context);
                    break;
                case "InitWDPages":
                    InitWDPages(context);
                    break;
                case "SaveImage":
                    SaveImage(context);
                    break;
                case "RInsert":
                    context.Response.Write(RInsert(CreateUID));
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
        public void InitPages(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            SourceTemp = GetAmountTempByCode();
            if (SourceTemp != null && SourceTemp.Rows.Count > 0)
            {
                string AmountInfo = "";
                string A_Soure = SourceTemp.Rows[0]["Amount_Source"] == DBNull.Value || SourceTemp.Rows[0]["Amount_Source"].ToString() == "" ? "0" : SourceTemp.Rows[0]["Amount_Source"].ToString();
                switch (A_Soure)
                {
                    case "1":
                        AmountInfo = SourceTemp.Rows[0]["AmountIntroduce"].ToString();//从授权平台取的量表介绍
                        break;
                    case "2":
                        AmountInfo = SourceTemp.Rows[0]["Amount_Marks"].ToString();
                        break;
                    case "3":
                        AmountInfo = SourceTemp.Rows[0]["Amount_Marks"].ToString();//从量表的表里取的量表介绍
                        break;

                }
                string Answertime = DateTime.Parse(SourceTemp.Rows[0]["Answer_CreateTime"].ToString()).ToString("yyyy-MM-dd");

                String[] arr ={
                                  SourceTemp.Rows[0]["AnswerAdd_ID"].ToString(), //回答ID0
                                  SourceTemp.Rows[0]["AnswerAdd_Record"].ToString(), //答题记录1
                                  //SourceTemp.Rows[0]["AnswerAdd_Code"].ToString(), //答题编码2
                                  SourceTemp.Rows[0]["U_LoginName"].ToString(),
                                  SourceTemp.Rows[0]["Answer_StartTimer"].ToString(), //答题开始时间3
                                  SourceTemp.Rows[0]["Answer_CreateTime"].ToString(), //答题结束时间4
                                  SourceTemp.Rows[0]["AnswerMin_Time"].ToString(), //答题标准时间最小5
                                  SourceTemp.Rows[0]["AnswerMax_Time"].ToString(), //答题标准时间最大6
                                  AmountInfo, //量表介绍 -修改2017.4.10
                                  SourceTemp.Rows[0]["Amount_Code"].ToString(), //量表编码        8
                                  SourceTemp.Rows[0]["Amount_SubjectNum"].ToString(),//量表题干数量9
                                  SourceTemp.Rows[0]["Amount_DisplayName"].ToString(),//量表显示名称10
                                  SourceTemp.Rows[0]["U_Name"
                                  
                                  
                                  ].ToString(), //量表介绍   11
                                  SourceTemp.Rows[0]["U_Sex"].ToString(), //量表编码 12       
                                  SourceTemp.Rows[0]["U_Birthday"].ToString(),//量表题干数量13
                                  SourceTemp.Rows[0]["U_Age"].ToString(),//年龄14
                                  SourceTemp.Rows[0]["AnswerAdd_score"].ToString(),//15
                                   Answertime
                                  
                                 };
                string SourceJson = new JavaScriptSerializer().Serialize(arr);
                context.Response.Write(SourceJson);
            }
            else
            {
                context.Response.Write("");
            }


        }

        public DataTable GetAmountTempByCode()
        {
            DataTable sourceTemp = new DataTable();
            try
            {
                int answerID = Convert.ToInt32(Common.GetRequest("A_ID"));
                //sourceTemp = redisContext.GetMemByDataTable(answerID.ToString());
                //if (sourceTemp == null)
                //{
                //    sourceTemp = MgrServices.PresentationService.GetAnswerTemp(answerID);
                //    redisContext.SetMemByDataTable(answerID.ToString(), sourceTemp);

                //}
                sourceTemp = MgrServices.PresentationService.GetAnswerTemp(answerID);
                return sourceTemp;

            }
            catch
            {

            }
            return sourceTemp;
        }


        /// <summary>
        /// 加载测试结果维度解释明细
        /// </summary>
        public void InitWDPages(HttpContext context)
        {
            try
            {
                int maxs = 0;
                int mins = 0;
                string Acode = Common.GetRequest("A_code");
                Dictionary<string, double> scoreDic;//分数字典： key：题支，value：题支分数
                string Rsource = "";
                List<string> strList = new List<string>();//往里面添加分值范围
                int ss = 0;
                List<string> NumberR = new List<string>();
                DataSet SourceTemp = new DataSet();
                SourceTemp = GetDimensionTepByACode(Acode);
                DataTable OperationTemp = new DataTable();
                DataTable DimensionTemp = new DataTable();
                DataTable ResultTemp = new DataTable();
                DataTable PrAdd = new DataTable();
                if (SourceTemp != null && SourceTemp.Tables.Count > 0)
                {
                    OperationTemp = SourceTemp.Tables[0];
                    DimensionTemp = SourceTemp.Tables[1];
                    ResultTemp = SourceTemp.Tables[2];
                    PrAdd = SourceTemp.Tables[3];
                }
                int ScoringMode = 0;//计分方式参数 0：:原始计分  1：:转化计分

                string AnswerJson = Common.GetRequest("An_json");
                int indexs = 0;
                string Answers = "";
                Dictionary<string, string> answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(AnswerJson);

                System.Data.DataTable scoreTable = MgrServices.GroupReportService.GetScoreTableByAmount_Code(Acode);

                scoreDic = scoreTable.AsEnumerable().Select(x => new { OperationCode = x["OperationCode"].ToString(), OperationFraction = x["OperationFraction"].ToString() })
              .ToDictionary(k => k.OperationCode, v => double.Parse(v.OperationFraction));//获取该量表下所有题支的分数，key：题支code ；value：题支分数

                if (DimensionTemp != null && DimensionTemp.Rows.Count > 0)
                {
                    ss++;

                    DimensionEntity info = new DimensionEntity();
                    List<DimensionEntity> infoList = new List<DimensionEntity>();

                    foreach (DataRow dtr in DimensionTemp.Rows)
                    {
                        indexs++;
                        string allscores = "";//每个维度的最大值和最小值
                        double _Score = 0;

                        ScoringMode = dtr["ScoringMode"] == DBNull.Value ? 0 : Convert.ToInt32(dtr["ScoringMode"].ToString());
                        info = new DimensionEntity();
                        info.D_Code = dtr["DimensionCode"].ToString();//得到题干的编码
                        var subjectCodes = MgrServices.GroupReportService.GetSubjectCodeByDimensionCode(info.D_Code);//根据维度获取题干Code
                        foreach (var item in answerRecordDic)
                        {

                            if (Answers == null || Answers == "")
                            {
                                Answers = "'" + item.Value + "'";
                            }
                            else
                            {
                                Answers += "," + "'" + item.Value + "'";
                            }

                            //判断出当前所有题干属于当前维度Code的题干
                            if (subjectCodes.Contains(item.Key))
                            {
                                //DataTable dt = MgrServices.PresentationService.GetSingleBySbjCodeAndOptCode(item.Key, item.Value);
                                //_Score += Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  
                                _Score += scoreDic[item.Value];
                                if (ss == 1)
                                {
                                    if (Rsource == "" || Rsource == null)
                                    {
                                        Rsource += _Score;
                                    }
                                    else
                                    {
                                        Rsource += "," + _Score;
                                    }
                                }
                            }
                        }
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
                            info.Score = _Score;
                            info.ScoreType = ScoringMode;
                            if (ScoringMode.Equals(1))//等于1的时候是转化分
                            {
                                string FormulaStr = dtr["FormulaStr"] == DBNull.Value ? "" : dtr["FormulaStr"].ToString();
                                info.Formulas = FormulaStr;
                                if (FormulaStr.Trim() != "")
                                {
                                    //因为数据库中有大写有小写，所以全部替换一下
                                    //FormulaStr = FormulaStr.Replace("score", _Score.ToString());
                                    FormulaStr = FormulaStr.Replace("Score", _Score.ToString());
                                    info.ConversionFormula = FormulaStr;


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
                            string AllScore = "";
                            if (WD_DTR != null && WD_DTR.Length > 0)
                            {

                                List<E_CharEntity> Arr = new List<E_CharEntity>();
                                E_CharEntity infos = new E_CharEntity();
                                int WDcount = 0;
                                foreach (DataRow S_Dtr in WD_DTR)
                                {
                                    WDcount++;
                                    CMModel cmmodels = new CMModel();
                                    //算最大值最小值                                                           
                                    //allscores += S_Dtr["StartFraction"] + "," + S_Dtr["EndFraction"] + ",";                                 
                                    cmmodels.StartScore = S_Dtr["StartFraction"].ToString() + S_Dtr["First_Symbol"] + "Scores";
                                    cmmodels.EndScore = "Scores" + S_Dtr["Second_Symbol"] + S_Dtr["EndFraction"].ToString();
                                    cmmodels.Result = S_Dtr["NormExplain"].ToString();
                                    cmmodels.Proposal = S_Dtr["NormProposal"].ToString();
                                    cmmodels.NormName = S_Dtr["ExplainName"].ToString();
                                    cmmodels.NormSex = S_Dtr["NormSex"].ToString();
                                    cmmodels.NormStartAge = S_Dtr["NormStartAge"].ToString();
                                    cmmodels.NormEndAge = S_Dtr["NormEndAge"].ToString();
                                    cmmodels.CmendScore = S_Dtr["EndFraction"].ToString();
                                    cmmodels.CMstartScore = S_Dtr["StartFraction"].ToString();
                                    if (cmmodels.CmendScore != "99999")
                                    {
                                        if (AllScore == null || AllScore == "")
                                        {
                                            AllScore = cmmodels.CmendScore;
                                        }
                                        else
                                        {
                                            AllScore += "+" + cmmodels.CmendScore;
                                        }
                                    }
                                    else
                                    {
                                        if (AllScore == null || AllScore == "")
                                        {
                                            AllScore += "0";
                                        }
                                        else
                                        {
                                            AllScore += "+" + "0";
                                        }
                                    }
                                    cmlists.Add(cmmodels);

                                }
                            }
                            info.CMAllScore = AllScore;
                            info.CmmodelList = cmlists;
                        }
                        infoList.Add(info);
                    }

                    string Numbers = "";
                    DataTable dts = MgrServices.PresentationService.GetNumber(Answers);
                    if (dts.Rows.Count > 0)
                    {
                        for (int i = 0; i < dts.Rows.Count; i++)
                        {
                            Numbers = dts.Rows[i]["OperationNum"].ToString();
                            NumberR.Add(Numbers);
                        }

                    }
                    string json = "";
                    string Newjson = "";
                    int RoleType = 0;
                    if (PrAdd.Rows.Count > 0)
                    {
                        json = PrAdd.Rows[0]["PRAdd_Dimension"].ToString();
                        Newjson = PrAdd.Rows[0]["PRAdd_NewAdd"].ToString();
                        RoleType = Convert.ToInt32(PrAdd.Rows[0]["ReporType"].ToString());

                    }
                    string SourceJson = new JavaScriptSerializer().Serialize(infoList);
                    string AR = new JavaScriptSerializer().Serialize(NumberR);

                    StringBuilder strSql = new StringBuilder();
                    strSql.Append("{");
                    if (json != null && json != "")
                    {
                        strSql.Append("'OldJson':" + json + ",");
                    }
                    else
                    {
                        strSql.Append("'OldJson':null,");
                    }
                    if (Newjson != null && Newjson != "")
                    {
                        strSql.Append("'Newjson':" + Newjson + ",");
                    }
                    else
                    {
                        strSql.Append("'Newjson':null,");
                    }
                    strSql.Append("'RoleType':" + RoleType + ",");
                    strSql.Append("'Minjson':" + mins + ",");
                    strSql.Append("'Maxjson':" + maxs + ",");


                    strSql.Append("'AnswerR':" + AR + ",");
                    strSql.Append("'datas':" + SourceJson);
                    strSql.Append("}");
                    context.Response.Write(strSql.ToString());

                }

            }
            catch
            {

            }

        }
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
        public bool RInsert(int CreateUID)
        {
            R_ReportEntity entityInfo = new R_ReportEntity();
            entityInfo._reportjson = Common.GetRequest("Rjson");
            entityInfo._createuid = CreateUID;
            entityInfo._answeid = Convert.ToInt32(Common.GetRequest("AnswerID"));
            entityInfo._r_createdate = DateTime.Now;
            long ss = MgrServices.PersonalReportService.R_ReportInsert(entityInfo);
            if (ss != -1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary> 
        /// 由中序式转换成后序式，再用栈来进行计算 
        /// </summary> 
        /// <param name="expression">表达式</param> 
        /// <returns></returns> 
        public static float CalcByCalcParenthesesExpression(string expression)
        {
            string result = new CalcParenthesesExpression().CalculateParenthesesExpression(expression);
            return float.Parse(result);
        }



        protected void WriteFile(string errorMesg)
        {
            try
            {
                string Path = "D:/ExceptionLog/" + System.DateTime.Now.ToShortDateString().Replace("/", "-") + ".log";
                if (!System.IO.File.Exists(Path))
                {
                    System.IO.FileStream f = System.IO.File.Create(Path);
                    f.Close();
                }
                System.IO.StreamWriter f2 = new System.IO.StreamWriter(Path, true, System.Text.Encoding.GetEncoding("gb2312"));
                f2.WriteLine(errorMesg);
                f2.Close();
                f2.Dispose();
            }
            catch { }
        }

        /// <summary>
        /// 根据量表编码查询量表对应的维度集合
        /// </summary>
        /// <returns></returns>
        public DataSet GetDimensionTepByACode(string Acode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                //string Acode = Common.GetRequest("A_code");
                int AnswerID = 0;
                if (Common.GetRequest("AnswerId") != null && Common.GetRequest("AnswerId") != "")
                {
                    AnswerID = Convert.ToInt32(Common.GetRequest("AnswerId"));
                }
                else
                {
                    AnswerID = 0;
                }
                SourceTemp = MgrServices.PresentationService.GetDimensionTemp(Acode, AnswerID);
                //SourceTemp = redisContext.Get<DataSet>("wd" + AnswerID);
                //if (SourceTemp == null)
                //{
                //    SourceTemp = MgrServices.PresentationService.GetDimensionTemp(Acode, AnswerID);
                //    //redisContext.Set<DataSet>("wd" + AnswerID, SourceTemp);
                //}
                return SourceTemp;
            }
            catch
            {
            }
            return SourceTemp;
        }

        /// <summary>
        /// 根据量表编码查询量表信息
        /// </summary>
        /// <returns></returns>
        public DataTable GetAmountTemp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string A_Code = Common.GetRequest("A_code");
                SourceTemp = MgrServices.PresentationService.GetAmountTempByCode(A_Code);
            }
            catch
            {

            }
            return SourceTemp;

        }


        /// <summary>
        /// JSON反序列化
        /// </summary>
        public static T JsonDeserialize<T>(string jsonString)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));
            T obj = (T)ser.ReadObject(ms);
            return obj;
        }

    }
    public class RecordEntity
    {
        private string _TG_Code;
        /// <summary>
        /// 题干编码
        /// </summary>
        public string TG_Code
        {
            get { return _TG_Code; }
            set { _TG_Code = value; }
        }

        private string _TZ_Code;
        /// <summary>
        /// 题支编码
        /// </summary>
        public string TZ_Code
        {
            get { return _TZ_Code; }
            set { _TZ_Code = value; }
        }
    }

    /// <summary>
    /// 
    /// </summary>
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



        private List<CMModel> _cmlist;
        public List<CMModel> CmmodelList
        {
            get { return _cmlist; }
            set { _cmlist = value; }
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
        //public string NormName
        //{
        //    get { return _NormName; }
        //    set { _NormName = value; }
        //}
        //private List<TZ> _TGList;
        ////题干编码集合
        //public List<TZ> TGList
        //{
        //    get { return _TGList; }
        //    set { _TGList = value; }
        //}

        private double _conversionScore;//转化分
        /// <summary>
        /// 转化分
        /// </summary>
        public double ConversionScore
        {
            get { return _conversionScore; }
            set { _conversionScore = value; }
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
        private int scoretype;
        public int ScoreType
        {
            get { return scoretype; }
            set { scoretype = value; }
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

        public int scorelength;
        public int Scorelength
        {
            get { return scorelength; }
            set { scorelength = value; }
        }
        public string endscore;
        public string Endscore
        {
            get { return endscore; }
            set { endscore = value; }
        }
        public string rdeor;
        public string Rdeor
        {
            get { return rdeor; }
            set { rdeor = value; }
        }
        public int maxvalue;
        public int MaxValue
        {
            get { return maxvalue; }
            set { maxvalue = value; }
        }
        public int minvalue;
        public int MinValue
        {
            get { return minvalue; }
            set { minvalue = value; }
        }
        private string formulas;
        public string Formulas
        {
            get { return formulas; }
            set { formulas = value; }
        }
        private string cmallscore;
        public string CMAllScore
        {
            get { return cmallscore; }
            set { cmallscore = value; }

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


    public class OperationEntity
    {

        private string _OperationCode;
        /// <summary>
        /// 题支编码
        /// </summary>
        public string OperationCode
        {
            get { return _OperationCode; }
            set { _OperationCode = value; }
        }


        private string _OperationContent;
        /// <summary>
        /// 题支内容
        /// </summary>
        public string OperationContent
        {
            get { return _OperationContent; }
            set { _OperationContent = value; }
        }


        private float _OperationFraction;
        /// <summary>
        /// 题支分数
        /// </summary>
        public float OperationFraction
        {
            get { return _OperationFraction; }
            set { _OperationFraction = value; }
        }


        private string _SubjectCode;
        /// <summary>
        /// 题干编码
        /// </summary>
        public string SubjectCode
        {
            get { return _SubjectCode; }
            set { _SubjectCode = value; }
        }

        private string _Amount_Code;
        /// <summary>
        /// 量表编码
        /// </summary>
        public string Amount_Code
        {
            get { return _Amount_Code; }
            set { _Amount_Code = value; }
        }

    }




    /// <summary>
    /// 列表json数组
    /// </summary>
    public class E_CharEntity
    {

        private int[] _jsonArr;

        public int[] JsonArr
        {
            get { return _jsonArr; }
            set { _jsonArr = value; }
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
        private string cmendScore;
        public string CmendScore
        {
            get { return cmendScore; }
            set { cmendScore = value; }
        }
        private string cmstartScore;
        public string CMstartScore
        {
            get { return cmstartScore; }
            set { cmstartScore = value; }
        }


    }
}