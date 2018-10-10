using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.RecycleBin
{
    public class RestoreModel
    {
        public int RBID { get; set; }
        public string TableName { get; set; }
        public string FieldName { get; set; }
        public string FieldValue { get; set; }
        public string FieldNameDelete { get; set; }
    }
}
