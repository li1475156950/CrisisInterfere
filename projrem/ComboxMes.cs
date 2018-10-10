using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.projrem
{
    /// <summary>
    /// 创建人：刘玉京
    /// 创建时间：2016-09-07
    /// 功能介绍：下拉列表实体类
    /// </summary>
    public class ComboxMes
    {
        String _Value;//值

        public String Value
        {
            get { return _Value; }
            set { _Value = value; }
        }
        String _Text;//显示值

        public String Text
        {
            get { return _Text; }
            set { _Text = value; }
        }

        Int32 _Use;//是否使用

        public Int32 Use
        {
            get { return _Use; }
            set { _Use = value; }
        }
        Int32 _Funtype;//是否使用

        public Int32 Funtype
        {
            get { return _Funtype; }
            set { _Funtype = value; }
        }
        String _RoleType;//值
        public string RoleType
        {
            get { return _RoleType; }
            set { _RoleType = value; }
        }
    }
    public class GetList
    {
        public int Num { get; set; }
        public string id { get; set; }
        public string Name { get; set; }
        public string Week1 { get; set; }
        public string Week2 { get; set; }
        public string Week3 { get; set; }
        public string Week4 { get; set; }
        public string Week5 { get; set; }
        public string Week6 { get; set; }
        public string Week7 { get; set; }
    }
    public class GetRoleModel
    {
        public int RoleType { get; set; }
        public int IsOpen { get; set; }
        public string Role_Name { get; set; }
    }
    public class QModel
    {
        public string question { get; set; }
        public string answers { get; set; }
        public string OptionCode { get; set; }
        public string Faction { get; set; }
        public string IndexNum { get; set; }
    }
    /// <summary>
    /// 创建人：田闯
    /// 创建时间：2017/4/19    
    /// </summary>
    public class QuestionnaireModel
    {
        /// <summary>
        /// 题干标题
        /// </summary>
        public string question { get; set; }
        /// <summary>
        /// 题干分值
        /// </summary>
        public string sub_score { get; set; }
        /// <summary>
        /// 题干正确选项
        /// </summary>
        public string sub_true { get; set; }
        /// <summary>
        /// 题干类型
        /// </summary>
        public int s_type { get; set; }
        /// <summary>
        /// 题支编码
        /// </summary>
        public string o_code { get; set; }
        /// <summary>
        /// 题支分值
        /// </summary>
        public string o_score { get; set; }
        /// <summary>
        /// 题支序号
        /// </summary>
        public string o_index { get; set; }
        /// <summary>
        /// 题支内容
        /// </summary>
        public string o_content { get; set; }
        /// <summary>
        /// 题支逻辑跳转
        /// </summary>
        public string skipcode { get; set; }
        /// <summary>
        /// 题支选项内容
        /// </summary>
        public string serialNumber { get; set; }
    }
}