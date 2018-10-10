<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="IndividualConsultation.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.IndividualConsultation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../CSS/x_yuyueguanli.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>

    <script src="ViewModel/IndividualConsultationViewModel.js"></script>
    <style>
        #tableGrid > tbody > tr > td {
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>
    <div class="row x_gtzxda" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input class="form-control" placeholder="请输入个案号/姓名/登录名" id="txtKeywords" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12 nopadding_left" style="margin-top: 10px;">
            <select class="form-control" id="selectStatu">
                <option value="0">全部</option>
                <option value="1">未结案</option>
                <option value="2">已结案</option>
            </select>
        </div>
        <div class="col-md-5 col-sm-12 col-xs-12 nopadding_left" style="margin-top: 10px;">
            <div class="col-md-3 col-sm-3 col-xs-3" style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('')" class='form-control input-sm' id='dtstart' style="height: 34px; line-height: 34px;" placeholder="--选择日期--" />
            </div>
            <div class="pull-left">
                <label style="height: 34px; line-height: 34px; padding: 0 10px">- </label>
            </div>
            <div class="col-md-3 col-sm-3 col-xs-3 " style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('')" class='form-control input-sm' id='EndDate' style="height: 34px; line-height: 34px;" placeholder="--选择日期--" />
            </div>
            <button class="btn x_button btn-sm ml20" id="btnSearch" name=" btnSearch" style="margin-left: 15px;"><i class="fa fa-search "></i>查询</button>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12 pull-right" style="margin-top: 10px;">
            <button class="btn btn-reds x_button pull-right" id="btnAdd" name="btnAdd">+ 新建档案</button>
        </div>
    </div>

    <div class="row x_gtda_table" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover dataTable no-footer" style="word-wrap:break-word; word-break:break-all;" id="tableGrid">
                    <thead>
                       <tr role="row"><th class="text-center sorting_disabled" rowspan="1" colspan="1" >
                                <input id="allCheck" type="checkbox" value=""/>

                                      </th><th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 62px;">序号</th>
                           <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 107px;">个案号</th>
                           <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 84px;">登录名</th>
                           <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 130px;">姓名</th>
                           <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 103px;">问题类型</th>
                           <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 103px;">接案时间</th>
                           <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 77px;">进行状态</th>
                           <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 28px;">操作</th>

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
            <button class="btn  btn-blues x_button" id="btnBatchExport" name=" btnBatchExport" style="margin-right: 10px;"><i class="icon iconfont">&#xebc3;</i> 批量导出</button>
            <button class="btn btn-reds x_button" id="btnBatchDelete" name="btnBatchDelete"><i class="icon iconfont">&#xeb8d;</i> 批量删除</button>
        </div>
    </div>


    <script>
        var navName = '/FunctionModular/AppointmentConsult/IndividualConsultation.aspx';
    </script>
</asp:Content>
