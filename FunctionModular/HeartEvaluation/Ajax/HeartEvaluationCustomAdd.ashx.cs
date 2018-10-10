using BR_Service;
using Newtonsoft.Json;
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
using CrisisInterfere.projrem;

namespace CrisisInterfere.FunctionModular.HeartEvaluation.Ajax
{
    /// <summary>
    /// HeartEvaluationCustomAdd 的摘要说明
    /// </summary>
    public class HeartEvaluationCustomAdd : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            context.Response.ContentType = "text/plain";
            string Remark = Common.GetRequest("Remark");
            switch (Remark)
            {
                case "CustomAdd":
                    CustomAddAmount(context);//添加量表描述
                    break;
                case "AmountType":
                    InitAmountType(context);
                    break;
                case "ItemEdit":
                    break;
                case "SaveSubject":
                    SaveSubject(context);
                    break;
                case "LoadSubject":
                    InitSubjectStr(context);//加载维度划分中的题干列表
                    break;
                case "GetCode":
                    TransformationCode(context);
                    break;
                case "SaveCombination":
                    SaveCombination(context);//保存维度组合
                    break;
                case "InitCT":
                    InitCombinationTree(context);//初始化组合列表
                    break;
                case "InitAD":
                    InitADSel(context);//初始化维度下拉列表
                    break;
                case "InitNorm"://初始化常模
                    InitNorm(context);
                    break;
                case "SaveScore":
                    SaveScore(context);
                    break;
                case "DelMessByWD"://删除维度和题干
                    DelMessageByWD(context);
                    break;
                case "DelSMessBySD":
                    DelSubject_RelationByD_Code(context);//删除维度和题干编码
                    break;
                case "SaveSet":
                    SaveSet(context);//保存量表常模关系
                    break;
                case "DelDN":
                    DisplayDN(context);
                    break;
                case "InitNW":
                    InitNW(context);
                    break;
                case "Del_NER":
                    Del_NER(context);
                    break;
                case "Add_NE":
                    Add_NE(context);
                    break;
                case "Add_NW":
                    Add_NW(context);
                    break;
                case "DelNWR":
                    DelNWR(context);
                    break;
                case "CheckAmountName":
                    CheckAmountName(context);
                    break;

            }
        }
        /// <summary>
        /// 自编量表添加
        /// </summary>
        /// <param name="context"></param>
        public void CustomAddAmount(HttpContext context)
        {
            try
            {
                string Amount_Name = Common.GetRequest("T_Name");//量表名称
                string Amount_DisplayName = Common.GetRequest("T_DisplayName");//显示名称
                int Amount_TypeID = Convert.ToInt32(Common.GetRequest("T_TypeID"));//量表类别ID
                string Amount_ApplyPeoples = Common.GetRequest("T_ApplyPeoples");//适用人群


                string _Start_Age = Common.GetRequest("T_StartPeoples");
                string _End_Age = Common.GetRequest("T_EndPeoples");


                string Amount_Marks = Common.GetRequest("T_Marks");//量表描述
                string Amount_Guidance = Common.GetRequest("T_Guidance");//指导语
                CrisisInterfere.AmountService.Amount_InfoEntity entityinfo = new AmountService.Amount_InfoEntity();
                entityinfo._amount_name = Amount_Name;
                entityinfo._amount_displayname = Amount_DisplayName;
                entityinfo._amount_typeid = Amount_TypeID;
                entityinfo._amount_subjectnum = 0;//量表包含题目数量
                entityinfo._start_applypeoples = Amount_ApplyPeoples;//最小的适用年龄
                entityinfo._end_applypeoples = _End_Age;//最大适用年龄
                //entityinfo._amount_applypeoples = Amount_ApplyPeoples;//适用人群
                entityinfo._amount_marks = Amount_Marks;//量表描述
                entityinfo._amount_guidance = Amount_Guidance;//量表指导语
                entityinfo._createtime = DateTime.Now;//创建时间
                entityinfo._completeamount = 25;//保存完量表描述的完成度是25%
                entityinfo._is_delete = 0;//是否删除标识
                entityinfo._u_id = 0;
                string AmountCode = "";//维度编码
                entityinfo._amount_source = 3;
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                entityinfo.amountCreatePerson = Convert.ToInt32(_uID);
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (LicenseCode == null)
                    return;
                int result = MgrServices.AmountService.InsertAmount(entityinfo, ref AmountCode, LicenseCode);
                if (result > 0)
                {
                    context.Response.Write(AmountCode);
                }
                else
                {
                    context.Response.Write("");
                }
            }
            catch
            {

            }

        }
        //题目编辑



        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-27
        /// 功能介绍：初始化量表类别下拉列表
        /// </summary>
        private void InitAmountType(HttpContext context)
        {
            try
            {

                DataTable SourceTemp = new DataTable();
                SourceTemp = GetAmountType();
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
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }
            }
            catch
            {

            }
        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-27
        /// 功能介绍：获取量表类别数据集合
        /// </summary>
        /// <returns></returns>
        private DataTable GetAmountType()
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", HttpContext.Current);
                if (LicenseCode == null)
                    return null;
                SourceTemp = MgrServices.AmountTypeService.GetAmountTypeTemp(LicenseCode);
            }
            catch (Exception ex)
            { }

            return SourceTemp;
        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-29
        /// 功能介绍：保存题干和题支信息并且建立题干和题支的关联关系
        /// </summary>
        private void SaveSubject(HttpContext context)
        {
            try
            {
                List<JsonEntity> into = new List<JsonEntity>();
                string SubjectJson = Common.GetRequest("Json");//量表名称
                string Guidance = Common.GetRequest("Guidance");//指导语
                int result = MgrServices.AmountService.SaveSelfSubject(SubjectJson, Guidance);//保存题干和题支关系信息
                context.Response.Write(result);

            }
            catch
            {

            }
        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-31
        /// 功能介绍：根据量表编码查询量表临时关联出来的题干
        /// </summary>
        /// <param name="AmountCode">量表编码</param>
        /// <returns></returns>
        public DataSet GetSubjectSource(string AmountCode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                var startIndex = Convert.ToInt32(Common.GetRequest("StarPageIndex"));
                var endIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
                SourceTemp = MgrServices.AmountService.GetSubjectSource(AmountCode, startIndex, endIndex);

            }
            catch
            { }

            return SourceTemp;
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-31
        /// 功能介绍：初始化量表对应的临时的题干信息
        /// </summary>
        public void InitSubjectStr(HttpContext context)
        {
            try
            {
                string AmountCode = Common.GetRequest("A_Code");

                DataSet ds = new DataSet();
                ds = GetSubjectSource(AmountCode);
                PageInfo page = new PageInfo();
                int index = 0;
                DataTable dt = new DataTable();
                if (ds != null && ds.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    dt = ds.Tables[1];
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in dt.Rows)
                        {
                            String[] arr =
                            {
                                DTR["SubjectCode"].ToString(), //题干编码
                                DTR["Sort"].ToString(), //题号
                                DTR["SubjectContent"].ToString()//题干标题	                           
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
            { }

        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-31
        /// 功能介绍：根据中文参数，转换成拼音编码
        /// </summary>
        public void TransformationCode(HttpContext context)
        {
            try
            {
                string chinese = Common.GetRequest("Chinese");//中文参数
                // string Code = MgrServices.ChineseToPinYinService.GetFirstPY_ByChinese(chinese);
                string Code = "WD_" + Common.GetTimeStamp();
                context.Response.Write(Code);
            }
            catch
            { }

        }



        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-11
        /// 功能介绍：保存组合维度划分操作
        /// </summary>
        public void SaveCombination(HttpContext context)
        {
            try
            {
                CrisisInterfere.AmountService.AmountDimensionEntity entity = new AmountService.AmountDimensionEntity();
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                int UID = Convert.ToInt32(_uID);

                string _WD_Name = Common.GetRequest("WD_Name");//维度名称
                string _WD_Code = Common.GetRequest("WD_Code");//维度编码
                int _Sort = Convert.ToInt32(Common.GetRequest("Sort"));//排序位置
                int _ProSUM = Convert.ToInt32(Common.GetRequest("ProSUM"));//所选题数
                string _SubjectCodeStr = Common.GetRequest("SC_Str");//题干编码字符串
                string AmountCode = Common.GetRequest("_AmountCode");//量表编码

                entity._dimensionname = _WD_Name;
                entity._dimensioncode = _WD_Code;
                entity._sort = _Sort;
                entity._subjectnum = _ProSUM;

                int result = MgrServices.AmountService.SaveCombination(entity, _SubjectCodeStr, AmountCode, UID);
                context.Response.Write(result);



            }
            catch
            {

            }
        }


        /// <summary>
        /// 功能介绍：根据量表Code展现对应的维度和题干数据集合
        /// </summary>
        /// <returns></returns>
        private DataSet SourceDS()
        {
            DataSet temps = new DataSet();

            try
            {
                string AmountCode = Common.GetRequest("A_Code");
                temps = MgrServices.AmountService.GetDS_Temps(AmountCode);
            }
            catch
            {
            }

            return temps;

        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-02
        /// 功能介绍：初始化组合列表数据集合
        /// </summary>
        /// <param name="context"></param>
        public void InitCombinationTree(HttpContext context)
        {

            try
            {
                DataSet SourceTemps = new DataSet();
                SourceTemps = SourceDS();//获取数据集合
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    List<D_Entity> DList = new List<D_Entity>();//维度集合
                    List<TG_Entity> TList = new List<TG_Entity>();//提干集合


                    DataTable D_Table = SourceTemps.Tables[0];//维度数据集合列表
                    DataTable T_Table = SourceTemps.Tables[1];//题干数据集合
                    CombinationTree _TreeEntity = new CombinationTree();
                    if (T_Table != null && T_Table.Rows.Count > 0)
                    {

                        foreach (DataRow Dtr in T_Table.Rows)//遍历维度表实体
                        {
                            TG_Entity info = new TG_Entity();
                            info.DimensionCode = Dtr["DimensionCode"].ToString();
                            info.SubjectCode = Dtr["SubjectCode"].ToString();
                            info.SubjectContent = Dtr["SubjectContent"].ToString();
                            //SubjectSort
                            info.SubjectSort = Convert.ToInt32(Dtr["Sort"] == DBNull.Value ? "0" : Dtr["Sort"].ToString());

                            TList.Add(info);
                        }
                    }

                    if (D_Table != null && D_Table.Rows.Count > 0)
                    {
                        foreach (DataRow Dtr in D_Table.Rows)
                        {
                            D_Entity info = new D_Entity();
                            info.DimensionCode = Dtr["DimensionCode"].ToString();
                            info.DimensionName = Dtr["DimensionName"].ToString();
                            DList.Add(info);
                        }

                    }
                    _TreeEntity.D_EntityList = DList;//维度集合
                    _TreeEntity.TG_EntityList = TList;//题干集合

                    string SourceJson = new JavaScriptSerializer().Serialize(_TreeEntity);
                    context.Response.Write(SourceJson);
                }
                else
                {
                    context.Response.Write("");
                }

            }
            catch
            { }
        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-03
        /// 功能介绍：根据量表编号查询维度数据集合
        /// </summary>
        /// <returns></returns>
        private DataTable GetAD_Temp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string A_Code = Common.GetRequest("ACode");
                SourceTemp = MgrServices.AmountService.GetAmountDimensionTempByA_Code(A_Code);

            }
            catch
            {
            }
            return SourceTemp;

        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-03
        /// 功能介绍：初始化自编量表维度下拉列表内容
        /// </summary>
        public void InitADSel(HttpContext context)
        {
            try
            {
                DataTable SourceTemp = new DataTable();
                SourceTemp = GetAD_Temp();
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["DimensionName"].ToString();
                        mex.Value = DTR["DimensionCode"].ToString();
                        listT.Add(mex);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));

                }


            }
            catch
            {

            }

        }


        /// <summary>
        /// 根据维度编码初始化常模列表
        /// </summary>
        /// <param name="context"></param>
        public void InitNorm(HttpContext context)
        {

            try
            {

                DataTable SourceTemp = new DataTable();
                string D_Code = Common.GetRequest("D_Code");
                SourceTemp = MgrServices.AmountService.GetNormTempByD_Code(D_Code);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["NormTitle"].ToString();
                        mex.Value = DTR["NormCode"].ToString();
                        mex.Use = Convert.ToInt32(DTR["Is_Used"].ToString());
                        listT.Add(mex);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));

                }



            }
            catch
            { }
        }

        /// <summary>
        /// 隐藏掉维度和常模之间的关系
        /// </summary>
        /// <param name="context"></param>
        public void DisplayDN(HttpContext context)
        {
            try
            {
                int result = 0;
                string D_Code = Common.GetRequest("D_Code");
                string N_Code = Common.GetRequest("N_Code");
                result = MgrServices.AmountService.DisplayDN(D_Code, N_Code);
                context.Response.Write(result);

            }
            catch
            {

            }


        }


        /// <summary>
        /// 保存测评评分设置信息
        /// </summary>
        public void SaveScore(HttpContext context)
        {
            try
            {
                string dataJson = Common.GetRequest("JsonData");
                string NormCode = "";
                int result = MgrServices.AmountService.SaveScoreMessage(dataJson, ref NormCode);
                if (result > 0)
                {
                    context.Response.Write(NormCode);
                }
                else
                {
                    context.Response.Write("ERROR");
                }
            }
            catch
            {
                context.Response.Write(0);
            }


        }


        /// <summary>
        /// 根据维度编号 量表编号 删除量表和维度关系 、删除维度和题干关系
        /// </summary>
        /// <param name="context"></param>
        public void DelMessageByWD(HttpContext context)
        {
            try
            {
                string D_Code = Common.GetRequest("D_Code");
                string A_Code = Common.GetRequest("A_Code");
                int result = MgrServices.AmountService.DelDimension(D_Code, A_Code);
                context.Response.Write(result);
            }
            catch
            { }
        }


        /// <summary>
        /// 根据维度编码和题干编码删除题干和维度的关系表
        /// </summary>
        /// <param name="context"></param>
        public void DelSubject_RelationByD_Code(HttpContext context)
        {
            try
            {
                string D_Code = Common.GetRequest("D_Code");
                string S_Code = Common.GetRequest("S_Code");
                int result = MgrServices.AmountService.DelDS_RelationByCode(D_Code, S_Code);
                context.Response.Write(result);
            }
            catch
            { }

        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-25
        /// 功能介绍：根据维度编码和常模编码加载常模解释和预警信息
        /// </summary>
        /// <param name="context"></param>
        public void InitNW(HttpContext context)
        {
            string D_Code = Common.GetRequest("D_Code");
            string N_Code = Common.GetRequest("N_Code");

            DataSet SourceDS = new DataSet();
            SourceDS = MgrServices.AmountService.GetExplainWarningDS(D_Code, N_Code);
            if (SourceDS != null && SourceDS.Tables.Count > 0 && SourceDS.Tables[0].Rows.Count > 0)
            {
                DataTable ExplainTemp = new DataTable();
                ExplainTemp = SourceDS.Tables[0];

                DataTable WarningTemp = new DataTable();
                WarningTemp = SourceDS.Tables[1];
                //NW_List
                //NormExplainInfo
                //WarningInfo
                NW_List nwList = new NW_List();

                List<NormExplainInfo> E_List = new List<NormExplainInfo>();
                List<WarningInfo> W_List = new List<WarningInfo>();
                if (ExplainTemp != null && ExplainTemp.Rows.Count > 0)
                {
                    NormExplainInfo ExplainInfo = new NormExplainInfo();
                    foreach (DataRow EDtr in ExplainTemp.Rows)
                    {
                        ExplainInfo = new NormExplainInfo();
                        ExplainInfo.ExplainCode = EDtr["ExplainCode"].ToString();
                        ExplainInfo.Explain = EDtr["NormExplain"].ToString();
                        ExplainInfo.ExplainName = EDtr["ExplainName"].ToString();
                        ExplainInfo.MaxAge = Convert.ToInt32(EDtr["NormEndAge"].ToString());
                        ExplainInfo.MaxMark = Convert.ToDouble(EDtr["EndFraction"].ToString());
                        ExplainInfo.MinAge = Convert.ToInt32(EDtr["NormStartAge"].ToString());
                        ExplainInfo.MinMark = Convert.ToDouble(EDtr["StartFraction"].ToString());
                        ExplainInfo.Proposal = EDtr["NormProposal"].ToString();
                        ExplainInfo.Sex = Convert.ToInt32(EDtr["NormSex"].ToString());
                        ExplainInfo.First_Symbol = EDtr["First_Symbol"].ToString();
                        ExplainInfo.Second_Symbol = EDtr["Second_Symbol"].ToString();
                        E_List.Add(ExplainInfo);

                    }

                }

                if (WarningTemp != null && WarningTemp.Rows.Count > 0)
                {
                    WarningInfo W_info = new WarningInfo();
                    foreach (DataRow WDtr in WarningTemp.Rows)
                    {
                        W_info = new WarningInfo();
                        W_info.WarningCode = WDtr["NormWarningCode"].ToString();
                        W_info.MaxMark = Convert.ToDouble(WDtr["EndFraction"].ToString());
                        W_info.MinMark = Convert.ToDouble(WDtr["StartFraction"].ToString());
                        W_info.WarningLevel = WDtr["NormWarningLevel"].ToString();
                        W_info.NormWarningLevel_Level = WDtr["NormWarningLevel_Level"].ToString();
                        W_info.MinAge = Convert.ToDouble(WDtr["MinAge"].ToString());
                        W_info.MaxAge = Convert.ToDouble(WDtr["MaxAge"].ToString());
                        W_info.First_Symbol = WDtr["First_Symbol"].ToString();
                        W_info.Second_Symbol = WDtr["Second_Symbol"].ToString();
                        W_info.Sex = Convert.ToInt32(WDtr["Sex"].ToString());
                        W_List.Add(W_info);
                    }

                }

                nwList.WarningList = W_List;
                nwList.ExplainList = E_List;


                context.Response.Write(new JavaScriptSerializer().Serialize(nwList));
            }
            else
            {
                context.Response.Write("");

            }


        }

        /// <summary>
        /// 删除常模预警
        /// </summary>
        /// <param name="context"></param>
        public void DelNWR(HttpContext context)
        {
            try
            {
                string NormCode = Common.GetRequest("NormCode");
                string WarningCode = Common.GetRequest("WarningCode");
                int result = 0;
                result = MgrServices.AmountService.DelNWR(NormCode, WarningCode);
                context.Response.Write(result);


            }
            catch
            {


            }

        }



        /// <summary>
        /// 验证量表是否存在
        /// </summary>
        /// <param name="context"></param>
        private void CheckAmountName(HttpContext context)
        {

            try
            {
                DataTable SourceTemp = new DataTable();
                SourceTemp = GetAmountLicenseTemp();

                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    string AmountCode = SourceTemp.Rows[0]["Amount_Code"].ToString();
                    context.Response.Write(AmountCode);
                }
                else
                {
                    context.Response.Write("");
                }

            }
            catch
            {

            }
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-30
        /// 功能介绍：根据量表的授权编码和名称查询量表数据
        /// </summary>
        /// <returns></returns>
        public DataTable GetAmountLicenseTemp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", HttpContext.Current);
                if (LicenseCode == null)
                    return null;
                string Amount_Name = Common.GetRequest("Amount_Code");
                SourceTemp = MgrServices.AmountService.GetAmountLicenseTemp(LicenseCode, Amount_Name);
            }
            catch
            {

            }


            return SourceTemp;

        }



        public void ItemEdit()
        {

        }
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }


        /// <summary>
        /// 保存量表维度常模关系（还有公式）
        /// </summary>
        /// <param name="context"></param>
        public void SaveSet(HttpContext context)
        {
            try
            {
                string ScoreJson = Common.GetRequest("SourceJson");
                int result = 0;
                result = MgrServices.AmountService.SaveScore(ScoreJson);
                context.Response.Write(result);
            }
            catch
            { }
        }


        /// <summary>
        /// 删除常模和解释之间的关系
        /// </summary>
        /// <param name="context"></param>
        public void Del_NER(HttpContext context)
        {

            try
            {
                string NormCode = Common.GetRequest("NormCode");
                string ExplainCode = Common.GetRequest("ExplainCode");
                int result = 0;
                result = MgrServices.AmountService.DisNER(NormCode, ExplainCode);
                context.Response.Write(result);


            }
            catch
            {


            }
        }

        /// <summary>
        /// 添加常模解释信息
        /// </summary>
        /// <param name="context"></param>
        public void Add_NE(HttpContext context)
        {
            try
            {
                string NE_Ison = Common.GetRequest("NE_Json");
                int result = 0;
                result = MgrServices.AmountService.SaveNER(NE_Ison);
                context.Response.Write(result);

            }
            catch
            {


            }


        }


        /// <summary>
        /// 添加预警信息
        /// </summary>
        /// <param name="context"></param>
        public void Add_NW(HttpContext context)
        {
            try
            {

                string NW_Ison = Common.GetRequest("NW_Json");
                int result = 0;
                result = MgrServices.AmountService.SaveWER(NW_Ison, 0);
                context.Response.Write(result);
            }
            catch
            {

            }

        }

    }

    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-10-28
    /// 功能介绍：题干JSON实体
    /// </summary>
    public class TG
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

        private string _TG_Content;
        /// <summary>
        /// 题干标题内容
        /// </summary>
        public string TG_Content
        {
            get { return _TG_Content; }
            set { _TG_Content = value; }
        }
    }

    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-10-28
    /// 功能介绍：题支JSON实体
    /// </summary>
    public class TZ
    {

        private string _TZ_Code;
        /// <summary>
        /// 题支编码
        /// </summary>
        public string TZ_Code
        {
            get { return _TZ_Code; }
            set { _TZ_Code = value; }
        }

        private string _TZ_Num;
        /// <summary>
        /// 题支序号
        /// </summary>
        public string TZ_Num
        {
            get { return _TZ_Num; }
            set { _TZ_Num = value; }
        }

        private string _TZ_Con;
        /// <summary>
        /// 题支内容
        /// </summary>
        public string TZ_Con
        {
            get { return _TZ_Con; }
            set { _TZ_Con = value; }
        }

        private string _TZ_Val;
        /// <summary>
        /// 题支分值
        /// </summary>
        public string TZ_Val
        {
            get { return _TZ_Val; }
            set { _TZ_Val = value; }
        }
    }

    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-10-28
    /// 功能介绍：解析页面JSOIN数据集合的实体集
    /// </summary>
    public class JsonEntity
    {

        private TG _TG_Info;
        /// <summary>
        /// 题干信息实体
        /// </summary>
        public TG TG_Info
        {
            get { return _TG_Info; }
            set { _TG_Info = value; }
        }

        private List<TZ> _TZ_List;
        /// <summary>
        /// 题支信息集合
        /// </summary>
        public List<TZ> TZ_List
        {
            get { return _TZ_List; }
            set { _TZ_List = value; }
        }




    }



    public class D_Entity
    {
        private string _DimensionCode;
        /// <summary>
        /// 维度编码
        /// </summary>
        public string DimensionCode
        {
            get { return _DimensionCode; }
            set { _DimensionCode = value; }
        }

        private string _DimensionName;
        /// <summary>
        /// 维度名称
        /// </summary>
        public string DimensionName
        {
            get { return _DimensionName; }
            set { _DimensionName = value; }
        }
    }


    public class TG_Entity
    {

        private string _SubjectCode;
        /// <summary>
        /// 题干编码
        /// </summary>
        public string SubjectCode
        {
            get { return _SubjectCode; }
            set { _SubjectCode = value; }
        }

        private string _SubjectContent;
        /// <summary>
        /// 题干内容
        /// </summary>
        public string SubjectContent
        {
            get { return _SubjectContent; }
            set { _SubjectContent = value; }
        }

        private string _DimensionCode;
        /// <summary>
        /// 维度编码 
        /// </summary>
        public string DimensionCode
        {
            get { return _DimensionCode; }
            set { _DimensionCode = value; }
        }


        private int _SubjectSort;
        /// <summary>
        /// 题干题号
        /// </summary>
        public int SubjectSort
        {
            get { return _SubjectSort; }
            set { _SubjectSort = value; }
        }
    }

    /// <summary>
    /// 组合数据展示实体集合
    /// </summary>
    public class CombinationTree
    {
        private List<D_Entity> _D_EntityList;
        /// <summary>
        /// 维度实体集合
        /// </summary>
        public List<D_Entity> D_EntityList
        {
            get { return _D_EntityList; }
            set { _D_EntityList = value; }
        }

        private List<TG_Entity> _TG_EntityList;
        /// <summary>
        /// 题干实体集合
        /// </summary>
        public List<TG_Entity> TG_EntityList
        {
            get { return _TG_EntityList; }
            set { _TG_EntityList = value; }
        }
    }



    /// <summary>
    /// 常模解释实体
    /// </summary>
    public class NormExplainInfo
    {
        //解释编码
        //解释名称
        //最小年龄
        //最大年龄
        //性别
        //最小分值
        //最大分值
        //分值说明
        //辅导建议



        private string _ExplainCode;
        /// <summary>
        /// 解释编码
        /// </summary>
        public string ExplainCode
        {
            get { return _ExplainCode; }
            set { _ExplainCode = value; }
        }


        private string _ExplainName;
        /// <summary>
        /// 解释名称
        /// </summary>
        public string ExplainName
        {
            get { return _ExplainName; }
            set { _ExplainName = value; }
        }

        private int _MinAge;
        /// <summary>
        /// 最小年龄
        /// </summary>
        public int MinAge
        {
            get { return _MinAge; }
            set { _MinAge = value; }
        }

        private int _MaxAge;
        /// <summary>
        /// 最大年龄
        /// </summary>
        public int MaxAge
        {
            get { return _MaxAge; }
            set { _MaxAge = value; }
        }

        private int _Sex;
        /// <summary>
        /// 性别
        /// </summary>
        public int Sex
        {
            get { return _Sex; }
            set { _Sex = value; }
        }

        private double _MinMark;
        /// <summary>
        /// 最小分值
        /// </summary>
        public double MinMark
        {
            get { return _MinMark; }
            set { _MinMark = value; }
        }

        private double _MaxMark;
        /// <summary>
        /// 最大分值
        /// </summary>
        public double MaxMark
        {
            get { return _MaxMark; }
            set { _MaxMark = value; }
        }

        private string _Explain;
        /// <summary>
        /// 分值说明
        /// </summary>
        public string Explain
        {
            get { return _Explain; }
            set { _Explain = value; }
        }

        private string _Proposal;
        /// <summary>
        /// 辅导建议
        /// </summary>
        public string Proposal
        {
            get { return _Proposal; }
            set { _Proposal = value; }
        }


        private string _First_Symbol;

        public string First_Symbol
        {
            get { return _First_Symbol; }
            set { _First_Symbol = value; }
        }


        private string _Second_Symbol;

        public string Second_Symbol
        {
            get { return _Second_Symbol; }
            set { _Second_Symbol = value; }
        }
    }


    /// <summary>
    /// 常模预警实体
    /// </summary>
    public class WarningInfo
    {


        private string _WarningCode;
        /// <summary>
        /// 预警编码
        /// </summary>
        public string WarningCode
        {
            get { return _WarningCode; }
            set { _WarningCode = value; }
        }

        private string _WarningLevel;
        /// <summary>
        /// 预警级别
        /// </summary>
        public string WarningLevel
        {
            get { return _WarningLevel; }
            set { _WarningLevel = value; }
        }

        private double _MinMark;
        /// <summary>
        /// 开始分数
        /// </summary>
        public double MinMark
        {
            get { return _MinMark; }
            set { _MinMark = value; }
        }

        private double _MaxMark;
        /// <summary>
        /// 结束分数
        /// </summary>
        public double MaxMark
        {
            get { return _MaxMark; }
            set { _MaxMark = value; }
        }

        private string _NormWarningLevel_Level;
        /// <summary>
        /// 预警级别
        /// </summary>
        public string NormWarningLevel_Level
        {
            get { return _NormWarningLevel_Level; }
            set { _NormWarningLevel_Level = value; }
        }


        private double _MinAge;
        /// <summary>
        /// 最小年龄
        /// </summary>
        public double MinAge
        {
            get { return _MinAge; }
            set { _MinAge = value; }
        }


        private double _MaxAge;
        /// <summary>
        /// 最大年龄
        /// </summary>
        public double MaxAge
        {
            get { return _MaxAge; }
            set { _MaxAge = value; }
        }

        private string _First_Symbol;
        /// <summary>
        /// 开始运算分数
        /// </summary>
        public string First_Symbol
        {
            get { return _First_Symbol; }
            set { _First_Symbol = value; }
        }


        private string _Second_Symbol;
        /// <summary>
        /// 结束运算分数
        /// </summary>
        public string Second_Symbol
        {
            get { return _Second_Symbol; }
            set { _Second_Symbol = value; }
        }

        private int _Sex;
        /// <summary>
        /// 预警性别
        /// </summary>
        public int Sex
        {
            get { return _Sex; }
            set { _Sex = value; }
        }


    }

    /// <summary>
    /// 常模解释和预警数据集合
    /// </summary>
    public class NW_List
    {


        private List<NormExplainInfo> _ExplainList;
        /// <summary>
        /// 常模解释数据集合
        /// </summary>
        public List<NormExplainInfo> ExplainList
        {
            get { return _ExplainList; }
            set { _ExplainList = value; }
        }


        private List<WarningInfo> _WarningList;
        /// <summary>
        /// 常模预警数据集合
        /// </summary>
        public List<WarningInfo> WarningList
        {
            get { return _WarningList; }
            set { _WarningList = value; }
        }

    }


}