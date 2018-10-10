using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Web;

namespace CrisisInterfere.projrem
{
    public static class ExtendMethods
    {
        #region Datetime类型转换扩展方法集合

        /// <summary>
        /// 扩展方法，为Datetime类型增加格式化后的ToString方法，格式为yyyy-MM-dd HH:mm:ss
        /// </summary>
        /// <param name="time">调用该方法的对象</param>
        /// <returns>格式为yyyy-MM-dd HH:mm:ss的字符串</returns>
        public static string ToFormatString(this DateTime time)
        {
            string result = time.ToString("yyyy-MM-dd HH:mm:ss");
            return result;
        }

        #endregion


        #region Object转换扩展方法集合

        /// <summary>
        ///  转换Int 失败默认返回 0
        /// </summary>
        /// <param name="obj">调用该方法的对象</param>
        /// <param name="defaultInt">默认值</param>
        /// <returns>整形</returns>
        public static int ToInt(this object obj, int defaultInt = 0)
        {
            int result = 0;
            try
            {
                result = Convert.ToInt32(obj);


            }
            catch (Exception ex)
            {
                result = defaultInt;
            }
            return result;
        }
        /// <summary>
        ///  扩展方法，将Object转换为Double，转换失败时抛出异常
        /// </summary>
        /// <param name="obj">调用该方法的对象</param>
        /// <returns>Double</returns>
        public static double ToDouble(this object obj)
        {
            try
            {
                double result = Convert.ToDouble(obj);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        /// <summary>
        ///  扩展方法，将string转换为日期
        /// </summary>
        /// <param name="obj">调用该方法的对象</param> 
        /// <returns>Datetime</returns>
        public static DateTime? ToDateTime(this string obj)
        {
            DateTime? result = null;
            try
            {
                DateTime defaultDT = new DateTime();
                DateTime.TryParse(obj, out defaultDT);
                result = defaultDT;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return result;
        }

        /// <summary>
        ///  扩展方法，将Object转换为bool，转换失败时抛出异常
        /// </summary>
        /// <param name="obj">调用该方法的对象</param>
        /// <returns>bool</returns>
        public static bool ToBool(this object obj)
        {
            try
            {
                bool result = Convert.ToBoolean(obj);
                return result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static string ObjToString(this object obj)
        {
            if (obj == null)
                return string.Empty;
            else if (obj == DBNull.Value)
                return string.Empty;
            else
                return obj.ToString();
        }

        #endregion


        #region DataRow 转换实体对象

        public static List<T> ToModel<T>(this DataTable dt) where T : new()
        {
            List<T> result = new List<T>();// 实例化实体集
            T tempT;// 临时属性 
            DataColumn tempDataColumn;// 临时属性 列
            object tempObject;

            try
            {
                foreach (DataRow dr in dt.Rows)
                {
                    tempT = new T();

                    // 实体属性集
                    PropertyInfo[] properties = tempT.GetType().GetProperties();
                    // 遍历实体属性集
                    foreach (var item in properties)
                    {
                        // 通过实体属性名 获取数据列
                        tempDataColumn = dt.Columns[item.Name];

                        if (tempDataColumn != null)
                        {
                            if (dr[item.Name] != DBNull.Value)
                            {
                                // 值类型转换
                                object newValue = Convert.ChangeType(dr[item.Name], item.PropertyType);
                                // 实体属性赋值
                                item.SetValue(result, newValue, null);
                            }
                        }
                    }
                    result.Add(tempT);
                }
            }
            catch (Exception e)
            {

            }

            return result;
        }

        #endregion

        #region DataRow 转换实体对象

        public static T ToModel<T>(this DataRow dr) where T : new()
        {
            T result = new T();// 实例化实体
            DataColumn tempDataColumn;// 临时属性 列


            try
            {
                // 实体属性集
                PropertyInfo[] properties = result.GetType().GetProperties();
                // 遍历实体属性集
                foreach (var item in properties)
                {
                    // 通过实体属性名 获取数据列
                    tempDataColumn = dr.Table.Columns[item.Name];

                    if (tempDataColumn != null)
                    {
                        if (dr[item.Name] != DBNull.Value)
                        {
                            // 值类型转换
                            object newValue = Convert.ChangeType(dr[item.Name], item.PropertyType);
                            // 实体属性赋值
                            item.SetValue(result, newValue, null);
                        }
                    }
                }
            }
            catch (Exception e)
            {

            }

            return result;
        }

        #endregion
    }
}