<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="WorkArchives.aspx.cs" Inherits="CrisisInterfere.FunctionModular.ArchivesManagement.WorkArchives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <!-- Custom Styles-->
        <link href="../../css/custom-styles.css" rel="stylesheet" />
    <link href="../../css/custom-styles_1.css" rel="stylesheet" />
    <link href="../../css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../css/base.css" rel="stylesheet" />
    <link href="/css/dagl.css" rel="stylesheet" />
    <link href="/css/xlcp.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <style>
        .l-tree li{
            text-align:left;
            height:auto;
        }
    </style>

    <div id="workArchivesContent" class="content pr">
        <!-- main -->
        <div class="x_lbgl">
            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTabs" class="nav nav-tabs" role="tablist">
                    <li class="active"><a class="x_lbfp" href="#home" data-toggle="tab">部门月报表</a></li>
                    <li><a class="x_zhfp" href="#profile" data-toggle="tab">咨询中心月报表</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <!-- 部门月报表 -->
                    <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                        <form action="">
                            <div class="row mt20" style="margin-left: 0px; margin-bottom: 10px;">
                                <!-- 部门名称 -->
                                <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
                                    <input type="text" id="department" placeholder="部门名称" class="form-control"/>
                                    <span id="departmentTip">请选择部门和时间，点击查询后根据所选内容生成报表。</span>
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                                        <input size="16" type="text" id="datetimeStart" readonly="" style="background-color:#eee;" class="form-control form_datetime" placeholder="开始日期" />
                                    </div>
                                    <span class="fl pl10 pr10 pt5">-
                                    </span>
                                    <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                                        <input size="16" type="text" id="datetimeEnd" readonly="" style="background-color:#eee;" class="form-control form_datetime lala" placeholder="结束日期"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -4.5%">
                                    <button class="btn btn-primary btn-sm pull-left" id="go_search" name="QX_SelectUser" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px; font-size: 14px;"><i class="fa fa-search "></i>查询</button>
                                </div>
                            </div>
                            <!-- 报表内容 -->
                            <div class="x_dngl_nr" id="departmentContent" style="display:none">
                                <h3 class="tc fb mt50 mb30">部门统计</h3>
                                <div class="first_box f16 c333 mt50">
                                    <div class="pull-left pl100">部<strong class="pl30 fn">门：</strong><span class="departmentText"></span></div>
                                    <div class="pull-right pr100">生成日期：<span id="departmentDataBuildDate"></span></div>
                                </div>
                                <div class="x_dngl_part">
                                    <h4 class="zhuse tc fb mt50 mb40">不同心理危机水平的频次分布</h4>
                                    <div class="overflow">
                                        <p class="f16 c666 pb10">1、潜在风险评估</p>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 25%">部门/预警级别</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">暂无</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较低</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">中等</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较高</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">极高</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row">
                                                    <th class="fn" scope="row">潜在风险评估</th>
                                                    <td>{{PotentialRiskWarningPeopleCount.NA}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Lower}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Medium}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Higher}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Highest}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="overflow">
                                        <p class="f16 c666 pb10">2、自杀倾向评估</p>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 25%">部门/预警级别</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">暂无</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较低</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">中等</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较高</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">极高</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row">
                                                    <th class="fn" scope="row">自杀可能性</th>
                                                    <td>{{IdioctoniaWarningPeopleCount.NA}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Lower}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Medium}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Higher}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Highest}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="overflow">
                                        <p class="f16 c666 pb10">3.1、鉴别评估</p>
                                        <div id="discernEstimateChart" style="width: 100%"></div>
                                        <img id="discernEstimateImg" style="display: none" width="600px" height="400px" />
                                        <table class="table table-bordered mt30">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 25%">部门/预警级别</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">暂无</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较低</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">中等</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较高</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">极高</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row">
                                                    <th class="fn" scope="row">鉴别评估</th>
                                                    <td>{{DiscernEstimateWarningPeopleCount.NA}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Lower}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Medium}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Higher}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Highest}}</td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="overflow">
                                        <p class="f16 c666 pb10">3.2处理情况分布</p>
                                        <table class="table table-bordered">
                                                        <thead>
                                                            <tr role="row">
                                                                <th class="text-center" rowspan="1" colspan="1" style="width: 25%">部门/处理建议</th>
                                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">立即就医</th>
                                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">24小时监护</th>
                                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">通知相关管理员</th>
                                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">进行心理咨询</th>
                                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">暂时无需干预</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr role="row">
                                                                <th class="fn departmentText" scope="row"></th>
                                                                <td>{{DisposalDistributionPeopleCount.SeeD}}</td>
                                                                <td>{{DisposalDistributionPeopleCount.AllDayCustody}}</td>
                                                                <td>{{DisposalDistributionPeopleCount.NoticeAdmin}}</td>
                                                                <td>{{DisposalDistributionPeopleCount.GoHeartConsult}}</td>
                                                                <td>{{DisposalDistributionPeopleCount.NotNeedHelp}}</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                    </div>
                                    <div class="overflow">
                                        <p class="f16 c666 pb10">4、生活事件跟踪评估</p>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 25%">部门/预警级别</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">暂无</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较低</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">中等</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较高</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">极高</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row">
                                                    <th class="fn" scope="row">跟踪评估</th>
                                                    <td>{{DynamicEstimateWarningPeopleCount.NA}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Lower}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Medium}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Higher}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Highest}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!-- 咨询记录统计 -->
                                <div class="x_dngl_part">
                                    <h4 class="zhuse tc fb mt50 mb40">咨询记录统计</h4>
                                    <div class="overflow">
                                        <p class="f16 c666 pb10">1、咨询师工作统计</p>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 20%">咨询师</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 40%;">预约人数</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 40%;">完成咨询人数</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row"  v-for="item in CounselorWorkStatistics">
                                                    <th class="fn" scope="row">{{item.CounselorName}}</th>
                                                    <td>{{item.AppointmentPeopleCount}}</td>
                                                    <td>{{item.DisposalPeopleCount}}</td>
                                                </tr>
                                                <tr role="row" id="noneCounselor" style="display:none">
                                                    <td colspan="3">无</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="overflow">
                                        <p class="f16 c666 pb10">2、各部门咨询情况分布</p>
                                        <table class="table table-bordered nomargin">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 20%">部门/严重程度</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 16%;">一级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 16%;">二级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 16%;">三级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 16%;">四级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 16%;">五级</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row">
                                                    <th class="fn" scope="row"><span class="departmentText"></span></th>
                                                    <td>{{SeriousLevelPeopleCount.FirstLevelPeopleCount}}</td>
                                                    <td>{{SeriousLevelPeopleCount.SecondLevelPeopleCount}}</td>
                                                    <td>{{SeriousLevelPeopleCount.ThirdLevelPeopleCount}}</td>
                                                    <td>{{SeriousLevelPeopleCount.FouthLevelPeopleCount}}</td>
                                                    <td>{{SeriousLevelPeopleCount.FithLevelPeopleCount}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <p class="f12 c666">注：严重程度一级~五级，五级表示最严重。</p>
                                    </div>
                                    <div class="overflow mt30">
                                        <p class="f16 c666 pb10">3、咨询评估问题分布</p>
                                        <div id="questionTypeChart" style="width: 100%"></div>
                                        <img id="questionTypeImg" style="display: none" width="600px" height="400px" />
                                        <table class="table table-bordered mt30">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%">部门/问题分类</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">婚恋情感</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">亲子关系</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">职业发展</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">社会交往</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">个人成长</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">情绪问题</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">学业问题</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">行为问题</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 9%;">其他</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row">
                                                    <th class="fn" scope="row"><span class="departmentText"></span></th>
                                                    <td>{{QuestionTypeConsultPeopleCount.Marriage}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Parentage}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Job}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Society}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Personal}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Mood}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Studies}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Action}}</td>
                                                    <td>{{QuestionTypeConsultPeopleCount.Other}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row mt50 mb50">
                                    <div class="col-sm-12  col-xs-12 tc" id="Expert">
                                        <button type="button" class="btn btn-sm x_btn f14" onclick="DepartmentExport()">导出</button>
                                        <button type="button" class="btn btn-sm x_btn f15" onclick="ReturnTable()">取消</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <!-- 咨询中心月报表 --> 
                    <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                        <form action="">
                            <div class="row mt20" style="margin-left: 0px; margin-bottom: 10px;">
                                <!-- 部门名称 -->
                                <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
                                    <input type="text" class="form-control" id="departmentConsult" placeholder="部门名称"/>
                                    <span id="consultCenterTip">请选择部门和时间，点击查询后根据所选内容生成报表。</span>
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                                        <input size="16" type="text" id="datetimeStartConsult" readonly="" class="form-control form_datetime" placeholder="开始日期">
                                    </div>
                                    <span class="fl pl10 pr10 pt5">-
                                    </span>
                                    <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                                        <input size="16" type="text" id="datetimeEndConsult" readonly="" class="form-control form_datetime lala" placeholder="结束日期">
                                    </div>
                                </div>
                                <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -4.5%">
                                    <button class="btn btn-primary btn-sm pull-left" id="go_searchConsult" name="QX_SelectUser" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px; font-size: 14px;"><i class="fa fa-search "></i>查询</button>
                                </div>
                            </div>
                            <!-- 报表内容 -->
                            <div class="x_dngl_nr" id="consultCenter" style="display:none">
                                <h3 class="tc fb mt50 mb30">咨询统计</h3>
                                <div class="first_box f16 c333 mt50">
                                    <div class="pull-left pl100">部<strong class="pl30 fn">门：</strong><span class="departmentConsultCenter"></span></div>
                                    <div class="pull-right pr100">生成日期：<span id="consultCenterDataBuildDate"></span></div>
                                </div>
                                <div class="x_dngl_part">
                                    <h4 class="zhuse fb mt50 mb40">不同心理危机水平的频次分布</h4>
                                    <div class="overflow">
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 25%">问题类型/风险水平</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">暂无</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较低</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">中等</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">较高</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">极高</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row">
                                                    <th class="fn" scope="row">潜在风险评估</th>
                                                    <td>{{PotentialRiskWarningPeopleCount.NA}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Lower}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Medium}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Higher}}</td>
                                                    <td>{{PotentialRiskWarningPeopleCount.Highest}}</td>
                                                </tr>
                                                <tr role="row">
                                                    <th class="fn" scope="row">自杀可能性</th>
                                                    <td>{{IdioctoniaWarningPeopleCount.NA}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Lower}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Medium}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Higher}}</td>
                                                    <td>{{IdioctoniaWarningPeopleCount.Highest}}</td>
                                                </tr>


                                                <tr role="row">
                                                    <th class="fn" scope="row">鉴别评估</th>
                                                    <td>{{DiscernEstimateWarningPeopleCount.NA}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Lower}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Medium}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Higher}}</td>
                                                    <td>{{DiscernEstimateWarningPeopleCount.Highest}}</td>
                                                </tr>
                                                <tr role="row">
                                                    <th class="fn" scope="row">跟踪评估</th>
                                                    <td>{{DynamicEstimateWarningPeopleCount.NA}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Lower}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Medium}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Higher}}</td>
                                                    <td>{{DynamicEstimateWarningPeopleCount.Highest}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="overflow">
                                        <h4 class="zhuse fb mt50 mb40">咨询人员问题类型分布</h4>
                                        <div id="differentWarningChart" style="width: 100%"></div>
                                        <img id="differentWarningImg" style="display: none" width="800px" height="400px" />
                                        <div id="differentLevelCountChart" style="width:100%"></div>
                                        <img id="differentLevelCountImg" style="display: none" width="800px" height="400px" />
                                        <table class="table table-bordered mt30">
                                            <thead>
                                                <tr role="row">
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 15%">咨询问题/严重程度</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 10%;">一级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 10%;">二级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 10%;">三级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 10%;">四级</th>
                                                    <th class="text-center" rowspan="1" colspan="1" style="width: 10%;">五级</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr role="row" v-for="item in QuestionTypeSeriousLevelPeopleCount">
                                                    <th class="fn" scope="row">{{item.QuestionTypeName}}</th>
                                                    <td>{{item.FirstLevelPeopleCount}}</td>
                                                    <td>{{item.SecondLevelPeopleCount}}</td>
                                                    <td>{{item.ThirdLevelPeopleCount}}</td>
                                                    <td>{{item.FouthLevelPeopleCount}}</td>
                                                    <td>{{item.FithLevelPeopleCount}}</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="row mt50 mb50">
                                    <div class="col-sm-12  col-xs-12" id="operationBtn" style="text-align:center">
                                        <button type="button" class="btn btn-sm x_btn f14" onclick="ConsultCenterExport()">导出</button>
                                        <button type="button" class="btn btn-sm x_btn f15" onclick="ReturnTable()">取消</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- main结束 -->
    </div>
    <!-- JS Scripts-->
    <!-- 左侧下拉框 Js -->
    <!-- Bootstrap Js -->
    
    <script src="../../JS/vue.js"></script>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/TreeTables/jquery.treeTable.js"></script>
    <script src="/js/bootstrap-datepicker.js"></script>
    <script src="/js/bootstrap-datepicker.zh-CN.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
        <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <script type="text/javascript">
        var navName = '/FunctionModular/ArchivesManagement/WorkArchives.aspx';
        var differentLevelCountChart;
        var searchModel = {};
        var workArchivesVue;
        var discernEstimateChart;
        var questionTypeChart;
        var differentWarningChart;
        $("#page-wrapper").addClass("x_wjgy");
        $("#page-wrapper").addClass("x_dagl");
        $(function () {
            $("#datetimeStart").datepicker({
                format: 'yyyy-mm-dd',
                language: 'zh-CN',
                minView:'month',
                autoclose: true,
                endDate: new Date(),
                clearBtn: true,
            }).on("changeDate", function () {
                $("#datetimeEnd").datepicker("setStartDate", $("#datetimeStart").val());
                
            });
            $("#datetimeEnd").datepicker({
                format: 'yyyy-mm-dd',
                minView:'month',
                language: 'zh-CN',
                autoclose: true,
                endDate: new Date(),
                clearBtn: true,
            }).on("changeDate", function () {
                $("#datetimeStart").datepicker("setEndDate", $("#datetimeEnd").val());
            });
            $("#datetimeStartConsult").datepicker({
                format: 'yyyy-mm-dd',
                language: 'zh-CN',
                minView: 'month',
                autoclose: true,
                endDate: new Date(),
                clearBtn: true,
            }).on("changeDate", function () {
                
                $("#datetimeEndConsult").datepicker("setStartDate", $("#datetimeStartConsult").val())
            });
            $("#datetimeEndConsult").datepicker({
                format: 'yyyy-mm-dd',
                minView: 'month',
                language: 'zh-CN',
                autoclose: true,
                endDate: new Date(),
                clearBtn: true,
            }).on("changeDate", function () {
                  $("#datetimeStartConsult").datepicker("setEndDate", $("#datetimeEndConsult").val())
            });
            OnLoadTreeCom();
            function OnLoadTreeCom() {
                var tmep = false;
                $("#department").ligerComboBox({
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
                            $(".departmentText").text(node.data['text']);
                        },
                        url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                        usericon: 'd_icon',
                        idFieldName: 'id',
                        checkbox: false,
                        onClick: function (node) {//单击事件
                            if ($("#T_parent").val() == "")
                                $("#DepID").val("");
                        }
                    }
                });
            }
            OnLoadDeartmentCom();
            function OnLoadDeartmentCom() {
                var tmep = false;
                $("#departmentConsult").ligerComboBox({
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
                            $(".departmentConsultCenter").text(node.data['text']);
                        },
                        url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                        usericon: 'd_icon',
                        idFieldName: 'id',
                        checkbox: false,
                        onClick: function (node) {//单击事件
                            if ($("#T_parent").val() == "")
                                $("#DepID").val("");
                        }
                    }
                });
            }
        })
        
        function GetPotentialRiskWarningPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetPotentialRiskWarningPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetIdioctoniaWarningPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetIdioctoniaWarningPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetDiscernEstimateWarningPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetDiscernEstimateWarningPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetDynamicEstimateWarningPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetDynamicEstimateWarningPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetCounselorWorkStatisticsByDepartmentID() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetCounselorWorkStatisticsByDepartmentID", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetQuestionTypeConsultPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetQuestionTypeConsultPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetQuestionTypeSeriousLevelPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetQuestionTypeSeriousLevelPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetSeriousLevelPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetSeriousLevelPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        function GetDisposalDistributionPeopleCount() {
            var model;
            $.ajax({
                url: "Ajax/WorkArchives.ashx",
                type: "post",
                async: false,
                data: { operationType: "GetDisposalDistributionPeopleCount", searchModel: JSON.stringify(searchModel) },
                dataType: "json",
                success: function (data) {
                    model = data;
                }
            })
            return model;
        }
        workArchivesVue = new Vue({
            el: "#workArchivesContent",
            data: {
                PotentialRiskWarningPeopleCount: '',
                IdioctoniaWarningPeopleCount: '',
                DiscernEstimateWarningPeopleCount: '',
                DynamicEstimateWarningPeopleCount: '',
                CounselorWorkStatistics: '',
                QuestionTypeConsultPeopleCount: '',
                QuestionTypeSeriousLevelPeopleCount: '',
                SeriousLevelPeopleCount: '',
                DisposalDistributionPeopleCount:'',
                IsShowCounselorWorkStatistics: 0
            }
        })
        if (workArchivesVue.$data.CounselorWorkStatistics.length == 0) {
            $("#noneCounselor").show();
        }
        function LoadDiscernEstimateChart() {
            var discernEstimateSeries = [];
            var discernEstimateItem = {};
            discernEstimateItem.name = '对应等级人数';
            discernEstimateItem.data = [workArchivesVue.$data.DiscernEstimateWarningPeopleCount.NA, workArchivesVue.$data.DiscernEstimateWarningPeopleCount.Lower, workArchivesVue.$data.DiscernEstimateWarningPeopleCount.Medium, workArchivesVue.$data.DiscernEstimateWarningPeopleCount.Higher, workArchivesVue.$data.DiscernEstimateWarningPeopleCount.Highest];
            discernEstimateSeries.push(discernEstimateItem);
            discernEstimateChart = Highcharts.chart('discernEstimateChart', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: '鉴别评估危机等级人数分布'
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    categories: ['暂无', '较低', '中等', '较高', '极高']
                },
                yAxis: {
                    title: {
                        text: '人数'
                    },
                    allowDecimals: false
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true          // 开启数据标签
                        },
                        enableMouseTracking: false // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                    }
                },
                series: discernEstimateSeries
            });
        }
        function LoadConsultQuestionTypeChart() {
            var questionTypeSeries = [];
            var questionTypeItem = {};
            questionTypeItem.name = '对应咨询问题类型人数';
            questionTypeItem.data = [{ name: '婚恋情感', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Marriage }, { name: '亲子关系', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Parentage }, { name: '职业发展', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Job }, { name: '社会交往', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Society }, { name: '个人发展', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Personal }, { name: '情绪问题', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Mood }, { name: '学业问题', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Studies }, { name: '行为问题', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Action }, { name: '其他', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Other }];
            questionTypeSeries.push(questionTypeItem);
            questionTypeChart = Highcharts.chart('questionTypeChart', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: '咨询问题人数分布'
                },
                subtitle: {
                    text: ''
                },
                xAxis: {
                    categories: ['婚恋情感', '亲子关系', '职业发展', '社会交往', '个人成长', '情绪问题', '学业问题', '行为问题','其他']
                },
                yAxis: {
                    title: {
                        text: '人数'
                    },
                    allowDecimals: false
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true          // 开启数据标签
                        },
                        enableMouseTracking: false // 关闭鼠标跟踪，对应的提示框、点击事件会失效
                    }
                },
                series: questionTypeSeries
            });
        }
        function LoadDifferentWarningChart() {
            
            differentWarningChart = Highcharts.chart('differentWarningChart', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: '问题类型人次占比'
                },
                tooltip: {
                    headerFormat: '{series.name}<br>',
                    pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '问题类型人次',
                    data: [{ name: '婚恋情感', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Marriage }, { name: '亲子关系', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Parentage }, { name: '职业发展', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Job }, { name: '社会交往', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Society }, { name: '个人发展', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Personal }, { name: '情绪问题', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Mood }, { name: '学业问题', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Studies }, { name: '行为问题', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Action }, { name: '其他', y: workArchivesVue.$data.QuestionTypeConsultPeopleCount.Other }]
                }]
            });
            var differentLevelCountData = [{name:'一级',y:0},{name:'二级',y:0},{name:'三级',y:0},{name:'四级',y:0},{name:'五级',y:0}];
            for (var i = 0; i < workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount.length; i++) {
                
                differentLevelCountData[0].y += workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount[i].FirstLevelPeopleCount;
                differentLevelCountData[1].y += workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount[i].SecondLevelPeopleCount;
                differentLevelCountData[2].y += workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount[i].ThirdLevelPeopleCount;
                differentLevelCountData[3].y += workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount[i].FouthLevelPeopleCount;
                differentLevelCountData[4].y += workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount[i].FithLevelPeopleCount;
            }
            differentLevelCountChart = Highcharts.chart('differentLevelCountChart', {
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false
                },
                title: {
                    text: '不同危机等级人次占比'
                },
                tooltip: {
                    headerFormat: '{series.name}<br>',
                    pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: '问题类型人次',
                    data: differentLevelCountData
                }]
            });
        }
        $(document).on("click", "#go_search", function () {
            if ($("#department").val() == "") {
                layer.alert("请选择部门");
                return;
            }
            searchModel.StartTime = $("#datetimeStart").val();
            searchModel.EndTime = $("#datetimeEnd").val();
            $("#departmentContent").show();
            workArchivesVue.$data.PotentialRiskWarningPeopleCount= GetPotentialRiskWarningPeopleCount();
            workArchivesVue.$data.IdioctoniaWarningPeopleCount = GetIdioctoniaWarningPeopleCount();
            workArchivesVue.$data.DiscernEstimateWarningPeopleCount = GetDiscernEstimateWarningPeopleCount();
            workArchivesVue.$data.DynamicEstimateWarningPeopleCount = GetDynamicEstimateWarningPeopleCount();
            workArchivesVue.$data.CounselorWorkStatistics = GetCounselorWorkStatisticsByDepartmentID();
            workArchivesVue.$data.QuestionTypeConsultPeopleCount = GetQuestionTypeConsultPeopleCount();
            workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount = GetQuestionTypeSeriousLevelPeopleCount();
            workArchivesVue.$data.SeriousLevelPeopleCount = GetSeriousLevelPeopleCount();
            workArchivesVue.$data.IsShowCounselorWorkStatistics = workArchivesVue.$data.CounselorWorkStatistics.length;
            workArchivesVue.$data.DisposalDistributionPeopleCount = GetDisposalDistributionPeopleCount();
            LoadDiscernEstimateChart();
            LoadConsultQuestionTypeChart();
            $("#departmentDataBuildDate").text(window.GetNowTime());
            if (workArchivesVue.$data.CounselorWorkStatistics.length > 0) {
                $("#noneCounselor").hide();
            } else {
                $("#noneCounselor").show();
            }
            $("#departmentTip").hide();
        });
        $(document).on("click", "#go_searchConsult", function () {
            if ($("#departmentConsult").val() == "") {
                layer.alert("请选择部门");
                return;
            }
            searchModel.StartTime = $("#datetimeStartConsult").val();
            searchModel.EndTime = $("#datetimeEndConsult").val();
            $("#consultCenter").show();
            workArchivesVue.$data.PotentialRiskWarningPeopleCount = GetPotentialRiskWarningPeopleCount();
            workArchivesVue.$data.IdioctoniaWarningPeopleCount = GetIdioctoniaWarningPeopleCount();
            workArchivesVue.$data.DiscernEstimateWarningPeopleCount = GetDiscernEstimateWarningPeopleCount();
            workArchivesVue.$data.DynamicEstimateWarningPeopleCount = GetDynamicEstimateWarningPeopleCount();
            workArchivesVue.$data.CounselorWorkStatistics = GetCounselorWorkStatisticsByDepartmentID();
            workArchivesVue.$data.QuestionTypeConsultPeopleCount = GetQuestionTypeConsultPeopleCount();
            workArchivesVue.$data.QuestionTypeSeriousLevelPeopleCount = GetQuestionTypeSeriousLevelPeopleCount();
            workArchivesVue.$data.SeriousLevelPeopleCount = GetSeriousLevelPeopleCount();
            workArchivesVue.$data.IsShowCounselorWorkStatistics = workArchivesVue.$data.CounselorWorkStatistics.length;
            LoadDifferentWarningChart();
            $("#consultCenterDataBuildDate").text(window.GetNowTime());
            $("#consultCenterTip").hide();
        });
        function DepartmentExport() {
            var svgDiscernEstimate = $($(".highcharts-container")[0]).html();
            var svgquestionType = $($(".highcharts-container")[1]).html();
            var discernEstimateImg = new Image();
            var questionTypeImg = new Image();
            discernEstimateImg.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgDiscernEstimate)));
            questionTypeImg.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgquestionType)));
            var firstBase64 = discernEstimateImg.src;
            var secondBase64 = questionTypeImg.src;
            questionTypeImg.onload = function () {

                //$("#sss").attr("src", base64);
                $("#discernEstimateImg").attr("src", firstBase64);
                $("#questionTypeImg").attr("src", secondBase64);
                $("#discernEstimateImg").show();
                $("#questionTypeImg").show();
                $("#discernEstimateChart").hide();
                $("#questionTypeChart").hide();
                $("#Expert").hide();
                $("#departmentContent").wordExport($($(".departmentText")[0]).text());
                $("#Expert").show();
                $("#discernEstimateImg").hide();
                $("#questionTypeImg").hide();
                $("#discernEstimateChart").show();
                $("#questionTypeChart").show();
            };
        }
        function ConsultCenterExport() {
            var svgDifferentWarning = $($(".highcharts-container")[2]).html();
            var svgDifferentLevelCount = $($(".highcharts-container")[3]).html();
            if (svgDifferentWarning == undefined && svgDifferentWarning == undefined) {
                svgDifferentWarning = $($(".highcharts-container")[0]).html();
                svgDifferentLevelCount = $($(".highcharts-container")[1]).html();
            }
            var differentWarningImg = new Image();
            var differentLevelCountImg = new Image();
            differentWarningImg.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgDifferentWarning)));
            differentLevelCountImg.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgDifferentLevelCount)));
            var firstBase64 = differentWarningImg.src;
            var secondBase64 = differentLevelCountImg.src;
            differentLevelCountImg.onload = function () {
                //$("#sss").attr("src", base64);
                $("#differentWarningImg").attr("src", firstBase64);
                $("#differentLevelCountImg").attr("src", secondBase64);
                $("#differentWarningImg").show();
                $("#differentLevelCountImg").show();
                $("#differentWarningChart").hide();
                $("#differentLevelCountChart").hide();
                $("#operationBtn").hide();
                $("#consultCenter").wordExport($(".departmentConsultCenter").text());
                $("#differentWarningImg").hide();
                $("#operationBtn").show();
                $("#differentLevelCountImg").hide();
                $("#differentWarningChart").show();
                $("#differentLevelCountChart").show();
            };
        }
        function ReturnTable() {
            window.location.href = "WorkArchives.aspx";
        }
    </script>
</asp:Content>
