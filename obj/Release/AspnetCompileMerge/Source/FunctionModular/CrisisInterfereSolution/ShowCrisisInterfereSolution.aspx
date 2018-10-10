<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ShowCrisisInterfereSolution.aspx.cs" Inherits="CrisisInterfere.FunctionModular.CrisisInterfereSolution.ShowCrisisInterfereSolution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <div class="row" id="content">
    </div>
    <script src="/Js/layer.js"></script>
    <script>
        var navName = '/FunctionModular/CrisisInterfereSolution/CrisisInterfereSolution.aspx';
        var cISID = sessionStorage.getItem("CISID");
        $.ajax({
            url: "Ajax/CrisisInterfereSolution.ashx",
            type: "post",
            dataType: "text",
            data: { operationType: "GetCrisisInterfereSolutionByID", CISID: cISID },
            success: function (data) {
                $("#content").append(data);
            }
        })
    </script>
</asp:Content>
