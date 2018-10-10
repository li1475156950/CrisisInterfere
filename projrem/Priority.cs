using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.projrem
{
    public static class Priority
    {
        public static Dictionary<string, int> dicOperators = new Dictionary<string, int>
        {
            {"+",0},
            {"-",1},
            {"*",2},
            {"/",3},
            {"(",4},
            {")",5},
            {"#",6}
        };
        public static int[,] PriorityList = new int[,]{
            /*行为入栈运算符，列为栈顶运算符，2表示等于号，1表示大于号，
             0表示小于号，-1表示错误的匹配*/
           /* '+','-','*','/','(',')','#'*/
      /*'+'*/{ 1,  1,  0,  0,  0,  1,  1},
      /*'-'*/{ 1,  1,  0,  0,  0,  1,  1},
      /*'*'*/{ 1,  1,  1,  1,  0,  1,  1},
      /*'/'*/{ 1,  1,  1,  1,  0,  1,  1},
      /*'('*/{ 0,  0,  0,  0,  0,  2, -1},
      /*')'*/{ 0,  0,  0,  0, -1,  1,  1},
      /*'#'*/{ 0,  0,  0,  0,  0, -1,  2},
        };
        public static int isPriority(int stackTop, int inputOperator)
        {
            return PriorityList[stackTop, inputOperator];
        }
    }
}