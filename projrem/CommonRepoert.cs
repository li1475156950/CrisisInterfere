using BR_Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using CrisisInterfere.FunctionModular.PersonalReport;

namespace CrisisInterfere.projrem
{
    public class CommonRepoert
    {
        public static string GetAnswerRecord(string AnswerID)
        {         
            string StrJson = "";
            string AnswerRecord = "";
            DataSet dataset = MgrServices.PersonalReportService.ReportExport(AnswerID);
            DataTable dt = new DataTable();
            DataTable Reportdt = new DataTable();
            if (dataset.Tables.Count > 0)
            {
                Reportdt = dataset.Tables[0];
                //dt = dataset.Tables[1];
               
            }
            Report ReportObj = new Report();
            if (Reportdt.Rows.Count > 0)
            {
                StrJson = Reportdt.Rows[0]["ReportJson"].ToString();
            }
            if (StrJson != null && StrJson != "")
            {
                ReportObj = Common.JsonDeserialize<Report>(StrJson);
                if (ReportObj.UserINfos.Count > 0)
                {
                    AnswerRecord = ReportObj.UserINfos[0].AnswerRecord;
                   
                }
                
            }
         return   AnswerRecord;
        }
        public static string GetAnswerRecordA(string AnswerID, out string Scores)
        {
            Scores = "";
            string StrJson = "";
            string AnswerRecord = "";
            DataSet dataset = MgrServices.PersonalReportService.ReportExport(AnswerID);
            DataTable dt = new DataTable();
            DataTable Reportdt = new DataTable();
            if (dataset.Tables.Count > 0)
            {
                Reportdt = dataset.Tables[0];
                //dt = dataset.Tables[1];

            }
            Report ReportObj = new Report();
            if (Reportdt.Rows.Count > 0)
            {
                StrJson = Reportdt.Rows[0]["ReportJson"].ToString();
            }
            if (StrJson != null && StrJson != "")
            {
                ReportObj = Common.JsonDeserialize<Report>(StrJson);
                if (ReportObj.UserINfos.Count > 0)
                {
                    AnswerRecord = ReportObj.UserINfos[0].AnswerRecord;

                }
                if (ReportObj.DimensionEntitys.Count > 0)
                {
                    Scores = ReportObj.DimensionEntitys[0].Score.ToString();
                }
            }                                           
            return AnswerRecord;
        }
    }
}