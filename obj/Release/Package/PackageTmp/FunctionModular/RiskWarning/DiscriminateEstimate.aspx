<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="DiscriminateEstimate.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.DiscriminateEstimate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
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
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
            <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
            <link href="/JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
            <link href="../../assets/skin/layer.css" rel="stylesheet" />
            <style>
                .dropdown-menu li {
                    text-align: left;
                }
            </style>
            <div class="content">
                <!-- main -->
                <div class="row" style="margin-left: 0px; margin-bottom: 20px;">
                    <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;width:11.4%">
                        <input id="loginName" class="form-control" placeholder="登录名/姓名" />
                    </div>
                    <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;width:10%">
                        <select id="sex" class="form-control c999">
                            <option value="0">性别</option>
                            <option value="1">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                    <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px; width:12%">
                        <select id="counselor" class="form-control c999">
                            <option value="0" selected="selected">咨询师
                            </option>
                            <option v-for="item in counselor" v-bind:value="item.Value">{{item.Text}}</option>
                        </select>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">

                        <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                            <input size="16" type="text" id="datetimeStart" readonly="true" class="form-control form_datetime" placeholder="开始日期" />
                        </div>
                        <span class="fl pl10 pr10 pt5">-
                        </span>
                        <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                            <input size="16" type="text" id="datetimeEnd" readonly="true" class="form-control form_datetime lala" placeholder="结束日期" />
                        </div>

                    </div>
                    <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -3%;width:11.7%">
                        <select id="warningLevel" class="form-control c999">
                            <option value="0">危机等级</option>
                            <option value="1">暂无</option>
                            <option value="2">较低</option>
                            <option value="3">中等</option>
                            <option value="4">较高</option>
                            <option value="5">极高</option>
                        </select>
                    </div>
                    <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;width:11.7%">
                        <select id="questionType" class="form-control c999">
                            <option value="0" selected="selected">问题类型</option>
                            <option v-for="item in questionType" :value="item.Value">{{item.Text}}
                                </option>
                        </select>
                    </div>
                    <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;width:11.7%">
                        <select id="disposalSuggestion" class="form-control c999">
                            <option value="0">处理建议</option>
                            <option value="1">1.立即就医</option>
                            <option value="2">2.24小时监护</option>
                            <option value="3">3.通知相关管理员</option>
                            <option value="4">4.进行心理咨询</option>
                            <option value="5">5.暂时无需干预</option>
                        </select>
                    </div>
                    <%--<div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
               <div class="l-text l-text-combobox" style="width: 100%;">
                    <input type="text" id="departmentName" placeholder="部门名称" readonly="" class="l-text-field" />
                </div>
            </div>--%>
                    <div class="pull-right" style="margin-top: 5px; margin-right: 15px">
                        <button id="addEstimate" class="btn btn-primary btn-sm" data-toggle="modal" onclick="addPG()">+ 新建评估</button>
                    </div>
                    <div class="pull-right" style="margin-top: 5px; padding-right:20px">
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
                                <table class="table table-striped table-bordered table-hover dataTable no-footer" style="word-wrap:break-word;word-break:break-all;" id="tableGrid" role="grid" aria-describedby="tableGrid_info">
                                    <thead>
                                        <tr role="row">
                                            <th class="text-center sorting_disabled" style="display: none"></th>
                                            <th style="width: 13px;" class="sorting_disabled" rowspan="1" colspan="1">
                                                <input id="allCheck" onclick="AllCheck(this)" type="checkbox" /></th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 45px;">序号</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;">登录名</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;">姓名</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 65px;">性别</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 65px;">年龄</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;">咨询师</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">危机等级</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">问题类型</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">处理建议</th>
                                            <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">评估日期</th>
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
                                <p class="f16 c666 pl30 pr20 mt15 pb50 tc">请选择需要的删除的项目。</p>
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
                                <p class="f16 c666 pl30 pr20 mt15 pb50 tc">确定将所选项目放入回收站吗？</p>
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
            <!-- 新建评估 -->
            <div class="modal fade x_xjzh in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 50%; width: 100%">
                        <h4 class="modal-title text-center xia_title">请选择需要评估的成员
                        </h4>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group  text-right" style="margin-top: 20px">
                                    <label class="col-sm-3  col-xs-4 control-label mt5 nopr ml50">登录名：&nbsp;</label>
                                    <div class="col-sm-6 col-xs-6 nopl">
                                        <select class="selectpicker form-control" data-done-button="true" data-live-search="true" id="needEstimateLoginName" onchange="checkChange(this)"></select>
                                    </div>
                                    <span style="float: left; color: #a94442; display: none;" name="tip">请选择需要评估的成员!</span>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 80px; margin-bottom: 10px">
                                <div class="col-sm-6  col-xs-6 text-right">
                                    <button type="button" class="btn btn-sm x_btn f14 addDiscernEstimateReport" data-toggle="modal" data-target=".x_plzy_sure">确定</button>
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
        <!-- JS Scripts-->
        <!-- 左侧下拉框 Js -->
        <!-- 左侧下拉框 Js 结束 -->
        <!-- Bootstrap Js -->
        <script src="/js/bootstrap-datepicker.js"></script>
        <script src="/js/bootstrap-datepicker.zh-CN.js"></script>
         <script src="../../JS/bootstrap-select.min.js"></script>
        <script src="../../JS/vue.js"></script>
        <script src="/JS/datatables/media/js/jquery.dataTables.min.js"></script>
        <script src="../../JS/ExtendJS.js"></script>
        <script src="../../JS/layer.js"></script>
        <script type="text/javascript">
            var navName = '/FunctionModular/RiskWarning/DiscriminateEstimate.aspx';
            $("#page-wrapper").addClass("x_wjgy");
            $("#page-wrapper").addClass("x_dagl");
            var deVue;
            var searchModel = {};
            var tableGrid;
            
            window.SetCheckAll();
            //日期控件初始化
            //日期控件
            $(function () {
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
                    //$("#datetimeEnd").datepicker("setStartDate", $("#datetimeStart".val()))
                });
                initSelectInput("GetUser", "needEstimateLoginName")
                function initSelectInput(types, controlname, Exhibition) {
                    $("#" + controlname).empty();
                    $.ajax({
                        type: "post",
                        url: "Ajax/DiscriminateEstimate.ashx",
                        data: { operationType: types },//要执行查询的数据参数
                        async: false,
                        success: function (msg) {
                            $("#" + controlname).append("<option value='0'>--请选择成员--</option>");
                            $.each(eval(msg), function (index, item) {
                                $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                            });
                            $("#" + controlname).attr("multiple", false);
                            $("#" + controlname).selectpicker('refresh');
                        }
                    });
                }
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
            })

            function addPG() {
                document.getElementById("needEstimateLoginName").selectedIndex = 0;
                $("#needEstimateLoginName").selectpicker('refresh');
                $('span[name=tip]').hide();
                $('.x_xjzh').modal('show');
            }
            function GetCounselor() {
                var counselor;
                $.ajax({
                    url: "Ajax/DiscriminateEstimate.ashx",
                    type: "post",
                    data: { operationType: "GetCounselor" },
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        counselor = data;
                    }
                })
                return counselor;
            }
            function GetQuestionType() {
                var questionType;
                $.ajax({
                    url: "Ajax/DiscriminateEstimate.ashx",
                    type: "post",
                    data: { operationType: "GetQuestionType" },
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        questionType = data;
                    }
                })
                return questionType;
            }
            deVue = new Vue({
                el: ".content",
                data: {
                    counselor: GetCounselor(),
                    questionType: GetQuestionType()
                }
            })
            function checkChange(obj) {
                var nowIndex = $('#needEstimateLoginName').find("option:selected").val();
                if (nowIndex == '0') {
                    $('span[name=tip]').show();
                } else
                    $('span[name=tip]').hide();
            }
            InitTable();
            function InitTable() {
                searchModel.LoginName = $("#loginName").val();
                searchModel.Sex = $("#sex").find("option:selected").val() == '0' ? '' : $("#sex").find("option:selected").text();
                searchModel.CounselorID = $("#counselor").find("option:selected").val();
                searchModel.WarningLevel = $("#warningLevel").find("option:selected").val();
                searchModel.StartDate = $("#datetimeStart").val();
                searchModel.EndDate = $("#datetimeEnd").val();
                searchModel.QuestionTypeID = $("#questionType").find("option:selected").val();
                searchModel.DisposalSuggestionID = $("#disposalSuggestion").find("option:selected").val();
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
                        url: "Ajax/DiscriminateEstimate.ashx",
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
                        $('td:eq(1)', row).html(" <input class='childCheck'  type='checkbox' name='CheckboxID' value=' " + data[0] + "'/>");
                        $('td:eq(0)', row).hide();
                        var operation = "";
                        operation =
                       " <button  class='btn btn-link showDiscernEstimateReportInfo'data-uID = '" + data[17] + "' data-dEID='" + data[0] +
                       "' data-questionType='" + data[9] + "' data-counselorName='" + data[7] + "' data-dsID='" + data[10] +
                       "' data-department='" + data[13] + "' data-cellPhone='" + data[14] + "' data-email='" + data[15] + "' data-discernEstimateContent='"
                       + data[16] + "' data-loginName='" + data[3] + "' data-userName='" + data[4] + "' data-age='" + data[6] + "' data-sex='" + data[5] +
                       "'  data-warningState='" + data[8] + "' data-testDate = '" + data[11] + "' >查看</button>"
                        + " <button class='btn btn-link deleteDiscriminate'  data-DEID='" + data[0] + "'>删除</button>";
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
                        $('td:eq(12)', row).html(operation);
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
            //全选
            function AllCheck(obj) {
                if (obj.checked) {
                    $("input[type=checkbox][name=CheckboxID]").prop("checked", true);

                } else {
                    $("input[type=checkbox][name=CheckboxID]").prop("checked", false);
                }
            };
            $(document).on("click", "[name=CheckboxID]", function () {
                var isAllCheck = true;
                var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
                for (var i = 0; i < checkArray.length; i++) {
                    if (!checkArray[i].checked) {
                        isAllCheck = false;
                    }
                }
                $("#allCheck")[0].checked = isAllCheck;
            })
            $(document).on("click", "#go_search", function () {
                searchModel.LoginName = $("#loginName").val();
                searchModel.Sex = $("#sex").find("option:selected").attr('value') == "0" ? "" : $("#sex").find("option:selected").text();
                searchModel.CounselorID = $("#counselor").find("option:selected").val();
                searchModel.WarningLevel = $("#warningLevel").find("option:selected").val();
                searchModel.StartDate = $("#datetimeStart").val();
                searchModel.EndDate = $("#datetimeEnd").val();
                searchModel.QuestionTypeID = $("#questionType").find("option:selected").val();
                searchModel.DisposalSuggestionID = $("#disposalSuggestion").find("option:selected").val();
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
            $(document).on("click", ".showDiscernEstimateReportInfo", function () {
                var suggestionArray = ["1.立即就医","2.24小时监护","3.通知相关管理员","4.进行心理咨询","5.暂时无需干预"];
                sessionStorage.setItem('source', undefined);
                var suggestionStr='';
                var dsIDArray = $(this).attr("data-dsid").split(',');
                for (var i = 0; i < dsIDArray.length; i++) {
                    if (i == dsIDArray.length - 1) {
                        suggestionStr += suggestionArray[parseInt(dsIDArray[i]-1)];
                    } else {
                        suggestionStr += suggestionArray[parseInt(dsIDArray[i]-1)] + ',';
                    }
                }
                var reportInfo = {
                    DEID: $(this).attr("data-dEID"),
                    QuestionType: $(this).attr("data-questionType"),
                    TestDate: $(this).attr("data-testDate"),
                    DiscernEstimateReport: $(this).attr("data-discernEstimateContent"),
                    DisposalSuggestion: suggestionStr,
                    DiscernDate: $(this).attr("data-testDate"),
                    CounselorName: $(this).attr("data-counselorName"),
                    WarningState: $(this).attr("data-warningState")
                };
                var personalInfo = {
                    UserID: $(this).attr("data-uID"),
                    LoginName: $(this).attr("data-loginName"),
                    UserName: $(this).attr("data-userName"),
                    Age: $(this).attr("data-age"),
                    Sex: $(this).attr("data-sex"),
                    Department: $(this).attr("data-department"),
                    CellPhone: $(this).attr("data-cellPhone"),
                    Email: $(this).attr("data-email"),
                    WarningState: $(this).attr("data-warningState"),
                };
                sessionStorage.setItem("reportInfo", JSON.stringify(reportInfo));
                sessionStorage.setItem("personalInfo", JSON.stringify(personalInfo));
                window.location.href = "DiscriminateEstimateReport.aspx";
            })
            $(document).on("click", ".addDiscernEstimateReport", function () {
                var nowIndex = $('#needEstimateLoginName').find("option:selected").val();
                if (nowIndex == '0') {
                    $('span[name=tip]').show();
                    return;
                }
                var selectedLoginName = $("#needEstimateLoginName").find("option:selected").val();
                sessionStorage.setItem('source', 'add');
                sessionStorage.setItem("personalInfo", undefined);
                sessionStorage.setItem("reportInfo", undefined);
                sessionStorage.setItem("userID", $("#needEstimateLoginName").find("option:selected").val());
                window.location.href = "DiscriminateEstimateReport.aspx";
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
                            RBTitle: "删除鉴别评估",
                            RBModularID: 166, //对应模块权限ID
                            RBTableName: "DiscernEstimate", //删除的表名
                            RBFieldName: "DEID", //删除相对应字段的id
                            RBFieldValue: $(checkedArray[i]).attr("value"),//删除的具体id
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
            $(document).on("click", ".deleteDiscriminate", function () {
                var value = $(this).attr("data-DEID");
                layer.confirm("确定将此项记录放到回收站吗？", {
                    btn: ["确定", "取消"]
                }, function () {
                    var recycleBinModelList = [];
                    var recycleBinModel = {
                        RBTitle: "删除鉴别评估",
                        RBModularID: 166, //对应模块权限ID
                        RBTableName: "DiscernEstimate", //删除的表名
                        RBFieldName: "DEID", //删除相对应字段的id
                        RBFieldValue: value,//删除的具体id
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
            $(document).on("click", ".addDynamicEstimate", function () {
                window.location.href = "DynamicEstimate.aspx";
            })
            $(document).on("click", ".bulkExportExcel", function () {
                var url = "Ajax/DiscriminateEstimate.ashx?operationType=BulkExportExcel";
                window.location.href = url;
            })
        </script>
       
</asp:Content>

