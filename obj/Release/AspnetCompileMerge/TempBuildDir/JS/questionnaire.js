var skipPathArry = new Array();//保存题干之间跳转的路径，只保存题干编码
(function ($) {
    var ttti = "";
    var questionLength;
    var dd1 = {}
    $.fn.jquizzy = function (settings) {
        var defaults = {
            questions: null,
            startImg: 'images/start.gif',
            endText: '已结束!',
            shortURL: null,
            sendResultsURL: null,
            resultComments: {
                perfect: '你是爱因斯坦么?',
                excellent: '非常优秀!',
                good: '很好，发挥不错!',
                average: '一般般了。',
                bad: '太可怜了！',
                poor: '好可怕啊！',
                worst: '悲痛欲绝！'
            }
        };
        var config = $.extend(defaults, settings.questions);
        if (config.questions === null) {
            $(this).html('<div class="intro-container slide-container"><h2 class="qTitle">暂无数据</h2></div>');
            return;
        }
        var qCode = "";
        var allLength = config.questions.length;
        var QName = settings.questions.Questionnaire_Guidance[1].QName;
        var Anonymity = settings.questions.Questionnaire_Guidance[2].Anonymity;

        function returnSkipPathArry() {
            return skipPathArry;
        }
        var superContainer = $(this),
        answers = [],
        //设置作答时，显示的问卷名称，指导语和提示语
       introFob = '<div class="intro-container slide-container "> <div class="row"  style="text-align:center;padding-bottom:3%;"><h2 id="ANames">' + QName + '</h2></div><div><div class="row" style="margin-top:20px;margin-left:10px;"> <div class="col-md-2 col-sm-12 text-center" >指导语：</div><div class="col-md-9 col-sm-12"id="Guidance">' + settings.questions.Questionnaire_Guidance[0].QGuidance + '</div> </div> <div class="row" style="margin-top:50px;margin-left:10px;">  <div class="col-md-2 col-sm-12 text-center"> 温馨提示：</div> <div class="col-md-9 col-sm-12">为保证结果的准确性，答题时以第一感觉作答，过程中尽量不要返回作答。</div></div> </div><a class="nav-start" style="text-align:center" href="#" ><button class="btn btn-lg" style="width:120px;height:40px;text-align:center;background-color:orange;color:white">开始答题</button></a><div class="col-md-11 col-xs-7"><button class="btn btn-sm" style="float:right;text-align:center;margin-top:10px;cursor:pointer;width:57px;height:30px; background-color:RGB(66,139,203);color:white" onclick="tui()">返回</button></div></div>',
        contentFob = '',
        questionsIteratorIndex,
        answersIteratorIndex;
        superContainer.addClass('main-quiz-holder');

        $("#AllLengths").val(allLength);

        //创建题干和题支的代码块
        for (questionsIteratorIndex = 0; questionsIteratorIndex < config.questions.length; questionsIteratorIndex++) {

            if (qCode == "") {
                qCode += config.questions[questionsIteratorIndex].SubCode[0];
            } else {
                qCode += "," + config.questions[questionsIteratorIndex].SubCode[0];
            }
            var Qcontent = config.questions[questionsIteratorIndex].question;
            /*开始创建题干*/
            var type_temp = config.questions[questionsIteratorIndex].subType;//题干类型
            var sub_trueAnw = config.questions[questionsIteratorIndex].TrueAnwser;//多选题的正确选项
            var sub_score = config.questions[questionsIteratorIndex].Score;//题干分值

            switch (type_temp) {
                case "0":
                    contentFob += '<div class="slide-container" name=\"subject\"><input  type="hidden" data-type=\"' + type_temp + '\" id="inputhide" value='
                        + (questionsIteratorIndex + 1) +
                        '><div class="question" data-id=' + config.questions[questionsIteratorIndex].SubCode[0] + '>'
                        + config.questions[questionsIteratorIndex].question +"  (单选题)"+ '</div><ul class="answers">';
                    break;
                case "1":
                    contentFob += '<div class="slide-container" name=\"subject\"><input  type="hidden" data-type=\"'
                        + type_temp + '\"  data-true=\"' + sub_trueAnw + '\" ' + ' data-score=\"' + sub_score + '\" '
                        + 'id="inputhide" value=' + (questionsIteratorIndex + 1) + '><div class="question" data-id='
                        + config.questions[questionsIteratorIndex].SubCode[0] + '>' + config.questions[questionsIteratorIndex].question + "  (多选题)"
                        + '</div><ul class="answers">';
                    break;
                case "2":
                    var cont = config.questions[questionsIteratorIndex].question.replace(/@____;/g, "<input onkeyup='return inputChangeEvent(this)' type='text' name="
                        + config.questions[questionsIteratorIndex].SubCode[0] + " style='border: solid 0px;width:50px;border-bottom: solid 1px black;margin-left:2px;margin-right:2px;' />");
                    contentFob += '<div class="slide-container" name=\"subject\"><input type="hidden" data-type=\"'
                        + type_temp + '\" id="inputhide" value=' + (questionsIteratorIndex + 1) + '><div class="question" data-id='
                        + config.questions[questionsIteratorIndex].SubCode[0] + '>' + cont + "（下划线部分为空缺）"
                         + '</div><ul class="answers">';
                    break;
                case "3":
                    contentFob += '<div class="slide-container" name=\"subject\"><input  type="hidden" data-type=\"' +
                        type_temp + '\" id="inputhide" value=' + (questionsIteratorIndex + 1) + '><div class="question" data-id='
                        + config.questions[questionsIteratorIndex].SubCode[0] + '>' + '<p style="font-size: 20px;font-weight: bold;word-break: break-all;">' + config.questions[questionsIteratorIndex].question + '</p>'
                        + '<textarea name="' + config.questions[questionsIteratorIndex].SubCode[0] + '" maxlength="500" cols ="50" rows = "3"></textarea></div><ul class="answers">';
                    break;
            }
            /*结束题干的创建*/

            //循环创建题支
            for (answersIteratorIndex = 0; answersIteratorIndex < config.questions[questionsIteratorIndex].answers.length; answersIteratorIndex++) {
                var AnswerConTent = config.questions[questionsIteratorIndex].answers[answersIteratorIndex];
                var inputType = "radio";
                if (type_temp == 1)
                    inputType = "checkbox";
                if (AnswerConTent.indexOf("../../SubjectImages") >= 0) {
                    contentFob += "<li><input type=\"" + inputType + "\" data-skip=\"" + config.questions[questionsIteratorIndex].SkipCode[answersIteratorIndex]
                        + "\" data-name=\"" + config.questions[questionsIteratorIndex].Factions[answersIteratorIndex]
                        + "\" value=\"" + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex]
                        + "\" name=\"" + config.questions[questionsIteratorIndex].SubCode[answersIteratorIndex]
                        + "\" data-id=\"" + config.questions[questionsIteratorIndex].IndexNum[answersIteratorIndex]
                        + "\" id=\"" + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex]
                        + ">" + config.questions[questionsIteratorIndex].SerialNumber[answersIteratorIndex] + "."
                        + "<img src=\"" + config.questions[questionsIteratorIndex].answers[answersIteratorIndex] + "\"></li>";
                }
                else {
                    contentFob += '<li><input type="' + inputType + '" data-skip=\"' + config.questions[questionsIteratorIndex].SkipCode[answersIteratorIndex]
                        + '\" data-name=\"' + config.questions[questionsIteratorIndex].Factions[answersIteratorIndex] + '\" value=\"'
                        + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + '\" name=\"'
                        + config.questions[questionsIteratorIndex].SubCode[answersIteratorIndex] + '\" data-id=\"'
                        + config.questions[questionsIteratorIndex].IndexNum[answersIteratorIndex] + '\" id=\"'
                        + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + '\">'
                        + config.questions[questionsIteratorIndex].SerialNumber[answersIteratorIndex] + "."
                        + config.questions[questionsIteratorIndex].answers[answersIteratorIndex] + '</li>';
                }
            }
            contentFob += '</ul><div class="nav-container">';//结束创建题支

            if (((questionsIteratorIndex < config.questions.length - 1 || (questionsIteratorIndex == "0" && (type_temp != "0" && type_temp != "1"))) || (type_temp != "0" && type_temp != "1")) && questionsIteratorIndex < config.questions.length - 1) {
                contentFob += '<div class="next" style="margin-top:0px;float:right;width:70px;margin-right:20px;"><a class="nav-next" style="color:black" href="#"> 下一题<i class="fa fa-share" style="margin-left:5px;"></i></a></div>';
                //contentFob += '<div class="next"style=" display:none" ><a class="nav-next" href="#" >下一题 &gt;</a></div>';
            } else {
                var display = "none";
                if (Anonymity == "True")
                    display = "block";
                contentFob += '<div class="final" ><div style="float:left;margin-left:30px;display:' + display + '"><input type="checkbox" id="AnonymitySubmit">  <label for="AnonymitySubmit">匿名提交</label></div>' +
                    '<button class="btn btn-lg"  id="Btn_Submit" style="width:100px;height:30px;border-color:orange;background-color:white;color:orange;text-align:center" onclick="return Submit()">提交</button></div>';
            }
            if (questionsIteratorIndex !== 0) {
                contentFob += '<div class="prev"><a class="nav-previous" style="color:black" href="#"><i class="fa fa-reply"></i> 上一题</a></div>';
            }
            contentFob += '</div></div>';
            answers.push(config.questions[questionsIteratorIndex].correctAnswer);
        }
        //superContainer.html(introFob + contentFob + exitFob);
        superContainer.html(introFob + contentFob);


        //表格
        var rowCount = Math.ceil(config.questions.length / 10);
        qCode = qCode.split(',');
        ACOdelength = qCode.length;
        var table = $("#tableid");
        var trm = -1;
        for (var i = 0; i < rowCount; i++) {
            var tr = $("<tr></tr>");
            tr.appendTo(table);

            for (var j = 1; j < 11; j++) {
                var td = "";
                trm++;
                if (ACOdelength > trm) {
                    td = $("<td style='width:104px;' id='" + qCode["" + trm + ""] + "'  \">" + parseInt(trm + 1) + "." + "<span></span></td>");
                } else {
                    td = $("<td><span></span></td>");
                }

                td.appendTo(tr);
            }
        }
        //end

        var progress = superContainer.find('.progress'),

        notice = superContainer.find('.notice'),

        userAnswers = [],
        questionLength = config.questions.length,
        slidesList = superContainer.find('.slide-container');

        function checkAnswers() {
            var resultArr = [],
            flag = false;
            for (i = 0; i < answers.length; i++) {
                if (answers[i] == userAnswers[i]) {
                    flag = true;
                } else {
                    flag = false;
                }
                resultArr.push(flag);
            }
            return resultArr;
        }
        function roundReloaded(num, dec) {
            var result = Math.round(num * Math.pow(10, dec)) / Math.pow(10, dec);
            return result;
        }
        function judgeSkills(score) {
            var returnString;
            if (score === 100) return config.resultComments.perfect;
            else if (score > 90) return config.resultComments.excellent;
            else if (score > 70) return config.resultComments.good;
            else if (score > 50) return config.resultComments.average;
            else if (score > 35) return config.resultComments.bad;
            else if (score > 20) return config.resultComments.poor;
            else return config.resultComments.worst;
        }

        var Radiocheck = 0;
        trueCount = 0,
        //progressKeeper.hide();
        notice.hide();
        slidesList.hide().first().fadeIn(50);
        superContainer.find('li').click(function () {
            var thisLi = $(this);
            var inputradio = "";
            thisLi.parents('.answers').children('li').removeClass('selected');
            if (thisLi.find('input:radio').length > 0)
                thisLi.find('input:radio')[0].checked = true;
            if (thisLi.find('input:checkbox').length > 0) {
                if (thisLi.find('input:checkbox')[0].checked == true) {
                    thisLi.find('input:checkbox')[0].checked = false;
                    thisLi.find('input:checkbox').addClass('selected');
                } else {
                    thisLi.find('input:checkbox')[0].checked = true;
                    thisLi.find('input:checkbox').removeClass('selected');
                }
            }

            thisLi.find('input:radio').addClass('selected');
            //拼接table
            var RaodioID = $(this).parent().parent().find('.question').attr("data-id");
            $("#tableid").find("#" + RaodioID + "").find("span").text(thisLi.find('input:radio').attr("data-id")); //得到题干

            $("#tableid").find("#" + RaodioID + "").find("span").text(); //得到题型
            var tdd = $("#tableid").find("#" + RaodioID + "").find("span").text(); //得到题型
            $("#tableid").find("#" + RaodioID + "").attr("onclick", "Tdclick('" + RaodioID + "');");
            trueCount += parseInt(thisLi.find('input:radio').attr("data-name"));
            var tti = '"' + RaodioID + '"' + ':"' + tdd + '"';
            ttti += tti + ',';
            $("#JsonPid").val(ttti);

            var d1 = {};
            var t1 = $("#quiz-container").find("input:radio").serializeArray();//

            $.each(t1, function () {
                d1[this.name] = this.value;

            });
            $.cookie('radioCookie', JSON.stringify(d1), { expires: 1 });
            $("#Score").val(trueCount);
            var QuIndexLength = $(this).parent().parent().find("#inputhide").val();

            //阻止单选题之外的题型，在点击选项时，自动跳转到下一题的事件
            var isreturn = false;
            var subtype = 0;
            subtype = $(this).parent().parent().find("input[type=hidden]").attr("data-type");
            var nowSub = parseInt($(this).parent().parent().find("input[type=hidden]").val());
            if (subtype != "0")
                isreturn = true;
            if (isreturn) return;
            var skipCount = 0;
            if (subtype == "0")
                skipCount = parseInt($(this).find("input[type=radio]").attr("data-skip"));
            if (QuIndexLength != allLength) {
                $("#state").val(1);
                if (isreturn == false) {
                    if (skipCount != "0") {
                        var ent = $(this).parent().parent();
                        ent.fadeOut(500,
               function () {
                   //var temp = 0;
                   //if (skipCount == parseInt(questionLength)) {
                   //    temp = skipCount;
                   //    skipCount -= 1;
                   //}
                   $(this).parent().find("div[name=subject]").eq(skipCount - 1).fadeIn(500);
                   var widths = 100 / Math.round((questionLength / 1));
                   $("#progressbarID").css("width", widths * (skipCount) + "%");
                   $("#AllSubject").html(skipCount + "/" + questionLength);
                   if (skipPathArry.indexOf(nowSub) < 0)
                       skipPathArry[skipPathArry.length] = nowSub;
                   //skipCount = temp;
               });
                    }
                    else
                        $(this).parent().parent().find('.next').click();
                }
            } else if (QuIndexLength == allLength) {
                $("#state").val(2);
                var widths = 100 / Math.round((questionLength / 1));
                $("#progressbarID").css("width", "100%");
                $(".final").show();
            }

            //}
        });

        superContainer.find('.nav-start').click(function () {
            var myDate = new Date();
            var years = myDate.getFullYear();
            var month = add_zero(myDate.getMonth() + 1);
            var days = add_zero(myDate.getDate());
            var hours = add_zero(myDate.getHours());
            var minutes = add_zero(myDate.getMinutes());
            var seconds = add_zero(myDate.getSeconds());
            var ndate = years + "-" + month + "-" + days + " " + hours + ":" + minutes + ":" + seconds;
            $("#Startime").val(ndate);

            //当第一次作答时，点击开始答题，先将往数据库中添加一条作答记录，并且该问卷不能再修改
            if (GetParam == '0') {
                skipPathArry[skipPathArry.length] = 1;
                var d1 = {};

                var types = "SaveAnwser";
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
                        QD_Code: QD_Code,
                        Json: Json,
                        Q_Code: QCode,
                        AnwserPath: path,
                        Submit: "1900-01-01",
                        Is_Anonymity: false,
                        startime: $("#Startime").val()
                    },
                    success:function(msg) {
                        AnwserID = msg;
                    }
                });
            }

            if ($("#AnswerType").val() == 2) {
                var ety = $("[data-id='" + $("#NextPage").val() + "']").parent();
                //语音

                if (YYTypes) {
                    var htmls = $(this).parents('.slide-container').next().children('.question').html();//题干
                    var lis = $(this).parents('.slide-container').next().find("li");
                    for (var i = 0; i < lis.length; i++) {
                        htmls += lis.eq(i).text() + ";";
                    }

                    $("#Speechse").html(htmls);
                    $('#Speechse').speech({
                        "speech": false,
                        "speed": 3,
                        "bg": "/FunctionModular/HeartEvaluation/speech.png"
                    });
                }
                $(this).parents('.slide-container').fadeOut(500,
               function () {
                   if ($("#questionlegth").val() == 1) {
                       ety.first().fadeIn(500);
                       $(".final").show();
                   } else {
                       if ($("#NextPage").val() == "")
                           $(this).next().fadeIn(500);
                       else
                           ety.fadeIn(500);
                   }
                   $("#ANames").html(QName);
                   //$("#RTable").show();
                   $("#progressId").show();
                   $("#exit").show();
                   $("#ANames").show();
                   if ($("#AllSubject").html() == null || $("#AllSubject").html() == "") {
                       $("#AllSubject").html(1 + "/" + questionLength);
                   }
               });
            } else {

                var ety = $("[data-id='" + $("#NextPage").val() + "']").parent();
                //语音
                if (YYTypes) {
                    var htmls = $(this).parents('.slide-container').next().children('.question').html();//题干
                    var lis = $(this).parents('.slide-container').next().find("li");
                    for (var i = 0; i < lis.length; i++) {
                        htmls += lis.eq(i).text() + ";";
                    }
                    $("#Speechse").html(htmls);
                    $('#Speechse').speech({
                        "speech": false,
                        "speed": 3,
                        "bg": "/FunctionModular/HeartEvaluation/speech.png"
                    });
                }
                $(this).parents('.slide-container').fadeOut(500,
                function () {
                    $(this).next().fadeIn(500);

                    $("#ANames").html(QName);
                    //$("#RTable").show();
                    $("#progressId").show();
                    $("#exit").show();
                    $("#ANames").show();
                    if ($("#AllSubject").html() == null || $("#AllSubject").html() == "") {
                        $("#AllSubject").html(1 + "/" + questionLength);
                    }
                });
            }
            return false;
        });

        $(".answers").find("input[type=checkbox]").click(function () {
            if ($(this)[0].checked == true) {
                $(this)[0].checked = false;
                $(this).addClass('selected');
            } else {
                $(this)[0].checked = true;
                $(this).removeClass('selected');
            }
        });
        function next_AddClick() {
            superContainer.find('.next').click(function () {
                //检查该题是否作答，否则阻止下一题
                var isAnwser = checkIsAnwser();

                if (isAnwser == false) {
                    layer.msg('当前题目未完成!');
                    return;
                }

                var RadioLength = parseInt($(this).parent().parent().find("#inputhide").val());//拿到当前的题干序号
                notice.hide();
                prev_RemoveClick();
                var skipCount = "";
                // prev_RemoveClick();
                $(this).parents('.slide-container').fadeOut(500,
               function () {
                   //$(this).next().fadeIn(500, function () {
                   //    prev_AddClick();
                   //});
                   $(this).find("input[type=radio]").each(function (i, item) {
                       if (item.checked == true)
                           skipCount = parseInt(item.getAttribute("data-skip"));
                   });
                   if (skipCount == "" || skipCount == "0")
                       skipCount = parseInt(RadioLength) + 1;
                   //var temp = 0;
                   //if (skipCount == parseInt(questionLength)) {
                   //    temp = skipCount;
                   //    skipCount -= 1;
                   //}
                   $(this).parent().find("div[name=subject]").eq(skipCount - 1).fadeIn(500, function () {
                       prev_AddClick();
                   });
                   $("#AllSubject").html(skipCount + "/" + questionLength);
                   if (skipPathArry.indexOf(RadioLength) < 0)
                       skipPathArry[skipPathArry.length] = RadioLength;
                   var widths = 100 / Math.round((questionLength / 1));
                   $("#progressbarID").css("width", widths * (skipCount) + "%");
                   //skipCount = temp;
               });
                return false;
            });
        }

        next_AddClick();
        function next_RemoveClick() {
            superContainer.find('.next').unbind("click");
        }
        //上一题
        function prev_AddClick() {
            superContainer.find('.prev').click(function () {
                var RadioLength = parseInt($(this).parent().parent().find("#inputhide")[0].value);
                var index = skipPathArry.indexOf(parseInt(RadioLength));
                if (index >= 0) {
                    skipPathArry.splice(index, skipPathArry.length - index);
                }
                //for (var k = 0; k < skipPathArry.length; k++) {
                //    if (skipPathArry[k] == parseInt(RadioLength)) {
                //        skipPathArry.splice(k, 1);
                //        k--; 
                //    }
                //}
                notice.hide();
                next_RemoveClick();
                var skipCount = parseInt(skipPathArry[skipPathArry.length - 1]);
                var ent = $(this).parent().parent();
                ent.fadeOut(500, function () {
                    //$(this).prev().fadeIn(500, function () {
                    //    next_AddClick();
                    //});
                    $(this).parent().find("div[name=subject]").eq(parseInt(skipCount) - 1).fadeIn(500, function () {
                        next_AddClick();
                    });
                });
                $("#AllSubject").html(skipCount + "/" + questionLength);
                var widths = 100 / Math.round((questionLength / 1));
                $("#progressbarID").css("width", widths * skipCount + "%");
                return false;
            });
        }
        prev_AddClick();
        function prev_RemoveClick() {
            superContainer.find('.prev').unbind("click");
        }

        function add_zero(temp) {
            if (temp < 10) return "0" + temp;
            else return temp;
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
    };
})(jQuery);
