using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CrisisInterfere.FunctionModular.BasicSetting.ViewModel
{
    public class RoleViewModel
    {
        /// <summary>
        /// 角色ID
        /// </summary>
        public int Role_ID { get; set; }
        public string Role_Name { get; set; }
        public string Role_CreatePerson { get; set; }
        public DateTime Role_CrateTime { get; set; }
        /// <summary>
        /// 成员数量
        /// </summary>
        public int MemberCount { get; set; }
    }
}