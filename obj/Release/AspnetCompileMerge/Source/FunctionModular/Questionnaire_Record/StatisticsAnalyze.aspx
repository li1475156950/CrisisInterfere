<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="StatisticsAnalyze.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.StatisticsAnalyze" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <script src="../../JS/layer.js"></script>

    <div class="col-md-12 col-xs-12 col-sm-12" style="padding-left:0px;padding-right:0px;">
        <div class="row">
            <div class="col-md-12">
                <ol class="breadcrumb">
                    <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="Questionnaire_Manage.aspx">问卷调查</a></li>
                    <li><a href="SurveyResult.aspx">调查结果</a></li>
                    <li>统计分析</li>
                </ol>
            </div>
        </div>

        <div class="col-md-12 col-xs-12 col-sm-12" style="padding-left:0px;padding-right:0px;">
            <div id="Print" class="col-md-10 col-md-offset-1 col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-1" 
                style="border: 1px #E3E3E3 solid; background-color: #fcfcfc;padding-left:0px;padding-right:0px;">
                <div class="col-md-12" style="padding-left:0px;padding-right:0px;">
                    <div class="caption" style="font-size: 24px; color: #333; font-weight: bold; text-align: center; margin-top: 30px;">
                        <label id='labelCaption'>标题</label>
                    </div>
                    <div class="caption" style="font-size: 14px; color: #333; text-align: center;">
                        <label id='SumNum'>答卷共计<span id="num">2</span>份</label>
                        <label id="SumAvg" style="display: none" data-name="TG_AvgScore">，总平均分：<span id="average">0</span>分。</label>
                    </div>
                    <div class="caption" style="font-size: 14px; color: #666; text-align: center;" id="pour">
                        <label>（注：填空题和简答题不参与统计分析）</label>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" id="ContentMain" style="padding-left:0px;padding-right:0px;">
                </div>
            </div>
        </div>
        <div class="col-md-12 col-xs-12 col-sm-12">
            <div class="modal-footer text-center" style="border: none" id="bottom">
                <button id="export" class="btn btn-sm" style="background-color: orange; color: white" onclick="Export()">导出</button>
                <button id="cancelMask" class="btn btn-sm btn-blues" style="color: white; margin-left: 85px;" onclick="GoBack()">返回</button>
            </div>
        </div>
    </div>


    <script src="../../JS/LinqToJS/linq.min.js"></script>
    <script>

        var navName = '/FunctionModular/Questionnaire_Record/SurveyResult.aspx';

        var Q_Code = GetQueryString("Q_Code");//问卷编码
        var Anwser_Num = GetQueryString("num");//答卷份数
        var SumScore = GetQueryString("score");//作答总得分
        var Name = GetQueryString("name");//问卷名称
        var tgCount = new Array;//当前问卷除了填空题和简答题之外的题干编码集合

        var scoreIsNull = '';//用来判断所有单选/多选题中是否都没有设置分值

        BindData();

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

        //初始化界面，并绑定数据
        function BindData() {
            //加载层
            layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2

            //设置标题
            $("#labelCaption").text(Name);

            //设置答卷份数和总平均分
            $("#num").text(Anwser_Num);
            var average = parseFloat(SumScore) / parseFloat(Anwser_Num);
            $("#average").text(average.toFixed(2));
            var WJ_result;
            //遍历题干和题支
            $.ajax({
                type: "POST",
                url: "Ajax/Questionnaire_Manage.ashx?operationType=look",
                data: { quesCode: Q_Code },
                success: function (msg) {
                    if (msg != "") {
                        var result = eval("(" + msg + ")");
                        WJ_result = result;
                        InitPage(result);
                        $.ajax({
                            type: "POST",
                            url: "Ajax/Questionnaire_Manage.ashx?operationType=getResponse",
                            data: { qcode: Q_Code },
                            success: function (msg) {
                                if (msg != "") {
                                    var result = eval("(" + msg + ")");
                                    Calculate(result);

                                    SetAvgAndProportion(result, WJ_result);
                                    //所有工作都做完之后，关闭加载层
                                    layer.closeAll();
                                }
                            }
                        });
                    }
                }
            });

        }
        //遍历界面上的元素
        function InitPage(result) {

            var index_temp = 0;//累计进度条的索引

            $("[name=Content]").empty();
            $("[name=Content]").hide();

            for (var i = 0; i < result.length; i++) {

                var type = result[i].TG_Info.TG_Type;
                var tgContent = result[i].TG_Info.TG_Content;

                if (type == 1 && result[i].TG_Info.TG_Score != "")
                    scoreIsNull += result[i].TG_Info.TG_Score;

                if (type == 1)
                    tgContent = tgContent + "（多选）";
                else if (type == 2)
                    tgContent = tgContent.replace(/@____;/g, "____ ") + "（下划线部分为空缺）";

                tgCount[tgCount.length] = result[i].TG_Info.TG_Code;

                var content = '';
                if (type != 0 && type != 1) {
                    content += '<div id="Content_' + (i + 1) + '" name="Content" class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 30px;">';
                    content += ' <div class="table-responsive">';
                    content += '  <div class="row" style="margin-left: 0px;margin-right: 0px;">';
                    content += '        <label style="font-size: 16px; color: #333;font-weight:bold;word-break:break-all;">&nbsp;&nbsp;' + result[i].TG_Info.TG_Sort + "." + tgContent + '</label>';
                    content += '    </div>';
                    content += '  </div>';
                    content += ' </div>';
                }

                else {
                    content += '<div id="Content_' + (i + 1) + '" name="Content" class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 30px;">';
                    content += ' <div class="table-responsive">';
                    content += '  <div class="row" style="margin-left: 0px;margin-right: 0px;">';
                    content += '     <table id="' + result[i].TG_Info.TG_Code + '" class="table table-bordered" style="width:100%;height:100%;border-spacing: 0px; border: none; border-collapse: collapse;">';
                    content += '<tr class="row">';
                    content += '   <td colspan="3" style="word-break:break-all;text-align: left; border: solid 1px #ffffff;border-bottom-color:#ddd;">';
                    content += '        <label style="font-size: 16px; color: #333">' + result[i].TG_Info.TG_Sort + "." + tgContent + '</label>';
                    content += ' <span id=\"' + result[i].TG_Info.TG_Code + '_avg\" style="font-size: 16px; color: #333;display: none;"data-name="TG_AvgScore">（本题平均分0分）</span></div>';
                    content += '</td></tr>';
                    content += '        <tr class="row" style="font-weight: bold; color: #666; height: 40px; text-align: center; font-size: 15px; background-color: #f5f5f5;">';
                    content += '       <td style="width:33.33%;word-break:break-all;border: 2px solid #ddd;" class="col-md-4">选项</td>';
                    content += '        <td style="width:33.33%;word-break:break-all;border: 2px solid #ddd;" class="col-md-4">小计</td>';
                    content += '         <td style="width:33.33%;word-break:break-all;border: 2px solid #ddd;" class="col-md-4">比例</td>';
                    content += '        </tr>';

                    var tzList = result[i].TZ_Info;
                    if (tzList.length > 0) {
                        for (var j = 0; j < tzList.length; j++) {

                            if (type == 0 && tzList[j].TZ_Score != "")
                                scoreIsNull += tzList[j].TZ_Score;

                            content += '         <tr class="row" id="' + tzList[j].TZ_Code + '" style="color: #666; height: 40px; text-align: center; font-size: 15px; background-color: #ffffff;">';
                            content += '             <td style="word-break:break-all;border: 2px solid #ddd;text-align:left;" class="col-md-4" style="text-align:left">' + tzList[j].SerialNumber + "、" + tzList[j].TZ_Content + '</td>';
                            content += '             <td style="word-break:break-all;border: 2px solid #ddd;" data-score="' + tzList[j].TZ_Score + '" class="col-md-4">0</td>';
                            content += '            <td style="word-break:break-all;border: 2px solid #ddd;" class="col-md-4">';
                            //content += '                <div name="progressTD">';
                            //content += '                    <img style="display:none;margin-bottom: 0px; padding-left: 0px; padding-right: 0px;" class="col-md-offset-1 col-md-10 "/>';
                            //content += '                    <div name="progress" id="progressDiv_'+j+'" style="margin-bottom: 0px; padding-left: 0px; padding-right: 0px;" class="progress progress-striped active col-md-offset-1 col-md-10 ">';
                            //content += '                         <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">';
                            //content += '                         <span style="float: right" data-name="0">0%</span>';
                            //content += '                         </div>';
                            //content += '                    </div>';

                            //content += '                </div>';

                            content += '<div name="progressTD">';
                           // content += '<img style="display:none;margin-bottom: 0px; padding-left: 0px; padding-right: 0px;"/>';
                            content += '<div name=progress id="progressDiv_' + index_temp + '" style="background-color:#f5f5f5;border-radius:10px; position: relative; width: 200px; border: 1px solid #cccccc; padding: 1px;margin:0 auto;"> ';
                            content += '    <div style=" border-radius:10px;display: block; position: relative; ' +
                                'background-image:-webkit-linear-gradient(45deg,rgba(255, 255, 255, .15) 25%,transparent 25%,' +
                                'transparent 50%,rgba(255, 255, 255, .15) 50%,rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);' +
                                 'background-image:-moz-linear-gradient(45deg,rgba(255, 255, 255, .15) 25%,transparent 25%,' +
                                'transparent 50%,rgba(255, 255, 255, .15) 50%,rgba(255, 255, 255, .15) 75%, transparent 75%, transparent);' +
                                'background-size: 40px 40px;background:rgb(108, 161, 221);' +
                                             'color: #666666; height: 20px;  line-height: 20px;width: 0%;"> ';
                            content += '   </div>';
                            content += '<span contenteditable="false" style="float:right;position: relative;margin-top:-21px;text-align: center; font-weight: bold;/*margin-left:160px;*/word-break:normal;">0%</span>';
                            content += '</div>';
                            content += '</div>';

                            content += '             </td>';
                            content += '         </tr>';

                            index_temp++;
                        }
                    }
                    content += '         <tr class="row" id="" style="color: #999; height: 40px; text-align: left; font-size: 15px; background-color: #ffffff;">';
                    content += '<td colspan="3" style="word-break:break-all;border: 2px solid #ddd;">' +
                                '<div><label>本题作答人数：<span id="' + result[i].TG_Info.TG_Code + '_AnwserNum">0</span></label></div>'
                              + '</td>';
                    content += '</tr>';
                    content += '     </table>';
                    content += '    </div>';
                    content += '  </div>';
                    content += ' </div>';
                }

                $("#ContentMain").append(content);
            }
            if (scoreIsNull != '')
                showAvg();
        }
        //根据得到的数据，进行计算，并显示在界面上
        function Calculate(result) {
            var data = result.data;
            if (data.length > 0) {
                for (var i = 0; i < data.length; i++) {
                    var record = data[i];
                    var json = eval("(" + record[0] + ")");
                    var path = record[1].split(",");
                    path = Enumerable.From(path).Distinct("x=>x").ToArray();
                    if (json != "") {
                        //循环作答记录
                        for (var j in json) {
                            var tzCode = json[j];
                            if (tzCode[tzCode.length - 1] == "0" || tzCode[tzCode.length - 1] == "1") {
                                var tgText = "0";
                                var tzText = "0";

                                //设置对应题干的作答次数
                                tgText = $("#" + j + "_AnwserNum").text();
                                tgText = parseInt(tgText) + 1;
                                $("#" + j + "_AnwserNum").text(tgText);
                                //设置题支的被选中次数
                                for (var tz = 0; tz < tzCode.length - 1; tz++) {
                                    tzText = $("#" + tzCode[tz]).find("td").eq(1).text();
                                    tzText = parseInt(tzText) + 1;
                                    $("#" + tzCode[tz]).find("td").eq(1).text(tzText);
                                }
                            }
                        }
                    }
                }

            }
        }
        //循环设置题支占比和题干的平均分
        function SetAvgAndProportion(AnwResult, result) {
            for (var i = 0; i < tgCount.length; i++) {
                var tgType;//题干类型
                var trueTZ = new Array();//多选题的正确选项
                var trueTZ_Code = new Array();//多选题的正确选项的编码
                var tgscore = 0;
                for (var t = 0; t < result.length; t++) {
                    if (result[t].TG_Info.TG_Code == tgCount[i]) {
                        tgType = result[t].TG_Info.TG_Type;
                        if (tgType == "1") {
                            trueTZ = result[t].TG_Info.TG_TrueAnswer.split(',');
                            for (var y = 0; y < trueTZ.length; y++) {
                                var ti = parseInt((trueTZ[y]));
                                trueTZ_Code[trueTZ_Code.length] = result[t].TZ_Info[ti].TZ_Code;
                            }
                            trueTZ_Code[trueTZ_Code.length] = "1";
                        }
                        tgscore = result[t].TG_Info.TG_Score;
                        t = result.length;
                    }
                }
                var score = 0;//题干的得分                
                var sumCount = $("#" + tgCount[i] + "_AnwserNum").text();

                $("#" + tgCount[i]).find("tr").each(function (i) {
                    if (i > 1) {
                        //设置比例进度条
                        if (i != 0 && $(this).find("td").length > 1) {
                            var count = $(this).find("td").eq(1)[0].innerHTML;
                            //如果是单选题则进行分值计算
                            if (tgType == 0) {
                                //得到题支分值
                                var temp = $(this).find("td").eq(1).attr("data-score");
                                //判断分值不为空并且被选中次数不为0
                                if (temp != undefined && temp != "" && count != "0")
                                    score += parseFloat(temp) * parseInt(count);
                            }

                            if (sumCount != 0 && count != 0) {
                                //设置题支被选中的占比进度条的值
                                var proportion = parseFloat(count) / parseFloat(sumCount) * 100;

                                $(this).find("[name=progress]").find("div").attr("aria-valuenow", parseInt(proportion));
                                $(this).find("[name=progress]").find("div").css("width", parseInt(proportion) + "%");
                                $(this).find("[name=progress]").find("span").attr("data-name", parseInt(proportion));
                                $(this).find("[name=progress]").find("span").text(parseInt(proportion) + "%");
                            }
                        }
                    }
                });
                if (tgType == 0 && sumCount != "0") {
                    score = parseFloat(score) / parseFloat(sumCount);
                    score = score == 0 ? 0 : score.toFixed(2);
                }
                else if (tgType == 1 && sumCount != "0") {
                    //计算多选题的平均分
                    if (tgType == 1 && trueTZ.length > 0) {
                        var score = 0;
                        var data = AnwResult.data;
                        for (var d = 0; d < data.length; d++) {
                            var json = eval("(" + data[d][0] + ")");
                            for (var j in json) {
                                if (j == tgCount[i]) {
                                    if (json[j].sort().toString() == trueTZ_Code.sort().toString()) {
                                        score += parseFloat(tgscore);
                                    }
                                }
                            }
                        }

                        score = score / parseFloat(sumCount);
                        score = score == 0 ? 0 : score.toFixed(2);

                    }
                }
                else
                    score = 0;
                $("#" + tgCount[i] + "_avg").text("（本题平均分" + score + "分）");
            }
        }
        //显示所有的平均分
        function showAvg() {
            $("[data-name=TG_AvgScore]").show();
        }
        //返回
        function GoBack() {
            window.location.href = navName;
        }
        //导出
        function Export() {
            var list = $("[name=progressTD]");

            var objectArr = new Array;//保存对象
            var objectArr2 = new Array;//保存子对象div
            var objectArr3 = new Array;//保存子对象span

            //for (var i = 0; i < list.length; i++) {
            //    //1.将div转成svg  
            //    var id = $("[name=progress]").eq(i)[0].getAttribute("id");

            //    var divContent = document.getElementById(id).innerHTML;
            //    var data = //"data:image/svg+xml," +
            //    "<svg xmlns='http://www.w3.org/2000/svg'  width='100%' height='30px'>" +
            //    "<foreignObject width='100%' height='100%'>" +
            //    "<div xmlns='http://www.w3.org/1999/xhtml'>" +
            //    divContent +
            //    "</div>" +
            //    "</foreignObject>" +
            //    "</svg>";
            //    list[i].childNodes[0].src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(data)));

            //    list[i].childNodes[0].style.display = "inline";
            //    //先保存进度条的html代码，在清空，避免导出之后样式的影响
            //    objectArr[objectArr.length] = $("[name=progress]").eq(i);
            //    objectArr2[objectArr2.length] = $("[name=progress]").eq(i).find("div")[0];
            //    objectArr3[objectArr3.length] = $("[name=progress]").eq(i).find("span")[0];

            //    $("[name=progress]").eq(i).empty();
            //}
            var fileName = $("#labelCaption").text();

            $("#Print").wordExport(fileName);

            for (var i = 0; i < list.length; i++) {
                list[i].childNodes[0].style.display = "none";
                //将之前保存的进行还原
                $("[name=progressTD]").eq(i).append(objectArr[i]);
                $("[name=progress]").eq(i).append(objectArr2[i]);
                $("[name=progress]").eq(i).append(objectArr3[i]);

                $("[name=progress]").eq(i)[0].style.display = "";
            }
        }

    </script>

</asp:Content>
