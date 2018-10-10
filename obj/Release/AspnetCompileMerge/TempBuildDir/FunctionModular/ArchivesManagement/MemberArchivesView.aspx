<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MemberArchivesView.aspx.cs" Inherits="CrisisInterfere.FunctionModular.ArchivesManagement.MemberArchivesView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <!-- Bootstrap Styles-->
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="/css/wjyj.css" rel="stylesheet" />
    <link href="/css/dagl.css" rel="stylesheet" />
    <div class="content">
        <!-- main -->
        <div class="x_reports" id="memberArchiveExport">
            <h3 class="fb tc mt5 mb30">学生心理档案</h3>
            <div class="part">
                <div class="tc title">
                    <span class="f16 white">基本信息</span>
                </div>
                <div class="main main1 mt20">
                    <table class="table table-bordered mt30 h150">
                        <tbody>
                            <tr>
                                <td>登&nbsp; 录&nbsp;名：<span>{{personalInfo.LoginName}}</span></td>
                                <td>姓<strong class="pl30 fn">名</strong>：<span>{{personalInfo.UserName}}</span></td>
                                <td>年<strong class="pl30 fn">龄</strong>：<span>{{personalInfo.Age}}</span></td>
                                <td>性<strong class="pl30 fn">别</strong>：<span>{{personalInfo.Sex}}</span></td>
                            </tr>
                            <tr>
                                <td>部<strong class="pl30 fn">门</strong>：<span>{{personalInfo.Department}}</span></td>
                                <td>手&nbsp; 机&nbsp;号：<span>{{personalInfo.CellPhone}}</span></td>
                                <td>邮<strong class="pl30 fn">箱</strong>：<span>{{personalInfo.Email}}</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="part mt50">
                <div class="tc title">
                    <span class="f16 white">心理测试记录</span>
                </div>
                <div class="main main2 mt20">
                    <h4 class="fb tl f16 mb20 zhuse">潜在风险评估问卷</h4>

                    <div class="overflow">
                        <div v-for="(prModel,index) in potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList">
                            <h4 class="tl f14 mb10 c666">作答时间：{{potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskCreateTime[index]}}</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr role="row">
                                        <%--<th class="text-center" rowspan="1" colspan="1" style="width: 20%"></th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">症状自评</th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">自尊</th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">社会支持</th>--%>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 249px;"></th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 250px;">症状自评</th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 250px;">自尊</th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 250px;">社会支持</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr role="row">
                                        <%--<th class="fn" scope="row">得分</th>--%>
                                        <%-- <td v-for="value in prModel">
                                            <span v-for="(item,key) in value">{{item}}</span>
                                        </td>--%>
                                        <th class="fn" scope="row" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; font-weight: normal; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; color: rgb(102, 102, 102);">得分</th>

                                        <td v-for="value in prModel" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; vertical-align: top; line-height: 1.42857; border: 1px solid rgb(204, 204, 204); text-align: center; font-size: 16px;">
                                            <span v-for="(item,key) in value" style="box-sizing: border-box;">{{item}}</span></td>
                                    </tr>
                                    <tr role="row">
                                        <%--<th class="fn" scope="row">维度</th>--%>
                                        <%--<td v-for="(value,key) in prModel">
                                            <span v-for="(item,key) in value">{{key}}</span>
                                        </td>--%>
                                        <th class="fn" scope="row" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; font-weight: normal; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; color: rgb(102, 102, 102);">状态</th>
                                        <td v-for="(value,key) in prModel" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; vertical-align: top; line-height: 1.42857; border: 1px solid rgb(204, 204, 204); text-align: center; font-size: 16px;">
                                            <span v-for="(item,key) in value" style="box-sizing: border-box;">{{key}}</span></td>
                                    </tr>
                                    <tr role="row">
                                        <%--<th class="fn" scope="row">状态</th>
                                        <td colspan="4">{{potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskWarningState[index]}}</td>--%>
                                        <th class="fn" scope="row" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; font-weight: normal; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; color: rgb(102, 102, 102);">预警级别</th>
                                        <td colspan="4" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; vertical-align: top; line-height: 1.42857; border: 1px solid rgb(204, 204, 204); text-align: center; font-size: 16px;">
                                            <span style="box-sizing: border-box;">{{potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskWarningState[index]}}</span>

                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="main mt10">
                    <h4 class="tl f14 mb10 c666">心理测评曲线图：</h4>
                    <div class="mt30">
                        <div id="potentialRiskChart"></div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                            <img id="potentialRiskImg" width="1000px" height="400px" />
                        </div>
                    </div>
                </div>
                <div class="main main2 mt20">
                    <h4 class="fb tl f16 mt40 mb20 zhuse">自杀可能性评估问卷</h4>

                    <div class="overflow">
                        <div v-for="(prModel,index) in potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList">
                            <h4 class="tl f14 mb10 c666">作答时间：{{potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaCreateTime[index]}}</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr role="row">
                                        <%--  <th class="text-center" rowspan="1" colspan="1" style="width: 15%"></th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">总评</th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">绝望</th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">自杀意念</th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">负性自我评价</th>
                                        <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">敌意</th>--%>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 150px;"></th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 150px;">总评</th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 150px;">绝望</th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 200px;">自杀意念</th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 199px;">负性自我评价</th>
                                        <th class="text-center" colspan="1" rowspan="1" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; background-color: rgb(224, 224, 224); color: rgb(102, 102, 102); font-weight: normal; width: 150px;">敌意</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr role="row">
                                        <%-- <th class="fn" scope="row">得分</th>
                                        <td v-for="value in prModel">
                                            <span v-for="(item,key) in value">{{item}}</span>
                                        </td>--%>
                                        <th class="fn" scope="row" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; font-weight: normal; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; color: rgb(102, 102, 102);">得分</th>
                                        <td v-for="value in prModel" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; vertical-align: top; line-height: 1.42857; border-left: 1pt solid rgb(204, 204, 204); border-right: 1pt solid rgb(204, 204, 204); border-top: none; border-bottom: 1pt solid rgb(204, 204, 204); text-align: center; font-size: 16px;">
                                            <span v-for="(item,key) in value" style="box-sizing: border-box;">{{item}}</span>

                                        </td>
                                    </tr>
                                    <tr role="row">
                                        <%--  <th class="fn" scope="row">维度</th>
                                        <td v-for="value in prModel">
                                            <span v-for="(item,key) in value">{{key}}</span>
                                        </td>--%>
                                        <th class="fn" scope="row" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; font-weight: normal; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; color: rgb(102, 102, 102);">状态</th>
                                        <td v-for="value in prModel" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; vertical-align: top; line-height: 1.42857; border: 1px solid rgb(204, 204, 204); text-align: center; font-size: 16px;">
                                            <span v-for="(item,key) in value" style="box-sizing: border-box;">{{key}}</span></td>
                                    </tr>
                                    <tr role="row">
                                        <%-- <th class="fn" scope="row">状态</th>
                                        <td colspan="5">{{potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaWarningState[index]}}</td>--%>
                                        <th class="fn" scope="row" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; font-weight: normal; line-height: 1.42857; vertical-align: top; border: 1px solid rgb(204, 204, 204); font-size: 16px; color: rgb(102, 102, 102);">预警级别</th>
                                        <td colspan="5" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; vertical-align: top; line-height: 1.42857; border: 1px solid rgb(204, 204, 204); text-align: center; font-size: 16px;">
                                            <span style="box-sizing: border-box;">{{potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaWarningState[index]}}</span></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="main mt10">
                    <h4 class="tl f14 mb10 c666">心理测评曲线图：</h4>
                    <div class="mt30">
                        <div id="idioctoniaChart"></div>
                        <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; width: 100%; display: none" id="ContainerImages">
                            <img id="idioctoniaImg" width="1000px" height="400px">
                        </div>
                    </div>
                </div>
            </div>
            <div class="part mt50" id="heartConsultRecord">
                <div class="tc title">
                    <span class="f16 white">心理咨询记录</span>
                </div>
                <div class="overflow mt30">
                    <table class="table table-bordered" id="hearttable">
                        <thead>
                            <tr role="row">
                                <th class="text-center" rowspan="1" colspan="1" style="width: 10%">序号</th>
                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">结案时间</th>
                                <th class="text-center" rowspan="1" colspan="1" style="width: 30%;">咨询师</th>
                                <th class="text-center" rowspan="1" colspan="1" style="width: 30%;">状态</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr role="row" v-for="(item,index) in consultRecord">
                                <th class="fn" scope="row">{{index+1}}</th>
                                <td>{{item.CreateTime}}</td>
                                <td>{{item.CounselorName}}</td>
                                <td>{{item.Severity}}</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="part mt50 x_cygl_shjl">
                <div class="tc title">
                    <span class="f16 white">生活事件记录</span>
                </div>
                <div class="overflow mt30">
                    <table class="table table-bordered" v-for="item in dynamicEstimateRecord">
                        <tbody>
                            <tr>
                                <%--   <th>基本信息</th>--%>
                                <%-- <p>评估时间：{{item.DynamicEstimateDate}}</p>
                                    <p>危机等级：{{item.WarningState}}</p>
                                    <p>评估人：{{item.CounselorName}}</p>--%>
                                <th style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: middle; border: 1px solid rgb(204, 204, 204); font-size: 16px; font-weight: normal; background: rgb(221, 221, 221);">基本信息</th>
                                <td   class="tl" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; vertical-align: top; line-height: 1.42857; border: 1px solid rgb(204, 204, 204); font-size: 16px;">

                                    <p style="box-sizing: border-box; font-size: 16px; line-height: 25px; padding: 0px; margin: 0px; font-family: 微软雅黑;">
                                        评估时间：  {{item.DynamicEstimateDate}}
                                    </p>
                                    <p style="box-sizing: border-box; font-size: 16px; line-height: 25px; padding: 0px; margin: 0px; font-family: 微软雅黑;">
                                        危机等级： {{item.WarningState}}
                                    </p>
                                    <p style="box-sizing: border-box; font-size: 16px; line-height: 25px; padding: 0px; margin: 0px; font-family: 微软雅黑;">
                                        评估人：{{item.CounselorName}}
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <th style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; line-height: 1.42857; vertical-align: middle; border: 1px solid rgb(204, 204, 204); font-size: 16px; font-weight: normal; background: rgb(221, 221, 221);" width="150">评估详情</th>
                                <%-- <td class="tl words">{{item.DynamicEstimateContent}}--%>
                                <td class="tl words" style="box-sizing: border-box; margin: 0px; padding: 10px; font-family: 微软雅黑; text-align: center; vertical-align: top; line-height: 1.42857; border: 1px solid rgb(204, 204, 204); font-size: 16px;">{{item.DynamicEstimateContent}}</td>

                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row mt50 mb50">
                <div class="col-sm-12  col-xs-12 tc" id="operationBtn">
                    <button type="button" class="btn btn-sm x_btn f14" onclick="MemberArchivesExport()">导出</button>
                    <button type="button" class="btn btn-sm x_btn f15" onclick="Cancel()">取消</button>
                </div>
            </div>
        </div>
        <div style="position: fixed; right: 0px; bottom: 20px; margin-right: 40px; text-align: center;"
            class="text-center">
            <div id="goTop" style="right: 0px; bottom: 40px; position: fixed; margin-right: 35px; border: 2px solid rgb(204, 204, 204); cursor: pointer; border-radius: 70px; padding: 5px; width: 70px; height: 70px; text-align: center; line-height: 60px;">
                <img src="../../Img/goTop.png" style="width: 50px;">
            </div>
            <span>返回顶部</span>
        </div>
        <!-- main结束 -->
    </div>
    <script src="/js/jquery.metismenu.js"></script>
    <!-- 左侧下拉框 Js 结束 -->
    <!-- Bootstrap Js -->
    <script src="../../JS/vue.js"></script>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <script type="text/javascript">
        var navName = '/FunctionModular/ArchivesManagement/MemberArchives.aspx';
        $("#page-wrapper").addClass("x_wjgy");
        $("#page-wrapper").addClass("x_dagl");
        var userID = sessionStorage.getItem("UserID")
        var memberArchivesVue;
        var userRoleType = 0;
        var getUserRoleTypeParameter = {
            type: "get",
            dataType: "json",
            async: false,
            data: { UserID: userID },
            url: "/FunctionModular/AppointmentConsult/Ajax/AppointmentManagement.ashx?operationType=GetUserRoleTypeByUserID",
            callBack: function (result) {
                userRoleType = result.UserRoleType;
            }
        }
        //得到用户角色类型
        window.NewAJAX(getUserRoleTypeParameter);
        if (userRoleType < 3) {
            $("#heartConsultRecord").hide();
            $("#hearttable").hide();
        }
        function GetDynamicEstimateReportInfo() {
            var dynamicEstimateRecord;
            $.ajax({
                url: "/FunctionModular/RiskWarning/Ajax/DynamicEstimate.ashx",
                type: "post",
                dataType: "json",
                async: false,
                data: { userID: userID, operationType: "GetDynamicEstimateReportInfo" },
                success: function (data) {
                    dynamicEstimateRecord = data;
                }
            })
            return dynamicEstimateRecord;
        }
        function GetPersonalInfo() {
            var personalInfo;
            $.ajax({
                url: "/FunctionModular/RiskWarning/Ajax/DiscriminateEstimate.ashx?operationType=GetPersonalInfo",
                data: { userID: userID },
                async: false,
                dataType: "json",
                type: "post",
                success: function (data) {
                    personalInfo = data;
                }
            })
            return personalInfo;
        }
        function InitialPotentialRiskEstimateAndIdioctoniaEstimateResult() {
            var potentialRiskEstimateAndIdioctoniaEstimateResult;
            $.ajax({
                url: "/FunctionModular/RiskWarning/Ajax/DiscriminateEstimate.ashx",
                type: "post",
                dataType: "json",
                data: { operationType: "InitialPotentialRiskEstimateAndIdioctoniaEstimateResult", userID: userID },
                async: false,
                success: function (data) {
                    potentialRiskEstimateAndIdioctoniaEstimateResult = data;
                }
            })
            return potentialRiskEstimateAndIdioctoniaEstimateResult;
        }
        function GetConsultRecord() {
            var consultRecord;
            $.ajax({
                url: "Ajax/MemberArchives.ashx",
                type: "post",
                async: false,
                data: { userID: userID, operationType: "GetConsultRecord" },
                dataType: "json",
                success: function (data) {
                    consultRecord = data;
                }
            })
            return consultRecord;
        }
        memberArchivesVue = new Vue({
            el: ".content",
            data: {
                potentialRiskEstimateAndIdioctoniaEstimateResult: eval(InitialPotentialRiskEstimateAndIdioctoniaEstimateResult()),
                personalInfo: GetPersonalInfo(),
                consultRecord: GetConsultRecord(),
                dynamicEstimateRecord: GetDynamicEstimateReportInfo()
            }
        })
        var potentialRiskSeries = [];
        var potentialRiskCategories = ['症状自评', '自尊', '社会支持'];
        for (var h = 0; h < potentialRiskCategories.length; h++) {
            var seriesChild = {};
            seriesChild.name = potentialRiskCategories[h];
            seriesChild.lineColor = '#' + Math.floor(Math.random() * 0xffffff).toString(16);
            seriesChild.data = [];
            potentialRiskSeries.push(seriesChild);
        }
            for (var i = 0; i < memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList.length; i++) {

                for (var j = 0; j < memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList[i].length; j++) {
                    if (j == 0) {
                        for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList[i][j]) {
                            potentialRiskSeries[0].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList[i][j][key]);
                        }
                    }
                    if (j == 1) {
                        for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList[i][j]) {
                            potentialRiskSeries[1].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList[i][j][key]);
                        }
                    }
                    if (j == 2) {
                        for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList[i][j]) {
                            potentialRiskSeries[2].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList[i][j][key]);
                        }
                    }
                    
                }
            }
        
        var potentialRiskChart = Highcharts.chart('potentialRiskChart', {
            title: {
                text: '潜在风险历次作答记录'
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                title: {
                    text: "作答次数"
                },
                allowDecimals: false,
            },
            yAxis: {
                title: {
                    text: "分数"
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },
            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 1
                }
            },
            series: potentialRiskSeries,
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
        });
        var idioctoniaSeries = [];
        var idioctoniaCategories = ['总评', '绝望', '自杀意念', '负性自我评价', '敌意'];
        for (var i = 0; i < idioctoniaCategories.length; i++) {
            var seriesChild = {};
            seriesChild.name =idioctoniaCategories[i];
            seriesChild.lineColor = '#' + Math.floor(Math.random() * 0xffffff).toString(16);
            seriesChild.data = [];
            idioctoniaSeries.push(seriesChild);
        }
        for (var i = 0; i < memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList.length; i++) {
            
            for (var j = 0; j < memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i].length; j++) {
                if(j==0){
                    for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j]) {
                        idioctoniaSeries[0].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j][key]);
                    }
                }
                if (j == 1) {
                    for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j]) {
                        idioctoniaSeries[1].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j][key]);
                    }
                }
                if (j == 2) {
                    for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j]) {
                        idioctoniaSeries[2].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j][key]);
                    }
                }
                if (j == 3) {
                    for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j]) {
                        idioctoniaSeries[3].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j][key]);
                    }
                }
                if (j == 4) {
                    for (var key in memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j]) {
                        idioctoniaSeries[4].data.push(memberArchivesVue.$data.potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList[i][j][key]);
                    }
                }
            }
            
        }
        var idioctoniaSeriesChart = Highcharts.chart('idioctoniaChart', {
            title: {
                text: '自杀可能性历次作答记录'
            },
            subtitle: {
                text: ''
            },
            xAxis: {
                title: {
                    text: "作答次数"
                },
                allowDecimals: false,
            },
            yAxis: {
                title: {
                    text: "分数"
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle'
            },
            plotOptions: {
                series: {
                    label: {
                        connectorAllowed: false
                    },
                    pointStart: 1
                }
            },
            series: idioctoniaSeries,
            responsive: {
                rules: [{
                    condition: {
                        maxWidth: 500
                    },
                    chartOptions: {
                        legend: {
                            layout: 'horizontal',
                            align: 'center',
                            verticalAlign: 'bottom'
                        }
                    }
                }]
            }
        });
        var sdelay = 0;
        $(document).on("click", "#goTop", function () {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        });
        function MemberArchivesExport() {
            var svgPotentialRisk = $($(".highcharts-container")[0]).html();
            var svgIdioctonia = $($(".highcharts-container")[1]).html();
            var potentialRiskImg = new Image();
            var idioctoniaImg = new Image();
            potentialRiskImg.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgPotentialRisk)));
            idioctoniaImg.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgIdioctonia)));
            var firstBase64 = potentialRiskImg.src;
            var secondBase64 = idioctoniaImg.src;
            idioctoniaImg.onload = function () {
                        $("#ContainerImage").show();
                        $("#ContainerImages").show();
                //$("#sss").attr("src", base64);
                $("#potentialRiskImg").attr("src", firstBase64);
                $("#idioctoniaImg").attr("src", secondBase64);
                        $("#potentialRiskImg").show();
                        $("#idioctoniaImg").show();
                        $("#potentialRiskChart").hide();
                        $("#idioctoniaChart").hide();
                        if(userRoleType<3){
                            $("#heartConsultRecord").hide();
                        }
                        $("#operationBtn").hide();
                        $("#memberArchiveExport").wordExport("成员档案");
                        $("#operationBtn").show();
                        $("#potentialRiskImg").hide();
                        if(userRoleType<3){
                            $("#heartConsultRecord").show();
                        }
                        $("#idioctoniaImg").hide();
                        $("#potentialRiskChart").show();
                        $("#idioctoniaChart").show();
                        $("#ContainerImage").hide();
                        $("#ContainerImages").hide();
            };
            //var svgPotentialRisk = $($(".highcharts-container")[0]).html();
            //var svgIdioctonia = $($(".highcharts-container")[1]).html();
            //$.ajax({
            //    url: "Ajax/MemberArchives.ashx",
            //    type: "post",
            //    data: { operationType: "SaveImage", svg1: svgPotentialRisk, svg2: svgIdioctonia },
            //    async: false,
            //    success: function (data) {
            //        if (data != null && data != "") {
            //            var result = eval('(' + data + ')');
            //            var ImageSrc1 = "Ajax/image/" + result.svg1;
            //            var ImageSrc2 = "Ajax/image/" + result.svg2;
            //            $("#ContainerImage").show();
            //            $("#ContainerImages").show();
            //            $("#potentialRiskImg").show();
            //            $("#idioctoniaImg").show();
            //            $("#potentialRiskImg").attr("src", ImageSrc1);
            //            $("#idioctoniaImg").attr("src", ImageSrc2);
            //            $("#potentialRiskChart").hide();
            //            $("#idioctoniaChart").hide();
            //            $("#operationBtn").hide();
            //            $("#memberArchiveExport").wordExport("成员档案");
            //            $("#operationBtn").show();
            //            $("#potentialRiskImg").hide();
            //            $("#idioctoniaImg").hide();
            //            $("#potentialRiskChart").show();
            //            $("#idioctoniaChart").show();
            //            $("#ContainerImage").hide();
            //            $("#ContainerImages").hide();
            //        }
            //    }
            //});
        }
        function Cancel() {
            window.location.href = "MemberArchives.aspx";
        }
        var str1 = $(".words").html();                     
        if (str1.indexOf("●") >=0) {
          
            var str2 = str1.replace(/●/g, '</br>●');
            $(".words").html(str2)
        }
        
    </script>
</asp:Content>
