
<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SpecialReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.SpecialReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />

    <%-- <script src="../../JS/jquery.jqprint-0.3.js"></script>--%>
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

        .progressA {
            height: 20px;
            overflow: hidden;
        }
    </style>
    <%-- <div style="float:left;margin-top:10px;margin-right:10px;">
                <button type="button" onclick="print()"> 
                    导出
                </button>
            </div>--%>
    <div style="text-align: right; margin-top: 10px; margin-right: 0px; margin-bottom: 5px;">
        <%--   <button  type="button" class="btn btn-danger" onclick="Edite()" id="Edite">修改</button>
                     <button type="button" class="btn btn-danger" onclick="recovery()" style="display:none" id="recovery">回复默认</button>--%>
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

                    <div id="AnalysisChart" style="margin-top: 15px;"></div>
                    <div class="col-md-12 col-sm-12 col-xs-12" id="container" style="height: 400px">
                    </div>
                    <div class="row" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                        <%--<img"/>--%>
                        <image id="imagescr" width="600px" height="400px"></image>
                    </div>
                </div>

            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">

                <div id="GeneralMessage" style="margin-top: 15px; width: 100%">
                </div>
            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div class="" style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
                        三、原始答卷
                    </div>
                    <div class="" id="AnswerRecord" style="min-width: 310px; margin-top: 15px;">
                        <table class="MsoTableGrid" style="border-collapse: collapse; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%" id="tableid">
                        </table>
                    </div>

                </div>
                <div id="dictionary">
                </div>
                  
             <%--   <div class="row" style="margin-top: 15px; margin-bottom: 10px; text-align: center;" id="My">
                    <div class="col-md-12">
                        <button class="btn btn-warning btn-sm" onclick="addRow()" id="NewInfo" style="display: none"><i></i>新增内容</button>
                        <button class="btn btn-warning btn-sm" id="Newdelete" onclick="remove(this)" style="display: none"><i></i>删除</button>
                    </div>
                </div>--%>
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
    <script src="../../JS/highcharts-more.js"></script>
    <%-- <script src="../../JS/Highcharts/highcharts.js"></script>
    <script src="../../JS/Highcharts/highcharts-more.js"></script>--%>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
       <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
   <%-- <script src="../../JS/word/jquery.wordexport.js"></script>--%>
    <script src="../../JS/SpecialJS.js"></script>
    <script>

        /*------------根据量表ID查询量表基本信息--------------*/
        //var navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        //var navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';

        var navName = "";
        var AmountName = "";
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
        var filename = "";
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
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitPages",
                    A_ID: answer_id
                },//要执行查询的数据参数
                success: function (msg) {
                    var sexval = 0;
                    var AgeVal = 0;
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
                            //$("#Codenumber").html("编号:" + (obj[2]) + "</br>");
                            $("#birdth").html("出生日期：" + obj[13] + "</br>");
                            $("#Createtime").html("完成时间：" + obj[4] + "</br>");
                            if (obj[12] == "男") {
                                sexval = 1;
                            } else if (obj[12] == "女") {
                                sexval = 2;
                            }
                            var AllscoreA = obj[15];
                            var StartTimeA = obj[4];
                            var EndtimeA = obj[13];
                            AgeVal = DateDiff(StartTimeA, EndtimeA);
                            var GetType = getUrlParam("types");
                            Acodes = AmountCode;
                            //start新增
                       
                            if (GetType == 3) {
                                TSLB3(AmountCode, answer_id, sexval, AgeVal, GetType);//加载维度总评
                            } else if (GetType == 6) {
                                TSLB6(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 8) {
                                TSLB8(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 9) {
                                TSLB9(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 901) {
                                TSLB901(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 801) {
                                TSLB801(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 802) {
                                TSLB802(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            }
                            else if (GetType == 14) {
                                TSLB14(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            } else if (GetType == 10) {
                                TSLB10(AmountCode, AnswerJson, sexval, AgeVal, GetType);
                            }
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
        function TSLB3(Acode, answer_id, sexval, AgeVal, GetType) {
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    answer_id: answer_id,
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
                        MinScore = Mins;
                        MaxScore = Maxs;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = item.Score.toFixed(2);

                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                            scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var num2 = 0;
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLength = eval(100 / MaxScore);
                            //if (CMLength != null && CMLength != "") {

                            //    num2 = CMLength.toFixed(1);
                            //    num2.substring(0, num2.lastIndexOf('.') + 3) // 123456.78
                            //}
                            if (item.Score == null || item.Score == "") {
                                item.Score = "--";
                            }
                            CMNumber += "<div class=\"progress-barB \"style=\"width: " + 0 + "%; float:\"left\"; width: \"0\"; height: \"100%\"; font-size: \"12px\";color: \"#121212\";text-align: \"center\">" + MinScore + "</div>";
                            CMNumber += "<div class=\"progress-barB \"style=\"width: " + 100 + "%;text-align:right\">" + MaxScore + "</div>";
                            CmHtmls += "<div class=\"progress-barA \"style=\"width: " + 100 + "%" + ";background-color:#FA8072\" aria-valuemax=\"100\"></div>";
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
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + item.Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + item.Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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


                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });

                        DrawChart(WdJsonName, scorejson, MinScore, MaxScore);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录                          
                    }
                }
            });

        }

        function TSLB4(Acode, _AnswerJson, sexval, AgeVal, GetType) {
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
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";

                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Ages = 0;
                            if (item.Score < 30) {
                                Ages = 20 < AgeVal < 29;
                            } else if (30 <= item.Score && item.Score < 50) {
                                Ages = 30 <= AgeVal <= 39;
                            }
                            else if (50 <= item.Score && item.Score < 65) {
                                Ages = 50 <= AgeVal < 65;
                            }
                            else if (65 <= item.Score && item.Score < 75) {
                                Ages = 50 <= AgeVal <= 59;
                            }
                            else if (item.Score > 75) {
                                Ages = AgeVal > 60;
                            }
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);                         
                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;


                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "维度" + SectionToChinese(index) + ",";
                            var zt_Type = "";
                            if (item.Score == null || item.Score == "") {
                                item.Score = "--";
                            }
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                            PageHtml += "<div class=\"groupbox\" style=\"margin-top: 10px;\">";
                            PageHtml += "    <span class=\"grouptitle\">";
                            PageHtml += "  总评";
                            PageHtml += "    </span>";
                            PageHtml += "    <div class=\"panel-body easypiechart-panel\">";
                            PageHtml += "<table width=\"100%;\"  style=\"border-color: #333;margin-top: 15px; text-align:left;\" border=\"1\">";
                            PageHtml += "    <tr style=\"height:50px\">";
                            PageHtml += "        <td>标准分：" + item.Score + "</td>";
                            PageHtml += "        <td>原始分：" + item.Score + "</td>";
                            PageHtml += "        <td>状态：" + zt_Type + "</td>";
                            PageHtml += "    </tr>";
                            PageHtml += "    <tr style=\"min-height:50px\">";
                            PageHtml += "        <td colspan=\"3\">&nbsp;&nbsp;";
                            PageHtml += "【结果分析】</br>";
                            PageHtml += "<span class='resultp' ><p id='" + SectioName + "'>" + Result + "</p></span>";
                            //PageHtml += "<span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\"></textarea><span>";
                            PageHtml += "</td>";
                            PageHtml += "    </tr>";

                            PageHtml += "</table>";
                            PageHtml += "    </div>";
                            PageHtml += " </div>";
                            PageHtml += " </div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>"
                            $("#GeneralMessage").append(PageHtml);
                        });
                        DrawChart(WdJsonName, scorejson, MinScore, MaxScore);

                        InitAnswerRecord(msgs.AnswerR);//加载答题记录                          
                    }
                }
            });

        }
        function TSLB6(Acode, _AnswerJson, sexval, AgeVal, GetType) {
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
                        MinScore = Mins;
                        MaxScore = Maxs;
                        //WdJson = msgs.AS;
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(Math.floor(eval(item.ConversionFormula)));
                                scorejson += Score + ",";
                                var Forms = item.Formulas;
                                MinScore = Forms.replace("Score", Mins);
                                MaxScore = Forms.replace("Score", Maxs);
                                MinScore = Math.floor(eval(MinScore));
                                MaxScore = Math.floor(eval(MaxScore));
                                //if (Score < Mins) {
                                //    Mins = Score;
                                //} else if (Score > Maxs) {
                                //    Maxs = Score;
                                //}

                            } else {
                                Score = Math.floor(item.Score);
                                scorejson += parseFloat(Math.floor(item.Score)) + ",";

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
                            var CMNumber = "";
                            var CmHtmls = "";
                            //var CMLength = eval(100 / (eval(item.CMAllScore) + parseInt(MaxScore)));

                            //  CMNumber += "<div class=\"progress-barB \"style=\"width: " + 0 + "%; float:\"left\"; width: \"0\"; height: \"100%\"; font-size: \"12px\";color: \"#121212\";text-align: \"center\">" + MinScore + "</div>";
                            for (var i = 0; i < cmmlists.length; i++) {

                                //if (i == parseInt(cmmlists.length - 1)) {
                                //    CmHtmls += "<div class=\"progress-barA \"style=\"width: " + CMLength * MaxScore + "%" + ";background-color:" + randomColor() + "\" aria-valuemax=\"100\">" + cmmlists[i].NormName + "</div>";
                                //} else {
                                //    CmHtmls += "<div class=\"progress-barA \"style=\"width: " + CMLength * cmmlists[i].CmendScore + "%" + ";background-color:" + randomColor() + "\" aria-valuemax=\"100\">" + cmmlists[i].NormName + "</div>";
                                //}
                                //if (i != parseInt(cmmlists.length - 1)) {
                                //    CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * cmmlists[i].CmendScore + "%;text-align:right\">" + cmmlists[i].CmendScore + "</div>";
                                //}

                                //区分性别和年龄
                                if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                    if (cmmlists[i].NormSex == sexval && (cmmlists[i].NormStartAge < AgeVal < cmmlists[i].NormEndAge)) {
                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                                    if (cmmlists[i].NormStartAge < AgeVal < cmmlists[i].NormEndAge) {
                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                                }  //区分年龄,不区分性别
                                else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                    if (cmmlists[i].NormSex == sexval) {
                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                                        Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                    } else {
                                        Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                        Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += item.WD_Name + ",";
                            var zt_Type = "";
                            var Yscores = Math.floor(item.Score);
                            var Cscores = Math.floor(eval(item.ConversionFormula));
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            if (item.Score == null || item.Score == "") {
                                Yscores = "--";
                            }
                            if (Cscores == null || Cscores == "") {
                                Cscores == "--";
                            }
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Yscores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                            PageHtml += "</td>";
                            PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                            PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Cscores + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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

                        DrawChartA(WdJsonName, scorejson, MinScore, MaxScore);
                        InitAnswerRecordA(msgs.AnswerR);//加载答题记录    
                        //tests(WdJsonName, msgs.rdeor, msgs.minmaxs);
                        //DrawChart(WdJsonName, WdJson);



                    }
                }
            });

        }
        function TSLB8(Acode, _AnswerJson, sexval, AgeVal, GetType) {
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
                        var MaxminScor = "";
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        MaxminScor = msgs.MaxminScore;
                        //MaxminScor = msgs.MaxminScore.sort();                   
                        var sageOrder = MaxminScor.sort(
              function (a, b) {
                  return (b.HLDvalues - a.HLDvalues);

                  return 0;
              });
                        var scores01 = 0;
                        var scores02 = 0;
                        var scores03 = 0;
                        var ZHCode = ""; //组合代码：比如4              
                        var NameZH = "";//组合名称
                        var ZHCodeA = "";//组合代码A
                        var ZHCodeB = "";
                        var ZHCodeC = "";
                        var ALlCodeA = "";//最终组合代码
                        var NameA = "";
                        var NameB = "";
                        var NameC = "";
                        $.each(MaxminScor, function (i, item) {
                            if (i < 3) {

                                if (i == 0) {
                                    NameA = item.HLDCode;;//是否包含R,I代码

                                    if (NameZH != "") {
                                        NameZH += "+" + item.HLDname;
                                    } else {
                                        NameZH += item.HLDname;
                                    }
                                    ALlCodeA += item.HLDCode;
                                    ZHCodeA = item.HLDCode;
                                    scores01 = item.HLDvalues;
                                } else if (i == 1) {
                                    if (NameZH != "") {
                                        NameZH += "+" + item.HLDname;
                                    } else {
                                        NameZH += item.HLDname;
                                    }
                                    scores02 = item.HLDvalues;
                                    if (scores01 == scores02) {

                                        NameB = item.HLDCode;
                                        ZHCodeB = item.HLDCode;
                                        ALlCodeA += item.HLDCode;

                                    } else {
                                        ALlCodeA += item.HLDCode;
                                    }
                                } else if (i == 2) {
                                    if (NameZH != "") {
                                        NameZH += "+" + item.HLDname;
                                    } else {
                                        NameZH += item.HLDname;
                                    }
                                    scores03 = item.HLDvalues;
                                    if (scores01 == scores03)//主代码重复的
                                    {
                                        NameC = item.HLDCode;
                                    }
                                    if (scores01 == scores02 && scores01 == scores03 && scores02 == scores03) {
                                        ZHCodeC = item.HLDCode;
                                        ALlCodeA += ZHCodeA + ZHCodeB + ZHCodeC + ",";
                                        ALlCodeA += ZHCodeA + ZHCodeC + ZHCodeB + ",";
                                        ALlCodeA += ZHCodeB + ZHCodeA + ZHCodeC + ",";
                                        ALlCodeA += ZHCodeB + ZHCodeC + ZHCodeA + ",";
                                        ALlCodeA += ZHCodeC + ZHCodeA + ZHCodeB + ",";
                                        ALlCodeA += ZHCodeC + ZHCodeB + ZHCodeA + ",";
                                    }
                                    else if (scores01 == scores02) {
                                        ZHCodeC = item.HLDCode;
                                        ZHCode = ZHCodeA + ZHCodeB + ZHCodeC;
                                        ALlCodeA = ZHCode + "," + ZHCodeB + ZHCodeA + ZHCodeC;
                                    } else if (scores02 == scores03) {
                                        ZHCodeC = item.HLDCode;
                                        ZHCode = ZHCodeA + ZHCodeB + ZHCodeC;
                                        ALlCodeA = ZHCode + "," + ZHCodeA + ZHCodeC + ZHCodeB;
                                    }
                                    else {
                                        ALlCodeA += item.HLDCode;
                                    }
                                }
                            }
                        });


                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            Score = Math.floor(item.Score);
                            WdJsonName += item.WD_Name + ",";
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            scorejson += parseFloat(Math.floor(item.Score)) + ",";
                            if (cmmlists.length > 0) {

                                if (cmmlists[0].NormName.indexOf(NameA) > -1) {
                                    NormName = cmmlists[0].NormName;
                                    Result = cmmlists[0].Result;
                                    Proposal = cmmlists[0].Proposal;
                                    Startsorse = cmmlists[0].StartScore.replace("Scores", Math.floor(item.Score));

                                    OperationList = item.Tz_List;
                                    Allscore = item.Allscore;
                                    var SectioName = "";
                                    SectioName = "result" + SectionToChinese(index);
                                    SectionValue = item.Result;

                                    var zt_Type = "";
                                    zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                                    var PageHtml = "";
                                    PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" > ";
                                    PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                    PageHtml += " <tr>";
                                    PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                    PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                    PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                    PageHtml += "</td> </tr>";

                                    PageHtml += " <tr>";
                                    PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                    PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                    PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                    PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                    PageHtml += "  <p id='" + SectioName + "' style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
                                    PageHtml += " </td> </tr>";
                                    PageHtml += " <tr>";
                                    PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                    PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                    PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                                    PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' id='Proposal" + SectionToChinese(index) + "'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";

                                    PageHtml += "</td>";
                                    PageHtml += "  </tr>";
                                    PageHtml += "  </table>";
                                    PageHtml += "</div>";
                                    PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                                    $("#GeneralMessage").append(PageHtml);
                                }


                            }//

                        });


                        if (ALlCodeA != null) {
                            ALlCodeA = ALlCodeA.split(',');
                            $.each(ALlCodeA, function (index, value) {
                                var HLDResult = TSLBHLD(value);
                                var HLDTitle = "如上图，您的霍兰德代码是" + value + "(" + NameZH + ")"


                                var PageHtml = "";
                                PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-top:10pt\"> ";
                                PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                                PageHtml += " <tr>";
                                PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                                PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                                PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + HLDTitle + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td> </tr>";


                                PageHtml += " <tr>";
                                PageHtml += "  <td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                                PageHtml += " <p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【结果描述】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\">";
                                PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + HLDResult + "</p></span>";
                                PageHtml += " </td> </tr>";


                                PageHtml += "  </table>";
                                PageHtml += "</div>";

                                $("#GeneralMessage").append(PageHtml);
                            });


                        }
                        InitAnswerRecordA(msgs.AnswerR);//加载答题记录    
                        DrawChart(WdJsonName, scorejson, MinScore, MaxScore);
                    }
                }
            });

        }
        function TSLB9(Acode, _AnswerJson, sexval, AgeVal, GetType) {
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
                    var ScoreName = "";
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
                            index++;
                            var Score = "";
                            if (index == 1) {
                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 10.93) / 4.15) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.93) / 4.15) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.93) / 4.15) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 11.39) / 4.78) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.93) / 4.78) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.93) / 4.78) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 11.43) / 4.47) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.93) / 4.47) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.93) / 4.47) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 10.15) / 4.25) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.15) / 4.25) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.15) / 4.25) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 9.69) / 3.97) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.69) / 3.97) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.69) / 3.97) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 11.36) / 3.85) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.36) / 3.85) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.36) / 3.85) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 9.65) / 4.04) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.65) / 4.04) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.65) / 4.04) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 11.43) / 4.47) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.43) / 4.47) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.43) / 4.47) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 9.72) / 3.92) * 10) + 50).toFixed(2));
                                            MinScore = eval((((MinScore - 9.72) / 3.92) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((MaxScore - 9.72) / 3.92) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 6.89) / 2.42) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 6.89) / 2.42) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 6.89) / 2.42) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }
                                    }
                                    scorejson += Score + ",";


                                }
                            } else if (index == 2) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 11.59) / 5.25) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.59) / 5.25) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.59) / 5.25) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((Score - 11.49) / 4.80) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Score - 11.49) / 4.80) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Score - 11.49) / 4.80) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 9.58) / 4.76) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.58) / 4.76) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.58) / 4.76) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 11.69) / 5.15) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.69) / 5.15) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.69) / 5.15) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 10.31) / 4.07) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.31) / 4.07) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.31) / 4.07) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 12.28) / 5.27) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 12.28) / 5.27) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 12.28) / 5.27) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 12.73) / 4.81) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 12.73) / 4.81) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 12.73) / 4.81) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 11.00) / 4.54) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.00) / 4.54) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.00) / 4.54) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 10.03) / 4.38) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.03) / 4.38) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.03) / 4.38) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 11.67) / 4.71) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.67) / 4.71) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.67) / 4.71) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }//25
                                    }
                                    scorejson += Score + ",";


                                } else {
                                    Score = Math.floor(item.Score);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                                }

                            } else if (index == 3) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 7.09) / 3.01) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.09) / 3.01) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.09) / 3.01) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 8.36) / 3.65) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.36) / 3.65) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.36) / 3.65) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 8.25) / 4.19) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.25) / 4.19) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.25) / 4.19) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 7.03) / 4.12) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.03) / 4.12) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.03) / 4.12) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 6.88) / 4.09) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 6.88) / 4.09) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 6.88) / 4.09) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 7.16) / 3.14) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.16) / 3.14) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.16) / 3.14) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 7.90) / 8.25) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.90) / 8.25) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.90) / 8.25) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 8.07) / 9.74) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.07) / 9.74) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.07) / 9.74) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 5.88) / 3.90) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 5.88) / 3.90) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 5.88) / 3.90) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 8.00) / 4.23) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.00) / 4.23) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.00) / 4.23) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }
                                    }
                                    scorejson += Score + ",";


                                } else {
                                    Score = Math.floor(item.Score);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";


                                }
                            } else if (index == 4) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 9.69) / 3.88) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.69) / 3.88) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.69) / 3.88) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 11.26) / 4.16) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.26) / 4.16) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.26) / 4.16) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 10.97) / 4.33) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.97) / 4.33) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.97) / 4.33) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 13.71) / 3.65) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.71) / 3.65) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.71) / 3.65) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 13.06) / 1.92) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.06) / 1.92) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.06) / 1.92) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 11.12) / 3.05) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.12) / 3.05) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.12) / 3.05) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 13.42) / 3.82) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.42) / 3.82) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.42) / 3.82) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 13.78) / 3.95) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.78) / 3.95) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.78) / 3.95) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 16.12) / 4.08) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 16.12) / 4.08) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 16.12) / 4.08) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 13.67) / 4.42) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.67) / 4.42) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.67) / 4.42) * 10) + 50).toFixed(2);
                                        } else {
                                            ScoreName = 0;
                                        }
                                    }
                                    scorejson += Score + ",";


                                } else {
                                    Score = Math.floor(item.Score);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                                }

                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                            if (Score != "" && Score != null) {
                                for (var i = 0; i < cmmlists.length; i++) {
                                    Startsorse = cmmlists[i].StartScore.replace("Scores", Score);
                                    Endsorse = cmmlists[i].EndScore.replace("Scores", Score)
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
                            } else {
                                Score = "--";
                            }
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "维度" + SectionToChinese(index) + ",";
                            var zt_Type = "";
                            var Yscore = item.Score.toFixed(2);
                            if (item.Score == null || item.Score == "") {
                                Yscore = "--";
                            }
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var PageHtml = "";
                            PageHtml += "<div class=\"col-md-12 col-sm-12 col-xs-12\" style=\"margin-bottom:20pt\"> ";
                            PageHtml += " <table align=\"center\" class=\"MsoTableGrid\" style=\"border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;\">";
                            PageHtml += " <tr>";
                            PageHtml += " <td colspan=\"3\" style=\"width: 498.1000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(190,190,190);\" valign=\"center\" width=\"664\">";
                            PageHtml += "  <p class=\"MsoNormal\" style=\"text-align:left;\">";
                            PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + item.WD_Name + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                        HightsTSLB9(scorejson);
                        InitAnswerRecordA(msgs.AnswerR);//加载答题记录  
                    }
                }
            });

        }
        function TSLB901(Acode, _AnswerJson, sexval, AgeVal, GetType) {
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
                            index++;
                            var Score = item.Score;
                            if (index == 1) {
                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        Score = parseFloat(eval((((Score - 13.49) / 3.02) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 13.49) / 3.02) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 13.49) / 3.02) * 10) + 50).toFixed(2);

                                    } else if (sexval == 2) {
                                        Score = parseFloat(eval((((Score - 12.43) / 3.45) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 12.43) / 3.45) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 12.43) / 3.45) * 10) + 50).toFixed(2);
                                    }
                                    scorejson += Score + ",";


                                }
                            } else if (index == 2) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        Score = parseFloat(eval((((Score - 5.98) / 3.51) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 5.98) / 3.51) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 5.98) / 3.51) * 10) + 50).toFixed(2);

                                    } else if (sexval == 2) {
                                        Score = parseFloat(eval((((Score - 6.08) / 3.80) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 6.08) / 3.80) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 6.08) / 3.80) * 10) + 50).toFixed(2);
                                    }
                                    scorejson += Score + ",";


                                } else {
                                    Score = Math.floor(item.Score);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                                }

                            } else if (index == 3) {
                                if (sexval == 1) {
                                    Score = parseFloat(eval((((Score - 4.02) / 2.75) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 4.02) / 2.75) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 4.02) / 2.75) * 10) + 50).toFixed(2);

                                } else if (sexval == 2) {
                                    Score = parseFloat(eval((((Score - 3.08) / 2.27) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 3.08) / 2.27) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 3.08) / 2.27) * 10) + 50).toFixed(2);
                                }
                                scorejson += Score + ",";
                            } else if (index == 4) {

                                if (sexval == 1) {
                                    Score = parseFloat(eval((((Score - 12.48) / 3.35) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 12.48) / 3.35) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 12.48) / 3.35) * 10) + 50).toFixed(2);

                                } else if (sexval == 2) {
                                    Score = parseFloat(eval((((Score - 13.52) / 3.32) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 13.52) / 3.32) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 13.52) / 3.32) * 10) + 50).toFixed(2);
                                }
                                scorejson += Score + ",";

                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                            for (var i = 0; i < cmmlists.length; i++) {
                                Startsorse = cmmlists[i].StartScore.replace("Scores", Score);
                                Endsorse = cmmlists[i].EndScore.replace("Scores", Score)
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

                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "维度" + SectionToChinese(index) + ",";
                            var YScore = item.Score.toFixed(2);
                            if (item.Score == null || item.Score == "") {
                                YScore = "--";

                            }
                            if (Score == null || Score == "") {
                                Score = "--";
                            }
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
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
                            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + YScore + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
                            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                            PageHtml += "</td>";
                            PageHtml += "  </tr>";
                            PageHtml += "  </table>";
                            PageHtml += "</div>";
                            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                            $("#GeneralMessage").append(PageHtml);
                        });
                        HightsTSLB9(scorejson);
                        InitAnswerRecordA(msgs.AnswerR);//加载答题记录  
                    }
                }
            });

        }//之前的--
        //防御方式问卷
        function TSLB801(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AnswerIDs = getUrlParam("A_ID");
            var IndexA = "";
            var IndexB = "";
            var IndexC = "";
            var IndexMax = "";
            var WDName = "";
            var TSResult="";
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
                        var  IndexScoresA=msgs.datas[0].Score;
                        var  IndexScoreB=msgs.datas[1].Score;
                        var  IndexScoreC=msgs.datas[2].Score;
                         IndexA = eval(IndexScoresA / 30.00).toFixed(2);
                         IndexB = eval(IndexScoreB / 40.00).toFixed(2);
                         IndexC = eval(IndexScoreC / 8.00).toFixed(2);
                        $.each(msgs.datas, function (index, item) {
                            index++;
                            var Score = "";
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));

                               

                            } else {
                                Score = item.Score;
                            }
                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var ConverScoreA = "";
                            if (Score != null && Score != "") {
                                
                                if ((IndexA == IndexB) && (IndexA == IndexC))
                                {
                                    if (index == 1) {
                                        scorejson += IndexA + ",";
                                        WDName = "不成熟防御机制";
                                        A = 1;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoresA;
                                    } else if (index == 2)
                                    {
                                        scorejson += IndexA + ",";
                                        WDName = "中间型防御机制";
                                        A = 2;
                                        WdJsonName += WDName + ",";
                                        Score = item.Score.toFixed(2);
                                        Score = IndexScoreB;
                                    } else if(index == 3)
                                    {
                                        scorejson += IndexA + ",";
                                        WDName = "成熟防御机制";
                                        A = 3;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoreC;
                                    }
                                    TSResult="您在不成熟的防御机制和成熟的防御机制,中间型防御机制三个维度上得分相等，综合分析，这种情况较为少见，保证认真作答的基础上，结果解释仅供参考。";
                                } else if ((IndexA == IndexB && IndexA > IndexC))
                                {
                                    if (index == 1) {
                                        scorejson += IndexA + ",";
                                        WDName = "不成熟防御机制";
                                        A = 1;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoresA;
                                    } else if (index == 2) {
                                        scorejson += IndexB + ",";
                                        WDName = "中间型防御机制";
                                        A = 2;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoreB;
                                    }
                                    TSResult="您在不成熟的防御机制和中间型防御机制两个维度上得分相等，综合分析，这种情况较为少见，保证认真作答的基础上，结果解释仅供参考。";
                                }
                                else if ((IndexA == IndexC && IndexA > IndexB))
                                {
                                    if (index == 1) {
                                        scorejson += IndexA + ",";
                                        WDName = "不成熟防御机制";
                                        A = 1;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoresA;
                                    } else if (index == 3) {
                                        scorejson += IndexC + ",";
                                        WDName = "成熟防御机制";
                                        A = 3;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoreC;
                                    }
                                     TSResult="您在不成熟的防御机制和成熟防御机制两个维度上得分相等，综合分析，这种情况较为少见，保证认真作答的基础上，结果解释仅供参考。";
                                } else if ((IndexB == IndexC && IndexB > IndexA))
                                {
                                    if (index == 2) {
                                        scorejson += IndexB + ",";
                                        WDName = "中间型防御机制";
                                        A = 2;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoreB;
                                    } else if (index == 3) {
                                        scorejson += IndexC + ",";
                                        WDName = "成熟防御机制";
                                        A = 3;
                                        WdJsonName += WDName + ",";
                                        Score = IndexScoreC;
                                    }
                                     TSResult="您在中间型防御机制和成熟的防御机制两个维度上得分相等，综合分析，这种情况较为少见，保证认真作答的基础上，结果解释仅供参考。";
                                }
                                else
                                {
                                    if (index == 1) {

                                        scorejson += IndexA + ",";
                                        WdJsonName += item.WD_Name + ",";
                                    } else if (index == 2) {

                                        //IndexB = eval(Score / 40.00).toFixed(2);
                                        scorejson += IndexB + ",";
                                        WdJsonName += item.WD_Name + ",";
                                    } else if (index == 3) {
                                        //IndexC = eval(Score / 8.00).toFixed(2);
                                        scorejson += IndexC + ",";
                                        if (IndexA > IndexB) {
                                            WDName = "不成熟防御机制";
                                            A = 1;
                                            IndexMax = IndexA;
                                            ConverScoreA = IndexA;
                                            Score = IndexScoresA;

                                        } else {
                                            A = 2;
                                            WDName = "中间型防御机制";
                                            IndexMax = IndexB;
                                            ConverScoreA = IndexB;
                                            Score = IndexScoreB;
                                        }
                                        if (IndexMax < IndexC) {
                                            A = 3;
                                            WDName = "成熟防御机制";
                                            IndexMax = IndexC;
                                            ConverScoreA = IndexC
                                            Score = IndexScoreC;
                                        }
                                        WdJsonName += item.WD_Name + ",";
                                    }                             

                                } if (index == 4) {
                                    Score = item.Score.toFixed(2);
                                    ConverScoreA = eval(Score / 10.00).toFixed(2);
                                    scorejson += ConverScoreA + ",";
                                    WDName = item.WD_Name;
                                    WdJsonName += WDName + ",";
                                    if (ConverScoreA < 4) {
                                        NormName = "掩饰性较低";
                                        Result += "您在问卷中的掩饰度较小，表明您本次作答的可信度较高。";
                                        Proposal = "--";

                                    } else if (4 <= ConverScoreA && ConverScoreA <= 6) {
                                        NormName = "掩饰性一般";
                                        Result += "您在掩饰维度上的得分处于中等水平，表明您可能为了制造较好的社会形象而在做答的时候否认一部分您认为自身不太好的情况。";
                                        Proposal = "--";
                                    } else if (ConverScoreA > 6) {
                                        NormName = "掩饰性较高";
                                        Result += "您在掩饰维度上的得分处于较高水平，您可能为了制造较好的社会形象而在做答的时候否认很大一部分您认为自身不太好的情况，没有真实作答。";
                                        Proposal = "--";
                                    }
                                }
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }
                            }
                            if (A == 1) {
                                NormName = "--";
                                if(TSResult !="" && TSResult !=null)
                                    {
                                Result+= TSResult+"</br>";
                                    }
                                Result += "从量表的得分来看，您在面对问题和挫折时，较多采取不成熟防御机制，主要表现为经常采用" + WDName + "的防御方式。</br>";
                                Result += "（1）投射：把自己难以接受的冲动或情感归于他人。如，我们常常把自己的缺点投射到亲近的人身上而责怪对方。</br>";
                                Result += "（2）被动攻击：不能直接表达自己的不满，而使用被动、消极的方式显示出攻击性。例如，采用遗忘、怠惰等方式。</br>";
                                Result += "（3）潜意显现：把不适当的行为说成是不由自主产生的。这种做法可以推卸自己的责任，但同时会对自己的自控能力失去信心。</br>";
                                Result += "（4）抱怨：责怪别人以表达心中的不满。抱怨不能解决任何实际问题，反而可能破坏自己与他人的关系，进而使自己感觉更加不好。</br>";
                                Result += "（5）幻想：当现实生活非常痛苦、难以忍受的时候，将注意力转移到自己幻想的内在世界，用白日梦或愿望替代实际行动。</br>";
                                Result += "（6）分裂：极端的看待事物。这种做法不能够全面的看待事物。</br>";
                                Result += "（7）退缩：当遇到严重挫折时，放弃成人的方式不用，而退化到儿童期，依赖别人，害怕再负起成人的责任。</br>";
                                Result += "（8）躯体化：将内心的不愉悦以身体不适的形式表现出来。躯体化有可能使自己避免做不愿做的事情，但长期的躯体化会导致体质下降。</br> ";

                                Proposal += "不成熟的防御方式虽然能够在一定程度上减低焦虑水平，但对心理健康弊远大于利，而成年人过多使用不成熟的防御方式往往表示心理有障碍。建议您可以做进一步的检查，以明确问题的性质，若问题较为严重则建议您到专业的心理咨询或治疗机构寻求帮助，给您制定合适的方案帮您恢复到正常状态。";
                            }
                            else if (A == 2) {
                                NormName = "--";
                                 if(TSResult !="" && TSResult !=null)
                                    {
                                Result+= TSResult+"</br>";
                                 }
                                 Result += " 从量表的得分来看，您在面对问题和挫折时，较多采取中间型的防御机制，主要表现为经常采用" + WDName + "的防御方式。</br>";
                                 Result += "（1）反作用形成：把感到有危险的愿望或冲动转化成相反的表现。反作用形成可以避免危险的愿望和冲动发生，但长期如此会加重自身的痛苦。</br>";
                                 Result += "（2）解除：用一种象征性的事物来抵消已经发生的不愉快的事情。例如，按我国习惯，过阴历年时不要打破东西。万一小孩打破了碗，老人则赶快说岁岁平安.</br>";
                                 Result += "（3）制止：因为害羞或者其他原因而不做一些事情，如羞于与人打交道。制止的方式虽然避免了自己主观的情绪感受，但可能使自己丧失很多机会。</br>";
                                 Result += "（4）回避：避开可能要遭到的拒绝或失败，以及由它们导致的心理痛苦。但回避会带来不可避免的孤独与寂寞，而且不能因此而消除原有的恐惧感。</br>";
                                 Result += "（5）理想化：把某个人作为理想的典范，如认为有这样一个人，他什么都能做而且做的合理正直。理想化不是为自己设立目标，而是为自己寻求保护伞，合理的降低自身的重要性。</br>";
                                 Result += "（6）假性利他：帮助他人以使自己心情愉快。假性利他可以使自己获得人们的好评，同时得到自身满足。</br>";
                                 Result += "（7）伴无能之全能：认为自己非常棒、无所不能，但又没有得到应有的赏识。这种自我感觉良好的防御方式使自己充满信心，但给别人的印象就不是很好了。</br>";
                                 Result += "（8）隔离：把言语认知与有关的情感割裂开来，使人去除难以忍受的冲突情感。在强迫症中常见。例如，获知自己患上绝症的个体专注于考虑康复的统计概率，而不能面对自己的恐惧和悲伤。</br>";
                                 Result += "（9）同一化：认为自己期待的也是别人的期待，如某人正在想剥夺我所得到的一切。同一化会使自己随时有危机感。</br>";
                                 Result += "（10）否认：拒绝接受现实，仿佛令人痛苦的事件、想法或情感并不存在一样。例如，拒绝承认亲人的亡故。</br>";
                                 Result += "（11）交往倾向：用交往的方式减轻或消除自身的痛苦，如陷入某种危机时，寻找另一个具有同样命运的人。有人分担自己的痛苦，痛苦的感觉会减轻，但长此以往会令朋友厌烦。</br>";
                                 Result += "（12）消耗倾向：利用吃、喝等方式抵抗不好的情绪感受。消耗倾向会造成营养不良或过剩以及药物成瘾的不良后果。</br>";
                                 Result += "（13）期望：希望对将要面对的问题做好充分准备，如意识到不得不面临一场困境的时候，如考试、面试等，试图想象它会如何，并计划出一些方法去应付它。</br>";

                                 Proposal += "您目前对自己的控制程度较高，希望继续保持，在面对应激情境时有时会用成熟的防御机制来解决问题，但有时也会存在否认、回避等倾向，建议您能够向成熟的防御机制转变。";
                             
                            }
                            else if (A == 3) {
                                NormName = "--";
                                 if(TSResult !="" && TSResult !=null)
                                    {
                                    Result+= TSResult+"</br>";
                                    }
                                 Result += "从量表的得分来看，您在面对问题和挫折时，较多采取成熟防御机制，主要表现为经常采用" + WDName + "的防御方式。</br>";
                                 Result += "（1）升华：把攻击性或性的冲动导向比较崇高的方向，使其具有建设性，有利于社会和本人。例如，一位具有强烈嫉妒心的人，理智又不允许他表现出嫉妒别人的成就，于是他发奋学习，成绩超过别人。这对于社会和他本人均有积极意义。</br>";
                                 Result += "（2）幽默：遇到困境时，以幽默的方式加以解决，让心情变得达观而轻松。</br>";
                                 Result += "（3）压抑：把不能接受的冲动阻挡在意识之外。个体把令人痛苦的事情置之脑后，把它忘记。经过练习，这会成为自动的过程，于是个体真的不记得某些发生过的事情了。</br>";
                                 Result += " 您在自我接纳维度上的得分较低，表明您的自己接纳水平较低。主要表现为：不能充分的接纳自己的优缺点或者自己的性格特点，担心在社会交往中被贬低，有时也不能很好地接纳他人。</br>";

                                 Proposal += " 善于利用成熟的防御方式来面对应激情境，是您的优点，能帮助您较好地处理问题，希望您在生活中可以继续保持这样的状态。";
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
                            //if (WDlength == 1) {
                            //    WDName = item.WD_Name;
                            //}
                            //else {
                            //    WDName = + item.WD_Name;

                            //}
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName
                            var YScoreA = item.Score.toFixed(2);
                            var CScoreA = eval(item.ConversionFormula).toFixed(2);
                            if ((YScoreA == null || YScoreA == "") || (CScoreA == null || CScoreA == "")) {
                                YScoreA = "--";
                                CScoreA = "--";
                            }
                            if ((IndexA == IndexB) &&(IndexA == IndexC)) {
                                if (index == 1 || index == 2 || index == 3 || index == 4) {

                                    TSLB801Html(WDName, Score, IndexA, zt_Type, Result, Proposal)
                                }
                            }
                            else if (IndexA == IndexB && (IndexA>IndexC))   
                            {
                                if (index == 1 || index==2 || index == 4) {
                                    TSLB801Html(WDName, Score, IndexA, zt_Type, Result, Proposal)
                                }
                            } else if (IndexA == IndexC && IndexA>IndexB)
                            {
                                if (index == 1 || index == 3 || index == 4) {
                                    TSLB801Html(WDName, Score, IndexC, zt_Type, Result, Proposal)
                                }
                            } else if (IndexB == IndexC && IndexB>IndexA)
                            {
                                if (index == 2 || index == 3 || index == 4) {
                                    TSLB801Html(WDName, Score, IndexB, zt_Type, Result, Proposal)
                                }
                            }  else {
                                if (index == 3 || index == 4) {
                                    TSLB801Html(WDName, Score, ConverScoreA, zt_Type, Result, Proposal)
                                }
                            }
                               //最大值和最小值
                          
                        });
                        
                        DrawChartA(WdJsonName, scorejson, 0,10);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        function TSLB802(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var DataArry = [];

            var AnswerIDs = getUrlParam("A_ID");
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialReport.ashx",
                data: {
                    Remark: "InitWDPages",
                    A_code: Acode,
                    An_json: _AnswerJson,
                    AnswerId: AnswerIDs,
                    types: 802
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
                               
                            } else {
                                Score = item.Score.toFixed(2);

                            }
                            WdJsonName += item.WD_Name + ",";
                            //var IndexA = "";
                            //var IndexB = "";
                            //var IndexC = "";
                            //var IndexMax = "";
                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var Scores0A = "";
                            var ConverScoreA = "";
                            var WDNameA = "";
                            var Scores0B = "";
                            var ConverScoreB = "";
                            var WDNameB = "";
                            var Scores0C = "";
                            var WDNameC = "";
                            var WDNameTypeA = "";
                            var WDNameTypeB = "";
                            if ((Score != null && Score != "") || Score == 0) {
                                if (item.WD_Name.indexOf("退避") > -1) {
                                    Score = eval(Score / 10);
                                    Score = Score.toFixed(2)
                                    var STA = { 'name': 'A', 'ScoreA': Score, 'WDName': item.WD_Name }
                                    DataArry.push(STA);


                                } else if (item.WD_Name.indexOf("自责") > -1) {

                                    Score = eval(Score / 11);
                                    Score = Score.toFixed(2)
                                    var STA = { 'name': 'B', 'ScoreA': Score, 'WDName': item.WD_Name }
                                    DataArry.push(STA);
                                } else if (item.WD_Name.indexOf("幻想") > -1) {

                                    Score = eval(Score / 10);
                                    Score = Score.toFixed(2)
                                    var STA = { 'name': 'C', 'ScoreA': Score, 'WDName': item.WD_Name }
                                    DataArry.push(STA);
                                } else if (item.WD_Name.indexOf("求助") > -1) {

                                    Score = eval(Score / 10);
                                    Score = Score.toFixed(2)
                                    var STA = { 'name': 'D', 'ScoreA': Score, 'WDName': item.WD_Name }
                                    DataArry.push(STA);

                                }
                                else if (item.WD_Name.indexOf("解决问题") > -1) {

                                    Score = eval(Score / 12);
                                    Score = Score.toFixed(2)
                                    var STA = { 'name': 'E', 'ScoreA': Score, 'WDName': item.WD_Name }
                                    DataArry.push(STA);
                                }
                                else if (item.WD_Name.indexOf("合理化") > -1) {
                                    var WDNames =
                                       Score = eval(Score / 11);
                                      Score = Score.toFixed(2)
                                    var STA = { 'name': 'F', 'ScoreA': Score, 'WDName': item.WD_Name }
                                    DataArry.push(STA);

                                    var sageOrder = DataArry.sort(
                                        function (a, b) {
                                            return (b.ScoreA - a.ScoreA);
                                        });
                                    var OrderName01 = sageOrder[0].ScoreA;
                                    var OrderName02 = sageOrder[1].ScoreA;
                                    var OrderName03 = sageOrder[2].ScoreA;
                                    var OrderName04=sageOrder[3].ScoreA;
                                    var OrderName05=sageOrder[4].ScoreA;
                                    var OrderName06=sageOrder[5].ScoreA;
                                    $.each(sageOrder, function (index, obj) {
                                        if ((OrderName01 == OrderName02) && (OrderName02 == OrderName02) && (OrderName03 == OrderName04))//几种情况相等的状态
                                        {
                                            if (index == 0) {
                                                Scores0A = item.Score.toFixed(2);
                                                ConverScoreA = obj.ScoreA;

                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name
                                            }
                                            if (index == 1) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                            if (index == 2) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            } if (index == 3) {
                                                Scores0C = item.Score.toFixed(2);
                                                ConverScoreC = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                        }
                                       else if ((OrderName01 == OrderName02) && (OrderName02== OrderName03)) {
                                            if (index == 0) {
                                                Scores0A = item.Score.toFixed(2);
                                                ConverScoreA = obj.ScoreA;

                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name
                                            }
                                            if (index == 1) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                            if (index == 2) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                        } 
                                        else if (OrderName04 == OrderName05 && OrderName05 == OrderName06) {
                                            if (index == 0) {
                                                Scores0A = item.Score.toFixed(2);
                                                ConverScoreA = obj.ScoreA;

                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name
                                            }
                                            if (index == 1) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                        }
                                        else {
                                            if (index < 2) {
                                                //WdJsonName +="obj.WDName"+",";
                                                if (index == 0) {
                                                    Scores0A = item.Score.toFixed(2);
                                                    ConverScoreA = obj.ScoreA;
                                                    if (WDName != null && WDName != "") {
                                                        WDNameA += obj.WDName;

                                                    } else {
                                                        WDNameA += "," + obj.WDName;
                                                    }
                                                    WDNameTypeA += obj.name
                                                }
                                                if (index == 1) {
                                                    Scores0B = item.Score.toFixed(2);
                                                    ConverScoreB = obj.ScoreA;
                                                    if (WDName != null && WDName != "") {
                                                        WDNameA += obj.WDName;

                                                    } else {
                                                        WDNameA += "," + obj.WDName;
                                                    }
                                                    WDNameTypeA += obj.name;
                                                }
                                            }
                                        }

                                    });
                                    var WDTypeA = 'ABC';
                                    var WDTypeA1 = 'ACB';
                                    var WDTypeA2 = 'BAC';
                                    var WDTypeA3 = 'BCA';
                                    var WDTypeA4 = 'CAB';
                                    var WDTypeA5 = 'CBA';


                                    var WDTypeB = 'DEF';
                                    var WDTypeB1 = 'DFE';
                                    var WDTypeB2 = 'EDF';
                                    var WDTypeB3 = 'EFD';
                                    var WDTypeB4 = 'FDE';
                                    var WDTypeB5 = 'FED';
                                    if (WDTypeA.indexOf(WDNameTypeA) > -1 || WDTypeA1.indexOf(WDNameTypeA) > -1 || WDTypeA2.indexOf(WDNameTypeA) > -1 || WDTypeA3.indexOf(WDNameTypeA) > -1 || WDTypeA4.indexOf(WDNameTypeA) > -1 || WDTypeA5.indexOf(WDNameTypeA) > -1) {
                                        NormName = "非成熟型";
                                        Result = "   从量表的得分来看，您在面对问题和挫折时，经常采用的应对方式是" + WDNameA + "，您的应对方式属于非成熟型。可能表现为：在生活中常以“退避”、“自责”和“幻想”等应付方式应付困难和挫折，而较少使用“解决问题”和“求助”这类积极的应付方式，情绪和行为缺乏稳定性。";
                                        Proposal = " 您的应付方式属于不成熟型，这种方式只能起到一定阶段和程度的压力缓解，有利于短时间心态的调整，但往往不能解决根本问题。希望您能够养成正视问题、解决问题的思维习惯，可以通过和老师或父母的沟通得到指导也可以阅读关于积极应对方面的书籍来提高，从而形成一种成熟的压力应对方式。";
                                    } else if (WDTypeB.indexOf(WDNameTypeA) > -1 || WDTypeB1.indexOf(WDNameTypeA) > -1 || WDTypeB2.indexOf(WDNameTypeA) > -1 || WDTypeB.indexOf(WDNameTypeA) > -1 || WDTypeB3.indexOf(WDNameTypeA) > -1 || WDTypeB4.indexOf(WDNameTypeA) > -1 || WDTypeB5.indexOf(WDNameTypeA) > -1) {
                                        NormName = "成熟型";//状态
                                        Result = " 从量表的得分来看，您在面对问题和挫折时，经常采用的应对方式是" + WDNameA + "，您的应对方式属于成熟型。主要表现为：在面对应激事件或环境时，常能采取“解决问题”和“求助”等成熟的应付方式，而较少使用“退避”，“自责”和“幻想”等不成熟的应付方式；在生活中表现出一种成熟稳定的人格特征和行为方式；善于思考，能理智地应对困境并善于从失败中吸取经验。";//结果
                                        Proposal = "人在面对困难的时候，会有不同的应对方式，不同的应对方式体现出了一个人的成熟程度是不一样的。面对困难如果能够善于发现一些问题，并根据问题循序渐进地去解决，就可能就会比较游刃有余地去解决所面对的压力和问题。您当前属于一种积极成熟的应对方式，有利于问题的解决，希望您继续保持这种作风。";
                                    }
                                    else {
                                        NormName = "混合型";//状态
                                        Result = "  从量表的得分来看，您在面对问题和挫折时，经常采用的应对方式是" + WDNameA + "，您的应对方式属于混合型。您的应付方式集成熟与不成熟的应付方式于一体，在应付行为上表现出一种矛盾的心态和两面性的人格特点。";//结果
                                        Proposal = "   建议您在面对困难时能够善于去发现一些问题，并根据问题循序渐进地去解决，就可能就会比较游刃有余地去解决所面对的压力和问题。反之，就可能就会陷入到一种被动的、消极的状态。希望您可以养成更多地学会面对问题，寻求解决的细微习惯，从而形成一种成熟的压力应对方式。";
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
                                    PageHtml += " <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\">" + zt_Type + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:12.0000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                    PageHtml += "</td> </tr>";





                                    //PageHtml += "  <tr style=\"height:27.2500pt;\">";
                                    //PageHtml += "<td style=\"width: 143.0500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: none; ; mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"center\" width=\"190\">";
                                    //PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                    //PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Scores0B + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                    //PageHtml += "</td>";
                                    //PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                                    //PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                    //PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + ConverScoreB + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                    //PageHtml += " </td></tr>";



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
                                scorejson += parseFloat(Score) + ","
                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }
                            }
                        });

                        DrawChartA(WdJsonName, scorejson, 0, 1.1);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        function TSLB14(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
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
                    var WDScoreA = "";
                    var WDScoreB = "";
                    var AllscoreA = 0;
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

                               

                            } else {
                                Score = item.Score.toFixed(2);
                                //scorejson += parseFloat(item.Score.toFixed(2)) + ",";
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

                            if (item.WD_Name.indexOf('违纪行为型') > -1) {

                                WDScoreA = parseInt(Score);
                                AllscoreA += parseInt(Score);
                            } else if (item.WD_Name.indexOf('神经症行为型') > -1) {

                                AllscoreA += parseInt(Score);
                                WDScoreB = parseInt(Score);
                            }
                            else if (index == 3) {

                                AllscoreA += parseInt(Score);
                                WdJsonName += "总评" + ",";

                                scorejson += parseFloat(AllscoreA) + ",";
                                if (AllscoreA != null && AllscoreA != "") {
                                    AllscoreA = parseInt(AllscoreA);
                                    if (AllscoreA < 9) {
                                        NormName = "无行为问题";
                                        Result += "从测试结果来看，该生各项行为均正常，基本不存在行为或情绪上的问题。";
                                        Proposal += "该生当前状态良好，建议老师和父母继续完善自身角色，形成和保持良好的教育方式，在其身心发展过程中加以适时适当地引导，为该生营造更加健康的成长环境和学习环境。";
                                    } else if (AllscoreA >= 9 && WDScoreA > WDScoreB) {
                                        NormName = "A行为问题";
                                        Result = "从测试结果来看，该生可能存在A行为问题倾向（即违纪行为或反社会行为）。可能表现为：经常破坏自己和别人的东西、不听管教、说谎、欺负别的儿童、偷东西等行为问题。";
                                        Proposal += "持久的A行为可能对儿童健全人格的发展起较强的阻碍作用。建议老师首先和该生的父母进行沟通，分析导致问题的可能原因；其次，根据该生的状态和父母一起制定适合的调整方案，可以通过以下几点进行改善：第一，适当控制该生的交友范围，让该生处于正面积极的成长氛围中，隔绝不良信息；第二，老师和父母要做好榜样，为该生树立良好的“模仿”对象，该生出现正面行为时要给予及时的鼓励和表扬；第三，老师可以安排一些具有积极意义的游戏或活动，让该生参与，并及时给予引导。如果效果不明显，那么建议及时到专业的心理咨询机构进行咨询，给其制定适合的方案进行矫正。";

                                    } else if (AllscoreA >= 9 && WDScoreA < WDScoreB) {
                                        NormName = "N行为问题";
                                        Result += "从测试结果来看，该生可能存在N行为问题（即神经症行为）。可能表现为：腹痛、呕吐，经常烦恼；害怕新事物和新环境，到学校就哭或拒绝上学；睡眠障碍等神经症行为。";
                                        Proposal += "神经症行为会给该生的日常学习、生活和人际交往等各方面造成负面影响，严重者可能不能正常上学。建议老师及时和家长沟通，先带该生做相应身体检查，确定是否存在生理上的疾病，排除生理疾病后若问题长时间不能缓解，建议让其求助于专业的心理咨询和心理治疗机构，给其制定有效的方案进行矫正。";

                                    } else if (AllscoreA >= 9 && WDScoreA == WDScoreB) {
                                        NormName = "M行为问题";
                                        Result += "从测试结果来看，该生可能存在M行为问题，即同时表现出了A行为（即违纪行为或反社会行为）和N行为（即神经症行为）。可能表现为：经常破坏自己和别人的东西、不听管教、说谎、欺负别的儿童、偷东西；腹痛、呕吐，经常烦恼；害怕新事物和新环境，睡眠障碍等。";
                                        Proposal += "M行为问题可能会严重影响该生正常的学习与生活，甚至产生躯体性疾病。建议老师及时和家长沟通，首先带该生去医院做相应的身体检查，确定是否存在器质性病变；同时希望老师和父母学习和使用科学的教育方法，保障该生处于健康和谐的成长环境。如果问题长时间不能缓解，建议求助于专业的心理咨询和心理治疗机构，给其制定有效的方案进行矫正。";
                                    }
                                } else if (AllscoreA == 0) {
                                    if (AllscoreA < 9) {
                                        NormName = "无行为问题";
                                        Result += "从测试结果来看，该生各项行为均正常，基本不存在行为或情绪上的问题。";
                                        Proposal += "该生当前状态良好，建议老师和父母继续完善自身角色，形成和保持良好的教育方式，在其身心发展过程中加以适时适当地引导，为该生营造更加健康的成长环境和学习环境。";
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

                                var WDName = "";
                                WDName = "总评";
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
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                                PageHtml += "</td>";
                                PageHtml += "<td style=\"width: 155.8000pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: none; ; mso-border-left-alt: none;; border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"207\">";
                                PageHtml += "   <p  class=\"MsoNormal\" style=\"margin-bottom:7.8000pt;mso-para-margin-bottom:0.5000gd;\">";
                                PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">标准分：</span><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + AllscoreA + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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

                                if (Score != null && Score != "") {
                                    if (Score < MinScore) {
                                        MinScore = Score
                                    } if (Score > MaxScore) {
                                        MaxScore = Score;
                                    }
                                }

                            }
                        });

                        DrawChartA(WdJsonName, scorejson, 0, 52);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }

        function TSLB10(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
            var AllscoreA = "";
            var NormName = "";//状态
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
                    var WDScoreA = "";
                    var WDScoreB = "";
                    $("#GeneralMessage").html("");
                    var WdJsonName = "";
                    WdJsonName += "总评" + ",";
                    var scorejson = "";

                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        AllscoreA = msgs.datas[0].Score;
                        scorejson += AllscoreA + ",";
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
                        var Result = "";//结果
                        var Proposal = "";
                        var TZNumber = 0;
                        // var arr = new Array('TZ_148111893927314', 'TZ_148111893927824', 'TZ_148111893928134', 'TZ_148111893928444', 'TZ_148111893928854', 'TZ_148111893929164', 'TZ_148111893929474', 'TZ_148111893929884', 'TZ_148111893930094', 'TZ_1481118939303104', 'TZ_1481118939307114', 'TZ_1481118939311124', 'TZ_1481118939314134', 'TZ_1481118939317144', 'TZ_1481118939320154');
                        var ArrShuju = ['TZ_148111893927314', 'TZ_148111893927824', 'TZ_148111893928134', 'TZ_148111893928444', 'TZ_148111893928854', 'TZ_148111893929164', 'TZ_148111893929474', 'TZ_148111893929884', 'TZ_148111893930094', 'TZ_1481118939303104', 'TZ_1481118939307114', 'TZ_1481118939311124', 'TZ_1481118939314134', 'TZ_1481118939317144', 'TZ_1481118939320154'];
                        var AnserJSon = JSON.parse(_AnswerJson)
                        for (var o in AnserJSon) {

                            var obj = AnserJSon[o];
                            if (ArrShuju.toString().indexOf(obj) > -1) {
                                TZNumber++;
                            }

                        }
                        var AnswerIDs = getUrlParam("A_ID");

                        AllscoreA = parseInt(AllscoreA);
                        if (AllscoreA < 30) {
                            NormName = "正常";
                            Result += " 该学生在量表上的得分较低，表明该学生的社交表现和言语行为等都很正常，表现出与年龄相当的心理与身体功能，并未表现出孤独症状。";
                            Proposal += "该学生当前状态良好，建议老师提示父母在日常生活中应注意为该学生提供一个良好的成长、交友环境，这对该学生的健康发展是必不可少的。";
                        }
                        else if ((30 <= AllscoreA && AllscoreA < 36) || (AllscoreA >= 36) && (TZNumber < 5)) {
                            NormName = "轻-中度孤独症";
                            Result += "该学生在量表上的得分处于中间状态，表明该学生可能有轻微的孤独症症状，可能表现为：在人际关系中有某种程度的回避他人的行为，情感反应和躯体运动能力有些刻板，一些心理机能的发展与年龄不符等。";
                            Proposal += "建议老师提示家长应努力为该学生提供一个良好的成长环境，宽容谨慎地对待该学生的行为表现，不过分批评与评价，不与其他学生作简单地比较。如有需要可以到正规医院做进一步地检查诊断，以明确问题。";

                        }
                        else if (AllscoreA >= 36 && TZNumber >= 5) {
                            NormName = "重度孤独症";
                            Result += "该学生在量表上的得分较高，表明该学生可能属于重度孤独症。可能表现为：该学生的情感反应十分刻板，智力功能也存在一定的障碍，并有强烈的回避人际交往的倾向，某些动作技能迟缓，可能重复性地做一些无意义的小动作等。";
                            Proposal += "重度抑郁症会严重影响该学生正常的人际融入和身心功能的发展，建议老师提示家长带该学生到专科医院进行及时诊断治疗。另外在教学中应为该学生提供一个良好的成长环境，宽容谨慎地对待该学生的行为表现，不过分批评与评价，不与其他学生作简单地比较。";
                        }
                        if (NormName == null || NormName == "") {
                            NormName = "无";
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
                        // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
                        PageHtml += " </td> </tr>";

                        PageHtml += " <tr>";
                        PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
                        PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
                        PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

                        PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;'>" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
                        // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
                        PageHtml += "</td>";
                        PageHtml += "  </tr>";
                        PageHtml += "  </table>";
                        PageHtml += "</div>";
                        //PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" value='" + SectionToChinese(index) + "'/>";
                        $("#GeneralMessage").append(PageHtml);


                        DrawChartA(WdJsonName, scorejson, 10, 65);
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                        <%--    ReportInsert(AnswerIDs, strJsonA);--%>

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


        function InitAnswerRecord(AR) {

            if (AR != null && AR != "") {
                //创建表格
                //ARLength=AR.toString().length;
                ARLength = getJsonObjLength(AR);
                ARLength = ARLength - 1;
                var rowCount = Math.ceil(ARLength / 10);

                var windowHeight = window.innerWidth;
                var columnCount = 10;
                //if (windowHeight < 768)
                //    columnCount = 6;
                //else if (windowHeight)
                    //columnCount = 10;

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
                ARLength = AR.length;

                var rowCount = Math.ceil(ARLength / 10);

                //var windowHeight = window.innerWidth;
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



        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
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
        //随机获取颜色
        function randomColor() {

            var colorStr = Math.floor(Math.random() * 0xFFFFFF).toString(16).toUpperCase();

            return "#" + "000000".substring(0, 6 - colorStr) + colorStr;

        }
        //$(window).resize(function () {
        //    chart.setSize(
        //       $(document).width(),
        //       $(document).height() / 2,
        //       false
        //    );
        //});
        function DrawChartA(Names, jsons, minsjon, maxsjoin) {
            var min = minsjon;
            var max = maxsjoin;
            //var Interval = (max - min) / 10;
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")")
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
                    //tickInterval: Interval,
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
                    //tickPositioner: function () {
                    //    var positions = [];
                    //    for (var i = 0; i <= 10; i++) {
                    //        positions.push(min + i * Interval);
                    //    }
                    //    return positions;
                    //},//刻度数组

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
        //图表
        function DrawChart(Names, jsons, minsjon, maxsjoin) {
            Names = Names.substring(0, Names.length - 1).split(',')
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")")
            /*---------------普通类型的----------------*/
            var datascore = [22, 15, 18, 36, 27, 29, 14];//分数数据集合
            var WDList = ["维度一", "维度二", "维度三", "维度四", "维度五", "维度六", "维度七"];
            var serieslist = [{
                name: "分数",
                data: jsons
            }];
            $('#container').highcharts({
                chart: {
                    polar: true,
                    type: "area"
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
                }, exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                tooltip: {
                    valueSuffix: '分'
                },
                plotOptions: {
                    series: {
                        pointWidth: 5 //柱子的宽度值 单位为px
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
        var containerWith = 0;
        var containerHeight = -200;
        function HightsTSLB9(jsons) {

            $(window).resize(function () {
                containerWith = ($('#container').width() - 100) / 2 * -1;
                containerHeight = ($('#container').height() - 100) / 2 * -1;
            })
            containerWith = ($('#container').width() - 100) / 2 * -1;
            containerHeight = ($('#container').height() - 100) / 2 * -1;
            containerHeight = -150;
            jsons = jsons.substring(0, jsons.length - 1)
            jsons = "[" + jsons + "]";
            jsons = eval("(" + jsons + ")")
            jsons = '[[' + jsons[0] + ',' + jsons[1] + ']]';
            jsons = eval("(" + jsons + ")")
            $('#container').highcharts({
                title: {
                    text: AmountName,
                    x: -20 //center
                },
                chart: {
                    type: 'scatter',
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
                    offset: containerHeight,
                    opposite: false,
                    showEmpty: false,
                    lineWidth: 1,
                    tickWidth: 1,
                    tickPositions: [0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100],
                    min: 0,
                    max: 100,
                    minTickInterval: 2,
                    title: {//纵轴标题  
                        text: 'E维度（内外倾向性）',
                        x: containerWith * -1,
                        floating: true
                    },
                    plotLines: [{
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 38.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2              //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 43.3,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2            //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 56.7,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2             //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 61.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2             //标示线的宽度，2px
                    }]
                },
                labels: {//在报表上显示的一些文本  
                    items: [{
                        html: '内向、不稳定抑郁质',
                        style: { left: '30px', top: '30px' }
                    }, {
                        html: '外向、不稳定胆汁质',
                        style: { left: '500px', top: '30px' }
                    }, {
                        html: '内向、稳定粘液质',
                        style: { left: '30px', top: '280px' }
                    }, {
                        html: '外向、稳定多血质',
                        style: { left: '500px', top: '280px' }
                    }]
                },
                yAxis: {
                    offset: containerWith,
                    gridLineWidth: 0,
                    title: null,
                    tickWidth: 1,
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }],
                    lineWidth: 1,
                    tickWidth: 1,
                    tickPositions: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95],
                    title: {//纵轴标题  
                        text: 'N维度（情绪稳定性）',
                        x: 30,
                        y: -160,
                        rotation: -360
                    },
                    plotLines: [{
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 38.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2                //标示线的宽度，2px
                    }, {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 43.3,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2             //标示线的宽度，2px
                    },
                    {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 56.7,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2            //标示线的宽度，2px
                    },
                {
                    color: '#e6e6e6',            //线的颜色，定义为红色
                    dashStyle: 'DashDot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                    value: 61.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                    width: 2            //标示线的宽度，2px
                }]
                },
                plotOptions: {
                    series: {
                        marker: {
                            fillColor: '#FF0000',
                            lineWidth: 1,
                            lineColor: '#FF0000' // inherit from series
                        }
                    }
                },
                series: [{
                    name: '分数',
                    data: jsons
                }]
              , legend: {
                  layout: 'vertical',
                  align: 'right',
                  verticalAlign: 'middle',
                  borderWidth: 0,
                  enabled: false
              },
                exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
            });
        }
        //导出
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

            function getYear(period) {
                return parseInt(period) / yearLevelValue;
            }
            function getMonth(period) {
                return parseInt(period) / monthLevelValue;
            }
            return result;
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
        function TSLB801Html(WDName, Score, ConverScoreA, zt_Type, Result, Proposal)
        {
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
            PageHtml += "  <b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">原始分：</span><span style=\"font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';line-height:150%;font-weight:bold;font-size:11.0000pt;mso-font-kerning:1.0000pt;\">" + Score + "</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
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
            PageHtml += "  <p  style='padding-top:10px;text-indent:2em;'>" + Result + "</p></span>";
            // PageHtml += "   <span class='results'style='display:none'><textarea type='text' name='" + SectioName + "' value='" + Result + "'  id='" + SectioName + "'style=\"margin-bottom:5px; width:100%;height:100px;overflow-y:auto\">" + Result + "</textarea><span><b><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";
            PageHtml += " </td> </tr>";

            PageHtml += " <tr>";
            PageHtml += "<td colspan=\"3\" style=\"width:498.1000pt;padding:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;border-left:1.0000pt solid rgb(0,0,0);mso-border-left-alt:0.5000pt solid rgb(0,0,0);border-right:1.0000pt solid rgb(0,0,0);mso-border-right-alt:0.5000pt solid rgb(0,0,0);border-top:none;;mso-border-top-alt:0.5000pt solid rgb(0,0,0);border-bottom:1.0000pt solid rgb(0,0,0);mso-border-bottom-alt:0.5000pt solid rgb(0,0,0);\" valign=\"center\" width=\"664\">";
            PageHtml += "<p class=\"MsoNormal\" style=\"margin-bottom:1pt;mso-para-margin-bottom:0.5000gd;\">";
            PageHtml += "<b><span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\">【心理建议】</span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-weight:bold;font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></b></p>";

            PageHtml += " <span style=\"mso-spacerun:'yes';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"class=\"resultp\"><p style='padding-top:10px;text-indent:2em;' >" + Proposal + "</p></span><span style=\"font-family:Calibri;mso-fareast-font-family:宋体;mso-bidi-font-family:'Times New Roman';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span>";
            // PageHtml += "<span class='results'style='display:none'><textarea type='text' name='Proposal" + SectionToChinese(index) + "' value='" + Proposal + "' id='Proposal" + SectionToChinese(index) + "' style=\"margin-bottom:5px;width:100%;height:100px;overflow-y:auto\">" + Proposal + "</textarea></span>";
            PageHtml += "</td>";
            PageHtml += "  </tr>";
            PageHtml += "  </table>";
            PageHtml += "</div>";
            PageHtml += "<input  type=\"hidden\" class=\"Sorceid\" />";
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
