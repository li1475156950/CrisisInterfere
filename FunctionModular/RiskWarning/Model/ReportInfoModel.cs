using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.RiskWarning.Model
{
    public class ReportInfoModel
    {
        public string UserID { get; set; }
        public string LoginName { get; set; }
        public string UserName { get; set; }
        public string Age { get; set; }
        public string Sex { get; set; }
        public string Department { get; set; }
        public string CellPhone { get; set; }
        public string Email { get; set; }
        public string WarningState { get; set; }
    }
}