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
using CrisisInterfere.projrem;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.EvaluationFiles.Ajax
{
    /// <summary>
    /// SpecialViewFiles 的摘要说明
    /// </summary>
    public class SpecialViewFiles : IHttpHandler, IRequiresSessionState
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
                case "SaveImage":
                    SaveImage(context);
                    break;
                case "TSLBJson":
                    GetAnalyJson(context);
                    break;
            }
        }

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
        private void InitGetView(string LoginNames, string Amount_Code, string EnterpriseCode, int UserID, HttpContext context)
        {

            try
            {
                StringBuilder sb = new StringBuilder();
                List<GetViewModels> list = new List<GetViewModels>();

                DataSet SourceTemps = new DataSet();
                SourceTemps = MgrServices.DistributeRecordService.GetViewFiles(LoginNames, Amount_Code, EnterpriseCode, UserID);
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
                        //model.Amount_Guidance = dt.Rows[0]["Amount_Guidance"].ToString();
                        model.Amount_Guidance = dt.Rows[0]["AmountIntroduce"].ToString();
                        model.AllCount = dt.Rows.Count;
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
                            models.AnswerID = dt.Rows[i]["AnswerAdd_ID"].ToString();
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
        public void InitWDPages(string Acode, HttpContext context)
        {
            int types = Convert.ToInt32(Common.GetRequest("types"));
            if (types == 1)
            {
                TSLB1(Acode, context);
            }
            else if (types == 3)
            {
                TSLB3(Acode, context);//痴呆量表
            }
            else if (types == 4)
            {
                TSLB4(Acode, context);
            }
            else if (types == 6)
            {
                TSLB6(Acode, context);
            }
            else if (types == 8)
            {
                TSLB8(Acode, context);
            }
            else if (types == 9 || types == 901)//艾森克人格问卷
            {
                TSLB8(Acode, context);
            }
            else if (types == 11)
            {
                TSLB11(Acode, context);
            }

            else if (types == 13)
            {
                TSLB11(Acode, context);
            }
            else if (types == 802)
            {
                TSLB11(Acode, context);
            }
            else if (types == 21)
            {
                TSLB21(Acode,context);
            }
        }

        #region 特殊量表1
        private void TSLB1(string Acode, HttpContext context)
        {

            try
            {
                DataSet DataBycode = MgrServices.PersonalReportService.GetReportList(Acode, 0);
                DataTable DimensionTemp = new DataTable();
                List<CMModel> cmlists = new List<CMModel>();

                List<DimensionEntity> infoList = new List<DimensionEntity>();
                if (DataBycode != null && DataBycode.Tables.Count > 0)
                {
                    DimensionEntity info = new DimensionEntity();
                    DimensionTemp = DataBycode.Tables[1];//查找维度
                    DataRow[] WD_DTR;
                    if (DimensionTemp != null && DimensionTemp.Rows.Count > 0)
                    {
                        string AllScore = "";
                        WD_DTR = DimensionTemp.Select("  DimensionCode ='WD_14814462921013'");
                        if (WD_DTR != null && WD_DTR.Length > 0)
                        {

                            //int minvalue = 0;=                                                             
                            foreach (DataRow S_Dtr in WD_DTR)
                            {
                                CMModel cmmodels = new CMModel();
                                //算最大值最小值   
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

                    }
                    info.CmmodelList = cmlists;
                    infoList.Add(info);
                }
                string AnswerID = Common.GetRequest("AnswerId");
                string AR = CommonRepoert.GetAnswerRecord(AnswerID);
                string json = JsonConvert.SerializeObject(infoList);
                StringBuilder strSql = new StringBuilder();
                strSql.Append("{");
                strSql.Append("'AnswerR':null,");
                strSql.Append("'datas':" + json);
                strSql.Append("}");
                context.Response.Write(strSql.ToString());

            }
            catch
            {
                context.Response.Write(null);
            }
        }
        #endregion
        #region 特殊量表3
        //痴呆简易量表
        public void TSLB3(string Acode, HttpContext context)
        {
            try
            {
                DimensionEntity info = new DimensionEntity();
                List<DimensionEntity> infoList = new List<DimensionEntity>();
                string Finalscore = "";//最后的得分表示图表最上面的线
                int mins = 0;
                int maxs = 30;
                DataSet SourceTemp = new DataSet();

                string ScoresA = "";
                string AnswerID = Common.GetRequest("answer_id");
                string AR = CommonRepoert.GetAnswerRecordA(AnswerID, out ScoresA);


                List<string> NumberR = new List<string>();//作答记录
                if (Acode == "LB_14809941842260")
                {
                    info.Score = Convert.ToDouble(ScoresA);
                    info.Result = "若未接受过教育，分数低于16分，表明出现痴呆征兆，应引起注意；小学文化（教育年限≤6年），分数低于19分，表明出现痴呆征兆，应引起注意；中学或以上文化（教育年限＞6年）；分数低于22分，表明出现痴呆征兆，应引起注意。";

                    //状态              
                    info.NormName = "出现痴呆征兆/无痴呆征兆";
                    infoList.Add(info);
                }
                else if (Acode == "LB_14811084564180")
                {
                    info.Score = Convert.ToDouble(ScoresA);
                    info.Result = "以上问题的受测者若为文盲分数低于17分，表明出现智力状态异常征兆，应引起注意；以上问题的受测者若为小学文化（教育年限≤6年），分数低于20分，表明出现智力状态异常征兆，应引起注意；以上问题测试者若为中学或以上文化（教育年限＞6年）；分数低于24分，表明出现智力状态异常征兆，应引起注意。";

                    //状态              
                    info.NormName = "出现智力状态异常征兆/无智力状态异常";
                    infoList.Add(info);
                }
                else if (Acode == "LB_14810118744850")
                {
                    info.Score = Convert.ToDouble(ScoresA);
                    info.Result = "以上问题的受测者若为文盲分数低于16分，表明出现痴呆征兆，应引起注意；以上问题的受测者若为小学文化（教育年限≤6年），分数低于20分，表明出现痴呆征兆，应引起注意；以上问题测试者若为中学或以上文化（教育年限＞6年）；分数低于24分，表明出现痴呆征兆，应引起注意。";

                    //状态              
                    info.NormName = "出现痴呆征兆/无痴呆征兆";
                    infoList.Add(info);
                }


                //获取作答记录
                //在我的测验里面做一个我的作答记录



                string SourceJson = new JavaScriptSerializer().Serialize(infoList);

                DataTable PrAdd = new DataTable();
                if (SourceTemp != null && SourceTemp.Tables.Count > 0)
                {
                    PrAdd = SourceTemp.Tables[3];
                }
                string json = "";
                string Newjson = "";
                if (PrAdd.Rows.Count > 0)
                {
                    json = PrAdd.Rows[0]["PRAdd_Dimension"].ToString();
                    Newjson = PrAdd.Rows[0]["PRAdd_NewAdd"].ToString();

                }




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
                strSql.Append("'Minjson':" + mins + ",");
                strSql.Append("'Maxjson':" + maxs + ",");

                if (AR != null && AR != "")
                {
                    strSql.Append("'AnswerR':" + AR + ",");
                }
                else
                {
                    strSql.Append("'AnswerR':null,");
                }

                strSql.Append("'datas':" + SourceJson);
                strSql.Append("}");
                context.Response.Write(strSql.ToString());



            }
            catch
            {

            }
        }
        #endregion

        #region 特殊量表4
        public void TSLB4(string Acode, HttpContext context)
        {
            try
            {
                DimensionEntity info = new DimensionEntity();
                List<DimensionEntity> infoList = new List<DimensionEntity>();
                string Finalscore = "";//最后的得分表示图表最上面的线
                int maxs = 0;
                int mins = 30;
                DataSet SourceTemp = new DataSet();

                List<string> NumberR = new List<string>();//作答记录
                info.Result = " 若您的心理年龄小于您的生理年龄，可能呈现出不协调的情况，主要表现为：有一些行为或者表达方式和年龄较小的同学比较相像，比如注意力集中的时间较短，和他人的意见不一致时会立即苦恼等；学习成绩有时会跟不上老师的教学进度；难以适应学校的规则等。";
                info.Proposal = "“心理年龄”只不过是一种象征的说法，随着人的不断努力，它可以得到调整和优化。一般认为一个人的心理特点如果严重偏离自己所属年龄，往往都有可能是心理不健康的表现。建议您可以多和父母或老师进行沟通，学习改善自己行为或表达方式的方法，比如参加一些训练，多和同龄同学交流，有助于更好地理解自己的状态，进而得到提高。";
                //状态              
                info.NormName = "有痴呆征兆";
                infoList.Add(info);
                DimensionEntity info02 = new DimensionEntity();
                info02.Result = "  若您的心理年龄和您的生理年龄相符。主要表现为：言行和思考方式，表现出该年龄段都有的心理特点，跟同龄的大多数人相符。";
                info02.Proposal = "心理年龄和生理年龄基本符合，是一种心理健康的表现，建议您继续保持当前的心理状态。";
                //状态              
                info.NormName = "有痴呆征兆";
                infoList.Add(info02);
                DimensionEntity info03 = new DimensionEntity();
                info03.Result = "   若您的心理年龄大于您的生理年龄，可能会表现为：思考的问题较多，为人处世相比同年龄段的人要成熟，喜欢回忆过去，很难与同年龄的同学有共同语言与相互理解的体验。";
                info03.Proposal = " 心理年龄的高低，和一个人的遗传、性格、经历、环境等等因素密切相关，甚至受到近期的心情等多变因素的影响，并非病态，心理年龄远大于实际年龄的人，会很难与同年龄的人有相互的理解与共同的语言，建议您多与同龄人交流，积极参与同龄人的活动，多了解并融入同龄人的的生活习惯，有助于帮助您减少内心的孤独感以及不舒适的感觉，更好地适应学习和社会生活。";
                //状态              
                info.NormName = "有痴呆征兆";
                infoList.Add(info03);
                //获取作答记录
                //在我的测验里面做一个我的作答记录



                string ScoresA = context.Response.Cookies["ScoresA"].Value;
                if (ScoresA != null && ScoresA != "")
                {
                    info.Score = Convert.ToDouble(ScoresA);
                }
                string Numbers = "";

                DataTable PrAdd = new DataTable();
                if (SourceTemp != null && SourceTemp.Tables.Count > 0)
                {

                    PrAdd = SourceTemp.Tables[3];
                }
                string json = "";
                string Newjson = "";
                if (PrAdd.Rows.Count > 0)
                {
                    json = PrAdd.Rows[0]["PRAdd_Dimension"].ToString();
                    Newjson = PrAdd.Rows[0]["PRAdd_NewAdd"].ToString();

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
                strSql.Append("'Minjson':" + mins + ",");
                strSql.Append("'Maxjson':" + maxs + ",");


                strSql.Append("'AnswerR':" + AR + ",");

                strSql.Append("'datas':" + SourceJson);
                strSql.Append("}");
                context.Response.Write(strSql.ToString());

            }
            catch
            {

            }
        }
        #endregion
        # region 特殊量表6
        public void TSLB6(string Acode, HttpContext context)
        {
            try
            {
                int maxs = 0;
                int mins = 0;

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
                                DataTable dt = MgrServices.PresentationService.GetSingleBySbjCodeAndOptCode(item.Key, item.Value);
                                _Score += Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  
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
        #endregion
        #region 特殊量表8
        public void TSLB8(string Acode, HttpContext context)
        {
            try
            {
                string Finalscore = "";//最后的得分表示图表最上面的线
                int maxs = 0;
                int mins = 0;

                string Rsource = "";
                string ConversionFormula = "";
                List<HLDModel> HLDList = new List<HLDModel>();
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
                                DataTable dt = MgrServices.PresentationService.GetSingleBySbjCodeAndOptCode(item.Key, item.Value);
                                _Score += Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  
                                if (ss == 1)
                                {
                                    //Numbers = dt.Rows[0]["OperationNum"].ToString();
                                    //NumberR.Add(Numbers);
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

                        int RLength = 0;
                        if (OperationTemp != null && OperationTemp.Rows.Count > 0)
                        {
                            info.Score = _Score;
                            info.ScoreType = ScoringMode;
                            HLDModel hldmodel = new HLDModel();

                            if (info.WD_Name.Contains("R"))
                            {
                                hldmodel.HLDCode = "R";
                                hldmodel.HLDname = "现实" + info.Score + "%";
                                hldmodel.HLDvalues = info.Score;
                                HLDList.Add(hldmodel);
                            }
                            else if (info.WD_Name.Contains("I"))
                            {
                                hldmodel.HLDCode = "I";
                                hldmodel.HLDname = "探索" + info.Score + "%";
                                hldmodel.HLDvalues = info.Score;
                                HLDList.Add(hldmodel);
                            }
                            else if (info.WD_Name.Contains("A"))
                            {
                                hldmodel.HLDCode = "A";
                                hldmodel.HLDname = "艺术" + info.Score + "%";
                                hldmodel.HLDvalues = info.Score;
                                HLDList.Add(hldmodel);
                            }
                            else if (info.WD_Name.Contains("S"))
                            {
                                hldmodel.HLDCode = "S";
                                hldmodel.HLDname = "社会" + info.Score + "%";
                                hldmodel.HLDvalues = info.Score;
                                HLDList.Add(hldmodel);
                            }
                            else if (info.WD_Name.Contains("E"))
                            {
                                hldmodel.HLDCode = "E";
                                hldmodel.HLDname = "管理" + info.Score + "%";
                                hldmodel.HLDvalues = info.Score;
                                HLDList.Add(hldmodel);
                            }
                            else if (info.WD_Name.Contains("C"))
                            {
                                hldmodel.HLDCode = "C";
                                hldmodel.HLDname = "常规" + info.Score + "%";
                                hldmodel.HLDvalues = info.Score;
                                HLDList.Add(hldmodel);
                            }

                            if (ScoringMode.Equals(1))//等于1的时候是转化分
                            {
                                string FormulaStr = dtr["FormulaStr"] == DBNull.Value ? "" : dtr["FormulaStr"].ToString();
                                info.Formulas = FormulaStr;
                                if (FormulaStr.Trim() != "")
                                {
                                    FormulaStr = FormulaStr.Replace("Score", _Score.ToString());



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

                            string result_Con = "";//结果
                            string proposal_con = "";//建议
                            string _NormName = "";//常模状态名称
                            List<CMModel> cmlists = new List<CMModel>();
                            if (WD_DTR != null && WD_DTR.Length > 0)
                            {
                                List<E_CharEntity> Arr = new List<E_CharEntity>();
                                E_CharEntity infos = new E_CharEntity();
                                //int minvalue = 0;=                                                             
                                foreach (DataRow S_Dtr in WD_DTR)
                                {
                                    CMModel cmmodels = new CMModel();
                                    //算最大值最小值
                                    //minvalue = Convert.ToInt32(S_Dtr["StartFraction"]);//原始分                               
                                    allscores += S_Dtr["StartFraction"] + "," + S_Dtr["EndFraction"] + ",";

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

                                strList.Add(allscores);

                            }
                            else
                            {
                                allscores += "0" + ",";
                                strList.Add(allscores);
                            }

                            if (allscores != null && allscores != "")//获取维度的分值范围
                            {
                                allscores = allscores.Substring(0, allscores.Length - 1);
                            }
                            int Lengths = allscores.Split(',').Length; ;

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
                    if (PrAdd.Rows.Count > 0)
                    {
                        json = PrAdd.Rows[0]["PRAdd_Dimension"].ToString();
                        Newjson = PrAdd.Rows[0]["PRAdd_NewAdd"].ToString();

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
                    string ConversionFormulas = new JavaScriptSerializer().Serialize(HLDList);
                    strSql.Append("'Minjson':" + mins + ",");
                    strSql.Append("'Maxjson':" + maxs + ",");
                    strSql.Append("'MaxminScore':" + ConversionFormulas + ",");
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
        #endregion
        #region 特殊量表11
        public void TSLB11(string Acode, HttpContext context)
        {
            try
            {
                string Finalscore = "";//最后的得分表示图表最上面的线
                int maxs = 0;
                int mins = 0;

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
                                DataTable dt = MgrServices.PresentationService.GetSingleBySbjCodeAndOptCode(item.Key, item.Value);
                                _Score += Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  
                                if (ss == 1)
                                {
                                    //Numbers = dt.Rows[0]["OperationNum"].ToString();
                                    //NumberR.Add(Numbers);
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

                        int RLength = 0;
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

                            string result_Con = "";//结果
                            string proposal_con = "";//建议
                            string _NormName = "";//常模状态名称
                            List<CMModel> cmlists = new List<CMModel>();
                            if (WD_DTR != null && WD_DTR.Length > 0)
                            {
                                List<E_CharEntity> Arr = new List<E_CharEntity>();
                                E_CharEntity infos = new E_CharEntity();
                                //int minvalue = 0;=                                                             
                                foreach (DataRow S_Dtr in WD_DTR)
                                {
                                    CMModel cmmodels = new CMModel();
                                    //算最大值最小值
                                    //minvalue = Convert.ToInt32(S_Dtr["StartFraction"]);//原始分                               
                                    allscores += S_Dtr["StartFraction"] + "," + S_Dtr["EndFraction"] + ",";

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

                                strList.Add(allscores);

                            }
                            else
                            {
                                allscores += "0" + ",";
                                strList.Add(allscores);
                            }

                            if (allscores != null && allscores != "")//获取维度的分值范围
                            {
                                allscores = allscores.Substring(0, allscores.Length - 1);
                            }
                            int Lengths = allscores.Split(',').Length; ;

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
                    if (PrAdd.Rows.Count > 0)
                    {
                        json = PrAdd.Rows[0]["PRAdd_Dimension"].ToString();
                        Newjson = PrAdd.Rows[0]["PRAdd_NewAdd"].ToString();

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
                    strSql.Append("'Minjson':" + mins + ",");
                    strSql.Append("'Maxjson':" + maxs + ",");

                    //strSql.Append("'AS':[" + Finalscore + "],");
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
        #endregion

        #region 特殊量表21
        public void TSLB21(string Acode, HttpContext context)
        {
            try
            {
                string Finalscore = "";//最后的得分表示图表最上面的线
                int maxs = 0;
                int mins = 0;
                double TGNumber3 = 0;
                double TGNumber4 = 0;
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
                                DataTable dt = MgrServices.PresentationService.GetSingleBySbjCodeAndOptCode(item.Key, item.Value);
                               
                                if (info.D_Code == "WD_14963919010893")//维度三
                                {
                                    if (item.Key == "TG_14963918652662")
                                    {
                                        TGNumber3 =  Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  ;
                                    }
                                    else if (item.Key == "TG_14963918652571")
                                    {
                                        TGNumber4 = _Score += Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  ;
                                        _Score = TGNumber3 / TGNumber4;//题支三除以体支四
                                    }
                                    else
                                    {
                                        _Score += Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  
                                    }
                                }
                                else
                                {
                                    _Score += Convert.ToInt32(dt.Rows[0]["OperationFraction"]);//分数累加  
                                }
                                if (ss == 1)
                                {
                                    //Numbers = dt.Rows[0]["OperationNum"].ToString();
                                    //NumberR.Add(Numbers);
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

                        int RLength = 0;
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

                            string result_Con = "";//结果
                            string proposal_con = "";//建议
                            string _NormName = "";//常模状态名称
                            List<CMModel> cmlists = new List<CMModel>();
                            if (WD_DTR != null && WD_DTR.Length > 0)
                            {
                                List<E_CharEntity> Arr = new List<E_CharEntity>();
                                E_CharEntity infos = new E_CharEntity();
                                //int minvalue = 0;=                                                             
                                foreach (DataRow S_Dtr in WD_DTR)
                                {
                                    CMModel cmmodels = new CMModel();
                                    //算最大值最小值
                                    //minvalue = Convert.ToInt32(S_Dtr["StartFraction"]);//原始分                               
                                    allscores += S_Dtr["StartFraction"] + "," + S_Dtr["EndFraction"] + ",";

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

                                strList.Add(allscores);

                            }
                            else
                            {
                                allscores += "0" + ",";
                                strList.Add(allscores);
                            }

                            if (allscores != null && allscores != "")//获取维度的分值范围
                            {
                                allscores = allscores.Substring(0, allscores.Length - 1);
                            }
                            int Lengths = allscores.Split(',').Length; ;

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
                    if (PrAdd.Rows.Count > 0)
                    {
                        json = PrAdd.Rows[0]["PRAdd_Dimension"].ToString();
                        Newjson = PrAdd.Rows[0]["PRAdd_NewAdd"].ToString();

                    }
                    string SourceJson = new JavaScriptSerializer().Serialize(infoList);
                    string AR = new JavaScriptSerializer().Serialize(NumberR);

                    StringBuilder strSql = new StringBuilder();

                    context.Response.Write(SourceJson);

                }

            }
            catch
            {

            }

        }
        #endregion
        /// <summary>
        /// 获取导入模板里面的json
        /// </summary>
        /// <param name="context"></param>
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
                string TSLBType = Common.GetRequest("TSLBType");
                SourceTemp = MgrServices.StatisticalService.GetAnalyBaseTemp(TSLBType);
            }
            catch
            {

            }
            return SourceTemp;
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

                SourceTemp = MgrServices.PresentationService.GetDimensionTemp(Acode, AnswerID);
            }
            catch
            {
            }
            return SourceTemp;
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
        public class GetViewModel
        {
            public string LoginName { get; set; }
            public string Name { get; set; }
            public string Sex { get; set; }
            public string U_Birthday { get; set; }
            public string D_name { get; set; }
            public string Amount_Name { get; set; }
            public string Amount_Guidance { get; set; }//指导语        
            public int AllCount { get; set; }
            public int Ages { get; set; }
        }
        public class GetViewModels
        {

            public string Answer_CreateTime { get; set; }//介绍时间

            public string score { get; set; }
            public string AnswerJson { get; set; }
            public string AnswerID { get; set; }
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
            private int scoretype;
            public int ScoreType
            {
                get { return scoretype; }
                set { scoretype = value; }
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
        public class HLDModel
        {
            public string HLDname { get; set; }
            public string HLDCode { get; set; }
            public double HLDvalues { get; set; }
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