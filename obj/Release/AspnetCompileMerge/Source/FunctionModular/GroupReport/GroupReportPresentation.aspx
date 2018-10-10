<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GroupReportPresentation.aspx.cs" Inherits="CrisisInterfere.FunctionModular.GroupReport.GroupReportPresentation" %>

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

                <div class="col-md-12 col-sm-12">
                    <div style="color: #000; margin-top: 15px; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        三、团队平均状态
                    </div>
                    <div id="" style="margin-top: 15px;">
                        <div class="table-responsive" style="text-align: left;">
                            <div id="averageScoreChart" style="min-width: 400px;"></div>
                            <img id="firstImage" style="display: none" width="600px" height="400px" />
                            <table class="table table-striped table-bordered table-hover" id="showScore" style="min-width: 400px;">
                                <thead>
                                    <tr>
                                        <th>项目</th>

                                        <th>平均值(M)</th>
                                        <th>标准差(S)</th>
                                        <th>最大值</th>
                                        <th>最小值</th>
                                    </tr>
                                </thead>

                            </table>

                        </div>
                    </div>
                </div>
                <div class="col-md-12" style="margin-top: 25px;">

                   <%-- <h1 class="Presentation-header" style="font-size: 20px; margin-left: 5%; margin-right: 5%;">京师博仁 <small data-name="pageHead" style="float: right; line-height: 1.5;">中学生考试焦虑影响因素问卷</small>
                    </h1>--%>

                </div>

                <%--<div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        一、测验简介
                    </div>
                    <div id="Introduce" style="margin-top: 15px;"></div>

                </div>--%>
                <div class="col-md-12" style="margin-top: 30px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        四、人员分布
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
                                    <td>预警比例</td>
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

        var averageScoreChart;
        var peopleSpreadChart;
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
        /*------------根据量表ID查询量表基本信息--------------*/
        function GetTestIntroduce() {




        }


        var Request = new Object();
        Request = GetRequest();
        /*获取浏览器网址参数*/
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }

        function LoadReportTitle() {
            var grID = GetQueryString('grID');
            $.ajax({
                url: "Ajax/GroupReportPresentation.ashx?OperationType=GetReportTitle",
                type: "GET",
                data: {
                    grID: grID
                },
                async: true,
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
                url: "Ajax/GroupReportPresentation.ashx?OperationType=GetAmountIntroduce",
                type: "GET",
                data: { grID: grID },
                dataType: "text",
                success: function (data) {
                    $("#testIntroduce").text(data);
                }
            })
        }
        DrawPeopleSpreadTable();
        DrawGroupAverageStateTable();
        GetAverageChartData();
        GetRateChartData();
        LoadReportBasicInfo();
        function DrawGroupAverageStateTable() {
            var grID = GetQueryString('grID');
            $.ajax({
                url: "Ajax/GroupReportPresentation.ashx?OperationType=InitiAverageStateTable",
                type: "GET",
                data: { grID: grID },
                dataType: "text",
                async: true,
                success: function (data) {
                    $("#showScore").append(data);
                }
            })
        }
        function DrawPeopleSpreadTable() {
            var grID = GetQueryString('grID');
            $.ajax({
                url: "Ajax/GroupReportPresentation.ashx?OperationType=InitialPeopleSpread",
                type: "GET",
                data: { grID: grID },
                dataType: "text",
                async: false,
                success: function (data) {
                    $("#peopleSpread").append(data);
                }
            })
        }
        function GetAverageChartData() {

            $("[data-name=pageHead]").text(amountTitle)
            $.ajax({
                url: "Ajax/GroupReportPresentation.ashx?OperationType=GetAverageChartData",
                type: "GET",
                dataType: "json",
                async: true,
                success: function (data) {
                    var categories = data["name"].split(',');
                    var serieslist = [{
                        name: "维度",
                        data: data["data"]
                    }];
                    averageScoreChart = new Highcharts.Chart({
                        chart: {
                            renderTo: 'averageScoreChart',
                            defaultSeriesType: 'bar'
                        },
                        title: {
                            text: amountTitle,
                            x: -20 //center
                        },
                        xAxis: {
                            categories: categories,
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
                        series: serieslist,
                        //exporting: {
                        //    enabled: true,
                        //    url: "/FunctionModular/GroupReport/Ajax/GroupReportPresentation.ashx?OperationType=SaveImage",
                        //}
                    });
                }
            })
        }
        function GetRateChartData() {
            var categories = [];
            $.ajax({
                url: "Ajax/GroupReportPresentation.ashx?OperationType=GetCategory",
                type: "GET",
                async: true,
                dataType: "json",
                success: function (data) {
                    $.each(eval(data), function (index, item) {
                        categories.push(item);
                    })
                }
            })
            $.ajax({
                url: "Ajax/GroupReportPresentation.ashx?OperationType=GetRateData",
                type: "GET",
                dataType: "json",
                async: false,
                success: function (data) {
                    var dimensionDataArray = new Array();

                    var realDataArray = new Array();
                    $.each(eval(data), function (index, item) {
                        dimensionDataArray.push(item["data"]);
                    })
                    var maxCount = dimensionDataArray[0].length;
                    for (var i = 0; i < dimensionDataArray.length; i++) {
                        if (maxCount < dimensionDataArray[i].length) {
                            maxCount = dimensionDataArray[i].length;
                        }
                    }
                    for (var i = 0; i < maxCount; i++) {
                        var tempArray = [];
                        for (var j = 0; j < dimensionDataArray.length; j++) {
                            if (dimensionDataArray[j][i] == undefined) {
                                tempArray.push(-1);
                                continue;
                            }
                            else {
                                tempArray.push(dimensionDataArray[j][i])
                                continue;
                            }
                        }
                        realDataArray.push({ "data": tempArray, "color": "RGB(166,166,166)" });
                    }
                    $("#peopleSpreadChart").highcharts({
                        chart: {
                            type: 'column'
                        },
                        title: {
                            text: '分布比率'
                        },
                        tooltip: {
                            valueDecimals: 2,
                        },
                        xAxis: {
                            categories: categories,
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
                                    formatter: function () { if (this.y == "-1") return ""; else { return '(' + (this.point.series.index + 1) + ")" + (this.y * 100).toFixed(2) + "%"; } },
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
                        series: realDataArray,

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
                url: "Ajax/GroupReportPresentation.ashx?OperationType=LoadReportBasicInfo",
                type: "GET",
                dataType: "text",
                data: { grID: grID },
                async: true,
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
            var svgFirst = $($(".highcharts-container")[0]).html();
            var svgSecond = $($(".highcharts-container")[1]).html();
            var firstImage = new Image();
            var secondImage = new Image();
            firstImage.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgFirst)));
            secondImage.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgSecond)));
            var firstBase64 = firstImage.src;
            var secondBase64 = secondImage.src;
            secondImage.onload = function () {

                //$("#sss").attr("src", base64);
                $("#firstImage").attr("src", firstBase64);
                $("#secondImage").attr("src", secondBase64);
                $("#firstImage").show();
                $("#secondImage").show();
                $("#averageScoreChart").hide();
                $("#peopleSpreadChart").hide();
                $("#export").wordExport(amountTitle);
                $("#firstImage").hide();
                $("#secondImage").hide();
                $("#averageScoreChart").show();
                $("#peopleSpreadChart").show();

            };

            //DeleteCreatedImg();


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
