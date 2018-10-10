using BR_Service;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using CrisisInterfere.EnterpriseOnlineService;
using CrisisInterfere.projrem;
using System.Web.SessionState;
namespace CrisisInterfere.FunctionModular.BasicSetting.Ajax
{
    /// <summary>
    /// DepartmentSelect 的摘要说明
    /// </summary>
    public class DepartmentSelect : IHttpHandler, IRequiresSessionState
    {


        public void ProcessRequest(HttpContext context)
        {
            string isTimeOut = Common.GetSessionValue("UserID", context);
            if (isTimeOut == null)
                return;

            int type = Convert.ToInt32(context.Request["type"]);
            string D_name = context.Request["D_name"];
            string D_Remark = context.Request["D_Remark"];
            string D_number = context.Request["D_number"];
            string Encode = Common.GetSessionValue("EnterpriseCode", context);
            if (Encode == null)
                return;
            switch (type)
            {
                case 1:
                    string Starindex = context.Request["Starindex"];
                    string Endindex = context.Request["Endindex"];
                    InitGaugePages(Starindex, Endindex, Encode, context);
                    break;
                case 2:
                    DepartmentRemark(context);///下拉列表
                    break;
                case 3:
                    DepartmentInsert(context);//插入一条数据
                    break;
                case 4:
                    DepartmentDelete(context);//删除一条数据
                    break;
                case 5:
                    DepartmentAselect(context);//查询一条数据
                    break;
                case 6:
                    DepartmentD_updeta(context);//得到行数据进行修改
                    break;
                case 7:
                    Department_null(context);//查询是否为空
                    break;
            }
        }
        /// <summary>
        /// 查询出部门列表
        /// </summary>
        /// <param name="Starindex">开始编号</param>
        /// <param name="Endindex">结束编号</param>
        /// <param name="context">默认</param>
        private void InitGaugePages(string Starindex, string Endindex, string Ecode, HttpContext context)
        {
            CrisisInterfere.DepartmentService.DepartmentServiceClient dc = new DepartmentService.DepartmentServiceClient();
            CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();
            try
            {
                PageInfo page = new PageInfo();
                DataSet ds = new DataSet();
                string EnterpriseCode = "";
                EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                ds = dc.DepartmentDT(Starindex, Endindex, EnterpriseCode);
                //dt = MgrServices.Department.DepartmentDT();
                DataTable SourceTemp = new DataTable();
                if (ds != null && ds.Tables.Count > 0)
                {
                    page.recordsTotal = Convert.ToInt32(ds.Tables[0].Rows[0][0]);
                    SourceTemp = ds.Tables[1];
                    if (SourceTemp != null && SourceTemp.Rows.Count > 0)
                    {
                        foreach (DataRow DTR in SourceTemp.Rows)
                        {
                            var num = dc.Department_num(Convert.ToInt32(DTR["D_id"].ToString()), Ecode);
                            String[] arr =
                            {
                               
                               // DTR["D_id"].ToString(), //部门ID
                                DTR["PageIndex"].ToString(),//序号	
                                DTR["D_name"].ToString(),//部门名称
                                DTR["D_Remark"].ToString(),//部门描述                            
                               // DTR["D_number"].ToString(),//部门人数
                               num.ToString(),
                                ""//操作
                                // DTR["D_chiID"].ToString()//所属部门
                            };
                            page.data.Add(arr);
                        }
                    }
                }
                page.recordsFiltered = page.recordsTotal;
                String json = Common.ObjectToJson(page);
                context.Response.Write(json);

            }
            catch
            {

            }
        }
        /// <summary>
        /// 下拉列表的展示
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentRemark(HttpContext context)
        {
            CrisisInterfere.DepartmentService.DepartmentServiceClient dc = new DepartmentService.DepartmentServiceClient();
            CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();
            try
            {
                string LoginName = "";
                LoginName = Common.GetSessionValue("loginName", context);
                if (LoginName == null)
                    return;
                DataTable dt = new DataTable();
                string EnterpriseCode = "";
                EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
                if (EnterpriseCode == null)
                    return;
                dt = dc.Departments(EnterpriseCode);
                if (dt != null && dt.Rows.Count > 0)
                {
                    ComboxMes mex = new ComboxMes();
                    List<ComboxMes> listT = new List<ComboxMes>();
                    foreach (DataRow DTR in dt.Rows)
                    {
                        mex = new ComboxMes();
                        mex.Text = DTR["D_name"].ToString();
                        mex.Value = DTR["D_ID"].ToString();
                        listT.Add(mex);
                    }
                    context.Response.Write(new JavaScriptSerializer().Serialize(listT));
                }
            }
            catch
            {
            }
        }
        /// <summary>
        /// 插入语句
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentInsert(HttpContext context)
        {

            CrisisInterfere.DepartmentService.DepartmentServiceClient dc = new DepartmentService.DepartmentServiceClient();
            CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();

            var D_name = context.Request["D_name"];
            var D_Remark = context.Request["D_Remark"];
            var D_chiID = context.Request["D_chiID"];
            CrisisInterfere.DepartmentService.DepartmentEntity de = new DepartmentService.DepartmentEntity();
            de._d_name = D_name;
            de._d_remark = D_Remark;
            de._d_chiid = D_chiID;
            long DResult = dc.DepartmentInsert(de);
            if (DResult > 0)
            {
                //插入授权编码关系表
                DepartmentLicense_InfoEntity entityInfo = new DepartmentLicense_InfoEntity();
                entityInfo._d_id = Convert.ToInt32(DResult);
                entityInfo._is_delete = 0;
                entityInfo._licensecode = "";//sesion获取用户的授权编码
                entityInfo._createtime = DateTime.Now;
                EOInsert(entityInfo);
                context.Response.Write("1");

            }
            else
            {
                context.Response.Write("0");
            }

        }
        /// <summary>
        /// 删除一条数据到回收站。
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentDelete(HttpContext context)
        {
            CrisisInterfere.DepartmentService.DepartmentServiceClient dc = new DepartmentService.DepartmentServiceClient();
            CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();
            int D_ID = Convert.ToInt32(context.Request["D_ID"]);
            if (dc.UPdataDelete(D_ID))
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }
        /// <summary>
        /// 更新一条部门表 数据
        /// </summary>
        /// <param name="context"></param>
        private void DepartmentUpdata(HttpContext context)
        {
            //dc.updata()
        }
        public void DepartmentAselect(HttpContext context)
        {

            CrisisInterfere.DepartmentService.DepartmentServiceClient dc = new DepartmentService.DepartmentServiceClient();
            CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();

            int D_ID = Convert.ToInt32(context.Request["UP_D_ID"]);
            model = dc.Aselect(D_ID);
            string json = JsonConvert.SerializeObject(model);
            context.Response.Write(json);
        }

        public void DepartmentD_updeta(HttpContext context)
        {
            CrisisInterfere.DepartmentService.DepartmentServiceClient dc = new DepartmentService.DepartmentServiceClient();
            CrisisInterfere.DepartmentService.DepartmentEntity model = new DepartmentService.DepartmentEntity();

            int D_ID = Convert.ToInt32(context.Request["UP_D_IDS"]);
            string D_name = context.Request["D_name"];
            string D_Remark = context.Request["D_Remark"];
            model._d_id = D_ID;
            model._d_remark = D_Remark;
            model._d_name = D_name;
            if (dc.updata(model))
            {
                context.Response.Write("1");
            }
            else
            {
                context.Response.Write("0");
            }
        }

        public void Department_null(HttpContext context)
        {
            string D_name = context.Request["D_name"];
            var did = context.Request["D_ID"];
            int D_chiID = context.Request["D_chiID"] == "" ? 0 : Convert.ToInt32(context.Request["D_chiID"]);

            int D_ID = 0;
            if (did == "空")
            {
                D_ID = 0;
            }
            else
            {
                D_ID = Convert.ToInt32(did);
            }
            string EnterpriseCode = "";
            EnterpriseCode = Common.GetSessionValue("EnterpriseCode", context);
            if (EnterpriseCode == null)
                return;
            bool result = MgrServices.Department.nulls(D_name, D_ID, D_chiID, EnterpriseCode);
            context.Response.Write(result);
        }
        public bool EOInsert(DepartmentLicense_InfoEntity entityInfo)
        {

            try
            {
                long EoID = MgrServices.EnterpriseOnlineService.EOInsert(entityInfo);
                if (EoID > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}