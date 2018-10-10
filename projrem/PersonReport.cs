using BR_Service;
using MyExection;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.FunctionModular.HeartEvaluation.Ajax;
using CrisisInterfere.FunctionModular.PersonalReport.Ajax;
using CrisisInterfere.PersonalReportService;

namespace CrisisInterfere.projrem
{
    [DataContract]
    public class PersonReport
    {

        /// <summary>
        /// 生成报告
        /// </summary>
        public PersonReport(string A_code, string AnswerJson, string Record, string AName, int allscore)
        {
            try
            {
                Dictionary<string, double> scoreDic;//分数字典： key：题支，value：题支分数
                string SourceJson = "";
                int maxs = 0;
                int mins = 0;
                double TGNumber3 = 0;
                double TGNumber4 = 0;
                List<string> strList = new List<string>();//往里面添加分值范围                        
                DataSet SourceTemp = new DataSet();
                SourceTemp = GetDimensionTepByACode(A_code);
                DataTable OperationTemp = new DataTable();
                DataTable DimensionTemp = new DataTable();
                if (SourceTemp != null && SourceTemp.Tables.Count > 0)
                {
                    OperationTemp = SourceTemp.Tables[0]; //查找题支
                    DimensionTemp = SourceTemp.Tables[1];//查找维度
                    //ResultTemp = SourceTemp.Tables[2];//查找解释说明                  
                }
                int ScoringMode = 0;//计分方式参数 0：:原始计分  1：:转化计分

                int indexs = 0;
                Dictionary<string, string> answerRecordDic = JsonConvert.DeserializeObject<Dictionary<string, string>>(AnswerJson);
                System.Data.DataTable scoreTable = MgrServices.GroupReportService.GetScoreTableByAmount_Code(A_code);
                scoreDic = scoreTable.AsEnumerable().Select(x => new { OperationCode = x["OperationCode"].ToString(), OperationFraction = x["OperationFraction"].ToDouble() })
              .ToDictionary(k => k.OperationCode, v => v.OperationFraction);
                if (DimensionTemp != null && DimensionTemp.Rows.Count > 0)
                {
                    DimensionEntity info = new DimensionEntity();
                    DimensionEntitys = new List<DimensionEntity>();

                    foreach (DataRow dtr in DimensionTemp.Rows)
                    {
                        indexs++;

                        double _Score = 0;

                        ScoringMode = dtr["ScoringMode"] == DBNull.Value ? 0 : Convert.ToInt32(dtr["ScoringMode"].ToString());
                        info = new DimensionEntity();
                        info.D_Code = dtr["DimensionCode"].ToString();//得到题干的编码
                        var subjectCodes = MgrServices.GroupReportService.GetSubjectCodeByDimensionCode(info.D_Code);//根据维度获取题干Code
                        foreach (var item in answerRecordDic)
                        {
                            //判断出当前所有题干属于当前维度Code的题干
                            if (subjectCodes.Contains(item.Key))
                            {
                                //DataTable dt = MgrServices.PresentationService.GetSingleBySbjCodeAndOptCode(item.Key, item.Value);
                                if (info.D_Code == "WD_14963919010893")//维度三
                                {
                                    if (item.Key == "TG_14963918652662")
                                    {
                                        TGNumber3 = scoreDic[item.Value];
                                    }
                                    else if (item.Key == "TG_14963918652571")
                                    {
                                        TGNumber4 = scoreDic[item.Value];
                                        float numberf=float.Parse((TGNumber3 / TGNumber4).ToString());
                                        _Score = double.Parse(numberf.ToString("F2"));//题支三除以体支四
                                    
                                    }
                                    else
                                    {
                                        _Score += scoreDic[item.Value];//分数累加  
                                    }
                                }
                                else
                                {
                                    _Score += scoreDic[item.Value];//分数累加  
                                }


                            }
                        }
                        info.WD_Name = dtr["DimensionName"].ToString();
                        DataRow[] WD_DTR;
                        DataTable WdMaxmin = new DataTable();//根据维度求最大值最小值
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


                        if (OperationTemp != null && OperationTemp.Rows.Count > 0)
                        {
                            info.Score = _Score;
                            info.scoretype = ScoringMode;
                            if (ScoringMode.Equals(1))//等于1的时候是转化分
                            {
                                string FormulaStr = dtr["FormulaStr"] == DBNull.Value ? "" : dtr["FormulaStr"].ToString();
                                info.Formulas = FormulaStr;
                                if (FormulaStr.Trim() != "")
                                {
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

                        }
                        if (A_code == "LB_14824009961900")//生活事件
                        {
                            info.Score = Convert.ToDouble(allscore);
                        }

                        info.AName = AName;
                        info.Acodes = A_code;
                        DimensionEntitys.Add(info);
                    }
                    UserInfo usermodel = new UserInfo();
                    UserINfos = new List<UserInfo>();
                    usermodel.MaxValue = maxs;
                    usermodel.MinValue = mins;
                    usermodel.AnswerRecord = Record;
                    UserINfos.Add(usermodel);


                }

            }
            catch (Exception ex)
            {

                throw new CustomException(ex.Message, " public PersonReport(string A_code, string AnswerJson, string Record, string AName)", "报告提交的时候插入报告"); ;
            }

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

        /// <summary>
        /// 维度的详细信息
        /// </summary>
        public class DimensionEntity
        {
            /// <summary>
            /// 维度名称
            /// </summary>
            public string WD_Name { get; set; }

            /// <summary>
            /// 维度编码
            /// </summary>
            public string D_Code { get; set; }
            /// <summary>
            /// 维度得分-原始分
            /// </summary>
            public double Score;
            public List<CMModel> CMlist { get; set; }

            /// <summary>
            /// 常模状态
            /// </summary>
            public string _NormName { get; set; }
            /// <summary>
            /// 转化分
            /// </summary>
            public double ConversionScore { get; set; }//转化分

            /// <summary>
            /// 转化公式
            /// </summary>
            public string ConversionFormula { get; set; }

            public int scoretype { get; set; }

            public string Rdeor { get; set; }

            public string Formulas { get; set; }
            public string AName { get; set; }
            public string Acodes { get; set; }

        }
        public class UserInfo
        {
            //public string UName { get; set; }
            //public string Sex { get; set; }
            //public string BirthDay { get; set; }
            //public string AnswerCode { get; set; }
            //public string Datatime { get; set; }
            public double MaxValue { get; set; }
            public double MinValue { get; set; }
            public string AnswerRecord { get; set; }
        }
        [DataMember]
        public List<UserInfo> UserINfos { get; set; }
        [DataMember]
        public List<DimensionEntity> DimensionEntitys { get; set; }
    }
}