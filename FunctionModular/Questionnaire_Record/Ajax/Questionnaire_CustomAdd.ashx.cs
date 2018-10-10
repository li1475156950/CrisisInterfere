using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using BR_Service;

namespace CrisisInterfere.FunctionModular.Questionnaire_Record.Ajax
{
    /// <summary>
    /// Questionnaire_CustomAdd 的摘要说明
    /// </summary>
    public class Questionnaire_CustomAdd : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "AddQuestionnaire":
                    AddQuestionnaire(context, operationType);
                    break;
                case "CopyQuestionnaire":
                    AddQuestionnaire(context, operationType);
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

        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017-4-5 17：48
        /// 功能介绍：保存新建的问卷
        /// </summary>
        private void AddQuestionnaire(HttpContext context, string operationType)
        {
            try
            {
                string name = Common.GetRequest("name");//问卷名称
                string _enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
                if (operationType == "CopyQuestionnaire")
                {
                    DataTable dt = MgrServices.QuestionnaireService.GetLikeName(name, _enterpriseCode);
                    if (dt.Rows.Count == 0)
                        name += "(1)";
                    else
                    {
                        int length1 = name.Length;
                        string temp = "";
                        List<int> index = new List<int>();
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            temp = dt.Rows[i][0].ToString();
                            int left = temp.LastIndexOf("(");
                            int right = temp.LastIndexOf(")");
                            string temp2 = temp.Remove(left, (right - left + 1));
                            if (name.Length == temp2.Length)
                            {
                                temp = temp.Substring(left + 1, (right - left - 1));
                                if (index.Count == 0)
                                    index.Add(Convert.ToInt32(temp));
                                else
                                    index.Add(Convert.ToInt32(temp));
                            }
                        }
                        //int _temp = -1;
                        index.Add(index.Max() + 1);
                        //for (int i = 1; i < index.Max() + 1; i++)
                        //{
                        //    if (index.IndexOf(i) < 0)
                        //    {
                        //        _temp = i;
                        //        name = name + "(" + i + ")";
                        //        break;
                        //    }
                        //}
                        //if (_temp == -1)
                            name = name + "(" + index.Max() + ")";
                    }
                }

                if (System.Text.Encoding.GetEncoding("GB2312").GetByteCount(name) >= 256)
                {
                    context.Response.Write(-1);
                    return;
                }
                string _uID = Common.GetSessionValue("UserID", context);//用户ID  
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);//企业ID  
                Int64 uId = 0;
                if (_uID != null)
                    uId = Convert.ToInt64(_uID);
                string subjectJson = Common.GetRequest("Json");//题干和题支信息的JSon语句
                if (operationType == "CopyQuestionnaire")
                {
                    subjectJson = subjectJson.Remove(subjectJson.IndexOf("["), 1);
                    subjectJson = subjectJson.Remove(subjectJson.LastIndexOf("]"), 1);
                }
                string guidance = Common.GetRequest("Guidance");//指导语
                bool isFinish = Common.GetRequest("Is_Finish") == "true" ? true : false;//问卷是否完成
                int result = MgrServices.QuestionnaireService.SaveQuestionnaire(subjectJson, name, uId, enterpriseCode, guidance, isFinish);//保存题干和题支关系信息
                context.Response.Write(result);
            }
            catch
            {

            }
        }

        #region 实体类

        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/5 17：05
        /// 说明：问卷管理的题支实体类
        /// </summary>
        public class Questionnaire_TZ
        {
            private string _tzCode;
            /// <summary>
            /// 题支编码
            /// </summary>
            public string TZ_Code
            {
                get { return _tzCode; }
                set { _tzCode = value; }
            }
            private int _tzNum;
            /// <summary>
            /// 题支顺序
            /// </summary>
            public int TZ_Num
            {
                get { return _tzNum; }
                set { _tzNum = value; }
            }
            private string _serialNumber;
            /// <summary>
            /// 题支的序号
            /// </summary>
            public string SerialNumber
            {
                get { return _serialNumber; }
                set { _serialNumber = value; }
            }

            private string _tzContent;
            /// <summary>
            /// 题支内容
            /// </summary>
            public string TZ_Content
            {
                get { return _tzContent; }
                set { _tzContent = value; }
            }
            private string _score;
            /// <summary>
            /// 题支分数
            /// </summary>
            public string TZ_Score
            {
                get { return _score; }
                set { _score = value; }
            }
            private string _skipCode;
            /// <summary>
            /// 跳转到题干编码
            /// </summary>
            public string TZ_Skip
            {
                get { return _skipCode; }
                set { _skipCode = value; }
            }

        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/5 17：05
        /// 说明：问卷管理的题干实体类
        /// </summary>
        public class Questionnaire_TG
        {
            private string _tgCode;
            /// <summary>
            /// 题干编码
            /// </summary>
            public string TG_Code
            {
                get { return _tgCode; }
                set { _tgCode = value; }
            }
            private string _tgContent;
            /// <summary>
            /// 题干内容
            /// </summary>
            public string TG_Content
            {
                get { return _tgContent; }
                set { _tgContent = value; }
            }
            private int _sort;
            /// <summary>
            /// 题干的序号
            /// </summary>
            public int TG_Sort
            {
                get { return _sort; }
                set { _sort = value; }
            }
            private string _score;
            /// <summary>
            /// 题干分数
            /// </summary>
            public string TG_Score
            {
                get { return _score; }
                set { _score = value; }
            }
            private string _trueAnwser;
            /// <summary>
            /// 多选题的正确选项
            /// </summary>
            public string TG_TrueAnswer
            {
                get { return _trueAnwser; }
                set { _trueAnwser = value; }
            }
            private int _type;
            /// <summary>
            /// 题干类型。0：单选；1：多选；2：填空；3：简答。
            /// </summary>
            public int TG_Type
            {
                get { return _type; }
                set { _type = value; }
            }
            private string _instruction;
            /// <summary>
            /// 问卷指导语
            /// </summary>
            public string Instruction
            {
                get { return _instruction; }
                set { _instruction = value; }
            }
            private string _name;
            /// <summary>
            /// 问卷名称
            /// </summary>
            public string Name
            {
                get { return _name; }
                set { _name = value; }
            }
            private Int64 _uId;
            /// <summary>
            /// 创建人
            /// </summary>
            public Int64 UID
            {
                get { return _uId; }
                set { _uId = value; }
            }
            private int _isDelete;
            /// <summary>
            /// 是否删除
            /// </summary>
            public int IsDelete
            {
                get { return _isDelete; }
                set { _isDelete = value; }
            }
            private string _questionCode;
            /// <summary>
            /// 问卷编码
            /// </summary>
            public string QuestionCode
            {
                get { return _questionCode; }
                set { _questionCode = value; }
            }

        }

        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/4/5 17：05
        /// 说明：解析页面JSOIN数据集合的实体集
        /// </summary>
        public class Questionnaire_JSonEntity
        {
            private Questionnaire_TG _tgInfo;
            /// <summary>
            /// 题干实体类
            /// </summary>
            public Questionnaire_TG TG_Info
            {
                get { return _tgInfo; }
                set { _tgInfo = value; }
            }
            private List<Questionnaire_TZ> _tzInfo;
            /// <summary>
            /// 题支实体类集合
            /// </summary>
            public List<Questionnaire_TZ> TZ_Info
            {
                get { return _tzInfo; }
                set { _tzInfo = value; }
            }
        }

        #endregion

    }
}