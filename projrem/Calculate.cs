using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.projrem
{
    public class Calculate
    {
        //判断是否为操作符
        public bool isOperateors(string input)
        {
            if (input == "+" || input == "-" || input == "*" || input == "/"
                || input == "(" || input == ")" || input == "#")
            {
                return true;
            }
            else return false;
        }

        /// <summary>
        /// 分割表达式，并入队列
        /// </summary>
        /// <param name="express"></param>
        /// <returns>Queue</returns>
        public Queue<string> SplitExpress(string express)
        {
            express += "#";
            Queue<string> q = new Queue<string>();
            string tempNum = string.Empty;
            char[] arryExpress = express.ToArray<char>();
            int i = 0;
            int j = 0;
            while (j < express.Length)
            {
                if (isOperateors(arryExpress[j].ToString()))
                {
                    if (i != j)
                    {
                        tempNum = express.Substring(i, j - i);
                        q.Enqueue(tempNum);
                        q.Enqueue(arryExpress[j].ToString());
                        i = j + 1;
                    }
                    else
                    {
                        q.Enqueue(arryExpress[j].ToString());
                        i++;
                    }
                }
                j++;
            }
            //q.Enqueue("#");
            return q;
        }

        /// <summary>
        /// 中序表达式转换为后序表达式
        /// </summary>
        /// <param name="q"></param>
        /// <returns>string：后序表达式</returns>
        public List<string> InorderToPostorder(Queue<string> q)
        {
            List<string> posterOrder = new List<string>();
            Stack<string> inOrder = new Stack<string>();
            inOrder.Push("#");
            int count = q.Count;
            for (int i = 0; i < count; i++)
            {
                string item = q.Dequeue();
                if (isOperateors(item))
                {
                    string m = inOrder.First();
                    int n = Priority.isPriority(Priority.dicOperators[inOrder.First()],
                        Priority.dicOperators[item]);
                    while (n == 1)
                    {
                        string temp = inOrder.Pop();
                        if (temp != "(" && temp != ")")
                        {
                            posterOrder.Add(temp);
                        }
                        n = Priority.isPriority(Priority.dicOperators[inOrder.First()],
                        Priority.dicOperators[item]);
                    }
                    if (n == 2)
                    {
                        inOrder.Pop();
                    }
                    else if (n != -1)
                    {
                        inOrder.Push(item);
                    }
                    else
                    {
                        return null;
                    }
                }
                else
                {
                    posterOrder.Add(item);
                }
            }
            return inOrder.Count == 0 ? posterOrder : null;
        }
        /// <summary>
        ///  计算后序表达式
        /// </summary>
        /// <param name="PostorderExpress"></param>
        /// <param name="result"></param>
        /// <returns></returns>
        public bool IsResult(List<string> PostorderExpress, out decimal result)
        {
            if (PostorderExpress != null)
            {
                try
                {
                    if(PostorderExpress.Count==2)
                    {
                        result = Convert.ToDecimal(PostorderExpress[1]+PostorderExpress[0]);
                        return true;
                    }
                    PostorderExpress.Add("#");
                    string[] tempArry = PostorderExpress.ToArray();
                    int length = tempArry.Length;
                    int i = 0;
                    while (tempArry[i] != "#")
                    {
                        if (isOperateors(tempArry[i]))
                        {
                            tempArry[i - 2] = Arithmetic(tempArry[i - 2], tempArry[i - 1], tempArry[i]);
                            for (int j = i; j < length; j++)
                            {
                                if (j + 1 < length)
                                    tempArry[j - 1] = tempArry[j + 1];
                            }
                            length -= 2;
                            i -= 2;
                        }
                        i++;
                    }
                    result = decimal.Parse(tempArry[0]);
                    return true;
                }
                catch (Exception e)
                {
                    result = 0;
                    throw;
                }
            }
            else
            {
                result = 0;
                return false;
            }
        }
        //计算方法
        public string Arithmetic(string x, string y, string operators)
        {
            decimal a = decimal.Parse(x);
            decimal b = decimal.Parse(y);
            decimal result = 0;
            switch (operators)
            {
                case "+":
                    result = a + b;
                    break;
                case "-":
                    result = a - b;
                    break;
                case "*":
                    result = a * b;
                    break;
                case "/":
                    result = a / b;
                    break;
            }
            return result.ToString();
        }
    }
}