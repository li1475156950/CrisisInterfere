
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
        var ACOde = "";
        var allLength = config.questions.length;
        var AName = settings.questions.Amount_Guidance[1].AName;

        var superContainer = $(this),
        answers = [],
       introFob = '<div class="intro-container slide-container "> <div class="row"  style="text-align:center;padding-bottom:3%;"><h2 id="ANames">' + AName + '</h2></div><div><div class="row" style="margin-top:20px;margin-left:10px;"> <div class="col-md-2 col-sm-12 text-center" >指导语：</div><div class="col-md-9 col-sm-12"id="Guidance">' + settings.questions.Amount_Guidance[0].AGuidance + '</div> </div> <div class="row" style="margin-top:50px;margin-left:10px;">  <div class="col-md-2 col-sm-12 text-center"> 温馨提示：</div> <div class="col-md-9 col-sm-12">为保证结果的准确性，答题时以第一感觉作答，过程中尽量不要返回作答。</div></div> </div><a class="nav-start" style="text-align:center" href="#" ><button id="StartBtn" class="btn btn-lg" style="width:120px;height:40px;text-align:center;background-color:orange;color:white" ' + (FinishiLoad ? "" : "disabled='disabled'") + '>开始答题</button></a><div class="col-md-11 col-xs-7"><button class="btn btn-sm" style="float:right;text-align:center;margin-top:10px;cursor:pointer;width:57px;height:30px; border-color:RGB(66,139,203);color:white" onclick="tui()">返回</button></div></div>',
        //introFob += '<div class="col-md-10 col-sm-12"id="Guidance"></div> </div>	';

        //exitFob = '<div class="results-container slide-container"><div class="question-number">' + config.endText + '</div><div class="result-keeper"></div></div><div class="notice">请选择一个选项！</div><div class="progress-keeper" style="display: none;"><div class="progress"></div></div>',
        contentFob = '',
        questionsIteratorIndex,
        answersIteratorIndex;
        superContainer.addClass('main-quiz-holder');

        $("#AllLengths").val(allLength);
        //alert($("#AllLengths").val(allLength));
        for (questionsIteratorIndex = 0; questionsIteratorIndex < config.questions.length; questionsIteratorIndex++) {

            if (ACOde == "") {
                ACOde += config.questions[questionsIteratorIndex].OpCode[0];
            } else {
                ACOde += "," + config.questions[questionsIteratorIndex].OpCode[0];
            }
            var Qcontent = config.questions[questionsIteratorIndex].question
            if (Qcontent.indexOf("../../SubjectImages") >= 0) {
                contentFob += "<div class=\"slide-container\"><input  type=\"hidden\" id=\"inputhide\" value=" + (questionsIteratorIndex + 1) + "><div class=\"question\" data-id=" + config.questions[questionsIteratorIndex].OpCode[0] + ">" + (questionsIteratorIndex + 1) + "." + "<img src=\"" + config.questions[questionsIteratorIndex].question + "\"></div><ul class=\"answers\">";
            } else {
                contentFob += '<div class="slide-container"><input  type="hidden" id="inputhide" value=' + (questionsIteratorIndex + 1) + '><div class="question" data-id=' + config.questions[questionsIteratorIndex].OpCode[0] + '>' + config.questions[questionsIteratorIndex].question + '</div><ul class="answers">';
            }
            for (answersIteratorIndex = 0; answersIteratorIndex < config.questions[questionsIteratorIndex].answers.length; answersIteratorIndex++) {
                var AnswerConTent = config.questions[questionsIteratorIndex].answers[answersIteratorIndex];
                if (AnswerConTent.indexOf("../../SubjectImages") >= 0) {
                    contentFob += "<li><input type=\"radio\" data-name=" + config.questions[questionsIteratorIndex].Factions[answersIteratorIndex] + " value=" + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + " name=" + config.questions[questionsIteratorIndex].OpCode[answersIteratorIndex] + " data-id=" + config.questions[questionsIteratorIndex].IndexNum[answersIteratorIndex] + " id=" + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + ">" + config.questions[questionsIteratorIndex].IndexNum[answersIteratorIndex] + "." + "<img src=\"" + config.questions[questionsIteratorIndex].answers[answersIteratorIndex] + "\"></li>";
                }
                else {
                    contentFob += '<li><input type="radio" data-name=' + config.questions[questionsIteratorIndex].Factions[answersIteratorIndex] + ' value=' + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + ' name=' + config.questions[questionsIteratorIndex].OpCode[answersIteratorIndex] + ' data-id=' + config.questions[questionsIteratorIndex].IndexNum[answersIteratorIndex] + ' id=' + config.questions[questionsIteratorIndex].OptionCode[answersIteratorIndex] + '>' + config.questions[questionsIteratorIndex].IndexNum[answersIteratorIndex] + "." + config.questions[questionsIteratorIndex].answers[answersIteratorIndex] + '</li>';
                }
            }
            contentFob += '</ul><div class="nav-container">';
            if (questionsIteratorIndex !== 0) {
                contentFob += '<div class="prev"><a class="nav-previous" style="color:black" href="#"><i class="fa fa-reply"></i> 上一题</a></div>';
            }
            if (questionsIteratorIndex < config.questions.length - 1) {
                contentFob += '<div class="next"style=" display:none" ><a class="nav-next" href="#" >下一题 &gt;</a></div>';
            } else {
                contentFob += '<div class="final" style=" display:none"><button class="btn btn-lg"  id="Btn_Submit" style="width:100px;height:30px;border-color:orange;background-color:white;color:orange;text-align:center" onclick="return Submit()">提交</button></div>';
            }
            contentFob += '</div></div>';
            answers.push(config.questions[questionsIteratorIndex].correctAnswer);
        }
        //superContainer.html(introFob + contentFob + exitFob);
        superContainer.html(introFob + contentFob);
        //表格

        var rowCount = Math.ceil(config.questions.length / 10);
        ACOde = ACOde.split(',');
        ACOdelength = ACOde.length;
        var table = $("#tableid");
        var trm = -1;
        for (var i = 0; i < rowCount; i++) {
            var tr = $("<tr></tr>");
            tr.appendTo(table);

            for (var j = 1; j < 11; j++) {
                var td = "";
                trm++;
                if (ACOdelength > trm) {
                    td = $("<td style='width:104px;' id='" + ACOde["" + trm + ""] + "'  \">" + parseInt(trm + 1) + "." + "<span></span></td>");
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
            //if (thisLi.find('input:radio').hasClass('selected')) {
            //    thisLi.find('input:radio').removeClass('selected');
            //} else {
            var inputradio = "";
            thisLi.parents('.answers').children('li').removeClass('selected');
            thisLi.find('input:radio').attr("checked", 'checked');

            thisLi.find('input:radio').addClass('selected');
            //拼接table
            var RaodioID = $(this).parent().parent().find('.question').attr("data-id");
            //if (RaodioID != "")
            //{

            //    var  nummms += RaodioID ;
            //}
            //alert(nummms)
            //console.info(nummms)
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
                d1[this.name] = this.value

            });
            $.cookie('radioCookie', JSON.stringify(d1), { expires: 1 });
            $("#Score").val(trueCount);
            var QuIndexLength = $(this).parent().parent().find("#inputhide").val();


            if (QuIndexLength != allLength) {
                $("#state").val(1);
                $(this).parent().parent().find('.next').click();
            } else if (QuIndexLength == allLength) {
                $("#state").val(2);
                var widths = 100 / Math.round((questionLength / 1));
                $("#progressbarID").css("width", "100%");
                $(".final").show();
            }


            //}
        });

        superContainer.find('#StartBtn').unbind().bind("click", function () {
            var myDate = new Date();
            //var mytime = myDate.toLocaleString();
            var years = myDate.getFullYear();
            var month = add_zero(myDate.getMonth() + 1);
            var days = add_zero(myDate.getDate());
            var hours = add_zero(myDate.getHours());
            var minutes = add_zero(myDate.getMinutes());
            var seconds = add_zero(myDate.getSeconds());
            var ndate = years + "-" + month + "-" + days + " " + hours + ":" + minutes + ":" + seconds;

            $("#Startime").val(ndate);
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
                       ety.next().fadeIn(500);

                   }
                   $("#ANames").html(AName)
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

                    $("#ANames").html(AName)
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
        function next_AddClick() {
            superContainer.find('.next').click(function () {
                var RadioLength = parseInt($(this).parent().parent().find("#inputhide").val()) + 1;
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

                notice.hide();
                prev_RemoveClick();
                $(this).parents('.slide-container').fadeOut(500,
               function () {
                   $(this).next().fadeIn(500, function () {
                       prev_AddClick();
                   });
                   $("#AllSubject").html(RadioLength + "/" + questionLength);

               });
                var widths = 100 / Math.round((questionLength / 1));
                $("#progressbarID").css("width", widths * RadioLength + "%");
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
                var RadioLength = parseInt($(this).parent().parent().find("#inputhide").val() - 1);
                notice.hide();
                next_RemoveClick();
                $(this).parents('.slide-container').fadeOut(500,
                function () {
                    $(this).prev().fadeIn(500, function () {
                        next_AddClick();
                    });
                });
                $("#AllSubject").html(RadioLength + "/" + questionLength)
                var widths = 100 / Math.round((questionLength / 1));
                $("#progressbarID").css("width", widths * RadioLength + "%");
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
        //提交

    };
})(jQuery);
