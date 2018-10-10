<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DisposeAppointment.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.DisposeAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/x_yuyueguanli.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li>处理预约</li>
            </ol>
        </div>
    </div>
    <style>
        #tableGrid.table > caption + thead > tr:first-child > th, 
     #tableGrid.table > colgroup + thead > tr:first-child > th, 
     #tableGrid.table > thead:first-child > tr:first-child > th, 
     #tableGrid.table > caption + thead > tr:first-child > td,
      #tableGrid.table > colgroup + thead > tr:first-child > td, 
     #tableGrid.table > thead:first-child > tr:first-child > td{
    background:#e0e0e0;
    color:#666;
    font-weight:normal;
    font-size:16px;
    }
        .table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
    border: none;
}
        .table-bordered > thead > tr > th, .table-bordered > tbody > tr > th, .table-bordered > tfoot > tr > th, .table-bordered > thead > tr > td, .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
    border-right: 1px solid #ddd!important;
    text-align:center;
    font-size:16px;
}
        #tableGrid.table .btn-link {
    font-weight: normal;
    color: #50ace2;
    font-size:16px;
}
        #backBefore {
        background: #fff;
    color: #f9906f!important;
    border-color: #f9906f!important;
    height: 30px;
    line-height: 15px;
    font-size: 14px;
        }
    </style>
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
                            <th class="text-center">操作</th>
                            <th class="text-center" style="display: none">状态</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <button class="btn btn-sm" onclick="BulkAcceptApply()" id="bulkAccept" style="color: white"><i class="fa fa-check-circle-o"></i>批量接受</button>
        </div>
    </div>
    <div class="modal x_tanchuang1  fade" id="showAppointmentInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 20%; width: 100%">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center xia_title xia_title_small">查看预约</h4>

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
                            <button id="saveInfo" data-dismiss="modal" type="button" class="btn btn-sm x_btn">确定</button>
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
        var remainingQuota;
        var serviceUserCount;
        $(document).ready(function () {
            $.ajax({
                url: "Ajax/DisposeAppointment.ashx?operationType=GetServiceUserCount",
                type: "GET",
                data: { distriID: distriID },
                async: false,
                dataType:"text",
                success: function (result) {
                    serviceUserCount = result;
                }
            })
        })
        LoadAppointmentHeaderInfo(distriID);
        BindGrid();
        var checkParam = {
            checkAllControl: "allCheck",
            checkChildClass: "childCheck",
            callBack: function () { }
        }
        window.SetCheckAll(checkParam);
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
                    url: "Ajax/DisposeAppointment.ashx?operationType=LoadAppointment",
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
                    $("td:eq(8)", row).css("display", "none");
                    var operation = "";
                    if (data[8] == "待确认") {
                        operation = " <button class=\"btn btn-link\" name='QX_permissions' data-operationType='showAppointmentInfo'>查看</button>"+
                            " <button class=\"btn btn-link\"   name='QX_UpdateRole' data-toggle='modal' data-target='#editRole' data-operationType='acceptApply'>接受</button>"
                   + " <button  class=\"btn btn-link\"  name='QX_DeleteRole' data-operationType='refuseApply'>拒绝</button>";
                    }
                    if (data[8] == "已预约") {
                        operation = " <button class=\"btn btn-link\" name='QX_permissions' data-operationType='showAppointmentInfo'>查看</button>"+
                            " <button class=\"btn btn-link\"  disabled='disabled' name='QX_UpdateRole' data-toggle='modal' data-target='#editRole' data-operationType='acceptApply'>接受</button>";
                    }
                    if (data[8] == "未通过") {
                        operation = " <button class=\"btn btn-link\" name='QX_permissions' data-operationType='showAppointmentInfo'>查看</button>"+
                            " <button  class=\"btn btn-link\" disabled='disabled' name='QX_DeleteRole' data-operationType='refuseApply'>拒绝</button>";
                    }
                    if ($("#lbConsultWay").text() == "个体(面谈)" || $("#lbConsultWay").text() == "个体(在线)") {
                        $('td:eq(0)', row).css("display", "none");
                        $("#checkTh").hide();
                    }

                    $('td:eq(7)', row).html(operation);

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
        $(document).on("click", "[data-operationType='acceptApply']", function () {
            var consultWay = $("#lbConsultWay").text();
            var appID = $(this).parent().parent().find("input[type='checkbox']").attr("data-appID");
            var userID = $(this).parent().parent().find("input[type='checkbox']").attr("data-userID");
            if (consultWay == "个体(在线)" || consultWay == "个体(面谈)") {
                layer.confirm("接受该成员，系统会自动拒绝并删除其他成员申请，确定接受该成员吗？ ", {
                    btn: ["确定", "取消"]
                }, function () {
                    AcceptApply(appID);
                    var userArray = GetAwaitStateAppointment();
                    if (userArray.length != 0) {
                        for (var i = 0; i < userArray.length; i++) {
                            var isSuccess = RefuseApply(userArray[i].AppID, $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            if (isSuccess) {
                                window.SendWebLetter(userArray[i].UserID, "预约拒绝", $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            }
                        }
                    }
                    window.SendWebLetter(userID, "预约成功", "您已预约" + $("#lbConsultDate").text() + window.GetCurrentLoginName() + "老师的心理咨询")
                    window.location.href = "AppointmentManagement.aspx";
                    //}, function () {
                    layer.closeAll();
                })
                return;
            }
            if ((consultWay == "团体(在线)" || consultWay == "团体(面谈)") && (remainingQuota == 1||serviceUserCount==1)) {
                layer.confirm("接受该成员后，到达人数限制，系统会自动拒绝并删除其他成员申请，确定接受该成员吗", {
                    btn: ["确定", "取消"]
                }, function () {
                    AcceptApply(appID);
                    var userArray = GetAwaitStateAppointment();
                    if (userArray.length != 0) {
                        for (var i = 0; i < userArray.length; i++) {
                            var isSuccess = RefuseApply(userArray[i].AppID, $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            if (isSuccess) {
                                window.SendWebLetter(userArray[i].UserID, "预约拒绝", $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            }

                        }
                    }
                    window.SendWebLetter(userID, "预约成功", "您已预约" + $("#lbConsultDate").text() + window.GetCurrentLoginName() + "老师的心理咨询")
                }, function () {
                    layer.closeAll();
                })
                return;
            }
            if ((consultWay == "团体(在线)" || consultWay == "团体(面谈)") && remainingQuota != 1) {
                AcceptApply(appID);
                window.SendWebLetter(userID, "预约成功", "您已预约" + $("#lbConsultDate").text() + window.GetCurrentLoginName() + "老师的心理咨询")
                if ((remainingQuota == 0 || remainingQuota < 0)&&serviceUserCount!=0) {
                    var userArray = GetAwaitStateAppointment();
                    if (userArray.length != 0) {
                        for (var i = 0; i < userArray.length; i++) {
                            var isSuccess = RefuseApply(userArray[i].AppID, $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            if (isSuccess) {
                                window.SendWebLetter(userArray[i].UserID, "预约拒绝", $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            }
                        }
                    }
                }
            }
        })
        function BulkAcceptApply() {
            var appID = "";
            var getCheckedParam = {
                checkChildClass: "childCheck",
                eachCallBack: function (index, item) { },
                callBack: function () { }
            }
            var checkedArray = window.GetCheckedCheckBox(getCheckedParam);
            if (checkedArray.length == 0) {
                layer.alert("请选择要授权的预约");
                return;
            }
            var length = checkedArray.length;
            for (var i = 0; i < length; i++) {
                appID += $(checkedArray[i]).attr("data-appID") + ",";
            }
            if (remainingQuota != undefined) {
                if (checkedArray.length > remainingQuota&&remainingQuota>=0) {
                    layer.msg("选择人数超过剩余名额", { icon: 5, time: 2000 });
                    return;
                }
            }
            if (checkedArray.length == serviceUserCount) {
                layer.confirm("接受所选成员后，到达人数限制，系统会自动拒绝并删除其他成员申请，确定接受该成员吗", {
                    btn: ["确定", "取消"]
                }, function () {
                    AcceptApply(appID);
                    var userArray = GetAwaitStateAppointment();
                    if (userArray.length != 0) {
                        for (var i = 0; i < userArray.length; i++) {
                            var isSuccess = RefuseApply(userArray[i].AppID, $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            if (isSuccess) {
                                window.SendWebLetter(userArray[i].UserID, "预约拒绝", $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            }

                        }
                    }
                    var array = appID.split(",");
                    for (var i = 0; i < length; i++) {
                        if (array[i] != "") {
                            var tempUserID = $("[data-appID=" + array[i] + "]").attr("data-userID");
                            window.SendWebLetter(tempUserID, "预约成功", "您已预约" + $("#lbConsultDate").text() + window.GetCurrentLoginName() + "老师的心理咨询")
                        }
                    }
                }, function () {
                    layer.closeAll();
                })
                return;
            }
            if (checkedArray.length == remainingQuota) {
                layer.confirm("接受所选成员后，到达人数限制，系统会自动拒绝并删除其他成员申请，确定接受该成员吗", {
                    btn: ["确定", "取消"]
                }, function () {
                    AcceptApply(appID);
                    var userArray = GetAwaitStateAppointment();
                    if (userArray.length != 0) {
                        for (var i = 0; i < userArray.length; i++) {
                            var isSuccess = RefuseApply(userArray[i].AppID, $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            if (isSuccess) {
                                window.SendWebLetter(userArray[i].UserID, "预约拒绝", $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            }

                        }
                    }
                    var array = appID.split(",");
                    for (var i = 0; i < length; i++) {
                        if (array[i] != "") {
                            var tempUserID = $("[data-appID=" + array[i] + "]").attr("data-userID");
                            window.SendWebLetter(tempUserID, "预约成功", "您已预约" + $("#lbConsultDate").text() + window.GetCurrentLoginName() + "老师的心理咨询")
                        }
                    }
                }, function () {
                    layer.closeAll();
                })
                return;
            }
            if ( remainingQuota == 1) {
                layer.confirm("接受该成员后，到达人数限制，系统会自动拒绝并删除其他成员申请，确定接受该成员吗", {
                    btn: ["确定", "取消"]
                }, function () {
                    AcceptApply(appID);
                    var userArray = GetAwaitStateAppointment();
                    if (userArray.length != 0) {
                        for (var i = 0; i < userArray.length; i++) {
                            var isSuccess = RefuseApply(userArray[i].AppID, $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            if (isSuccess) {
                                window.SendWebLetter(userArray[i].UserID, "预约拒绝", $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            }

                        }
                    }
                    var array = appID.split(",");
                    for (var i = 0; i < length; i++) {
                        if (array[i] != "") {
                            var tempUserID = $("[data-appID=" + array[i] + "]").attr("data-userID");
                            window.SendWebLetter(tempUserID, "预约成功", "您已预约" + $("#lbConsultDate").text() + window.GetCurrentLoginName() + "老师的心理咨询")
                        }
                    }
                }, function () {
                    layer.closeAll();
                })
            }
            if (remainingQuota == undefined || remainingQuota > 1||remainingQuota<1) {
                AcceptApply(appID);
                var array = appID.split(",");
                for (var i = 0; i < length; i++) {
                    if (array[i] != "") {
                        var tempUserID = $("[data-appID=" + array[i] + "]").attr("data-userID");
                        window.SendWebLetter(tempUserID, "预约成功", "您已预约" + $("#lbConsultDate").text() + window.GetCurrentLoginName() + "老师的心理咨询")
                    }
                }
                if ((remainingQuota == 0||remainingQuota<0)&&serviceUserCount!=0) {
                    var userArray = GetAwaitStateAppointment();
                    if (userArray.length != 0) {
                        for (var i = 0; i < userArray.length; i++) {
                            var isSuccess = RefuseApply(userArray[i].AppID, $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            if (isSuccess) {
                                window.SendWebLetter(userArray[i].UserID, "预约拒绝", $("#lbConsultDate").text() + "时间段咨询师已预约其他用户，您的预约请求被拒绝!");
                            }
                        }
                    }
                }
            }
        }
        function AcceptApply(val) {
            var acceptApplyParameter = {
                type: "get",
                dataType: "json",
                async: false,
                data: { appID: val, distriID: distriID },
                url: "Ajax/DisposeAppointment.ashx?operationType=AcceptApply",
                callBack: function (result) {
                    if (result.State) {
                        remainingQuota = result.Data;
                        serviceUserCount = result.ServiceUserCount;
                        $("#tableGrid").dataTable().fnDraw(false);
                        if ($("#tableGrid").find("tr").length == 2) {
                            $("#allCheck")[0].checked = false;
                        }
                        layer.msg("已接受!", { icon: 6, time: 2000 });
                    }
                    else {
                        layer.msg(result.Data, { icon: 5, time: 2000 });
                    }
                }
            }
            window.NewAJAX(acceptApplyParameter);
        }
        $(document).on("click", "[data-operationType='refuseApply']", function () {
            var appID = $(this).parent().parent().find("input[type='checkbox']").attr("data-appID");
            var userID = $(this).parent().parent().find("input[type='checkbox']").attr("data-userID");
            var name = $(this).parent().parent().find("td:eq(3)").text();
            layer.open({
                title: '信息',
                //area: ['300px', '360px'],
                shade: 0,
                offset: ["30%", "30%"],
                maxmin: true,
                content: '<div class="row">您确定要拒绝' + name + '的预约吗?</div><div class="row"><textarea style="border-radius: 5px;resize: none; margin-top: 20px; height: 80px;" class="form-control" maxlength="200" id ="refuseReason" placeholder="拒绝原因:"></textarea></div>',
                btn: ['确定', '取消'],
                yes: function () {
                    var refuseReason = $("#refuseReason").val()
                    var isSuccess = RefuseApply(appID, refuseReason);
                    if (isSuccess) {
                        window.SendWebLetter(userID, "预约拒绝", "您的" + $("#lbConsultDate").text() + "的时间段已被拒绝,拒绝理由为:" + $("#refuseReason").val())
                        layer.msg("拒绝成功", { time: 2000, icon: 6 });
                    } else {
                        layer.msg("拒绝失败", { time: 2000, icon: 6 });
                    }

                },
                btn2: function () {
                    layer.closeAll();
                }

            });

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
            '</span>' +
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
        function GetAwaitStateAppointment() {
            var userArray = [];
            $.ajax({
                url: "Ajax/DisposeAppointment.ashx?operationType=GetAwaitStateAppointment",
                type: "get",
                async: false,
                data: { distriID: distriID },
                dataType: "json",
                success: function (result) {
                    userArray = result;
                }
            })
            return userArray;
        }
        function RefuseApply(appID, refuseReason) {
            var isSuccess = true;
            var refuseApplyParameter = {
                type: "get",
                dataType: "json",
                async: false,
                data: { appID: appID, refuseReason: refuseReason },
                url: "Ajax/DisposeAppointment.ashx?operationType=RefuseApply",
                callBack: function (result) {
                    if (isSuccess) {
                        $("#tableGrid").dataTable().fnDraw(false);
                    }
                    isSuccess = result.State;
                }
            }
            window.NewAJAX(refuseApplyParameter);
            return isSuccess;
        }
        $(document).on("click", "#backBefore", function () {
            window.location.href = "AppointmentManagement.aspx";
        })
        $(document).ready(function () {
            if ($("#lbConsultWay").text() == "个体(在线)" || $("#lbConsultWay").text() == "个体(面谈)") {
                $("#bulkAccept").hide();
            }

        })
    </script>
</asp:Content>
