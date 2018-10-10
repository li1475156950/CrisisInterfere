<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LookAnwserRecord.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.LookAnwserRecord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/style.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-switch.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-switch.min.js"></script>

    <style type="text/css">
        ul {
            list-style: none;
        }

        .main-quiz-holder .slide-container ul.answers {
            margin: 0px;
            padding: 5px 30px;
            list-style: none;
        }

            .main-quiz-holder .slide-container ul.answers li {
                padding: 5px 0px;
            }

        .main-quiz-holder .slide-container {
            margin-top: 20px;
        }

        .gapinput {
            text-align: center;
            margin-left: 5px;
            margin-right: 5px;
        }

        .main-quiz-holder .question {
            padding-left: 35px;
            line-height: 1.3em;
            width: 100%;
        }
    </style>

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb" id="crumbs">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="AnwserRecord.aspx">作答记录</a></li>
                <li><a href="#">查看</a></li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin: 0px 20px 50px 20px;">
        <div class="row">
            <div id="quiz-container" style="background: #fcfcfc; width: 100%; border: solid 1px #e3e3e3;">
            </div>
            <div class="modal-footer text-center" style="border: solid 0px">
                <button type="button" class="btn btn-info" id="btnExport">
                    导出
                </button>
                <button type="button" class="btn btn-default" data-dismiss="modal" onclick="GoBack()">
                    关闭
                </button>
            </div>
        </div>
    </div>
    <div id='Speechse' style="display: none"></div>
    <input type="hidden" id="Startime" />

    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script>

        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
        var sourceType = getUrlParam("type");//获取是从哪个界面上跳转过来的
        var navName = "";
        if (sourceType == "AnwserRecord")
            navName = '/FunctionModular/Questionnaire_Record/AnwserRecord.aspx';
        else if (sourceType == "AnwserGather")
            navName = '/FunctionModular/Questionnaire_Record/SurveyResult.aspx';


        var QD_Code = getUrlParam("QD_Code");//分配编码
        var Q_Code = getUrlParam("Q_Code");//问卷编码
        var AnwId = getUrlParam("id");//作答ID
        var AnwRecord;//作答记录

        ChangeCrumbs();
        //修改面包屑导航的内容
        function ChangeCrumbs() {
            //作答记录
            if (sourceType == "AnwserRecord") {

            }
                //答卷收集
            else if (sourceType == "AnwserGather") {
                $("#crumbs").empty();
                $("#crumbs").html('<i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px;' +
                    ' padding-right: 10px;"></i>当前位置：<li><a href="#">问卷调查</a></li><li><a href="SurveyResult.aspx">调查结果</a></li>' +
                    '<li><a href="SurveyResult.aspx">答卷收集</a></li><li><a href="#">查看</a></li>');
            }
        }
        GetRecord();
        //获取问卷信息
        function GetRecord() {
            $.ajax({
                type: "POST",
                url: "Ajax/MyQuestionnaire.ashx",
                data: {
                    type: "ContinueAnswer",
                    AnswerID: QD_Code
                },//要执行查询的数据参数
                success: function (msg) {

                    var array = eval(msg);
                    AnwRecord = JSON.parse(array[0]);//保存获取到的作答记录

                    $.ajax({
                        type: "POST",
                        url: "Ajax/MyQuestionnaire.ashx",
                        data: "type=GetProblem&code=" + QD_Code + "&Q_Code=" + Q_Code,
                        success: function (msg) {
                            msg = msg.replace(/\s/g, "");
                            var msgs = eval("(" + msg + ")");
                            AllLength = msgs.questions.length;
                            InitPage(msgs);
                        }
                    });
                }
            });
        }
        //初始化界面
        function InitPage(ques) {
            var QCode = "";
            var allLength = ques.length;
            var QName = ques.Questionnaire_Guidance[1].QName;
            var questions = ques.questions;
            var superContainer = $("#quiz-container"),
            answers = [],
            //设置作答时，显示的问卷名称，指导语和提示语
           introFob = '<div class="intro-container slide-container "> <div class="row"  style="text-align:center;padding-left: 15px;padding-right: 15px;"><h2 id="ANames" style="word-break:break-all;">'
           + QName + '</h2></div><div><div class="row" style="margin-top:20px;margin-left:10px;"> <div class="col-md-2 col-sm-12 text-center" >' +
               '</div><div class="col-md-9 col-sm-12"id="Guidance" style="word-break: break-all;"><span style="font-size:20px;font-weight:bold">指导语：</span>' + ques.Questionnaire_Guidance[0].QGuidance +
               '</div> </div> ',
            contentFob = '',
            questionsIteratorIndex,
            answersIteratorIndex;
            superContainer.addClass('main-quiz-holder');

            $("#AllLengths").val(allLength);

            //创建题干和题支的代码块
            for (questionsIteratorIndex = 0; questionsIteratorIndex < questions.length; questionsIteratorIndex++) {
                if (AnwRecord[questions[questionsIteratorIndex].SubCode[0]] == undefined)
                    continue;
                if (QCode == "") {
                    QCode += questions[questionsIteratorIndex].SubCode[0];
                } else {
                    QCode += "," + questions[questionsIteratorIndex].SubCode[0];
                }
                var Qcontent = questions[questionsIteratorIndex].question;
                /*开始创建题干*/
                var type_temp = questions[questionsIteratorIndex].subType;//题干类型

                switch (type_temp) {
                    case "0":
                        contentFob += '<div class="slide-container" name=\"subject\"><input  type="hidden" data-type=\"' + type_temp + '\" id="inputhide" value='
                            + (questionsIteratorIndex + 1) +
                            '><div class="question" style="word-break: break-all;" data-id=' + questions[questionsIteratorIndex].SubCode[0] + '>'
                            + questions[questionsIteratorIndex].question + '</div><ul class="answers">';
                        break;
                    case "1":
                        contentFob += '<div class="slide-container" name=\"subject\"><input  type="hidden" data-type=\"'
                            + type_temp + '\" id="inputhide" value=' + (questionsIteratorIndex + 1) + '><div class="question" style="word-break: break-all;" data-id='
                            + questions[questionsIteratorIndex].SubCode[0] + '>' + questions[questionsIteratorIndex].question + '（多选）'
                            + '</div><ul class="answers">';
                        break;
                    case "2":
                        var cont = questions[questionsIteratorIndex].question.replace(/@____;/g, "<u class=\"gapinput\" " +
                            "style=\"color: #94b7ec;font-weight:normal;\" name=" + questions[questionsIteratorIndex].SubCode[0] + " />");
                        contentFob += '<div class="slide-container" name=\"subject\"><input type="hidden" data-type=\"'
                            + type_temp + '\" id="inputhide" value=' + (questionsIteratorIndex + 1) + '><div class="question" style="word-break: break-all;overflow-x: auto;" data-id='
                            + questions[questionsIteratorIndex].SubCode[0] + '>' + cont + "（下划线部分为空缺）"
                             + '</div><ul class="answers">';
                        break;
                    case "3":
                        contentFob += '<div class="slide-container" name=\"subject\"><input  type="hidden" data-type=\"' +
                            type_temp + '\" id="inputhide" value=' + (questionsIteratorIndex + 1) + '><div class="question" style="word-break:break-all;overflow-x: auto;" data-id='
                            + questions[questionsIteratorIndex].SubCode[0] + '>' + questions[questionsIteratorIndex].question
                            + '<div class="question" style="color: #94b7ec;font-weight:normal;font-size:16px;padding-left: 0px;word-break: break-all;overflow-x: auto;"><label  name="'
                            + questions[questionsIteratorIndex].SubCode[0] + '"></label></div>'
                        + '</div><ul class="answers">';
                        break;
                }
                //}
                /*结束题干的创建*/

                //循环创建题支
                for (answersIteratorIndex = 0; answersIteratorIndex < questions[questionsIteratorIndex].answers.length; answersIteratorIndex++) {
                    var AnswerConTent = questions[questionsIteratorIndex].answers[answersIteratorIndex];
                    var inputType = "radio";
                    if (type_temp == 1)
                        inputType = "checkbox";
                    if (AnswerConTent.indexOf("../../SubjectImages") >= 0) {
                        contentFob += "<li style='word-break: break-all;'><input disabled=\"disabled\" type=\"" + inputType + "\" data-skip=\"" + questions[questionsIteratorIndex].SkipCode[answersIteratorIndex]
                            + "\" data-name=\"" + questions[questionsIteratorIndex].Factions[answersIteratorIndex]
                            + "\" value=\"" + questions[questionsIteratorIndex].OptionCode[answersIteratorIndex]
                            + "\" name=\"" + questions[questionsIteratorIndex].SubCode[answersIteratorIndex]
                            + "\" data-id=\"" + questions[questionsIteratorIndex].IndexNum[answersIteratorIndex]
                            + "\" id=\"" + questions[questionsIteratorIndex].OptionCode[answersIteratorIndex]
                            + "\">" + questions[questionsIteratorIndex].SerialNumber[answersIteratorIndex] + "."
                            + "<img src=\"" + questions[questionsIteratorIndex].answers[answersIteratorIndex] + "\"></li>";
                    }
                    else {
                        contentFob += '<li style="word-break: break-all;"><input disabled=\"disabled\" type="' + inputType + '" data-skip=\"' + questions[questionsIteratorIndex].SkipCode[answersIteratorIndex]
                            + '\" data-name=\"' + questions[questionsIteratorIndex].Factions[answersIteratorIndex] + '\" value=\"'
                            + questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + '\" name=\"'
                            + questions[questionsIteratorIndex].SubCode[answersIteratorIndex] + '\" data-id=\"'
                            + questions[questionsIteratorIndex].IndexNum[answersIteratorIndex] + '\" id=\"'
                            + questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + '\">'
                            + questions[questionsIteratorIndex].SerialNumber[answersIteratorIndex] + "."
                            + questions[questionsIteratorIndex].answers[answersIteratorIndex] + '</li>';
                    }
                }
                contentFob += '</ul>';//结束创建题支

                contentFob += '</div>';
                answers.push(questions[questionsIteratorIndex].correctAnswer);
            }
            superContainer.html(introFob + contentFob);
            SetAnwserResult();
        }
        //给题干设置作答的答案
        function SetAnwserResult() {
            $.each(AnwRecord, function (name, values) {
                // var values = value.split(",");
                for (var i = 0; i < values.length - 1; i++) {
                    if (values[values.length - 1] == 0 || values[values.length - 1] == 1) {
                        $("input[name='" + name + "'][value ='" + values[i] + "']").attr('checked', true);
                        $("input[name='" + name + "'][value ='" + values[i] + "']").parent().css({ "background": "#89b3e3", "color": "black" });
                    }
                    else if (values[values.length - 1] == 2) {
                        // $("#quiz-container").find("input[type=text]")[i].value = values[i];
                        $("u[name='" + name + "']")[i].innerHTML = values[i];
                        //$("#quiz-container").find("u").eq(i).text(values[i]);
                    }
                    else if (values[values.length - 1] == 3)
                        //  $("#quiz-container").find("label").eq(i).text("（作答记录：" + values[i] + "）");
                        $("label[name='" + name + "']").text("（作答记录：" + values[i] + "）");
                }
            });
        }
        //返回
        function GoBack() {
            if (sourceType == "AnwserRecord")
                window.location.href = "/FunctionModular/Questionnaire_Record/AnwserRecord.aspx";
            else
                window.location.href = "/FunctionModular/Questionnaire_Record/SurveyResult.aspx";
        }
        //单个导出按钮
        $("#btnExport").click(function (event) {

            var allcount = "";
            var numbers = "";
            var z = "";
            var allcount = getUrlParam("Allcount");
            var numbers = getUrlParam("Numbers");
            if (allcount != "0" && allcount != null && allcount != "") {
                z = parent.getZip();
            }

            var temp = numbers == null ? "" : "_" + numbers;

            var timeout = window.setTimeout(function () {
                $(".collapsed").removeAttr("href");
                $("#quiz-container").find("input[type=radio]").attr({ type: "hidden", name: "radios" });
                $("#quiz-container").find("input[type=checkbox]").attr({ type: "hidden", name: "checkboxs" });
                var questionNameHtm = $("#ANames").html();
                $("#quiz-container").wordExport(questionNameHtm + temp, allcount, numbers, z, "作答记录批量导出");
                $("#quiz-container").find("input[name=radios]").attr({ type: "radio" });
                $("#quiz-container").find("input[name=checkboxs]").attr({ type: "checkbox" });
                window.clearTimeout(timeout);
            }, 500);
        });

    </script>
</asp:Content>
