<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GroupConsultation.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.GroupConsultation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    
     <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
  <%--  <script src="ViewModel/GroupZip.js"></script>--%>
    <script src="ViewModel/GroupConsultationJS.js"></script>
    <%--<script src="ViewModel/GroupConsultationInfo.js"></script>--%>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">预约咨询</a></li>
                <li><a href="#">团体咨询</a></li>
            </ol>
        </div>
    </div>

    <div class="row" style="margin-left: 9px; margin-bottom: 20px; ">
        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input class="form-control" placeholder="请输入档案号/主题" id="txtKeywords" />
        </div> 
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <select class="form-control" id="selectStatu">
                <option value="0">全部</option>
                <option value="1">未结案</option>
                <option value="2">已结案</option>
            </select>
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 10px;">
            
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('')" class='form-control input-sm' id='dtstart'  placeholder="--选择日期--" />
            </div>
            <div class="col-md-1 col-sm-2 col-xs-2" style="text-align:center"">
               <%-- <label style="height: 34px; line-height: 34px;">——</label>--%>
                <span style="height: 34px; line-height: 34px;text-align:center">-</span>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('')"  class='form-control input-sm' id='EndDate'  placeholder="--选择日期--" />
            </div>
        </div>
        <div class="col-md-1   col-sm-12 col-xs-12" style="margin-top: 10px; text-align: right;">
            <button class="btn btn-primary btn-sm" id="btnSearch" name=" btnSearch" style="margin-right: 10px;"><i class="fa fa-search "></i>查询</button>          
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 10px;">
             <button class="btn btn-sm pull-right" style="background-color: orange; color: white" id="btnAdd" name="btnAdd">+新建档案</button>
        </div>
    </div>

    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 10px">
                                <input id="allCheck" type="checkbox" value="" /></th>
                            <th class="text-center">序号</th>
                            <th class="text-center">档案号</th>
                            <th class="text-center">主题</th>                       
                            <th class="text-center">问题类型</th>
                            <th class="text-center">接案时间</th>
                            <th class="text-center">进行状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 10px; text-align: left;">
            
                    <iframe id="iframeBatchExport" name="iframeBatchExport" style="display: none;"></iframe>
            <button class="btn  btn-oranges " id="btnBatchExport" name=" btnBatchExport" style="margin-right: 10px;" ><i class="fa fa-arrow-up" aria-hidden="true"></i>批量导出</button>
            <button class="btn btn-reds" id="btnBatchDelete" name="btnBatchDelete"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>
    </div>

</asp:Content>
