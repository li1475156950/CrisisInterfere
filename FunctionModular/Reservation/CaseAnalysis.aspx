<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CaseAnalysis.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Reservation.CaseAnalysis" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    	 <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">心理咨询 <small>案例分析</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">案例分析</a></li>

            </ol>
        </div>
    </div>
                 <!-- /. ROW  -->

<div class="row"  style="float:right">      
      
        <div class="col-md-8 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    搜索：
                </div>

                <div class="lb-panel-right pull-right">
                    <input  type="text" class="form-control"/>
                    
                
                </div>

            </div>
        </div>
     <div class="col-md-4 col-sm-12 col-xs-12" >
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                    <button class="btn btn-search"><i class="fa fa-search "></i>查询</button>
                </div>

               
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    案例分析
                </div>
                <div class="panel-body">
                    <div class="row">
                     <div class="col-md-12">
                     <ul class="list-unstyled">
                            <li><a href="#">案例一.xxxxx</a></li>
                            <li><a href="#">案例一.xxxxx</a></li>
                          <li><a href="#">案例一.xxxxx</a></li>
                            <li><a href="#">案例一.xxxxx</a></li>
                          <li><a href="#">案例一.xxxxx</a></li>
                          <li><a href="#">案例一.xxxxx</a></li>
                          <li><a href="#">案例一.xxxxx</a></li>
                            <li><a href="#">案例一.xxxxx</a></li>
                            <li><a href="#">案例一.xxxxx</a></li>
                            <li><a href="#">案例一.xxxxx</a></li>
                        </ul>
                         </div>
                        </div>
                    <div class="row">
                        <div class="col-sm-6">

                            <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">1到10条 共57条</div>

                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination" style="margin: 0px 0;">
                                    <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">首页</a></li>
                                    <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">6</a></li>
                                    <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">下一页</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Advanced Tables -->
        </div>
    </div>            
</asp:Content>
