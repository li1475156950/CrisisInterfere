<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="StartAnswer.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.StartAnswer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/style.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-switch.css" rel="stylesheet" />
    <%--  <script src="../../JS/jquery-2.0.3.min.js"></script>--%>
    <script src="../../JS/questionnaire.js"></script>
    <script src="../../JS/jquery.cookie.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/speech/jQuery.speech.min.js"></script>
    <script src="../../JS/bootstrap-switch.min.js"></script>
    <script>
       
        var navName = '/FunctionModular/HeartEvaluation/MyTest.aspx';
        /*初始化测评量表集合*/
        //var jq = jQuery.noConflict();
        var Request = new Object();
        var AllLength = "";
        var GetParam = getUrlParam("AnswerType");
        var IndexNum = 1;
        var Oldscore = 0;
        var FinishiLoad = false;
        if (GetParam == '2') {
            InitGaugeModel();
            AnswerState(getUrlParam("AnserID"))

        } else if (GetParam == '1') {
            deleteAnswer();
        }
        else {
            InitGaugeModel();
        }

        function InitGaugeModel() {
            $.ajax({
                type: "POST",
                url: "Ajax/MyTest.ashx",
                data: "type=GetProblem&code=" + getUrlParam("item") + "&TNum=" + IndexNum + "&ARadom=" + getUrlParam("ARadom") + "&DID=" + getUrlParam("DID"),
                success: function (msg) {
                    msg = msg.replace(/\s/g, "");
                    var msgs = eval("(" + msg + ")");
                    AllLength = msgs.questions.length;
                    var init = msgs;
                    $('#quiz-container').jquizzy({
                        questions: init
                    });
                    FinishiLoad = true;
                    $("#StartBtn").removeAttr("disabled");
                }
            });

        }
        if (Request["item"] != null) {
            //radio赋值
            var userpp1 = $.cookie('radioCookie');
            var obj1 = JSON.parse(userpp1);

            $.each(obj1, function (name, value) {
                $("input[name='" + name + "'][value='" + value + "']").click();
            });

        }
        //提交
        var AnswerStateType = 0;
        function Submit() {

            $("#Btn_Submit").attr({ "disabled": "disabled" });
            layer.open({
                type: 1,
                title: false,
                closeBtn: false
            });
            //加载层
            layer.load(0, { shade: false }); //0代表加载的风格，支持0-2


            var types = "";
            if (GetParam == '2' || GetParam == '1') {
                //更新
                types = "UpdateAnswer";

            } else {
                //增加
                types = "Save";
            }
            var answerRecord = [];
            var commonAmountRecord = {};
            var t1 = $("#quiz-container").find("input:radio").serializeArray();//序列化数组
            var Allscore = 0;
            $.each(t1, function () {
                var child = {};
                var names = this.value
                child.QuestionName = this.name;
                commonAmountRecord[this.name] = this.value;
                child.Score = parseInt($("#" + names).attr("data-name"))
                answerRecord.push(child);
                Allscore += parseInt($("#" + names).attr("data-name"));
            });
            var RadioJson = JSON.stringify(commonAmountRecord);
            var pdi = $("#JsonPid").val();
            var jp = pdi.substring(0, pdi.length - 1);
            var JsonPid = "{" + jp + "}";
            var ss = $("#ANames").html();

            var stateType = "";
            if (AnswerStateType == 1) {

                stateType = 2;
            } else {
                //Allscore = parseInt(Oldscore + $("#Score").val());
                stateType = $("#state").val();
            }

            $.ajax({
                type: "POST",
                url: "Ajax/MyTest.ashx",
                data: {
                    type: types,
                    Code: getUrlParam("item"),
                    DID: getUrlParam("DID"),
                    RidoJson: RadioJson,
                    state: stateType,
                    AnserID: getUrlParam("AnserID"),
                    score: Allscore,
                    startime: $("#Startime").val(),
                    JsonPid: JsonPid,
                    answerRecord:JSON.stringify(answerRecord),
                    AName: $("#ANames").html(),
                },
                success: function (msg) {
                    if (msg == "1") {
                        layer.msg('提交成功!', { icon: 6, time: 2000 }, function () {
                            window.location.href = 'MyTest.aspx';
                        });

                    } else if (msg == "111") {
                        $.ajax({
                            url: "Ajax/MyTest.ashx",
                            type: "post",
                            data: { type: "InsertPotentialRiskResult" },
                            dataType: "json",
                            async:false,
                            success: function (data) {
                                if (data.State) {
                                    layer.msg('提交成功!', { icon: 6, time: 2000 }, function () {
                                        window.location.href = 'MyTest.aspx';
                                    });
                                }
                            }
                        })
                    } else if (msg == "InsertIdioctoniaEstimateResult") {
                        $.ajax({
                            url: "Ajax/MyTest.ashx",
                            type: "post",
                            data: { type: "InsertIdioctoniaEstimateResult" },
                            async: false,
                            dataType:"json",
                            success: function (data) {
                                if (data.State) {
                                    layer.msg('提交成功!', { icon: 6, time: 2000 }, function () {
                                        window.location.href = 'MyTest.aspx';
                                    });
                                }
                            }
                        })
                    }
                    else if (msg == "2") {
                        layer.closeAll();
                        $("#Btn_Submit").removeAttr("disabled");
                        layer.msg('管理员已撤销该量表作答权限，请联系管理员咨询详情！', { icon: 5, time: 3000 }, function () {
                            window.location.href = 'MyTest.aspx';
                        });
                    }
                    else {
                        layer.closeAll();
                        $("#Btn_Submit").removeAttr("disabled");
                        layer.msg('提交失败！', { icon: 5, time: 2000 });

                    }
                }
            });

        }
        //退出测试

        function TestOut() {

            layer.confirm('题目未作答完毕，您确定离开？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                window.location.href = "MyTest.aspx";
            })
        }
        //获取继续作答
        function AnswerState(AswerID) {
            $.ajax({
                type: "POST",
                url: "Ajax/MyTest.ashx",
                data: {
                    type: "ContinueAnswer",
                    AnswerID: AswerID
                },//要执行查询的数据参数
                success: function (msg) {
                    //msg = eval('(' + msg + ')')              
                    var RadioNum = "";
                    var Inputtd = "";
                    var obj2 = JSON.parse(msg);
                    $.each(obj2, function (name, value) {
                        RadioNum++

                        $("input[name='" + name + "'][value ='" + value + "']").attr('checked', true);

                        Inputtd = $("#tableid").find("#" + name + "");
                        var OldValue = $("[name='" + name + "'][value='" + value + "']").attr("data-id");
                        Inputtd.find("span").text(OldValue);
                        Inputtd.attr("onclick", "Tdclick('" + name + "')");
                        $("#NextPage").val(name);

                        //var Oldscores = parseInt($("input[name='" + name + "']").attr("data-name"));
                        //Oldscore += Oldscores;
                    });
                    FinishiLoad = true;
                    $("#StartBtn").removeAttr("disabled");
                    var StartLength = ""
                    var AllLengths = $("#AllLengths").val();
                    //alert(AllLengths);
                    if ($("#AllLengths").val() == RadioNum) {
                        $("#questionlegth").val("1");
                        StartLength = RadioNum;
                        AnswerStateType = 1;
                    } else {
                        $("#questionlegth").val("0");
                        StartLength = parseInt(RadioNum + 1);
                        AnswerStateType = 0;
                    }

                    $("#AllSubject").html(StartLength + "/" + AllLengths);

                    var widths = 100 / Math.round((AllLengths / 1));

                    $("#progressbarID").css("width", widths * RadioNum + "%");
                    $("#AnswerType").val(2);

                }
            });
        }

        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }

        function Tdclick(acode) {
            var slideContainerArray = $(".slide-container");
            for (var i = 0; i < slideContainerArray.length; i++) {
                if ($(slideContainerArray[i]).css("display") == "block") {
                    $(slideContainerArray[i]).fadeOut(0, function () {
                        $("[data-id=" + acode + "]").fadeIn(0)
                    })
                    break;
                }
            }
            $("[data-id=" + acode + "]").parent().fadeIn(500);
            var questionLength = $(".slide-container").length - 2;
            var radioLength = parseInt($("[data-id=" + acode + "]").parent().find("input").val());
            $("#AllSubject").html(radioLength + "/" + questionLength);
            var widths = 100 / Math.round((questionLength / 1));
            $("#progressbarID").css("width", widths * radioLength + "%");

            //$("#AllSubject").html(RadioLength + "/" + questionLength)
            //var widths = 100 / Math.round((questionLength / 1));
            //$("#progressbarID").css("width", widths * RadioLength + "%");
            //var FadeoutCode = "";
            //var ety = $("[data-id='" + acode + "']").parent();
            //$('.slide-container').each(function () {
            //    if ($(this).css("display") == "block") {
            //        $(this).fadeOut(500,
            //function () {
            //    ety.fadeIn(500);
            //    $("#progressId").show();
            //})
            //    }
            //});
        }
        //重新开始
        function deleteAnswer() {
            $.ajax({
                type: "POST",
                url: "Ajax/MyTest.ashx",
                data: {
                    type: "UpdateAnswer",
                    Code: getUrlParam("item"),
                    DID: getUrlParam("DID"),
                    RidoJson: "",
                    state: $("#state").val(),
                    score: $("#Score").val(),
                    AnserID: getUrlParam("AnserID"),
                },

                success: function (msg) {
                    InitGaugeModel();
                }
            });
        }
        function getNowFormatDate() {
            var date = new Date();
            var seperator1 = "-";
            var seperator2 = ":";
            var month = date.getMonth() + 1;
            var strDate = date.getDate();
            if (month >= 1 && month <= 9) {
                month = "0" + month;
            }
            if (strDate >= 0 && strDate <= 9) {
                strDate = "0" + strDate;
            }
            var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
                    + " " + date.getHours() + seperator2 + date.getMinutes()
                    + seperator2 + date.getSeconds();
            return currentdate;
        }
        //如果类型为继续作答的话时间不更新，如果类型为其他的话则更新时间

        $(function () {

            $("#exit").hide();
            $("#ANames").hide();
        })
        function tui() {
            window.location = "mytest.aspx"
        }
        //var switch_ON = "语音关";//要想用复选开关的话，这两个变量必须有
        //var switch_OFF = "语音开";
        var YYTypes = false;
        //function CK_Set(obj) {
        //    if (obj.checked) {

        //        YYTypes = false;
        //    } else {

        //        YYTypes = true;
        //    }
        //}
        setInterval('Mail()', 600000);
    </script>
    <%--<input type="hidden" id="TableLegth"  />--%>
    <input type="hidden" id="Score" />
    <input type="hidden" id="state" />
    <input type="hidden" id="NextPage" />
    <input type="hidden" id="AnswerType" />
    <input type="hidden" id="AllLengths" />
    <input type="hidden" id="questionlegth" />
    <input type="hidden" id="JsonPid" style="width: 400px;" />
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">心理测验</a></li>
                <li><a href="MyTest.aspx">我的测验</a></li>
                <li><a href="#">作答</a></li>
            </ol>
        </div>
    </div>
    <div class="row" style="float: right;">

        <button type="button" id="exit" style="border-color: RGB(66,139,203); color: RGB(66,139,203); background-color: white" class="btn btn-sm" onclick="return TestOut()">退出测试</button>
    </div>
    <div class="row" style="margin: 0px 20px 50px 20px;">
        <div class="row" style="text-align: center; font-size: 26px; font-weight: bold; margin-top: 50px;" id="ANames">
        </div>
        <%--   <div class="col-md-8">
            <div class="make-switch" data-on="info" id="wlan_enable_div" data-off="success">
                <input type="checkbox" onclick="CK_Set(this)" onchange="CK_Set(this)" id="CK_F_Type" checked="checked" />
            </div>

        </div>--%>
        <div class="row">
            <%-- <img src="../../SubjectImages/RuiWenABCDE/A/A1/images/A1_03.jpg" />--%>
            <div id="quiz-container" style="margin-bottom: 50px; width: 100%">
            </div>
        </div>
        <div class="row" style="margin-left: 20px; width: 30%; display: none;" id="progressId">
            <div class="progress progress-striped active" style="height: 10px;">
                <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="28" aria-valuemin="0" aria-valuemax="100" id="progressbarID">
                </div>

            </div>
            <div id="AllSubject"></div>
        </div>
        <div class="row" id="RTable" style="display: none; margin-top: 50px; margin-left: 30px;">
            <div class="row" style="font-weight: bold">答题记录</div>
            <div class="row" style="margin-top: 10px;">
                <table border="1" id="tableid" style="border: 1px; border-color: #BFEFFF; width: 90%;">
                </table>
            </div>
        </div>

    </div>
    <div id='Speechse' style="display: none"></div>
    <input type="hidden" id="Startime" />
    <script src="../../JS/quiz.js"></script>
    <%-- <script>
        $('#Speechs').speech({
            "speech": true,
            "speed": 1,
            "bg": "speech.png"
        });
    </script>--%>
</asp:Content>
