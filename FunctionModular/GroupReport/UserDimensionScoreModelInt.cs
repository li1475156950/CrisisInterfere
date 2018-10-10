using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.GroupReport
{
    public class UserDimensionScoreModelInt
    {
        public int UserID { get; set; }
        public double UserAge { get; set; }
        public List<decimal> ScoreList { get; set; }
    }
}