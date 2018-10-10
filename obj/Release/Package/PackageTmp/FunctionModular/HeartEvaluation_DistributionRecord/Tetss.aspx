<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Tetss.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation_DistributionRecord.Tetss" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
      <div class="row">
        <div class="col-md-12">

            <h1 class="page-header">量表管理 <small>量表分配</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">量表分配</a></li>

            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-md-1">
            测试类型:
        </div>
        <div class="col-md-2">
            <input type="radio" name="TestType" value="0" />日常测验
            <input type="radio" name="TestType" value="1"/>普测
        </div>
        <div class="col-md-2">

        </div>
        <div class="col-md-2">

        </div>
        <div class="col-md-2">

        </div>
    </div>
</asp:Content>
