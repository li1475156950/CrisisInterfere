using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using System.Runtime.Serialization.Json;
using System.IO;
using System.Text;
using Microsoft.JScript;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using BR_Service;
using System.Reflection;
using System.CodeDom.Compiler;
using Svg;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters.Binary;
    public  class Common
    {
        /// <summary>
        /// 获取querystring的参数的值
        /// </summary>
        /// <param name="name">参数名</param>
        /// <returns></returns>
        public static String GetRequest(String name)
        {
            try
            {
                String value = HttpContext.Current.Request[name];
                return String.IsNullOrEmpty(value) ? "" : Common.DecodeUrl(value.Replace("null", "").Trim());
            }
            catch
            {
                return "";
            }
        }
        /// <summary>
        /// 获取Form的参数的值
        /// </summary>
        /// <param name="name">参数名</param>
        /// <returns></returns>
        public static String GetForm(String name)
        {
            try
            {
                String value = HttpContext.Current.Request.Form[name];
                return String.IsNullOrEmpty(value) ? "" : Common.DecodeUrl(value.Replace("null", "").Trim());
            }
            catch
            {
                return "";
            }
        }

        public static bool IsIPAddress(string str1)
        {
            if (str1 == null || str1 == string.Empty || str1.Length < 7 || str1.Length > 15) return false;
            string regformat = @"^/d{1,3}[/.]/d{1,3}[/.]/d{1,3}[/.]/d{1,3}$";
            Regex regex = new Regex(regformat, RegexOptions.IgnoreCase);
            return regex.IsMatch(str1);
        }

        //路径解码
        public static String DecodeUrl(String url)
        {
            String result = "";
            try
            {
                result = GlobalObject.decodeURIComponent(url);
            }
            catch
            {
                result = HttpUtility.UrlDecode(url, Encoding.Default);
            }
            return result;
        }
        /// <summary>
        /// 反序列化json
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="jsonString"></param>
        /// <returns></returns>
        public static T JsonDeserialize<T>(string jsonString)
        {
            DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T));
            using (MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString)))
            {
                return (T)ser.ReadObject(ms);
            }
        }
        /// <summary>
        /// 对象转Json
        /// </summary>
        /// <param name="obj"></param>
        /// <returns></returns>
        public static string ObjectToJson(object obj)
        {
            return JsonConvert.SerializeObject(obj);
        }

        #region dataTable转换成Json格式
        /// <summary>  
        /// dataTable转换成Json格式  
        /// </summary>  
        /// <param name="dt"></param>  
        /// <returns></returns>  
        public static string DataTable2Json(DataTable dt)
        {
            StringBuilder jsonBuilder = new StringBuilder();
            jsonBuilder.Append("{\"");
            jsonBuilder.Append(dt.TableName);
            jsonBuilder.Append("\":[");
            jsonBuilder.Append("[");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                jsonBuilder.Append("{");
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    jsonBuilder.Append("\"");
                    jsonBuilder.Append(dt.Columns[j].ColumnName);
                    jsonBuilder.Append("\":\"");
                    jsonBuilder.Append(dt.Rows[i][j].ToString());
                    jsonBuilder.Append("\",");
                }
                jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
                jsonBuilder.Append("},");
            }
            jsonBuilder.Remove(jsonBuilder.Length - 1, 1);
            jsonBuilder.Append("]");
            jsonBuilder.Append("}");
            return jsonBuilder.ToString();
        }

        #endregion dataTable转换成Json格式
        #region DataSet转换成Json格式
        /// <summary>  
        /// DataSet转换成Json格式  
        /// </summary>  
        /// <param name="ds">DataSet</param> 
        /// <returns></returns>  
        public static string Dataset2Json(DataSet ds)
        {
            StringBuilder json = new StringBuilder();

            foreach (DataTable dt in ds.Tables)
            {
                json.Append("{\"");
                json.Append(dt.TableName);
                json.Append("\":");
                json.Append(DataTable2Json(dt));
                json.Append("}");
            } return json.ToString();
        }
        #endregion

        /// <summary>
        /// Msdn
        /// </summary>
        /// <param name="jsonName"></param>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static string DataTableToJson(string jsonName, DataTable dt)
        {
            StringBuilder Json = new StringBuilder();
            Json.Append("{\"" + jsonName + "\":[");
            if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    Json.Append("{");
                    for (int j = 0; j < dt.Columns.Count; j++)
                    {
                        Json.Append("\"" + dt.Columns[j].ColumnName.ToString() + "\":\"" + dt.Rows[i][j].ToString() + "\"");
                        if (j < dt.Columns.Count - 1)
                        {
                            Json.Append(",");
                        }
                    }
                    Json.Append("}");
                    if (i < dt.Rows.Count - 1)
                    {
                        Json.Append(",");
                    }
                }
            }
            Json.Append("]}");
            return Json.ToString();
        }

        /// <summary>
        ///  转半角的函数(SBC case)
        /// </summary>
        /// <param name="input">输入</param>
        /// <returns></returns>
        public static string ToDBC(string input)
        {
            try
            {
                char[] c = input.ToCharArray();
                for (int i = 0; i < c.Length; i++)
                {
                    if (c[i] == 12288)
                    {
                        c[i] = (char)32;
                        continue;
                    }
                    if (c[i] > 65280 && c[i] < 65375)
                        c[i] = (char)(c[i] - 65248);
                }
                return new string(c);
            }
            catch
            {
                return input;
            }
        }
        /// <summary>
        /// 2015-10-15 去除网页内容，只剩下文字
        /// </summary>
        /// <param name="oldstring"></param>
        /// <returns></returns>
        public static string ClearMarket(string oldstring)
        {
            if (null == oldstring || oldstring == String.Empty) return "";
            string str = ToDBC(oldstring);
            str = Regex.Replace(str, @"<(.[^>]*)>", "", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"([\r\n])[\s]+", "", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"-->", "", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"<!--.*", "", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(quot|#34);", "\"", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(amp|#38);", "&", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(lt|#60);", "<", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(gt|#62);", ">", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(nbsp|#160);", " ", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(iexcl|#161);", "\xa1", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(cent|#162);", "\xa2", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(pound|#163);", "\xa3", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&(copy|#169);", "\xa9", RegexOptions.IgnoreCase);
            str = Regex.Replace(str, @"&#(\d+);", "", RegexOptions.IgnoreCase);
            str = str.Replace("<", "");
            str = str.Replace(">", "");
            str = str.Replace("\r\n", "");
            str = str.Trim();
            return str;
        }
        public static string HideFourChars(string tel)
        {
            if (null != tel && 10 < tel.Length)
            {
                return tel.Remove(tel.Length - 5, 4).Insert(tel.Length - 5, "****");
            }
            else if (null != tel && 10 >= tel.Length)
            {

                return tel.Substring(0, tel.Length - 4) + "***";

            }
            return string.Empty;
        }

        public static String DateTimeToStr(DateTime dt)
        {
            return dt.ToString("yyyy-MM-dd HH:mm:ss");
        }

        public static String DateToStr(DateTime dt)
        {
            return dt.ToString("yyyy-MM-dd");
        }

        public static string ResultTel(String content)
        {
            string strContents = content.ToLower().Replace("&nbsp;", "").Replace('o', '0').Trim();
            ;
            try
            {
                if (Regex.IsMatch(
                    content,
                    @"([1][3,4,5,7,8]\d{9}|[1][3,4,5,7,8]\d{1}-\d{4}-\d{4}|[1][3,4,5,7,8]\d{1} \d{4} \d{4}|[1][3,4,5,7,8]\d{2} \d{4} \d{3})")) strContents = Regex.Replace(content, @"(?<=\d{7})\d{3}", "***");
                else if (Regex.IsMatch(content, @"0\d{2,3}-\d{7,8}|0\d{2,3}\d{7,8}|0\d{2,3} \d{7,8}")) strContents = Regex.Replace(content, @"(?<=\d{7})\d{3}", "***");
                else if (Regex.IsMatch(content, @"(\d{5,13})")) strContents = Regex.Replace(content, @"(?<=\d{2})\d{3}", "***");
                else if (Regex.IsMatch(
                    content,
                    @"((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)")) strContents = Regex.Replace(content, @"(?<=\d{7})\d{3}", "***");
            }
            catch
            {
            }
            return strContents;

        }



        public static String GetPhone(String content)
        {
            if (String.IsNullOrEmpty(content)) return "";
            content = content.ToLower().Replace("&nbsp;", "").Replace('o', '0').Trim();
            Match m = Regex.Match(
                content,
                @"([1][3,4,5,7,8]\d{9}|[1][3,4,5,7,8]\d{1}-\d{4}-\d{4}|[1][3,4,5,7,8]\d{1} \d{4} \d{4}|[1][3,4,5,7,8]\d{2} \d{4} \d{3})");
            if (m.Success) return m.Value.Replace("-", "").Replace(" ", "");
            m = Regex.Match(content, @"(0\d{2,3}-\d{7,8}|0\d{2,3}\d{7,8}|0\d{2,3} \d{7,8})");
            if (m.Success) return m.Value.Replace("-", "").Replace(" ", "");
            return "";
        }

        public static String GetQQ(String content)
        {
            if (String.IsNullOrEmpty(content)) return "";
            content = content.ToLower().Replace("&nbsp;", "").Replace('o', '0').Trim();
            if (Regex.IsMatch(
                content,
                @"([1][3,4,5,8,7]\d{9}|[1][3,4,5,7,8]\d{1}-\d{4}-\d{4}|[1][3,4,5,7,8]\d{1} \d{4} \d{4}|[1][3,4,5,7,8]\d{2} \d{4} \d{3})")) return "";
            if (Regex.IsMatch(content, @"(0\d{2,3}-\d{7,8}|0\d{2,3}\d{7,8}|0\d{2,3} \d{7,8})")) return "";
            Match m = Regex.Match(content, @"(\d{5,13})");
            if (m.Success) return m.Value;
            return "";
        }

        public static String RemoveHtml(String html)
        {
            try
            {
                string htmlstring = HtmlRemoval.StripTagsCharArray(html);
                return
                    htmlstring.Replace("\r\n\r\n\r\n", " ")
                        .Replace("\r\n\r\n", " ")
                        .Replace("\r\n", " ")
                        .Replace("\r", " ")
                        .Replace("\n", " ");
            }
            catch
            {
                return "";
            }
        }
        public static String HtmlToTxt(String html)
        {
            try
            {
                if (html.IndexOf("<") == -1) return html;
                else
                {
                    if (!html.ToLower().Contains("<body>")) html = "<body>" + html + "</body>";
                    if (!html.ToLower().Contains("<html>")) html = "<html>" + html + "</html>";
                    HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                    doc.LoadHtml(html);
                    String result =
                        doc.DocumentNode.ChildNodes[2].InnerText.Replace("&nbsp;", " ")
                            .Replace("<!--StartFragment -->", " ");
                    ;
                    return result;
                }
            }
            catch
            {
                return html;
            }
        }

        public static String GetPersonalCase(String html)
        {
            try
            {
                if (!html.ToLower().Contains("<body>")) html = "<body>" + html + "</body>";
                if (!html.ToLower().Contains("<html>")) html = "<html>" + html + "</html>";
                HtmlAgilityPack.HtmlDocument doc = new HtmlAgilityPack.HtmlDocument();
                doc.LoadHtml(html);
                HtmlAgilityPack.HtmlNodeCollection hns = doc.DocumentNode.SelectNodes("//*[@id=\"grs\"]");
                if (hns.Count == 0) return "";
                return hns[0].GetAttributeValue("value", "");
            }
            catch
            {
                return "";
            }
        }

        public static int GetWeekFirstDay(int day)
        {
            int w = (day - 1) / 7;
            if (w > 3) w = 3;
            return w * 7 + 1;
        }
        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="file"></param>
        /// <param name="uploadPath"></param>
        /// <returns></returns>
        public static string Upload(HttpPostedFile file, string uploadPath)
        {
            string exname = "";
            string filepath = "";
            if (file.FileName.Length >= 5)
            {
                exname = file.FileName.Substring(file.FileName.LastIndexOf('.'), file.FileName.Length - file.FileName.LastIndexOf('.'));
            }
            string UploadType = strType(exname);
            if (UploadType != null && UploadType != "")
            {
                Random rand = new Random();
                string SaveFileName = DateTime.Now.ToString("yyyyMMdd");//要保存的文件名  
                SaveFileName += DateTime.Now.ToString("HHmmss");
                SaveFileName += rand.Next(1000).ToString();
                string newfilename = SaveFileName + exname;
                filepath = uploadPath + newfilename;
                if (file != null)
                {
                    //判断路径是否存在
                    if (!Directory.Exists(uploadPath))
                    {
                        Directory.CreateDirectory(uploadPath);
                    }
                    string extension = Path.GetExtension(newfilename);
                    //保存
                    file.SaveAs(filepath);

                    //下面这句代码缺少的话，上传成功后上传队列的显示不会自动消失

                    return filepath;
                }
                else
                {
                    return filepath;
                }
            }
            return filepath;
        }
        /// <summary>
        /// 检查上传文件后缀名
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static string strType(string type)
        {
            if (String.Empty != type)
            {
                type = type.ToLower();
                type = type.Substring(type.LastIndexOf("."));
                if ((".swf,.flv").Contains(type))
                    return type;

                if ((".doc,.docx,.wps").Contains(type))
                    return type;

                if ((".jpg，.gif，.bmp，.png").Contains(type))
                    return type;

                if ((".pdf").Contains(type))
                    return type;

                if ((".xls,.xlsx").Contains(type))
                    return type;

                if ((".txt").Contains(type))
                    return type;

                if ((".bmp").Contains(type))
                    return type;

                if ((".ppt,.pptx").Contains(type))
                    return type;
            }
            return type;
        }
        public static object GetCache(string CacheKey)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            return objCache[CacheKey];
        }

        /// <summary>
        /// 设置当前应用程序指定CacheKey的Cache值
        /// </summary>
        /// <param name="CacheKey"></param>
        /// <param name="objObject"></param>
        public static void SetCache(string CacheKey, object objObject)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            objCache.Insert(CacheKey, objObject);
        }
        public static void ClearCache(string cacheKey)
        {
            System.Web.Caching.Cache objCache = HttpRuntime.Cache;
            objCache.Remove(cacheKey);
        }
        //判断Session是否有效
        public static void CheckSession()
        {
            //测试的时候注释掉
            try
            {
                if (System.Web.HttpContext.Current.Session["loginName"] == null)
                {
                    System.Web.HttpContext.Current.Response.Write("<script>top.location='../LoginAndRegister.aspx'</script>");
                }
            }
            catch
            {
                System.Web.HttpContext.Current.Response.Write("<script>top.location='../LoginAndRegister.aspx'</script>");
            }
        }
        /// <summary>
        /// 克隆集合
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="List"></param>
        /// <returns></returns>
        public static List<T> Clone<T>(object List)
        {
            using (Stream objectStream = new MemoryStream())
            {
                IFormatter formatter = new BinaryFormatter();
                formatter.Serialize(objectStream, List);
                objectStream.Seek(0, SeekOrigin.Begin);
                return formatter.Deserialize(objectStream) as List<T>;
            }
        }
        //获得Session中的值
        public static string GetSessionValue(string SessionKey, HttpContext context)
        {
            //测试时候使用，不掉线
            //try
            //{
            //    return System.Web.HttpContext.Current.Session[SessionKey].ToString();
            //}
            //catch
            //{
            //    System.Web.HttpContext.Current.Response.Write("<script>alert('登录信息安全时限过期，请重新登录！');top.location='../LoginAndRegister.aspx'</script>");
            //    return "NoLogin";
            //}

            object result = context.Session[SessionKey];
            if (result == null)
            {
                context.Response.Write(@"<script>var url = window.location;var urlArr = url.toString().split('/');var ustr = 'http://' + urlArr[2] + '/login.html';window.location.href = ustr;</script>");
                return null;
            }
            else
                return result.ToString();
        }
        /// <summary>
        /// 创建人:李超
        /// 创建时间:2016/9/28
        /// 功能介绍:根据类型和属性名称得到属性值
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="t"></param>
        /// <param name="propertyname"></param>
        /// <returns></returns>
        public static string GetObjectPropertyValue<T>(T t, string propertyname)
        {
            Type type = typeof(T);

            PropertyInfo property = type.GetProperty(propertyname);

            if (property == null) return string.Empty;

            object o = property.GetValue(t, null);

            if (o == null) return string.Empty;

            return o.ToString();
        }

        /// <summary>  
        /// 获取时间戳  
        /// </summary>  
        /// <returns></returns>  
        public static string GetTimeStamp()
        {
            TimeSpan ts = DateTime.UtcNow - new DateTime(1970, 1, 1, 0, 0, 0, 0);
            Random rd = new Random();
            int i = rd.Next(1, 9);
            return System.Convert.ToInt64(ts.TotalMilliseconds).ToString() + i.ToString();
        }
        /// <summary>
        /// 创建人：田闯
        /// 创建时间：2017/5/19
        /// 获取时间戳
        /// </summary>
        /// <param name="index"></param>
        /// <returns></returns>
        public static string GetTimeStampIW(int index)
        {
            TimeSpan ts = DateTime.UtcNow - new DateTime(2000, 1, 1, 0, 0, 0, 0);
            return System.Convert.ToInt64(ts.TotalMilliseconds).ToString() + index.ToString();
        }
        //计算公式
        public class FormulaCalculator
        {
            /// <summary>  
            /// 计算结果,如果表达式出错则抛出异常  
            /// </summary>  
            /// <param name="statement">表达式,如"1+2+3+4"</param>  
            /// <returns>结果</returns>  
            public static object Eval(string statement)
            {
                return _evaluatorType.InvokeMember(
                            "Eval",
                            BindingFlags.InvokeMethod,
                            null,
                            _evaluator,
                            new object[] { statement }
                         );
            }

            static FormulaCalculator()
            {
                //构造JScript的编译驱动代码  
                CodeDomProvider provider = CodeDomProvider.CreateProvider("JScript");

                CompilerParameters parameters;
                parameters = new CompilerParameters();
                parameters.GenerateInMemory = true;

                CompilerResults results;
                results = provider.CompileAssemblyFromSource(parameters, _jscriptSource);

                Assembly assembly = results.CompiledAssembly;
                _evaluatorType = assembly.GetType("Evaluator");

                _evaluator = Activator.CreateInstance(_evaluatorType);
            }

            private static object _evaluator = null;
            private static Type _evaluatorType = null;

            /// <summary>  
            /// JScript代码  
            /// </summary>  
            private static readonly string _jscriptSource =
                @"class Evaluator  
              {  
                  public function Eval(expr : String) : String   
                  {   
                     return eval(expr);   
                  }  
              }";
        }
        public static int CalculateAgeCorrect(DateTime birthDate, DateTime now)
        {
            int age = now.Year - birthDate.Year;
            if (now.Month < birthDate.Month || (now.Month == birthDate.Month && now.Day < birthDate.Day)) age--;
            return age;
        }
        public static double CalculateAgeCorrectRW(DateTime birthDate, DateTime now)
        {
            double age = now.Year - birthDate.Year;
            if (now.Month < birthDate.Month)
            {
                age--;
                if ((now.Month + (12 - birthDate.Month)) >= 3 && (now.Month + (12 - birthDate.Month)) < 9)
                {
                    age += 0.5;
                }
                if ((now.Month + (12 - birthDate.Month)) >= 9)
                {
                    age += 1;
                }
            }
            if (now.Month > birthDate.Month)
            {
                if ((now.Month + (12 - birthDate.Month)) >= 3 && (now.Month + (12 - birthDate.Month)) < 9)
                {
                    age += 0.5;
                }
                if ((now.Month + (12 - birthDate.Month)) >= 9)
                {
                    age += 1;
                }
            }
            return age;
        }
        public static Svg.SvgDocument Open(MemoryStream stream)
        {
            return SvgDocument.Open(stream);
        }
    }


    //end

    /// <summary>
    /// Methods to remove HTML from strings.
    /// </summary>
    public static class HtmlRemoval
    {
        /// <summary>
        /// Remove HTML from string with Regex.
        /// </summary>
        public static string StripTagsRegex(string source)
        {
            return Regex.Replace(source, "<.*?>", string.Empty);
        }

        /// <summary>
        /// Compiled regular expression for performance.
        /// </summary>
        private static Regex _htmlRegex = new Regex("<.*?>", RegexOptions.Compiled);

        /// <summary>
        /// Remove HTML from string with compiled Regex.
        /// </summary>
        public static string StripTagsRegexCompiled(string source)
        {
            return _htmlRegex.Replace(source, string.Empty);
        }

        /// <summary>
        /// Remove HTML tags from string using char array.
        /// </summary>
        public static string StripTagsCharArray(string source)
        {
            char[] array = new char[source.Length];
            int arrayIndex = 0;
            bool inside = false;

            for (int i = 0; i < source.Length; i++)
            {
                char let = source[i];
                if (let == '<')
                {
                    inside = true;
                    continue;
                }
                if (let == '>')
                {
                    inside = false;
                    continue;
                }
                if (!inside)
                {
                    array[arrayIndex] = let;
                    arrayIndex++;
                }
            }
            return new string(array, 0, arrayIndex);
        }
        /// <summary>
        /// 获取当前应用程序指定CacheKey的Cache值
        /// </summary>
        /// <param name="CacheKey"></param>
        /// <returns></returns>





        /// <summary> 
        /// 开发人员：刘玉京
        /// 开发日期：2016/12/12
        /// 功能：返回datatable
        /// </summary>
        /// <param name="jsonStr">JSON串</param>
        /// <param name="colStrmes">返回列头字符</param>
        /// <param name="rowsStrmes">返回行头字符</param>
        /// <returns></returns>
        public static DataTable GetDataTable(String jsonStr, ref String colStrmes, ref String rowsStrmes)
        {
            try
            {
                jsonStr = jsonStr.Trim(']').Trim('[').Replace("\"", "");

                DataTable dt1 = new DataTable();
                bool rowff = false;
                Int32 colidnex = -1;
                Int32 rowinde = -1;

                for (int i = 0; i < jsonStr.Replace("},{", "^").Split('^').Length; i++)
                {
                    if (!colStrmes.Contains((jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[0].Split(':')[1] + "").Trim()))
                    {
                        colidnex++;
                        colStrmes += (jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[0].Split(':')[1] + "").Trim() + ",";
                        dt1.Columns.Add((jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[0].Split(':')[1] + "").Trim(), typeof(string));
                    }
                    else
                    {
                        colidnex++;
                    }

                    if (!rowsStrmes.Contains((jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[1].Split(':')[1] + "").Trim()))
                    {
                        rowff = true;
                        rowinde++;
                        rowsStrmes += (jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[1].Split(':')[1] + "").Trim() + ",";
                    }
                    else
                        rowff = false;
                    if (rowff)
                    {
                        colidnex = 0;
                        DataRow dr = dt1.NewRow();
                        dr[(jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[0].Split(':')[1] + "").Trim()] = (jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[2].Split(':')[1] + "").Trim().Trim('}');
                        dt1.Rows.Add(dr);
                    }
                    else
                        dt1.Rows[rowinde][colidnex] = (jsonStr.Replace("},{", "^").Split('^')[i].Split(',')[2].Split(':')[1] + "").Trim().Trim('}');
                }
                return dt1;
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
        }








    }
