using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CrisisInterfere.FunctionModular.Warning
{
    public partial class CrisisWarning : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string GetDate(int day)
        {
            return DateTime.Today.AddDays(day).ToString("yyyy-MM-dd");
        }
    }
}