
<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SpecialReportM.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.SpecialReportM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <%--<link href="Css/Presentation.css" rel="stylesheet" />--%>

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

        .heng_s {
            border-bottom: 1px solid #ccc;
            height: 100px;
            position: relative;
            color: white;
        }

        .heng_z {
            position: absolute;
            bottom: 0;
            width: 180px;
        }

            .heng_z:nth-child(1) {
                left: 40px;
            }

            .heng_z:nth-child(2) {
                left: 320px;
            }

            .heng_z:nth-child(3) {
                left: 600px;
            }

        .zz1 {
            left: 40px;
        }
        /*ie8*/
        .spans {
            margin-top: -23px;
            display: inline-block;
            position: absolute;
            right: 11px;
        }

        .hengs {
            height: 30px;
            background: #009966;
            float: left;
            border-bottom: none;
            bottom: 0px;
        }

            .hengs span {
                margin-top: -23px;
                display: inline-block;
                position: absolute;
                right: 11px;
            }

        .heng_xia {
            overflow: hidden;
            zoom: 1;
        }

        .fen_j {
            float: left;
        }
        /*.fen_j:nth-child(1){ margin-left:40px;}
.fen_j:nth-child(2){ margin-left:30px;}
.fen_j:nth-child(3){ margin-left:30px;}*/
        .jj1 {
            margin-left: 40px;
        }
        /*ie8*/
        .jj2 {
            margin-left: 30px;
        }

        .jj3 {
            float: right;
        }

        .progressA {
            height: 20px;
            overflow: hidden;
        }

        .progress-barA {
            float: left;
            width: 0;
            height: 100%;
            font-size: 12px;
            color: #fff;
            text-align: center;
            background-color: #428bca;
            -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
            box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
            -webkit-transition: width .6s ease;
            transition: width .6s ease;
        }

        .markerA {
            background: #555;
            width: 2px;
            height: 40px;
            position: absolute;
            left: 250px;
            /*top: 50%;*/
            margin-top: -50px;
        }

        .red {
            background: #cd6668;
        }

        .progress-barB {
            float: left;
            width: 0;
            height: 100%;
            font-size: 12px;
            color: #121212;
            text-align: center;
        }
    </style>
    <div style="text-align: right; margin-top: 10px; margin-right: 0px; margin-bottom: 5px;">
        <%-- <button type="button" class="btn btn-danger" onclick="Exits()">退出</button>--%>
    </div>

    <div class="col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px;">

        <div class="well" id="Print" style="overflow-x: auto;">

            <div class="row" style="margin-left: auto; margin-right: auto; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12 text-align: center;">
                    <h4 style="font-size: 22px; font-weight: 700; text-align: center;" id="ReportTitle">《中学生考试焦虑影响因素问卷》测评报告</h4>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                         
                    <table class="MsoTableGrid" style="border-collapse: collapse; width: 498.1000pt; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%; line-height: 30px;">
                        <tbody id="tbody">
                            <tr>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="loginName"></td>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="Uname"></td>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="sex"></td>
                            </tr>
                            <tr>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="birdth"></td>
                                <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);" id="Createtime" colspan="2"></td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
                        一、测验简介
                    </div>
                    <div id="Introduce" style="margin-top: 15px; text-indent: 2em; line-height: 30px;"></div>

                </div>


                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
                        二、测试结果
                    </div>

                    <%-- <div id="AnalysisChart" style="margin-top: 15px;">图表先放一放，找出合适的在生成</div>--%>
                    <div id="container" class="col-md-12 col-sm-12 col-xs-12" style="height: 400px;">
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                        <%--<img"/>--%>
                        <image id="imagescr" width="600px" height="400px"></image>
                    </div>
                </div>

            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12" style="margin-top: 25px;">
                </div>
                <div id="GeneralMessage" style="margin-top: 15px; width: 100%">
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;" id="Answersheet">
                        三、原始答卷
                    </div>
                    <div id="AnswerRecord" style="margin-top: 15px; min-width: 310px;">
                        <table class="MsoTableGrid" style="border-collapse: collapse; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%" id="tableid">
                            <%-- <tr>
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
                            </tr>--%>
                        </table>
                    </div>

                </div>
                <div id="dictionary">
                </div>
                <div class="row" style="margin-top: 15px; margin-bottom: 10px; text-align: center;" id="My">
                    <%-- <div class="col-md-12">
                  <button class="btn btn-warning btn-sm" onclick="addRow()" id="NewInfo" style="display:none"><i></i>新增内容</button>
                            <button class="btn btn-warning btn-sm" id="Newdelete" onclick="remove(this)" style="display:none"><i></i>删除</button>
			               </div>--%>
                </div>
                 
            </div>
        </div>
        <div class="row" style="text-align: center; margin-bottom: 10px;">
            <button type="button" class="btn btn-sm" style="border-color: orange; color: white" id="export">
                导出
            </button>
            &nbsp;&nbsp;
            <button type="button" id="ExitsID" class="btn btn-sm" style="color: white" onclick="Exits()">返回</button>
            
        </div>

    </div>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
       <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
  <%--  <script src="../../JS/word/jquery.wordexport.js"></script>--%>

    <script>
        // var navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        /*------------根据量表ID查询量表基本信息--------------*/
        var navName = "";
        var Types = getUrlParam("type");
        var AmountTypes = getUrlParam("AmountType");
        if (Types == 1 && AmountTypes == 1) {
            navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
            $("#recovery").hide();
        } else if (AmountTypes == 0) {
            PersonTypes = 2//预警
            navName = '/FunctionModular/Warning/CrisisWarning.aspx';
            $("#recovery").hide();
        }
        else {
            navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
            $("#recovery").show();
        }
        var Acodes = "";
        var Request = new Object();
        var AmountName = "";
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
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitPages",
                    A_ID: answer_id
                },//要执行查询的数据参数
                success: function (msg) {
                    var sexval = 0;
                    var AgeVal = 0;
                    var HZBScore = 0;
                    if (msg != "") {
                        var obj = eval(msg);
                        if (obj != null && obj.length > 0) {
                            filename = obj[10] + "-" + obj[11];
                            AmountName = obj[10];
                            $("#Introduce").html(obj[7]);
                            $("#ReportTitle").html("《" + obj[10] + "》" + "测评报告");
                            AnswerJson = obj[1];//答案Json数据集合
                            AmountCode = obj[8];//量表编码
                            SubjectTotal = obj[9];//量表题干数量   
                            $("#loginName").html("登录名：" + (obj[2]) + "</br>");
                            $("#Uname").html("姓名：" + obj[11] + "</br>");
                            $("#sex").html("性别：" + (obj[12]) + "</br>");
                            ////$("#Codenumber").html("编号:" + (obj[2]) + "</br>");
                            $("#birdth").html("出生日期：" + obj[13] + "</br>");
                            $("#Createtime").html("完成时间：" + obj[4] + "</br>");
                            if (obj[12] == "男") {
                                sexval = 1;
                            } else if (obj[12] == "女") {
                                sexval = 2;
                            }
                            var StartTimeA = obj[16];//作答完的时间
                            var EndtimeA = obj[13];//出生日期
                            AgeVal = DateDiff(StartTimeA, EndtimeA);
                            var AllscoreA = obj[15];;
                            if (AgeVal)
                                HZBScore = obj[15];
                            Acodes = AmountCode;
                            var GetType = getUrlParam("types");
                            Acodes = AmountCode;
                        
                            if (GetType == 18)
                            {
                                $("#Answersheet").hide();
                            }
                            else
                            {
                                $("#Answersheet").show();
                            }

                            if (GetType == 11) {
                                $("#container").css("height", "700px");
                                TSLB11(AmountCode, AnswerJson, sexval, AgeVal, GetType);//加载维度总评
                            } else if (GetType == 1) {

                                TSLB1(AmountCode, HZBScore, sexval, AgeVal, GetType);
                            } else if (GetType == 13) {
                                TSLB13(AmountCode, AnswerJson, sexval, AgeVal, GetType);//加载维度总评
                            } else if (GetType == 4) {
                                TSLB4(AmountCode, AnswerJson, sexval, AgeVal, GetType)
                            } else if (GetType == 7) {
                                TSLB7(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 16) {
                                TSLB16(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 15) {
                                TSLB15(AmountCode, AnswerJson, sexval, AgeVal, GetType, AllscoreA);
                            } else if (GetType == 17) {
                                TSLB17(AmountCode, AnswerJson, sexval, AgeVal, GetType, AllscoreA);
                            } else if (GetType == 18)
                            {
                                TSLB18(AmountCode, AnswerJson, sexval, AgeVal, GetType, AllscoreA);
                            } else if (GetType == 19)
                            {
                                TSLB19(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 20)
                            {
                                TSLB20(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 21)
                            {
                                TSLB21(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            }
                        }

                    }
                }
            });

        }
        function GetDate(date) {
            var datetime = date.getFullYear()
                    + "-"// "年"
                    + ((date.getMonth() + 1) > 10 ? (date.getMonth() + 1) : "0"
                            + (date.getMonth() + 1))
                    + "-"// "月"
                    + (date.getDate() < 10 ? "0" + date.getDate() : date
                            .getDate());
            return datetime;
        }
        /*-----将时间转换成时分秒*/
        function formatSeconds(value) {
            var theTime = parseInt(value);// 秒 
            var theTime1 = 0;// 分 
            var theTime2 = 0;// 小时          
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
        //增加addhtml
        function Addhtml(InputField, InputValue) {
            var html = ' <tr>'
            html += '<td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);"  colspan="3">';
            html += '<span>' + InputField + '：</sapan><span>' + InputValue + '</sapan></td>';
            html += '</tr>'
            $("#tbody").append(html);
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
        var Allscore = "";
        var strjson = "";
        var NewJson = "";
        var WdJsonName = "";

        var scorejson = "";
        function TSLB11(Acode, _AnswerJson, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: GetType,
                },//要执行查询的数据参数
                success: function (msg) {
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var A = 0;
                        var B = 0;
                        var C = 0;
                        var E = 0;
                        var F = 0;
                        var G = 0;
                        var H = 0;
                        var I = 0;
                        var L = 0;
                        var M = 0;
                        var N = 0;
                        var O = 0;
                        var Q1 = 0;
                        var Q2 = 0;
                        var Q3 = 0;
                        var Q4 = 0;
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (index <= 16) {

                                if (item.ScoreType == 1) {
                                    Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                    scorejson += Score + ",";
                                    var Forms = item.Formulas;
                                    MinScore = Forms.replace("Score", Mins);
                                    MaxScore = Forms.replace("Score", Maxs);
                                    MinScore = eval(MinScore).toFixed(2);
                                    MaxScore = eval(MaxScore).toFixed(2);
                                    var WDName = item.WD_Name;
                                    if (WDName.indexOf("A") > -1) {
                                        A = Score;
                                    }
                                    else if (WDName.indexOf("B") > -1) {
                                        B = Score
                                    } else if (WDName.indexOf("C") > -1) {
                                        C = Score
                                    } else if (WDName.indexOf("E") > -1) {
                                        E = Score
                                    } else if (WDName.indexOf("F") > -1) {
                                        F = Score
                                    } else if (WDName.indexOf("G") > -1) {
                                        G = Score
                                    } else if (WDName.indexOf("H") > -1) {
                                        H = Score
                                    } else if (WDName.indexOf("I") > -1) {
                                        I = Score
                                    } else if (WDName.indexOf("L") > -1) {
                                        L = Score
                                    } else if (WDName.indexOf("M") > -1) {
                                        M = Score
                                    } else if (WDName.indexOf("N") > -1) {
                                        N = Score
                                    } else if (WDName.indexOf("O") > -1) {
                                        O = Score
                                    } else if (WDName.indexOf("Q1") > -1) {
                                        Q1 = Score
                                    } else if (WDName.indexOf("Q2") > -1) {
                                        Q2 = Score
                                    } else if (WDName.indexOf("Q3") > -1) {
                                        Q3 = Score
                                    } else if (WDName.indexOf("Q4") > -1) {
                                        Q4 = Score
                                    }
                                }
                                else {
                                    Score = item.Score.toFixed(2);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                                }


                            } else {
                                var ConvertResult = 0;
                                if (index == 17) {
                                    ConvertResult = item.ConversionFormula.replace("L", L).replace("O", O).replace("Q4", Q4).replace("H", H).replace("Q2", Q2).replace("C", C);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 18) {
                                    ConvertResult = item.ConversionFormula.replace("A", A).replace("E", E).replace("F", F).replace("H", H).replace("Q2", Q2);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 19) {
                                    ConvertResult = item.ConversionFormula.replace("C", C).replace("E", E).replace("F", F).replace("N", N).replace("A", A).replace("M", M);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 20) {
                                    ConvertResult = item.ConversionFormula.replace("E", E).replace("M", M).replace("Q1", Q1).replace("Q2", Q2).replace("A", A).replace("G", G);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 21) {
                                    item.ConversionFormula = item.ConversionFormula.replace("C", C).replace("F", F).replace("O", O).replace("Q4", Q4);
                                }
                                if (index == 22) {
                                    item.ConversionFormula = item.ConversionFormula.replace("Q3", Q3).replace("G", G).replace("C", C).replace("E", E).replace("N", N).replace("Q2", Q2).replace("Q1", Q1);
                                }
                                if (index == 23) {
                                    ConvertResult = item.ConversionFormula.replace("A", A).replace("B", B).replace("E", E).replace("F", F).replace("H", H).replace("I", I).replace("M", M).replace("N", N).replace("Q1", Q1).replace("Q2", Q2);
                                    ConvertResult = eval(ConvertResult);
                                    if (15 <= ConvertResult && ConvertResult <= 62) {
                                        item.ConversionFormula = 1;
                                    } else if (63 <= ConvertResult && ConvertResult <= 67) {
                                        item.ConversionFormula = 2;
                                    } else if (68 <= ConvertResult && ConvertResult <= 72) {
                                        item.ConversionFormula = 3;
                                    } else if (73 <= ConvertResult && ConvertResult <= 77) {
                                        item.ConversionFormula = 4;
                                    } else if (78 <= ConvertResult && ConvertResult <= 82) {
                                        item.ConversionFormula = 5;
                                    } else if (83 <= ConvertResult && ConvertResult <= 87) {
                                        item.ConversionFormula = 6;
                                    } else if (88 <= ConvertResult && ConvertResult <= 92) {
                                        item.ConversionFormula = 7;
                                    } else if (93 <= ConvertResult && ConvertResult <= 97) {
                                        item.ConversionFormula = 8;
                                    } else if (98 <= ConvertResult && ConvertResult <= 102) {
                                        item.ConversionFormula = 9;
                                    } else if (103 <= ConvertResult && ConvertResult <= 105) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 24) {
                                    ConvertResult = item.ConversionFormula.replace("B", B).replace("G", G).replace("Q3", Q3).replace("F", F);

                                }

                                //后八个维度的计算
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            for (var i = 0; i < cmmlists.length; i++) {
                                //区分性别和年龄
                                if (item.ScoreType == 1) {
                                    Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                    Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                } else {
                                    Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                    Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                }
                                var Startstr = Startsorse.replace(/\≤/g, "<=");
                                var Endstr = Endsorse.replace(/\≤/g, "<=");
                                var TsStart = eval(Startstr);
                                var Tsend = eval(Endstr);
                                if (TsStart && Tsend) {
                                    NormName = cmmlists[i].NormName;
                                    Result = cmmlists[i].Result;
                                    Proposal = cmmlists[i].Proposal;
                                    break;

                                }


                            }

                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += item.WD_Name + ",";
                            var Yscore = item.Score;
                            var CScores = eval(item.ConversionFormula).toFixed(2);
                            if (item.Score == null || item.Score == "") {
                                Yscore = "--";

                            }
                            if (CScores == null || CScores == "") {
                                CScores = "--";
                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\"  style=\"margin-bottom:15pt;\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";

                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";
                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);

                        });
                        DrawChartKTR(WdJsonName, scorejson, MinScore, MaxScore);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                    }
                }
            });

        }


        //瑞文
        var TJFZ_Json = "";//统计分析F对比值
        var ConverScore = "";
        var ConverScores = 0;
        function TSLB1(Acode, HZBScore, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "TSLBJson",
                    TSLBType: "TSLBRW"
                },
                success: function (msg) {
                    TJFZ_Json = msg;
                    var Numbers=0;
                    var Types = 0;
                    if (TJFZ_Json != "") {
                        HZBScore = eval(HZBScore);
                        var TJFZ_List = eval(TJFZ_Json);
                        for (var t = 0; t < TJFZ_List.length; t++) {

                            var HZBShScore = eval(TJFZ_List[t].Valie);
                            if (AgeVal < 17) {
                                if (TJFZ_List[t].ZZB == AgeVal) {
                                    Numbers++;
                                }
                                if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == AgeVal) {
                                    ConverScore = TJFZ_List[t].HZB;//从数据库取的相应年龄段的分数
                                    ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                    Types = 2;
                                    break;
                                } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                    ConverScores = TJFZ_List[t].HZB;
                                    Types = 1;
                                    break;
                                }
                                if (Numbers == 7) {
                                    if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    }
                                }
                            }else {
                                if (17 <= AgeVal && AgeVal < 20) {
                                    if (TJFZ_List[t].ZZB == 17) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 17) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        Types = 2;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                        if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == 17) {
                                            ConverScore = eval(TJFZ_List[t].HZB);
                                            ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                            Types = 2;
                                            break;
                                        }
                                   }
                                } else if (20 <= AgeVal && AgeVal < 30) {
                                    if (TJFZ_List[t].ZZB == 20) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 20) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                       if (HZBScore> HZBShScore &&  TJFZ_List[t].ZZB == 20) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore+ 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                        }
                                   }
                                } else if (30 <= AgeVal && AgeVal < 40) {
                                    if (TJFZ_List[t].ZZB == 30) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 30) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                       if (HZBScore> HZBShScore &&  TJFZ_List[t].ZZB == 30) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore+ 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                        }
                                   }
                                } else if (40 <= AgeVal && AgeVal < 50) {
                                    if (TJFZ_List[t].ZZB == 40) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 40) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if(Numbers==7)
                                       {
                                       if (HZBScore> HZBShScore &&  TJFZ_List[t].ZZB == 40) {
                                        ConverScore = eval(TJFZ_List[t].HZB);
                                        ConverScores = eval(ConverScore+ 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                        }
                                   }
                                } else if (50 <= AgeVal && AgeVal < 60) {
                                    if (TJFZ_List[t].ZZB == 50) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore &&  TJFZ_List[t].ZZB==50) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if (Numbers == 7) {
                                        if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == 50) {
                                            ConverScore = eval(TJFZ_List[t].HZB);
                                            ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                            Types = 2;
                                            break;
                                        }
                                    }

                                } else if (60 <= AgeVal && AgeVal < 70) {
                                    if (TJFZ_List[t].ZZB == 60) {
                                        Numbers++;
                                    }
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 60) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                    if (Numbers == 7) {
                                        if (HZBScore > HZBShScore && TJFZ_List[t].ZZB == 60) {
                                            ConverScore = eval(TJFZ_List[t].HZB);
                                            ConverScores = eval(ConverScore + 0.5);//根据原始分数得到转换分数
                                            Types = 2;
                                            break;
                                        }
                                    }
                                }
                            }

                        }
                        TSLB1_RW(Acode, ConverScores, HZBScore, Types)

                    }
                }
            });
        }
        var WdJsonNames = "";
        var scorejsons = "";
        function TSLB1_RW(Acode, ConverScores, HZBScore, TypeA) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    AnswerId: getUrlParam("A_ID"),
                    types: 1,
                },//要执行查询的数据参数
                success: function (msg) {
                    var msgs = eval("(" + msg + ")");
                    var CMNumber = "";
                    var CmHtmls = "";
                    var NormName = "";//状态
                    var Result = "";//结果
                    var Proposal = "";
                    var cmmlists = msgs.datas;
                    WdJsonNames = "总评" + ",";
                    //scorejsons += ConverScores + ",";
                    var CMLength = 100 / cmmlists.length
                    var sageOrder = cmmlists.sort(
            function (a, b) {
                return (a.CMstartScore - b.CMstartScore);
            });
                    if (cmmlists.length > 0) {
                        CMNumber += "<div class=\"progress-barB \"style=\"width: " + 0 + "%; float:\"left\"; width: \"0\"; height: \"100%\"; font-size: \"12px\";color: \"#121212\";text-align: \"center\">" + 0 + "</div>";
                        for (var i = 0; i < cmmlists.length; i++) {

                            //if (i == parseInt(cmmlists.length - 1)) {
                            //    CmHtmls += "<div class=\"progress-barA \"style=\"width: " + CMLength + "%" + ";background-color:" + randomColor() + "\" aria-valuemax=\"100\">" + cmmlists[i].NormName + "</div>";
                            //} else {
                            //    CmHtmls += "<div class=\"progress-barA \"style=\"width: " + CMLength + "%" + ";background-color:" + randomColor() + "\" aria-valuemax=\"100\">" + cmmlists[i].NormName + "</div>";
                            //}
                            //if (cmmlists[i].CmendScore != "99999") {
                            //    CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength + "%;text-align:right\">" + cmmlists[i].CmendScore + "</div>";
                            //}

                            Startsorse = cmmlists[i].StartScore.replace("Scores", ConverScores);
                            Endsorse = cmmlists[i].EndScore.replace("Scores", ConverScores);
                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                            var TsStart = eval(Startstr);
                            var Tsend = eval(Endstr);
                            if (TsStart && Tsend) {
                                NormName = cmmlists[i].NormName;
                                Result = cmmlists[i].Result;
                                Proposal = cmmlists[i].Proposal;
                            }
                        }

                        var ConverscorsA = "";
                        if (TypeA == 1) {
                            ConverscorsA = ConverScores;
                        } else if (TypeA == 2) {
                            ConverscorsA = "--";
                        }
                        if (HZBScore == "" && HZBScore == null) {
                            HZBScore = "--";
                        }
                        CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength + "%;text-align:right\">" + 100 + "</div>";
                        var zt_Type = "";
                        zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                        if (zt_Type.indexOf('智力缺陷') > -1) {
                            scorejsons += 5 + ",";
                        } else if (zt_Type.indexOf('智力中下') > -1) {
                            scorejsons += 25 + ",";
                        } else if (zt_Type.indexOf('智力中等') > -1) {
                            scorejsons += 75 + ",";
                        } else if (zt_Type.indexOf('智力良好') > -1) {
                            scorejsons += 95 + ",";
                        } else if (zt_Type.indexOf('智力优秀') > -1) {
                            scorejsons += 100 + ",";
                        }
                        var PageHtml = "";
                        PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                        PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                        PageHtml += " <tr>";
                        PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                        PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                        PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">总评</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td> </tr>";

                        //PageHtml += "<tr style=\"height:78.3500pt;\">";
                        //PageHtml += "<td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(255,255,255);\" valign=\"bottom\" width=\"664\">";
                        //PageHtml += " <p class=\"MsoNormal\" style=\"line-height:150%;\">";
                        //PageHtml += "<span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\">";
                        //PageHtml += " <img height=\"107\" src=\"\" width=\"559\" /></span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p>&nbsp;</o:p></span></b></p>";
                        //PageHtml += " </td></tr>";
                        //PageHtml += "<tr style=\"height:80px\">";
                        //PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        //PageHtml += " <div style=\"width:100%;\">";
                        //PageHtml += " <div  style=\" height: 20px; overflow: hidden;\">";
                        //PageHtml += CmHtmls;
                        //PageHtml += " </div>";
                        //PageHtml += " <div  style=\" height: 20px; overflow: hidden;\">";//passA
                        //PageHtml += CMNumber;
                        //PageHtml += "</div>";
                        //PageHtml += " <div class=\"markerA red\" style=\"left: " + Score * CMLength + "%;\">";
                        //PageHtml += "</div> </div>";
                        //PageHtml += "</td>"
                        //PageHtml += "</tr>";

                        PageHtml += "  <tr style=\"height:27.2500pt;\">";
                        PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"190\">";
                        PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + HZBScore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td>";
                        PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                        PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + ConverscorsA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " </td>";
                        PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"265\">";
                        PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td></tr>";

                        PageHtml += " <tr>";
                        PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                        PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                        PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                        // PageHtml += "   <span class='results'style='display:none'><textarea type='text'  value='" + Result + "' style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " </td> </tr>";


                        PageHtml += "  </table>";
                        PageHtml += "</div>";
                        //PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                        $("#GeneralMessage").append(PageHtml);
                    }
                    DrawChartRW(WdJsonNames, scorejsons, 0, 95);
                    InitAnswerRecordA(msgs.AnswerR);//加载答题记录  
                }
            })

        }

        //Achenbach儿童行为量表
        function TSLB13(Acode, _AnswerJson, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                    types: GetType,
                },//要执行查询的数据参数
                success: function (msg) {
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;

                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            var Agealtype = "";
                            index++;
                            var Score = item.Score;
                            var Yscore = Score.toFixed(2);
                            if (Yscore == null || Yscore == "") {
                                Yscore = "--";
                                Score = "--";
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                            if (item.WD_Name.indexOf('社会能力') > -1) {
                                item.WD_Name = "社会能力";

                                if (sexval == 1) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 14.84) / 4.48) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 17.29) / 3.71) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                       
                                        if (Score < MinScore)
                                        {
                                            MinScore=Score
                                        } if (Score > MaxScore)
                                        {
                                            MaxScore = Score;
                                        }
                                    } else {
                                        Score = "--";
                                    }


                                } else if (sexval == 2) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 15.27) / 4.81) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 17.53) / 3.45) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    }
                                    else {
                                        Score = "--";
                                    }

                                }
                                if (Agealtype == 1) {
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score < 37) {
                                            NormName = '异常';
                                            Result += "孩子在社会能力总分上的得分较低，表示孩子的社会能力可能存在一些异常。可能表现为：与同龄人相比，孩子很少进行户外活动，与朋友们的交往很少，与他们在一起玩耍的时间也很短。";
                                            Proposal += "建议家长关注孩子的内心，明确其想法或顾虑，采用一定的方法加以改善和提高孩子的社会能力，如多参与孩子的活动，通过和孩子一起游戏、一起运动等增加孩子兴趣的广泛性；鼓励孩子多与其他的小朋友接触，提升孩子的活跃性。如有需要也可向专业的心理咨询工作者寻求帮助，在他们的指导下进行改善。";
                                        } else if (Score >= 37) {
                                            NormName = "正常";
                                            Result += "孩子在社会能力总分上的得分较高，表示孩子的社会能力表现为正常。孩子有着自己的爱好和兴趣，如，喜欢进行体育活动、游戏、弹琴、集邮等；与同龄小朋友在一起玩耍的时间也很多，愿意和朋友一起分享心情、事物。";
                                            Proposal += "孩子目前的活动状态非常好，建议家长注意引导孩子继续维持和维护当前的状态，让孩子能更好地适应社会，与人更好地交流。";
                                        }
                                    }

                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }

                            } else if (item.WD_Name.indexOf('行为问题') > -1) {
                                item.WD_Name = "行为问题";

                                if (sexval == 1) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 17.6) / 13.42) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 15.15) / 13.67) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else {
                                        Score = "--";
                                    }

                                } else if (sexval == 2) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 16.1) / 12.36) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                       
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 15.72) / 13.66) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                      
                                    } else {
                                        Score = "--";
                                    }
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }
                                if (Agealtype == 1) {
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 60) {
                                            NormName = "正常";
                                            Result += " 孩子在行为问题总分上的得分较低，表示孩子的行为处于正常范围。可能表现为：孩子的情绪较为稳定，能与小朋友们很好地交流、玩耍，也能很快融入小朋友的圈子中。";
                                            Proposal += "孩子目前的状态非常好，希望家长可以为孩子提供一定的支持，以确保这种良好状态的继续保持；乐观积极的生活状态有助于孩子养成良好的生活习惯。";
                                        } else if (Score > 60) {
                                            NormName = "异常";
                                            Result += "  孩子在行为问题总分上的得分较高，表示孩子的行为可能存在一些异常状态。可能表现为：经常会情绪低落，闷闷不乐、悲伤、抑郁；自我评价较低，不能与他人进行正常的交流沟通；可能伴有一些行为障碍，例如行动迟缓、幻视、幻听等。";
                                            Proposal += "针对孩子目前的状态，建议家长在日常生活中，多鼓励肯定孩子的行为表现，鼓励孩子多与他人进行交往，多与孩子进行沟通交流，成为可以为孩子提供一些方法与支持的可信赖后盾。如有需要也可向专业心理咨询工作者寻求建议。";
                                        }
                                    }


                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }


                            } else if (item.WD_Name.indexOf('活动能力') > -1) {
                             
                                if (sexval == 1) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 4.33) / 2.67) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 6.39) / 2.5) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    }
                                    else {
                                        Score = "--";
                                    }

                                } else if (sexval == 2) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 4.29) / 2.82) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 6.33) / 2.41) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else {
                                        Score = "--";
                                    }
                                }
                                if (Agealtype == 1) {
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        item.WD_Name = "活动能力";
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score < 37) {
                                            NormName += "异常";
                                            Result += " 孩子在活动情况因素上的得分较低，表示孩子的活动能力可能存在一定的异常状况。可能表现为：与同龄人相比，孩子兴趣爱好范围较窄，活动质量也不如他们，在与同龄的小朋友进行游戏时，孩子的活跃程度也比较低。";
                                            Proposal += "建议家长关注孩子的内心，明确其想法或顾虑，采用一定的方法加以改善和提高孩子的活动能力，如培养孩子兴趣的广泛性，在与孩子游戏、运动等中发现孩子兴趣点并及时肯定鼓励；引导孩子多与其他的小朋友接触，从他人身上学习一些活动的技能技巧，在不断攻克困难提升自信，从而培养更多的兴趣爱好。如有需要，也可向专业的心理咨询工作者需求帮助，在他们的指导下进行改善。";
                                        } else if (Score >= 37) {
                                            NormName += "正常";
                                            Result += "孩子在活动情况因素上的得分较高，表示孩子的活动表现正常。在日常生活中，孩子有很多的爱好和兴趣，并且在这些活动与游戏中投入的时间也比较多，能与他人一起很愉悦地完成。";
                                            Proposal += "孩子目前的活动状态非常好，建议家长引导鼓励孩子继续保持这种良好的状态，使孩子能够更好地适应社会生活，与人交流更顺畅。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('社交能力') > -1) {
                                
                                if (sexval == 1) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 6.55) / 4.48) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));
                                      
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 6.31) / 1.68) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));                                    
                                    }
                                    else {
                                        Score = "--";
                                    }
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                } else if (sexval == 2) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 6.78) / 1.56) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 6.54) / 1.61) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else {
                                        Score = "--";
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "社交能力";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        WdJsonName += item.WD_Name + ",";
                                        scorejson += Score + ",";
                                        if (Score < 37) {
                                            NormName += "异常";
                                            Result += " 孩子在社会情况因素上的得分较低，表示孩子的社会情况可能存在一定的异常状态。可能表现为：孩子不容易融入同龄人的集体，也很少与同龄朋友一起游戏，几乎没有要好的朋友或很少，与同龄人相处的时间很少，总是自己单独相处等。";
                                            Proposal += " 针对孩子目前的状态，建议家长在日常生活中，多关注和孩子的沟通方式，多鼓励和肯定孩子的表现，增强孩子的自信心，使孩子能够积极地生活；鼓励孩子多与其他小朋友们一起游戏，增加孩子的社交技能。如有需要可向专业的心理咨询工作者寻求帮助。";
                                        } else if (Score >= 37) {
                                            NormName += "正常";
                                            Result += "孩子在社会情况因素上的得分较高，表示孩子的社会情况处于正常范围。表明您的孩子基本不存在社交方面的问题，孩子能很好地融入集体，经常参加同龄人的活动，并且能在集体中表现得比较活跃；有很多的朋友，在家中与自己的父母及兄弟姐妹也能很好地相处。";
                                            Proposal += "孩子目前的行为方式非常好，有一个很好的心理状态，希望家长引导孩子能继续保持，乐观向上的心态有助于孩子形成很高的乐群性并很好地处理生活中遇到的各种问题。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }

                            } else if (item.WD_Name.indexOf('学校情况') > -1) {
                                item.WD_Name = "学校情况";
                                if (sexval == 1) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 3.75) / 2.27) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 4.6) / 0.96) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    }
                                    else {
                                        Score = "--";
                                    }

                                } else if (sexval == 2) {
                                    if (4 <= AgeVal && AgeVal <= 11) {
                                        Agealtype = 1;
                                        var GS = (((Score - 3.80) / 2.27) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else if (12 <= AgeVal && AgeVal < 16) {
                                        Agealtype = 1;
                                        var GS = (((Score - 4.6) / 0.92) * 10) + 50;
                                        Score = parseFloat(eval(GS).toFixed(2));

                                        if (Score < MinScore) {
                                            MinScore = Score
                                        } if (Score > MaxScore) {
                                            MaxScore = Score;
                                        }
                                    } else {
                                        Score = "--";
                                    }
                                }
                                if (Agealtype == 1) {

                                    if ((Score != "--" && Score != "" && Score != null) || Score==0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score < 37) {
                                            NormName += "异常";
                                            Result += " 孩子在学习情况因素上的得分较低，表示孩子的学习情况可能有一些异常状态。可能表现为：学习成绩经常不及格或中等以下；对一些常识不太熟悉；目前是在特殊班级中学习；因学习成绩不好而留级等。";
                                            Proposal += "针对孩子目前的状态，建议家长和孩子多沟通交流，了解孩子的兴趣以及真实想法，如对老师家长是否有看法或者学习方法不合适等，这有助于帮助孩子找到适合的学习方法以及减缓孩子内心的学习压力，提高孩子的主动积极性。如有需要可向专业的心理咨询工作者寻求帮助。";
                                        } else if (Score >= 37) {
                                            NormName += "正常";
                                            Result += " 孩子在学习情况因素上的得分较高，表示孩子的学习情况处于正常范围，基本不存在学习方面的问题。孩子能够跟上学校的学习进度，并且很少有成绩不及格，即使是次要科目或者常识都能够掌握大部分；没有因为学习成绩而留级过，学习的积极主动性很高，可以自主安排学习计划。";
                                            Proposal += " 孩子目前的学习情况非常好，有一个很好的心理状态，希望家长适时地引导孩子能继续保持，乐观向上的心态有助于孩子视野开阔从而很好地处理学习中遇到的各种问题。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            }
                            else if (item.WD_Name.indexOf('社交退缩') > -1) {
                               
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.08) / 1.19) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }

                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal < 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.78) / 2.25) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.85) / 1.95) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "社交退缩";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "正常";
                                            Result += " 孩子在社交退缩因子上的得分较低，表示孩子基本不存在社交退缩方面的问题。可能表现为：孩子能够很好地融入同龄小朋友们组成的集体中，在与朋友们玩耍时比较活跃，在圈子中也很受欢迎。";
                                            Proposal += " 孩子目前的状态非常好，建议引导孩子继续保持。在日常生活中，可监督孩子注意作息时间，鼓励多参加一些小朋友之间的交往活动，继续提高人际技能，同时积极拓宽兴趣领域。";
                                        } else if (Score > 65) {
                                            NormName += "异常";
                                            Result += "孩子在社交退缩因子上的得分较高，表示孩子可能存在一定的社交退缩问题。可能表现为：羞怯，经常逃避可能接触的人际情境；害怕别人对自己的负面评价，害怕被人拒绝、恐惧亲密的接触；总是与比自己小的孩子玩等。";
                                            Proposal += "若孩子确实存在以上行为方面的问题表现，建议家长能够关注孩子内心的感受和需求，在日常生活中，多鼓励肯定孩子的行为表现，可以通过参加亲子活动或陪伴孩子游戏等来增强孩子的自信心，帮助孩子学会积极地接纳自己。如果效果不明显也可以向专业的心理咨询工作者寻求帮助。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            }
                            else if (item.WD_Name.indexOf('抑郁') > -1) {
                               
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.68) / 2.12) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 2.46) / 2.57) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 3.05) / 2.67) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "抑郁";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "正常";
                                            Result += " 孩子在抑郁因素上的得分较低，表示孩子基本不存在抑郁的情绪困扰。可能表现为：孩子的情绪比较稳定，能保持愉快的心情，不易怒；精力充沛，热爱生活。";
                                            Proposal += "孩子目前的状态很好，希望孩子能继续保持这样的生活状态。家长可鼓励引导孩子多参加一些户外活动，拓宽兴趣领域等。";
                                        } else if (Score > 65) {
                                            NormName += "异常";
                                            Result += "孩子在抑郁因素上的得分较高，表示孩子近期可能存在一些抑郁情绪困扰，可能表现为：显著而持久的情感低落，经常抑郁悲观，闷闷不乐；自我评价降低；反应缓慢，主动言语减少，兴趣减低、生活被动、疏懒，不愿和周围人接触等。";
                                            Proposal += " 如孩子确实存在以上问题，建议到专业的心理咨询机构进行咨询治疗，并注意配合咨询师的帮助。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('不成熟') > -1) {
                                
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Score = "--";
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.22) / 1.26) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                } else if (sexval == 2) {
                                    Score = "--";
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "不成熟";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "异常";
                                            Result += " 孩子在不成熟因素上的得分较低，表示孩子基本不存在依赖性的行为问题。可能表现为：孩子的行为与自己的年龄很相符，做事自主独立，对家人的无明显的依赖，对于一些事情有适当的反应。";
                                            Proposal += " 孩子当前状态良好，因此您不必有此方面的担心，建议引导孩子继续保持目前的状态。";
                                        } else if (Score > 65) {
                                            NormName += "正常";
                                            Result += " 孩子在不成熟因素上的得分较高，表示孩子可能存在一些不成熟方面的行为问题。可能表现为：孩子的行为比较幼稚，与实际的年龄不符，对家人过分依赖，经常哭闹；喜欢与年龄小的孩子玩耍，尿床，爱哭诉等。";
                                            Proposal += " 建议家长注意矫正孩子不成熟的行为表现，培养孩子生活的独立性，鼓励其自己能够完成的事尽量自己去做，避免产生依赖心理，多引导孩子独立完成任务并给与及时肯定及鼓励。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            }
                            else if (item.WD_Name.indexOf('躯体主诉') > -1) {                              
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.01) / 1.63) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }

                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.5) / 2.07) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }


                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.69) / 2.25) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        } if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.13) / 1.49) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "躯体主诉";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score < 65) {
                                            NormName += "正常";
                                            Result += " 孩子在躯体主诉因素上的得分较低，表示孩子基本不存在躯体方面行为困扰。可能表现为：生活中情绪比较稳定，乐观开朗；也没有任何没有缘由的头痛、呕吐等表现。";
                                            Proposal += " 健康的身体一定程度上依赖于健康的心理，日常生活对于心理健康的维护，也有助于身体的健康。您的孩子不存在躯体症状，目前的状态非常好，建议能引导孩子继续保持。";
                                        } else if (Score >= 65) {
                                            NormName += "异常";
                                            Result += "孩子在躯体主诉因素上的得分较高，表示孩子可能存在一些躯体方面的症状困扰。可能表现为无原因的躯体症状：便秘，头痛、头昏，恶心、呕吐，心慌、胸闷，出汗、嗜睡等。";
                                            Proposal += "心理和躯体是相互作用的，健康的身体依赖于健康的心理。针对孩子目前的状态，建议家长在日常生活中多关注孩子内心的感受和需求，帮助孩子合理调节自己的情绪和压力；通过和孩子进行深入有效的沟通，分析导致问题的原因，和孩子一起制定具体的调整计划，如陪伴孩子参加亲子活动，从孩子的角度观察问题等。如果效果不明显，也可向专业的心理咨询机构寻求专业性的建议和改善方案。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('性问题') > -1) {
                                
                                if (sexval == 1) {
                                    Score = "--";
                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 0.96) / 1.03) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "性问题";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score < 65) {
                                            NormName += "正常";
                                            Result += " 孩子在性问题因子上的得分较低，表示孩子在性问题上基本不存在异常行为表现。没有对自己的性器官有过多的好奇心，或是过多的动作。";
                                            Proposal += " 孩子目前的状态非常好，建议能继续保持。建议父母能够了解孩子在不同年龄段的身体和心理的发展特点，在日常生活中多注意对孩子行为的观察和关注，并对孩子进行正确的性教育；同时和孩子建立良好的亲子关系，有助于孩子将内心的困扰主动和父母沟通，获得及时的引导。";
                                        } else if (Score >= 65) {
                                            NormName += "异常";
                                            Result += "孩子在性问题因子上的得分较高，表示孩子在性问题因子上可能存在一些异常行为。如：经常玩弄自己的生殖器官，并且有很强的好奇心，观看和性相关的影视资料等。";
                                            Proposal += "针对孩子目前的状态，建议父母能够了解孩子在不同年龄段的身体和心理的发展特点，在日常生活中多注意对孩子行为的观察和关注，并对孩子进行正确的性教育；同时和孩子建立良好的亲子关系，有助于孩子将内心的困扰主动和父母沟通，获得及时的引导。如果效果不明显，建议家长能到专业的心理咨询机构进行咨询治疗，注意配合咨询师的帮助。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('分裂样') > -1) {
                               
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.44) / 1.57) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        } if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.12) / 1.46) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }

                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 0.33) / 0.69) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 0.8) / 1.2) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "分裂样";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "正常";
                                            Result += " 孩子在分裂样因子上的得分较低，表示孩子不存在分裂样症状。可能表现为：孩子能独立地解决自己的问题，能与朋友们很好地交流沟通，对朋友们比较热情，针对生活中的事件能做出适当的反应。";
                                            Proposal += "孩子目前的活动状态非常好，行为表现正常，您不必为此有过多担心。";
                                        } else if (Score > 65) {
                                            NormName += "异常";
                                            Result += " 孩子在分裂样因子上的得分较高，表示孩子可能存在分裂样症状，可能表现为：对家人过分依赖，胆小不愿出门，与别人关系疏远；喜欢躲在自己的房间里看书、想事、做白日梦；在外人看来显得冷淡孤僻，消极退缩";
                                            Proposal += " 如孩子确实存在以上一些行为方面的问题，建议家长及时向专业的心理咨询工作者咨询，及时作出明确诊断，以免延误治疗。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('攻击行为') > -1) {
                               
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 4.55) / 4.1) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 4.44) / 4.41) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 4.86) / 4.19) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 3.83) / 3.88) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "攻击行为";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score < 65) {
                                            NormName += "正常";
                                            Result += " 孩子在攻击行为因子上的得分较低，表示孩子基本不存在攻击性行为问题。可能表现为：孩子能与其他小朋友们和平相处，不会对他人进行言语或身体攻击，也不会对小朋友们很吝啬，情绪较为平静。";
                                            Proposal += "孩子目前的状态非常好，建议能继续保持，鼓励孩子多参加小朋友之间的一些游戏互动，培养其积极踊跃性，提升孩子的人际交往技能。";
                                        } else if (Score >= 65) {
                                            NormName += "异常";
                                            Result += " 孩子在攻击行为因子上的得分较高，表示孩子可能存在一定的攻击性行为。可能表现为：总是吹嘘自己，需要他人对自己的持续关注；对他人有意挑衅、侵犯或对事物有意损毁、破坏；情绪波动较大，爱发脾气，说脏话，常戏弄他人等。";
                                            Proposal += "孩子的攻击行为是可以理解的，但攻击性强的孩子在社会交往、人格发展方面都会比别的孩子遭遇更多的困难。建议家长分析孩子出现攻击行为的真正原因，根据孩子的特点制定适合的方法，引导孩子学会用恰当的方式获得成功、满足愿望和发泄情绪。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            }
                            else if (item.WD_Name.indexOf('违纪行为') > -1) {
                                
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.37) / 1.9) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.3) / 2.05) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 0.32) / 0.69) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                        } if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 2.74) / 2.43) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "违纪行为";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName = "正常";
                                            Result += " 孩子在违纪行为因子上的得分较低，表示孩子尚不存在违纪方面的问题。可能表现为：在家尊重父母，接受父母的建议；在学校尊重老师，团结同学，没有故意逃学或是离家出走等行为。";
                                            Proposal += "良好的行为习惯不但有利于孩子的健康成长，更有利于孩子成年后的健康生活方式的建立。您的孩子目前的状态非常好，希望能继续保持。";
                                        } else if (Score > 65) {
                                            NormName = "异常";
                                            Result += " 孩子在违纪行为因子上的得分较高，表示孩子可能存在一定的违纪行为。可能表现为：为了逃避惩罚而说谎，欺骗家长；经常逃学，学习成绩差，害怕家长惩罚或愿望得不到满足而离家出走，甚至偷窃等。";
                                            Proposal += "建议家长对孩子的行为引起一定的重视，多了解孩子在不同年龄阶段的身体和心理发展特点，建立民主温馨的家庭氛围，与孩子和平共处；根据孩子当下的状态进行合理地引导；多鼓励孩子与行为品德优良的小朋友接触，多阅读正向教育书籍资料等，以培养良好的行为习惯。若孩子情况严重，建议您能到专业的心理咨询机构寻求系统的改善方案。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('交往不良') > -1) {
                                
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.43) / 1.54) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                        } if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 2.77) / 3.23) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                } else if (sexval == 2) {
                                    Score = "--";
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "交往不良";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "正常";
                                            Result += " 孩子在交往不良因子上的得分较低，表示孩子尚不存在交往不良方面的问题。可能表现为：孩子的情绪较为稳定，没有太大的情绪波动，如大哭大闹；与小朋友们能很好地交流、玩耍，很好地融入小朋友的圈子中。";
                                            Proposal += "良好的社交对孩子个性、情绪情感及认知等方面的发展都具有十分重要的作用。您的孩子目前的状态非常好，值得继续保持。";
                                        } else if (Score >

                                            65) {
                                            NormName += "异常";
                                            Result += "孩子在交往不良因子上的得分较高，表示孩子可能存在一些交往不良方面的问题。可能表现为：经常会情绪低落，闷闷不乐、悲伤抑郁；固执、容易激怒；不愿出门，可能经常在家呆着或是与朋友在一起会有不自然的感受，会表现出窘态。";
                                            Proposal += "建议家长能够多了解孩子在不同年龄段身体和心理发展的特点，根据孩子当下的状态，采取一些措施，如：与孩子一起制定目标，并让孩子独立完成，以增强孩子的自我效能感；鼓励孩子结交朋友，可以从一个到多个，逐渐扩大朋友圈；引导孩子阅读友谊方面的书籍资料，提升人际交往技能。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('强迫-冲动') > -1) {
                               
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 1.8) / 2.18) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));

                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 0.68) / 1.14) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 2.9) / 3.55) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "强迫-冲动";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "正常";
                                            Result += " 孩子在强迫-冲动因子上的得分较低，表示孩子基本不存在强迫—冲动方面的行为问题。可能表现为：没有强迫的行为表现，如强迫计数、强迫洗手；做事具有灵活性和果断性。";
                                            Proposal += "孩子目前的状态非常好，家长不必为此有过多担忧。";
                                        } else if (Score > 65) {
                                            NormName += "异常";
                                            Result += "孩子在强迫-冲动因子上的得分较高，表示孩子可能存在一些强迫-冲动的行为。可能表现为：性格急躁、好胜、自制力差；对自己的能力缺乏信心；行为往往不能受自己意愿的控制，不能控制一些不必要的行为和观念，如强迫计数、强迫洗手等。";
                                            Proposal += "严重的强迫—冲动行为需要及早治疗，若孩子确实存在以上比较明显的症状，建议家长及时寻求专业的心理咨询机构的建议，及时对孩子的行为进行矫正治疗。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('多动') > -1) {
                                                  
                                if (sexval == 1) {
                                    if (item.WD_Name.indexOf('男') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 3.63) / 2.71) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                        if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 2.61) / 2.52) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            }
                                            else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 2.73) / 2.53) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "多动";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "正常";
                                            Result += " 孩子在多动因子上的得分较低，表示孩子基本不存在多动方面的行为困扰。可能表现为：孩子的注意力较集中，能持续完成一件事情，能对自己有一定克制，没有一些过多的动作；情绪稳定，与他人的交流顺畅，对他人的行为能做出适当的反应。";
                                            Proposal += " 多动行为是一种异常行为，会造成孩子学习成绩的下降、人际关系的紧张及自信心的不足。您的孩子目前的状态非常好，不必为此担忧。";
                                        } else if (Score > 65) {
                                            NormName += "异常";
                                            Result += "孩子在多动因子上的得分较高，表示孩子可能存在一些多动行为障碍。可能表现为：注意不集中，容易分散；做事难以持久，常因粗心大意而出错；小动作多，经常骚扰他人；情绪不稳定，常因一点小事而不耐烦、发脾气或哭闹，甚至出现反抗和攻击行为。";
                                            Proposal += "多动行为是一种异常行为，会造成孩子学习成绩的下降、人际关系的紧张及自信心的不足。如遇以上问题，应寻求专业心理咨询工作人员的帮助，及时进行治疗。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            } else if (item.WD_Name.indexOf('残忍行为') > -1) {
                               
                                if (sexval == 1) {
                                    Score = "--";

                                } else if (sexval == 2) {
                                    if (item.WD_Name.indexOf('女') > -1) {
                                        if (item.WD_Name.indexOf('6-11') > -1) {
                                            if (6 <= AgeVal && AgeVal <= 11) {
                                                Agealtype = 1;
                                                var GS = (((Score - 0.43) / 0.92) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        } if (item.WD_Name.indexOf('12-16') > -1) {
                                            if (12 <= AgeVal && AgeVal <= 16) {
                                                Agealtype = 1;
                                                var GS = (((Score - 0.48) / 0.99) * 10) + 50;
                                                Score = parseFloat(eval(GS).toFixed(2));
                                                if (Score < MinScore) {
                                                    MinScore = Score
                                                } if (Score > MaxScore) {
                                                    MaxScore = Score;
                                                }
                                            } else {
                                                Score = "--";
                                            }
                                        }
                                    }
                                }
                                if (Agealtype == 1) {
                                    item.WD_Name = "残忍行为";
                                    if ((Score != "--" && Score != "" && Score != null) || Score == 0) {
                                        scorejson += Score + ",";
                                        WdJsonName += item.WD_Name + ",";
                                        if (Score <= 65) {
                                            NormName += "正常";
                                            Result += " 孩子在残忍行为因子上的得分较低，表示孩子基本不存在残忍行为。可能表现为：孩子几乎没有虐待动物的行为，对待小朋友总是很友好，很少会有打架等攻击性行为发生。";
                                            Proposal += " 孩子的残忍行为较少，表明家长为孩子提供的成长环境较为宽松健康，让孩子能够得到足够的温情和关爱。您的孩子目前的状态非常好，希望继续维持。";
                                        } else if (Score > 65) {
                                            NormName += "异常";
                                            Result += " 孩子可能存在一些残忍的行为问题。主要表现为：经常会虐待小动物，破坏家里的东西或其他小朋友的文具等；和其他小朋友不能友好相处；对他人有身体攻击等表现。";
                                            Proposal += " 建议您多关注孩子内心的感受以及观察孩子外在的行为，如果残忍行为比较明显，建议及时寻求心理咨询师的帮助，分析导致的原因以及制定合适的方案，指导孩子进行调整。";
                                        }
                                    }
                                    TSLB13Html(item.WD_Name, Yscore, Score, NormName, Result, Proposal);
                                }
                            }

                            //if (Score != null && Score != "") {
                            //    //scorejson += Score + ",";
                            //    WdJsonName += item.WD_Name + ",";
                            //}

                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            //WdJsonName += "维度" + SectionToChinese(index) + ",";
                            var zt_Type = "";

                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName

                        });
                        DrawChart(WdJsonName, scorejson, MinScore, MaxScore);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录  





                    }
                }
            });

        }
        function TSLB4(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: getUrlParam("A_ID"),
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";
                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    var Conversage = "";
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                scorejson += Score + ",";
                                var Forms = item.Formulas;
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }

                            } else {
                                Score = item.Score.toFixed(2);
                                scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                            }

                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var sageOrder = cmmlists.sort(
                function (a, b) {
                    return (a.CMstartScore - b.CMstartScore);
                });
                            var zt_Type = "";
                            if (Score < 30) {
                                if (20 <= AgeVal && AgeVal <= 29) {
                                    Conversage = 1;
                                } else if (20 < AgeVal) {
                                    Conversage = 2;
                                } else if (29 > AgeVal) {
                                    Conversage = 3;
                                }
                            } else if (30 <= Score && Score < 50) {
                                if (30 <= AgeVal && AgeVal <= 39) {
                                    Conversage = 1;//等于
                                } else if (30 < AgeVal) {
                                    Conversage = 2;//低于                                    
                                } else if (39 > AgeVal) {
                                    Conversage = 3;//高于
                                }
                            } else if (50 <= Score && Score < 65)//实际87
                            {
                                if (40 <= AgeVal && AgeVal <= 49) {
                                    Conversage = 1;
                                } else if (40 < AgeVal) {
                                    Conversage = 2;
                                } else if (49 > AgeVal) {
                                    Conversage = 3;
                                }
                            }
                            else if (65 <= Score && Score <= 75) {
                                if (50 <= AgeVal && AgeVal <= 59) {
                                    Conversage = 1;
                                } else if (50 < AgeVal) {
                                    Conversage = 2;
                                } else if (59 > AgeVal) {
                                    Conversage = 3;
                                }
                            } else if (Score > 75) {

                                if (AgeVal >= 60) {
                                    Conversage = 1;
                                } else if (60 > AgeVal) {
                                    Conversage = 3;
                                }
                            }
                            var zt_Type = "";
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            if (Conversage == 1) {
                                zt_Type = "等于生理年龄";
                                NormName = zt_Type;
                                
                                Result += "若您的心理年龄和您的生理年龄相符。主要表现为：言行和思考方式，表现出该年龄段都有的心理特点，跟同龄的大多数人相符。";

                              
                                Proposal += "心理年龄和生理年龄基本符合，是一种心理健康的表现，建议您继续保持当前的心理状态。";
                            } else if (Conversage == 2) {
                                zt_Type = "低于生理年龄";
                                NormName = zt_Type;
                               
                                Result += "若您的心理年龄小于您的生理年龄，可能呈现出不协调的情况，主要表现为：有一些行为或者表达方式和年龄较小的同学比较相像，比如注意力集中的时间较短，和他人的意见不一致时会立即苦恼等；学习成绩有时会跟不上老师的教学进度；难以适应学校的规则等。";
                               
                                Proposal += "心理年龄”只不过是一种象征的说法，随着人的不断努力，它可以得到调整和优化。一般认为一个人的心理特点如果严重偏离自己所属年龄，往往都有可能是心理不健康的表现。建议您可以多和父母或老师进行沟通，学习改善自己行为或表达方式的方法，比如参加一些训练，多和同龄同学交流，有助于更好地理解自己的状态，进而得到提高。 ";
                            } else if (Conversage == 3) {
                                zt_Type = "高于生理年龄";
                                NormName = zt_Type;
                              
                                Result += " 若您的心理年龄大于您的生理年龄，可能会表现为：思考的问题较多，为人处世相比同年龄段的人要成熟，喜欢回忆过去，很难与同年龄的同学有共同语言与相互理解的体验。";
                              
                                Proposal += "心理年龄的高低，和一个人的遗传、性格、经历、环境等等因素密切相关，甚至受到近期的心情等多变因素的影响，并非病态，心理年龄远大于实际年龄的人，会很难与同年龄的人有相互的理解与共同的语言，建议您多与同龄人交流，积极参与同龄人的活动，多了解并融入同龄人的的生活习惯，有助于帮助您减少内心的孤独感以及不舒适的感觉，更好地适应学习和社会生活。";
                            }



                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLengthNew = "";
                            if (item.CMAllScore != null && item.CMAllScore != "") {
                                CMLengthNew = eval(100 / (eval(item.CMAllScore) + parseInt(MaxScore)));
                            } else {
                                CMLengthNew = eval(100 / parseInt(MaxScore));
                            }
                            var re = /([0-9]+.[0-9]{2})[0-9]*/;
                            CMLengthNew = CMLengthNew.toString();
                            CMLength = CMLengthNew.replace(re, "$1");

                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var Yscores = item.Score.toFixed(2);
                            if (item.Score == null || item.Score == "" || Score == null || Score == "") {
                                Yscores = "--";
                                Score = "--";
                            }
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\"  style=\"margin-bottom:30pt\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";




                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                            //  PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });
                        if (RoleType == 0) {
                            jsonstr(strjson);
                            NewJsonstr(NewJson);
                        }
                        DrawChart(WdJsonName, scorejson, MinScore, 76);//图表显示有误是最大值和最小值为小
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                    }
                }
            });

        }
        function TSLB7(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var A = "";
            var B = "";
            var C = "";
            var D = "";
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                async: false,
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";

                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.Score).toFixed(2));
                                if (item.WD_Name.indexOf('PA') > -1) {
                                    A = Score;
                                } else if (item.WD_Name.indexOf('NA') > -1) {
                                    B = Score;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    C = Score;
                                } else if (item.WD_Name.indexOf('NE') > -1) {
                                    D = Score;
                                } else if (item.WD_Name.indexOf('总评') > -1) {
                                    A = parseInt(A);
                                    B = parseInt(B);
                                    C = parseInt(C);
                                    D = parseInt(D);
                                    Score = eval(A - B + C - D+24);

                                    item.Score = Score;
                                    item.ConversionFormula = Score;
                                }
                                scorejson += Score + ",";
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }
                            } else {
                                Score = item.Score.toFixed(2);
                                if (item.WD_Name.indexOf('PA') > -1) {
                                    A = Score;
                                } else if (item.WD_Name.indexOf('NA') > -1) {
                                    B = Score;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    C = Score;
                                } else if (item.WD_Name.indexOf('NE') > -1) {
                                    D = Score;
                                } else if (item.WD_Name.indexOf('总评') > -1) {
                                    A = parseInt(A);
                                    B = parseInt(B);
                                    C = parseInt(C);
                                    D = parseInt(D);
                                    Score = eval(A - B + C - D+24);
                                    //if (Score != null && Score != "") {
                                    //    Score = Score.toString();
                                    //}
                                    item.Score = Score
                                    item.ConversionFormula = Score;

                                }
                                scorejson += parseFloat(Score) + ",";
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var sageOrder = cmmlists.sort(
                function (a, b) {
                    return (a.CMstartScore - b.CMstartScore);
                });

                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLengthNew = "";

                            if ((Score != null && Score != "") || Score==0 ) {
                                var ss = Score;
                                for (var i = 0; i < cmmlists.length; i++) {

                                    var StartAgeA = cmmlists[i].NormStartAge <= AgeVal;
                                    var EndAgeA = AgeVal <= cmmlists[i].NormEndAge;
                                    //区分性别和年龄
                                    if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (cmmlists[i].NormSex == sexval && (StartAgeA && EndAgeA)) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;
                                            }
                                        }
                                    } //不区分性别，区分年龄
                                    else if (cmmlists[i].NormSex == 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (StartAgeA && EndAgeA) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");

                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);

                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }  //区分性别,不区分年龄
                                    else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                        if (cmmlists[i].NormSex == sexval) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }//年龄和性别不区分
                                    else {

                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                        }
                                    }
                                }
                            }
                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += item.WD_Name + ",";
                            var WDName = "";
                            if (WDlength == 1) {
                                WDName = item.WD_Name;
                            }
                            else {
                                WDName = "维度" + SectionToChinese(index) + ":&nbsp;&nbsp;" + item.WD_Name;

                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var YScoreA = "";
                            if (item.WD_Name.indexOf('总评') > -1) {
                                YScoreA = "--";
                            }
                            else {
                                YScoreA = item.Score.toFixed(2);
                            }

                            var CScoreA = eval(item.ConversionFormula).toFixed(2);
                            if (YScoreA == null || YScoreA == "" || CScoreA == null || CScoreA == "") {
                                YScoreA = "--";
                                CScoreA = "--";
                            }
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";



                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + YScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                            //var strA = { 'DimensionEntitys': { 'WDName': WDName, 'YScoreA': YScoreA, 'CScoreA': CScoreA, 'zt_Type': zt_Type, 'Result': Result, 'Proposal': Proposal } };
                            //strJsonA.push(strA);
                        });
                        //var strB = { 'Maxmin': { 'MinScore': MinScore, 'MaxScore': MaxScore } }
                        //strJsonA.push(strB);
                        //var strC = { 'AnswerRecord': msgs.AnswerR }
                        //strJsonA.push(strC);
                        DrawChart(WdJsonName, scorejson, 0, 48);
                        if (RoleType == 0) {
                            jsonstr(strjson);
                            NewJsonstr(NewJson);
                        }
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }
        function TSLB16(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        msgs.datas
                        var temp = msgs.datas[0];
                        msgs.datas[0] = msgs.datas[msgs.datas.length - 1];
                        msgs.datas[msgs.datas.length - 1] = temp;
                        //交换之后
                        //for (var i = 0; i < msgs.datas.length; i++) {
                        //    System.out.print(msgs.datas[i] + "\t");
                        //}
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        var L = "";
                        var NE = "";
                        var PE = "";
                        var NC = "";
                        var PC = "";
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";

                            if (item.ScoreType == 1) {
                                if (item.WD_Name != "总评") {
                                    Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                }
                                if (Score == "" || Score == null) {
                                    Score = 0;
                                }
                                if (item.WD_Name.indexOf('L') > -1) {
                                    L = Score;
                                } else if (item.WD_Name.indexOf('L') > -1) {
                                    B = Score;
                                } else if (item.WD_Name.indexOf('NE') > -1) {
                                    C = Score;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    D = Score;
                                } else if (item.WD_Name.indexOf('NC') > -1) {
                                    NC = Score;
                                } else if (item.WD_Name.indexOf('PC') > -1) {
                                    PC = Score;
                                } else if (item.WD_Name.indexOf('总评') > -1) {

                                    var GS = "15+2*L+3*NE-PE+5*NC-PC";
                                    if (L == "" || L == null) {
                                        L = 0;
                                    }
                                    if (NE == null || NE == "") {
                                        NE = 0;
                                    }
                                    if (PE == null || PE == "") {
                                        PE = 0;
                                    }
                                    if (NC == null || NC == "") {
                                        NC = 0;
                                    }
                                    if (PC == null || PC == "") {
                                        PC = 0;
                                    }
                                    var GSW = GS.replace("L", L).replace("NE", NE).replace("PE", PE).replace("NC", NC).replace("PC", PC);
                                    Score = eval(GSW);
                                    item.Score = Score;
                                    item.ConversionFormula = Score;
                                }
                                scorejson += Score + ",";
                                var Forms = item.Formulas;
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }
                            } else {
                                Score = item.Score.toFixed(2);
                                if (Score == "" || Score == null) {
                                    Score = 0;
                                }
                                if (item.WD_Name.indexOf('L') > -1) {
                                    L = Score;
                                } else if (item.WD_Name.indexOf('NE') > -1) {
                                    NE = Score;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    PE = Score;
                                } else if (item.WD_Name.indexOf('NC') > -1) {
                                    NC = Score;
                                } else if (item.WD_Name.indexOf('PC') > -1) {
                                    PC = Score;
                                } else if (item.WD_Name.indexOf('总评') > -1) {
                                    var GS = "15+2*L+3*NE-PE+5*NC-PC";
                                    if (L == "" || L == null) {
                                        L = 0;
                                    }
                                    if (NE == null || NE == "") {
                                        NE = 0;
                                    }
                                    if (PE == null || PE == "") {
                                        PE = 0;
                                    }
                                    if (NC == null || NC == "") {
                                        NC = 0;
                                    }
                                    if (PC == null || PC == "") {
                                        PC = 0;
                                    }
                                    GS = GS.replace("L", L).replace("NE", NE).replace("PE", PE).replace("NC", NC).replace("PC", PC);
                                    Score = eval(GS);
                                    //item.Score = Score;
                                    item.ConversionFormula = Score;
                                }
                                scorejson += parseFloat(Score) + ",";
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var sageOrder = cmmlists.sort(
                function (a, b) {
                    return (a.CMstartScore - b.CMstartScore);
                });

                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLengthNew = "";

                            if (Score != null && Score != "") {
                                for (var i = 0; i < cmmlists.length; i++) {

                                    var StartAgeA = cmmlists[i].NormStartAge <= AgeVal;
                                    var EndAgeA = AgeVal <= cmmlists[i].NormEndAge;
                                    //区分性别和年龄
                                    if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (cmmlists[i].NormSex == sexval && (StartAgeA && EndAgeA)) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;
                                            }
                                        }
                                    } //不区分性别，区分年龄
                                    else if (cmmlists[i].NormSex == 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (StartAgeA && EndAgeA) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");

                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);

                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }  //区分性别,不区分年龄
                                    else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                        if (cmmlists[i].NormSex == sexval) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }//年龄和性别不区分
                                    else {

                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                        }
                                    }
                                }
                            }
                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += item.WD_Name + ",";
                            var WDName = "";
                            if (WDlength == 1) {
                                WDName = item.WD_Name;
                            }
                            else {
                                WDName = "维度" + SectionToChinese(index) + ":&nbsp;&nbsp;" + item.WD_Name;

                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var YScoreA = "";
                            if (item.WD_Name.indexOf('总评') > -1) {
                                YScoreA = "--";
                            }
                            else {
                                YScoreA = item.Score.toFixed(2);
                            }

                            var CScoreA = eval(item.ConversionFormula).toFixed(2);
                            if (YScoreA == null || YScoreA == "") {
                                YScoreA = "--";

                            }
                            if (CScoreA == null || CScoreA == "") {
                                CScoreA = "--";
                            }
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";



                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + YScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });
                        if (MinScore < 0) {
                            MinScore = -5
                        } else {
                            MinScore = 0;
                        }
                        DrawChart(WdJsonName, scorejson, MinScore, 115);
                        if (RoleType == 0) {
                            jsonstr(strjson);
                            NewJsonstr(NewJson);
                        }
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        //内容
        function TSLB15(Acode, _AnswerJson, sexval, AgeVal, recoverys, AllscoreA) {
            var AnswerIDs = getUrlParam("A_ID");
            var WDScoreA = "";
            var WDScoreB = "";
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));

                                var Forms = item.Formulas;
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }

                            } else {
                                Score = item.Score.toFixed(2);

                            }
                            var IndexA = "";
                            var IndexB = "";
                            var IndexC = "";
                            var IndexMax = "";
                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var DataArry = "";

                            var ConverScoreA = "";
                            if (item.WD_Name.indexOf('男性') > -1) {
                                WDScoreA = Score;
                            }
                            else if (item.WD_Name.indexOf('女性') > -1) {
                                WDScoreB = Score;
                                ConverScoreA = eval((WDScoreA - WDScoreB) * 1.1 + 48.25);
                                if (ConverScoreA != null && ConverScoreA != "") {
                                    if (ConverScoreA < MinScore) {
                                        MinScore = ConverScoreA
                                    } if (ConverScoreA > MaxScore) {
                                        MaxScore = ConverScoreA;
                                    }
                                }
                                scorejson += parseFloat(ConverScoreA) + ",";
                                ConverScoreA = ConverScoreA.toFixed(2);
                                if (ConverScoreA != null && ConverScoreA != "") {
                                    if (ConverScoreA < 50) {
                                        NormName = "女性化";
                                        Result += "  您的孩子在量表上的得分较低，表明孩子对自身性别的认识表现为女性化，可能表现为：喜欢娃娃方面的玩具，经常模仿妈妈会做的家务作为自己的游戏，并且扮演一些女性的身份；不喜欢攻击性的游戏，不喜欢冒险性的活动；喜欢干净整洁，爱漂亮等。";
                                        Proposal += "如果您的孩子是女孩，那从测试结果来看，孩子的行为举止符合她本身的性别特征，说明孩子对于自己的性别身份识别较好，建议家长能引导孩子继续保持这样的状态，让孩子形成良好的性别认同；如果您的孩子是男孩，那从测试结果来看，孩子的行为举止不太符合他本身的性别特征，说明孩子对于自己的性别身份识别不太到位，建议家长能够积极主动参与孩子的成长过程，多了解孩子在不同年龄身体和心理发展的特点，关注孩子内心的感受，为孩子提供积极健康的成长环境，多培养孩子男性化的意识和纠正其过于女性化的行为，可以通过阅读儿童发展方面的书籍，也可以通过参加一些亲子方面的活动进行了解、反思和改善，有意识地引导孩子关于男性性别身份的识别与认识。";
                                    } else if (ConverScoreA >= 50) {
                                        NormName = "男性化";
                                        Result = "您的孩子在量表上的得分较高，表明孩子对自身性别的认识表现为男性化，可能表现为：喜欢具有攻击性或是动手的玩具，喜欢体育运动；经常参与攻击性的游戏，或模仿男性的职业游戏；喜欢探索冒险，胆大好奇等。";
                                        Proposal += " 如果您的孩子是男孩，那从测试结果来看，孩子的行为举止符合他本身的性别特征，说明孩子对于自己的性别身份识别较好，建议家长能引导孩子继续保持这样的状态，让孩子形成良好的性别认同；如果您的孩子是女孩，那从测试结果来看，孩子的行为举止不太符合她本身的性别特征，说明孩子对于自己的性别身份识别不太到位，建议家长能够积极主动参与孩子的成长过程，多了解孩子在不同年龄身体和心理发展的特点，关注孩子内心的感受，为孩子提供积极健康的成长环境，多培养孩子女性化的意识和纠正其过于男性化的行为，可以通过阅读儿童发展方面的书籍，也可以通过参加一些亲子方面的活动进行了解、反思和改善，有意识地引导孩子关于女性性别身份的识别与认识。";
                                    }
                                }
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                var CmHtmls = "";//颜色div拼接
                                var CMNumber = "";//数字div拼接
                                var CMLengthNew = "";


                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";
                                var WDName = "";
                                if (WDlength == 1) {
                                    WDName = "总评";
                                }
                                else {
                                    WDName = "总评";

                                }
                                var zt_Type = "";
                                zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                                var YScoreA = item.Score.toFixed(2);
                                var CScoreA = eval(item.ConversionFormula).toFixed(2);
                                if ((YScoreA == null || YScoreA == "") || (CScoreA == null || CScoreA == "")) {
                                    YScoreA = "--";
                                    CScoreA = "--";
                                }
                                var PageHtml = "";
                                PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                                PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                PageHtml += " <tr>";
                                PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td> </tr>";



                                PageHtml += "  <tr style=\"height:27.2500pt;\">";
                                PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + ConverScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td>";
                                PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                                PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + ConverScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " </td>";
                                PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                                PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td></tr>";

                                PageHtml += " <tr>";
                                PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                                // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " </td> </tr>";

                                PageHtml += " <tr>";
                                PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                                // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                                PageHtml += "</td>";
                                PageHtml += "  </tr>";
                                PageHtml += "  </table>";
                                PageHtml += "</div>";
                                PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                                $("#GeneralMessage").append(PageHtml);
                            }
                        });

                        DrawChart(WdJsonName, scorejson,10, 115);

                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }
        function TSLB17(Acode, _AnswerJson, sexval, AgeVal, recoverys, AllscoreA) {
            var n = "";
            var d = "";
            var y = "";
            var o = "";
            var P = "";
            var B = "";
            var ScorejsonA = "";
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        var WDlength = msgs.datas.length;
                        //var CMAllscore = msgs.
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));

                                var Forms = item.Formulas;
                                if (Forms != null && Forms != "") {
                                    MinScore = Forms.replace("Score", Mins);
                                    MaxScore = Forms.replace("Score", Maxs);
                                    MinScore = eval(MinScore).toFixed(2);
                                    MaxScore = eval(MaxScore).toFixed(2);
                                }

                            } else {
                                Score = item.Score.toFixed(2);
                                scorejson += parseFloat(item.Score.toFixed(2)) + ",";
                            }

                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var DataArry = "";

                            var WDScoreB = "";
                            var ConverScoreA = "";

                            if (index == 1) {
                                if (Score == 0) {
                                    n = -23;
                                } else if (Score == 1) {
                                    n = -20;
                                } else if (Score == 2) {
                                    n = -17
                                } else if (Score == 3) {
                                    n = -14;
                                } else if (Score == 4) {
                                    n = -11;
                                } else if (Score == 5) {
                                    n = -9;
                                } else if (Score == 6) {
                                    n = -6
                                } else if (Score == 7) {
                                    n = -3;
                                } else if (Score == 8) {
                                    n = -2
                                } else if (Score == 9) {
                                    n = 3
                                } else if (Score == 10) {
                                    n = 5
                                } else if (Score == 11) {
                                    n = 8
                                }
                                    //else if (Score == 6) {
                                    //    n = -6
                                    //}
                                else if (Score == 12) {
                                    n = 11;
                                } else if (Score == 13) {
                                    n = 14;
                                } else if (Score == 14) {
                                    n = 17;
                                } else if (Score == 15) {
                                    n = 19
                                } else if (Score == 16) {
                                    n = 22;
                                } else if (Score == 17) {
                                    n = 25;
                                } else if (Score == 18) {
                                    n = 28
                                } else if (Score == 19) {
                                    n = 30;
                                } else if (Score == 20) {
                                    n = 33
                                } else if (Score == 21) {
                                    n = 36
                                } else if (Score == 22) {
                                    n = 39;
                                }
                                else if (Score == 23) {
                                    n = 41;
                                } else if (Score == 24) {
                                    n = 44;
                                } else if (Score == 25) {
                                    n = 47;
                                } else if (Score == 26) {
                                    n == 50;
                                } else if (Score == 27) {
                                    n = 53;
                                }

                            } else if (index == 2) {
                                if (Score == 0) {
                                    d = -17;
                                } else if (Score == 1) {
                                    d = -14;
                                } else if (Score == 2) {
                                    d = -11;
                                } else if (Score == 3) {
                                    d = -8;
                                } else if (Score == 4) {
                                    d = -5;
                                } else if (Score == 5) {
                                    d = -3;
                                } else if (Score == 6) {
                                    d = 0
                                } else if (Score == 7) {
                                    d = 3;
                                } else if (Score == 8) {
                                    d = 5
                                } else if (Score == 9) {
                                    d = 8
                                } else if (Score == 10) {
                                    d = 11
                                } else if (Score == 11) {
                                    d = 14;
                                } else if (Score == 12) {
                                    d = 16
                                } else if (Score == 13) {
                                    d = 19;
                                } else if (Score == 14) {
                                    d = 22;
                                } else if (Score == 15) {
                                    d = 24;
                                } else if (Score == 16) {
                                    d = 27
                                } else if (Score == 17) {
                                    d = 30;
                                } else if (Score == 18) {
                                    d = 32;
                                } else if (Score == 19) {
                                    d = 35
                                }

                                else if (Score == 20) {
                                    d = 38
                                } else if (Score == 21) {
                                    d = 41;
                                } else if (Score == 22) {
                                    d = 43;
                                }
                                else if (Score == 23) {
                                    d = 46;
                                } else if (Score == 24) {
                                    d = 49;
                                } else if (Score == 25) {
                                    d = 51;
                                } else if (Score == 26) {
                                    d == 54;
                                } else if (Score == 27) {
                                    d = 57;
                                }
                            } else if (index == 3) {
                                if (Score == 0) {
                                    y = -17;
                                } else if (Score == 1) {
                                    y = -14;
                                } else if (Score == 2) {
                                    y = -10
                                } else if (Score == 3) {
                                    y = -7;
                                } else if (Score == 4) {
                                    y = -4;
                                } else if (Score == 5) {
                                    y = -1;
                                } else if (Score == 6) {
                                    y = 2
                                } else if (Score == 7) {
                                    y = 5;
                                } else if (Score == 8) {
                                    y = 8
                                } else if (Score == 9) {
                                    y = 12
                                } else if (Score == 10) {
                                    y = 15
                                } else if (Score == 11) {
                                    y = 18
                                }
                                else if (Score == 12) {
                                    y = 21;
                                } else if (Score == 13) {
                                    y = 24;
                                } else if (Score == 14) {
                                    y = 27;
                                } else if (Score == 15) {
                                    y = 30
                                } else if (Score == 16) {
                                    y = 34;
                                } else if (Score == 17) {
                                    y = 37;
                                } else if (Score == 18) {
                                    y = 40;
                                } else if (Score == 19) {
                                    y = 42;
                                } else if (Score == 20) {
                                    y = 46
                                } else if (Score == 21) {
                                    y = 49
                                } else if (Score == 22) {
                                    y = 52;
                                }
                                else if (Score == 23) {
                                    y = 55;
                                } else if (Score == 24) {
                                    y = 59;
                                } else if (Score == 25) {
                                    y = 62;
                                } else if (Score == 26) {
                                    y == 65;
                                } else if (Score == 27) {
                                    y = 68;
                                }
                            } else if (index == 4) {
                                if (Score == 0) {
                                    o = -20;
                                } else if (Score == 1) {
                                    o = -17;
                                } else if (Score == 2) {
                                    o = 14
                                } else if (Score == 3) {
                                    o = -11;
                                } else if (Score == 4) {
                                    o = -9;
                                } else if (Score == 5) {
                                    o = -6;
                                } else if (Score == 6) {
                                    o = -4
                                } else if (Score == 7) {
                                    o = -1;
                                } else if (Score == 8) {
                                    o = 2
                                } else if (Score == 9) {
                                    o = 4;
                                } else if (Score == 10) {
                                    o = 7;
                                } else if (Score == 11) {
                                    o = 10;
                                } else if (Score == 12) {
                                    o = 12;
                                } else if (Score == 13) {
                                    o = 15;
                                } else if (Score == 14) {
                                    o = 18;
                                } else if (Score == 15) {
                                    o = 20;
                                } else if (Score == 16) {
                                    o = 23;
                                } else if (Score == 17) {
                                    o = 25;
                                } else if (Score == 18) {
                                    o = 28;
                                } else if (Score == 19) {
                                    o = 31
                                } else if (Score == 20) {
                                    o = 33;
                                } else if (Score == 21) {
                                    o = 36
                                } else if (Score == 22) {
                                    o = 39
                                } else if (Score == 23) {
                                    o = 41;
                                }
                                else if (Score == 24) {
                                    o = 44;
                                } else if (Score == 25) {
                                    o = 46;
                                } else if (Score == 26) {
                                    o == 49;
                                } else if (Score == 27) {
                                    o = 52;
                                }


                                P = (d + o) - (n + y)
                                B = (o + n) - (d + y)
                                if ((-20 <= P && P <= 20) && (-20 <= B && B <= 20)) {
                                    NormName = "多项气质混合型";
                                    Result += "多项气质混合型的主要特征为：高级神经活动的强度、平衡度、灵活度皆不显著，尚未形成典型的气质特征；孤独与合群，迟钝与敏捷，顺从与固执、严肃与活泼、敷衍与负责，退缩与冒险，随和与刚愎、依赖与自立同存，编织着一个复杂的个性网络；是实施个性塑造最有效的气质类型。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您可以尝试分析一下自己的性格和行为特点，和老师或父母进行沟通，明确积极和消极的行为表现，发展积极倾向，塑造优良的个性品质；如果您是小学生，那么应加强外向性活动，如果您是中学生，那么应注意加强内向性的反思。";
                                }
                                else if ((20 < P && P < 42 && B > 20) || (20 < B && B < 42 && P > 20)) {
                                    NormName = "一般多血质";
                                    Result += "一般多血质的主要特征为：高级神经活动过程的强度较大，均衡性较好，有一定的灵活度；活泼、好动、敏感、反应迅速，喜欢与人交往，表情较丰富，言语、思维、动作较为敏捷；在接受新知识时往往由于意外干扰而使注意力转移，故有失扎实与稳定。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您在日常学习过程中，可以尝试多注意深层的知识，不要满足于表面的掌握，可多接触些有难度的问题，给自己考虑的空间；可以培养自己的专注程度，让自己在较长时间内完成某一固定任务，有助于培养您的耐力；培养制定计划的习惯，比如在每一学期可以制定短期目标和长期目标，并坚持完成。";
                                }
                                else if ((P >= 42 && B >= 42)) {
                                    NormName = "典型多血质";
                                    Result += "典型多血质的主要特征为：高级神经活动过程强度大，均衡性好，灵活度高。通常表现为：灵活机智、活泼好动，善于交际，适应性强，反应迅速，敏捷性强。但注意力不持久，容易转移，兴趣和情绪容易多变，往往做事时容易粗心大意。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您可以多培养注意能力，如对于日常的作业多检查一下，避免因粗心出现错误；参加活动时，多考虑有可能干扰的因素以及活动的流程等，以逐渐提高自己的专注力。";
                                } else if ((-42 < P && P < -20 && B > 20) || (20 < B && B < 42 && P < -20)) {
                                    NormName = "一般粘液质";
                                    Result += "一般粘液质的主要特征为：高级神经活动平衡度好，兴奋与抑制能合理转化；沉着稳定，有较好的分寸感和适应度；平时爱静厌闹，反应问题较一般人迟缓；注意力较持久，内心世界内含而少外露，情绪较为稳定；待人接物缺乏热情。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您可以多做户外活动，加强速度训练和发散思维训练，比如参加体育锻炼，可以主动地训练速度，多阅读关于发散思维方面的书籍，主动参与学校组织的活动或游戏，感受其中的趣味等。";
                                } else if (P <= -42 && B >= 42) {
                                    NormName = "典型粘液质";
                                    Result += "典型粘液质的主要特征为：高级神经活动平衡度很高，强度大，兴奋与抑制转化合理，易形成典型内向性格；平时安静少动，惰性强，情绪发生慢而弱，思维动作言语迟缓，内心极少外露，注意力持久而难以转移；沉着、稳定、坚韧、执拗、淡漠交织在一起。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，可以多阅读关于发散思维方面的书籍，主动参与学校组织的活动或游戏，在活动中锻炼自己的应变能力；在日常生活和学习中，可以结交比较活泼的朋友，有助于您更好的完善自己的性格和气质。";
                                } else if ((-42 < P && P < -20 && B < -20) || (-42 < B && B < -20 && P < -20)) {
                                    NormName = "一般抑郁质";
                                    Result += "一般抑郁质的主要特征为：高级神经活动的过程强度较弱，均衡度不够，反应问题不十分灵活；情绪体验较为深刻，但不强烈；有孤僻单行的倾向；善于从细节分析问题，敏感、细致、胆小、谨慎、自谦而忠于委任";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您可以在学习过程中充分发挥您的细心谨慎的特点，有助于获得学业上更加的成绩，并及时给予自我鼓励和赞扬，有利于自信心的提高；在集体中多注意感受集体的温暖和友谊，避免您的孤僻多疑的倾向；多与外向性格的同学交往，以气质互补，让自己变得更加豁达乐观。";
                                } else if (P <= -42 && B <= -42) {
                                    NormName = "典型抑郁质";
                                    Result += "典型抑郁质的主要特征为：高级神经活动强度弱，易形成阴性条件反射活动，易抑制而难兴奋，其间转化不平衡；柔弱易倦，情绪发生慢而体验深刻；感受性很高，善于觉察他人不易觉察的细节，言语动作细微无力，胆小而孤僻；做事细心，感情丰富而持久。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您在生活和学习中充分发挥您的细心多思的长处，有助于您获得更加的学业成绩；另外，也可以多参加集体活动，主动体验不同的角色，并感受其中的成功体验，有助于发现自己更多的优点，从而更加肯定自己的能力。";
                                } else if ((20 < P && P < 42 && B < -20) || (-42 < B < -20 && P > 20)) {
                                    NormName = "一般胆汁质";
                                    Result += "一般胆汁质的主要特征为：高级神经活动的强度较大，易兴奋而难抑制，其间转化不平衡；精力充沛，情绪常有变化，平时内心外露，多有结交，反应问题较快；行动力较强，情绪兴奋性高，有时不能自制；有热情，较直率，一旦唤起学习的热情便会产生强大的学习动力。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您充分调动自己学习积极性的优点，同时注意学业消化，加强复习巩固，克服注意细节不足的毛病；注意有足够的睡眠和调剂，切勿使大脑负担过重；交往有节制，控制您的户外活动范围，保证学习时间；化鲁莽为果敢，化蛮横为刚强，改变粗心、简单化的学习方式。";
                                } else if (P >= 42 && B <= -42) {
                                    NormName = "典型胆汁质";
                                    Result += "典型胆汁质的主要特征为：高级神经活动强度极大，易形成阳性条件反射，易兴奋而难抑制；直率热情，精力旺盛，脾气急躁，情绪发生快而强，容易冲动；反应迅速，言语动作急速而难于自制，有时表现暴躁；心境变化剧烈，大起大落，果勇而少虑。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您遇事切忌正面冲突，尽量“冷处理”、“过夜处理”，或采取暂时回避的措施；克服简单思维模式，遇事三思而行，慎思、慎动；保证充分的休息时间，注意学习的调剂，勿紧张疲劳；加强涵养，提高自控能力。";
                                }
                                else if (-20 < P && P < 20 && B > 20) {
                                    NormName = "多血-粘液质";
                                    Result += "多血-粘液质的主要特征为：高级神经活动平衡度高，兴奋与抑制转化合理；既有外向活动的适应力，也有冷静沉思的内向心理特点；易形成多层次的人格品质：浮躁与坚韧，热情与冷漠、敏捷与迟缓交织在一起，但皆不十分突出。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您在日常生活和学习中，可以通过自己感兴趣的科目或活动有意识地强化坚韧、热情和敏捷的品质，逐渐弱化浮躁、淡漠和迟缓的特点，以更好的完善自己的性格特质。";
                                }
                                else if (P > 20 && -20 < B && B < 20) {
                                    NormName = "胆汁-多血质";
                                    Result += "胆汁-多血质的主要特征为：高级神经活动强度大，倾向于兴奋型，易形成典型的外向性格，既热情豪爽，亦不乏机灵敏捷；思维言语动作快而机巧，情绪外显，多好交际，果敢善变；精力旺盛，富于生气，但有时显得急躁和轻率，对单一事物的注意力不够持久。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，在保持机敏热情的特长外，建议您有意识的加强目的性的训练，比如在较长的时间内能关注同一事物，完成某一任务能贯以始终；另外注意您的学业深度，加强综合性训练，多自我督促检查；提高学习技巧，如科学的记忆方法，提高学习效率；遇事避免正面冲突，方法上讲究“冷处理”。";
                                }
                                else if (P < -20 && -20 < B && B < 20) {
                                    NormName = "粘液-抑郁质";
                                    Result += "粘液-抑郁质的主要特征为：高级神经活动不灵活，偏向于阴性条件反射，易形成典型内向性格；孤僻寡欢，谦虚慎言，犹豫不前，固执拘谨，耐心有序，内心不外显；有时稍有自信，有时又显自卑，从容与胆怯，自制与消沉，细心与迟缓相杂；时有沉思的踏实，时有敏感的困惑，皆倾于自我内心，使人不易明察。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您在日常生活和学习中，多与他人交流，给自己宣泄的机会，防止造成心理负面情绪的积累；鼓励自己结交积极向上的外向型朋友，以气质互补；多参加有趣的集体活动，有利于增强您外向性和灵活性。";
                                } else if (B < -20 && -20 < P && P < 20) {
                                    NormName = "胆汁-抑郁质";
                                    Result += "胆汁-抑郁质的主要特征为：高级神经活动不平衡，易兴奋而难抑制或抑制而难兴奋，转化不平衡；时而精力充沛，时而情绪低落，时而孤僻自守，时而激动难抑；感受性灵敏细微或粗疏简陋，两级跳跃幅度较大；在学习过程中，易养成细心认真和热情充沛的良好品质，但也可能过敏和激动不安以致学习困难。";
                                    Proposal += "气质没有好坏之分，了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。针对您的状态，建议您可以在日常生活和学习中，将细心多思的特点用于学习中，将热情豪爽的特点用于交际中；多参加集体活动，创设情境，让自己在集体中扮演成功的角色。";
                                }




                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                var CmHtmls = "";//颜色div拼接
                                var CMNumber = "";//数字div拼接
                                var CMLengthNew = "";


                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += item.WD_Name + ",";
                                var WDName = "";
                                if (WDlength == 1) {
                                    WDName = "总评";
                                }
                                else {
                                    WDName = "总评";

                                }
                                var zt_Type = "";
                                zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                                var YScoreA = item.Score.toFixed(2);
                                var CScoreA = eval(item.ConversionFormula).toFixed(2);
                                if ((YScoreA == null || YScoreA == "") || (CScoreA == null || CScoreA == "")) {
                                    YScoreA = "--";
                                    CScoreA = "--";
                                }
                                var PageHtml = "";
                                PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                                PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                PageHtml += " <tr>";
                                PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td> </tr>";



                                PageHtml += "  <tr style=\"height:27.2500pt;\">";
                                PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td>";
                                PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                                PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">P=" + P + ";B=" + B + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " </td>";
                                PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                                PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td></tr>";

                                PageHtml += " <tr>";
                                PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                                // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " </td> </tr>";

                                PageHtml += " <tr>";
                                PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                                // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                                PageHtml += "</td>";
                                PageHtml += "  </tr>";
                                PageHtml += "  </table>";
                                PageHtml += "</div>";
                                PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                                $("#GeneralMessage").append(PageHtml);
                            }
                        });
                        ScorejsonA += P + "," + B + ",";
                        //DrawChart(WdJsonName, scorejson, MinScore, MaxScore);
                        QIUS(ScorejsonA)
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }
        //生活事件
        function TSLB18(Acode, _AnswerJson, sexval, AgeVal, recoverys, AllscoreA)
        {
            var NormName = "";
            var Result = "";
            var Proposal = "";
            if (AllscoreA<20) {
                NormName = "正常状态";
                Result = "  您在量表上的得分较低，表示您承受的精神压力处于正常水平，一般所经历的事件不会对您的身心带来破坏性的影响。";
                Proposal = " 您目前的状态很好，不存在明显的生活事件造成的精神压力。但是当压力事件出现时，建议您能找到合理的减轻压力的途径和方法。";
            } else if (AllscoreA >= 20)
            {
                NormName = "异常状态";
                Result = "  您在量表上的得分较高，表示您承受的精神压力较大，可能处于异常状态，有可能是来自家庭、学习、社交和其他各方面的压力。";
                Proposal = " 精神压力太大会使人精神一直处于紧张状态，影响个体的身心健康发展，尤其是由消极性质的生活事件产生的压力，甚至会导致身体疾病的发生和精神状态异常。针对您目前的状态，建议您及时和父母或老师沟通，让他们了解您的真实感受和需求，给予您及时的指导建议；同时在日常生活中，可以阅读关于自我调整或减压方面的书籍，了解压力产生的原因以及调整的方法，学习减压宣泄的途径与方法，使压力得到及时有效的缓解。";
            }
            var PageHtml = "";
            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
            PageHtml += " <tr>";
            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">总评</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td> </tr>";       

            PageHtml += "  <tr style=\"height:27.2500pt;\">";
            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td>";
            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td>";
            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + NormName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td></tr>";

            PageHtml += " <tr>";
            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
            PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";         
            PageHtml += " </td> </tr>";
            PageHtml += " <tr>";
            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
         
            PageHtml += "</td>";
            PageHtml += "  </tr>";
            PageHtml += "  </table>";
            PageHtml += "</div>";
           
            $("#GeneralMessage").append(PageHtml);
            DrawChart("总评"+",", AllscoreA+",", 0);
            //InitAnswerRecord(msgs.AnswerR);
           
        }
        //客户气质
        function TSLB19(Acode, _AnswerJson, sexval, AgeVal, recoverys)
        {
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        var sageOrder = msgs.datas.sort(
            function (a, b) {
                return (b.Score - a.Score);
            });
                        var x1 = sageOrder[0].Score;
                        var x2 = sageOrder[1].Score;
                        var x3 = sageOrder[2].Score;
                        var x4 = sageOrder[3].Score;
                        if (eval(x1 - x2) >= 4)
                        {
                            TSLBDZ(1,sageOrder[0].WD_Name);
                        } else if ((eval(x1 - x2 <= 3)) && (eval(x1 - x3 >= 4)))
                        {
                            TSLBDZ(2,sageOrder[0].WD_Name + "-" + sageOrder[1].WD_Name);
                         
                        } else if ((eval(x1 - x3 <= 3)) && eval(x1 - x4 >= 4)) {
                            TSLBDZ(3,sageOrder[0].WD_Name + "-" + sageOrder[1].WD_Name + "-" + sageOrder[2].WD_Name);                           
                        } else if (eval(x1 - x4 <= 3)) {
                            TSLBDZ(4,sageOrder[0].WD_Name + "-" + sageOrder[1].WD_Name + "-" + sageOrder[2].WD_Name + "-" + sageOrder[3].WD_Name);                          
                        }

                        strjson = msgs.OldJson;
                        if (strjson != null && strjson != "") {
                            states = 1;
                        }
                        NewJson = msgs.Newjson;
                        RoleType = msgs.RoleType;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        WdJsonName += sageOrder[0].WD_Name + "," + sageOrder[1].WD_Name + "," + sageOrder[2].WD_Name + "," + sageOrder[3].WD_Name+",";
                        scorejson = x1 + "," + x2 + "," + x3 + "," + x4 + ",";
                        DrawChart(WdJsonName, scorejson, -30, 35);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录   
                    }
                }
            });
        }
        //end
        //客户强迫
        function TSLB20(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReportInfo.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    var NormName = "";
                    var Result = "";
                    var Proposal = "";
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        if ((msgs.datas[0].Score < 2 && msgs.datas[1].Score < 5) || (msgs.datas[0].Score >= 2 && msgs.datas[1].Score < 5))
                        {
                            NormName = "无强迫症状";
                            Result = "从测试结果来看，您不存在强迫症状，如脑海里呈现重复的想法、反复的动作或行为等。";
                            Proposal = "您当前状况良好，不必为此过多担忧，希望您继续保持当前的状态，注意保持愉悦的心情和健康的作息习惯。";
                        } else if (msgs.datas[0].Score >= 2 && msgs.datas[1].Score >= 5)
                        {
                            NormName = "明显的强迫症状";
                            Result = "从测试结果来看，您的强迫症状比较明显，可能表现为：有一些想法重复侵入脑海，并且很烦恼；出现重复的动作，并且明知不必要但是不能控制，如反复洗涤、计数、检查等。";
                            Proposal = " 针对您目前的状态，如果日常的生活、学习或工作已经受到明显的干扰，建议您及时咨询相关机构或医院，进行进一步的检查，便于及早确诊和治疗。";
                        } else if (msgs.datas[0].Score < 2 && msgs.datas[1].Score >= 5)
                        {
                            NormName = "无效";
                            Result = " 测试结果来看，此问卷作答无效，可能是您误解了某些问题或没有仔细阅读。";
                            Proposal = "建议您仔细阅读问题，重新作答。";
                        }
                        var PageHtml = "";
                        PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                        PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                        PageHtml += " <tr>";
                        PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                        PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                        PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">总评</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td> </tr>";

                        PageHtml += "  <tr style=\"height:27.2500pt;\">";
                        PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                        PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td>";
                        PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                        PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " </td>";
                        PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                        PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + NormName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += "</td></tr>";

                        PageHtml += " <tr>";
                        PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                        PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                        PageHtml += " </td> </tr>";
                        PageHtml += " <tr>";
                        PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";

                        PageHtml += "</td>";
                        PageHtml += "  </tr>";
                        PageHtml += "  </table>";
                        PageHtml += "</div>";

                        $("#GeneralMessage").append(PageHtml);
                        WdJsonName = msgs.datas[0].WD_Name + "," + msgs.datas[1].WD_Name+",";
                        scorejson = msgs.datas[0].Score + "," + msgs.datas[1].Score + ",";
                        DrawChart(WdJsonName, scorejson, 0, 21);
                       
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                    }
                }
            });
        }

        function TSLB21(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                    types: recoverys,
                },//要执行查询的数据参数
                success: function (msg) {

                    $("#GeneralMessage").html("");
                    var WdJsonName = "";

                    var scorejson = "";
                    var MinScore = 0;
                    var MaxScore = 0;
                    var NormName = "";
                    var Result = "";
                    var Proposal = "";
                    var x1 = 0;
                    var x2 = 0;
                    var x3 = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        var WDlength = msgs.datas.length;

                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                scorejson += Score + ",";

                            } else {
                                Score = item.Score.toFixed(2);
                                scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                            }


                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var sageOrder = cmmlists.sort(
                function (a, b) {
                    return (a.CMstartScore - b.CMstartScore);
                });

                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLengthNew = "";                          
                            if (Score != null && Score != "") {
                                for (var i = 0; i < cmmlists.length; i++) {                                
                                    var StartAgeA = cmmlists[i].NormStartAge <= AgeVal;
                                    var EndAgeA = AgeVal <= cmmlists[i].NormEndAge;
                                    //区分性别和年龄
                                    if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (cmmlists[i].NormSex == sexval && (StartAgeA && EndAgeA)) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;
                                            }
                                        }
                                    } //不区分性别，区分年龄
                                    else if (cmmlists[i].NormSex == 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (StartAgeA && EndAgeA) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");

                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);

                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }  //区分性别,不区分年龄
                                    else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                        if (cmmlists[i].NormSex == sexval) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }//年龄和性别不区分
                                    else {

                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                        }
                                    }
                                }
                            }
                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength*MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += item.WD_Name + ",";
                            var WDName = "";
                            if (WDlength == 1) {
                                WDName = item.WD_Name;
                            }
                            else {
                                WDName = "维度" + SectionToChinese(index) + ":&nbsp;&nbsp;" + item.WD_Name;

                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var YScoreA = item.Score.toFixed(2);
                            var CScoreA = eval(item.ConversionFormula).toFixed(2);
                            if ((YScoreA == null || YScoreA == "") || (CScoreA == null || CScoreA == "")) {
                                YScoreA = "--";
                                CScoreA = "--";
                            }
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WDName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td> </tr>";
                        

                            PageHtml += "  <tr style=\"height:27.2500pt;\">";
                            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + YScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + CScoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td>";
                            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
                            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td></tr>";

                            PageHtml += " <tr>";
                            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                            PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += " </td> </tr>";

                            PageHtml += " <tr>";
                            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                          
                            $("#GeneralMessage").append(PageHtml);
                           
                        });                                           
                        DrawChart(WdJsonName, scorejson, 0, 20);

                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                    }
                }
            });
        }
        //end
        var states = "";
        function jsonstr(strjson) {
            if (strjson != null && strjson != "") {
                states = 1;//更新
                //var obj2 = eval('(' + strjson + ')');
                $.each(strjson, function (name, value) {
                    $("#" + name).html(value);
                    $("#" + name).val(value);
                });
            } else {
                states = 0;//添加
            }

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
            return chnStr;
        }


        function InitAnswerRecord(AR) {
            if (AR != null && AR != "") {
                //创建表格
                var rowCount = Math.ceil(AR.length / 10);

                var windowHeight = window.innerWidth;
                var columnCount = 10;
                //if (windowHeight < 768)
                //    columnCount = 6;
                //else if (windowHeight)
                //    columnCount = 10;

                var table = $("#tableid");
                var trm = -1;
                for (var i = 0; i < rowCount; i++) {
                    var tr = $("<tr></tr>");
                    tr.appendTo(table);

                    for (var j = 1; j < columnCount+1; j++) {
                        var td = "";
                        trm++;
                        if (AR.length > trm) {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\" id=" + parseInt(trm + 1) + "  \">" + parseInt(trm + 1) + "." + "<span></span></td>");
                        } else {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\"><span></span></td>");
                        }

                        td.appendTo(tr);
                    }
                }
            }
            //循环遍历数据
            $.each(AR, function (index, value) {
                var Inputtd = $("#tableid").find("#" + parseInt(index + 1) + "");
                Inputtd.find("span").text(value);
            });
        }
        function getJsonObjLength(jsonObj) {
            var Length = 0;
            for (var item in jsonObj) {
                Length++;
            }
            return Length;
        }
        function InitAnswerRecordA(AR) {
            if (AR != null && AR != "") {
                //创建表格
                if (AmountCode == "LB_14814373314360")
                {
                    ARLength = 60;
                }
                else
                {
                    ARLength = getJsonObjLength(AR);
                    ARLength = ARLength - 1;
                }
                var rowCount = Math.ceil(ARLength / 10);

                var windowHeight = window.innerWidth;
                var columnCount = 10;
                //if (windowHeight < 768)
                //    columnCount = 6;
                //else if (windowHeight)
                //    columnCount = 10;

                var table = $("#tableid");
                var trm = -1;
                for (var i = 0; i < rowCount; i++) {
                    var tr = $("<tr></tr>");
                    tr.appendTo(table);

                    for (var j = 1; j < columnCount+1; j++) {
                        var td = "";
                        trm++;
                        if (ARLength > trm) {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\" id=" + parseInt(trm + 1) + "  \">" + parseInt(trm + 1) + "." + "<span></span></td>");
                        } else {
                            td = $("<td style=\"width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"top\" width=\"110\"><span></span></td>");
                        }

                        td.appendTo(tr);
                    }
                }
            }
            var Indexs = 0;
            //循环遍历数据
            $.each(AR, function (index, value) {
                Indexs++;
                var Inputtd = $("#tableid").find("#" + Indexs + "");
                Inputtd.find("span").text(value);
            });
        }
        //修改
        var EInt = 0;
        function Edite() {
            EInt++;
            $(".nameid").show();
            //$(".nameid").show();
            $("#NewInfo").show();
            $("#Newdelete").show();
            $(".resultp").hide();
            $(".results").show();
            $("#Edite").hide();
            $("#recovery").show();
            $(".Newname").hide();
            $(".moretexts").show();
            $("#SaveID").show();
        }
        
        //退出
        function Exits() {
            var param = fnGetUrlParam("type");
            var usr = "";
            // 设置地址连接
            switch (param) {
            case "1":
                //usr = "http:/" + tiaoarr[1] + "/" + tiaoarr[2] + "/" + tiaoarr[3] + "/heartevaluation/ViewResult.aspx";
                usr = "/FunctionModular/HeartEvaluation/ViewResult.aspx";
                break;
            case "3":
                usr = "/FunctionModular/Warning/CrisisWarning.aspx";
                break;
            default:
                usr = "/FunctionModular/PersonalReport/PersonalReport.aspx";
                break;
            }
            // 设置返回页码参数
            param = fnGetUrlParam("p");
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

        //回复默认
        function recovery() {
            $(".nameid").hide();
            $("#NewInfo").hide();
            $("#Newdelete").hide();
            $(".resultp").show();
            $(".results").hide();
            $("#Edite").show();
            $("#recovery").hide();
            $(".Newname").show();
            $(".moretexts").hide();
            $("#SaveID").hide();
        }
        //保存
        function Add() {
            var operationTypes = "";
            if (states == 0) {
                operationTypes = "PRAdd";
            } else {
                operationTypes = "UpdatePR";
            }
            var d1 = {};
            var t1 = $("#GeneralMessage").find("textarea").serializeArray();//
            $.each(t1, function () {
                d1[this.name] = this.value

            });
            var InputJson = JSON.stringify(d1);
            var fields = $("[data-name=field]");
            var value = $("[data-name=value]");
            var strJson = [];
            if (fields.length > 0) {
                for (var i = 0; i < fields.length; i++) {
                    if (i == fields.length - 1 && $(fields[i]).val() == "" && $(fields[i]).text() == "") {
                        break;
                    }
                    if ($(fields[i]).val() == "" && $(fields[i]).text() != "") {
                        var field = $(fields[i]).text().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                    }
                    if ($(fields[i]).val() != "") {
                        var field = $(fields[i]).val().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                    }

                    strJson.push(str);
                }
            }

            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReport.ashx",
                data: {
                    operationType: operationTypes,
                    InputJson: InputJson,
                    ACode: Acodes,
                    state: states,
                    AID: getUrlParam("A_ID"),
                    NewJsons: JSON.stringify(strJson),
                },

                success: function (msg) {
                    if (msg == "True") {

                        //NewJsonstr(strJson);
                        //DrawWD_Analysis(Acodes, AnswerJson);
                        $(".nameid").hide();
                        $(".resultp").show();
                        $(".results").hide();
                        $("#Edite").show();
                        $("#recovery").hide();
                        $(".moretexts").hide();
                        $("#NewInfo").hide();
                        $("#Newdelete").hide();
                        $("#SaveID").hide();
                        layer.msg('保存成功！', { icon: 1 });
                        window.location.reload();
                    } else {
                        layer.msg('保存失败！', { icon: 1 });
                    }
                }
            });
        }
        var count = 1;
        function addRow() {
            var html = '<div class="row moretexts"  style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">';
            html += ' <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;"><input type="text" class="form-control" data-name="field" placeholder="请输入标题"></div>';
            html += ' <div  class="nameid" style="margin-top: 15px;"><input class="form-control" data-name="value" placeholder="请输入内容" ></div>';
            html += '</div>';

            $('#dictionary').append(html);
        }
        function detele(obj) {
            var newobj = obj.parentNode;
            newobj.remove();
        }

        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
        //获取新的值
        function NewJsonstr(newjson) {
            if (newjson != null && newjson != "") {
                //var strjson = eval('(' + newjson + ')');
                $.each(newjson, function (index, item) {
                    var html = '<div class="row moretext" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">';
                    html += '<div class="Newname"><div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">' + item["Field"] + '</div>';
                    html += '<div  style="margin-top: 15px;">' + item["Value"] + '</div> </div>';
                    html += '<div  class="nameid" style="display:none"><div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;"><input type="text" class="form-control" value=' + item["Field"] + ' data-name="field"  placeholder="请输入标题"></div>';
                    html += '<div  style="margin-top: 15px;"><input class="form-control" value=' + item["Value"] + ' data-name="value" placeholder="请输入内容" ></div></div></div>'
                    $('#dictionary').append(html);
                });
            }

        }
        //删除最后一行
        function remove(obj) {
            if ($("#dictionary .moretexts:last").length == 0) {
                $("#dictionary .moretext:last").remove();
            } else {
                $("#dictionary .moretexts:last").remove();
            }

        }
        //图表
        function DrawChart(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
            /*---------------普通类型的----------------*/
            var datascore = [22, 15, 18, 36, 27, 29, 14];//分数数据集合
            var WDList = ["维度一", "维度二", "维度三", "维度四", "维度五", "维度六", "维度七"];
            var serieslist = [{
                name: "分数",
                data: jsons
            }];
            $('#container').highcharts({
                chart: {
                    polar: false,
                    type: "bar"
                },
                title: {
                    text: AmountName,
                    x: -20 //center
                },
                xAxis: {
                    categories: Names,
                    tickmarkPlacement: 'on',
                    lineWidth: 1,
                    labels: {
                        style: {
                            'fontSize': '14px'
                        }
                    },
                },
                yAxis: {

                    min: minsjon,
                    max: maxsjoin,
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
            });

        }

        //卡特尔图表
        function DrawChartKTR(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
            var categorieslist = ["乐群性", "聪慧性", "稳定性", "恃强性", "兴奋性", "有恒性", "敢为性", "敏感性", "怀疑性", "幻想性", "世故性", "忧虑性", "实验性", "独立性", "自律性", "紧张性", ]
            var w = 650;
            var h = 750;
            //左右空隙，用来放高分低分特征说明文字
            var margin = 100;
            if (w == null || w.length < 1) { w = "100%"; } else { w = w[1] + "px"; } //宽度，默认100%
            //x轴上标签的宽度
            var x_label_w = 75;
            //创建剖析图容器
            $('#container').highcharts({

                title: {
                    text: AmountName,
                    x: -20 //center
                },
                chart: {
                    style: { fontFamily: "'微软雅黑', Verdana, '宋体'" }, //字体
                    type: 'line', //平滑曲线
                    inverted: true, //xy轴反转
                    marginLeft: margin + x_label_w + 5,
                    marginRight: margin + 5
                },
                xAxis: {
                    categories: categorieslist,
                    gridLineWidth: 1, //x轴上网格线（默认没有）
                    offset: margin + 5
                },
                yAxis: {
                    title: null,
                    max: maxsjoin,
                    min: minsjon,
                    tickInterval: 1, //刻度间隔
                    plotLines: [{ //竖直中线
                        label: { text: '中线' },
                        color: 'red',
                        value: 5.5,
                        width: 1
                    }]
                },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0,
                    enabled: false
                },
                series: [{
                    name: '人格因素',
                    data: jsons,
                    dataLabels: {
                        enabled: true, //显示数据标签
                        align: 'left', //数据标签左对齐，控制xy坐标位置
                        x: 5,
                        y: 10
                    }
                }, ]
            }, function (chart) { // 画图完成后写两边的文字
                var low = "沉默孤独|迟钝、学识浅薄|迟钝、情绪激动|谦逊顺从|严肃谨慎|权宜敷衍|畏怯退缩|理智、注重实际|信赖随和|现实、合乎常规|坦白直率、天真|安详沉着、有自信心|保守、附庸传统|依赖、随群附众|矛盾冲突、不明大体|心平气和".split("|");
                var high = "乐群外向|聪慧、富有才识|情绪稳定|好强固执|轻松兴奋|有恒负责|冒险敢为|敏感、感情用事|怀疑刚愎|幻想、狂荡不羁|精明能干、世故|忧虑抑郁、烦恼多端|自由、批评激进|自立、当机立断|知己知彼、自律谨严|紧张困扰".split("|");

                //为字符串对象增加一个右边截取方法
                String.prototype.rightStr = function (n) { return this.substring(this.length - n, this.length); };

                for (var i = 0; i < low.length; i++) {
                    chart.renderer.text(("　　　　　　　" + low[i]).rightStr(9), x_label_w, i * (h - 100) / 17.3 + 80).css({ fontSize: "11px" }).add();
                    chart.renderer.text(high[i], $('#container').width() - margin, i * (h - 100) / 17.3+ 80).css({ fontSize: "11px" }).add();
                }
            });
        }
        /*--------------------表格绘制-----------------*/
        function DrawChartRW(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
            /*---------------普通类型的----------------*/
            var datascore = [22, 15, 18, 36, 27, 29, 14];//分数数据集合
            var WDList = ["维度一", "维度二", "维度三", "维度四", "维度五", "维度六", "维度七"];
            var serieslist = [{
                name: "注释:0-5 智力缺陷,5-25 智力中下,25-75 智力中等,75-95 智力良好,95-100 智力优秀",
                data: jsons
            }];
            $('#container').highcharts({
                chart: {
                    type: 'bar'
                },
                title: {
                    text: AmountName
                },

                xAxis: {
                    categories: ['总评']
                },
                yAxis: {
                    title: {
                        text: '分数 (分)'
                    },
                    tickPositioner: function () {
                        var min = 0, max = 95;
                        return [0, 5, 25, 75, 95];
                    },
                    tickInterval: 10,
                },
                plotOptions: {
                    series: {
                        pointWidth: 10 //柱子的宽度值 单位为px
                    }
                },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                series: serieslist
            });
            //test()
        }
        function test() {
            $(".highcharts-yaxis-labels").find("tspan").eq(1).text(5);
            $(".highcharts-yaxis-labels").find("tspan").eq(2).text(25);
            $(".highcharts-yaxis-labels").find("tspan").eq(3).text(75);
            $(".highcharts-yaxis-labels").find("tspan").eq(4).text(95);
        }
        function valueReplace(v) {
            v = v.toString().replace(new RegExp('(["\"])', 'g'), "\\\"");
            return v;
        }
        //打印
        function printHtml(html) {
            document.body.innerHTML = html;
            window.print();
        }
        function onprint() {
            var html = $("#Print").html();
            printHtml(html);
        }

        //计算年月日天数
        function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式

            var aDate, oDate1, oDate2, iDays;
            aDate = sDate1.split("-");
            oDate1 = new Date(sDate1.replace("-", "/").replace("-", "/"));  //转换为yyyy-MM-dd格式
            aDate = sDate2.split("-");
            oDate2 = new Date(sDate2.replace("-", "/").replace("-", "/"));
            var IDays = parseInt(Math.abs(oDate1 - oDate2));
            var results = getDifference(IDays);



            return results;

        }

        function getDifference(period) {
            var yearLevelValue = 365 * 24 * 60 * 60 * 1000;
            var monthLevelValue = 30 * 24 * 60 * 60 * 1000;
            var dayLevelValue = 24 * 60 * 60 * 1000;
            var hourLevelValue = 60 * 60 * 1000;
            var minuteLevelValue = 60 * 1000;
            var secondLevelValue = 1000;
            /*******计算出时间差中的年、月、日、天、时、分、秒*******/
            var year = parseInt(getYear(period));
            var month = parseInt(getMonth(period - year * yearLevelValue));
            var result = 0;
            if (year != 0) {
                result = year;
            }
            if (month >= 3) {
                result = parseInt(year + 0.5);
            } else if (month >= 9) {
                result = parseInt(year + 1);
            }

            function getYear(period) {
                return parseInt(period) / yearLevelValue;
            }
            function getMonth(period) {
                return parseInt(period) / monthLevelValue;
            }
            return result;
        }

        //随机获取颜色
        function randomColor() {

            var colorStr = Math.floor(Math.random() * 0xFFFFFF).toString(16).toUpperCase();

            return "#" + "000000".substring(0, 6 - colorStr) + colorStr;

        }
        //图片
        function Export() {
            var svgFirst;

            chartFirst = $('#container').highcharts();
            svgFirst = chartFirst.getSVG();
            $.ajax({
                url: "Ajax/PersonalReportInfo.ashx?Remark=SaveImage",
                type: "post",
                async: false,
                data: { svg: svgFirst },
                success: function (result) {
                    var ImageSrc = "Ajax/image/" + result;

                    var image = new Image();
                    image.src = ImageSrc;
                    image.onload = function () {
                        var base64 = getBase64Image(image);
                        //$("#sss").attr("src", base64);
                        $("#imagescr").attr("src", base64);
                        $("#ContainerImage").show();
                        $("#container").hide();
                        $("#Print").wordExport(filename);
                        $("#ContainerImage").hide();
                        $("#container").show()
                    };
                    //$("#imagescr").attr("src", ImageSrc);

                }
            })

        }

        //导出

        $("#export").click(function (event) {
        
            var svgXml = $(".highcharts-container").html()
            var Allcount = ""; var Numbers = ""; var z = "";
            var Allcount = fnGetUrlParam("Allcount");
            var Numbers = fnGetUrlParam("Numbers");
            if (Allcount != null && Allcount != "") {
                var z = parent.getZip();
            }
            var image = new Image();
            image.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgXml))); //给图片对象写入base64编码的svg流
            var base64 = image.src;
            $("#imagescr").attr("src", base64);
            $("#ContainerImage").show();
            $("#container").hide();
            var timeout = window.setTimeout(function () {
                $("#ContainerImage").show();
                $("#container").hide();           
                $("#Print").wordExport(filename + "_" + Numbers, Allcount, Numbers, z, "个体报告批量导出");             
                $("#ContainerImage").hide();
                $("#container").show();
                window.clearTimeout(timeout);
            }, 500)



        });
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

        function QIUS(jsons) {
            var width = $('#container').width();
            var yoffset = (width - 100) / 2 * -1;
            var xoffset = ((width / 4 * 3) - 100) / 2 * -1;
            $('#container').height((width / 4 * 3));
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")");
            jsons = '[[' + jsons[1] + ',' + jsons[0] + ']]';
            jsons = eval("(" + jsons + ")");
            var tname = "QIUS在校学生气质量表（QTS）";
            $('#container').highcharts({
                title: {
                    text: tname,
                    x: 0 //center
                },
                chart: {
                    zoomType: 'xy',
                    marginTop: 50,
                    marginBottom: 50,
                    marginLeft: 50,
                    marginRight: 50
                },
                tooltip: {
                    headerFormat: '<b>{series.name}</b><br>',
                    pointFormat: '{point.x}, {point.y}'
                },
                xAxis: {
                    offset: xoffset,
                    opposite: false,
                    showEmpty: false,
                    lineWidth: 1,
                    lineColor: 'black',
                    tickWidth: 1,
                    labels: {
                        formatter: function () {
                            if (this.value < 20 && this.value > -20) {
                                return "";
                            }
                            else
                                return this.value;
                        }
                    },
                    tickPositions: [-60, -55, -50, -45, -40, -35, -30, -25, -20, '', '', '', ' ', '', '', '', 20, 25, 30, 35, 40, 45, 50, 55, 60],
                    min: -60,
                    max: 60,
                    minTickInterval: 2,
                    title: {//横轴标题  
                        text: 'B维度',
                        x: -yoffset,
                        y: -10,
                        floating: true
                    }
                },
                yAxis: {
                    offset: yoffset,
                    gridLineWidth: 0,
                    title: null,
                    lineColor: 'black',
                    tickWidth: 1,
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }],
                    labels: {
                        formatter: function () {
                            if (this.value < 20 && this.value > -20) {
                                return "";
                            }
                            else
                                return this.value;
                        }
                    },
                    lineWidth: 1,
                    tickWidth: 1,
                    tickPositions: [-60, -55, -50, -45, -40, -35, -30, -25, -20, '', '', '', ' ', '', '', '', 20, 25, 30, 35, 40, 45, 50, 55, 60],
                    title: {//纵轴标题  
                        text: 'P维度',
                        x: 50,
                        y: -(xoffset - 15),
                        rotation: -360
                    }
                },
                series: [
                    {
                        type: 'scatter',
                        color: 'red',
                        name: '分数',
                        data: jsons
                    }
                    , {
                        enableMouseTracking: false,
                        color: "black",
                        marker: {
                            enabled: false,
                            symbol: "none"
                        },
                        data: [
                            [42, 60],
                            [42, 42],
                            [60, 42]
                        ]
                    }, {
                        enableMouseTracking: false,
                        color: "black",
                        marker: {
                            enabled: false,
                            symbol: "none"
                        },
                        data: [
                            [-42, 60],
                            [-42, 42],
                            [-60, 42]]
                    },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [42, -60],
                 [42, -42],
                 [60, -42]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-42, -60],
                 [-42, -42],
                 [-60, -42]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             dashStyle: 'Dot',
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-20, 20],
                 [20, 20],
                 [20, -20],
                 [-20, -20],
                 [-20, 20]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [20, 60],
                 [20, 20],
                 [60, 20]
             ]
         }, {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-20, 60],
                 [-20, 20],
                 [-60, 20]]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [20, -60],
                 [20, -20],
                 [60, -20]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             data: [
                 [-20, -60],
                 [-20, -20],
                 [-60, -20]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型胆汁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-52, 55]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型多血质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [50, 57]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型抑郁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-52, -55]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "典型粘液质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [50, -57]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般胆汁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, 25]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般多血质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, 25]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般抑郁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, -38]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "一般粘液质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, -38]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "胆汁-抑郁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, 5]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "多血-粘液质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, 5]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "抑郁-胆汁质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-38, -17]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "粘液-多血质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [38, -17]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "胆<br>汁<br>-<br>多<br>血<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-10, 60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "多<br>血<br>-<br>胆<br>汁<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [10, 60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "粘<br>液<br>-<br>抑<br>郁<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [10, -60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "抑<br>郁<br>-<br>粘<br>液<br>质",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [-10, -60]
             ]
         },
         {
             enableMouseTracking: false,
             color: "black",
             marker: {
                 enabled: false,
                 symbol: "none"
             },
             dataLabels: {
                 enabled: true,
                 format: "多项气质混合型",
                 style: { "color": "black", "fontSize": "11px", "fontWeight": "", "textOutline": "1px 1px contrast" }
             },
             data: [
                 [0, 0]
             ]
         }
                ]
              , exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0,
                    enabled: false
                },
            });
        }
        //Achenbach儿童行为量表
        function TSLB13Html(WD_Name, Yscore, Score, zt_Type, Result, Proposal) {
            var PageHtml = "";
            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\"  style=\"margin-bottom:30pt\"> ";
            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
            PageHtml += " <tr>";
            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td> </tr>";




            PageHtml += "  <tr style=\"height:27.2500pt;\">";
            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"190\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td>";
            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"207\">";
            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td>";
            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td></tr>";

            PageHtml += " <tr>";
            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
            PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td> </tr>";

            PageHtml += " <tr>";
            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' >" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
            //   PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
            PageHtml += "</td>";
            PageHtml += "  </tr>";
            PageHtml += "  </table>";
            PageHtml += "</div>";
            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" />";
            $("#GeneralMessage").append(PageHtml);
        }
        function TSLBDZ(StateType, obj)
        {
            var NormName = "";
            var Result = "";
            var Proposal = "";
            var State = "";
            if (StateType == 1)
            {
                if (obj == "胆汁质")
                {
                    State = 1;
                } else if (obj == "多血质")
                {
                    State = 2;
                }
                else if (obj == "粘液质")
                {
                    State = 3;
                }
                else if (obj == "抑郁质")
                {
                    State = 4;
                }
                
            } else if (StateType == 2)
            {
                if (obj == "胆汁质-多血质" || obj == "多血质-胆汁质")
                {
                    State = 5;
                } else if (obj == "多血质-粘液质" || obj == "粘液质-多血质")
                {
                    State = 6;
                } else if (obj == "粘液质-抑郁质" || obj == "抑郁质-粘液质")
                {
                    State = 7;
                } else if (obj == "胆汁质-抑郁质" || obj == "抑郁质-胆汁质")
                {
                    State = 8;
                }
            } else if (StateType == 3)
            {
                if (obj == "胆汁质-多血质-粘液质" || obj == "胆汁质-粘液质-多血质")
                {
                    State = 9;
                } else if (obj == "多血质-粘液质-抑郁质" || obj == "多血质-抑郁质-粘液质")
                {
                    State = 10;
                } else if (obj == "胆汁质-多血质-抑郁质" || obj == "胆汁质-抑郁质-多血质")
                {
                    State = 11;
                } else if (obj == "胆汁质-粘液质-抑郁质" || obj == "胆汁质-抑郁质-粘液质")
                {
                    State = 12;
                }
            } else if (StateType == 4)
            {
                State = 13;
            }
            switch (State)
            {
                case 1:
                    NormName = "胆汁质";
                    Result = " 测试结果显示，您的主要气质类型为胆汁质。胆汁质的主要特征为：精力旺盛，反应迅速，情感体验强烈，情绪发生快而强，易冲动但平息也快，直率爽快，开朗热情，外向，但急躁易怒，往往缺乏自制力，有顽强的拼劲和果敢性，但缺乏耐心。概括起来，以精力旺盛，表里如一、刚强、易感情用事为主要特征，整个心理活动充满着迅速而突变的色彩。";
                    Proposal += "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    break;
                case 2:
                    NormName = "多血质";
                    Result = " 测试结果显示，您的主要气质类型为多血质。多血质的主要特征为：活泼好动，反应迅速，行动敏捷、思维灵活；注意力易转移，情绪发生快而多变，易适应环境，喜欢交往，做事粗枝大叶，表情丰富、外向，易动感情且体验不深，往往不求甚解，华而不实为特征。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    break;
                case 3:
                    NormName = "粘液质";
                    Result = "测试结果显示，您的主要气质类型为粘液质。粘液质的主要特征为：安静、沉着、反应较慢，自我控制能力和持久性较强；不易习惯新工作，情绪不易外露，善于忍耐，具有内倾型；但易因循守旧，不易改变旧习惯去适应新环境；坚韧、执拗、淡漠；概括起来，较稳重但灵活不足，踏实但有些死板，沉着冷静但缺乏生气。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    break;
                case 4:
                    NormName = "抑郁质";
                    Result = "测试结果显示，您的主要气质类型为抑郁质。抑郁质的主要特征为：敏锐稳重，聪明而富于想象，自制力强，情感体验深刻、持久、少流露，行动迟缓，胆小、孤僻，不善交往，生活比较单调，多愁善感，内向，谨慎小心，遇困难或挫折易畏缩。有较强的敏感性，具有内倾型，容易体察到一般人不易觉察的事件，外表温柔、怯懦、孤独、行动缓慢为特征。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。<br />";
                    Proposal += "&nbsp;&nbsp根据测试结果，您可能适合的职业特点及职业列表如下：抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 5:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了胆汁质和多血质的特点，既热情豪爽，亦不乏机灵敏捷；思维言语动作快而机巧，情绪外显，多好交际，果敢善变；精力旺盛，富于生气，但有时显得急躁和轻率，对单一事物的注意力不够持久。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += " &nbsp;&nbsp根据您的测试结果，可以参考胆汁质和多血质的职业特点和职业列表：";
                    Proposal += "胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    break;
                case 6:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了多血质和粘液质的特征，既有外向活动的适应力，也有冷静沉思的内向心理特点；易形成多层次的人格品质：浮躁与坚韧，热情与冷漠、敏捷与迟缓交织在一起，但皆不十分突出。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += " &nbsp;&nbsp根据您的测试结果，可以参考多血质和粘液质的职业特点和职业列表：";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    break;
                case 7:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了粘液质和抑郁质的特征，主要表现为：孤僻寡欢，谦虚慎言，犹豫不前，固执拘谨，耐心有序，内心不外显；有时稍有自信，有时又显自卑，从容与胆怯，自制与消沉，细心与迟缓相杂；时有沉思的踏实，时有敏感的困惑，皆倾于自我内心，使人不易明察。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考粘液质和抑郁质的职业特点和职业列表：粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 8:
                    NormName = obj;
                    Result = "测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了胆汁质和抑郁质的特征，主要表现为：时而精力充沛，时而情绪低落，时而孤僻自守，时而激动难抑；感受性灵敏细微或粗疏简陋，两级跳跃幅度较大；在学习过程中，易养成细心认真和热情充沛的良好品质，但也可能过敏和激动不安以致学习困难。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质和抑郁质的职业特点和职业列表：";
                    Proposal += " 胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。"
                    Proposal += " 抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 9:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、多血质和粘液质的职业特点和职业列表：";
                    Proposal += " 胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += " 多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    break;
                case 10:
                    NormName = obj;
                    Result = "测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考多血质、粘液质和抑郁质的职业特点和职业列表：";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 11:
                    NormName = obj;
                    Result = " 测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、多血质和抑郁质的职业特点和职业列表：";
                    Proposal += "胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 12:
                    NormName = obj;
                    Result = "  测试结果显示，您的主要气质类型为" + obj + "。" + obj + "的个体综合了三种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、粘液质和抑郁质的职业特点和职业列表：";
                    Proposal += "胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
                case 13:
                    NormName = obj;
                    Result = "测试结果显示，您的主要气质类型为" + obj + "的混合型。" + obj + "的综合了四种特质的特点，通常表现为内向与外向、稳重与浮躁、热情与冷淡、深沉与轻率、敏感与迟钝，专心与易扰、可塑与刻板，冲动与平稳，任性与随和等交织在一起，但均不明显，构成了多维度的人格坐标图，是塑造良好个性品质的最佳气质类型。";
                    Proposal = "气质没有好坏之分，任何一种气质都有积极和消极两面性，关键在于了解自己的气质特征，有助于明确自己的擅长，并且得以施展才能，实现价值。气质受先天遗传的制约，具有一定的稳定性。但并不是绝对不变的。在生活条件和教育的影响下，它可以被掩盖并且缓慢地发生变化，因此，人的气质具有可塑性。最后，每种气质类型都有其自身的职业适应性，从事某一类职业活动者能体现某一些共同的气质特征。在所适应的职业领域中，不同的气质类型者可以扬长避短，适应并完成一定的工作。混合型气质，同时具有几种气质的神经特点、心理特点和典型表现，适合的职业也相对单一气质较广。<br />";
                    Proposal += "&nbsp;&nbsp根据您的测试结果，可以参考胆汁质、多血质、粘液质和抑郁质的职业特点和职业列表：";
                    Proposal += " 胆汁质特质的个体适合做反应迅速、动作有力、应激性强、危险性较大、难度较高而费力的工作；不适合从事稳重、细致的工作。适合职业：出色的导游员、勘探工作者、推销员、节目主持人、演讲者、外事接待人员等。";
                    Proposal += "多血质的个体适合做社交性、文艺性、多样性、要求反应灵敏且均衡的工作，而不太适应做需要细心钻研的工作；可从事广泛的职业。适合职业：外交人员、管理人员、驾驶员、医生、律师、运动员、新闻记者、冒险家、服务员、侦察员、干警、演员等。";
                    Proposal += "粘液质个体适合做有条不稳、刻板平静、难度较高的工作，不适应做剧烈多变的工作。适合职业：外科医生、法官、管理人员、出纳员、会计、播音员、话务员、调解员、教师、人力人事管理主管等。";
                    Proposal += "抑郁质个体适合做兢兢业业、持久细致的工作，不适合做要求反映灵敏、处理果断的工作。适合职业：校对、打字、排版、检察员、雕刻工作、刺绣工作、保管员、机要秘书、艺术工作者、哲学家、科学家等。";
                    break;
              
            }
            var PageHtml = "";
            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt;\"> ";
            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
            PageHtml += " <tr>";
            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">总评</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td> </tr>";

            PageHtml += "  <tr style=\"height:27.2500pt;\">";
            PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td>";
            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">--</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td>";
            PageHtml += " <td style=\"width: 199.2500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"265\">";
            PageHtml += "  <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">状态：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + NormName + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += "</td></tr>";

            PageHtml += " <tr>";
            PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
            PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";          
            PageHtml += " </td> </tr>";

            PageHtml += " <tr>";
            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";          
            PageHtml += "</td>";
            PageHtml += "  </tr>";
            PageHtml += "  </table>";
            PageHtml += "</div>";          
            $("#GeneralMessage").append(PageHtml);
        }
        //查找是否存相同value,在并返回下标
        function findValue(json, value) {
            if (json.length > 0) {
                for (var ns in json) {
                    var jsonValue = JSON.parse(json[ns])
                    if (jsonValue.Field == value) {
                        return parseInt(ns);
                    }
                    return -1;
                }

            }
            return -1;
        }
    </script>
</asp:Content>
