<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Questionnaire_Answer.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.Questionnaire_Answer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/style.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/font-awesome.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-switch.css" rel="stylesheet" />
    <%--  <script src="../../JS/jquery-2.0.3.min.js"></script>--%>
    <script src="../../JS/questionnaire.js"></script>
    <script src="../../JS/jquery.cookie.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/speech/jQuery.speech.min.js"></script>
    <script src="../../JS/bootstrap-switch.min.js"></script>

    <script>
        var navName = '/FunctionModular/Questionnaire_Record/MyQuestionnaire.aspx';
        /*初始化测评量表集合*/
        //var jq = jQuery.noConflict();
        var Request = new Object();
        var AllLength = "";
        var GetParam = getUrlParam("AnswerType");//作答类型
        var AnwserID = getUrlParam("AnserID");//作答ID
        var Is_Anonymity = getUrlParam("IsAnonymity");//是否允许匿名作答
        var QCode = getUrlParam("Q_Code");//问卷编码
        var QD_Code = getUrlParam("QD_Code");//分配编码
        var IndexNum = 1;
        var Oldscore = 0;

        //重新作答时
        if (GetParam == '1') {
            deleteAnswer();
        }
            //作答
        else {
            InitGaugeModel();
        }
        //初始化作答界面--作答/重新作答
        function InitGaugeModel() {
            $.ajax({
                type: "POST",
                url: "Ajax/MyQuestionnaire.ashx",
                data: "type=GetProblem&code=" + QD_Code + "&Q_Code=" + getUrlParam("Q_Code") + "&Anonymity=" + Is_Anonymity,
                success: function (msg) {
                    msg = msg.replace(/\s/g, "");
                    var msgs = eval("(" + msg + ")");
                    AllLength = msgs.questions.length;
                    var init = msgs;
                    skipPathArry = new Array();
                    $('#quiz-container').jquizzy({
                        questions: init
                    });
                    var widths = 100 / Math.round((AllLength / 1));

                    $("#progressbarID").css("width", widths * 1 + "%");
                    //继续作答时
                    if (GetParam == '2') {
                        AnswerState(QD_Code);
                    }
                }
            });

        }

        function inputChangeEvent(data) {
            var text = $(data).val();
            var count = text.replace(/[^\u0000-\u00ff]/g, "aa").length * 10;
            if (count >= 50 && count <= 500)
                $(data).css("width", count);
            if (count == 0)
                $(data).css("width", 50);
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
        var score = 0;//得分
        function Submit() {
            //检查该题是否作答，否则阻止下一题
            var isAnwser = checkIsAnwser();

            if (isAnwser == false) {
                layer.msg('当前题目未完成!', {
                    offset: 't',
                    anim: 6
                });
                return;
            }

            $("#Btn_Submit").attr({ "disabled": "disabled" });
            layer.open({
                type: 1,
                title: false,
                closeBtn: false
            });
            //加载层
            layer.load(0, { shade: false }); //0代表加载的风格，支持0-2

            var types = "";
            //            if (GetParam == '2' || GetParam == '1') {
            //更新
            types = "UpdateAnswer";

            //} else {
            //    //增加
            //    types = "SaveAnwser";
            //}
            var lastSub = 0;
            $("div[name=subject]").each(function (i) {
                if ($(this).css("display") == "block") {
                    lastSub = $(this).find("#inputhide").val();
                }
            });
            if (skipPathArry.indexOf(parseInt(lastSub)) < 0)
                skipPathArry[skipPathArry.length] = parseInt(lastSub);
            var d1 = getAnwserSub();
            if (d1 != {}) {
                var Json = JSON.stringify(d1);
                var path = "";
                for (var i = 0; i < skipPathArry.length; i++) {
                    if (i == 0)
                        path = skipPathArry[i];
                    else
                        path += "," + skipPathArry[i];
                }
                var tzCodeList = "";//题支编码集合
                var tgCodeList = "";//多选题的题干编码集合
                //计算分值的处理               
                $.each(d1, function (name, value) {
                    var temparr = value;
                    if (temparr[temparr.length - 1] == "0" || temparr[temparr.length - 1] == "1") {
                        if (temparr[temparr.length - 1] == "1") {
                            if (tgCodeList == "")
                                tgCodeList = name;
                            else
                                tgCodeList += "," + name;
                        }
                        for (var i = 0; i < temparr.length - 1; i++) {
                            if (tzCodeList == "")
                                tzCodeList = temparr[i];
                            else
                                tzCodeList += "," + temparr[i];
                        }
                    }
                });
                var tgCode = tgCodeList.split(",");
                var sort = "";
                for (var i = 0; i < tgCode.length; i++) {
                    sort = "";
                    $("input[type=checkbox][name=" + tgCode[i] + "]").each(function (j) {
                        if ($(this)[0].checked == true && $(this).attr("data-id") != "undefined") {
                            if (sort == "")
                                sort = $(this).attr("data-id");
                            else
                                sort += "," + $(this).attr("data-id");
                        }

                    });
                    var pare = $("input[type=checkbox][name=" + tgCode[i] + "]").parent().parent().parent().find("#inputhide");
                    if (sort == pare.attr("data-true")) {
                        if (pare.attr("data-score") != "")
                            score = parseFloat(score) + parseFloat(pare.attr("data-score"));
                    }
                }
                //得到题支编码集合之后，计算得分
                $.ajax({
                    type: "POST",
                    url: "Ajax/MyQuestionnaire.ashx",
                    data: {
                        type: "CalculateScore",
                        tzlist: tzCodeList
                    },
                    success: function (msg) {
                        if (msg != -1) {
                            score = parseFloat(score) + parseFloat(msg);
                            var Is_Anonymity = $("#AnonymitySubmit")[0].checked; //是否选中匿名提交
                            //保存作答记录的处理
                            $.ajax({
                                type: "POST",
                                url: "Ajax/MyQuestionnaire.ashx",
                                data: {
                                    type: types,
                                    AnserID: AnwserID,
                                    QD_Code: QD_Code,
                                    Json: Json,
                                    Q_Code: QCode,
                                    AnwserPath: path,
                                    Is_Anonymity: Is_Anonymity,
                                    Score: score,
                                    Submit: '<%=DateTime.Now%>',
                                    startime: $("#Startime").val()
                                },
                                success: function (msg) {
                                    if (msg == "1") {
                                        layer.msg('提交成功!', { icon: 6, time: 2000 }, function () {
                                            window.location.href = 'MyQuestionnaire.aspx';
                                        });

                                    } else if (msg == "2") {
                                        layer.closeAll();
                                        $("#Btn_Submit").removeAttr("disabled");

                                        layer.msg('管理员已撤销该量表作答权限，请联系管理员咨询详情！', { icon: 5, time: 3000 }, function () {
                                            window.location.href = 'MyQuestionnaire.aspx';
                                        });
                                    } else {
                                        layer.closeAll();
                                        $("#Btn_Submit").removeAttr("disabled");
                                        layer.msg('提交失败！', { icon: 5, time: 2000 });

                                    }
                                }
                            });
                        }

                    }
                });

            }
        }

        //检查当前题干是否被作答
        function checkIsAnwser() {
            var isAnwser = false;
            $("div[name=subject]").each(function () {
                if ($(this).css("display") == "block") {
                    var type = $(this).find("input[type=hidden]").attr("data-type");
                    if (type == "0")
                        $(this).find("input[type=radio]").each(function () {
                            if ($(this)[0].checked == true)
                                isAnwser = true;
                        });
                    else if (type == "1")
                        $(this).find("input[type=checkbox]").each(function () {
                            if ($(this)[0].checked == true)
                                isAnwser = true;
                        });
                    else if (type == "2") {
                        var textIsNull = false;
                        $(this).find("input[type=text]").each(function () {
                            if ($(this)[0].value == "")
                                textIsNull = true;
                        });
                        if (textIsNull == false)
                            isAnwser = true;
                    }

                    else if (type == "3")
                        $(this).find("textarea").each(function () {
                            if ($(this)[0].value != "")
                                isAnwser = true;
                        });
                }
            });
            return isAnwser;
        }
        //退出测试

        function TestOut() {

            layer.confirm('题目未作答完毕，您确定离开？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                var lastSub = 0;
                $("div[name=subject]").each(function (i) {
                    if ($(this).css("display") == "block") {
                        lastSub = $(this).find("#inputhide").val();
                    }
                });
                if (skipPathArry.indexOf(parseInt(lastSub)) < 0)
                    skipPathArry[skipPathArry.length] = parseInt(lastSub);
                var d1 = getAnwserSub();

                if (d1 != {}) {
                    //var GetParam = getUrlParam("AnswerType");
                    var types = "";
                    //if (GetParam == '2' || GetParam == '1') {
                    //更新
                    types = "UpdateAnswer";
                    //} else {
                    //    //增加
                    //    types = "SaveAnwser";
                    //}
                    var stateType = "";
                    var Json = JSON.stringify(d1);
                    var path = "";
                    for (var i = 0; i < skipPathArry.length; i++) {
                        if (i == 0)
                            path = skipPathArry[i];
                        else
                            path += "," + skipPathArry[i];
                    }
                    $.ajax({
                        type: "POST",
                        url: "Ajax/MyQuestionnaire.ashx",
                        data: {
                            type: types,
                            AnserID: AnwserID,
                            QD_Code: QD_Code,
                            Json: Json,
                            Q_Code: QCode,
                            AnwserPath: path,
                            Submit: "1900-01-01",
                            Is_Anonymity: false,
                            startime: $("#Startime").val()
                        },

                        success: function (msg) {
                            window.location.href = 'MyQuestionnaire.aspx';
                        }
                    });
                } else {
                    window.location.href = 'MyQuestionnaire.aspx';
                }
            });
        }
        //获取所有被作答的题干和对应选中/填写的选项/内容
        function getAnwserSub() {

            var anwserSubCode = new Array();//保存作答记录中的题干编码，根据跳转路径来保存。不在其中的题干，不保存答案
            $("[name=subject]").each(function () {
                var valu = parseInt($(this).find("#inputhide")[0].value);
                if (skipPathArry.indexOf(valu) >= 0) {
                    anwserSubCode[anwserSubCode.length] = $(this).find("#inputhide").next().attr("data-id");
                }
            });
            var d1 = {};
            //获取单选题
            var t1 = $("#quiz-container").find("input:radio").serializeArray(); //
            var checkName = "";
            var checkValue = new Array();
            $.each(t1, function (i) {
                if (anwserSubCode.indexOf(this.name) >= 0) {
                    checkName = t1[i].name;
                    checkValue[checkValue.length] = t1[i].value;
                    checkValue[checkValue.length] = "0";
                    d1[checkName] = checkValue;

                    checkValue = new Array();
                    checkName = "";
                }
            });
            //获取多选题中选中题支
            var t2 = $("#quiz-container").find("input:checkbox"); //
            $.each(t2, function (i) {
                if (t2[i].checked == true) {
                    if (anwserSubCode.indexOf(t2[i].name) >= 0) {
                        if (checkName != "" && t2[i].name != checkName) {
                            checkValue[checkValue.length] = "1";
                            d1[checkName] = checkValue;
                            checkName = "";
                            checkValue = new Array();
                        }
                        checkName = t2[i].name;
                        checkValue[checkValue.length] = t2[i].value;
                    }
                }
            });
            if (checkName != "" && checkValue.length > 0) {
                checkValue[checkValue.length] = "1";
                d1[checkName] = checkValue;
            }

            //获取填空填写内容
            var t3 = $("#quiz-container").find("input:text"); //
            checkName = "";
            checkValue = new Array();
            $.each(t3, function (i) {
                if (anwserSubCode.indexOf(t3[i].name) >= 0) {
                    if (checkName != "" && t3[i].name != checkName) {
                        checkValue[checkValue.length] = "2";
                        d1[checkName] = checkValue;
                        checkName = "";
                        checkValue = new Array();
                    }
                    checkName = t3[i].name;
                    checkValue[checkValue.length] = t3[i].value;
                }
            });
            if (checkName != "" && checkValue.length > 0) {
                checkValue[checkValue.length] = "2";
                d1[checkName] = checkValue;
            }
            //获取简答题的内容
            var t4 = $("#quiz-container").find("textarea"); //
            checkName = "";
            checkValue = new Array();
            $.each(t4, function (i) {
                if (t4[i].value != "" && anwserSubCode.indexOf(t4[i].name) >= 0) {
                    if (checkName != "" && t4[i].name != checkName) {
                        checkValue[checkValue.length] = "3";
                        d1[checkName] = checkValue;
                        checkName = "";
                        checkValue = new Array();
                    }
                    checkName = t4[i].name;
                    checkValue[checkValue.length] = t4[i].value;
                }
            });
            if (checkName != "" && checkValue != "") {
                checkValue[checkValue.length] = "3";
                d1[checkName] = checkValue;
            }

            return d1;
        }
        //获取继续作答
        function AnswerState(AnwserID) {
            $.ajax({
                type: "POST",
                url: "Ajax/MyQuestionnaire.ashx",
                data: {
                    type: "ContinueAnswer",
                    AnswerID: AnwserID
                },//要执行查询的数据参数
                async: true,//同步
                success: function (msg) {
                    //msg = eval('(' + msg + ')')              
                    var RadioNum = "1";
                    var Inputtd = "";
                    var array = eval(msg);
                    var obj2 = JSON.parse(array[0]);

                    var temp = array[1].split(",");
                    for (var i = 0; i < temp.length; i++) {
                        skipPathArry[skipPathArry.length] = parseInt(temp[i]);
                    }
                    var ind = 0;
                    var singe = 0;
                    var input = 0;
                    var textarea = 0;

                    var tgIndex = 0;//对应下边的TG_num

                    $.each(obj2, function (name, values) {
                        RadioNum = skipPathArry[ind];
                        for (var i = 0; i < values.length - 1; i++) {
                            if (values[values.length - 1] == "0" || values[values.length - 1] == "1") {
                                $("input[name='" + name + "'][value ='" + values[i] + "']").attr('checked', true);
                            }
                            else if (values[values.length - 1] == "2") {
                                $("#quiz-container").find("input[type=text]")[input].value = values[i];
                                input++;
                            }
                            else if (values[values.length - 1] == "3") {
                                $("#quiz-container").find("textarea")[textarea].value = values[i];
                                textarea++;
                            }
                        }
                        Inputtd = $("#tableid").find("#" + name + "");
                        var OldValue = "";
                        if (values[values.length - 1] == "0" || values[values.length - 1] == "1")
                            for (var i = 0; i < values.length - 1; i++) {
                                OldValue = $("[name='" + name + "'][value='" + values[i] + "']").attr("data-id");
                            }
                        else if (values[values.length - 1] == "2") {
                            $("#quiz-container").find("[name='" + name + "']").each(function (j) {
                                if (j == 0)
                                    OldValue = $(this).val();
                                else
                                    OldValue += "," + $(this).val();
                            });
                        } else {
                            OldValue = $("[name='" + name + "']").val();
                        }
                        Inputtd.find("span").text(OldValue);
                        Inputtd.attr("onclick", "Tdclick('" + name + "')");

                        var TG_num = $("[data-id=" + name + "]").parent().find("[type=hidden]")[0].value;//获取该题干的序号，以此来作为最后显示的题干的判断条件。题号最大的显示
                        if (parseInt(TG_num) > tgIndex) {
                            tgIndex = parseInt(TG_num);
                            $("#NextPage").val(name);
                        }

                        //var Oldscores = parseInt($("input[name='" + name + "']").attr("data-name"));
                        //Oldscore += Oldscores;
                        ind++;

                    });

                    var StartLength = "";
                    var AllLengths = $("#AllLengths").val();
                    //alert(AllLengths);
                    if ($("#AllLengths").val() == RadioNum) {
                        $("#questionlegth").val("1");
                        StartLength = RadioNum;
                        AnswerStateType = 1;
                    } else {
                        $("#questionlegth").val("0");
                        StartLength = parseInt(RadioNum);
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
                        $("[data-id=" + acode + "]").fadeIn(0);
                    });
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
                url: "Ajax/MyQuestionnaire.ashx",
                data: {
                    type: "UpdateAnswer",
                    AnserID: AnwserID,
                    Json: "<%=DBNull.Value%>",
                    startime: "<%=DateTime.Now%>"
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
        });
        function tui() {
            window.location = "MyQuestionnaire.aspx";
        }
        //var switch_ON = "语音关";//要想用复选开关的话，这两个变量必须有
        //var switch_OFF = "语音开";
        var YYTypes = false;
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
                <li><a href="#">问卷调查</a></li>
                <li><a href="MyQuestionnaire.aspx">我的问卷</a></li>
                <li><a href="#">问卷作答</a></li>
            </ol>
        </div>
    </div>
    <div class="row" style="float: right;">

        <button type="button" id="exit" style="border-color: RGB(66,139,203); color: RGB(66,139,203); background-color: white" class="btn btn-sm" onclick="return TestOut()">退出测试</button>
    </div>
    <div class="row" style="margin: 0px 20px 50px 20px;">
        <div class="row" style="text-align: center; font-size: 26px; font-weight: bold; margin-top: 50px;" id="ANames">
        </div>
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
</asp:Content>
