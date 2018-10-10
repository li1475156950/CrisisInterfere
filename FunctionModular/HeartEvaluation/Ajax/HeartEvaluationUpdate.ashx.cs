using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;

namespace CrisisInterfere.FunctionModular.HeartEvaluation.Ajax
{
    /// <summary>
    /// HeartEvaluationUpdate 的摘要说明
    /// </summary>
    public class HeartEvaluationUpdate : IHttpHandler, IRequiresSessionState
    {



        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-24
        /// 功能介绍：修改量表处理程序
        /// </summary>
        /// <param name="context"></param>
        public void ProcessRequest(HttpContext context)
        {
            //string isTimeOut = Common.GetSessionValue("UserID", context);
            //if (isTimeOut == null)
            //    return;

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");

            string Remark = Common.GetRequest("Remark");

            switch (Remark)
            {
                case "InitAmount":
                    InitAmountPages(context);
                    break;
                case "GetSubjectMessage":
                    InitSubJson(context);
                    break;
                case "CustomUpdate":
                    CustomUpdateAmount(context);
                    break;
                case "UpdateSubject":
                    UpdateSubject(context);
                    break;
                case "DelSubject":
                    DelSubject(context);
                    break;
                case "DelOption":
                    DelOption(context);
                    break;
                case "Update_Sub":
                    InitSubjectMessage(context);
                    break;
                case "NewAddSubject":
                    NewAddSubject(context);
                    break;
                case "GetFormula":
                    GetFormula(context);
                    break;
                case "UpdateNorm":
                    UpdateNorm(context);
                    break;
                case "Update_NExp":
                    Update_NExp(context);
                    break;
                case "update_NW":
                    update_NW(context);
                    break;
                case "SUZ":
                    ShowUpdateZH(context);
                    break;
                case "UpdateWD":
                    UpdateWD(context);
                    break;

                case "addWd_Tg":
                    addWd_Tg(context);
                    break;
                case "zdy":
                    zhidaoyu(context);
                    break;

            }
        }

        /// <summary>
        /// 根据量表编码解析量表基本信息
        /// </summary>
        /// <param name="context"></param>
        public void InitAmountPages(HttpContext context)
        {
            try
            {
                DataTable SourceTemp = new DataTable();
                SourceTemp = GetADTemp();

                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    List<AmountPagesEntity> infoList = new List<AmountPagesEntity>();
                    AmountPagesEntity info = new AmountPagesEntity();

                    foreach (DataRow dtr in SourceTemp.Rows)
                    {
                        info = new AmountPagesEntity();
                        info.AmountDisName = dtr["Amount_DisplayName"].ToString();
                        info.AmountMarks = dtr["Amount_Marks"].ToString();
                        info.AmountName = dtr["Amount_Name"].ToString();
                        info.AmountTypeID = Convert.ToInt32(dtr["Amount_TypeID"].ToString());
                        info.DimensionCode = dtr["DimensionCode"].ToString();
                        info.DimensionName = dtr["DimensionName"].ToString();
                        info.AmountGuidance = dtr["Amount_Guidance"].ToString();
                        info.Peoples = dtr["Start_ApplyPeoples"].ToString();
                        info.AmountSource = Convert.ToInt32(dtr["Amount_Source"].ToString());
                        infoList.Add(info);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(infoList));

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
        /// 创建时间：2016-11-24
        /// 功能介绍：根据量表编码查询量表和维度信息
        /// </summary>
        /// <returns></returns>
        private DataTable GetADTemp()
        {
            DataTable SourceTemp = new DataTable();
            try
            {

                string Acode = Common.GetRequest("a_id");
                SourceTemp = MgrServices.AmountService.GetAmountAndDimension(Acode);
                return SourceTemp;
            }
            catch
            {
            }
            return SourceTemp;
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-24
        /// 功能介绍：根据维度编码字符串加载题干和题支信息
        /// </summary>
        /// <param name="CodeStr">维度编码字符串</param>
        /// <returns></returns>
        public DataSet GetSubjectOperationTemp()
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                string WD_Str = Common.GetRequest("WD_Str");
                SourceTemp = MgrServices.AmountService.GetSubjectOperationTemp(WD_Str);
            }
            catch
            {

            }
            return SourceTemp;

        }


        public void InitSubJson(HttpContext context)
        {

            try
            {
                DataSet SourcceTemp = new DataSet();
                SourcceTemp = GetSubjectOperationTemp();
                string WD_Str = Common.GetRequest("WD_Str");
                if (SourcceTemp != null && SourcceTemp.Tables.Count > 0)
                {
                    TG_Update TGinfo = new TG_Update();
                    DataTable TG_Temp = new DataTable();
                    TG_Temp = SourcceTemp.Tables[0];

                    DataTable TZ_Temp = new DataTable();
                    TZ_Temp = SourcceTemp.Tables[1];
                    string JsonStr = "";

                    if (TG_Temp != null && TG_Temp.Rows.Count > 0)
                    {


                        foreach (DataRow TG_Dtr in TG_Temp.Rows)
                        {
                            if (JsonStr == "")
                            {
                                JsonStr += "{";
                            }
                            else
                            {
                                JsonStr += ",{";
                            }

                            JsonStr += "\"TG_Info\": ";
                            JsonStr += "            {";
                            JsonStr += "               \"TG_Code\": \"" + TG_Dtr["SubjectCode"] + "\",";
                            JsonStr += "               \"TG_Content\": \"" + TG_Dtr["SubjectContent"] + "\"";
                            JsonStr += "            }";
                            JsonStr += "     ,   ";
                            JsonStr += " \"TZ_List\": ";
                            JsonStr += "            [";


                            string TZ_JsonStr = "";
                            if (TZ_Temp != null && TZ_Temp.Rows.Count > 0)
                            {
                                DataRow[] TZ_Dtr = TZ_Temp.Select("  SubjectCode = '" + TG_Dtr["SubjectCode"] + "' ");
                                if (TZ_Dtr != null && TZ_Dtr.Length > 0)
                                {
                                    foreach (DataRow tzTr in TZ_Dtr)
                                    {
                                        if (TZ_JsonStr == "")
                                        {
                                            TZ_JsonStr += "{\"TZ_Code\":\"" + tzTr["OperationCode"] + "\",\"TZ_Num\": \"" + tzTr["OperationNum"] + "\",\"TZ_Con\": \"" + tzTr["OperationContent"] + "\",\"TZ_Val\": \"" + tzTr["OperationFraction"] + "\"}";
                                        }
                                        else
                                        {
                                            TZ_JsonStr += ",{\"TZ_Code\":\"" + tzTr["OperationCode"] + "\",\"TZ_Num\": \"" + tzTr["OperationNum"] + "\",\"TZ_Con\": \"" + tzTr["OperationContent"] + "\",\"TZ_Val\": \"" + tzTr["OperationFraction"] + "\"}";

                                        }
                                    }
                                }
                            }
                            JsonStr += TZ_JsonStr;
                            JsonStr += "]";
                            JsonStr += "}";

                        }

                    }

                    context.Response.Write(JsonStr);

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
        /// 删除题干信息
        /// </summary>
        /// <param name="context"></param>
        public void DelSubject(HttpContext context)
        {


            try
            {

                string tgcode = Common.GetRequest("tg_code");
                int delresult = MgrServices.AmountService.DelTG_ByCode(tgcode);
                context.Response.Write(delresult);
            }
            catch
            {

            }

        }


        /// <summary>
        /// 修改题干信息
        /// </summary>
        /// <param name="context"></param>
        public void UpdateSubject(HttpContext context)
        {
            try
            {
                string OperationStr = Common.GetRequest("Jsonstr");
                int result = MgrServices.AmountService.UpdateSubject(OperationStr);
                context.Response.Write(result);

            }
            catch
            {

            }

        }

        /// <summary>
        /// 自编量表修改
        /// </summary>
        /// <param name="context"></param>
        public void CustomUpdateAmount(HttpContext context)
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
                string AmountCode = Common.GetRequest("Acode"); ;//维度编码
                var AmountSource = Convert.ToInt32(Common.GetRequest("AmountSource"));
                CrisisInterfere.AmountService.Amount_InfoEntity entityinfo = new AmountService.Amount_InfoEntity();
                entityinfo._amount_code = AmountCode;
                entityinfo._amount_name = Amount_Name;
                entityinfo._amount_displayname = Amount_DisplayName;
                entityinfo._amount_typeid = Amount_TypeID;
                entityinfo._amount_subjectnum = 0;//量表包含题目数量
                entityinfo._start_applypeoples = Amount_ApplyPeoples;//最小的适用年龄
                entityinfo._end_applypeoples = _End_Age;//最大适用年龄
                //entityinfo._amount_applypeoples = Amount_ApplyPeoples;//适用人群
                entityinfo._amount_source = AmountSource;//1:维度组合  2：自编量表
                entityinfo._amount_marks = Amount_Marks;//量表描述
                entityinfo._amount_guidance = Amount_Guidance;//量表指导语
                entityinfo._createtime = DateTime.Now;//创建时间
                entityinfo._completeamount = 25;//保存完量表描述的完成度是25%
                entityinfo._is_delete = 0;//是否删除标识
                entityinfo._u_id = 0;

                int result = MgrServices.AmountService.UpdateAmount(entityinfo);
                if (result > 0)
                {
                    context.Response.Write(result);
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


        public void GetFormula(HttpContext context)
        {

            try
            {
                string Dcode = Common.GetRequest("d_code");
                DataTable SourceTemp = new DataTable();
                SourceTemp = MgrServices.AmountService.GetFormulaTempByCode(Dcode);
                string FormulaStr = "";
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    FormulaStr = SourceTemp.Rows[0]["FormulaStr"] == DBNull.Value ? "" : SourceTemp.Rows[0]["FormulaStr"].ToString();
                    String[] PageList = 
                            {
                             FormulaStr,
                             SourceTemp.Rows[0]["ScoringMode"].ToString()                             
                            };


                    context.Response.Write(new JavaScriptSerializer().Serialize(PageList));
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


        public void DelOption(HttpContext context)
        {
            try
            {
                int result = 0;
                string tg_code = Common.GetRequest("g_code");
                string tz_code = Common.GetRequest("z_code");
                result = MgrServices.AmountService.DelOperationByCode(tg_code, tz_code);
                context.Response.Write(result);

            }
            catch
            {


            }

        }



        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-11-29
        /// 功能介绍：根据量表编码查询量表下密码的题干信息
        /// </summary>
        /// <param name="context"></param>
        public void InitSubjectMessage(HttpContext context)
        {
            try
            {
                DataSet SourceS = new DataSet();
                string lb_code = Common.GetRequest("lb_code");
                SourceS = MgrServices.AmountService.GetSubjectTempsByLBCode(lb_code);
                if (SourceS != null && SourceS.Tables.Count > 0 && SourceS.Tables[0].Rows.Count > 0)
                {
                    DataTable TG_temp = new DataTable();
                    DataTable TZ_temp = new DataTable();
                    TG_temp = SourceS.Tables[0];
                    TZ_temp = SourceS.Tables[1];


                    string JsonStr = "";

                    foreach (DataRow TG_Dtr in TG_temp.Rows)
                    {
                        if (JsonStr == "")
                        {
                            JsonStr += "{";
                        }
                        else
                        {
                            JsonStr += ",{";
                        }

                        JsonStr += "\"TG_Info\": ";
                        JsonStr += "            {";
                        JsonStr += "               \"TG_Code\": \"" + TG_Dtr["SubjectCode"] + "\",";
                        JsonStr += "               \"TG_Sort\": \"" + TG_Dtr["Sort"] + "\",";
                        JsonStr += "               \"TG_Content\": \"" + TG_Dtr["SubjectContent"] + "\"";
                        JsonStr += "            }";
                        JsonStr += "     ,   ";
                        JsonStr += " \"TZ_List\": ";
                        JsonStr += "            [";


                        string TZ_JsonStr = "";
                        if (TZ_temp != null && TZ_temp.Rows.Count > 0)
                        {
                            DataRow[] TZ_Dtr = TZ_temp.Select("  SubjectCode = '" + TG_Dtr["SubjectCode"] + "' ");
                            if (TZ_Dtr != null && TZ_Dtr.Length > 0)
                            {
                                foreach (DataRow tzTr in TZ_Dtr)
                                {
                                    if (TZ_JsonStr == "")
                                    {
                                        TZ_JsonStr += "{\"TZ_Code\":\"" + tzTr["OperationCode"] + "\",\"TZ_Num\": \"" + tzTr["OperationNum"] + "\",\"TZ_Con\": \"" + tzTr["OperationContent"] + "\",\"TZ_Val\": \"" + tzTr["OperationFraction"] + "\"}";
                                    }
                                    else
                                    {
                                        TZ_JsonStr += ",{\"TZ_Code\":\"" + tzTr["OperationCode"] + "\",\"TZ_Num\": \"" + tzTr["OperationNum"] + "\",\"TZ_Con\": \"" + tzTr["OperationContent"] + "\",\"TZ_Val\": \"" + tzTr["OperationFraction"] + "\"}";

                                    }
                                }
                            }
                        }
                        JsonStr += TZ_JsonStr;
                        JsonStr += "]";
                        JsonStr += "}";

                    }


                    context.Response.Write(JsonStr);

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
        /// 量表修改功能---添加新的题干
        /// </summary>
        /// <param name="context"></param>
        public void NewAddSubject(HttpContext context)
        {
            try
            {
                int result = 0;
                string AddSubJson = Common.GetRequest("AddSubJson");
                result = MgrServices.AmountService.NewUpdateSubject(AddSubJson);
                context.Response.Write(result);


            }
            catch
            {

            }

        }


        /// <summary>
        /// 针对维度的公式和常模进行的修改
        /// </summary>
        /// <param name="context"></param>
        public void UpdateNorm(HttpContext context)
        {

            try
            {
                string SourceJson = Common.GetRequest("SourceJson");
                int U_ID = 0;
                int updatResult = MgrServices.AmountService.OperationFormula(SourceJson, U_ID);
                context.Response.Write(updatResult);
            }
            catch
            {


            }
        }

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-12-13
        /// 功能介绍：修改常模解释信息
        /// </summary>
        /// <param name="context"></param>
        public void Update_NExp(HttpContext context)
        {

            try
            {
                string expJson = Common.GetRequest("NE_Json");
                int result = 0;
                result = MgrServices.AmountService.UpdateExp(expJson);
                context.Response.Write(result);
            }
            catch
            {


            }
        }



        public void update_NW(HttpContext context)
        {

            try
            {
                string expJson = Common.GetRequest("NW_Json");
                int result = 0;
                result = MgrServices.AmountService.IpdateNw(expJson);
                context.Response.Write(result);
            }
            catch
            {


            }
        }





        public DataSet GetWD_SubList()
        {
            DataSet sources = new DataSet();
            try
            {
                string LB_Code = Common.GetRequest("LB_Code");
                string WD_Code = Common.GetRequest("WD_Code");
                sources = MgrServices.AmountService.GetWD_SubList(WD_Code, LB_Code);

            }
            catch
            {

            }
            return sources;

        }



        private void ShowUpdateZH(HttpContext context)
        {
            try
            {

                //  SubJectEntity
                DataSet SourceTemps = new DataSet();
                SourceTemps = GetWD_SubList();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    //SourceTemps.Tables[0] [量表直接关系的题干]
                    //SourceTemps.Tables[1]维度题干

                    //L_W_S
                    SubJectEntity info = new SubJectEntity();
                    DataTable LB_Temp = SourceTemps.Tables[0];
                    DataTable WD_Temp = SourceTemps.Tables[1];


                    List<SubJectEntity> lb_List = new List<SubJectEntity>();

                    List<SubJectEntity> wd_List = new List<SubJectEntity>();
                    L_W_S _lws = new L_W_S();
                    if (LB_Temp != null && LB_Temp.Rows.Count > 0)
                    {

                        foreach (DataRow Dtr in LB_Temp.Rows)
                        {
                            info = new SubJectEntity();
                            info.SubjectCode = Dtr["SubjectCode"].ToString();
                            info.SubjectContent = Dtr["SubjectContent"].ToString();
                            info.Sort = Convert.ToInt32(Dtr["Sort"].ToString());
                            lb_List.Add(info);
                        }

                    }
                    if (WD_Temp != null && WD_Temp.Rows.Count > 0)
                    {

                        foreach (DataRow Dtr in WD_Temp.Rows)
                        {
                            info = new SubJectEntity();
                            info.SubjectCode = Dtr["SubjectCode"].ToString();
                            info.SubjectContent = Dtr["SubjectContent"].ToString();
                            info.Sort = Convert.ToInt32(Dtr["Sort"].ToString());
                            wd_List.Add(info);
                        }
                    }

                    _lws.LB_SubJectEntity = lb_List;
                    _lws.WD_SubJectEntity = wd_List;
                    string json = new JavaScriptSerializer().Serialize(_lws);
                    context.Response.Write(json);

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


        public void UpdateWD(HttpContext context)
        {
            try
            {
                string D_Code = Common.GetRequest("D_Code");
                string W_Name = Common.GetRequest("W_Name");
                string SubjectNum = Common.GetRequest("S_Total");
                int result = 0;

                result = MgrServices.AmountService.UpdateWDMess(W_Name, SubjectNum, D_Code);
                context.Response.Write(result);

            }
            catch
            {

            }


        }

        public void addWd_Tg(HttpContext context)
        {
            try
            {
                string D_Code = Common.GetRequest("D_Code");
                string S_Code = Common.GetRequest("S_Code");
                int result = 0;

                result = MgrServices.AmountService.SaveDS_Relation(D_Code, S_Code);
                context.Response.Write(result);

            }
            catch
            {

            }

        }
        public void zhidaoyu(HttpContext context)
        {
            string AmountCode = Common.GetRequest("AmountCode");
            string textareas = Common.GetRequest("textareas");
            bool result=   MgrServices.AmountService.zhidaoyu(AmountCode, textareas);
            context.Response.Write(result);
        }



        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

    public class AmountPagesEntity
    {
        //量表名称
        //量表类型
        //显示名称
        //适用人群
        //量表介绍
        //报告图表
        //维度编码
        //维度名称
        //量表指导语

        // private 

        private string _AmountName;
        /// <summary>
        /// 量表名称
        /// </summary>
        public string AmountName
        {
            get { return _AmountName; }
            set { _AmountName = value; }
        }
        private int _AmountTypeID;
        /// <summary>
        /// 量表类型
        /// </summary>
        public int AmountTypeID
        {
            get { return _AmountTypeID; }
            set { _AmountTypeID = value; }
        }
        private string _AmountDisName;
        /// <summary>
        /// 显示名称
        /// </summary>
        public string AmountDisName
        {
            get { return _AmountDisName; }
            set { _AmountDisName = value; }
        }
        private string _Peoples;
        /// <summary>
        /// 适用人群
        /// </summary>
        public string Peoples
        {
            get { return _Peoples; }
            set { _Peoples = value; }
        }
        private string _AmountMarks;
        /// <summary>
        /// 量表介绍
        /// </summary>
        public string AmountMarks
        {
            get { return _AmountMarks; }
            set { _AmountMarks = value; }
        }
        private string _TB;
        /// <summary>
        /// 报告图表
        /// </summary>
        public string TB
        {
            get { return _TB; }
            set { _TB = value; }
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
        private string _DimensionName;
        /// <summary>
        /// 维度名称
        /// </summary>
        public string DimensionName
        {
            get { return _DimensionName; }
            set { _DimensionName = value; }
        }

        private string _AmountGuidance;
        /// <summary>
        /// 量表指导语
        /// </summary>
        public string AmountGuidance
        {
            get { return _AmountGuidance; }
            set { _AmountGuidance = value; }
        }
        public int AmountSource { get; set; }

    }


    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-10-28
    /// 功能介绍：题干JSON实体
    /// </summary>
    public class TG_Update
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
    public class TZ_Update
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
    public class JsonEntity_Update
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



    public class SubJectEntity
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

        private int _Sort;
        /// <summary>
        /// 题干题号
        /// </summary>
        public int Sort
        {
            get { return _Sort; }
            set { _Sort = value; }
        }
    }

    public class L_W_S
    {
        private List<SubJectEntity> _LB_SubJectEntity;

        public List<SubJectEntity> LB_SubJectEntity
        {
            get { return _LB_SubJectEntity; }
            set { _LB_SubJectEntity = value; }
        }

        private List<SubJectEntity> _WD_SubJectEntity;

        public List<SubJectEntity> WD_SubJectEntity
        {
            get { return _WD_SubJectEntity; }
            set { _WD_SubJectEntity = value; }
        }

    }
}