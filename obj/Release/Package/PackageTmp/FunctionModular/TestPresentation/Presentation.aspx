<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Presentation.aspx.cs" Inherits="CrisisInterfere.FunctionModular.TestPresentation.Presentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="Css/Presentation.css" rel="stylesheet" />
    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />
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

    <div class="col-md-12 col-sm-12">
        <div class="well" style="background-color: #999;">

            <div class="row" style="margin-left: auto; margin-right: auto; background-color: #FFF; height: 900px; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12" style="margin-top: 30%; text-align: center;">
                    <h4 style="font-size: 22px; font-weight: 700;" id="ReportTitle">《中学生考试焦虑影响因素问卷》测评报告</h4>
                </div>
                <div class="col-md-12 col-sm-12" style="margin-top: 30%; text-align: center;">
                    <div style="width: 30%; margin-right: auto; margin-left: auto; text-align: left; min-width: 250px;">
                        编号：20125421<br />
                        姓名：张某某<br />
                        性别：女<br />
                        出生日期：2016-11-01<br />
                        完成日期：2016-11-02<br />
                    </div>
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; height: 900px; width: 70%; min-width: 320px;">
                <div class="col-md-12" style="margin-top: 25px;">

                    <h1 class="Presentation-header" style="font-size: 20px; margin-left: 5%; margin-right: 5%; min-width: 310px;">京师博仁 <small style="float: right; line-height: 3;">中学生考试焦虑影响因素问卷</small>
                    </h1>

                </div>

                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        一、测验简介
                    </div>
                    <div id="Introduce" style="margin-top: 15px;"></div>

                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        二、有效性分析
                    </div>
                    <div id="AnalysisCon" style="margin-top: 15px;">
                        <div class="col-md-12 col-sm-12  col-xs-12 ">
                            <div class="table-responsive" style="text-align: left;">
                                <table class="table table-striped table-bordered table-hover" id="Explain_Table">
                                    <thead>
                                        <tr>
                                            <th>分析项目</th>
                                            <th>被试结果</th>
                                            <th>有效作答时长</th>
                                            <th>结果分析</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>作答时间</th>
                                            <td>
                                                <label id="Actual_Time">&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                                            <td>
                                                <label id="Standard_Time">&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                                            <td>
                                                <label id="ResultCon">&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        三、测试结果
                    </div>

                    <div id="AnalysisChart" style="margin-top: 15px;">图表先放一放，找出合适的在生成</div>

                </div>

            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; height: 900px; width: 70%; min-width: 320px;">
                <div class="col-md-12" style="margin-top: 25px;">

                    <h1 class="Presentation-header" style="font-size: 20px; margin-left: 5%; margin-right: 5%; min-width: 310px;">京师博仁 <small style="float: right; line-height: 3;">中学生考试焦虑影响因素问卷</small>
                    </h1>

                </div>


                <div class="row" id="GeneralMessage" style="margin-top: 15px; margin-left: 2%; margin-right: 2%; min-width: 310px;">
                    <%--<div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        总评:
                    </div>--%>
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; height: 900px; width: 70%; min-width: 320px;">
                <div class="col-md-12" style="margin-top: 25px;">

                    <h1 class="Presentation-header" style="font-size: 20px; margin-left: 5%; margin-right: 5%; min-width: 310px;">京师博仁 <small style="float: right; line-height: 3;">中学生考试焦虑影响因素问卷</small>
                    </h1>

                </div>

                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">
                        四、原始答卷
                    </div>
                    <div class="row" id="AnswerRecord" style="margin-top: 15px; margin-left: 2%; margin-right: 2%; min-width: 310px;">
                        <table style="border-color: #333; margin-top: 15px; text-align: left; width: 100%;" border="1">
                            <tr>
                                <td style="height: 25px; background-color: #999; text-align: center;">1</td>
                                <td style="height: 25px; background-color: #999; text-align: center;">2</td>
                                <td style="height: 25px; background-color: #999; text-align: center;">3</td>
                                <td style="height: 25px; background-color: #999; text-align: center;">4</td>
                                <td style="height: 25px; background-color: #999; text-align: center;">5</td>
                            </tr>
                            <tr>
                                <td style="height: 25px; text-align: center;">A</td>
                                <td style="height: 25px; text-align: center;">A</td>
                                <td style="height: 25px; text-align: center;">A</td>
                                <td style="height: 25px; text-align: center;">A</td>
                                <td style="height: 25px; text-align: center;">A</td>
                            </tr>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <script>

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
        InitPages();
        /*-----根据答题ID加载报告信息-------*/
        var AnswerJson = "";//测试人答题的Json
        var AmountCode = "";//答题的量表编码
        var SubjectTotal = 0;//量表题干数量
        //var 
        function InitPages() {

            var answer_id = Request["A_ID"];
            $.ajax({
                type: "POST",
                url: "Ajax/Presentation.ashx",
                data: {
                    Remark: "InitPages",
                    A_ID: answer_id
                },//要执行查询的数据参数
                success: function (msg) {

                    if (msg != "") {
                        var obj = eval(msg);
                        if (obj != null && obj.length > 0) {

                            $("#Introduce").html(obj[7]);
                            $("#ReportTitle").html(obj[10]);
                            AnswerJson = obj[1];//答案Json数据集合
                            AmountCode = obj[8];//量表编码
                            SubjectTotal = obj[9];//量表题干数量
                            //alert(AnswerJson);
                            var date1 = new Date(obj[3]);
                            var date2 = new Date(obj[4]);
                            var date3 = (date2.getTime() - date1.getTime()) / 1000;
                            $("#Actual_Time").html(formatSeconds(date3));
                            $("#Standard_Time").html(formatSeconds(obj[5]));

                            if (date3 < obj[5]) {
                                $("#ResultCon").html("小于最低用时");
                            } else if (date3 > obj[6]) {
                                $("#ResultCon").html("超过最大用时");
                            } else {
                                $("#ResultCon").html("符合有效作答时间");
                            }
                            DrawWD_Analysis(AmountCode, AnswerJson);//加载维度总评

                        }


                    }
                }
            });

        }

        /*-----将时间转换成时分秒*/
        function formatSeconds(value) {
            var theTime = parseInt(value);// 秒 
            var theTime1 = 0;// 分 
            var theTime2 = 0;// 小时 
            // alert(theTime); 
            if (theTime > 60) {
                theTime1 = parseInt(theTime / 60);
                theTime = parseInt(theTime % 60);
                if (theTime1 > 60) {
                    theTime2 = parseInt(theTime1 / 60);
                    theTime1 = parseInt(theTime1 % 60);
                }
            }
            var result = "" + parseInt(theTime) + "秒";
            if (theTime1 > 0) {
                result = "" + parseInt(theTime1) + "分" + result;
            }
            if (theTime2 > 0) {
                result = "" + parseInt(theTime2) + "小时" + result;
            }
            return result;
        }


        /*-------------报告解析-----------*/
        function AnalysisResult(json) {

            var JsonArr = eval("[" + json + "]");
            if (JsonArr != null && JsonArr.length > 0) {

                //InitWDPages

            }
        }

        /*--------------维度解释解析-----------*/
        var OperationList;
        var Ascore = "";
        function DrawWD_Analysis(Acode, _AnswerJson) {
            $.ajax({
                type: "POST",
                url: "Ajax/Presentation.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        $.each(eval(msg), function (index, item) {
                            OperationList = item.Tz_List;
                            Ascore+= item.startscore+":";
                            //alert(1);
                            index++;
                            var zt_Type = "";
                            zt_Type = item.NormName == "" || item.NormName.length == 0 ? "无" : item.NormName
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                            PageHtml += "<div class=\"groupbox\" style=\"margin-top: 10px;\">";
                            PageHtml += "    <span class=\"grouptitle\">";
                            PageHtml += "                    维度" + SectionToChinese(index) + ":&nbsp;&nbsp;" + item.WD_Name;
                            PageHtml += "    </span>";
                            PageHtml += "    <div class=\"panel-body easypiechart-panel\">";
                            PageHtml += "<table width=\"100%;\"  style=\"border-color: #333;margin-top: 15px; text-align:left;\" border=\"1\">";
                            PageHtml += "    <tr style=\"height:50px\">";
                            PageHtml += "        <td>标准分：" + eval(item.ConversionFormula).toFixed(2) + "</td>";
                            PageHtml += "        <td>原始分：" + item.Score.toFixed(2) + "</td>";
                            PageHtml += "        <td>状态：" + zt_Type + "</td>";
                            PageHtml += "    </tr>";
                            PageHtml += "    <tr style=\"min-height:50px\">";
                            PageHtml += "        <td colspan=\"3\">&nbsp;&nbsp;";
                            PageHtml += "【结果分析】</br>";
                            PageHtml += "<p>" + item.Result + "</p>";
                            PageHtml += "</td>";
                            PageHtml += "    </tr>";
                            PageHtml += "    <tr style=\"min-height:50px\">";
                            PageHtml += "        <td colspan=\"3\">&nbsp;&nbsp;";
                            PageHtml += "【心理建议】</br>";
                            PageHtml += "<p>" + item.Proposal + "</p>";
                            PageHtml += "</td>";
                            PageHtml += "    </tr>";
                            PageHtml += "</table>";
                            PageHtml += "    </div>";
                            PageHtml += " </div>";
                            PageHtml += " </div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>"
                            $("#GeneralMessage").append(PageHtml);
                            
                        });
                        var ss = $("#GeneralMessage").find(".Sorceid");
                        InitAnswerRecord();//加载答题记录
                    }
                }
            });

        }


        /*-------------------阿拉伯转汉字-----------------*/

        var chnNumChar = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
        var chnUnitSection = ["", "万", "亿", "万亿", "亿亿"];
        var chnUnitChar = ["", "十", "百", "千"];

        function SectionToChinese(section) {
            var strIns = '', chnStr = '';
            var unitPos = 0;
            var zero = true;
            while (section > 0) {
                var v = section % 10;
                if (v === 0) {
                    if (!zero) {
                        zero = true;
                        chnStr = chnNumChar[v] + chnStr;
                    }
                } else {
                    zero = false;
                    strIns = chnNumChar[v];
                    strIns += chnUnitChar[unitPos];
                    chnStr = strIns + chnStr;
                }

                unitPos++;
                section = Math.floor(section / 10);

            }
            if (chnStr.indexOf("一十") >= 0 && chnStr.length <= 3) {
                chnStr = chnStr.replace("一十", "十");
            }
            return chnStr;
        }


        function InitAnswerRecord() {
            //OperationList
            // $("#AnswerRecord").html(AmountCode);
            //  alert(2);
            //alert(OperationList);




            if (SubjectTotal != 0) {

                var tableHTML = "";
                var answerHTML = "";
                var TzanswerHTML = "";
                tableHTML += "<table style=\"border-color: #333; margin-top: 15px; text-align: left; width: 100%;\" border=\"1\">";
                tableHTML += "    <tr>";
                for (var t = 0; t < SubjectTotal; t++) {
                    tableHTML += "        <td style=\"height: 25px; background-color: #999; text-align: center;\">" + parseInt(t + 1) + "</td>";

                    //var anserList = eval("[" + AnswerJson + "]");

                    $.each(OperationList, function (index, item) {
                        // alert(item.Sort);
                        if (item.Sort == parseInt(t + 1) && AnswerJson.indexOf(item.Tz_Code) > 0) {
                            TzanswerHTML += "<td style=\"height: 25px; text-align: center;\">" + item.Tz_OperationNum + "</td>";
                            return true;
                        }
                    });



                    if (t != 0 && t % 5 == 0) {
                        answerHTML += "    <tr>";
                        answerHTML += TzanswerHTML;
                        answerHTML += "    </tr>";
                        tableHTML += "    </tr>";
                        tableHTML += "    <tr>";
                        tableHTML += answerHTML;
                        answerHTML = "";
                        TzanswerHTML = "";
                    }
                }
                tableHTML += "    </tr>";
                tableHTML += "    <tr>";
                tableHTML += TzanswerHTML;
                tableHTML += "    </tr>";
                tableHTML += "</table>";
                $("#AnswerRecord").html(tableHTML);
            }

        }
    </script>
</asp:Content>
