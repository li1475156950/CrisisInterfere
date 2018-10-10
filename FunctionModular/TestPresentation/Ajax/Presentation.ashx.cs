using BR_Service;
using CalcExpression;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.TestPresentation.Ajax
{
    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-11-15
    /// 功能介绍：测评量表报告数据逻辑层
    /// Presentation 的摘要说明
    /// </summary>
    public class Presentation : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string remark = Common.GetRequest("Remark");
            switch (remark)
            {
                case "InitPages":
                    InitPages(context);
                    break;
                case "InitWDPages":
                    InitWDPages(context);
                    break;

            }
        }


        public void InitPages(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            SourceTemp = GetAmountTempByCode();
            if (SourceTemp != null && SourceTemp.Rows.Count > 0)
            {
                String[] arr ={
                                  SourceTemp.Rows[0]["AnswerAdd_ID"].ToString(), //回答ID
                                  SourceTemp.Rows[0]["AnswerAdd_Record"].ToString(), //答题记录
                                  SourceTemp.Rows[0]["AnswerAdd_Code"].ToString(), //答题编码
                                  SourceTemp.Rows[0]["Answer_StartTimer"].ToString(), //答题开始时间
                                  SourceTemp.Rows[0]["Answer_CreateTime"].ToString(), //答题结束时间
                                  SourceTemp.Rows[0]["AnswerMin_Time"].ToString(), //答题标准时间最小
                                  SourceTemp.Rows[0]["AnswerMax_Time"].ToString(), //答题标准时间最大
                                  SourceTemp.Rows[0]["Amount_Marks"].ToString(), //量表介绍   
                                  SourceTemp.Rows[0]["Amount_Code"].ToString(), //量表编码        
                                  SourceTemp.Rows[0]["Amount_SubjectNum"].ToString(),//量表题干数量
                                  SourceTemp.Rows[0]["Amount_DisplayName"].ToString(),//量表显示名称
                                  SourceTemp.Rows[0]["U_Name"].ToString(), //量表介绍   
                                  SourceTemp.Rows[0]["U_Sex"].ToString(), //量表编码        
                                  SourceTemp.Rows[0]["U_Birthday"].ToString(),//量表题干数量
                                  
                                  
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
                sourceTemp = MgrServices.PresentationService.GetAnswerTemp(answerID);

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
                string Finalscore = "";//最后的得分表示图表最上面的线
                int maxs = 0;
                int mins = 0;

                List<string> strList = new List<string>();//往里面添加分值范围
                int ss = 0;
              
                DataSet SourceTemp = new DataSet();
                SourceTemp = GetDimensionTepByACode();
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

                List<TZ> tzList = new List<TZ>();
                TZ _tz = new TZ();
                foreach (DataRow ODtr in OperationTemp.Rows)
                {
                    _tz = new TZ();
                    _tz.Tz_Code = ODtr["OperationCode"].ToString();
                    _tz.Tz_OperationNum = ODtr["OperationNum"].ToString();
                    if (ODtr["Sort"].ToString() != null && ODtr["Sort"].ToString() != "")
                    {
                        _tz.Sort = Convert.ToInt32(ODtr["Sort"].ToString());
                    }
                    tzList.Add(_tz);
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
                    ss++;
                    DimensionEntity info = new DimensionEntity();
                    List<DimensionEntity> infoList = new List<DimensionEntity>();
                    foreach (DataRow dtr in DimensionTemp.Rows)
                    {
                        
                        string allscores = "";//每个维度的最大值和最小值
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
                                if (ss != 1)
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

                                if (ss != 1)
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

                        int RLength = 0;
                        if (OperationTemp != null && OperationTemp.Rows.Count > 0)
                        {
                            DataRow[] SubDtr = OperationTemp.Select("DimensionCode='" + info.D_Code + "' ");
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
                            if (ScoringMode.Equals(1))//等于1的时候是转化分
                            {
                                string FormulaStr = dtr["FormulaStr"] == DBNull.Value ? "" : dtr["FormulaStr"].ToString();
                                if (FormulaStr.Trim() != "")
                                {
                                    FormulaStr = FormulaStr.Replace("Score", _Score.ToString());
                                    info.ConversionFormula = FormulaStr;
                                    if (Finalscore != "" && Finalscore != null)
                                    {
                                        Finalscore +=","+ FormulaStr ;
                                    }
                                    else
                                    {
                                        Finalscore += FormulaStr + ",";
                                    }                                   
                                    //info.ConversionScore = Convert.ToDouble(CalcByCalcParenthesesExpression(FormulaStr));//C#组内计算，比较耗服务器资源，还是换到客户端吧
                                  
                                }
                                else
                                {
                                    if (Finalscore != "" && Finalscore != null)
                                    {
                                        Finalscore += "," + _Score.ToString();
                                    }
                                    else
                                    {
                                        Finalscore += _Score.ToString() + ",";
                                    }
                                    info.ConversionFormula = _Score.ToString();
                                }

                            }
                            else
                            {
                                if (Finalscore != "" && Finalscore != null)
                                {
                                    Finalscore += "," + _Score.ToString();
                                }
                                else
                                {
                                    Finalscore += _Score.ToString();
                                }
                                info.ConversionFormula = _Score.ToString();
                            }

                            string result_Con = "";//结果
                            string proposal_con = "";//建议
                            string _NormName = "";//常模状态名称
                            
                            if (WD_DTR != null && WD_DTR.Length > 0)
                            {
                                                                                      
                                
                                List<E_CharEntity> Arr = new List<E_CharEntity>();
                                E_CharEntity infos = new E_CharEntity();
                                int minvalue = 0;
                                foreach (DataRow S_Dtr in WD_DTR)
                                {
                                   
                                    //算最大值最小值
                                    minvalue = Convert.ToInt32(S_Dtr["StartFraction"]);//原始分                               
                                    allscores += S_Dtr["StartFraction"] + "," + S_Dtr["EndFraction"] + ",";
                                    if (Convert.ToDouble(S_Dtr["StartFraction"]) <= _Score && Convert.ToDouble(S_Dtr["EndFraction"]) > _Score)
                                    {
                                       
                                        result_Con = S_Dtr["NormExplain"].ToString();
                                        proposal_con = S_Dtr["NormProposal"].ToString();
                                        _NormName = S_Dtr["ExplainName"].ToString();
                                        //break;
                                    }
                                    // info.JsonArr.ad

                                }
                               
                                strList.Add(allscores);

                            }
                            else
                            {
                                allscores += "0" + ",";
                                strList.Add(allscores);
                            }
                            if (PrAdd.Rows.Count > 0)
                            {
                                info.Json = PrAdd.Rows[0]["PRAdd_Dimension"].ToString();
                                info.NewJson = PrAdd.Rows[0]["PRAdd_NewAdd"].ToString();

                            }
                            if (allscores != null && allscores != "")//获取维度的分值范围
                            {
                                allscores = allscores.Substring(0, allscores.Length - 1);
                            }
                            int Lengths = allscores.Split(',').Length;;
                           
                            if (ss == 1)
                            {
                                RLength = Lengths;
                                info.scorelength = Lengths;
                            }
                            else
                            {
                                if (RLength > Lengths)
                                {
                                    info.Scorelength = RLength;
                                }
                                else
                                {
                                    info.Scorelength = Lengths;
                                }
                            }
                            info.endscore = allscores;
                            info.Result = result_Con;
                            info.Proposal = proposal_con;
                            info.NormName = _NormName;
                            info.Tz_List = tzList;
                        }
                        infoList.Add(info);
                    }
                    List<string> NstrList = new List<string>();
                    string Nstr = "";
                    for (int t = 0; t < info.Scorelength; t++)
                    {

                        Nstr = "";
                        for (int w = 0; w < strList.Count; w++)
                        {
                            if (Nstr == "")
                            {
                                string strv = strList[w].Split(',')[t];
                                if (!NstrList.Contains(strv))
                                {
                                    Nstr += strv ;
                                }

                            }
                            else
                            {
                                Nstr += "," + strList[w].Split(',')[t];

                            }

                        }
                        if(Nstr !=null && Nstr !="")
                        {
                            NstrList.Add(Nstr);
                        }
                       
                    }

                    List<string> ArrT = NstrList;
                    ArrT.Sort();
                    string Tubiao = "";

                    for (int i = 0; i < ArrT.Count; i++)
                    {
                        string sss = "";
                        sss = "[" + ArrT[i] + "]";
                       

                        Tubiao += sss + ":";

                    }
                    if (Tubiao != null && Tubiao != "")//获取维度的分值范围
                    {
                        Tubiao = Tubiao.Substring(0, Tubiao.Length - 1);
                    }
                    string SourceJson = new JavaScriptSerializer().Serialize(infoList);
                    string maxmin = mins + ":" + maxs + ":" + "10";
                     StringBuilder strSql = new StringBuilder();
                      strSql.Append("{");                                  
                   string[] array = Tubiao.Split(':');
                   strSql.Append("'minmaxs':'"+maxmin+"',");    
                  strSql.Append("'rdeor':[");
                  int Bcolor = 0;
            foreach (string i in array)
            {
                Bcolor++;
                strSql.Append("{");
                strSql.Append("'type':'hbar',");
                strSql.Append("'values':"+i+",");
                strSql.Append("'stack':1,");
                if (Bcolor==1)
                {
                    strSql.Append("'background-color':'#FFBB66',");
                }
                else if (Bcolor == 1)
                {
                    strSql.Append("'background-color':'#FF88C2',");
                }
                else if (Bcolor == 1)
                {
                    strSql.Append("'background-color':'#FFFF77',");
                }
                else if (Bcolor == 1)
                {
                    strSql.Append("'background-color':'#B4EEB4',");
                }
                else if (Bcolor == 1)
                {
                    strSql.Append("'background-color':'#8B3A3A',");
                }
              
                strSql.Append("'alpha':0.7,");
                strSql.Append("'hover-state':{'visible':false},");
                strSql.Append("'max-trackers':0");
                strSql.Append("}");
                strSql.Append(",");
               
            }           
            strSql.Append("{");
            strSql.Append("'type':'hbullet',");
            strSql.Append("'values':[" + Finalscore + "],");        
            strSql.Append("'background-color':'black',");
            strSql.Append("'stack':2,");                 
            strSql.Append("'font-color':'black'");             
            strSql.Append("}");
            strSql.Append(",");
            strSql.Append("],");
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
        public DataSet GetDimensionTepByACode()
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                string Acode = Common.GetRequest("A_code");
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
            }
            catch
            {
            }
            return SourceTemp;
        }






        ///// <summary>  
        ///// 将json数据转换成实体类     
        ///// </summary>  
        ///// <returns></returns>  
        //private static List<RecordEntity> getObjectByJson(string jsonString)
        //{
        //    // 实例化DataContractJsonSerializer对象，需要待序列化的对象类型  
        //    DataContractJsonSerializer serializer = new DataContractJsonSerializer(typeof(List<RecordEntity>));
        //    //把Json传入内存流中保存  
        //    jsonString = "[" + jsonString + "]";
        //    MemoryStream stream = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));
        //    // 使用ReadObject方法反序列化成对象  
        //    object ob = serializer.ReadObject(stream);
        //    List<RecordEntity> ls = (List<RecordEntity>)ob;
        //    return ls;
        //}

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
        public bool IsReusable
        {
            get
            {
                return false;
            }
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

    //public class TZ
    //{

    //    private string _TZ_Code;
    //    /// <summary>
    //    /// 题干编码
    //    /// </summary>
    //    public string TZ_Code
    //    {
    //        get { return _TZ_Code; }
    //        set { _TZ_Code = value; }
    //    }
    //}

    //public class AmountEntity
    //{
    //    private string _AmountName;


    //    private string _AmountDisName;


    //}


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
   
}