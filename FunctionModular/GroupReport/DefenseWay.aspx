<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DefenseWay.aspx.cs" Inherits="CrisisInterfere.FunctionModular.GroupReport.DefenseWay" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="Css/Presentation.css" rel="stylesheet" />
    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <style>
        .groupbox {
            margin: 15px;
            border: thin solid #09C;
            padding: 10px;
            border-radius: 5px;
        }

        .grouptitle {
            display: block;
            margin-top: -24px;
            margin-left: 20px;
            width: 150px;
            text-align: center;
            background-color: #09C;
        }

        .groupfoot {
            display: block;
            margin-bottom: -24px;
            float: right;
            margin-right: 20px;
            width: 80px;
            text-align: center;
            background-color: RGB(245,248,253);
        }
    </style>
    <div style="text-align: right; margin-top: 10px; margin-right: 0px; margin-bottom: 5px;">
        <button type="button" class="btn  btn-sm" style="background-color: orange; color: white" onclick="Export()">
            导出
        </button>
        <button type="button" class="btn btn-primary btn-sm" onclick="Exits()">
            返回
        </button>
        <button type="button" class="btn btn-info" style="display: none" onclick="CreateWord()">测试</button>
    </div>
    <div class="col-md-12 col-sm-12" id="export" style="padding-left: 0px; padding-right: 0px;">
        <div class="well" style="background-color: #999;">

            <div class="row" style="margin-left: auto; margin-right: auto; background-color: #FFF;">
                <div class="col-md-12 col-sm-12" style="margin-top: 8%; text-align: center;">
                    <h4 style="font-size: 22px; font-weight: 700;" id="ReportTitle">团体报告测试</h4>
                </div>

                <div class="col-md-12 col-sm-12">

                    <div style="color: #000; border-color: #ddd; font-weight: bold;">
                        一、基本信息
                    </div>
                    <div id="basicInfo" style="margin-top: 15px;"></div>
                    <table id="reportBasicInfo" class="table table-striped table-bordered table-hover">
                    </table>
                </div>


                <div class="col-md-12 col-sm-12">

                    <div style="color: #000; border-color: #ddd; font-weight: bold;">
                        二、测验简介
                    </div>
                    <div id="testIntroduce" style="margin-top: 15px;"></div>

                </div>
                <div class="col-md-12" style="margin-top: 15px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        三、人员分布
                    </div>
                    <div id="AnalysisCon" style="margin-top: 15px;">
                        <div class="table-responsive" style="text-align: left;">
                            <div id='peopleSpreadChart' style="min-width: 400px; height: 400px"></div>
                            <img id="secondImage" style="display: none" width="600px" height="400px" />
                            <table class="table table-striped table-bordered table-hover" style="text-align: center; min-width: 400px;" id="peopleSpread">
                                <tr>
                                    <td>维度名称</td>
                                    <td>状态名称</td>
                                    <td>分布</td>
                                    <td>预警</td>
                                </tr>
                                <tr>
                                    <td rowspan="4" style="vertical-align: middle">总评
                                    </td>

                                </tr>
                                <tr>
                                    <td>不成熟防御机制</td>
                                    <td id="notRipeRate"></td>
                                    <td rowspan="7" style="vertical-align: middle">0%</td>
                                </tr>
                                <tr>
                                    <td>中间型防御机制</td>
                                    <td id="midRipeRate"></td>
                                </tr>
                                <tr>
                                    <td>成熟防御机制</td>
                                    <td id="ripeRate"></td>
                                </tr>
                                <tr>
                                    <td rowspan="4" style="vertical-align: middle">掩饰性
                                    </td>
                                </tr>
                                <tr>
                                    <td>掩饰性较低</td>
                                    <td id="coverStateLRate"></td>
                                </tr>
                                <tr>
                                    <td>掩饰性一般</td>
                                    <td id="coverStateMRate"></td>
                                </tr>
                                <tr>
                                    <td>掩饰性较高</td>
                                    <td id="coverStateHRate"></td>
                                </tr>
                                <%--<tr>
                                        <td rowspan="3">总评</td>
                                        <td>总评高</td>
                                        <td >20%</td>
                                        <td rowspan="3">50%</td>
                                    </tr>
                                    <tr>
                                        <td>总评中</td>
                                        <td>50%</td>
                                        
                                        
                                    </tr>
                                    <tr>
                                        
                                        <td>总评低</td>
                                        <td>30%</td>
                                        
                                    </tr>--%>
                            </table>

                            <div id="container">
                            </div>
                        </div>
                    </div>
                </div>



            </div>




        </div>
    </div>

    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <script type="text/javascript" src="../../JS/layer.js"></script>
    <script>
        var navName = '/FunctionModular/GroupReport/GroupReport.aspx';
        var amountTitle;
        LoadReportTitle();
        LoadTestIntroduce();

        var peopleSpreadChart;
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
        function LoadReportTitle() {
            var grID = GetQueryString('grID');
            $.ajax({
                url: "Ajax/DefenseWay.ashx?OperationType=GetReportTitle",
                type: "GET",
                data: {
                    grID: grID
                },
                async: false,
                dataType: "text",
                success: function (data) {
                    $("#ReportTitle").text(data);
                    amountTitle = data;
                }
            })
        }
        function LoadTestIntroduce() {
            var grID = GetQueryString('grID');
            $.ajax({
                url: "Ajax/DefenseWay.ashx?OperationType=GetAmountIntroduce",
                type: "GET",
                data: { grID: grID },
                dataType: "text",
                success: function (data) {
                    $("#testIntroduce").text(data);
                }
            })
        }
        GetRateChartData();
        LoadReportBasicInfo();
        function GetRateChartData() {
            var grID = GetQueryString('grID');
            var notRipe = 0;
            var midRipe = 0;
            var ripe = 0;
            var notRipeRate = 0;
            var midRipeRate = 0;
            var ripeRate = 0;
            var coverStateH = 0;
            var coverStateM = 0;
            var coverStateL = 0;
            var coverStateHRate = 0;
            var coverStateMRate = 0;
            var coverStateLRate = 0;
            
            $.ajax({
                url: "Ajax/DefenseWay.ashx?OperationType=GetUsersDimensionScore",
                type: "GET",
                dataType: "json",
                data:{grID:grID},
                async: false,
                success: function (data) {
                    for (var i = 0; i < data.length; i++) {
                        var maxScore = data[i]["ScoreList"][0];
                        var mark = 0;
                        for (var j = 1; j < data[i]["ScoreList"].length - 1; j++)
                        {
                            if (maxScore < data[i]["ScoreList"][j])
                            {
                                maxScore = data[i]["ScoreList"][j];
                                mark = j;
                            }
                        }
                        if(mark==0)
                        {
                            notRipe++;
                        }
                        if(mark==1)
                        {
                            midRipe++;
                        }
                        if(mark==2)
                        {
                            ripe++;
                        }
                    }
                    notRipeRate = notRipe / data.length;
                    notRipeRate = notRipeRate.toFixed(4);
                    midRipeRate = midRipe / data.length;
                    midRipeRate = midRipeRate.toFixed(4);
                    ripeRate = ripe / data.length;
                    $("#notRipeRate").text(notRipe+'人'+'('+notRipeRate * 100 + '%'+')');
                    $("#midRipeRate").text(midRipe+'人'+'('+midRipeRate * 100 + '%'+')');
                    $("#ripeRate").text(ripe+'人'+'('+ripeRate * 100 +'%'+')');
                    for (var i = 0; i < data.length; i++) {
                        var score = data[i]["ScoreList"][3];
                        if(score>6)
                        {
                            coverStateH++;
                        }
                        if(score>=4&&score<=6)
                        {
                            coverStateM++;
                        }
                        if(score<4)
                        {
                            coverStateL++;
                        }
                    }
                    coverStateHRate = coverStateH / data.length;
                    coverStateHRate = coverStateHRate.toFixed(4);
                    coverStateMRate = coverStateM / data.length;
                    coverStateMRate = coverStateMRate.toFixed(4);
                    coverStateLRate = coverStateL / data.length;
                    coverStateLRate = coverStateLRate.toFixed(4);
                    $("#coverStateHRate").text(coverStateH+'人'+'('+coverStateHRate * 100 + '%'+')');
                    $("#coverStateMRate").text(coverStateM+'人'+'('+coverStateMRate * 100 + '%'+')');
                    $("#coverStateLRate").text(coverStateL+'人'+'('+coverStateLRate * 100 + '%'+')');
                    var seriesArray = [];
                    var dataArray = [[parseFloat(notRipeRate), -1], [parseFloat(midRipeRate), -1], [parseFloat(ripeRate), -1], [-1, parseFloat(coverStateL)], [-1, parseFloat(coverStateMRate)], [-1, parseFloat(coverStateHRate)]];
                    for (var i = 0; i < dataArray.length; i++) {
                        seriesArray.push({"color":"RGB(169,169,169)","data":dataArray[i]});
                    }
                    $("#peopleSpreadChart").highcharts({
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: '分布比率'
                        },
                        xAxis: {
                            categories: ["总评","掩饰性"],
                            crosshair: true
                        },
                        yAxis: {
                            min: 0,
                            title: {
                                text: '比例'
                            },
                            labels: {
                                formatter: function () { return this.value * 100 + "%"; }
                            }
                        },
                        legend: { enabled: false },

                        plotOptions: {
                            column: {
                                dataLabels: {
                                    enabled: true,
                                    formatter: function () { if (this.y == "-1") return ""; else { return '(' + (this.point.series.index + 1) + ")" + this.y * 100 + "%"; } },
                                    style: {
                                        'fontSize': '10px'
                                    },
                                    useHTML: false,
                                    allowOverlap: true
                                },
                                pointPadding: 0.1,
                                borderWidth: 0,
                            }
                        },

                        //series: data,
                        series: seriesArray,

                        //exporting: {
                        //    enabled: true,
                        //    url: "/FunctionModular/GroupReport/Ajax/GroupReportPresentation.ashx?OperationType=SaveImage",
                        //}
                    });
                }
            });
        }
        function LoadReportBasicInfo() {
            var grID = GetQueryString('grID');
            $.ajax({
                url: "Ajax/DefenseWay.ashx?OperationType=LoadReportBasicInfo",
                type: "GET",
                dataType: "text",
                data: { grID: grID },
                async: false,
                success: function (data) {
                    $("#reportBasicInfo").append(data);
                }
            })
        }
        function printHtml(html) {
            document.body.innerHTML = html;
            window.print();
        }
        function onprint() {
            var html = $("#Print").html();
            printHtml(html);
        }
        function Export() {
            var svgSecond = $(".highcharts-container").html();

            var secondImage = new Image();

            secondImage.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgSecond)));
            secondImage.onload = function () {

                var secondBase64 = secondImage.src;
                //$("#sss").attr("src", base64);

                $("#secondImage").attr("src", secondBase64);
                $("#secondImage").show();
                $("#peopleSpreadChart").hide();
                $("#export").wordExport(amountTitle);
                $("#secondImage").hide();
                $("#peopleSpreadChart").show();

            };
        }
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
        function DeleteCreatedImg() {
            $.ajax({
                url: "/FunctionModular/GroupReport/Ajax/GroupReportPresentation.ashx?OperationType=DeleteCreatedImg",
                type: "post",
                async: false,
                dataType: "text",
                success: function (data) {
                    if (data == "True") {
                        layer.msg("报告导出成功", { icon: 1, time: 2000 })
                    }
                }
            })
        }
        $(".highcharts-button-box").attr("display", "none")
        var linkArray = $(".highcharts-credits");
        for (var i = 0; i < linkArray.length; i++) {
            $(linkArray[i]).attr("display", "none");
        }

        //退出
        function Exits() {
            // 设置返回页码参数
            var param = fnGetUrlParam("p");
            var usr = "GroupReport.aspx";
            if (param != "" && param != "1") {
                usr = usr + "?p=" + param;
            }

            window.location.href = usr;
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
    </script>
</asp:Content>
