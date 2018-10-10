

<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LookReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.LookReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <%--<link href="Css/Presentation.css" rel="stylesheet" />--%>

    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />
    <%--<script src="../../JS/Highcharts/highcharts.js"></script>
    <script src="../../JS/Highcharts/highcharts-more.js"></script>--%>
    <%--<script src="../../JS/Change.js"></script>--%>
    <%-- <script src="../../JS/jquery.jqprint-0.3.js"></script>--%>
    <script src="../../JS/word/FileSaver.js"></script>
      <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
  <%--  <script src="../../JS/word/jquery.wordexport.js"></script>--%>
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
    </style>
    <style type="text/css">
        .progressA {
            height: 20px;
            overflow: hidden;
        }

        .progress-bar-success {
            background-color: #5cb85c;
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

        .progress-bar-info {
            background-color: #5bc0de;
        }

        .progress-bar-warning {
            background-color: #f0ad4e;
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
    <%-- <div style="float:left;margin-top:10px;margin-right:10px;">
                <button type="button" onclick="print()"> 
                    导出
                </button>
            </div>--%>
    <div id="tuia" style="text-align: right; margin-top: 10px; margin-right: 0px; margin-bottom: 5px;">

        <button type="button" class="btn btn-sm" onclick="Edite()" id="Edite" style="background-color: white; border-color: orange; color: orange">修改</button>
        <button type="button" class="btn btn-sm" onclick="recovery()" style="display: none; background-color: white; border-color: RGB(66,139,203); color: RGB(66,139,203)" id="recovery">恢复默认</button>

    </div>

    <div class="col-md-12 col-sm-12" style="padding-left: 0px; padding-right: 0px;">

        <div class="well" id="Print" style="overflow-x: auto;">

            <div class="row" style="margin-left: auto; margin-right: auto; background-color: #FFF; width: 70%; min-width: 320px;">
              <%--  <div class="col-md-12 col-sm-12 col-xs-12 text-align: center;" >
                    <h2 style="font-size: 35px; font-weight: 700; text-align: center;" >定州市人民医院</h2>
                </div>--%>
                <div class="col-md-12 col-sm-12 col-xs-12 text-align: center;"style="margin-bottom:10px;margin-top:10px;">
                    <h4 style="font-size: 22px; font-weight: 600; text-align: center;" id="ReportTitle">《中学生考试焦虑影响因素问卷》测评报告</h4>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12">
                  <%--  <div class="row" style="margin-bottom:20px;">
                        姓名：<span  id="aa"  style="margin-right:50px;"><input  id="aa2" type='text' 
                      style='border: solid 0px;width:50px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' /></span>
                     <span style="width:50px;margin-left:2px;margin-right:2px" id="aa1"></span>                     
                                  &nbsp;&nbsp;    
                                   性别：<span  id="bb"  style="margin-right:50px;"><input  id="bb2" type='text' 
                      style='border: solid 0px;width:50px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' /></span>
                     <span style="width:50px;margin-left:2px;margin-right:2px" id="bb1"></span> 
                                   &nbsp;&nbsp;                      
                                   年龄：<span  id="cc"  style="margin-right:50px;"><input  id="cc2" type='text' 
                      style='border: solid 0px;width:50px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' /></span>
                     <span style="width:50px;margin-left:2px;margin-right:2px" id="cc1"></span> 
                                   &nbsp;&nbsp;                        
                                   申请科室：<span  id="dd"  style="margin-right:50px;"><input  id="dd2" type='text' 
                      style='border: solid 0px;width:100px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' /></span>
                     <span style="width:50px;margin-left:2px;margin-right:2px" id="dd1"></span>
                    </div>
                     <div class="row">
                        门诊号：<span  id="ee" style="margin-right:50px;"><input  id="ee2" type='text' 
                      style='border: solid 0px;width:50px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' /></span>
                     <span style="width:50px;margin-left:2px;margin-right:2px" id="ee1"></span>                     
                              &nbsp;&nbsp;                    
                                   床号：<span  id="ff"  style="margin-right:50px;"><input  id="ff2" type='text' 
                      style='border: solid 0px;width:50px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' /></span>
                     <span style="width:50px;margin-left:2px;margin-right:2px" id="ff1"></span> 
                                &nbsp;&nbsp;                            
                                   申请医生：<span  id="gg"  style="margin-right:50px;"><input  id="gg2" type='text' 
                      style='border: solid 0px;width:50px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' /></span>
                     <span style="width:50px;margin-left:2px;margin-right:2px" id="gg1"></span> 
                                                           
                                  
                    </div>--%>
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
                    <div id="Introduce" style="margin-top: 15px; line-height: 30px; text-indent: 2em;"></div>

                </div>
                <%--  <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
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
                </div>--%>

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
                        二、测试结果
                    </div>

                    <div id="AnalysisChart"></div>
                    <div class="col-md-12 col-sm-12 col-xs-12" id="container">
                    </div>

                    <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                        <%--<img"/>--%>
                        <%-- <image id="imagescr" width="600px" height="400px"></image>--%>

                        <img id="imagescr" width="600px" height="400px" />
                    </div>
                </div>

            </div>

            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">

                <div id="GeneralMessage" style="margin-top: 15px; width: 100%">
                </div>
                <div id="dictionary">
                </div>
            </div>
            <div class="row" style="margin-top: 15px; margin-bottom: 10px;" id="My">
                <%--   <div class="col-md-offset-9" id="NewAdd">
                    <button class="btn btn-warning btn-sm" onclick="addRow()" id="NewInfo" style="display: none"><i></i>+</button>
                    <button class="btn btn-warning btn-sm" id="Newdelete" onclick="return Neweremove()" style="display: none"><i></i>-</button>
                </div>--%>
            </div>
            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;">

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 25px;">
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 18px;">
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
             <%--   <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 50px; min-width: 310px;">
                   <span style="margin-right:100px;">检查医师：</span> &nbsp;&nbsp; 
                     <span  style="margin-right:100px;">审核医师：</span> &nbsp;&nbsp; 
                     <span  style="margin-right:100px;">报告医师：</span> &nbsp;&nbsp; 
                     <span  >检查日期：</span>
                </div>--%>

            </div>
        </div>

        <div class="row" style="text-align: center; margin-bottom: 10px;">
            <button type="button" class="btn btn-sm" style="border-color: orange; color: white" id="export">
                导出
            </button>
            &nbsp;&nbsp;
            <button type="button" id="ExitsID" class="btn btn-sm" style="color: white" onclick="Exits()">返回</button>
            <%--            <button type="button" id="SaveID" class="btn btn-sm" onclick="Add()" style="display: none; background-color: orange; color: white">保存</button>--%>
            <%--    <button type="button" id="CancelID" class="btn btn-sm" onclick="Cancel()" style="display: none; background-color: RGB(66,139,203); color: white">取消</button>--%>
        </div>
    </div>

    <%-- <script src= "https://cdn.zingchart.com/zingchart.min.js"></script>--%>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <%--<script src="../../JS/highcharts-more.js"></script>--%>
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script>




        $(function () {
            $(window).unbind('beforeunload');
            window.onbeforeunload = null;
        })
        /*------------根据量表ID查询量表基本信息--------------*/
        var navName = "";
        var Acodes = "";
        var filename = "";
        var AmountName = "";
        var Request = new Object();
        Request = GetRequest();
        var strJsonA = [];
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
        //if (getUrlParam("AmountType") == 1) {
        //    $("#recovery").show();
        //} else {
        //    $("#recovery").hide();
        //}
        var Types = getUrlParam("type");
        var PersonTypes = "";
        var AmountTypes = getUrlParam("AmountType");
        if (Types == 1 && AmountTypes == 1) {
            PersonTypes = 1;//查看结果
            navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
            $("#recovery").hide();
        }
        else if (AmountTypes == 0) {
            PersonTypes = 2//预警
            navName = '/FunctionModular/Warning/CrisisWarning.aspx';
            $("#recovery").hide();
        }
        else {
            PersonTypes = 3;
            navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
            //$("#recovery").show();
        }
        //if (Types == 2) {
        //    navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        //    $("#recovery").show();
        //}
        //else
        //{
        //    var navName = '/FunctionModular/Warning/CrisisWarning.aspx';
        //    $("#recovery").hide();
        //}
        InitPages();
        /*-----根据答题ID加载报告信息-------*/
        var AnswerJson = "";//测试人答题的Json
        var AmountCode = "";//答题的量表编码
        var SubjectTotal = 0;//量表题干数量
        //var 
        var sexval = 0;
        var AgeVal = 0;
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

                    if (msg != "") {
                        var obj = eval(msg);
                        if (obj != null && obj.length > 0) {
                            filename = obj[10] + "-" + obj[11];
                            AmountName = obj[10];
                            $("#Introduce").html(obj[7]);
                            $("#ReportTitle").html("《" + obj[10] + "》" + "测评报告");
                            AnswerJson = obj[1];//答案Json数据集合
                            AmountCode = obj[8];//量表编码
                            LB_Code = obj[8];//量表编码
                            SubjectTotal = obj[9];//量表题干数量
                            var loginName = obj[2];
                            var UserName = obj[11];
                            var SexVal = obj[12];
                            var UserBirdth = obj[13];
                            var RCreatime = obj[4];
                            //var date1 = new Date(obj[3]); 
                            //var date2 = new Date(obj[4]);
                            //var date3 = (date2.getTime() - date1.getTime()) / 1000;
                            //$("#Actual_Time").html(formatSeconds(date3));
                            //$("#Standard_Time").html(formatSeconds(obj[5]));  
                            $("#loginName").html("登录名：" + (obj[2]) + "</br>");
                            $("#Uname").html("姓名：" + obj[11] + "</br>");
                            $("#sex").html("性别：" + (obj[12]) + "</br>");
                            //$("#Codenumber").html("编号：" + (obj[2]) + "</br>");
                            $("#birdth").html("出生日期：" + obj[13] + "</br>");
                            $("#Createtime").html("完成时间：" + obj[4] + "</br>");
                            if (obj[12] == "男") {
                                sexval = 1;
                            } else if (obj[12] == "女") {
                                sexval = 2;
                            }
                            var StartTimeA = obj[4];
                            var EndtimeA = obj[13];
                            AgeVal = DateDiff(StartTimeA, EndtimeA);

               
                            var strD = { 'UserInfo': { 'UserLoginName': loginName, 'UserName': UserName, 'sex': SexVal, 'Birdth': UserBirdth, 'RCretime': RCreatime, 'sexval': sexval, 'AgeVal': AgeVal } };
                            strJsonA.push(strD);
                            Acodes = AmountCode;
                            DrawWD_Analysis(AmountCode, AnswerJson, sexval, AgeVal, 0);//加载维度总评
                        }

                    }
                }
            });

        }
       //增加addhtml
        function Addhtml(InputField, InputValue)
        {
            var html=' <tr>'           
            html += '<td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);"  colspan="3">';
            html += '<span>' + InputField + '：</sapan><span>' + InputValue + '</sapan></td>';
            html += '</tr>'
            $("#tbody").append(html);
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


        /*-------------报告解析-----------*/
        function AnalysisResult(json) {

            var JsonArr = eval("[" + json + "]");
            if (JsonArr != null && JsonArr.length > 0) {
                //InitWDPages

            }
        }
        var states = 0;
        //定义回复默认的值
        var recoverys = 0;
        function recovery() {
            recoverys = 1;
            layer.confirm('是否恢复原始状态？', {
                btn: ['是', '否'] //按钮
            }, function () {
                SaveAdd();
                //DrawWD_Analysis(AmountCode, AnswerJson, sexval, AgeVal, 1);//加载维度总评
                window.location.reload();
                layer.msg('恢复成功！', { icon: 1 });
            });

        }
        /*--------------维度解释解析-----------*/
        var OperationList;
        var Allscore = "";
        var strjson = "";
        var NewJson = "";
        var RoleType = 0;

        function DrawWD_Analysis(Acode, _AnswerJson, sexval, AgeVal, recoverys) {
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
                                item.ConversionFormula=item.ConversionFormula.replace('score', item.Score);
                                item.ConversionFormula=item.ConversionFormula.replace('Score', item.Score);
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                if (LB_Code == "LB_14810142054270") {
                                    if (item.WD_Name != "总评") {
                                        scorejson += Score + ",";
                                    }
                                } else {
                                    scorejson += Score + ",";
                                }
                                var Forms = item.Formulas;
                                if (Score < MinScore) {
                                    MinScore = Score
                                } if (Score > MaxScore) {
                                    MaxScore = Score;
                                }

                            } else {
                                if (LB_Code == "LB_14810142054270") {
                                    if (item.WD_Name != "总评") {
                                        Score = item.Score.toFixed(2);
                                        scorejson += parseFloat(item.Score.toFixed(2)) + ",";
                                    } else { Score = item.Score.toFixed(2); }
                                } else {
                                    Score = item.Score.toFixed(2);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";
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
                            //if (item.CMAllScore != null && item.CMAllScore != "") {
                            //    CMLengthNew = eval(100 / (eval(item.CMAllScore) + parseInt(MaxScore)));
                            //} else {
                            //    CMLengthNew = eval(100 / parseInt(MaxScore));
                            //}
                            //var re = /([0-9]+.[0-9]{2})[0-9]*/;
                            //CMLengthNew = CMLengthNew.toString();
                            //CMLength = CMLengthNew.replace(re, "$1");

                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + 0 + "%; float:\"left\"; width: \"0\"; height: \"100%\"; font-size: \"12px\";color: \"#121212\";text-align: \"center\">" + MinScore + "</div>";
                            if ((Score != null && Score != "") || Score==0) {
                                for (var i = 0; i < cmmlists.length; i++) {

                                    //if (i == parseInt(cmmlists.length - 1)) {
                                    //    CmHtmls += "<div class=\"progress-barA \"style=\"width: " + CMLength * MaxScore + "%" + ";background-color:" + randomColor() + "\" aria-valuemax=\"100\">" + cmmlists[i].NormName + "</div>";
                                    //} else {
                                    //    CmHtmls += "<div class=\"progress-barA \"style=\"width: " + CMLength * cmmlists[i].CmendScore + "%" + ";background-color:" + randomColor() + "\" aria-valuemax=\"100\">" + cmmlists[i].NormName + "</div>";
                                    //}
                                    //if (cmmlists[i].CmendScore !="99999") {
                                    //    CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * cmmlists[i].CmendScore + "%;text-align:right\">" + cmmlists[i].CmendScore + "</div>";
                                    //}
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
                            if (LB_Code == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WdJsonName += item.WD_Name + ",";
                                }
                            } else {
                                WdJsonName += item.WD_Name + ",";
                            }
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
                            var strA = { 'DimensionEntitys': { 'WDName': WDName, 'YScoreA': YScoreA, 'CScoreA': CScoreA, 'zt_Type': zt_Type, 'Result': Result, 'Proposal': Proposal } };
                            strJsonA.push(strA);
                        });
                        var strB = { 'Maxmin': { 'MinScore': MinScore, 'MaxScore': MaxScore } }
                        strJsonA.push(strB);
                        var strC = { 'AnswerRecord': msgs.AnswerR }
                        strJsonA.push(strC);
                        if (Acode == "LB_14954407579730") {
                            DrawChart(WdJsonName, scorejson, 1, 5);
                        } else if (Acode == "LB_14963960232240")//阳性症状量表
                        {
                            DrawChart(WdJsonName, scorejson, 0, 6);
                        }
                        else {
                            DrawChart(WdJsonName, scorejson, MinScore, MaxScore);
                        }
                        if (RoleType == 0) {
                            jsonstr(strjson);
                            NewJsonstr(NewJson);
                        }
                        if (PersonTypes == 3) {
                            strjsonLength = getJsonObjLength(strjson);
                            if (strjson != null && strjson != "" && strjsonLength != 0) {
                                $("#recovery").show();
                            } else {
                                $("#recovery").hide();
                            }
                        }
                        InitAnswerRecord(msgs.AnswerR);//加载答题记录    
                    <%--    ReportInsert(AnswerIDs, strJsonA);--%>

                    }
                }
            });

        }
        function getJsonObjLength(jsonObj) {
            var Length = 0;
            for (var item in jsonObj) {
                Length++;
            }
            return Length;
        }
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
            if (chnStr.indexOf("一十") >= 0 && chnStr.length <= 3) {
                chnStr = chnStr.replace("一十", "十");
            }
            return chnStr;
        }


        function InitAnswerRecord(AR) {
            $("#tableid").html("");
            if (AR != null && AR != "") {
                //创建表格
                var rowCount = Math.ceil(AR.length / 10);
                var windowHeight = window.innerWidth;
                var columnCount = 10;
                //if (windowHeight < 768)
                //    columnCount = 6;
                //else if (windowHeight)
               

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


        //修改页面
        var EInt = 0;
        function Edite() {
            var A_ID = getUrlParam("A_ID");
            var type = getUrlParam("type");
            var AmountType = getUrlParam("AmountType");
            // 设置返回页码参数
            var params = fnGetUrlParam("p");
            window.location.href = "LookReportEdit.aspx?A_ID=" + A_ID + "&type=2&AmountType=" + AmountType + "&p=" + params + "";
            //EInt++;
            //$(".nameid").show();
            ////$(".nameid").show();
            //$("#NewInfo").show();
            ////$("#NewAdd").show();
            ////$("#Newdelete").show();
            //$(".resultp").hide();
            //$(".results").show();
            //$("#Edite").hide();
            //$("#recovery").hide();
            //$(".Newname").hide();
            //$(".moretexts").show();
            //$("#SaveID").show();
            //$("#export").hide();
            //$("#ExitsID").hide();
            //$("#CancelID").show();
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

      

        quxiaoxiugai();
        function quxiaoxiugai() {
            var usr = window.location.href;
            var ul = usr.toString().split('&');
            var u = ul[1].toString().split("=");
            if (u[1].toString() == "3") {
                $("#tuia").attr("style", "display:none")

                //$("#recovery").attr("display","none")
            }
        }



        //回复默认
        //function recovery() {
        //    $(".nameid").hide();
        //    $("#NewInfo").hide();
        //    $("#Newdelete").hide();
        //    $(".resultp").show();
        //    $(".results").hide();
        //    $("#Edite").show();
        //    $("#recovery").hide();
        //    $(".Newname").show();
        //    $(".moretexts").hide();
        //    $("#SaveID").hide();
        //    $("#export").show();
        //    $("#ExitsID").show();
        //    $("#CancelID").hide();
        //}
        var changeFlag = false;
        //保存
        var Addtype = 0;

        function Add() {
            var titilenameCount = 0;
            var oldnameCount = 0;
            if ($("[name=titilename]").length > 0) {
                $("[name='titilename']").each(function () {
                    if ($(this).val() == null || $(this).val() == "") {
                        titilenameCount += 1;
                    }

                });
            }
            if ($("[name=oldname]").length > 0) {
                $("[name='oldname']").each(function () {
                    if ($(this).val() == null || $(this).val() == "") {
                        oldnameCount += 1;
                    }

                });

            }
            if ($("[name=titilename]").length > 0 || $("[name=oldname]").length > 0) {
                if (titilenameCount > 0 || oldnameCount > 0) {
                    layer.alert('请输入标题！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                    return false;
                } else {
                    SaveAdd();
                }
            } else {
                SaveAdd();
            }
        }
        function SaveAdd() {
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
            if (recoverys == 1) {
                strJson = [];
            } else {
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
            }
            $.ajax({
                type: "POST",
                url: "Ajax/PersonalReport.ashx",
                async: false,
                data: {
                    operationType: operationTypes,
                    InputJson: InputJson,
                    ACode: Acodes,
                    state: states,
                    AID: getUrlParam("A_ID"),
                    NewJsons: JSON.stringify(strJson),
                    recoverys: recoverys
                },

                success: function (msg) {
                    if (msg == "True") {
                        DrawWD_Analysis(Acodes, AnswerJson, sexval, AgeVal, 0);//加载维度总评
                        $(".nameid").hide();
                        $(".resultp").show();
                        $(".results").hide();
                        $("#Edite").show();
                        //$("#recovery").show();
                        $(".moretexts").hide();
                        $("#NewInfo").hide();
                        $("#export").show();
                        //$("#NewAdd").hide();
                        $("#Newdelete").hide();
                        $("#SaveID").hide();
                        $("#ExitsID").show();
                        $("#CancelID").hide();
                        changeFlag = false;
                        if (recoverys != 1) {
                            if (NewJson != null && NewJson != "") {
                                $("#recovery").show();
                            }
                            layer.msg('保存成功！', { icon: 1 });
                        }

                    } else {
                        layer.msg('保存失败！', { icon: 1 });
                    }
                    //window.location.reload();
                }
            });
        }
        var count = 1;
        function addRow() {
            $("#Newdelete").show();
            Addtype = 1;
            var html = '<div class="row moretexts"  style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">';
            html += ' <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;"><input name=titilename type="text" class="form-control" data-name="field" placeholder="请输入标题"></div>';
            // html += ' <div  class="nameid" style="margin-top: 15px;"><textarea style="height:80px" class="form-control" data-name="value" placeholder="请输入内容" ></textarea></div>';
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
                $('#dictionary').html("");
                //var strjson = eval('(' + newjson + ')');
                $.each(newjson, function (index, item) {
                    var html = '<div class="row moretext" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">';
                    html += '<div class="Newname"><div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;">' + item["Field"] + '</div>';
                    html += '<div  style="margin-top: 15px;">' + item["Value"] + '</div> </div>';
                    // html += '<div  class="nameid" style="display:none"><div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;"><input type="text" class="form-control" value=' + item["Field"] + ' data-name="field"  name="oldname" placeholder="请输入标题"></div>';
                    //html += '<div  style="margin-top: 15px;"><input class="form-control" value="' + item["Value"] + '" data-name="value" placeholder="请输入内容" ></div></div>'
                    html += '</div>';
                    $('#dictionary').append(html);
                });
            }

        }
        //删除最后一行
        function Neweremove() {
            if ($("#dictionary").find(".moretexts:last").length == 0) {

                if ($("#dictionary").find(".moretext:last").length == 0) {
                    $("#Newdelete").hide();
                } else if ($("#dictionary").find(".moretext:last").length == 1) {

                    $("#dictionary").find(".moretext:last").remove();
                    $("#Newdelete").hide();

                }
                else {
                    $("#dictionary").find(".moretext:last").remove();
                }
            } else {
                $("#dictionary").find(".moretexts:last").remove();
            }
            return false;
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
        //跳转页面是否保存
        $(window).bind('beforeunload', function () {
            return '您输入的内容尚未保存，确定离开此页面吗？';
        });
        var changeFlag = false;
        function CheckChange() {
            if (changeFlag === true) {
                if (confirm("页面信息被重新编辑过，确认离开并放弃此次编辑？")) {
                    window.parent.giveUpFlag = false;
                    return true;
                } else {
                    window.parent.giveUpFlag = true;
                    return false;
                }
            } else {
                //没有编辑不做判断直接返回true
                return true;
            }
        }

        //取消
        function Cancel() {
            layer.confirm('当前界面尚未保存，是否离开？', {
                btn: ['是', '否'] //按钮
            }, function () {
                window.location.reload();//刷新当前页面
            })
        }

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


            //$("#Print").wordExport(filename);


        });
        //随机获取颜色
        function randomColor() {

            var colorStr = Math.floor(Math.random() * 0xFFFFFF).toString(16).toUpperCase();
            return "#" + "000000".substring(0, 6 - colorStr) + colorStr;

        }

        Xiuai()
        function Xiuai() {
            var usr = window.location.href;
            var ul = usr.toString().split('&');
            var u = ul[1].toString().split("=");
            if (u[1].toString() == "1") {
                $("#Edite").hide()
            }

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

            function getYear(period) {
                return parseInt(period) / yearLevelValue;
            }
            function getMonth(period) {
                return parseInt(period) / monthLevelValue;
            }
            return result;
        }


        /*---公共参数----*/
        var ShowType = "bar";//图形展现方式
        var LB_Code = "";//量表编码
        //tickPositions: [0, 20, 50, 100]
        var KD = "";

        //图表
        function DrawChart(Names, jsons, minsjon, maxsjoin) {
            var min = minsjon;
            var max = maxsjoin;
            var Interval = (max - min) / 10;

            if (LB_Code == "LB_14810142054270")//当量表为SL_90的时候展示的是折线图
            {

                ShowType = "line";
                KD = [0, 1, 2, 3, 4, 5];
            } else {
                KD = null;
                ShowType = "bar";
            }

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
                    type: ShowType
                },
                title: {
                    text: AmountName,
                    //x: -20 //center
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
                    tickPositions: KD,
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

        function ReportInsert(AnswerID, strjson) {
            var svgFirst;
            $.ajax({
                url: "Ajax/PersonalReportInfo.ashx?Remark=RInsert",
                type: "post",
                async: false,
                data:
                    {
                        AnswerID: AnswerID,
                        Rjson: JSON.stringify(strjson)
                    },
                success: function (result) {
                    alert(Result)

                }
            })

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

