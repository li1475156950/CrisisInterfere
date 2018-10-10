<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Caseanalysisiframe.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.Caseanalysisiframe" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script type="text/javascript">
        $(function () {
            var url = fnGetUrlParam("i");                 
            $("#ifm").attr("src", url);
            //$("#Ifm").push('<param  value="' + url+ '">');
           
        });
            
    </script>
      <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">预约咨询</a></li>
                <li><a href="CaseanalysisList.aspx">案列分析</a></li>
                 <li><a href="#">查看</a></li>
            </ol>
        </div>
    </div>
    <div style="float:right;margin-top:10px"><button class="btn btn-primary btn-sm" id="FH" name="QX_SelectEvaluationFiles" onclick="FH()">返回</button></div>
   <div  class="row" style="margin-left: auto; margin-right: auto; background-color: #FFF; width: 70%; min-width: 320px;">
     <iframe id="ifm" frameborder="0"scrolling="no" onload="iframeLoad()"  style="padding: 0px; width: 100%;" text-align: center;margin-right: auto; margin-left: auto;"></iframe>
       </div>
    <script type="text/javascript">
        var navName = '/FunctionModular/AppointmentConsult/CaseanalysisList.aspx';
        function FH() {
            window.location.href = "CaseanalysisList.aspx";//案列分析
        }
        function iframeLoad() {
            document.getElementById("ifm").height = 0;
            document.getElementById("ifm").height = document.getElementById("ifm").contentWindow.document.body.scrollHeight;
        }
    </script>
</asp:Content>
