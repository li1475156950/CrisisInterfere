using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.GroupReport
{
    public class UserDimensionScoreModel<T>
    {
        public int UserID { get; set; }
        public double UserAge { get; set; }
        public Dictionary<string, T> DimensionAndScore { get; set; }
        public Dictionary<string, string> DimensionName { get; set; }
        public int MaxScoreOptionCount { get; set; }
        public string UserSex { get; set; }
    }
}