<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewGroupAppointment.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.ViewGroupAppointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li>查看预约</li>
            </ol>
        </div>
    </div>

    <!-- /. ROW  -->
    <div class="row" id="headerInfo">
    </div>
    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th id="checkTh">
                                <input type="checkbox" id="allCheck" /></th>
                            <th class="text-center">序号</th>
                            <th class="text-center">登录名</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">性别</th>
                            <th class="text-center">部门</th>
                            <th class="text-center">问题类型</th>
                            <th class="text-center">处理状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade" id="showAppointmentInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 20%; width: 100%">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center" style="color: #4CB1CF; margin-top: 30px; font-size: 25px; font-weight: 700">查看预约</h4>

                <div class="modal-body">
                    <div class="row">

                        <div class="form-group  text-right">
                            <label class="col-sm-4  col-xs-4 control-label">姓名:</label>
                            <div class="col-sm-4  col-xs-4 text-left">
                                <label class="control-label" id="userName"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-4  col-xs-4 control-label">登录名:</label>
                            <div class="col-sm-6 col-xs-6 text-left">
                                <label class="control-label" id="loginName"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-4  col-xs-4 control-label">性别:</label>
                            <div class="col-sm-6 col-xs-6 text-left">
                                <label class="control-label" id="sex"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-4  col-xs-4 control-label">部门:</label>
                            <div class="col-sm-6 col-xs-6 text-left">
                                <label class="control-label" id="department"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-4  col-xs-4 control-label">咨询方式:</label>
                            <div class="col-sm-6  col-xs-6 text-left">
                                <label class="control-label" id="consultWay"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-4  col-xs-4 control-label">问题类型:</label>
                            <div class="col-sm-6  col-xs-6 text-left">
                                <label class="control-label" id="questionType"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-4  col-xs-4 control-label">联系方式:</label>
                            <div class="col-sm-6  col-xs-6 text-left">
                                <label class="control-label" id="contactWay"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-4  col-xs-4 control-label">问题详情:</label>
                            <div class="col-sm-6  col-xs-6 text-align">
                                <textarea id="questionDetail" class="form-control" readonly="readonly"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-12  col-xs-12" style="text-align: center">
                            <button id="saveInfo" data-dismiss="modal" type="button" class="btn btn-sm" style="background-color: orange; color: white">确定</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <script src="../../JS/ExtendJS.js"></script>
    <script>
        var navName = '/FunctionModular/AppointmentConsult/AppointmentManagement.aspx';
        var startPageIndex = 0;
        var endPageIndex = 10;
        var tablelist;
        var distriID = window.fnGetUrlParam("distriID");
        LoadAppointmentHeaderInfo(distriID);
        BindGrid();
        function BindGrid() {
            //roleType = $("#roleType").find("option:selected").val();
            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tablelist = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,
                ajax: {
                    method: 'get',
                    url: "Ajax/ViewGroupAppointment.ashx?operationType=LoadAppointment",
                    dataSrc: "data",
                    data: function (d) {

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        if (d.start == 0) {
                            //if (Endindex == 10) {
                            endPageIndex = d.length;
                            if (endPageIndex == 10) {
                                startPageIndex = 0;
                            }
                        } else {
                            startPageIndex = d.start + 1;
                            endPageIndex = d.start + d.length;
                        }

                        return 'startPageIndex=' + startPageIndex + '&endPageIndex=' + endPageIndex + '&distriID=' + distriID;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    $('td:eq(0)', row).css("display", "none");
                    $("#checkTh").hide();
                    var operation = "";
                    operation = " <button class=\"btn btn-link\" name='QX_permissions' data-operationType='showAppointmentInfo'>查看</button>";
                    $('td:eq(8)', row).html(operation);

                },

                "oLanguage": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "_MENU_ 记录/页",
                    "sZeroRecords": "查询无结果！",
                    "sInfo": "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项记录，共 0 项",
                    "sInfoFiltered": "",
                    "sInfoPostFix": "",
                    "sSearch": "过滤:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    }
                },
                initComplete: function (setting, json) {
                   
                }
            });

        }
        $(document).on("click", "[data-operationType='showAppointmentInfo']", function () {
            var appID = $(this).parent().parent().find("input[type='checkbox']").attr("data-appID");
            var GetAppointmentInfoParam = {
                type: "get",
                dataType: "json",
                async: false,
                data: { appID: appID },
                url: "Ajax/DisposeAppointment.ashx?operationType=GetAppointmentInfo",
                callBack: function (result) {
                    $("#showAppointmentInfo").modal("show");
                    $("#userName").text(result.UserName);
                    $("#loginName").text(result.LoginName);
                    $("#sex").text(result.Sex);
                    $("#department").text(result.DepartmentName);
                    $("#consultWay").text(result.ConsultWayName);
                    $("#contactWay").text(result.ContactWay);
                    $("#questionDetail").text(result.QuestionDetail);
                    $("#questionType").text(result.QuestionTypeName);
                }
            }
            window.NewAJAX(GetAppointmentInfoParam);
        })
        function LoadAppointmentHeaderInfo(val) {
            var loadAppointmentHeaderInfoParameter = {
                type: "get",
                dataType: "json",
                async: false,
                data: { distriID: val },
                url: "Ajax/DisposeAppointment.ashx?operationType=GetAppointmentHeaderInfo",
                callBack: function (result) {
                    $("#headerInfo").find("div").remove();
                    var tempHtml = '<div class="form-group  text-right col-md-2">' +
            '<span">咨询方式:</span>' +
            '<span id="lbConsultWay">' +
                result.ConsultWay +
            '</span>' +
        '</div>';
                    tempHtml += '<div class="form-group  text-right col-md-2">' +
            '<span">预约人数:</span>' +
            '<span">' +
               result.PeopleCount +
            '</span>' +
        '</div>';
                    tempHtml += '<div class="form-group  text-right col-md-3">' +
            '<span>咨询时间:</span>' +
            '<span id="lbConsultDate">' +
                result.ConsultDate +
            '</div>' +
        '</div>';
                    if (result.ConsultWay == "个体(面谈)" || result.ConsultWay == "团体(面谈)") {
                        tempHtml += '<div class="form-group  text-right col-md-2">' +
            '<span>咨询地点:</span>' +
            '<span>' + result.ConsultPlace + '</span>' +
        '</div>';
                        tempHtml += '<div class="form-group  text-right col-md-3">' +
                                    '<button class="btn btn-sm btn-info" id="backBefore">返回</button>'
                        '</div>';
                    } else {
                        tempHtml += '<div class="form-group  text-right col-md-5">' +
            '<button class="btn btn-sm btn-info" id="backBefore">返回</button>'
                        '</div>';
                    }
                    $("#headerInfo").append(tempHtml);
                }
            }
            window.NewAJAX(loadAppointmentHeaderInfoParameter);
        }
        $(document).on("click", "#backBefore", function () {
            window.location.href = "AppointmentManagement.aspx";
        })
    </script>
</asp:Content>
