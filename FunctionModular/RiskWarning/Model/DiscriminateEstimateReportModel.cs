using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.RiskWarning.Model
{
    public class DiscriminateEstimateReportModel
    {
        public List<List<Dictionary<string,int>>> PotentialRiskEstimateResultList { get; set; }
        public List<string> PotentialRiskWarningState { get; set; }
        public List<List<Dictionary<string,int>>> IdioctoniaEstimateResultList { get; set; }
        public List<string> IdioctoniaWarningState { get; set; }
        public List<string> PotentialRiskCreateTime { get; set; }
        public List<string> IdioctoniaCreateTime { get; set; }
    }
}