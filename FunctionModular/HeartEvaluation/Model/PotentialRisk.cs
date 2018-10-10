using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.HeartEvaluation.Model
{
    public class PotentialRisk
    {
        public string AmountCode { get; set; }
        public Dictionary<string,string> AnswerRecord { get; set; }
        public int TotalScore { get; set; }
    }
}