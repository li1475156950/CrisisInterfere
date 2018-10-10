<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Caseanalysis.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.Caseanalysis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script src="../../JS/jquery-2.0.3.min.js"></script>

    <script src="ViewModel/MyAjaxForm.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn").click(function () {
                $("#fm1").ajaxSubmit({
                    url: "Ajax/Caseanalysis.ashx?operationType=Add",
                    type: "post",
                    data: { Ctitle: $("#Ctitle").val(), Qtype: $("#Qtype").val() },
                    success: function (data) {
                       alert(data)
                       
                    }
                });
            });
        });
    </script>  

    <form id="fm1" method="post"><!--method="post"不能省略，在ie里面必不可少-->  
        <div style="text-align:center; margin-top:100px">
       <div class="row">标题：<input  type="text" id="Ctitle"/></div>
         <br />
        <div class="row">问题类型：<input  type="text" id="Qtype"/></div>
            <br />
        <div class="row" style="text-align:center;margin-left:480px;">
          <span style="float:left">上传：</span>
            <span><input type="file" style="float:left" id="btnfile" name="btnfile" value="提交"/> </span>     
            </div>
               <br />  
    <input type="button" id="btn" value="上传" style="background-color:RGB(66,139,203);color:#ffffff; border:1px solid "/>  
           </div>
  </form>  
  <div id="divimg"></div>  
</asp:Content>
