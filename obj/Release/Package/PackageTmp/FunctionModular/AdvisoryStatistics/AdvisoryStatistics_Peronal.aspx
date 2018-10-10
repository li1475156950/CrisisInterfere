<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AdvisoryStatistics_Peronal.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AdvisoryStatistics.AdvisoryStatistics_Peronal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-select.min.js"></script>
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <link href="../../CSS/font-awesome.min.css" rel="stylesheet" />

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">预约咨询</a></li>
                <li><a href="AdvisoryStatistics.aspx">咨询统计</a></li>
                <li><a href="#">个体咨询</a></li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input id="Name" type="text" class="selectpicker form-control" data-done-button="true" placeholder="--登录名/姓名--" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <select class="selectpicker" data-done-button="true" data-live-search="true" id="Sel_QuestionType" style="width: 100%">
            </select>
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtstart' style="height: 34px; line-height: 34px;" placeholder="--请选择日期--" />
            </div>
            <div class="col-md-1 col-sm-2 col-xs-2 text-center">
                <label style="height: 34px; line-height: 34px;">-</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtend' style="height: 34px; line-height: 34px;" placeholder="--请选择日期--" />
            </div>
        </div>
        <div class="col-md-5 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <button id="go_search" class="btn btn-primary btn-sm" style="float:left"><i class="fa fa-search "></i>查询</button>
            <button class="btn btn-sm btn-primary" id="AddNewReport" onclick="GoBack()" style="float:right">返回</button>
        </div>
    </div>

    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th style="width: 10px">
                                <input id="allCheck" onclick="AllCheck()" type="checkbox" /></th>
                            <th class="text-center" style="width: 8%;">序号</th>
                            <th class="text-center">个案号</th>
                            <th class="text-center">登录名</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">问题类型</th>
                            <th class="text-center">接案时间</th>
                            <th class="text-center">咨询师</th>
                        </tr>
                    </thead>
                    <tbody id="lbSource">
                    </tbody>
                </table>
            </div>
            <button onclick="CreateReport()" style="margin-left: 5px; margin-right: 5px;" class="btn  btn-oranges" name="CreateReport">
                <i class="glyphicon glyphicon-hand-up"></i>生成报表
            </button>
        </div>
    </div>

    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script>
        var navName = '/FunctionModular/AdvisoryStatistics/AdvisoryStatistics.aspx';

        var titleName = GetQueryString("TitleName");//报表标题
        var tablelist;
        var name;//登录名/姓名
        var qId;//问题类型
        var startTime;
        var endTime;
        var Startindex = 0;
        var Endindex = 10;

        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtstart').val('<%=GetDate(-7)%>');

        $('#dtend').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
       // $('#dtend').val('<%=GetDate(0)%>');

        /*--------获取URL中的参数-------*/
        function GetQueryString(key) {
            // 获取参数
            var url = window.location.search;
            // 正则筛选地址栏
            var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
            // 匹配目标参数
            var result = url.substr(1).match(reg);
            //返回参数值
            return result ? decodeURIComponent(result[2]) : null;
        }

        initSelectInput("operationType=LoadQuesitonType", "Sel_QuestionType", "--问题类型--");

        BindGrid();

        //绑定数据
        function BindGrid() {
            name = $("#Name").val();
            qId = $("#Sel_QuestionType").find("option:selected").val();
            startTime = $("#dtstart").val();
            endTime = $("#dtend").val();

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

                ajax: {
                    method: 'get',
                    url: "/FunctionModular/AdvisoryStatistics/Ajax/AdvisoryStatistics.ashx?operationType=BindPersonal",
                    dataSrc: "data",
                    data: function (d) {
                        if (d.start == 0) {
                            Endindex = d.length;
                            if (Endindex == 10) {
                                Startindex = 0;
                            }
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }

                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&Name=' + name + '&QId=' + qId + '&distriStartTime=' + startTime + '&distriEndTime=' + endTime;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    $('td:eq(0)', row).html(data[0]);
                    $('td:eq(1)', row).html(data[1]);
                    $('td:eq(2)', row).html(data[2]);
                    $('td:eq(3)', row).html(data[3]);
                    $('td:eq(4)', row).html(data[4]);
                    $('td:eq(5)', row).html(data[5]);
                    $('td:eq(6)', row).html(data[6]);
                    $('td:eq(7)', row).html(data[7]);

                    for (var i = 0; i < 8; i++) {
                        $('td:eq(' + i + ')', row).css("text-align", "center");
                    }
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
        //查询
        $(document).on("click", "#go_search", function () {
            name = $("#Name").val();
            qId = $("#Sel_QuestionType").find("option:selected").val();
            startTime = $("#dtstart").val();
            endTime = $("#dtend").val();

            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        //回车进行搜索
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                $('#go_search').click();
            }
        });
        //全选
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
        //返回
        function GoBack() {
            window.location.href = navName;
        }
        //生成报表
        function CreateReport() {
            var ids = '';//保存选中的ID
            var numbers = '';//保存选中的个案号                        

            var checkbox = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            if (checkbox.length <= 0) {
                layer.alert("请选择数据！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked == true) {
                    ids += checkbox[i].getAttribute("data-id") + ",";
                    numbers += checkbox[i].getAttribute("data-number") + ",";
                }
            }
            if (ids == '' && numbers == '') {
                layer.alert("请选择数据！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            $.ajax({
                type: "POST",
                url: "Ajax/AdvisoryStatistics.ashx?operationType=addPerson",
                data: { id: ids, title: titleName },
                success: function (msg) {
                    if (msg == -1) {
                        layer.alert("报表生成失败！", {
                            skin: "layui-layer-lan",
                            closeBtn: 0
                        });
                        return;
                    }
                        else if (msg == -2) {
                            layer.alert("当前选择的档案咨询记录为空，请选择要生成的数据！", {
                                skin: "layui-layer-lan",
                                closeBtn: 0
                            });
                        return;
                    }
                    else {
                        var array = eval(msg);
                        $.ajax({
                            type: "POST",
                            url: "Ajax/AdvisoryStatistics.ashx?operationType=getrole",
                            success: function(role) {
                                if (role == 1) {
                                    layer.alert("报表生成成功！", {
                                        skin: "layui-layer-lan",
                                        closeBtn: 0
                                    }, function () { window.location.href = navName; });
                                    
                                } else
                                    window.location.href = "PersonalStatementInfo.aspx?ID=" + ids
                                        + "&number=" + numbers + "&TitleName=" + titleName + "&code=" + array[0] + "&nowId=" + array[1];
                            }
                        });
                    }
                }
            });
        }
        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, exhibition) {
            $("#" + controlname).empty();
            if (exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/AdvisoryStatistics.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item["QTID"] + "'>" + item["QTName"] + "</option>");

                    });
                    $("#" + controlname).attr("multiple", false);

                    $("#" + controlname).selectpicker('refresh');
                }
            });
        }


    </script>
</asp:Content>
