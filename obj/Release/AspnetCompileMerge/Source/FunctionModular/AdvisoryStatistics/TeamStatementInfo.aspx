<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TeamStatementInfo.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AdvisoryStatistics.TeamStatementInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
    <script src="../../JS/layer.js"></script>
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />

    <div class="col-md-12 col-xs-12 col-sm-12">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                    <li><a href="AdvisoryStatistics.aspx">咨询统计</a></li>
                    <li>团体咨询</li>
                    <li>查看</li>
                </ol>
            </div>
        </div>
        <div id="Print" class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1" style="border: 1px #E3E3E3 solid; margin-bottom: 30px; background-color: #fcfcfc;">
            <div class="col-md-12">
                <div class="caption" style="font-size: 28px; color: #333; font-weight: bold; text-align: center; padding-top: 10px; padding-bottom: 20px;">
                    <label id='labelCaption'></label>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; overflow-x: auto; margin-bottom: 30px;">
                <div class="table-responsive">
                    <table class="table table-bordered" id="tabelGrid" style="border-spacing: 0px; border: none; border-collapse: collapse;">
                        <tbody id="tableBody">
                            <tr>
                                <th colspan="1" style="background-color: #fcfcfc; font-weight: normal; font-size: 18px; text-align: left; border: none">报表编号：<span id="StatementNumber"></span>
                                </th>
                                <th colspan="1" style="background-color: #fcfcfc; font-weight: normal; font-size: 18px; text-align: right; border: none">制作人：<span id="CreatePerson"></span>
                                </th>
                                <th colspan="1" style="background-color: #fcfcfc; font-weight: normal; font-size: 18px; text-align: right; border: none">制作时间：<span id="CreateTime"></span>
                                </th>
                            </tr>
                            <tr>
                                <th colspan="1" style="background-color: #f5f5f5; text-align: center; font-weight: bold; font-size: 18px; border: 1px solid #ddd;">接访次数</th>
                                <th colspan="2" style="text-align: center; font-size: 16px; font-weight: normal; border: 1px solid #ddd;" id="LiberatingNumber"></th>
                            </tr>
                            <tr>
                                <th style="width: 20%; background-color: #f5f5f5; text-align: center; font-weight: bold; font-size: 18px; border: 1px solid #ddd; word-break: break-all;">团体主题</th>
                                <th style="width: 20%; background-color: #f5f5f5; text-align: center; font-weight: bold; font-size: 18px; border: 1px solid #ddd; word-break: break-all;">问题类型</th>
                                <th style="width: 20%; background-color: #f5f5f5; text-align: center; font-weight: bold; font-size: 18px; border: 1px solid #ddd; word-break: break-all;">咨询师</th>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 30px; float: left; padding-left: 0px; padding-right: 0px;">
                    <div class="col-md-12 col-sm-12 col-xs-12" style="float: left; padding-left: 0px;">
                        <span style="font-weight: bold; font-size: 24px; float: left;">结果统计图：</span>
                    </div>
                    <div class="col-md-offset-3 col-md-9 col-sm-9 col-xs-9" style="margin-top: 25px;" id="HeightChart">
                        <div id="AdvisoryType" style="float: left; margin-right: 50px; margin-bottom: 20px; width: 223px; height: 200px; padding-left: 0px; padding-right: 0px; border: solid 1px #dddddd">
                        </div>
                        <div id="QuestionType" style="float: left; width: 223px; height: 200px; margin-bottom: 20px; padding-left: 0px; padding-right: 0px; border: solid 1px #dddddd">
                        </div>
                    </div>
                    <table class="col-md-offset-3" id="chartTable" style="display: none;">
                        <tr>
                            <td>
                                <img id="imagescr1" style="float: left; margin-right: 50px; width: 223px; height: 200px; padding-left: 0px; padding-right: 0px; border: solid 1px #dddddd;" /></td>
                            <td>
                                <img id="imagescr2" style="float: left; width: 223px; height: 200px; padding-left: 0px; padding-right: 0px; border: solid 1px #dddddd;" /></td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" id="subject" style="display: none; margin-top: 10px; float: left; padding-left: 0px; padding-right: 0px;">
                    <div class="row" style="margin-left: 0px;">
                        <label style="font-weight: bold; font-size: 24px; float: left;">分析与建议：</label>
                    </div>
                    <div class="row" id="AnalyzeSubject_Div" style="padding-left: 0px; word-break: break-all; margin-left: 0px; margin-right: 0px;">
                        <div class="col-md-12 col-sm-12 col-xs-12 ">
                            <textarea id="AnalyzeSubject" maxlength="4000" class="col-md-12 col-sm-12 col-xs-12" style="resize: none;"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 col-xs-12 col-sm-12">
            <div class="modal-footer text-center" style="border: none">
                <button id="saveMask" class="btn btn-sm" style="background-color: orange; color: white">保存</button>
                <button id="cancelMask" class="btn btn-sm btn-blues" style="color: white; margin-left: 10px;" onclick="GoBack()">返回</button>
            </div>
        </div>
    </div>
    <script src="../../JS/LinqToJS/linq.min.js"></script>
    <script src="../../JS/Highcharts/highcharts.js"></script>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script>
        var navName = '/FunctionModular/AdvisoryStatistics/AdvisoryStatistics.aspx';


        /*--------获取URL中的参数-------*/
        function GetQueryString(key) {
            // 获取参数
            var url = window.location.search;
            // 正则筛选地址栏
            var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
            // 匹配目标参数
            var result = url.substr(1).match(reg);
            //返回参数值
            return result ? decodeURIComponent(result[2]) : null;
        }

        var id = GetQueryString("ID");//个体咨询档案ID
        var number = GetQueryString("number");//个体咨询档案编号
        var titleName = GetQueryString("TitleName");//报表标题
        var nowID = '';//当前报表的ID
        var lookId = GetQueryString("lookId");//查看报表时的ID
        var code = GetQueryString("code");//报表编码

        function LookAdvisory() {
            $.ajax({
                type: "POST",
                url: "Ajax/AdvisoryStatistics.ashx?operationType=look",
                data: { id: lookId },
                success: function (msg) {

                    layer.load(0, { shade: 0.5 });

                    var result = eval("(" + msg + ")");
                    nowID = lookId;
                    if (result.RoleName != "超级管理员")
                        $("#subject").css("display", "");
                    var temp = eval("(" + result.Result + ")");
                    InitMain(temp, result.Content, result.Number, result.CreateUserName, result.CreateTime);
                    titleName = result.Content;
                    $("#AnalyzeSubject_Div").empty();
                    $("#AnalyzeSubject_Div").append('<div class="col-md-11 col-sm-11 col-xs-11 col-md-offset-1" style="float:right">' +
                        '<label id="AnalyzeSubject" style="text-align:left;font-size:16px;margin-left:15px;">' + result.AnalyzeSubject + '</label>' +
                        '</div>');
                    $("#saveMask").text("导出");

                    layer.closeAll();
                }
            });
        }

        var result;

        if (lookId != null)
            LookAdvisory();
        else
            InitData();

        //初始化界面
        function InitData() {

            $.ajax({
                type: "POST",
                url: "Ajax/AdvisoryStatistics.ashx",
                data: { operationType: "TeamStatementInfo", id: id, title: titleName },
                success: function (msg) {
                    if (msg == -1) {
                        layer.alert("报表生成失败！", {
                            skin: "layui-layer-lan",
                            closeBtn: 0
                        });
                        return;
                    }
                    layer.load(0, { shade: 0.5 });

                    result = eval("(" + msg + ")");

                    nowID = GetQueryString("nowId");

                    var role = result[1];//身份
                    InitMain(result[0], titleName, code, result[2], result[3]);

                    //if (role != "管理员") {
                    //    $("#AnalyzeSubject").attr("disabled", "disabled");
                    //    $("#saveMask").attr("disabled", "disabled");
                    //    $("#saveMask").css("background", "#333");
                    //    $("#subject").css("display","none");
                    //} else {
                    $("#subject").css("display", "");
                    $("#AnalyzeSubject").removeAttr("disabled");
                    $("#saveMask").removeAttr("disabled");
                    $("#saveMask").css("background", "orange");
                    //}
                    layer.closeAll();
                }
            });

        };

        function InitMain(result, titleName, statementNumber, createPerson, createTime) {
            var list = result;

            $("#labelCaption").text(titleName);//报表标题
            $("#StatementNumber").text(statementNumber);//报表编号
            $("#CreatePerson").text(createPerson);//创建人
            $("#CreateTime").text(createTime.replace(/\T/g, " "));//创建时间
            $("#LiberatingNumber").text(list.data.length);//接访次数
            var trContent = "";//生成的数据行

            //给表格创建行
            for (var i = 0; i < list.data.length; i++) {
                var color = '#f5f5f5';
                if ((i + 1) % 2 == 0)
                    color = '#f5f5f5';
                else
                    color = '#ffffff';

                trContent += '<tr style="background: ' + color + '">' +
                    '<th style="text-align: center;font-size: 16px;font-weight: normal;border: 1px solid #ddd;word-break:break-all;">' + list.data[i][2] + '</th>' +
                    '<th style="text-align: center;font-size: 16px;font-weight: normal;border: 1px solid #ddd;word-break:break-all;">' + list.data[i][4] + '</th>' +
                    '<th style="text-align: center;font-size: 16px;font-weight: normal;border: 1px solid #ddd;word-break:break-all;">' + list.data[i][3] + '</th>' +
                '</tr>';
            }
            $("#tabelGrid").append(trContent);

            var zixunType = new Array();//咨询方式
            var QueType = new Array();//问题类型
            //先给数组添加name值，不去重复
            for (var i = 0; i < list.data.length; i++) {
                QueType[QueType.length] = { name: list.data[i][4], y: 0 };
                if (list.data[i][5] != "") {
                    var tempjson = eval(list.data[i][5]);
                    for (var j = 0; j < tempjson.length; j++) {
                        var zixun = tempjson[j].Contents[0].ConsultWay;
                        if (zixun == 1 || zixun == 2)
                            zixun = "在线";
                        else
                            zixun = "面谈";
                        zixunType[zixunType.length] = { name: zixun, y: 0 };
                    }
                    //if (tempjson.length > 0) {
                    //    var zixun = tempjson[0].Contents[0].ConsultWay;
                    //    if (zixun == 1 || zixun == 2)
                    //        zixun = "在线";
                    //    else
                    //        zixun = "面谈";
                    //    zixunType[zixunType.length] = { name: zixun, y: 0 };
                    //}
                }
            }
            //去重复
            QueType = Enumerable.From(QueType).Distinct("x=>x.name").ToArray();

            //根据name值筛选对应的数量
            for (var i = 0; i < QueType.length; i++) {
                QueType[i].y = Enumerable.From(list.data).Where("x=>x[4]=='" + QueType[i].name + "'").ToArray().length;
            }
            for (var i = 0; i < zixunType.length; i++) {
                zixunType[i].y = Enumerable.From(zixunType).Where("x=>x.name=='" + zixunType[i].name + "'").ToArray().length;
            }
            //筛选完之后去重复
            zixunType = Enumerable.From(zixunType).Distinct("x=>x.name").ToArray();

            //咨询方式
            CreateChart(zixunType, '咨询方式', 'AdvisoryType');

            //问题类型
            CreateChart(QueType, '问题类型', 'QuestionType');

            $("#HeightChart").find(".highcharts-background").attr("fill", "#f5f5f5");
        }
        //创建饼状图
        function CreateChart(content, titleCon, idName) {

            content = eval(content);

            var chart = {
                width: 220,
                height: 198,
                plotShadow: false
            };
            var title = {
                text: titleCon
            };
            var tooltip = {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            };
            var plotOptions = {
                pie: {
                    allowPointSelect: false,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true
                    },
                    showInLegend: true
                }
            };
            var series = [{
                type: 'pie',
                name: '占比',
                data: [
                ]
            }];
            var json = {};

            json.chart = chart;
            json.title = title;
            json.tooltip = tooltip;
            json.series = series;
            json.series[0] = new Object();
            json.series[0].type = 'pie';
            json.series[0].name = "占比";

            for (var i = 0; i < content.length; i++) {
                if (i == 0)
                    json.series[0].data = [
                    {
                        name: content[i].name,
                        y: content[i].y
                    }];
                else
                    json.series[0].data[i] =
               {
                   name: content[i].name,
                   y: content[i].y
               };
            }

            json.plotOptions = plotOptions;
            $('#' + idName).highcharts(json);
        }
        //返回
        function GoBack() {
            window.location.href = navName;
        }
        //保存分析建议
        $(document).on("click", "#saveMask", function () {
            if ($("#saveMask").text() == "保存") {
                var text = $("#AnalyzeSubject").val();
                $.ajax({
                    type: "POST",
                    url: "Ajax/AdvisoryStatistics.ashx?operationType=update",
                    data: { id: nowID, text: text },
                    success: function (msg) {
                        if (msg == -1) {
                            layer.alert("保存失败！", {
                                skin: "layui-layer-lan",
                                closeBtn: 0
                            }, function () {
                                GoBack();
                            });

                        } else {
                            layer.alert("保存成功！", {
                                skin: "layui-layer-lan",
                                closeBtn: 0
                            }, function () {
                                GoBack();
                            });

                        }
                    }
                });
            } else {
                //导出
                $(".highcharts-container").each(function (i) {
                    var svgXml = $(".highcharts-container").eq(i).html();

                    var image = new Image();
                    image.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgXml))); //给图片对象写入base64编码的svg流
                    var base64 = image.src;
                    $("#imagescr" + (i + 1)).attr("src", base64);
                });

                var allcount = "";
                var numbers = "";
                var z = "";
                var allcount = GetQueryString("Allcount");
                var numbers = GetQueryString("Numbers");
                if (allcount != "0" && allcount != null && allcount != "") {
                    z = parent.getZip();
                }

                var temp = numbers == null ? "" : "_" + numbers;

                //$("#chartTable").show();
                //$("#HeightChart").hide();
                var timeout = window.setTimeout(function () {
                    $("#chartTable").show();
                    $("#HeightChart").hide();//1, function () {
                    $("#Print").wordExport(titleName + temp, allcount, numbers, z, "咨询统计批量导出");
                    $("#chartTable").hide();
                    $("#HeightChart").show();
                    window.clearTimeout(timeout);
                }, 500);
            }
        });
    </script>
</asp:Content>
