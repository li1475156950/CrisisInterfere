<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DynamicEstimateView_old.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.DynamicEstimateView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>京师博仁危机干预-动态评估查看页面</title>
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
                            <a href="/FunctionModular/PersonalIfno/PersonalIfno.aspx"><i class="fa fa-user fa-fw"></i>个人信息</a>
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
                            <li><a data-id="37" href="/FunctionModular/Evaluatiofniles/Evaluatiofniles.aspx" onclick="return OnSetCollapseIn(this);">测评档案</a></li>
                        </ul>
                    </li>
                    <li><a href="#" onclick="return OnSetCollapseIn(this);"><i class="null">
                        <img src="./statics/images/w_xpic7.png" alt=""></i>危机预防方案<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level collapse">
                            <li><a data-id="37" href="/FunctionModular/Evaluatiofniles/Evaluatiofniles.aspx" onclick="return OnSetCollapseIn(this);">测评档案</a></li>
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
        <div id="page-wrapper" class="x_dtpg">
            <div id="page-inner">
                <div class="content pr">
                    <!-- main -->
                    <form action="">
                        <h3 class="fb tc mt10">生活事件动态评估记录</h3>
                        <div class="panel-group mt40" id="accordion" role="tablist" aria-multiselectable="true">
                        </div>
                        <div class="row mt50">
                            <div class="col-sm-6  col-xs-6 text-right">
                                <button type="button" class="btn btn-sm x_btn f14">导出</button>
                            </div>
                            <div class="col-sm-2  col-xs-3  text-right">
                                <button type="button" class="btn btn-sm x_btn1 f14" onclick="back()">取消</button>
                            </div>
                        </div>
                    </form>
                    <!-- main结束 -->
                </div>
            </div>
        </div>
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
<script src="/js/bootstrap-datepicker.js"></script>
<script src="/js/bootstrap-datepicker.zh-CN.js"></script>
<script type="text/javascript">
    var userID = sessionStorage.getItem("userID");
    GetDynamicEstimateReportInfo();
    function GetDynamicEstimateReportInfo() {
        $.ajax({
            url: "Ajax/DynamicEstimate.ashx",
            type: "post",
            dataType: "json",
            async: false,
            data: { userID: userID, operationType: "GetDynamicEstimateReportInfo" },
            success: function (data) {
                $.each(data, function (index, item) {
                    var html = '<div class="panel panel-default">' +
                            '<div class="panel-heading pr" role="tab" id="headingOne">' +
                             '<h4 class="panel-title">' +
                                '<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-controls="collapseOne" class="">' +
                                  '<div class="pull-left">' +
                                      '危机级别：<span style="padding-right:20px;">' + item.WarningState + '</span>' +
                    '评估人：<span style="padding-right:20px;">' + item.CounselorName + '</span>' +
                    '<span>' + item.DynamicEstimateDate + '</span>' +
                    '</div>' +
                '<div class="pull-right">' +
                  '<span class="x_fh mr30"></span>' +
                '</div>' +
              '</a>' +
            '</h4>' +
            '<i class="iconfont f12" id="x_close">&#xebf9;</i>' +
          '</div>' +
          '<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">' +
            '<div class="panel-body f16 c666">' +
               '<div class="tc mt10">评估人：<span class="mr40">' + item.CounselorName + '</span> 危机级别：<span>' + item.WarningState + '</span></div>' +
               '<div class="box">' +
                                     '<dl class="pl30 pr30 mt30">' + item.DynamicEstimateContent
                                     +
                                     '</dl>' +
                                 '</div>' +
                              '</div>' +
                            '</div>' +
                          '</div>';
                    $("#accordion").append(html);
                })
            }
        })
    }
    function back() {
        window.location.href = 'DynamicEstimate.aspx';
    }
</script>
