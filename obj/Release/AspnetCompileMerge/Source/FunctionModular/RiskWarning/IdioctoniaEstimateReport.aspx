<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="IdioctoniaEstimateReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.IdioctoniaEstimateReport" %>

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
    <div class="row">
        <div class="col-md-1 pull-right">
            <button class="btn btn-sm" id="idioctoniaEstimateReportExport">报告导出</button>
        </div>
    </div>
            <div class="content">
                <!-- main -->
                <div class="x_reports">
                    <h3 class="fb tc mt5 mb30">《自杀可能性量表》测评报告</h3>
                    <div class="part">
                        <div class="tc title">
                            <span class="f16 white">基本信息</span>
                        </div>
                        <div class="main main1 mt20">
                            <table style="width: 100%; height: 100px">
                                <tbody>
                                    <tr>
                                        <td>登&nbsp; 录&nbsp;名：<span>{{reportInfo.UserName}}</span></td>
                                        <td>姓<strong class="pl30 fn">名</strong>：<span>{{reportInfo.LoginName}}</span></td>
                                        <td>年<strong class="pl30 fn">龄</strong>：<span>{{reportInfo.Age}}</span></td>
                                        <td>性<strong class="pl30 fn">别</strong>：<span>{{reportInfo.Sex}}</span></td>
                                    </tr>
                                    <tr>
                                        <td>部<strong class="pl30 fn">门</strong>：<span>{{reportInfo.Department}}</span></td>
                                        <td>手&nbsp; 机&nbsp;号：<span>{{reportInfo.CellPhone}}</span></td>
                                        <td>邮<strong class="pl30 fn">箱</strong>：<span>{{reportInfo.Email}}</span></td>
                                        <td id="warningTd">预警级别：<span class="red1">{{reportInfo.WarningState}}</span></td>
                                    </tr>
                                    <tr>
                                        <td>测试类型：<span>{{reportInfo.TestType}}</span></td>
                                        <td colspan="3">测试时间：<span>{{reportInfo.TestDate}}</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="part mt50">
                        <div class="tc title">
                            <span class="f16 white">测试结果</span>
                        </div>
                        <div class="main main2 mt20">
                            <h4 class="nf tc mb30"></h4>
                            <div id="dimensionScore" style="min-width: 100%; height: 400px"></div>
                            <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; width: 100%; display: none" id="ContainerImage">                                             
                        <img id="imagescr" width="600px" height="400px">
                    </div>
                        </div>
                        <div class="main main2 mt20">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr role="row">
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%"></th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">总评</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">绝望</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">自杀意念</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">负性自我评价</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">敌意</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr role="row">
                                                <th class="fn" scope="row">得分</th>
                                                <td v-for="value in idioctoniaEstimateResultList">
                                                    <span v-for="(item,key) in value">{{item}}</span>
                                                </td>
                                            </tr>
                                            <tr role="row">
                                                <th class="fn" scope="row">维度</th>
                                                <td v-for="value in idioctoniaEstimateResultList">
                                                    <span v-for="(item,key) in value">{{key}}</span>
                                                </td>
                                            </tr>
                                            <tr role="row">
                                                <th class="fn" scope="row">预警级别</th>
                                                <td colspan="5">{{warningState}}</td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                    </div>
                    
                    <div class="part mt50">
                        <div class="tc title">
                            <span class="f16 white">结果描述</span>
                        </div>
                        <div class="main main3 mt20">
                            <dl class="f16" v-for="(item) in dimensionExplain">
                                <dt class="c333 pb10 mt30">
                                   {{item.DimensionName}}</dt>
                                <dd class="c666">{{item.NormExplain}}</dd>
                            </dl>
                        </div>
                    </div>
                    <div class="part m50" id="suggestionDiv" style="margin-top:40px;">
                        <div class="tc title">
                            <span class="f16 white">处理建议</span>
                        </div>
                        <div class="main main4 mt20" v-show="suggestion!=''" onkeyup="txtNameCheck(this,999)" onblur="txtNameCheck(this,999)">
                            <p class="c666" style="word-wrap: break-word;word-break: break-all;">{{suggestion}}</p>
                        </div>
                        <div class="main main4 mt20 text-center" id="suggestionHide" v-show="suggestion==''">
                            <textarea id="suggestion" rows="10" cols="100" maxlength="999"></textarea>
                        </div>
                    </div>
                    <div class="row mt50 mb50 text-center" id="btnGroup">
                        <div class="col-sm-6  col-xs-6 text-right" v-show="disposalState=='未处理'">
                            <button type="button" class="btn btn-sm x_btn f14 addSuggestion">确定</button>
                        </div>
                        <div class="col-sm-6  col-xs-6  text-left" id="cancelDiv">
                            <button type="button" class="btn btn-sm x_btn1 f14" onclick="goBack()">取消</button>
                        </div>
                    </div>
                </div>
                <!-- main结束 -->
            </div>
        <!-- JS Scripts-->
        <!-- 左侧下拉框 Js -->
        <script src="../../JS/vue.js"></script>
        <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
        <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
        <script src="../../JS/Highcharts/exporting.js"></script>
     <script src="../../JS/word/FileSaver.js"></script>
        <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
        
        <script type="text/javascript">
            var userRoleType = 0;
            var userID = 0;//当前系统用户ID
            var getUserRoleTypeParameter = {
                type: "get",
                dataType: "json",
                async: false,
                url: "/FunctionModular/AppointmentConsult/Ajax/AppointmentManagement.ashx?operationType=GetUserRoleTypeAndUserID",
                callBack: function (result) {
                    userRoleType = result.UserRoleType;
                    userID = result.UserID;
                }
            }
            //得到用户角色类型
            window.NewAJAX(getUserRoleTypeParameter);
            $(function () {
                if (userRoleType == 3) {
                    $("#warningTd").hide();
                    $("#suggestionHide").hide();
                }
            })
            var navName = '/FunctionModular/RiskWarning/IdioctoniaEstimate.aspx';
            var pageMark = sessionStorage.getItem("PageMark");
            if (pageMark == "查看结果") {
                navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
            }
            if (pageMark == "个体报告") {
                navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
            }
            $("#page-wrapper").addClass("x_wjgy");
            $("#page-wrapper").addClass("x_dagl");
            var belongToCode = sessionStorage.getItem("BelongToCode");
            var reportInfo = JSON.parse(sessionStorage.getItem("ReportInfo"));
            if (reportInfo == undefined) {
                $.ajax({
                    url: "Ajax/PotentialRiskEstimate.ashx",
                    type: "post",
                    data: { operationType: "GetPotentialRiskEstimateReportInfoByBelongToCode", belongToCode: belongToCode },
                    async: false,
                    dataType: "json",
                    success: function (data) {
                        reportInfo = data;
                    }
                })
            }
            var de;
            function GetDimensionExplain() {
                var dimensionExplain;
                $.ajax({
                    url: "Ajax/IdioctoniaEstimate.ashx?operationType=GetDimensionExplain",
                    type: "post",
                    dataType: "json",
                    async: false,
                    data: { belongToCode: belongToCode },
                    success: function (data) {
                        dimensionExplain = data;
                    }
                })
                return dimensionExplain;
            }
            function GetSuggestion() {
                var suggestion;
                $.ajax({
                    url: "Ajax/PotentialRiskEstimate.ashx?operationType=GetSuggestion",
                    type: "post",
                    dataType: "text",
                    data: { belongToCode: belongToCode },
                    async: false,
                    success: function (data) {
                        suggestion = data;
                    }
                })
                return suggestion;
            }
            function GetIdioctoniaEstimateResultList() {
                var model;
                $.ajax({
                    url: "Ajax/IdioctoniaEstimate.ashx",
                    type: "post",
                    dataType: "json",
                    data: { operationType: "GetIdioctoniaEstimateResult", belongToCode: belongToCode },
                    async: false,
                    success: function (data) {
                        model = data;
                    }
                })
                return model;
            }
            function GetWarningState() {
                var model;
                $.ajax({
                    url: "Ajax/IdioctoniaEstimate.ashx",
                    type: "post",
                    dataType: "text",
                    data: { operationType: "GetWarningState", belongToCode: belongToCode },
                    async: false,
                    success: function (data) {
                        model =  data;
                    }
                })
                return model;
            }
            de = new Vue({
                el: ".content",
                data: {
                    reportInfo: reportInfo,
                    dimensionExplain: GetDimensionExplain(),
                    suggestion: GetSuggestion(),
                    disposalState: reportInfo.DisposalState,
                    idioctoniaEstimateResultList: GetIdioctoniaEstimateResultList(),
                    warningState:GetWarningState()
                }
            })
            var dimensionScore;
            GetAverageChartData();
            function GetAverageChartData() {

                $.ajax({
                    url: "Ajax/IdioctoniaEstimate.ashx",
                    type: "post",
                    data: { operationType: "GetDimensionScoreData", belongToCode: belongToCode },
                    dataType: "json",
                    async: true,
                    success: function (data) {
                        var categories = data.DimensionName;
                        var serieslist = [];
                        for (var i = 0; i < data.length; i++) {
                            var dimensionScoreJson = { name: [i], data: [i] };
                            serieslist.push(dimensionScoreJson);
                        }
                        dimensionScore = new Highcharts.Chart({
                            chart: {
                                renderTo: 'dimensionScore',
                                defaultSeriesType: 'bar'
                            },
                            title: {
                                text: "",
                                x: -20 //center
                            },
                            xAxis: {
                                categories: data.DimensionName,
                                tickmarkPlacement: 'on',
                                lineWidth: 1,
                                labels: {
                                    style: {
                                        'fontSize': '14px'
                                    }
                                },
                            },
                            yAxis: {
                                gridLineInterpolation: 'polygon',
                                lineWidth: 1,

                                title: {
                                    text: '分数 (分)'
                                },
                                labels: {
                                    style: {
                                        'fontSize': '14px'
                                    }
                                },
                            },
                            tooltip: {
                                valueSuffix: '分'
                            },
                            plotOptions: {
                                series: {
                                    pointWidth: 10 //柱子的宽度值 单位为px
                                }
                            },
                            exporting: { enabled: false },//隐藏导出图片  
                            credits: { enabled: false },//隐藏highcharts的站点标志
                            legend: {
                                layout: 'vertical',
                                align: 'right',
                                verticalAlign: 'middle',
                                borderWidth: 0,
                                enabled: false,
                            },
                            series: [{ data: data.DimensionScore }],
                            //exporting: {
                            //    enabled: true,
                            //    url: "/FunctionModular/GroupReport/Ajax/GroupReportPresentation.ashx?OperationType=SaveImage",
                            //}
                        });
                    }
                })
            }
            GetDimensionNormExplain();
            function GetDimensionNormExplain() {
                $.ajax({
                    url: "",
                    type: "post",
                    dataType: "json",
                    async: false,
                    data: { belongToCode: belongToCode, operationType: "GetDimensionExplain" },
                    success: function (data) {
                        $.each(data, function (item, index) {
                            var html = '<dt class="c333 pb10 mt30">' +
                                                + item.DimensionName + '</dt>' +
                                                '<dd class="c666">' + item.NormExplain + '</dd>';
                            $("#showNormExplain").append(html);
                        })
                    }
                })
            }
            $(document).on("click", ".addSuggestion", function () {
                if ($("#suggestion").val() == ""&&userRoleType==3) {
                    //layer.alert("请输入建议");
                    window.location.href = "/FunctionModular/HeartEvaluation/ViewResult.aspx";
                    return;
                }
                if ($("#suggestion").val() == "") {
                    if (pageMark == "查看结果") {
                        navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
                    }
                    if (pageMark == "个体报告") {
                        navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
                    }
                    window.location.href = navName;
                    return;
                }
                $.ajax({
                    url: "Ajax/PotentialRiskEstimate.ashx?operationType=AddSuggestion",
                    type: "post",
                    data: { suggestion: $("#suggestion").val(), belongToCode: belongToCode },
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.State) {
                            layer.msg("添加建议成功", { icon: 6, time: 2000 }, function () {
                                window.location.href = "IdioctoniaEstimate.aspx";
                            });
                        }
                    }
                })
            })
            function goBack() {
                if (pageMark == "查看结果") {
                    navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
                }
                if (pageMark == "个体报告") {
                    navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
                }
                window.location.href = navName;
            }
            changeClass();
            function changeClass() {
                if (reportInfo.DisposalState != '未处理') {
                    $('#cancelDiv').removeClass('col-sm-6  col-xs-6 text-left')
                    $('#cancelDiv').addClass('col-sm-12  col-xs-12 text-center')
                }
            }
            //判断名称格式与长度
            function txtNameCheck(data, length) {
                var txt = $("#suggestion").val();
                var le = parseInt(length);
                if (txt.length > le) {
                    txt = txt.substring(0, le);
                    $("#suggestion").val(txt);
                }
            }
            $(document).on("click", "#idioctoniaEstimateReportExport", function () {
                var svgFirst;

                chartFirst = $('#dimensionScore').highcharts();
                svgFirst = chartFirst.getSVG();
                $.ajax({
                    url: "Ajax/IdioctoniaEstimate.ashx",
                    type: "post",
                    data: { operationType: "SaveImage", svg: svgFirst },
                    dataType: "text",
                    success: function (data) {
                        var ImageSrc = "Ajax/image/" + data;
                        var image = new Image();
                        image.src = ImageSrc;
                        image.onload = function () {
                            
                            var base64 = getBase64Image(image);                          
                            $("#imagescr").attr("src", base64);
                            $("#suggestionHide").hide();
                            $("#btnGroup").hide();
                            $(".content").wordExport("自杀可能性评估报告");
                            $("#suggestionHide").show();
                            $("#btnGroup").show();
                        }
                        
                    }
                });
               
            })
            function getBase64Image(img) {
                var canvas = document.createElement("canvas");
                canvas.width = img.width;
                canvas.height = img.height;
                var ctx = canvas.getContext("2d");
                ctx.drawImage(img, 0, 0, img.width, img.height);
                var ext = img.src.substring(img.src.lastIndexOf(".") + 1).toLowerCase();
                var dataURL = canvas.toDataURL("image/" + ext);
                return dataURL;
            }
        </script>
</asp:Content>
