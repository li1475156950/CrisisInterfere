using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using BR_Service;
using CrisisInterfere.projrem;
using CrisisInterfere.PersonalReportService;
using CrisisInterfere.RecycleBinService;
using System.Web.SessionState;
using System.IO;
using System.Text;
using System.Runtime.Serialization.Json;
using System.Runtime.Serialization.Formatters.Binary;
namespace CrisisInterfere.FunctionModular.PersonalReport.Ajax
{
    /// <summary>
    /// PersonalReport 的摘要说明
    /// </summary>
    public class PersonalReport : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            int SessionUserID = 0;
            string _uID = Common.GetSessionValue("UserID", context);
            if (_uID == null)
                return;
            SessionUserID = Convert.ToInt32(_uID);
            string operationType = Common.GetRequest("operationType");
            switch (operationType)
            {
                case "Bind":
                    InitiPersonalReportTable(SessionUserID, context);
                    break;
                case "RemindByEmail":
                    RemindByEmail(context);
                    break;
                case "PRAdd":
                    context.Response.Write(PRAdd());
                    break;
                case "UpdatePR":
                    context.Response.Write(Update());
                    break;
                case "GetExcel":
                    string AUserID = Common.GetRequest("Auserid");
                    GetExcel(AUserID, context);
                    break;
                case "RBdelete":
                    string RBdelete = Common.GetRequest("receveid");
                    context.Response.Write(PersonalR(RBdelete, context));
                    break;
                case "SendWrite":
                    string UIDs = context.Request["uid"].ToString();
                    string title01 = "";
                    if (Common.GetRequest("title") != null)
                    {
                        title01 = Common.GetRequest("title").ToString();
                    }
                    string content01 = context.Request["content"].ToString();
                    string AnswerID = Common.GetRequest("receveid");
                    context.Response.Write(Write(UIDs, title01, content01, 2, SessionUserID, AnswerID));
                    break;
                case "SendState":
                    string AnswerIDs = Common.GetRequest("receveid");
                    context.Response.Write(PInsert(AnswerIDs));
                    break;
                case "ExportData":
                    ExportData(context);
                    break;
                default:
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
        public void InitiPersonalReportTable(int Uid, HttpContext context)
        {
            int amountid = 0;
            int startPageIndex = Convert.ToInt32(Common.GetRequest("StartPageIndex"));
            int endPageIndex = Convert.ToInt32(Common.GetRequest("EndPageIndex"));
            if (Common.GetRequest("amountTypeID") != null)
            {
                amountid = Convert.ToInt32(Common.GetRequest("amountTypeID"));
            }
            int departmentID = 0;
            string EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            if (Common.GetRequest("departmentID") != null && Common.GetRequest("departmentID") != "")
            {
                departmentID = Convert.ToInt32(Common.GetRequest("departmentID"));
            }

            string testTypeID = Common.GetRequest("testTypeID");
            int pushStatusID = Convert.ToInt32(Common.GetRequest("pushStatusID"));
            int amountTypeID = 0;
            string loginName = string.Empty;
            if (!string.IsNullOrEmpty(Common.GetRequest("loginName")))
            {
                loginName = Common.GetRequest("loginName");
            }
            try
            {
                PageInfo page = new PageInfo();
                DataSet SourceTemps = new DataSet();
                SourceTemps = MgrServices.PersonalReportService.InitiPersonalReportTable(Uid, amountTypeID, amountid, departmentID, testTypeID, pushStatusID, loginName, EnterpriseCode, startPageIndex, endPageIndex);
                if (SourceTemps.Tables[1].Rows.Count == 0)
                {
                    if (startPageIndex > 10)
                    {
                        startPageIndex = startPageIndex - 10;
                        endPageIndex = endPageIndex - 10;
                        SourceTemps = MgrServices.PersonalReportService.InitiPersonalReportTable(Uid, amountTypeID, amountid, departmentID, testTypeID, pushStatusID, loginName, EnterpriseCode, startPageIndex, endPageIndex);
                    }
                }
                DataTable SourceTemp = new DataTable();
                if (SourceTemps != null && SourceTemps.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(SourceTemps.Tables[0].Rows[0][0]);
                    SourceTemp = SourceTemps.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {


                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            String[] arr =
                            {                              
                                DTR["AnswerAdd_ID"].ToString(),//0                          
                                DTR["PageIndex"].ToString(),//1
                                DTR["U_LoginName"].ToString(),//2
                                DTR["U_Name"].ToString(),//3
                                DTR["D_Name"].ToString(),//4
                                DTR["Amount_Name"].ToString(),//5
                                DTR["Answer_CreateTime"].ToString(),//6
                                DTR["PSstates"].ToString(),//7 1是没有发送，2是已经发生
                                "",//操作//8
                                DTR["U_ID"].ToString(),//9
                                DTR["Answer_CreateTime"].ToString(), //10
                                DTR["IS_SeeReport"].ToString(),//0是没有发送，1是已经发送11
                                DTR["Amount_Code"].ToString(),//12
                                DTR["Amount_Source"].ToString(),//13
                                DTR["BelongToCode"].ToString(),
                                DTR["BelongToAmount"].ToString()==""?DTR["Amount_Code"].ToString():DTR["BelongToAmount"].ToString()
                               //DTR["Rtype"].ToString(),//个体报告类型14
                            };
                            page.data.Add(arr);

                        }


                    }

                }
                String jsons = Common.ObjectToJson(page.data);
                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);
            }
            catch (Exception)
            {

                throw;
            }
        }
        //邮件提醒
        public void RemindByEmail(HttpContext context)
        {
            try
            {
                string email = "";
                string[] UserID = Common.GetRequest("uid").Split(',');//用户id
                string Anserid = Common.GetRequest("receveid");

                string subject = "个体报告提醒";
                string content = "您的报告已经授权！";
                for (int i = 0; i < UserID.Length; i++)
                {

                    if (!string.IsNullOrEmpty(UserID[i]))
                    {
                        email = MgrServices.UserAddService.GetUserEmailByUserID(Convert.ToInt32(UserID[i]));
                        if (email != null && email != "")
                        {
                            EmailHelper.SendEmail(email, subject, content);
                        }
                    }
                }
                if (email != null && email != "")
                {
                    PInsert(Anserid);
                }
                context.Response.Write(true);
            }
            catch
            { context.Response.Write(false); }
        }
        /// <summary>
        /// 添加个体报告
        /// </summary>
        /// <returns></returns>
        public bool PRAdd()
        {
            try
            {
                PersonalReportAddEntity entityInfo = new PersonalReportAddEntity();
                entityInfo._answeraddid = Convert.ToInt32(Common.GetRequest("AID"));
                entityInfo._pradd_dimension = Common.GetRequest("InputJson");
                entityInfo._acode_id = Common.GetRequest("ACode");
                entityInfo._pradd_newadd = Common.GetRequest("NewJsons");
                entityInfo._ReporType = Convert.ToInt32(Common.GetRequest("recoverys"));
                long Prdd = MgrServices.PersonalReportService.PRInsert(entityInfo);
                //var ss = MgrServices.AnswerAddService.GetMMPI_Operation_Temp();//刘亚娟
                if (Prdd > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }

        }
        /// <summary>
        /// 更新个体报告
        /// </summary>
        /// <returns></returns>
        public bool Update()
        {
            try
            {
                PersonalReportAddEntity entityInfo = new PersonalReportAddEntity();
                entityInfo._pradd_dimension = Common.GetRequest("InputJson");
                entityInfo._acode_id = Common.GetRequest("ACode");
                entityInfo._answeraddid = Convert.ToInt32(Common.GetRequest("AID"));
                entityInfo._pradd_newadd = Common.GetRequest("NewJsons");
                entityInfo._ReporType = Convert.ToInt32(Common.GetRequest("recoverys"));
                return MgrServices.PersonalReportService.UpdateByAnswerID(entityInfo);
            }
            catch
            {
                return false;
            }
        }

        public void GetExcel(string AUserID, HttpContext context)
        {
            AUserID = "63,64,";
            if (AUserID != null && AUserID != "")
            {
                AUserID = AUserID.Substring(0, AUserID.Length - 1);
            }
            var name = DateTime.Now.ToString("yyyyMMddhhmmss") + new Random(DateTime.Now.Second).Next(10000);
            var CreatePath = System.Web.HttpContext.Current.Server.MapPath("~/xls_down/" + name + ".xls");
            MgrServices.PersonalReportService.GetPersonExcel(AUserID, CreatePath);
            downloadfile(CreatePath);
            //context.Response.Write(true);



        }
        void downloadfile(string s_path)
        {
            System.IO.FileInfo file = new System.IO.FileInfo(s_path);
            HttpContext.Current.Response.ContentType = "application/ms-download";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.AddHeader("Content-Type", "application/octet-stream");
            HttpContext.Current.Response.Charset = "utf-8";
            HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment;filename=" + System.Web.HttpUtility.UrlEncode(file.Name, System.Text.Encoding.UTF8));
            HttpContext.Current.Response.AddHeader("Content-Length", file.Length.ToString());
            HttpContext.Current.Response.WriteFile(file.FullName);
            HttpContext.Current.Response.Flush();
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.End();

        }
        public bool PersonalR(string RBdeleteID, HttpContext context)
        {
            try
            {
                long result = 0;
                string names = context.Request["name"];
                string enterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                string[] name = names.Split(',');
                string[] receiveID = RBdeleteID.Split(',');
                if (receiveID.Length > 0)
                {
                    for (int i = 0; i < receiveID.Length; i++)
                    {
                        CrisisInterfere.RecycleBinService.RecycleBinModel model = new RecycleBinService.RecycleBinModel();
                        model.RBTitle = "删除个体报告-" + name[i]; //标题
                        model.RBModularID = 16; //对应模块权限ID
                        model.RBTableName = "AnswerAdd"; //删除的表名
                        model.RBFieldName = "AnswerAdd_ID"; //删除相对应字段的id
                        model.RBFieldValue = receiveID[i].ToString();//删除列名的id
                        model.RBDeleteFieldName = "AnswerIsDelete"; //表的删除字段一般 某某某_Delete
                        model.RBDeleteTime = DateTime.Now;
                        model.EnterpriseCode = enterpriseCode;
                        model.RBExcutePerson = Common.GetSessionValue("loginName", context);
                        if (model.RBExcutePerson == null)
                            return false;
                        result = Convert.ToInt32(MgrServices.RecycleBinService.PutDataInRecycleBin(model));
                    }
                }
                if (result > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            //删除id的值,批量删除

        }
        /// <summary>
        /// 新建信息--1.新建 2.草稿箱 3.已发送 4.发送成功/未读 5.已查看 
        /// </summary>
        /// <param name="sender">发送到那个用户的id(接受者id)</param>
        /// <param name="Title"></param>
        /// <param name="Content"></param>
        /// /// <param name="Write">3是发送，2是草稿</param>
        /// <returns></returns>
        public bool Write(string Receveid, string Title, string Content, int Write, int UserID, string AnserID)
        {
            bool msgs = false;
            try
            {
                string JumpType = "0";
                bool result = MgrServices.Letter.BulkInsert(Receveid, Title, Content, Write, UserID, "1", JumpType);
                if (result)
                {
                    msgs = PInsert(AnserID);
                }
                return msgs;
            }
            catch
            {
                return msgs;
            }
        }
        /// <summary>
        /// 添加推送的状态
        /// </summary>
        /// <param name="Anserid"></param>
        /// <returns></returns>
        public bool PInsert(string Anserid)
        {
            bool result = false;
            if (Anserid != null && Anserid != "")
            {
                string[] Anserids = Anserid.Split(',');//回答者的id

                for (int j = 0; j < Anserids.Length; j++)
                {
                    PushStatusEntitys Pmodel = new PushStatusEntitys();
                    Pmodel._answeraddid = Convert.ToInt32(Anserids[j]);
                    Pmodel._psstate = 2;
                    long PInsert = MgrServices.PersonalReportService.Insert(Pmodel);
                    if (PInsert > 0)
                    {
                        result = true;
                    }
                    else
                    {
                        result = false;
                    }
                }
            }
            else
            {
                result = false;
            }
            return result;
        }
        public void ExportData(HttpContext context)
        {
            List<UserExportInfo> lu = JsonDeserialize<List<UserExportInfo>>(Common.GetRequest("userInfoList"));
            List<string> ls = JsonDeserialize<List<string>>(Common.GetRequest("amountNameList"));
            for (int i = 0; i < ls.Count; i++)  //外循环是循环的次数
            {
                for (int j = ls.Count - 1; j > i; j--)  //内循环是 外循环一次比较的次数
                {

                    if (ls[i] == ls[j])
                    {
                        ls.RemoveAt(j);
                    }
                }
            }
            List<FileInfo> li = new List<FileInfo>();
            //string AUserID = "110,108";
            string fileName;
            string path;
            for (int i = 0; i < ls.Count; i++)
            {
                List<UserExportInfo> luTemp = lu.Where(m => m.AmountName == ls[i]).ToList();
                string aae = lu[i].AnswerID.ToString();
                StringBuilder builder;
                FileInfo file;
                StreamWriter sw;
                GetToWord(luTemp, out fileName, out path, out builder, out file, out sw);
                sw.Write(builder);
                sw.Close();
                li.Add(file);
            }
            fileName = DateTime.Now.ToString("yyyyMMddhhmm") + "_Download.zip";//重新赋值为zip文件名称
            path = context.Server.MapPath("~/xls_down/" + fileName + ".xls");
            try
            {
                FileCompression.Compress(li, path, 5, 5);//压缩
                //context.Response.Clear();
                //context.Response.Buffer = true;
                //context.Response.Charset = "utf-8";
                //context.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
                //context.Response.ContentType = "application/octet-stream";
                //context.Response.WriteFile(path);
                //context.Response.Flush();
                ////context.Response.Close();
                //context.Response.End();
                context.Response.ContentType = "application/zip";
                FileStream fs = new FileStream(path, FileMode.Open, FileAccess.Read);
                //Byte[] bytes = new Byte[fs.Length];
                fs.Close();

                MemoryStream ms = new MemoryStream();
                FileStream file = new FileStream(path, FileMode.Open, FileAccess.Read);
                byte[] bytes = new byte[file.Length];
                file.Read(bytes, 0, (int)file.Length);
                ms.Write(bytes, 0, (int)file.Length);
                file.Close();
                ms.Close();
                context.Response.Write(ms.GetBuffer());
                HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
            catch (Exception ex)
            {

                throw;
            }


        }

        public void GetToWord(List<UserExportInfo> lu, out string fileName, out string path, out StringBuilder builder, out FileInfo file, out StreamWriter sw)
        {

            //AnswerID = "110";
            string StrJson = "";
            string Scorehtml = "";
            string ConvertScoreHtml = "";
            DataSet dataset = new DataSet();
            for (int i = 0; i < lu.Count; i++)
            {
                DataSet datasetTemp = MgrServices.PersonalReportService.ReportExport(lu[i].AnswerID.ToString());
                dataset.Merge(datasetTemp, true, MissingSchemaAction.AddWithKey);
            }

            DataTable dt = new DataTable();
            DataTable UserInfodt = new DataTable();
            if (dataset.Tables.Count > 0)
            {
                dt = dataset.Tables[0];
                UserInfodt = dataset.Tables[1];
            }
            Report ReportObj = new Report();
            DateTime RCreatetime = DateTime.Now;
            if (dt.Rows.Count > 0)
            {
                for (int j = 0; j < dt.Rows.Count; j++)
                {
                    StrJson = dt.Rows[j]["ReportJson"].ToString();
                    RCreatetime = DateTime.Parse(dt.Rows[j]["R_CreateDate"].ToString());
                }
            }
            if (StrJson != null && StrJson != "")
            {
                ReportObj = JsonDeserialize<Report>(StrJson);

            }
            builder = new StringBuilder();
            //存储路径  rtManager.Items[0].FindControl("check_Item")
            fileName = DateTime.Now.ToString("yyyyMMddhhmmss") + new Random(DateTime.Now.Second).Next(10000);
            path = HttpContext.Current.Server.MapPath("~/xls_down/" + fileName + ".xls");
            file = new FileInfo(path);
            //创建字符输出流
            sw = new StreamWriter(path, true, System.Text.UnicodeEncoding.UTF8);

            //需要导出的内容
            builder.Append("<html><head></head><body><table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" width='98%' >");
            //获取的量表维度         
            if (ReportObj.DimensionEntitys.Count > 0)
            {
                builder.Append("<tr><td colspan=\"" + (ReportObj.DimensionEntitys.Count * 2 + 6) + "\" align=\"center\">" + "量表名称" + "的报告详细</td></tr>");
            }
            else
            {
                builder.Append("<tr><td colspan=\"" + (0 * 2 + 6) + "\" align=\"center\">" + ReportObj.DimensionEntitys[0].AName + "的报告详细</td></tr>");
            }
            string Acode = ReportObj.DimensionEntitys[0].Acodes;
            //生成表格标题栏  --获取所有该量表的所有维度名称
            builder.Append("<tr><td align=\"center\" rowspan=\"2\">用户名</td><td align=\"center\" rowspan=\"2\">真实姓名</td><td align=\"center\" rowspan=\"2\">性别</td><td align=\"center\" rowspan=\"2\">年龄</td><td align=\"center\" rowspan=\"2\">部门</td>");
            if (ReportObj.DimensionEntitys != null)
            {
                for (int i = 0; i < ReportObj.DimensionEntitys.Count; i++)
                {
                    var WDname = ReportObj.DimensionEntitys[i].WD_Name;

                    //string ConvertS = "";
                    string ConvertS = "";
                    if (Acode == "LB_14809953564280" || Acode == "LB_14809270976120" || Acode == "LB_14810979035220")//取整
                    {
                        ConvertS = Math.Floor(Convert.ToDouble(Common.FormulaCalculator.Eval(ReportObj.DimensionEntitys[i].ConversionFormula))).ToString();
                    }
                    else if (Acode == "LB_14811661311050")
                    {
                        var A = ""; var B = ""; var C = ""; var D = ""; var E = ""; var F = ""; var G = ""; var H = ""; var I = ""; var L = ""; var M = ""; var N = "";
                        var O = ""; var Q1 = ""; var Q2 = ""; var Q3 = ""; var Q4 = "";
                        if (i < 16)
                        {
                            ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ReportObj.DimensionEntitys[i].ConversionFormula)), 2).ToString();
                            if (WDname.IndexOf("A") > -1)
                            {
                                A = ConvertS;
                            }
                            else if (WDname.IndexOf("B") > -1)
                            {
                                B = ConvertS;
                            }
                            else if (WDname.IndexOf("C") > -1)
                            {
                                C = ConvertS;
                            }
                            else if (WDname.IndexOf("D") > -1)
                            {
                                D = ConvertS;
                            }
                            else if (WDname.IndexOf("E") > -1)
                            {
                                E = ConvertS;
                            }
                            else if (WDname.IndexOf("F") > -1)
                            {
                                F = ConvertS;
                            }
                            else if (WDname.IndexOf("G") > -1)
                            {
                                G = ConvertS;
                            }
                            else if (WDname.IndexOf("H") > -1)
                            {
                                H = ConvertS;
                            }
                            else if (WDname.IndexOf("I") > -1)
                            {
                                I = ConvertS;
                            }
                            else if (WDname.IndexOf("L") > -1)
                            {
                                L = ConvertS;
                            }
                            else if (WDname.IndexOf("M") > -1)
                            {
                                M = ConvertS;
                            }
                            else if (WDname.IndexOf("N") > -1)
                            {
                                N = ConvertS;
                            }
                            else if (WDname.IndexOf("O") > -1)
                            {
                                O = ConvertS;
                            }
                            else if (WDname.IndexOf("Q1") > -1)
                            {
                                Q1 = ConvertS;
                            }
                            else if (WDname.IndexOf("Q2") > -1)
                            {
                                Q2 = ConvertS;
                            }
                            else if (WDname.IndexOf("Q3") > -1)
                            {
                                Q3 = ConvertS;
                            }
                            else if (WDname.IndexOf("Q4") > -1)
                            {
                                Q4 = ConvertS;
                            }

                        }
                        else
                        {
                            var ConvertResults = "";
                            if (i == 17)
                            {
                                // ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ReportObj.DimensionEntitys[i].ConversionFormula)), 2).ToString();
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("L", L).Replace("O", O).Replace("Q4", Q4).Replace("H", H).Replace("Q2", Q2).Replace("C", C);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            } if (i == 18)
                            {
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("A", A).Replace("E", E).Replace("F", F).Replace("H", H).Replace("Q2", Q2);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            }
                            if (i == 19)
                            {
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("C", C).Replace("E", E).Replace("F", F).Replace("N", N).Replace("A", A).Replace("M", M);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            } if (i == 20)
                            {
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("E", E).Replace("M", M).Replace("Q1", Q1).Replace("Q2", Q2).Replace("A", A).Replace("G", G);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            } if (i == 21)
                            {
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("C", C).Replace("F", F).Replace("O", O).Replace("Q4", Q4);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            } if (i == 22)
                            {
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("Q3", Q3).Replace("G", G).Replace("C", C).Replace("E", E).Replace("N", N).Replace("Q2", Q2).Replace("Q1", Q1);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            } if (i == 23)
                            {
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("A", A).Replace("B", B).Replace("E", E).Replace("F", F).Replace("H", H).Replace("I", I).Replace("M", M).Replace("N", N).Replace("Q1", Q1).Replace("Q2", Q2);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            } if (i == 24)
                            {
                                string ConversionFormula = ReportObj.DimensionEntitys[i].ConversionFormula;
                                ConvertResults = ConversionFormula.Replace("B", B).Replace("G", G).Replace("Q3", Q3).Replace("F", F);
                                ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ConvertResults)), 2).ToString();
                            }
                        }
                    }
                    else
                    {
                        ConvertS = Math.Round(Convert.ToDecimal(Common.FormulaCalculator.Eval(ReportObj.DimensionEntitys[i].ConversionFormula)), 2).ToString();
                    }
                    builder.Append("<td align=\"center\" colspan=\"2\">" + WDname + "</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                    ConvertScoreHtml += "<td align=\"center\">" + Convert.ToDouble(ReportObj.DimensionEntitys[i].Score) + "</td>";

                    if (ReportObj.DimensionEntitys[i].scoretype == 1)
                    {
                        if (ConvertS != "" || ConvertS != null)
                        {
                            ConvertScoreHtml += "<td align=\"center\" >" + ConvertS.ToString() + "</td>";
                        }
                        else
                        {
                            ConvertScoreHtml += "<td align=\"center\" >" + 0 + "</td>";
                        }
                    }
                    else
                    {

                        ConvertScoreHtml += "<td align=\"center\" >" + Convert.ToDouble(ReportObj.DimensionEntitys[i].Score) + "</td>";
                    }

                }
                builder.Append("</tr>");
                builder.Append("<tr>");
                for (int i = 0; i < ReportObj.DimensionEntitys.Count; i++)
                {
                    builder.Append("<td align=\"center\">原始分</td><td align=\"center\">标准分</td>");//"/" + dt_d.Rows[i]["D_Code"] + 
                }
                builder.Append("</tr>");
                if (UserInfodt.Rows.Count > 0)
                {
                    DateTime U_Birthday = DateTime.Parse(UserInfodt.Rows[0]["U_Birthday"].ToString());
                    int Ages = CalculateAgeCorrect(U_Birthday, RCreatetime);
                    builder.Append("<tr><td align=\"center\" >" + UserInfodt.Rows[0]["U_LoginName"] + "</td><td align=\"center\">" + UserInfodt.Rows[0]["U_Name"] + "</td><td align=\"center\">" + UserInfodt.Rows[0]["U_Sex"] + "</td><td align=\"center\">" + Ages + "</td><td align=\"center\">" + UserInfodt.Rows[0]["D_name"] + "</td>" + Scorehtml + "");
                }
                builder.Append(ConvertScoreHtml);
                builder.Append("</tr>");
            }

            builder.Append("</table></body></html>");
        }
        public int CalculateAgeCorrect(DateTime birthDate, DateTime RCreatime)
        {
            int age = RCreatime.Year - birthDate.Year;
            if (RCreatime.Month < birthDate.Month || (RCreatime.Month == birthDate.Month && RCreatime.Day < birthDate.Day)) age--;
            return age;
        }
        public static T JsonDeserialize<T>(string jsonString)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString)))
            {
                return (T)ser.ReadObject(ms);
            }
        }

        #region 获取生活事件列表
        private DataSet GetGaugeTemp(int UserID, int StarPageIndex, int EndPageIndex, string GaugeName, string EnterpriseCode)
        {
            DataSet SourceTemp = new DataSet();
            try
            {
                SourceTemp = MgrServices.DistributeRecordService.GetMytestTable(UserID, StarPageIndex, EndPageIndex, GaugeName, EnterpriseCode);
            }
            catch
            {

            }

            return SourceTemp;
        }
        #endregion

        public string getlist()
        {
            string ss = "";
            DataSet ds = new DataSet();//获取生活事件数据以及工作学习中的问题
            if (ds != null && ds.Tables[0].Rows.Count > 0)
            {
                ss += "<table>";
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    string id = ds.Tables[0].Rows[i]["ID"].ToString();
                    string name = ds.Tables[0].Rows[i]["Name"].ToString();
                    string sex = ds.Tables[0].Rows[i]["sex"].ToString();
                    ss += "<tr><td>" + name + "</td><td>"
                        + sex + "</td><td><a href=\"add.aspx?id=" + id +
                        "\">编辑</a></td><td><a href=\"javascript:sc('" + id +
                        "')\">删除</a></td></tr>";
                }
                ss += "</table>";
            }

            return ss;
        }



    }
}