using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using CrisisInterfere.projrem;

namespace CrisisInterfere.FunctionModular.HeartEvaluation.Ajax
{
    /// <summary>
    /// HeartEvaluationAdd 的摘要说明
    /// 量表添加一般处理逻辑
    /// 创建人：刘玉京
    /// 创建时间：2016-10-11
    /// </summary>
    public class HeartEvaluationAdd : IHttpHandler, IReadOnlySessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            string Remark = Common.GetRequest("Remark");
            switch (Remark)
            {
                case "AddAmount":
                    AddAmount(context);//添加量表描述
                    break;
                case "LoadAmountDimension":
                    string AmountCode = Common.GetRequest("AmountName");
                    int AmountTypeID = Convert.ToInt32(Common.GetRequest("AmountType"));
                    GetSouTempS(AmountCode, AmountTypeID, context);
                    break;
                case "AmountType":
                    InitAmountType(context);
                    break;
                case "SaveAD":
                    SaveAD_Relation(context);
                    break;
                case "InitNameSelect":
                    InitAmountNameSelect(context);
                    break;
                case "Exists":
                    Exists(context);
                    break;
                case "repeat":
                    repeat(context);
                    break;

            }

        }

        /// <summary>
        /// 添加量表介绍方法
        /// </summary>
        /// <param name="context"></param>
        public void AddAmount(HttpContext context)
        {
            try
            {

                string _Start_Age = Common.GetRequest("T_StartPeoples");
                string _End_Age = Common.GetRequest("T_EndPeoples");


                string Amount_Name = Common.GetRequest("T_Name");//量表名称
                string Amount_DisplayName = Common.GetRequest("T_DisplayName");//显示名称
                int Amount_TypeID = Convert.ToInt32(Common.GetRequest("T_TypeID"));//量表类别ID
                string Amount_ApplyPeoples = Common.GetRequest("T_ApplyPeoples");//适用人群
                string Amount_Marks = Common.GetRequest("T_Marks");//量表描述
                string Amount_Guidance = Common.GetRequest("T_Guidance");//指导语
                CrisisInterfere.AmountService.Amount_InfoEntity entityinfo = new AmountService.Amount_InfoEntity();
                entityinfo._amount_name = Amount_Name;
                entityinfo._amount_displayname = Amount_DisplayName;
                entityinfo._amount_typeid = Amount_TypeID;
                entityinfo._amount_subjectnum = 0;//量表包含题目数量
                entityinfo._start_applypeoples = Amount_ApplyPeoples;//最小的适用年龄
                entityinfo._end_applypeoples = _End_Age;//最大适用年龄
                entityinfo._amount_source = 1;//1:维度组合  2：自编量表
                entityinfo._amount_marks = Amount_Marks;//量表描述
                entityinfo._amount_guidance = Amount_Guidance;//量表指导语
                entityinfo._createtime = DateTime.Now;//创建时间
                entityinfo._completeamount = 25;//保存完量表描述的完成度是25%
                entityinfo._is_delete = 0;//是否删除标识
                entityinfo._u_id = 0;
                string _temp = Common.GetSessionValue("UserID", context);
                if (_temp == null)
                    return;
                entityinfo.amountCreatePerson = Convert.ToInt32(_temp);


                string AmountCode = "";//维度编码

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

        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-25
        /// 功能介绍：根据量表编码和量表类型查询维度树形列表
        /// </summary>
        /// <param name="AmountName">量表编码</param>
        /// <param name="amountTypeID">量表类型</param>
        /// <param name="context"></param>
        public void GetSouTempS(string AmountName, int amountTypeID, HttpContext context)
        {
            DataSet SouceSet = new DataSet();
            SoureListEntity _SoureListEntity = new SoureListEntity();//页面数据集合
            List<AmountEntity> AmountEntityList = new List<AmountEntity>();//量表实体集合
            List<DimensionEntity> DimensionEntityList = new List<DimensionEntity>();//维度实体集合
            try
            {

                SouceSet = MgrServices.AmountService.GetAmountDimensionTree(AmountName, amountTypeID);
                if (SouceSet != null && SouceSet.Tables.Count > 0)
                {
                    DataTable AmountTemp = SouceSet.Tables[0];
                    DataTable DimensionTemp = SouceSet.Tables[1];

                    if (AmountTemp != null && AmountTemp.Rows.Count > 0)
                    {
                        AmountEntity _AmountEntity = new AmountEntity();

                        foreach (DataRow DTR in AmountTemp.Rows)
                        {
                            _AmountEntity = new AmountEntity();
                            _AmountEntity.AmountCode = DTR["Amount_Code"].ToString();
                            _AmountEntity.AmountName = DTR["Amount_DisplayName"].ToString();
                            _AmountEntity.AmountRemark = DTR["Amount_Marks"].ToString();
                            AmountEntityList.Add(_AmountEntity);
                        }
                    }

                    if (DimensionTemp != null && DimensionTemp.Rows.Count > 0)
                    {

                        DimensionEntity _DimensionEntity = new DimensionEntity();

                        foreach (DataRow SourceRow in DimensionTemp.Rows)
                        {
                            _DimensionEntity = new DimensionEntity();
                            _DimensionEntity.AmountCode = SourceRow["Amount_Code"].ToString();
                            _DimensionEntity.AmountTypeName = SourceRow["AmountType_Name"].ToString();
                            _DimensionEntity.AmountName = SourceRow["Amount_Name"].ToString();
                            _DimensionEntity.DimensionCode = SourceRow["DimensionCode"].ToString();
                            _DimensionEntity.DimensionName = SourceRow["DimensionName"].ToString();
                            DimensionEntityList.Add(_DimensionEntity);
                        }
                    }
                }
                _SoureListEntity.AmountEntityList = AmountEntityList;
                _SoureListEntity.DimensionEntityList = DimensionEntityList;

                string SourceJson = new JavaScriptSerializer().Serialize(_SoureListEntity);

                context.Response.Write(SourceJson);
            }
            catch
            {

            }
        }


        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-25
        /// 功能介绍：保存维度组合
        /// </summary>
        /// <param name="context"></param>
        public void SaveAD_Relation(HttpContext context)
        {
            try
            {
                string _uID = Common.GetSessionValue("UserID", context);
                if (_uID == null)
                    return;
                int UID = Convert.ToInt32(_uID);
                string DimensionJson = Common.GetRequest("AD_DimensionJson"); //维度组合Json
                string AmountCode = Common.GetRequest("AD_AmountCode");//量表编码
                int result = 0;//执行结果
                result = MgrServices.AmountService.SaveAD_Relation(AmountCode, DimensionJson, UID);
                context.Response.Write(new JavaScriptSerializer().Serialize(result));
            }
            catch
            { }


        }



        /// <summary>
        /// 创建人：刘玉京
        /// 创建时间：2016-10-25
        /// 功能介绍：初始化量表类别下拉列表
        /// </summary>
        private void InitAmountType(HttpContext context)
        {
            try
            {

                DataTable SourceTemp = new DataTable();
                SourceTemp = GetAmountType(context);
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
        /// 创建时间：2016-10-25
        /// 功能介绍：获取量表类别数据集合
        /// </summary>
        /// <returns></returns>
        private DataTable GetAmountType(HttpContext context)
        {
            DataTable SourceTemp = new DataTable();
            try
            {
                string LicenseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (LicenseCode == null)
                    return null;
                SourceTemp = MgrServices.AmountTypeService.GetAmountTypeTemp(LicenseCode);
            }
            catch (Exception ex)
            { }

            return SourceTemp;
        }



        /// <summary>
        /// 查询量表名称和编码的数据集合
        /// </summary>
        /// <returns></returns>
        public DataTable GetAmountNameList(HttpContext context)
        {

            DataTable SourceTemp = new DataTable();

            try
            {
                var enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (enterpriseCode == null)
                    return null;
                SourceTemp = MgrServices.AmountService.GetAmountNameList(enterpriseCode);
            }
            catch
            { }

            return SourceTemp;
        }


        private void InitAmountNameSelect(HttpContext context)
        {

            try
            {

                DataTable SourceTemp = new DataTable();
                SourceTemp = GetAmountNameList(context);
                if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in SourceTemp.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["Amount_DisplayName"].ToString();
                        mex.Value = DTR["Amount_Code"].ToString();
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
        /// 保存量表介绍
        /// </summary>
        private void SaveAmount()
        {


        }



        public void repeat(HttpContext context)
        {
            string AmountCode = Common.GetRequest("AmountCode");
            string DimensionName = Common.GetRequest("DimensionName");
            bool name = Convert.ToBoolean(MgrServices.AmountService.repeat(AmountCode, DimensionName));
            context.Response.Write(name);
        }



        /// <summary>
        /// 查找是否还存在同名量表名称
        /// </summary>
        public void Exists(HttpContext context)
        {
            string Amount_Name = Common.GetRequest("GaugeName");
            string Acode = Common.GetRequest("Acode");
            bool name = Convert.ToBoolean(MgrServices.AmountService.Exists(Amount_Name, Acode));




            //ObjectMapper mapper = new ObjectMapper();
            //String resultString = "";

            //try
            //{
            //    resultString = mapper.writeValueAsString(map);
            //}
            //catch (JsonProcessingException e)
            //{
            //    e.printStackTrace();
            //}

            if (name)
            {
                context.Response.Write("{\"valid\":false}");
            }
            else
            {
                context.Response.Write("{\"valid\":true}");
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

    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-10-24
    /// 功能介绍：量表实体
    /// </summary>
    public class AmountEntity
    {

        private string _AmountCode;

        /// <summary>
        /// 量表编号
        /// </summary>
        public string AmountCode
        {
            get { return _AmountCode; }
            set { _AmountCode = value; }
        }


        private string _AmountName;

        /// <summary>
        /// 量表名称
        /// </summary>
        public string AmountName
        {
            get { return _AmountName; }
            set { _AmountName = value; }
        }


        private string _AmountRemark;

        /// <summary>
        /// 量表描述
        /// </summary>
        public string AmountRemark
        {
            get { return _AmountRemark; }
            set { _AmountRemark = value; }
        }
    }

    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-10-24
    /// 功能介绍：量表维度表实体
    /// </summary>
    public class DimensionEntity
    {

        private string _AmountCode;

        /// <summary>
        /// 量表编号
        /// </summary>
        public string AmountCode
        {
            get { return _AmountCode; }
            set { _AmountCode = value; }
        }



        private string _AmountName;
        /// <summary>
        /// 量表名称
        /// </summary>
        public string AmountName
        {
            get { return _AmountName; }
            set { _AmountName = value; }
        }

        private string _AmountTypeName;
        /// <summary>
        /// 量表类别
        /// </summary>
        public string AmountTypeName
        {
            get { return _AmountTypeName; }
            set { _AmountTypeName = value; }
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

        private int _SubjectNum;
        /// <summary>
        /// 维度题目数量
        /// </summary>
        public int SubjectNum
        {
            get { return _SubjectNum; }
            set { _SubjectNum = value; }
        }



    }

    /// <summary>
    /// 创建人刘玉京
    /// 创建时间：2016-10-24
    /// 功能介绍：页面量表维度树形展现集合实体
    /// </summary>
    public class SoureListEntity
    {

        private List<AmountEntity> _AmountEntityList;

        /// <summary>
        /// 量表数据集合
        /// </summary>
        public List<AmountEntity> AmountEntityList
        {
            get { return _AmountEntityList; }
            set { _AmountEntityList = value; }
        }


        private List<DimensionEntity> _DimensionEntityList;

        /// <summary>
        /// 量表维度表集合
        /// </summary>
        public List<DimensionEntity> DimensionEntityList
        {
            get { return _DimensionEntityList; }
            set { _DimensionEntityList = value; }
        }

    }


}