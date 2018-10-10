<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CaseanalysisList.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.CaseanalysisList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
       <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="ViewModel/CaseanalysisList.js"></script>
       <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">预约咨询</a></li>
                <li><a href="#">案例分析</a></li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>                           
                            <th class="text-center">序号</th>
                            <th class="text-center">案列名称</th>
                            <th class="text-center">问题类型</th>                                                  
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        var navName = '/FunctionModular/AppointmentConsult/CaseanalysisList.aspx';
    </script>
   <%-- <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 10px; text-align: left;">
            
                    <iframe id="iframeBatchExport" name="iframeBatchExport" style="display: none;"></iframe>
            <button class="btn  btn-oranges " id="btnBatchExport" name=" btnBatchExport" style="margin-right: 10px;" ><i class="fa fa-arrow-up" aria-hidden="true"></i>批量导出</button>
            <button class="btn btn-reds" id="btnBatchDelete" name="btnBatchDelete"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>
    </div>--%>
</asp:Content>
