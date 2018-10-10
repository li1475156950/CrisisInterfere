<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuestionnaireRecord.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.QuestionnaireRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-table.min.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>

    <style type="text/css">
        .table.dataTable.no-footer {
            border-bottom: #ffffff;
        }

        .table.dataTable thead th, table.dataTable thead td {
            border-bottom: #ffffff;
        }
    </style>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="#">分配记录</a></li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input id="Sel_AmountType" class="form-control" placeholder="--问卷名称--" />
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input id="loginName" class="form-control" placeholder="--登录名/姓名--" />
        </div>

        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('')" class='form-control input-sm' id='dtstart' style="height: 34px; line-height: 34px;" placeholder="--分配日期--" />
            </div>
            <div class="col-md-1 col-sm-2 col-xs-2">
                <label style="height: 34px; line-height: 34px;">-</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('')" class='form-control input-sm' id='EndDate' style="height: 34px; line-height: 34px;" placeholder="--分配日期--" />
            </div>

        </div>

        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input id="Department_ID" placeholder="--选择部门--" name="ADepartment" style="top: 0; height: 20px;" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">

            <select id="answerStatus" class="form-control">
                <%--<option value="-1">--作答状态--</option>--%>
                <option value="-1">全部</option>
                <option value="0">未作答</option>
                <option value="1">已作答</option>
            </select>
        </div>
        <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">

            <button id="go_search" class="btn btn-primary btn-sm" name="QX_SelectDistributionRecord"><i class="fa fa-search "></i>查询</button>
        </div>
    </div>

    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th style="width: 10px; display: none"></th>
                            <th style="width: 10px">
                                <input id="allCheck" onclick="AllCheck()" type="checkbox" /></th>
                            <th class="text-center">序号</th>
                            <th class="text-center">问卷名称</th>
                            <th class="text-center">登录名</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">部门名称</th>
                            <th class="text-center">分配时间</th>
                            <th class="text-center">作答状态</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                </table>
            </div>

            <button onclick="BulkRemindByWebLetter()" name="QX_BulkRemindByWebLetter" class="btn  btn-blues">
                <i class="glyphicon glyphicon-bell"></i>批量提醒</button>
            <button onclick="BulkDelete()" name="QX_BulkDelete" class="btn btn-reds">
                <i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>
    </div>
    <%-- 多个提醒 --%>
    <div class="modal fade" id="editrecord" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 35%; width: 60%; height: 200px; margin-left: 120px;">

                <button type="button" class="close bulkCancel" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center" style="color: #4CB1CF; margin-top: 15px; font-size: 25px; font-weight: 700">选择提醒方式
                </h4>

                <div class="col-sm-6  col-xs-6 text-right" style="margin-top: 15px; margin-left: -10px;">
                    <input id="webLetter" type="checkbox" value="" /><label for="webLetter" style="font-size: 19px;"> 站内信</label>
                </div>
                <div class="col-sm-4  col-xs-6 text-center" style="margin-top: 15px;">
                    <input id="email" type="checkbox" value="" /><label for="email" style="font-size: 19px;"> 邮&nbsp;箱</label>
                </div>

                <div class="row" style="margin-top: 80px;">
                    <div class="col-sm-6  col-xs-6 text-right">
                        <button onclick="tixin()" type="button" class="btn btn-sm" style="background-color: orange; color: white">确定</button>
                    </div>
                    <div class="col-sm-3  col-xs-3  text-left">
                        <button type="button" class="btn btn-sm bulkCancel" data-dismiss="modal" style="color: white">取消</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <%-- 单个提醒 --%>
    <div class="modal fade" id="remindByLetter" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 35%; width: 79%; height: 200px;">

                <button type="button" class="close singleCancel" data-dismiss="modal"
                    aria-hidden="true">
                    ×
                </button>
                <h4 class="modal-title text-center" style="color: #4CB1CF; margin-top: 15px; font-size: 25px; font-weight: 700">选择提醒方式
                </h4>

                <div class="col-sm-6  col-xs-6 text-center" style="margin-top: 15px;">
                    <input id="sinWebLetter" type="checkbox" value="" /><label for="sinWebLetter" style="font-size: 19px;"> 站内信</label>
                </div>
                <div class="col-sm-6  col-xs-6 text-center" style="margin-top: 15px;">
                    <input id="sinEmail" type="checkbox" value="" /><label for="sinEmail" style="font-size: 19px;">邮&nbsp;箱</label>
                </div>

                <div class="row" style="margin-top: 88px;">
                    <div class="col-sm-5  col-xs-6 text-right">
                        <button onclick="Remind()" type="button" class="btn btn-warning">确定</button>
                    </div>
                    <div class="col-sm-4  col-xs-3  text-right">
                        <button type="button" class="btn btn-primary singleCancel" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script>
        var navName = '/FunctionModular/Questionnaire_Record/QuestionnaireRecord.aspx';
        var receiveID = "";
        var sendFailPeople = '';
        //initAnswerStatusSelectInput("Remark=1", "answerStatus", "--请选择作答状态--")
        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var quesName = "";
        var loginName = '';
        var departmentID = 0;
        var distriStartTime = '';
        var distriEndTime = '';
        var ansID = 0;
        var tablelist;
        BindGrid();

        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn', format: "yyyy-mm-dd", endDate: new Date() });
        //$('#dtstart').datepicker('setStartDate', '2016-08-25');

        $('#EndDate').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn', format: "yyyy-mm-dd", endDate: new Date() });
        //$('#EndDate').datepicker('setStartDate', '2016-08-25');


        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu");
        $("#FPJL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');

        function initAnswerStatusSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/DistributionRecord.ashx?operationType=LoadAnswerStatusName",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item["AnsID"] + "'>" + item["AnsName"] + "</option>");
                    });

                }
            });
        }

        function BindGrid() {
            quesName = $("#Sel_AmountType").val();
            loginName = $("#loginName").val();
            if ($("#Department_ID_val").val() != undefined && $("#Department_ID_val").val() != "") {
                departmentID = $("#Department_ID_val").val();
            }
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#EndDate").val();
            ansID = $("#answerStatus").find("option:selected").val();
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
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    }
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Questionnaire_Record.ashx?operationType=BindDis",
                    dataSrc: "data",
                    data: function (d) {

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        //Endindex = 0;
                        //Startindex = 0;
                        //if (d.start == 0) {
                        //    Endindex = d.length;
                        //} else {
                        //    Startindex = d.start + 1;
                        //    Endindex = d.start + d.length;
                        //}
                        if (d.start == 0) {
                            //if (Endindex == 10) {
                            Endindex = d.length;
                            if (Endindex == 10) {
                                Startindex = 0;
                            }
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }

                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&quesName=' + quesName + '&loginName=' + loginName + '&departmentID=' + departmentID + '&distriStartTime=' + distriStartTime + '&distriEndTime=' + distriEndTime + '&ansID=' + ansID;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    $('td:eq(0)', row).html(data[1]);
                    $('td:eq(1)', row).html(data[2]);
                    $('td:eq(2)', row).html(data[3]);
                    $('td:eq(3)', row).html(data[4]);
                    $('td:eq(4)', row).html(data[5]);
                    $('td:eq(5)', row).html(data[11]);
                    $('td:eq(6)', row).html(data[6]);
                    $('td:eq(7)', row).html(data[7]);
                    if (data[7] == "已作答") {
                        operation = " <button  class=\"btn btn-link\" disabled = 'disabled' data-name=remind name='QX_remind'>提醒</button><button  class=\"btn btn-link\" data-name=remove name='QX_remove'>删除</button>";
                    }
                    else {
                        operation = " <button class=\"btn btn-link\" data-name=remind name='QX_remind'>提醒</button>"
                       + " <button class=\"btn btn-link\" data-name=remove name='QX_remove'>删除</button>";
                    }
                    for (var i = 0; i < 9; i++) {
                        $('td:eq(' + i + ')', row).css("text-align", "center");
                    }
                    $('td:eq(8)', row).html(operation);
                },

                "oLanguage": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "_MENU_ 记录/页",
                    "sZeroRecords": "没有匹配的记录",
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
                },
                drawCallback: function (s) {
                    $("#allCheck").removeAttr("checked");
                }
            });

        }

        $(document).on("click", "#go_search", function () {

            quesName = $("#Sel_AmountType").val();
            loginName = $("#loginName").val();
            if ($("#Department_ID_val").val() != undefined && $("#Department_ID_val").val() != "") {
                departmentID = $("#Department_ID_val").val();
            } else {
                departmentID = 0;
            }
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#EndDate").val();
            ansID = $("#answerStatus").find("option:selected").val();
            if (tableGrid != undefined) {
                $("#allCheck")[0].checked = false;
                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        function AllCheck() {
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                checkArray[i].checked = $("#allCheck")[0].checked;
            }
        }

        $(document).on("click", ".checkDistri", function () {

            var isAllCheck = true;
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }

            $("#allCheck")[0].checked = isAllCheck;
        });


        $(document).on("click", "[data-name=remind]", function () {
            $("#remindByLetter").modal("show");
            receiveID = $(this).parent().parent().find("input[type=checkbox]").attr("data-uid");

        });
        $(".bulkCancel").click(function () {
            $("#webLetter").attr("checked", false);
            $("#email").attr("checked", false);
        });

        $(".singleCancel").click(function () {
            $("#sinWebLetter").attr("checked", false);
            $("#sinEmail").attr("checked", false);
        });
        function RemindByWebLetter(receiveID) {

            $.ajax({
                url: "/FunctionModular/Letter/Ajax/Letter.ashx?type=16",
                data: { receveid: receiveID, title: "测评提醒", content: "您有一个新的问卷未进行作答，请及时作答！" },
                type: 'get',
                async: false,
                success: function (result) {
                    if (result == "True") {
                        $('#allCheck').attr("checked", false);
                        $("#webLetter").attr("checked", false);
                        $("#sinWebLetter").attr("checked", false);
                        $("#tableGrid").DataTable().draw();
                        layer.msg('提醒成功！', { icon: 6 });
                    }
                }
            });
        }
        function RemindByEmail(receiveID) {

            $.ajax({
                url: "/FunctionModular/HeartEvaluation_DistributionRecord/Ajax/DistributionRecord.ashx?operationType=RemindByEmail",
                data: { receveid: receiveID, title: "测评提醒", content: "您有一个新的问卷未进行作答，请及时作答！" },
                type: 'get',
                dataType: "json",
                success: function (result) {
                    if (result.State == true) {
                        $('#allCheck').attr("checked", false);
                        $("#email").attr("checked", false);
                        $("#sinEmail").attr("checked", false);
                        $("#tableGrid").DataTable().draw();
                        layer.msg('提醒成功！', { icon: 6 });
                    } else {
                        layer.msg('' + result.Error + '提醒失败！', { icon: 5 });
                    }
                }
            });
        }
        function BulkRemindByWebLetter() {

            var tempDistriArray = "";

            tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");

            var isRemind = false;

            for (var i = 0; i < tempDistriArray.length; i++) {

                if ($(tempDistriArray[i])[0].checked) {

                    isRemind = true;

                }
            }
            if (!isRemind) {
                layer.alert("请选择要提醒的用户！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            //for (var i = 0; i < tempDistriArray.length; i++) {

            //    if (($(tempDistriArray[i])[0].checked)&&$(tempDistriArray[i]).parent().parent().find("td:eq(7)").text() == "未作答") {
            //        isRemind = true;
            //    }
            //}

            $("#editrecord").modal("show");
        }
        ///批量提醒
        function tixin() {

            var webLetter = $("#webLetter")[0].checked;
            var email = $("#email")[0].checked;
            //alert("批量提醒")
            var tempDistriArray = "";

            tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var userIDList = '';

            $("#webLetter").attr("checked", false);
            $("#email").attr("checked", false);
            var isRemind = false;

            for (var i = 0; i < tempDistriArray.length; i++) {

                if ($(tempDistriArray[i]).parent().parent().find("td:eq(7)").text() != "已作答" && $(tempDistriArray[i])[0].checked) {

                    isRemind = true;
                }
            }
            if (!isRemind) {
                layer.alert("请选择要提醒的用户，已过期状态不可被提醒", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked) {
                    if ($(tempDistriArray[i]).parent().parent().find("td:eq(7)").text() != "已作答") {
                        userIDList += $(tempDistriArray[i]).attr("data-uid") + ",";
                    }
                    else {
                        sendFailPeople += $(tempDistriArray[i]).parent().parent().find("td:eq(3)").text() + "、";
                    }
                }
            }

            if (!webLetter && !email) {
                layer.alert("请选择提醒方式!", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            if (userIDList == "" && sendFailPeople != "") {
                layer.msg('' + sendFailPeople + '提醒失败！', { icon: 5 });
                $("#editrecord").modal('hide');
                return;
            }
            $("#editrecord").modal('hide');
            if (webLetter && email) {
                RemindByEmail(userIDList);
                RemindByWebLetter(userIDList);
                return;
            }
            if (webLetter && !email) {
                RemindByWebLetter(userIDList);
                return;
            }
            if (!webLetter && email) {
                RemindByEmail(userIDList);
                return;
            }

        }
        //单个提醒
        function Remind() {
            var receive = receiveID;
            var webLetter = $("#sinWebLetter")[0].checked;
            var email = $("#sinEmail")[0].checked;

            if (!webLetter && !email) {
                layer.alert("请选择提醒方式!", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }

            $("#sinWebLetter").attr("checked", false);
            $("#sinEmail").attr("checked", false);
            $('#remindByLetter').modal('hide');
            if (webLetter && email) {
                RemindByEmail(receive);
                RemindByWebLetter(receive);
                return;
            }
            if (webLetter && !email) {
                RemindByWebLetter(receive);
                return;
            }
            if (!webLetter && email) {
                RemindByEmail(receive);
                return;
            }

        }

        function BulkDelete() {
            var tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var distriID = '';//用来更新的ID
            var deleID = '';//用来删除的ID
            var strs = '';//所有被选中的分配ID
            var isRemind = false;

            for (var i = 0; i < tempDistriArray.length; i++) {

                if ($(tempDistriArray[i])[0].checked) {
                    isRemind = true;
                }
            }
            if (!isRemind) {
                layer.alert("请选择要删除的记录！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            for (var i = 0; i < tempDistriArray.length; i++) {
                if ($(tempDistriArray[i])[0].checked) {
                    if ($(tempDistriArray[i]).parent().parent().find("td:eq(7)").text() == "已作答")
                        distriID += $(tempDistriArray[i]).attr("id") + ",";
                    else
                        deleID += $(tempDistriArray[i]).attr("id") + ",";
                    strs += $(tempDistriArray[i]).attr("id") + ",";
                }
            }

            layer.confirm("删除记录后，未作答的问卷，用户将无法作答，是否确认删除？", {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/Questionnaire_Record.ashx?operationType=BeforeDelete",
                    data: { ids: strs },
                    success: function (msg) {
                        if (msg == "") {
                            return false;
                        } else {
                            var arr = eval(msg);
                            distriID = arr[0];
                            deleID = arr[1];
                            DeleteOperation(distriID, deleID);
                        }
                    }
                });
            });

        }

        $(document).on("click", "[data-name=remove]", function () {


            var distriID = $(this).parent().parent().find("input[type=checkbox]").attr('id');
            var named = $(this).parent().parent().find("td:eq(7)").text();

            if (named == "已作答") {
                layer.confirm("确认删除此条记录？", {
                    btn: ['确定', '取消'] //按钮
                }, function () {
                    DeleteOperation(distriID, "");
                });
                return;
            }

            layer.confirm("删除此条记录，用户将无法作答该问卷，是否确认删除？", {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/Questionnaire_Record.ashx?operationType=BeforeDelete",
                    data: { ids: distriID },
                    success: function (msg) {
                        if (msg == "") {
                            return false;
                        } else {
                            var arr = eval(msg);
                            distriID = arr[0];
                            var deleID = arr[1];
                            if (deleID != "")
                                DeleteOperation("", deleID);
                            else
                                DeleteOperation(distriID, "");
                        }
                    }
                });
            });
        });
        function DeleteOperation(val, deleVal) {
            $.ajax({
                url: "Ajax/Questionnaire_Record.ashx?operationType=DeleteDistributeRecord",
                type: "GET",
                dataType: "text",
                data: {
                    distriID: val,
                    deleID: deleVal
                },
                success: function (data) {
                    if (data == "True") {
                        $('#allCheck').attr("checked", false);
                        $("#tableGrid").dataTable().fnDraw(false);
                        layer.msg("删除成功！", { icon: 6, time: 2000 }, function () {
                            layer.closeAll('dialog');

                        });
                    } else {
                        layer.msg("删除失败!", { icon: 5, time: 2000 }, function () {
                            layer.closeAll('dialog');
                            $("#tableGrid").dataTable().fnDraw(false);
                            var htmls = "    <button onclick=\"BulkRemindByWebLetter()\" class=\"btn  btn-blues\" style=\"height: 22px; padding-top: 0px;\">";
                            htmls += "  <i class=\"glyphicon glyphicon-bell \"></i>提醒</button>";
                            htmls += " <button onclick=\"BulkDelete()\" class=\"btn btn-reds  btn-sm\" style=\"height: 22px; padding-top: 0px;\">";
                            htmls += "     <i class=\"glyphicon glyphicon-trash\"></i>删除</button>";
                            $("#tableGrid_info").html("");
                            $("#tableGrid_info").html(htmls);
                        });
                    }
                }
            });
        }

        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
        OnLoadTreeComDID();
        function OnLoadTreeComDID() {
            $("#Department_ID").ligerComboBox({
                width: "100%",
                selectBoxWidth: "85%",
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    onSuccess: function () {
                        setTimeout(function () {
                            var manager = $(".l-tree").ligerGetTreeManager();
                        }, 1000);
                    },
                    onBeforeSelect: function (node) {

                        $("#DepID").val(node.data['id']);
                    },
                    url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }, onSelected: function (value, text) {



                }
            });
        }
    </script>
</asp:Content>
