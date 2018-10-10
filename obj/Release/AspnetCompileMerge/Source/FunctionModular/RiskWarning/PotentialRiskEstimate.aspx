<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PotentialRiskEstimate.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PotentialRiskEstimate.PotentialRiskEstimate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link rel="shortcut icon" id="icons" href="" />
    <!-- Bootstrap Styles-->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="/css/custom-styles.css" rel="stylesheet" />
    <link href="/css/custom-styles_1.css" rel="stylesheet" />
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/css/base.css" rel="stylesheet" />
    <link href="/css/rysz.css" rel="stylesheet" />
    <link href="/css/wjyj.css" rel="stylesheet" />
    <link href="/css/font-awesome.min_1.css" rel="stylesheet" />
    <link href="/CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="/CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <link href="/JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <!-- 右侧  -->
    <div class="content">
        <!-- main -->
        <div class="row" style="margin-left: 0px; margin-bottom: 20px;">
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                <input id="loginName" class="form-control" placeholder="登录名/姓名" />
            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                <select id="sex" class="form-control c999">
                    <option value="0">选择性别</option>
                    <option value="1">男</option>
                    <option value="2">女</option>
                </select>
            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                <div class="l-text l-text-combobox" style="width: 100%;">
                    <input type="text" id="departmentName" placeholder="部门名称" readonly="" class="l-text-field form-control" />
                </div>
            </div>
            <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">

                <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                    <input size="16" type="text" id="datetimeStart" readonly class="form-control form_datetime" placeholder="开始日期" />
                </div>
                <div class="col-md-1 col-sm-2 col-xs-2" style="padding-left: 8px">
                    <label style="height: 34px; line-height: 34px;">-</label>
                </div>
                <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                    <input size="16" type="text" id="datetimeEnd" readonly class="form-control form_datetime lala" placeholder="结束日期" />
                </div>

            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -3%;">
                <select id="warningLevel" class="form-control">
                    <option value="0">预警级别</option>
                    <option value="1">暂无</option>
                    <option value="2">较低</option>
                    <option value="3">中等</option>
                    <option value="4">较高</option>
                    <option value="5">极高</option>
                </select>
            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                <select id="disposalState" class="form-control">
                    <option value="-1">处理情况</option>
                    <option value="0">未处理</option>
                    <option value="1">已处理</option>
                </select>
            </div>
            <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">

                <button id="go_search" class="btn btn-primary btn-sm"><i class="fa fa-search "></i>查询</button>
            </div>
        </div>

        <!-- 列表开始 -->
        <div class="row" style="margin-left: 0px; margin-bottom: 20px;">
            <div class="col-md-12 nopl">
                <div class="table-responsive">
                    <div id="tableGrid_wrapper" class="dataTables_wrapper no-footer">
                        <div id="tableGrid_processing" class="dataTables_processing" style="display: none;">
                            处理中...
                        </div>
                        <table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableGrid" role="grid" aria-describedby="tableGrid_info" style="word-break:break-all; word-wrap:break-all;">
                            <thead>
                                <tr role="row">
                                    <th style="display: none"></th>
                                    <th style="width: 13px;" class="sorting_disabled" rowspan="1" colspan="1">
                                        <input id="allCheck" onclick="AllCheck()" type="checkbox" /></th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 45px;">序号</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;">登录名</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;">姓名</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 65px;">性别</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 65px;">年龄</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 150px;">部门</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">预警级别</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">测试日期</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 80px;">处理情况</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 132px;">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <button class="btn btn-or w_radius multiDelete"><i class="icon iconfont">&#xeb8d;</i> 批量删除</button>
                <button class="btn btn-or w_radius ml10 bulkExportExcel"><i class="icon iconfont">&#xebc3;</i> 批量导出名单</button>
                <button class="btn btn-or w_radius ml10" data-mark="distributeIdioctoniaAmount"><i class="icon iconfont">&#xebec;</i> 分配自杀倾向量表</button>
            </div>
        </div>
        <!-- main结束 -->
    </div>


    <!-- 删除记录提示框 -->
    <div class="modal fade x_del in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">提示
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <p class="f16 c666 pl30 pr20 mt15 pb50">您确定将该成员放入回收站吗？删除后该成员对应的数据也将一起删除。</p>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">确定</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 删除记录提示框 -->
    <div class="modal fade x_dels in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">提示
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <p class="f16 c666 pl30 pr20 mt15 pb50">您确定将该成员放入回收站吗？删除后该成员对应的数据也将一起删除。</p>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">确定</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 左侧下拉框 Js -->
    <!-- 左侧下拉框 Js 结束 -->
    <script src="/js/bootstrap-datepicker.js"></script>
    <script src="/js/bootstrap-datepicker.zh-CN.js"></script>
    <script src="/JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="/JS/ligerComboBox/ligerTree.js"></script>
    <script src="/JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/ExtendJS.js"></script>
    <script type="text/javascript">
        var navName = '/FunctionModular/RiskWarning/PotentialRiskEstimate.aspx';
        $("#page-wrapper").addClass("x_wjgy");
        $("#page-wrapper").addClass("x_dagl");
        window.SetCheckAll();
        var tableGrid;
        var uIDArray = [];
        var searchModel = {};
        searchModel.LoginName = "";
        searchModel.Sex = "";
        searchModel.DepartmentID = 0;
        searchModel.StartTime = "";
        searchModel.EndTime = "";
        searchModel.WarningLevel = 0;
        searchModel.DisposalState = 0;
        searchModel.StartIndex = 0;
        searchModel.EndIndex = 10;
        $("#datetimeStart").datepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            clearBtn: true,
            endDate: new Date()
        }).on("click", function () {
            //$("#datetimeStart").datepicker("setEndDate", $("#datetimeEnd").val())
        });
        $("#datetimeEnd").datepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            clearBtn: true,
            endDate: new Date()
        }).on("click", function () {
            //$("#datetimeEnd").datepicker("setStartDate", $("#datetimeStart").val())
        });
        OnLoadTreeCom();
        function OnLoadTreeCom() {
            var tmep = false;
            $("#departmentName").ligerComboBox({
                width: "100%",
                selectBoxWidth: "87%",
                selectBoxHeight: 140,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    onSuccess: function () {
                        setTimeout(function () {
                            var manager = $(".l-tree").ligerGetTreeManager();
                        }, 100);
                    },
                    onBeforeSelect: function (node) {
                        searchModel.DepartmentID = node.data['id'];
                    },
                    url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random() + '&mark=searchCondition',
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false,
                    onClick: function (node) {//单击事件  
                        if ($("#departmentName").val() == "")
                            searchModel.DepartmentID = 0;
                    }
                }
            });
        }
        InitTable();

        function InitTable() {


            searchModel.LoginName = $("#loginName").val();
            searchModel.Sex = $("#sex").find("option:selected").val() == '0' ? '' : $("#sex").find("option:selected").text();
            searchModel.WarningLevel = $("#warningLevel").find("option:selected").val();
            searchModel.DisposalState = $("#disposalState").find("option:selected").val();
            searchModel.StartTime = $("#datetimeStart").val();
            searchModel.EndTime = $("#datetimeEnd").val();
            if ($("#datetimeEnd").val() != "") {
                searchModel.EndTime = $("#datetimeEnd").val() + " 23:59";
            }
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tableGrid = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: true,
                        aTargets: [0]
                    },
                ],
                ajax: {
                    method: 'post',
                    url: "Ajax/PotentialRiskEstimate.ashx",
                    dataSrc: "data",
                    async: true,
                    data: function (d) {
                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        searchModel.StartIndex = 0;
                        searchModel.EndIndex = 0;
                        if (d.start == 0) {
                            searchModel.EndIndex = d.length;
                        } else {
                            searchModel.StartIndex = d.start + 1;
                            searchModel.EndIndex = d.start + d.length;
                            $("#selectAll").removeAttr("checked", "checked");
                        }
                        return 'operationType=InitialTable&searchModel=' + JSON.stringify(searchModel);
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    $('td:eq(1)', row).html(" <input class='childCheck' data-belongToCode='" + data[12] + "'  type=\"checkbox\" name='CheckboxID' value=\"" + data[0] + "\" />");
                    $('td:eq(0)', row).hide();
                    var operation = "";
                    operation =
                   " <button  class='btn btn-link showPersonalInfo' data-testType = '" + data[17] + "' data-disposalState = '" + data[10] + "' data-uid='" + data[0] + "' data-loginName='" + data[3] + "' data-userName='" + data[4] + "' data-age='" + data[6] + "' data-sex='" + data[5] + "' data-department='" + data[7] + "' data-cellPhone='" + data[16] + "'  data-email='" + data[15] + "' data-warningState='" + data[8] + "' data-amountType='" + data[14] + "' data-testDate = '" + data[9] + "' data-belongToCode='" + data[12] + "'>查看</button>"
                    + " <button class='btn btn-link deletePotentialRisk' data-id='57'  data-uid=" + data[0] + " data-belongToCode=" + data[12] + ">删除</button>";
                    if (data[8] == "暂无") {
                        $('td:eq(8)', row).html('<span class="blue">暂无</span>');
                    }
                    if (data[8] == "较低") {
                        $('td:eq(8)', row).html('<span class="green">较低</span>');
                    }
                    if (data[8] == "中等") {
                        $('td:eq(8)', row).html('<span class="huangse">中等</span>');
                    }
                    if (data[8] == "较高") {
                        $('td:eq(8)', row).html('<span class="chengse">较高</span>');
                    }
                    if (data[8] == "极高") {
                        $('td:eq(8)', row).html('<span class="red">极高</span>');
                    }
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(5)', row).css("text-align", "center");
                    $('td:eq(6)', row).css("text-align", "center");
                    $('td:eq(7)', row).css("text-align", "center");
                    $('td:eq(8)', row).css("text-align", "center");
                    $('td:eq(9)', row).css("text-align", "center");
                    $('td:eq(10)', row).css("text-align", "center");
                    $('td:eq(11)', row).css("text-align", "center");
                    $('td:eq(11)', row).html(operation);
                    searchModel.AmountCode = data[13];
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
                }
            });
        }
        $(document).on("click", "#go_search", function () {
            searchModel.LoginName = $("#loginName").val();
            searchModel.Sex = $("#sex").find("option:selected").val() == '0' ? '' : $("#sex").find("option:selected").text();
            searchModel.WarningLevel = $("#warningLevel").find("option:selected").val();
            searchModel.DisposalState = $("#disposalState").find("option:selected").val();
            searchModel.StartTime = $("#datetimeStart").val();
            searchModel.EndTime = $("#datetimeEnd").val();
            if ($("#datetimeEnd").val() != "") {
                searchModel.EndTime = $("#datetimeEnd").val() + " 23:59";
            }
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        })

        //回车进行搜索
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                $('#go_search').click();
            }
        });
        $(document).on("click", ".childCheck", function () {
            if ($(this)[0].checked) {
                uIDArray.push($(this)[0].value);
            }
            if (!$(this)[0].checked) {
                uIDArray.pop($(this)[0].value);
            }

        })
        $(document).on("click", "[data-mark='distributeIdioctoniaAmount']", function () {
            var tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            uIDArray = [];
            //判断是否有勾选的信息，否则弹框提示
            var isRemind = false;
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked&&!(uIDArray.contains(tempDistriArray[i].getAttribute('value'))))
                    uIDArray.push(tempDistriArray[i].getAttribute('value'));
            }
            if (uIDArray.length == 0) {
                layer.alert("请选择用户进行自杀量表分配");
                return;
            }
            $.ajax({
                url: "Ajax/PotentialRiskEstimate.ashx?operationType=DistributeIdioctoniaAmount",
                type: "post",
                async: false,
                data: { uIDArray: JSON.stringify(uIDArray), AmountCode: "LB_15131477237610" },
                dataType: "json",
                success: function (data) {
                    if (data.State) {
                        layer.msg("分配成功", { time: 2000, icon: 6 })
                        $('#allCheck')[0].checked = false;
                        if (tableGrid != undefined) {
                            $("#tableGrid").DataTable().draw();
                            return;
                        }
                    } else {
                        layer.msg(data.Data, { time: 2000, icon: 5 });
                    }
                }
            })
        })
        $(document).on("click", ".showPersonalInfo", function () {
            var belongToCode = $(this).attr("data-belongToCode");
            var reportInfo = {
                LoginName: $(this).attr("data-loginName"),
                UserName: $(this).attr("data-userName"),
                Age: $(this).attr("data-age"),
                Sex: $(this).attr("data-sex"),
                Department: $(this).attr("data-department"),
                CellPhone: $(this).attr("data-cellPhone"),
                Email: $(this).attr("data-email"),
                WarningState: $(this).attr("data-warningState"),
                TestType: $(this).attr("data-testType"),
                TestDate: $(this).attr("data-testDate"),
                DisposalState: $(this).attr("data-disposalState")
            };
            sessionStorage.setItem("BelongToCode", belongToCode)
            sessionStorage.setItem("ReportInfo", JSON.stringify(reportInfo));
            sessionStorage.removeItem("PageMark")
            window.location.href = "PotentialRiskEstimateReport.aspx";
        })
        $(document).on("click", ".multiDelete", function () {
            var checkedArray = window.GetCheckedCheckBox();
            if (checkedArray.length == 0) {
                layer.alert('请选择需要的删除的项目');
                return;
            }
            layer.confirm("确定将所选记录放入到回收站中?", {
                btn: ["确定", "取消"]
            }, function () {
                var recycleBinModelList = [];
                for (var i = 0; i < checkedArray.length; i++) {
                    var recycleBinModel = {
                        RBTitle: "删除潜在风险评估",
                        RBModularID: 167, //对应模块权限ID
                        RBTableName: "PotentialRiskResult", //删除的表名
                        RBFieldName: "BelongToCode", //删除相对应字段的id
                        RBFieldValue: $(checkedArray[i]).attr("data-belongToCode"),//删除的具体id
                        RBDeleteFieldName: "IsDelete",
                    };
                    recycleBinModelList.push(recycleBinModel);
                }
                var parameter = {
                    recycleBinModelList: recycleBinModelList,
                    callBack: function (data) {
                        if (data.State) {
                            layer.msg("删除成功!", { time: 2000, icon: 6 }, function () {
                                $("#tableGrid").DataTable().draw(false);
                            });
                        } else {
                            layer.msg("删除失败!", { time: 2000, icon: 6 });
                        }
                    }
                };
                window.PutDataToRecycleBin(parameter);
            }, function () {
                layer.closeAll();
            })
        })
        $(document).on("click", ".deletePotentialRisk", function () {
            var belongToCode = $(this).attr("data-belongToCode");
            layer.confirm("确定将此项记录放到回收站吗？", {
                btn: ["确定", "取消"]
            }, function () {
                var recycleBinModelList = [];
                var recycleBinModel = {
                    RBTitle: "删除潜在风险评估",
                    RBModularID: 167, //对应模块权限ID
                    RBTableName: "PotentialRiskResult", //删除的表名
                    RBFieldName: "BelongToCode", //删除相对应字段的id
                    RBFieldValue: belongToCode,//删除的具体id
                    RBDeleteFieldName: "IsDelete",
                };
                recycleBinModelList.push(recycleBinModel);

                var parameter = {
                    recycleBinModelList: recycleBinModelList,
                    callBack: function (data) {
                        if (data.State) {
                            layer.msg("删除成功!", { time: 2000, icon: 6 }, function () {
                                $("#tableGrid").DataTable().draw(false);
                            });
                        } else {
                            layer.msg("删除失败!", { time: 2000, icon: 6 });
                        }
                    }
                };
                window.PutDataToRecycleBin(parameter);
            }, function () {
                layer.closeAll();
            }
                )
        })
        $(document).on("click", ".bulkExportExcel", function () {
            var url = "Ajax/PotentialRiskEstimate.ashx?operationType=BulkExportExcel";
            window.location.href = url;
        })
    </script>
</asp:Content>

