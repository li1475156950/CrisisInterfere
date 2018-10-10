<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AnwserRecord.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.AnwserRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-select.min.js"></script>
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="#">作答记录</a></li>
            </ol>
        </div>
    </div>

    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input id="Sel_QuesName" type="text" class="selectpicker form-control" data-done-button="true" placeholder="--问卷名称--" />
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtstart' style="height: 34px; line-height: 34px;" placeholder="--提交时间--" />
            </div>
            <div class="col-md-1 col-sm-2 col-xs-2">
                <label style="height: 34px; line-height: 34px;">-</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtend' style="height: 34px; line-height: 34px;" placeholder="--提交时间--" />
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="text-align: right; margin-top: 10px;">
            <button id="go_search" class="btn btn-primary btn-sm" name="QX_SelectViewResult"><i class="fa fa-search "></i>查询</button>
        </div>
    </div>
    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid" style="margin-left: 0px;margin-right: 0px;">
                    <thead>
                        <tr>
                            <th></th>
                            <th style="width: 10px">
                                <input id="allCheck" onclick="AllCheck()" type="checkbox" /></th>
                            <th class="text-center" style="width: 8%;">序号</th>
                            <th class="text-center">问卷名称</th>
                            <th class="text-center">提交时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody id="lbSource">
                    </tbody>
                </table>
            </div>
            <button onclick="BulkDelete()" class="btn btn-reds">
                <i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>
    </div>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script>
        var navName = '/FunctionModular/Questionnaire_Record/AnwserRecord.aspx';

        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtstart').val('<%=GetDate(-7)%>');

        $('#dtend').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtend').val('<%=GetDate(0)%>');


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

        function BindGrid() {
            quesName = $("#Sel_QuesName").val();
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#dtend").val();
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
                    url: "Ajax/MyQuestionnaire.ashx?type=AnwserRecord",
                    dataSrc: "data",
                    data: function (d) {
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

                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&quesName=' + quesName + '&StartTime=' + distriStartTime + '&EndTime=' + distriEndTime;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    $('td:eq(0)', row).html(data[0]);
                    $('td:eq(1)', row).html(data[1]);
                    $('td:eq(2)', row).html(data[6]);
                    $('td:eq(3)', row).html(data[4]);
                    var obj = "LookAnwserRecord.aspx?QD_Code=" + data[2] + "&Q_Code=" + data[8] + "&id=" + data[7] + "&type=AnwserRecord";

                    operation = " <button  class=\"btn btn-link\" data-name=remind name='QX_look' onclick=\"LookRecord('" + obj + "')\">查看</button>"
                   + " <button class=\"btn btn-link\" data-name=remove name='QX_remove' id='" + data[7] + "'>删除</button>";
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(2)', row).css("text-align", "center");
                    $('td:eq(3)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(4)', row).html(operation);
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
        //回车进行搜索
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                $('#go_search').click();
            }
        });
        //搜索
        $(document).on("click", "#go_search", function () {
            quesName = $("#Sel_QuesName").val();
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#dtend").val();
            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        });

        //批量删除
        function BulkDelete() {
            //获得表格内所有复选框
            var tempDistriArray = $("#lbSource").find("input[type=checkbox]").not("#allCheck");
            var anwId = '';
            var names = '';
            var isReturn = true;
            //获取所有被选中的信息ID
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked) {
                    if (anwId == '') {
                        anwId = tempDistriArray[i].getAttribute("id");
                        names = tempDistriArray[i].parentNode.parentNode.childNodes[2].innerHTML;
                    } else {
                        anwId += "," + tempDistriArray[i].getAttribute("id");
                        names += "," + tempDistriArray[i].parentNode.parentNode.childNodes[2].innerHTML;
                    }
                    isReturn = false;
                }
            }
            if (isReturn) {
                layer.alert("请选择要删除的作答记录！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            layer.confirm("确定将选中的作答记录放入回收站吗？", {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/MyQuestionnaire.ashx?type=Delete",
                    data: {
                        id: anwId,
                        name: names,
                        source:"作答记录"
                    },
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功！', { time: 2000, icon: 1 });
                            if (tablelist != undefined) {
                                $("#tableGrid").DataTable().draw();
                                return;
                            }
                        } else {
                            layer.msg('删除失败！', { time: 2000, icon: 5 });
                        }
                    }
                });
            });
        }
        //单个删除
        $(document).on("click", "[name=QX_remove]", function () {
            var anwId = $(this)[0].getAttribute("id");
            var names = $(this)[0].parentNode.parentNode.childNodes[2].innerHTML;
            layer.confirm("确定将该作答记录放入回收站吗？", {
                btn: ["确定", "取消"]
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/MyQuestionnaire.ashx?type=Delete",
                    data: {
                        id: anwId,
                        name: names,
                        source: "作答记录"
                    },
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功！', { time: 2000, icon: 1 });
                            if (tablelist != undefined) {
                                $("#tableGrid").DataTable().draw();
                                return;
                            }
                        } else {
                            layer.msg('删除失败！', { time: 2000, icon: 5 });
                        }
                    }
                });
            });

        });
        //查看
        function LookRecord(url) {
            window.location.href = url;
        }

    </script>
</asp:Content>
