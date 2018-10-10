using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

namespace MyExection
{
    public class CustomException : Exception
    {
        private string msg;
        private string methodName;
        private string parameterName;
        private string pageMesg;
        /// <summary>
        /// Å×³öÒì³£ÐÅÏ¢
        /// </summary>
        public string Msg
        {
            get
            {
                return msg;
            }
        }
        /// <summary>
        /// Å×³öÒì³£µÄ·½·¨
        /// </summary>
        public string MethodName
        {
            get
            {
                return methodName;
            }
        }
        /// <summary>
        /// Å×³öÒì³£µÄ±äÁ¿
        /// </summary>
        public string ParameterName
        {
            get
            {
                return parameterName;
            }
        }
        /// <summary>
        /// Ò³Ãæ½ÓÊÕÒì³£ÐÅÏ¢
        /// </summary>
        public string PageMesg
        {
            get
            {
                return pageMesg;
            }
        }

        public static readonly string logFilePath = ConfigurationManager.AppSettings["LogFilePath"];
        /// <summary>
        /// 业务逻辑层异常处理构造函数
        /// </summary>
        /// <param name="msg">Òì³£ÏûÏ¢</param>
        /// <param name="methodName">Òì³£·½·¨±äÁ¿</param>
        /// <param name="parameterName">Òì³£±äÁ¿</param>
        public CustomException(string msg, string methodName, string parameterName)
        {
            this.msg = msg.Trim();
            this.methodName = methodName.Trim();
            this.parameterName = parameterName.Trim();

            string errorMesg = "";
            errorMesg = "用户服务器端业务逻辑错误日志－－－－－－­" + System.DateTime.Now.ToString();
            this.WriteFile(errorMesg);
            errorMesg = "错误模块名称：" + methodName.Trim();
            this.WriteFile(errorMesg);
            errorMesg = "错误描述：" + parameterName.Trim();
            this.WriteFile(errorMesg);
            errorMesg = "错误日志信息：" + msg.Trim();
            this.WriteFile(errorMesg);
            errorMesg = " ";
            this.WriteFile(errorMesg);
            errorMesg = " ";
            this.WriteFile(errorMesg);
        }
        public CustomException(string msg)
        {
            this.pageMesg = msg.Trim();
        }
        /****************************************
         * º¯ÊýÃû³Æ£ºWriteFile
         * ¹¦ÄÜËµÃ÷£ºµ±ÎÄ¼þ²»´æÊ±£¬Ôò´´½¨ÎÄ¼þ£¬²¢×·¼ÓÎÄ¼þ
         * ²Î    Êý£ºPath:ÎÄ¼þÂ·¾¶,Strings:ÎÄ±¾ÄÚÈÝ
         * µ÷ÓÃÊ¾ÁÐ£º
         *           string Path = c:\\log.txt;       
         *           string Strings = "ÕâÊÇÎÒÐ´µÄÄÚÈÝ°¡";
         *           EC.FileObj.WriteFile(Path,Strings);
        *****************************************/
        /// <summary>
        /// Ð´ÎÄ¼þ
        /// </summary>
        /// <param name="Path">ÎÄ¼þÂ·¾¶</param>
        /// <param name="Strings">ÎÄ¼þÄÚÈÝ</param>
        protected void WriteFile(string errorMesg)
        {
            try
            {
                string Path = logFilePath + "Log" + System.DateTime.Now.ToShortDateString().Replace("/", "-") + ".log";
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

    }
}
