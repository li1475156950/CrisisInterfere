<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GroupReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.GroupReport.GroupReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <style type="text/css">
        .table.dataTable.no-footer {
            border-bottom: #ffffff;
        }

        .table.dataTable thead th, table.dataTable thead td {
            border-bottom: #ffffff;
        }
    </style>
    <div class="content">
        <div class="row">
            <div class="col-md-12">

                <%--          <h1 class="page-header">维度量表添加<small>量表管理</small>
            </h1>--%>
                <ol class="breadcrumb">
                    <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">心理测验</a></li>
                    <li><a href="#" style="color: #666;">团体报告</a></li>

                </ol>
            </div>
        </div>
        <div class="row" style="padding-bottom: 20px">
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">

                <input id="reportName" class="form-control" placeholder="--报告名称关键字--" />

            </div>

            <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px;">
                <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                    <div class="input-group">
                        <input type="text" id="dtstart" onclick="javascript: $(this).val('')" class="form-control" placeholder="--请选择开始日期--" readonly="readonly" />

                    </div>
                </div>
                <div class="col-md-1 col-sm-2 col-xs-2">
                    <label style="height: 34px; line-height: 34px;">-</label>
                </div>
                <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                    <div class="input-group">
                        <input id="EndDate" type="text" onclick="javascript: $(this).val('')" class="form-control" placeholder="--请选择结束日期--" readonly="readonly" />

                    </div>

                </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
                <button class="btn btn-primary btn-sm" id="go_search" name="QX_SelectSearch" style="margin-right: 10px;"><i class="fa fa-search"></i>查询</button>
                <button class="btn btn-sm pull-right" onclick="AddGroupReport()" style="background-color: orange; color: white" name="QX_AddGroupReport">+新增团体报告</button>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 1%;">
                                <input id="allCheck" type="checkbox" /></th>
                            <th class="text-center" style="width: 8%;">序号</th>
                            <th class="text-center">报告名称</th>
                            <th class="text-center">生成时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>
            <button onclick="BulkDelete()" class="btn btn-reds" name="QX_BulkDelete">
                <i class="fa fa-trash "></i>批量删除</button>
            <%--  <button onclick="BulkDelete()" class="btn btn-greens btn-sm" style="height: 22px; padding-top: 0px;">
                                        <i class="glyphicon glyphicon-export "></i>批量导出</button>--%>
            <!--End Advanced Tables -->
        </div>
    </div>
    </div>
    <link href="../../JS/datatables/media/css/jquery.dataTables.css" rel="stylesheet" />

    <script src="../../JS/layer.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script>
        var navName = '/FunctionModular/GroupReport/GroupReport.aspx';
        var myDate = new Date();
        //$('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtstart').datepicker('setStartDate', '1700-1-1');
        //$('#dtstart').datepicker('setEndDate', '2099-1-1');
        //$('#dtstart').datepicker('setEndDate', myDate);
        function datas() {
            $("#dtstart").datepicker({
                language: "zh-CN",
                format: "yyyy-dd-mm",
                autoclose: true,
                todayHighlight: true,
                language: 'cn',
                format: "yyyy-mm-dd",
                endDate: new Date()
            })
        }
        datas()
        function EndDate() {
            $("#EndDate").datepicker({
                language: "zh-CN",
                format: "yyyy-dd-mm",
                autoclose: true,
                todayHighlight: true,
                language: 'cn',
                format: "yyyy-mm-dd",
                endDate: new Date()
            })
        }
        EndDate()

        //$('#EndDate').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn'});
        //$('#EndDate').datepicker('setStartDate', '1700-1-1');
        //$('#EndDate').datepicker('setEndDate', '2099-1-1');
        //$('#EndDate').datepicker('setEndDate', myDate);
        function AddGroupReport() {
            window.location.href = "GroupReportAdd.aspx";
        }
        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var reportName = '';
        var startDate = '';
        var endDate = '';
        var isLoadDataTable = true; // 是否为第一次初始化数据
        var GroupPeports;
        BindGrid();

        function BindGrid() {
            amountID = $("#sel_ModularName").find("option:selected").val();
            if (GroupPeports != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            GroupPeports = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                clickToSelect: true,
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: true,
                        aTargets: [0]
                    }
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/GroupReport.ashx?operationType=Bind",
                    dataSrc: "data",
                    data: function (d) {

                        var pageIndex = fnGetRequiredPageIndex();
                        // 当初始化的时候
                        if (isLoadDataTable && $("#tableGrid").DataTable().page() != pageIndex) {
                            d.start = pageIndex * d.length;
                        }

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        Endindex = 0;
                        Startindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'startPageIndex=' + Startindex + '&endPageIndex=' + Endindex + '&reportName=' + reportName + '&startDate=' + startDate + '&endDate=' + endDate;
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    operation = " <button  class=\"btn btn-link\" data-name='lookUp' name='QX_SelectlookUp'>查看</button>&nbsp;&nbsp; <button  class=\"btn btn-link\" data-name='remove' name='QX_remove'>删除</button>";
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(4)', row).html(operation);
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
                    // 获取请求的页码
                    var pageIndex = fnGetRequiredPageIndex();
                    if ($("#tableGrid").DataTable().page() != pageIndex) {
                        $('#tableGrid').dataTable().fnPageChange(pageIndex);
                    }
                    isLoadDataTable = false;
                },
                drawCallback: function (s) {
                    $("#allCheck").removeAttr("checked");
                    // $("#UserList_info").html("<input style=\"margin-left:27px;\" type=\"checkbox\" name=\"checkboxname\" />全选");
                }

            });
        }

        // 获取地址栏参数
        function fnGetUrlParam(paramName) {
            var result = "";

            var usr = window.location.href;
            var ul = usr.toString().split('?');
            if (ul.length == 2) {
                var params = ul[1].split('&');
                for (var i = 0; i < params.length; i++) {
                    var param = params[i].split('=');
                    if (param.length == 2) {
                        if (param[0] + "" == paramName) {
                            result = param[1];
                            break;
                        }
                    }
                }
            }

            return result;
        }
        // 获取请求页码
        function fnGetRequiredPageIndex() {
            var pageIndex = fnGetUrlParam("p");
            var result = /^[1-9]\d*$/.test(pageIndex) ? Number(pageIndex) - 1 : 0;

            return result;
        }

        $(document).on("click", "#go_search", function () {

            reportName = $("#reportName").val();
            startDate = $("#dtstart").val();
            endDate = $("#EndDate").val();
            //$.ajax({
            //    url: "Ajax/MemberManagement.ashx?type=1",
            //    type: 'GET',
            //    dataType: 'json',
            //    data: { "LoginName": LoginName, "RoleName": RoleName, "departmentname": departmentname, "sex": sex, "StarPageIndex": "1", "EndPageIndex": "10" },
            //    success: function (msg) {
            //        alert(msg);
            //    }
            //});
            if (tableGrid != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        $(document).on("click", "[data-name=remove]", function () {
            var grid = $(this).parent().parent().find("td:eq(0)").find("input").attr("data-grid")
            var ReportName = $($(this).parent().parent().find("td:eq(2)")[0]).text()

            layer.confirm("确定要将此项团体报告放入回收站中吗?", {
                btn: ["确定", "取消"]
            }, function () {
                DeleteGroupReport(grid, ReportName);
            }
            );
        });
        $(document).on("click", "[data-name=lookUp]", function () {

            var grid = $(this).parent().parent().find("td:eq(0)").find("input").attr("data-grid");
            var amountCode = $(this).parent().parent().find("td:eq(0)").find("input").attr("data-amountCode");
            var jumpAspx = "";
            switch (amountCode) {
                case "LB_14809227671290":
                    jumpAspx = "MentalAgeTest";
                    break;
                case "LB_14812009694200":
                    jumpAspx = "DefenseWay";
                    break;
                case "LB_14811639146570":
                    jumpAspx = "CopeWay";
                    break;
                case "LB_14809330635970":
                    jumpAspx = "PreschoolAge";
                    break;
                case "LB_14811181207060":
                    jumpAspx = "AutisticDisorder";
                    break;
                case "LB_14811899593960":
                    jumpAspx = "RutterChildAction";
                    break;
                case "LB_14824009961900":
                    jumpAspx = "LifeEvent";
                    break;
                case "LB_14963915437340":
                    jumpAspx = "ClinicalImpression";
                    break;
                default:
                    jumpAspx = "GroupReportPresentation";
                    break;
            }
            // 当前页码
            var tablePageIndex = $("#tableGrid").DataTable().page() + 1;

            // 当初始化的时候
            var pageIndex = fnGetRequiredPageIndex();
            if (isLoadDataTable && $("#tableGrid").DataTable().page() != pageIndex) {
                tablePageIndex = pageIndex + 1;
            }

            window.location.href = jumpAspx + ".aspx?grID=" + grid + "&p=" + tablePageIndex;
        });
        $(document).on("click", ".checkGroupReport", function () {

            var isAllCheck = true;
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }

            $("#allCheck")[0].checked = isAllCheck;
        });
        $(document).on("click", "#allCheck", function () {
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                checkArray[i].checked = $("#allCheck")[0].checked;
            }
        });
        function BulkDelete() {

            var tempCheckArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");

            var grid = '';
            var giname = '';
            //for (var i = 0; i < tempCheckArray.length; i++) {
            //    alert()
            //    alert($(name[i]).attr("data-ReportName"));
            //}

            var isDelete = false;
            for (var i = 0; i < tempCheckArray.length; i++) {
                if ($(tempCheckArray[i])[0].checked) {
                    isDelete = true;
                    giname += $(tempCheckArray[i]).attr("data-ReportName") + ",";
                }
            }

            if (!isDelete) {
                layer.alert("请选择要删除的团体报告", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            }
            for (var i = 0; i < tempCheckArray.length; i++) {
                if ($(tempCheckArray[i])[0].checked) {

                    grid += $(tempCheckArray[i]).attr("data-grid") + ",";
                }
            }
            layer.confirm("确认要将所选团体报告放入回收站中吗?", {
                btn: ["确定", "取消"]
            }, function () {

                DeleteGroupReport(grid, giname);
            })

        }
        function DeleteGroupReport(grid, ReportName) {
            $.ajax({
                url: "Ajax/GroupReport.ashx?OperationType=DeleteGroupReport",
                type: "GET",
                data: { grid: grid, ReportName: ReportName },
                dataType: "text",
                success: function (data) {
                    if (data == "True") {
                        layer.msg("删除成功", { icon: 1, time: 2000 }, function () {
                            $("#tableGrid").dataTable().fnDraw(false);
                            $('#allCheck').attr("checked", false);  //取消选中
                            layer.closeAll('dialog');
                        });


                    }
                    else {
                        layer.msg("删除失败", { icon: 1, time: 2000 });
                    }
                }
            })
        }

        //查询的时候sex
        $(document).keyup(function (e) {
            if (e.keyCode === 13) {

                $('#go_search').trigger('click');
            }
        });

    </script>
</asp:Content>
