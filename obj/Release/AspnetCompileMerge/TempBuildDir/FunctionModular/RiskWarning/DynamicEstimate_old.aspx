<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DynamicEstimate_old.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.DynamicEstimate" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>京师博仁危机干预-动态评估</title>
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
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />

</head>

<body>
    <div id="wrapper">
        <!-- 头部导航 -->
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div>
                <a class="navbar-brand" href="/Index.aspx" style="width: auto;">
                    <img class="pull-left" src="./statics/images/w_logo.png" id="newbox" />
                    <p class="white fb f24 pull-left">京师博仁心理危机干预系统</p>
                </a>
            </div>
            <ul class="nav navbar-top-links navbar-right pr30">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <img src="./statics/images/w_email.png">
                    </a>
                    <ul class="dropdown-menu dropdown-messages" id="MsgID">
                        <li id="lis1">
                            <a href="../../FunctionModular/Letter/LetterList.aspx">
                                <div>
                                    <span class="pull-right text-muted">
                                        <em></em>
                                    </span>
                                </div>
                                <div>暂无消息</div>
                            </a>
                        </li>
                        <li class="divider" id="divider1" style="display: none"></li>
                        <li id="lis2" style="display: none">
                            <a href="../../FunctionModular/Letter/LetterList.aspx">
                                <div>
                                    <span class="pull-right text-muted">
                                        <em></em>
                                    </span>
                                </div>
                                <div>暂无消息</div>
                            </a>
                        </li>
                        <li class="divider" id="divider2" style="display: none"></li>
                        <li id="lis3" style="display: none">
                            <a href="../../FunctionModular/Letter/LetterList.aspx">
                                <div>
                                    <span class="pull-right text-muted">
                                        <em></em>
                                    </span>
                                </div>
                                <div>暂无消息</div>
                            </a>
                        </li>
                        <li class="divider" id="divider3" style="display: none"></li>
                        <li>
                            <a class="text-center" href="../../FunctionModular/Letter/LetterList.aspx">
                                <strong>查看所有消息</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <img class="pull-left" src="./statics/images/w_tx.png">
                        <p class="f16 white pull-left">Yilia_S</p>
                        <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                            <a href="/FunctionModular/PersonalInfo/PersonalInfo.aspx"><i class="fa fa-user fa-fw"></i>个人信息</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a onclick="LoginOut()"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </nav>
        <!-- 左侧  -->
        <nav class="navbar-default navbar-side w_color" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="w_blue">
                        <a id="MyIndex" href="../../Index.aspx"><i class="fa fa-desktop"></i>桌面</a>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic1.png" alt=""></i>人员设置<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="10" href="/FunctionModular/BasicSetting/RoleManagement.aspx" onclick="return OnSetCollapseIn(this);">角色管理</a></li>
                            <li><a data-id="11" href="/FunctionModular/BasicSetting/DepartmentMain.aspx" onclick="return OnSetCollapseIn(this);">部门管理</a></li>
                            <li><a data-id="12" href="/FunctionModular/BasicSetting/MemberManagement.aspx" onclick="return OnSetCollapseIn(this);">成员管理</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic2.png" alt=""></i>心理测评<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="14" href="/FunctionModular/Heartevaluation/Heartevaluation.aspx" onclick="return OnSetCollapseIn(this);">量表管理</a></li>
                            <li><a data-id="15" href="/FunctionModular/HeartEvaluation_DistributionRecord/DistributionRecord.aspx" onclick="return OnSetCollapseIn(this);">分配记录</a></li>
                            <li><a data-id="16" href="/FunctionModular/PersonalReport/PersonalReport.aspx" onclick="return OnSetCollapseIn(this);">个体报告</a></li>
                            <li><a data-id="17" href="/FunctionModular/GroupReport/GroupReport.aspx" onclick="return OnSetCollapseIn(this);">团体报告</a></li>
                            <li><a data-id="18" href="/FunctionModular/StatisticalAnalysis/Statistical.aspx" onclick="return OnSetCollapseIn(this);">统计分析</a></li>
                            <li><a data-id="19" href="/FunctionModular/HeartEvaluation/MyTest.aspx" onclick="return OnSetCollapseIn(this);">我的测验</a></li>
                            <li><a data-id="20" href="/FunctionModular/HeartEvaluation/ViewResult.aspx" onclick="return OnSetCollapseIn(this);">查看结果</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic3.png" alt=""></i>危机干预<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="21" href="/FunctionModular/RiskWarning/PotentialRiskEstimate.aspx" onclick="return OnSetCollapseIn(this);">潜在风险评估</a></li>
                            <li><a data-id="21" href="/FunctionModular/RiskWarning/IdioctoniaEstimate.aspx" onclick="return OnSetCollapseIn(this);">自杀风险评估</a></li>
                            <li><a data-id="21" href="/FunctionModular/RiskWarning/DiscriminateEstimate.aspx" onclick="return OnSetCollapseIn(this);">鉴别评估</a></li>
                            <li><a data-id="21" href="/FunctionModular/RiskWarning/DynamicEstimate.aspx" onclick="return OnSetCollapseIn(this);">动态评估</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic4.png" alt=""></i>预约咨询<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="23" href="/FunctionModular/Questionnaire_Record/Questionnaire_Manage.aspx" onclick="return OnSetCollapseIn(this);">问卷管理</a></li>
                            <li><a data-id="24" href="/FunctionModular/Questionnaire_Record/QuestionnaireRecord.aspx" onclick="return OnSetCollapseIn(this);">分配记录</a></li>
                            <li><a data-id="25" href="/FunctionModular/Questionnaire_Record/SurveyResult.aspx" onclick="return OnSetCollapseIn(this);">调查结果</a></li>
                            <li><a data-id="26" href="/FunctionModular/Questionnaire_Record/MyQuestionnaire.aspx" onclick="return OnSetCollapseIn(this);">我的问卷</a></li>
                            <li><a data-id="27" href="/FunctionModular/Questionnaire_Record/AnwserRecord.aspx" onclick="return OnSetCollapseIn(this);">作答记录</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic5.png" alt=""></i>档案管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="28" href="/FunctionModular/AppointmentConsult/QuestionType.aspx" onclick="return OnSetCollapseIn(this);">参数设置</a></li>
                            <li><a data-id="29" href="/FunctionModular/AppointmentConsult/AppointmentManagement.aspx" onclick="return OnSetCollapseIn(this);">预约管理</a></li>
                            <li><a data-id="34" href="/FunctionModular/AdvisoryStatistics/AdvisoryStatistics.aspx" onclick="return OnSetCollapseIn(this);">咨询统计</a></li>
                            <li><a data-id="35" href="/FunctionModular/AppointmentConsult/CaseanalysisList.aspx" onclick="return OnSetCollapseIn(this);">案例分析</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic6.png" alt=""></i>其他服务<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="37" href="/FunctionModular/EvaluationFiles/EvaluationFiles.aspx" onclick="return OnSetCollapseIn(this);">测评档案</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic7.png" alt=""></i>危机预防方案<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="37" href="/FunctionModular/EvaluationFiles/EvaluationFiles.aspx" onclick="return OnSetCollapseIn(this);">测评档案</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic8.png" alt=""></i>回收站<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="140" href="/FunctionModular/RecycleBin/RecycleBin.aspx" onclick="return OnSetCollapseIn(this);">回收站</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- 右侧  -->
        <div id="page-wrapper" class="x_wjgy">
            <div id="page-inner">
                <div class="content">
                    <!-- main -->
                    <div class="row" style="margin-left: 0px; margin-bottom: 20px;">
                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                            <input id="loginName" class="form-control" placeholder="登录名/姓名">
                        </div>
                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                            <select id="sex" class="form-control c999">
                                <option value="0">--请选择性别--</option>
                                <option value="1">男</option>
                                <option value="2">女</option>
                            </select>
                        </div>
                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                            <input id="departmentName" placeholder="--部门名称--">
                        </div>
                        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">

                            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                                <input size="16" type="text" id="datetimeStart" readonly onclick="javascript: $(this).val('')" class="form-control form_datetime" placeholder="开始日期" />
                            </div>
                            <div class="col-md-1 col-sm-2 col-xs-2" style="padding-left: 8px">
                                <label style="height: 34px; line-height: 34px;">-</label>
                            </div>
                            <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                                <input size="16" type="text" id="datetimeEnd" readonly onclick="javascript: $(this).val('')" class="form-control form_datetime lala" placeholder="结束日期" />
                            </div>

                        </div>
                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -3%;">
                            <select id="warningLevel" class="form-control">
                                <option value="0">--危机等级--</option>
                                <option value="1">暂无</option>
                                <option value="2">较低</option>
                                <option value="3">中等</option>
                                <option value="4">较高</option>
                                <option value="5">极高</option>
                            </select>
                        </div>
                        <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                            <button id="go_search" class="btn btn-primary btn-sm" name="QX_SelectDistributionRecord"><i class="fa fa-search "></i>查询</button>
                        </div>
                        <div class="pull-right pr15" style="margin-top: 5px;">
                            <button class="btn btn-primary btn-sm pull-right" id="addDynamicEstimate" data-toggle="modal" onclick="addPG()">+ 新建评估</button>
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
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableGrid" role="grid" aria-describedby="tableGrid_info">
                                        <thead>
                                            <tr role="row">
                                                <th style="width: 13px;" class="sorting_disabled" rowspan="1" colspan="1">
                                                    <input id="allCheck" onclick="SelectAll(this)" type="checkbox" /></th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 45px;">序号</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">登录名</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">姓名</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 65px;">性别</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 65px;">年龄</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 150px;">部门</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 109px;">预警级别</th>
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
                            <button class="btn btn-or w_radius ml10" data-toggle="modal"><i class="icon iconfont">&#xebc3;</i> 批量导出名单</button>
                            <button class="btn btn-or w_radius ml10" style="display: none;"><i class="icon iconfont">&#xebec;</i> 添加鉴别评估</button>
                        </div>
                    </div>
                    <!-- main结束 -->
                </div>
            </div>
        </div>
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
    <!-- 新建评估弹窗 -->
    <div class="modal fade x_xjzh in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">新建评估
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
                            <button type="button" class="btn btn-sm x_btn f14 addDynamicEstimate" data-toggle="modal" data-target=".x_plzy_sure">确定</button>
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
</body>

</html>
<!-- JS Scripts-->
<!-- 左侧下拉框 Js -->
<script src="/js/jquery-1.10.2.js"></script>
<script src="/js/jquery.metismenu.js"></script>
<script src="/js/custom-scripts.js"></script>
<script src="/js/object.js"></script>
<!-- 左侧下拉框 Js 结束 -->
<!-- Bootstrap Js -->
<script src="/js/bootstrap.min.js"></script>
<script src="../../JS/layer.js"></script>
<link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
<script src="../../JS/bootstrap-datepicker.js"></script>
<script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
<script src="../../JS/ligerComboBox/ligerTree.js"></script>
<script src="../../JS/ligerComboBox/ligerForm.js"></script>
<script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
<script src="../../JS/bootstrap-select.min.js"></script>
<script src="../../JS/ExtendJS.js"></script>
<script src="../../JS/layer.js"></script>
<script type="text/javascript">
    var tableGrid;
    var uIDArray = [];
    var searchModel = {};
    searchModel.LoginName = "";
    searchModel.Sex = "";
    searchModel.DepartmentID = 0;
    searchModel.StartTime = "";
    searchModel.EndTime = "";
    searchModel.WarningLevel = 0;
    searchModel.StartIndex = 0;
    searchModel.EndIndex = 10;
    window.SetCheckAll();
    function datas() {
        $("#datetimeStart").datepicker({
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
        $("#datetimeEnd").datepicker({
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
    //// 设置开始时间小于结束时间
    $("#datetimeStart").change(function () {
        $('#datetimeEnd').datepicker('setStartDate', $('#datetimeStart').val());
        if ($('#datetimeStart').val() != "" && $('#datetimeEnd').val() != "") {
            var oDate1 = new Date($('#datetimeStart').val());
            var oDate2 = new Date($('#datetimeEnd').val());
            if (oDate1.getTime() > oDate2.getTime())
                $('#datetimeEnd').val('');
        }
    })
    //$("#datetimeStart").datepicker({
    //    format: 'yyyy-mm-dd',
    //    minView: 'month',
    //    language: 'zh-CN',
    //    autoclose: true,
    //    startDate: new Date()
    //}).on("click", function () {
    //    $("#datetimeStart").datepicker("setEndDate", $("#datetimeEnd").val())
    //});
    //$("#datetimeEnd").datepicker({
    //    format: 'yyyy-mm-dd',
    //    minView: 'month',
    //    language: 'zh-CN',
    //    autoclose: true,
    //    startDate: new Date()
    //}).on("click", function () {
    //    $("#datetimeEnd").datepicker("setStartDate", $("#datetimeStart".val()))
    //});
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
                url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
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
    //全选
    function SelectAll(obj) {
        if (obj.checked) {

            $("input[type=checkbox][name=CheckboxID]").prop("checked", true);

        } else {
            $("input[type=checkbox][name=CheckboxID]").prop("checked", false);
        }
    };
    //单个删除
    function u_delete(obj) {
        layer.confirm('确定将该项目放入回收站吗？', { btn: ['确定', '取消'] },
            function () {
                var id = obj.attr('data-id');
            })
    }
    //批量删除
    function batchDelete() {
        var isAllCheck = false;
        var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
        for (var i = 0; i < checkArray.length; i++) {
            if (checkArray[i].checked) {
                isAllCheck = true;
                break;
            }
        }
        if (!isAllCheck) {
            layer.alert('请选择需要的删除的项目');
            return;
        }
        else
            $('.x_dels').modal('show');
    }
    function addPG() {
        document.getElementById("needEstimateLoginName").selectedIndex = 0;
        $('span[name=tip]').hide();
        $('.x_xjzh').modal('show');
    }
    function InitTable() {


        searchModel.LoginName = $("#loginName").val();
        searchModel.Sex = $("#sex").find("option:selected").val() == '0' ? '' : $("#sex").find("option:selected").text();
        searchModel.WarningLevel = $("#warningLevel").find("option:selected").val();
        searchModel.DisposalState = $("#disposalState").find("option:selected").val();
        searchModel.StartTime = $("#datetimeStart").val();
        searchModel.EndTime = $("#datetimeEnd").val();
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
                url: "Ajax/DynamicEstimate.ashx",
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
                $('td:eq(0)', row).html(" <input class='childCheck'  type=\"checkbox\" name='CheckboxID' value='" + data[10] + "' />");
                var operation = "";
                operation =
               " <button  class='btn btn-link showDynamicEstimateReportInfo'data-userID=" + data[10] + ">查看</button>"
                + " <button class='btn btn-link deleteDynamic' data-id='57'  data-userID=" + data[10] + " onclick='u_delete(this)'>删除</button>";
                if (data[7] == "暂无") {
                    $('td:eq(7)', row).html('<span class="blue">暂无</span>');
                }
                if (data[7] == "较低") {
                    $('td:eq(7)', row).html('<span class="green">较低</span>');
                }
                if (data[7] == "中等") {
                    $('td:eq(7)', row).html('<span class="huangse">中等</span>');
                }
                if (data[7] == "较高") {
                    $('td:eq(7)', row).html('<span class="chengse">较高</span>');
                }
                if (data[7] == "极高") {
                    $('td:eq(7)', row).html('<span class="red">极高</span>');
                }
                $('td:eq(1)', row).css("text-align", "center");
                $('td:eq(4)', row).css("text-align", "center");
                $('td:eq(5)', row).css("text-align", "center");
                $('td:eq(6)', row).css("text-align", "center");
                $('td:eq(7)', row).css("text-align", "center");
                $('td:eq(8)', row).css("text-align", "center");
                $('td:eq(9)', row).css("text-align", "center");
                $('td:eq(9)', row).html(operation);
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
        if (tableGrid != undefined) {
            $("#tableGrid").DataTable().draw();
            return;
        }
        <%--InitTable();--%>
    })
    $(document).on("click", ".childCheck", function () {
        uIDArray.push($(this).attr("value"));
    })
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
    $(document).on("click", "[data-mark='distributeIdioctoniaAmount']", function () {
        if (uIDArray.length == 0) {
            layer.alert("请选择用户进行自杀量表分配");
            return;
        }
        $.ajax({
            url: "Ajax/PotentialRiskEstimate.ashx?operationType=DistributeIdioctoniaAmount",
            type: "post",
            data: { uIDArray: uIDArray },
            success: function (data) {
                if (data.State) {

                }
            }
        })
    })
    $(document).on("click", ".showDynamicEstimateReportInfo", function () {
        var userID = $(this).attr("data-userID");
        sessionStorage.setItem("userID", userID)
        window.location.href = "DynamicEstimateView.aspx";
    })
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
    $(document).on("click", ".addDynamicEstimate", function () {
        var nowIndex = $('#needEstimateLoginName').find("option:selected").val();
        if (nowIndex == '0') {
            $('span[name=tip]').show();
            return;
        }
        sessionStorage.setItem("userID", $("#needEstimateLoginName").find("option:selected").val());
        sessionStorage.setItem("userName", $("#needEstimateLoginName").find("option:selected").text());
        window.location.href = "CreateDynamicEstimate.aspx";
    })
    function checkChange(obj) {
        var nowIndex = $('#needEstimateLoginName').find("option:selected").val();
        if (nowIndex == '0') {
            $('span[name=tip]').show();
        } else
            $('span[name=tip]').hide();
    }
    $(document).on("click", ".multiDelete", function () {
        layer.confirm("确定将所选记录放入到回收站中?", {
            btn: ["确定", "取消"]
        }, function () {
            var checkedArray = window.GetCheckedCheckBox();
            var recycleBinModelList = [];
            for (var i = 0; i < checkedArray.length; i++) {
                var recycleBinModel = {
                    RBTitle: "删除动态评估",
                    RBModularID: 166, //对应模块权限ID
                    RBTableName: "DynamicEstimate_User_Relation", //删除的表名
                    RBFieldName: "UserID", //删除相对应字段的id
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
    $(document).on("click", ".deleteDynamic", function () {
        var value = $(this).attr("data-userid");
        layer.confirm("确定将此项记录放到回收站吗？", {
            btn: ["确定", "取消"]
        }, function () {
            var recycleBinModelList = [];
            var recycleBinModel = {
                RBTitle: "删除动态评估",
                RBModularID: 166, //对应模块权限ID
                RBTableName: "DynamicEstimate_User_Relation", //删除的表名
                RBFieldName: "UserID", //删除相对应字段的id
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
</script>
