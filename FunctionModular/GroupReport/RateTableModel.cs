using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.GroupReport
{
    public class RateTableModel
    {
        public string DimensionName { get; set; }
        public List<ExplainAndWarningModel> Columns { get; set; }
    }
}