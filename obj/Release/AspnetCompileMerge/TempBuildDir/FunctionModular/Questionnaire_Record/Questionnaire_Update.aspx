<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Questionnaire_Update.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.Questionnaire_Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="Questionnaire_Manage.aspx">问卷管理</a></li>
                <li><a href="#">问卷修改</a></li>
            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="col-md-12 col-sm-12">
                <%--                <table class="table" style="border: none; background-color: white;">
                    <tr>
                        <td style="padding: 0px; padding-top: 20px; border: none; text-align: left; width: 230px;">
                            <label style="float: left; font-size: 20px; font-weight: 200; color: #2a6496;">添加题目类型：</label>
                        </td>
                        <td style="padding: 0px; padding-top: 20px; border: none; text-align: left;">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <button type="button" onclick="SingleChoice()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                    单选题
                                </button>
                            </div>
                        </td>
                        <td style="padding: 0px; padding-top: 20px; border: none; text-align: left;">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <button type="button" onclick="MultipleChoice()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                    多选题
                                </button>
                            </div>
                        </td>
                        <td style="padding: 0px; padding-top: 20px; border: none; text-align: left;">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <button type="button" onclick="GapFilling()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                    填空题
                                </button>
                            </div>
                        </td>
                        <td style="padding: 0px; padding-top: 20px; border: none; text-align: left;">
                            <div class="col-md-2 col-sm-2 col-xs-2">
                                <button type="button" onclick="Beginner()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                    简答题
                                </button>
                            </div>
                        </td>
                    </tr>
                </table>--%>

                <div class="row" style="padding-left: 0px; padding-right: 0px; background-color: white;">
                    <div class="col-md-2 col-sm-12 col-xs-12">
                        <label style="float: left; font-size: 20px; font-weight: 200; color: #2a6496;">添加题目类型：</label>
                    </div>
                    <div class="col-md-5 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <button type="button" onclick="SingleChoice()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                单选题
                            </button>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <button type="button" onclick="MultipleChoice()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                多选题
                            </button>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <button type="button" onclick="GapFilling()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                填空题
                            </button>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-6">
                            <button type="button" onclick="Beginner()" onmouseover="mouseEnter(this)" onmouseout="mouseLeave(this)" class="btn btn-blues" style="float: left;">
                                简答题
                            </button>
                        </div>
                    </div>
                </div>

                <div id="profile">
                    <div class="col-md-12 col-sm-12" style="padding-top: 15px;">
                        <div class="row" id="ListQuestionPanel">
                            <div class="panel" style="border: solid 1px #d4d4d4">
                                <div class="row" style="text-align: center; margin-left: 0px; margin-right: 0px;">
                                    <input class="col-xs-12" type="text" id="QuestionnaireNameHtm" maxlength="128" style="background-color: #FAFAFA; border: solid 0px; font-size: 20px; text-align: center;" onblur="CheckIsNull()" onkeyup="CheckIsNull()" placeholder="--问卷标题--" />
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <textarea class="form-control" id="textarea_Guidance" maxlength="500" style="background-color: #FAFAFA; resize: none; border-right-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border: 0px 0px 1px 0px;" rows="3" placeholder="问卷说明"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row" style="text-align: center; margin-top: 20px;">
                            <a href="javascript:;" class="btn btn-sm" id="save_Ok" style="background-color: orange; color: white" onclick="return SaveSubjectSumit();">保存</a>
                            <a href="javascript:;" class="btn btn-sm btn-blues" id="cancel" style="color: white; margin-left: 10px;" onclick="return CancelSubjectSumit();">取消</a>
                        </div>
                    </div>

                    <div id="MaskLayer" onclick="HiddenMask()" class="modal" style="display: none; background-color: rgba(0, 0, 0, 0.5);">
                        <div class="modal-dialog">
                            <div class="modal-content" type="dialog" times="1" showtime="0" contype="string" id="MaskContent" style="width: auto;">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="HiddenMask()">×</button>
                                    <h4 class="modal-title text-center" style="color: #4CB1CF; font-size: 30px;" id="myModalLabel">逻辑跳转设置</h4>
                                </div>
                                <div class="modal-body row" id="MaskItems">
                                    <div class="col-xs-12 col-sm-12 col-md-12" name="MaskItem" id="MaskItem_1">
                                        <label style="float: left; font-weight: normal;">如果本题选中</label>
                                        <select style="float: left; margin-left: 10px;" class="col-xs-12 col-sm-3 col-md-3" name="checkedName" id="checked_1">
                                        </select>
                                        <label style="float: left; margin-left: 10px;">则显示</label>
                                        <select style="float: left; margin-left: 10px;" class="col-xs-12 col-sm-3 col-md-3" name="showName" id="show_1"></select>
                                        <div style="float: left; margin-left: 10px;">
                                            <label><a class="glyphicon glyphicon-plus" style="cursor: pointer;" onclick="addMask()"></a></label>
                                            <label><a class="glyphicon glyphicon-minus" style="cursor: pointer;" onclick="deleteMask('MaskItem_1')"></a></label>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer text-center">
                                    <button id="saveMask" class="btn btn-sm" style="background-color: orange; color: white">保存</button>
                                    <button id="cancelMask" class="btn btn-sm btn-blues" style="color: white; margin-left: 10px;" onclick="HiddenMask()">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>

        var navName = "/FunctionModular/Questionnaire_Record/Questionnaire_Manage.aspx";
        /*--------获取URL中的参数-------*/
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        var urlCode = GetQueryString("code");//传过来的问卷编码
        var Q_State = GetQueryString("state");//传过来的问卷状态。是否已分配
        var QuestionnaireCode = "";//操作的问卷编码
        var subjectListJson = "";//界面上所有的题目JSon
        var GetSubjectAllJson = "";//批量保存获取
        var singleChoice = "单选题";
        var multipleChoice = "多选题";
        var gapFilling = "填空题";
        var beginner = "简答题";

        var nowProCode = "";//当前点击的题干编码

        OnloadSubjectInfo(urlCode);

        CheckIsNull();
        //如果没有输入问卷名称则将保存按钮置灰
        function CheckIsNull() {
            if ($("#QuestionnaireNameHtm").val() == "")
                $("#save_Ok").attr("disabled", "disabled");
            else
                $("#save_Ok").removeAttr("disabled");
        }

        function OnloadSubjectInfo(code) {
            $.ajax({
                type: "POST",
                url: "Ajax/Questionnaire_Manage.ashx?operationType=update",
                data: { quesCode: code },
                success: function (msg) {
                    if (msg != "") {
                        var temp = msg.length;
                        subjectListJson = msg.substring(1, temp - 1);
                        if (subjectListJson != "") {

                            var jsonListArr = eval("[" + subjectListJson + "]");

                            QuestionnaireCode = jsonListArr[0].TG_Info.QuestionCode;
                            $("#QuestionnaireNameHtm").val(jsonListArr[0].TG_Info.Name);
                            $("#textarea_Guidance").val(jsonListArr[0].TG_Info.Instruction);
                            CheckIsNull();//在给问卷名称赋值之后检查一下是否为空，否则启用保存按钮

                            if (jsonListArr != null && jsonListArr.length > 0) {

                                for (var i = 0; i < jsonListArr.length; i++) {

                                    var content = jsonListArr[i].TG_Info.TG_Content;
                                    if (jsonListArr[i].TG_Info.TG_Type == 2)
                                        content = content.replace(/@____;/g, "____");
                                    UpdateDrawQuestion(jsonListArr[i].TG_Info.TG_Sort, jsonListArr[i].TG_Info.TG_Type, content,
                                        jsonListArr[i].TZ_Info, jsonListArr[i].TG_Info.TG_Code, jsonListArr[i].TG_Info.TG_Sort,
                                        jsonListArr[i].TG_Info.TG_TrueAnswer, jsonListArr[i].TG_Info.TG_Score);
                                }
                            }
                        }

                    } else {

                        return;
                    }
                }
            });
        }

        //鼠标经过事件
        function mouseEnter(data) {
            $(data).css({ "color": "white", "background-color": "#428BCA" });
        }
        function mouseLeave(data) {
            $(data).css({ "color": "#428BCA", "background-color": "white" });
        }

        function SingelAndMore(type) {
            var qpArr = $('div[name=QuestionPanel]');
            var questionCount = qpArr.length;
            var index = parseInt(questionCount) + 1;
            var tSort = "";
            for (var p = 0; p < questionCount; p++) {
                if (tSort != "") {
                    tSort += "," + qpArr[p].id.split('_')[1];
                } else {
                    tSort += qpArr[p].id.split('_')[1];
                }
            }
            index = GetTT_S(index, tSort);
            DrawQuestion(index, type, "");//动态创建题目
            var quc = parseInt(questionCount) + 1;
            GetSubjectAllJson += quc + ",";
        }
        //单选题按钮
        function SingleChoice() {
            SingelAndMore(singleChoice);
        }
        //多选题按钮
        function MultipleChoice() {
            SingelAndMore(multipleChoice);
        }
        //填空题按钮
        function GapFilling() {
            SingelAndMore(gapFilling);
        }
        //简答题按钮
        function Beginner() {
            SingelAndMore(beginner);
        }
        //添加新题
        function DrawQuestion(index, type, tgCode) {
            var last = getLastSort();
            if (last == 0)
                last = index;

            var pTitle = '<div class="panel-heading"><h4 class="panel-title row">';
            pTitle += '<div class="col-md-9 col-sm-12 col-xs-12" style="padding-right: 0px; padding-bottom: 10px; margin-top: 10px;">';
            pTitle += '<a data-toggle="collapse" data-parent="#accordion" id="Question_' + index + '" href="#Content_' + index + '" aria-expanded="true" aria-controls="collapseOne" style="word-break:break-all;"><label name="TH" id="TH_' + index + '" style="color:#2a6496;font-size:16px;">' + last + '</label>.' + type + '</a></div>';
            pTitle += '<div class="col-md-3 col-sm-12 col-xs-12" style="padding-left: 0px; margin-top: 10px;">';

            if (type == singleChoice)
                pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_LogicJump_' + index + '" onclick="return LogicJump(\'' + index + '\');">[逻辑跳转]</a></label>';

            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_deloperation_' + index + '" onclick="return Del_Operation(\'' + index + '\',\'' + tgCode + '\');">[删除本题]</a></label>';
            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_copyoperation_' + index + '" style="color: #999" disabled="disabled">[复制本题]</a></label>';
            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_operation_' + index + '" value="1" name="Btn_operation" onclick="return Btn_Operation(\'' + index + '\',\'' + type + '\',\'' + tgCode + '\');">[保存]</a></label>';
            pTitle += '</div></h4></div>';
            ;

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var pBody = ""
            + "    <div id=\"Body_" + index + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var pContent = ""
            + "<div id=\"Content_" + index + "\" class=\"panel-collapse in\">"
            + pBody
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var shellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + index + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + pTitle + pContent + " </div></div></div>";
            $("#ListQuestionPanel").append(shellHtml);
            var stemTitle = "";
            switch (type) {
                case singleChoice:
                    stemTitle = GetQuestionContent(index); //给题目外壳的标题赋值
                    break;
                case multipleChoice:
                    stemTitle = GetQuestionContent_More(index);
                    break;
                case gapFilling:
                    stemTitle = GetQuestionContent_TK(index);
                    break;
                case beginner:
                    stemTitle = GetQuestionContent_JD(index);
                    break;
            }

            $("#Body_" + index).append(stemTitle);
            var problemContent = "";
            switch (type) {
                case singleChoice:
                    problemContent = GetProblemContent(index, index, type);//获取题支内容
                    break;
                case multipleChoice:
                    problemContent = GetProblemContent_More(index, index, type, "");//获取题支内容
                    break;
                case gapFilling:
                    problemContent = GetProblemContent_TK(index, index, type);//获取题支内容
                    break;
                case beginner:
                    problemContent = GetProblemContent_TK(index, index, type);//获取题支内容
                    break;
            }
            $("#Body_" + index).append(problemContent);
        }

        /*--生成题干、题支的显示--*/
        function UpdateDrawQuestion(index, type, content, tzInfo, tgCode, tzIndex, trueAnwser, proScore) {
            var temp = "<label style=\"color:orange;\" >(计分:" + proScore + "分)</label>";
            if (proScore == "" || type != 1)
                temp = "";

            var pTitle = '<div class="panel-heading"><h4 class="panel-title row">';
            pTitle += '<div class="col-md-9 col-sm-12 col-xs-12" style="padding-right: 0px; padding-bottom: 10px; margin-top: 10px;">';
            pTitle += '<a data-toggle="collapse" data-parent="#accordion" id="Question_' + index + '" href="#Content_' + index + '" aria-expanded="true" aria-controls="collapseOne" style="word-break:break-all;">第<span name="THSort" id="THSort_' + index + '">' + tzIndex + '</span>题   ==>' + content + temp + '</a></div>';
            pTitle += '<div class="col-md-3 col-sm-12 col-xs-12" style="padding-left: 0px; margin-top: 10px;">';

            if (GetProType(type) == singleChoice)
                pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_LogicJump_' + index + '" style=\"color:#999;\" disabled=\"disabled\">[逻辑跳转]</a></label>';

            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_deloperation_' + index + '" onclick="return Del_Operation(\'' + index + '\',\'' + tgCode + '\');">[删除本题]</a></label>';
            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_copyoperation_' + index + '" onclick="CopyAddQuestion(\'' + index + '\',\'' + GetProType(type) + '\',\'' + tgCode + '\');">[复制本题]</a></label>';
            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_operation_' + index + '" value="1" name="Btn_operation" onclick="return Btn_Operation(\'' + index + '\',\'' + GetProType(type) + '\',\'' + tgCode + '\');">[修改]</a></label>';
            pTitle += '</div></h4></div>';
            ;

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var pBody = ""
            + "    <div id=\"Body_" + index + "\" class=\"panel-body\">"
            + "    </div>";
            /*P_Content 题干模块内容体*/
            var pContent = ""
                + "<div id=\"Content_" + index + "\" class=\"panel-collapse in\">"
                + pBody
                + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var shellHtml = "";
            shellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + index + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + pTitle + pContent + " </div></div></div>";
            $("#ListQuestionPanel").append(shellHtml);

            if (GetProType(type) != singleChoice && GetProType(type) != multipleChoice)
                $("#Content_" + index).css("display", "none");

            if (GetProType(type) == singleChoice || GetProType(type) == multipleChoice) {
                if (tzInfo != null && tzInfo.length > 0) {
                    for (var i = 0; i < tzInfo.length; i++) {
                        var problemContent = "";
                        switch (GetProType(type)) {
                            case singleChoice:
                                problemContent = ShowProblemContent(index, (i + 1), tzInfo[i].SerialNumber, tzInfo[i].TZ_Content, tzInfo[i].TZ_Skip, tzInfo[i].TZ_Score); //获取题支内容
                                break;
                            case multipleChoice:
                                problemContent = ShowProblemContent_More(index, i, tzInfo[i].SerialNumber, tzInfo[i].TZ_Content); //获取题支内容
                                break;
                            case gapFilling:
                                problemContent = ShowProblemContent_TK(); //获取题支内容
                                break;
                            case beginner:
                                problemContent = ShowProblemContent_TK(); //获取题支内容
                                break;
                        }
                        $("#Body_" + index).append(problemContent);

                    }

                    //如果题干中有多选题，则根据设置的正确答案，设置样式
                    if (GetProType(type) == multipleChoice && trueAnwser != "") {
                        TrueChoose(parseInt(index), tgCode, 0);
                    }
                }
            }
        }
        /*---------绘画单选题支内容------------------*/
        function GetProblemContent(tFaw, tFawCon, type, skip) {
            var tzCon = $("input[name='TZ_Code_" + tFaw + "']").length;
            skip = skip == "0" ? "" : "data-jump=\"" + skip + "\"";
            var problemContent = ""
            + "<div class=\"row\" style=\"padding-top: 5px;\" id=\"row_" + tFaw + "_" + tzCon + "\">"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\" style=\"margin-bottom: 15px;\">"
            + "        <input class=\"form-control\" maxlength=\"500\"  name=\"TZ_Code_" + tFaw + "\" " + skip + " id=\"TZ_Code_" + tFaw + "_" + tzCon + "\" style=\"height: 34px;\" placeholder=\"编号\" />"
            + "    </div>"
            + "    <div class=\"col-md-9 col-xs-12 col-sm-9\">"
            + "        <div class=\"form-group input-group col-md-12 col-sm-12 col-xs-12\">"
            + "            <input type=\"text\" class=\"form-control\" maxlength=\"500\" name=\"TZ_Con_" + tFaw + "\" id=\"TZ_Con_" + tFaw + "_" + tzCon + "\" style=\"height: 34px;\" placeholder=\"选项内容\" />"
            //+ "            <span class=\"input-group-btn\">"
            //+ "                <button class=\"btn btn-default\" type=\"button\">"
            //+ "                    <i class=\"fa fa-file-image-o\"></i>"
            //+ "                </button>"
            //+ "            </span>"
            + "        </div>"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <input onkeyup=\"onlyNumber(this)\"  onblur=\"onlyNumber(this)\" class=\"form-control\" name=\"TZ_Fra_" + tFaw + "\" id=\"TZ_Fra_" + tFaw + "_" + parseInt(tzCon) + "\" style=\"height: 34px;\" placeholder=\"分值\" />"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\" onclick=\"return addopt('" + tFaw + "_" + tzCon + "','" + type + "');\"  style=\"float: right\">"
            + "                <i class=\"fa fa-plus\" style=\"color: green;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\"  onclick=\"return delopt('" + tFaw + "_" + tzCon + "','" + type + "');\" style=\"float: right\">"
            + "                <i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "    </div>"
            + "</div>";
            return problemContent;
        }
        /*---------绘画多选题支内容------------------*/
        function GetProblemContent_More(tFaw, tFawCon, type, boo) {
            var tzCon = $("input[name='TZ_Code_" + tFaw + "']").length;
            var problemContent = ''
                + '<div class="row" style="padding-top: 5px;" id="row_' + tFaw + '_' + tzCon + '">'
                + '<div class="col-md-1 col-xs-12 col-sm-1" style="margin-bottom: 15px;">'
                + '<input class="form-control" maxlength="500" name="TZ_Code_' + tFaw + '" id="TZ_Code_' + tFaw + '_' + tzCon + '" style="height: 34px;" placeholder="编号">'
                + '</div>'
                + '<div class="col-md-9 col-xs-12 col-sm-9">'
                + '<div class="form-group input-group col-md-12 col-sm-12 col-xs-12">'
                + '<input type="text" class="form-control" maxlength="500" name="TZ_Con_' + tFaw + '" id="TZ_Con_' + tFaw + '_' + tzCon + '" style="height: 34px;" placeholder="选项内容">'
                //+ '<span class="input-group-btn">'
                //+ '<button class="btn btn-default" type="button">'
                //+ '<i class="fa fa-file-image-o"></i>'
                //+ '</button>'
                //+ '</span>'
                + ' </div></div>'
                + '<div class="col-md-1 col-xs-12 col-sm-1 text-center">';
            if (boo != "") {
                var span = '';
                if (boo)
                    span = '<label style="color:orange;" name="trueChoose" id="trueChoose_' + tFaw + '_' + tzCon + '">(正确答案)</label>';

                problemContent += '<input type="checkbox" checked="' + boo + '" name="TZ_CheckBox_' + tFaw + '_' + tzCon + '" id="TZ_CheckBox_' + tFaw + '_' + tzCon + '"/>';
            } else
                problemContent += '<input type="checkbox" name="TZ_CheckBox_' + tFaw + '_' + tzCon + '" id="TZ_CheckBox_' + tFaw + '_' + tzCon + '"/>';

            problemContent += '<input type="hidden" name="TZ_Fra_' + tFaw + '" value="0">'
                + '</div>'
                + '<div class="col-md-1 col-xs-12 col-sm-1">'
                + '<div class="col-md-6">'
                + '<button class="btn btn-default-zblb" type="button" onclick="return addopt(\'' + tFaw + '_' + tzCon + '\',\'' + type + '\');" style="float: right">'
                + '<i class="fa fa-plus" style="color: green;" aria-hidden="true"></i>'
                + '</button>'
                + '</div>'
                + '<div class="col-md-6">'
                + '<button class="btn btn-default-zblb" type="button" onclick="return delopt(\'' + tFaw + '_' + tzCon + '\',\'' + type + '\');" style="float: right">'
                + '<i class="fa fa-times" style="color: red;" aria-hidden="true"></i>'
                + '</button>'
                + '</div>'
                + '</div>'
            ;
            return problemContent;
        }
        /*---------绘画填空题支内容------------------*/
        function GetProblemContent_TK() {
            /*--填空题没有题支--*/
        }
        ///*根据json展现当前题干的题支部分[绘画题支内容]------单选题*/
        function ShowProblemContent(tFaw, tFawCon, num, option, skip, score) {

            var problemContent = ""
                + "<div class=\"row\" >"
                + "<div class=\"col-md-12 col-xs-12 col-sm-12\" >"
                + "<div class=\"radio\">"
                + "<label>";
            var showScore = "<label style=\"color:orange\">[计分:" + score + "]</label>&nbsp;&nbsp;&nbsp;&nbsp;";
            if (score == "")
                showScore = "";
            if (skip != undefined && skip != "undefined" && skip != "")
                problemContent += "<input type=\"radio\" disabled='disabled' name=\"options_" + tFaw + "\" data-jump=\"" + skip + "\" id=\"options_" + tFaw + "_" + tFawCon + "\" >" + num + "、" + showScore + option;
            else
                problemContent += "<input type=\"radio\" disabled='disabled' name=\"options_" + tFaw + "\" id=\"options_" + tFaw + "_" + tFawCon + "\" >" + num + "、" + showScore + option;
            problemContent += "</label>";
            problemContent += "</div>";
            problemContent += "</div>";
            problemContent += "</div>";
            return problemContent;
        }
        ///*根据json展现当前题干的题支部分[绘画题支内容]------多选题*/
        function ShowProblemContent_More(tFaw, tFawCon, num, option) {
            var problemContent = ""
            + "<div class=\"row\" >"
            + "    <div class=\"col-md-12 col-xs-12 col-sm-12\" >"
            + "            <div class=\"checkbox\">"
            + "                 <label>"
            + "                       <input type=\"checkbox\" disabled='disabled' name=\"options_" + tFaw + "\" id=\"options_" + tFaw + "_" + tFawCon + "\" >" + num + "、 " + option
            + "                 </label>"
            + "                  <label style='color:orange;' name='trueChoose' id='trueChoose_" + tFaw + "_" + tFawCon + "'></label>"
            + "           </div>"
            + "    </div>"
            + "</div>";
            return problemContent;
        }
        ///*根据json展现当前题干的题支部分[绘画题支内容]------填空题*/
        function ShowProblemContent_TK() {
            /*--没有题支--*/
        }
        /*----------绘画单选题题干标题-------------------*/
        function GetQuestionContent(tFaw) {
            var stemTitle = ""
                + "<div class=\"row\" id=\"Prot_F_" + tFaw + "\"> "
                + "    <div class=\"col-md-12\">"
                + "        <div class=\"form-group input-group col-md-12 col-sm-12 col-xs-12\">"
                + "            <input type=\"text\" class=\"form-control\" maxlength=\"500\" id=\"Prot_" + tFaw + "\" placeholder=\"请填写题目标题\" />"
                + "             <input type='hidden' value='0' id='Fra_Sub_" + tFaw + "'/>"
                //+ "            <span class=\"input-group-btn\">"
                //+ "                <button class=\"btn btn-default\" type=\"button\">"
                //+ "                    <i class=\"fa fa-file-image-o\"></i>"
                //+ "                </button>"
                //+ "            </span>"
                + "        </div>"
                + "    </div>"
                + "</div>";
            return stemTitle;
        }
        /*----------绘画多选题题干标题-------------------*/
        function GetQuestionContent_More(tFaw) {
            var stemTitle = ''
                + '<div class="row" id="Prot_F_' + tFaw + '">'
                + '<div class="col-md-8 col-xs-12 col-sm-8">'
                + '<input type="text" class="form-control" maxlength="500" id="Prot_' + tFaw + '" placeholder="请填写题目标题" />'
                + '</div>'
                + '<div class="col-md-2 col-xs-12 col-sm-2" style="padding-left: 0px;">'
                + '<input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" name="Fra_Sub_' + tFaw + '" id="Fra_Sub_' + tFaw + '" style="height: 34px;" placeholder="选项计分" />'
                + '</div>'
                + '<div class="col-md-1 col-xs-12 col-sm-1 text-center">'
                + '<label>正确答案:</label>'
                + '</div>';
            return stemTitle;
        }
        /*----------绘画填空题题干标题-------------------*/
        function GetQuestionContent_TK(tFaw) {
            var stemTitle = '  '
                + ' <div class="row" id="Prot_F_' + tFaw + '">'
                + '     <div class="col-md-10 col-xs-12 col-sm-10">'
                + '         <input type="text" class="form-control" maxlength="500" id="Prot_' + tFaw + '" placeholder="请填写题目标题">'
                + '     </div>'
                + '     <div class="col-md-2 col-xs-12 col-sm-2 text-center" style="cursor: pointer;" onclick="AddVacancy(\'Prot_' + tFaw + '\')">'
                + '         <a>(空缺部分请用"@____"来表示)</a>'
                + '     </div>'
                + '</div>';
            return stemTitle;
        }
        /*----------绘画简答题题干标题-------------------*/
        function GetQuestionContent_JD(tFaw) {
            var stemTitle = '  '
                + ' <div class="row" id="Prot_F_' + tFaw + '">'
                + '     <div class="col-md-10 col-xs-12 col-sm-10">'
                + '         <textarea class="form-control" maxlength="500" id="Prot_' + tFaw + '" row="3" placeholder="请填写题目标题"></textarea>'
                + '     </div>'
                + '</div>';
            return stemTitle;
        }

        /*-----根据按钮状态来区分具体调用哪个方法-----*/
        function Btn_Operation(tFaw, type, tgCode) {
            if (tgCode == "")
                tgCode = QuestionnaireCode + "_TG_" + tFaw;
            nowProCode = tgCode;

            var btnT = $("#Btn_operation_" + tFaw).html();
            if (btnT == "[保存]") {

                if (SaveQuestion(tFaw, type, nowProCode) == false)
                    return;//确定题目
                $("#Btn_copyoperation_" + tFaw).attr("onclick", "CopyAddQuestion('" + tFaw + "','" + type + "','" + tgCode + "');");
                $("#Btn_copyoperation_" + tFaw).removeAttr("style");
                $("#Btn_copyoperation_" + tFaw).removeAttr("disabled");
                if (type == singleChoice) {
                    $("#Btn_LogicJump_" + tFaw).removeAttr("onclick");
                    $("#Btn_LogicJump_" + tFaw).css("color", "#999");
                }
            } else {
                UpdateQuestion(tFaw, type, nowProCode);//修改题目
                if (type == singleChoice) {
                    $("#Btn_LogicJump_" + tFaw).attr("onclick", "return LogicJump('" + tFaw + "');");
                    $("#Btn_LogicJump_" + tFaw).css("color", "#428bca");
                }
            }
        }
        ///*----------题干临时存储信息[确定]--------------*/
        function SaveQuestion(tFaw, type, tgCode) {

            var checkBoxIsCheck = false;//如果是多选题进行保存时，判断是否至少设置了一个正确答案
            if (type == multipleChoice) {
                $("[name=TZ_Fra_" + tFaw + "]").each(function () {
                    if ($(this).prev()[0].checked == true) {
                        checkBoxIsCheck = true;
                        return false;
                    }
                });
                if (checkBoxIsCheck == false) {
                    layer.msg('请至少设置一个正确答案！', {
                        time: 2000, //2s后自动关闭
                        btn: ['知道了']
                    });
                    return false;
                }
            }

            var result = 0;
            var results = 0;
            var proTitle = $("#Prot_" + tFaw).val();//获取题干标题
            var proSort = $("#TH_" + tFaw).text();//获取题干序号
            var proScore = "";
            if ($("#Fra_Sub_" + tFaw) != "undefined" && $("#Fra_Sub_" + tFaw) != undefined) {
                if ($("#Fra_Sub_" + tFaw).val() == "" || $("#Fra_Sub_" + tFaw).val() == undefined)
                    proScore = "";
                else
                    proScore = $("#Fra_Sub_" + tFaw).val();
            }
            else
                proScore = "";
            var proTrueAnswer = "";//用于多选题的被勾选的正确答案的题支编号
            //题干类型,0：单选；1：多选；2：填空；3：简单
            var proType = 0;
            switch (type) {
                case singleChoice:
                    proType = 0;
                    break;
                case multipleChoice:
                    proType = 1;
                    break;
                case gapFilling:
                    proType = 2;
                    break;
                case beginner:
                    proType = 3;
                    break;
            }

            if (proSort == "" || proSort.replace(/\ /g, "") == "" || proSort.length == 0) {
                layer.msg('题号不能为空！', {
                    time: 2000, //2s后自动关闭
                    btn: ['知道了']
                });
                return false;
            }

            if (proTitle == "" || proTitle.replace(/\ /g, "") == "" || proTitle.length == 0) {
                var sort = $("#TH_" + tFaw).text();
                layer.alert('请将题目内容填写完整!', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0,
                    yes: function () {
                        $("#Prot_" + tFaw).focus();
                        layer.closeAll();
                    }
                });
                return false;
            }
                //如果是填空题，则判断是否至少有一个填空
            else if (type == gapFilling) {
                var text = $("#Prot_" + tFaw).val();
                if (text.indexOf("@____;") < 0) {
                    layer.msg('请至少设置一个填空！', {
                        time: 2000, //2s后自动关闭
                        btn: ['知道了']
                    });
                    return false;
                }
            }
            var tzCode = "";//题支的序号
            var tzContent = "";//题支的内容
            var tzScore = "null";//题支的分值
            var tzSkip = "";//题支的逻辑跳转

            var tzContentJSon = "";//保存题干内容的JSon
            //检查题支的内容是否为空
            if ($('input[name=TZ_Con_' + tFaw + ']') != "undefined")
                $('input[name=TZ_Con_' + tFaw + ']').each(function () {
                    if ($(this).val() == "" || $(this).val().replace(/\ /g, "") == "" || $(this).val().length == 0) {
                        layer.alert('选项内容不能为空!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                layer.closeAll();
                                tzContent = "";
                            }
                        });
                        result++;
                        return result;
                    } else {
                        if (tzContent != "")
                            tzContent += "," + $(this).val();
                        else
                            tzContent += $(this).val();
                        results++;
                        return result;
                    }
                });
            //检查题支的编号是否为空
            if ($('input[name=TZ_Code_' + tFaw + ']') != "undefined")
                $('input[name=TZ_Code_' + tFaw + ']').each(function () {
                    if ($(this).val() == "" || $(this).val().replace(/\ /g, "") == "" || $(this).val().length == 0) {
                        layer.alert('题支编号不能为空!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                layer.closeAll();
                                tzCode = "";
                            }
                        });
                        result++;
                        return result;
                    } else {
                        if (tzCode != "")
                            tzCode += "," + $(this).val();
                        else
                            tzCode += $(this).val();
                        if ($(this).attr("data-jump") != undefined && $(this).attr("data-jump") != "undefined") {
                            if (tzSkip != "")
                                tzSkip += "," + $(this).attr("data-jump");
                            else
                                tzSkip = $(this).attr("data-jump");
                        } else {
                            if (tzSkip != "")
                                tzSkip += "," + "0";
                            else
                                tzSkip = "0";
                        }
                        results++;
                        return result;
                    }
                });
            //检查题支的分值
            if ($('input[name=TZ_Fra_' + tFaw + ']') != "undefined")
                $('input[name=TZ_Fra_' + tFaw + ']').each(function () {

                    var score = "";//如果有的分值框内为空，则设置为0
                    //if ($(this).val() != "")
                    score = $(this).val();

                    if (tzScore != "null")
                        tzScore += "," + score;
                    else
                        tzScore = score;
                    results++;
                    return result;
                });
            if (tzScore == "null")
                tzScore = "";
            //获取多选题被选中的正确答案的题支序号
            $("#Body_" + tFaw).find("input[type=checkbox]").each(function () {
                if ($(this)[0].checked) {
                    var check = "";
                    check = $(this).attr("name");
                    check = check.split('_');
                    check = check[check.length - 1];//获取题支的序号。0代表第一个
                    if (proTrueAnswer != "")
                        proTrueAnswer += "," + check;
                    else
                        proTrueAnswer += check;
                }
                results++;
                return result;
            });

            if (type != singleChoice && type != multipleChoice) {
                result = 0;
                results = 1;
            }
            if ((results > 0 && result <= 0)) {

                if (type == singleChoice) {
                    $("#Question_" + tFaw).html("第<span name='THSort' id='THSort_" + tFaw + "'>" + proSort + "</span>题   ==>" + proTitle);
                }
                else if (type == multipleChoice) {
                    var temp = "<label style=\"color:orange;\" >(计分:" + proScore + "分)</label>";
                    if (proScore == "")
                        temp = "";
                    $("#Question_" + tFaw).html("第<span name='THSort' id='THSort_" + tFaw + "'>" + proSort + "</span>题   ==>" + proTitle
                        + temp);
                }
                else {

                    var proTitleTemp = proTitle.replace(/@____;/g, "____");//替换字符串中所有的指定字符                    
                    $("#Question_" + tFaw).html("第<span name='THSort' id='THSort_" + tFaw + "'>" + proSort + "</span>题   ==>" + proTitleTemp);
                    $("#Body_" + tFaw).empty();//清空题干和题支部分                    
                }
                // if (tzCode != "") {
                var tzCount = 0; //题支的数量

                var tzCodeArry = tzCode.split(','); //得到题支编号的数组
                var tzContentArry = tzContent.split(','); //得到题支内容的数组
                var tzScoreArry = tzScore.split(','); //得到题支分值的数组
                var tzSkipArry = tzSkip.split(','); //得到题支跳转逻辑的数组

                tzCount = tzCodeArry.length; //得到题支数量
                var tzContent = ""; //临时保存题支内容JSon
                var contentHtml = "";

                //QuestionnaireCode.replace(/\s/g, "").replace(/\"/g, "\"") + "_TG_" + tFaw 

                tzContentJSon = "{"
                    + "\"TG_Info\":{"
                    + "\"TG_Code\":\"" + nowProCode + "\","
                    + "\"TG_Content\":\"" + proTitle.replace(/\s/g, "").replace(/\"/g, "\"") + "\","
                    + "\"TG_Sort\":\"" + proSort + "\","
                    + "\"TG_Score\":\"" + proScore + "\","
                    + "\"TG_TrueAnswer\":\"" + proTrueAnswer + "\","
                    + "\"TG_Type\":\"" + proType + "\""
                    + "},"
                    + "\"TZ_Info\":[";

                // nowProCode = QuestionnaireCode.replace(/\s/g, "").replace(/\"/g, "\"") + "_TG_" + tFaw;
                $("#Btn_operation_" + tFaw).attr("onclick", "Btn_Operation('" + tFaw + "','" + type + "','" + nowProCode + "')");

                var str = "";
                for (var i = 0; i < tzCount; i++) {
                    if (tzContent != "")
                        str = " , ";
                    else
                        str = " ";
                    //\"TZ_Num\":\"" + tzCodeArry[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",
                    //if (tzScoreArry[i] == "")
                    //    tzScoreArry[i] = "0";
                    tzContent += str + "{\"TZ_Code\":\"" + tzCodeArry[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Num\":\"" + (i) + "\",\"TZ_Content\":\"" + tzContentArry[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Score\":\"" + tzScoreArry[i] + "\",\"TZ_Skip\":\"" + tzSkipArry[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"SerialNumber\":\"" + tzCodeArry[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";

                    switch (type) {
                        case singleChoice:
                            contentHtml += ShowProblemContent(tFaw, i, tzCodeArry[i], tzContentArry[i], tzSkipArry[i], tzScoreArry[i]); //绘制题目静态内容
                            break;
                        case multipleChoice:
                            contentHtml += ShowProblemContent_More(tFaw, i, tzCodeArry[i], tzContentArry[i]); //绘制题目静态内容
                            break;
                        case gapFilling, beginner:
                            //contentHtml += ShowProblemContent_TK(tFaw, i, tzCodeArry[i], tzContentArry[i]);//绘制题目静态内容
                            contentHtml += " ";
                            break;
                    }
                }
                tzContentJSon += tzContent;
                tzContentJSon += "]";
                tzContentJSon += "}";
                var skipStatic = new Array();//设置静态界面上的单选选项的data-jump属性值(逻辑跳转)
                if (subjectListJson != "") {
                    if (tgCode == "")
                        tgCode = QuestionnaireCode + "_TG_" + tFaw;
                    if (subjectListJson.indexOf(tgCode) >= 0) {

                        var jsonList = eval("[" + subjectListJson + "]");
                        if (jsonList != null && jsonList.length > 0) {
                            subjectListJson = "";
                            for (var t = 0; t < jsonList.length; t++) {
                                if (tgCode != jsonList[t].TG_Info.TG_Code) {
                                    if (subjectListJson != "") {
                                        subjectListJson += ",";
                                    }
                                    subjectListJson += "{"
                                        + "\"TG_Info\":{"
                                        + "\"TG_Code\":\"" + jsonList[t].TG_Info.TG_Code + "\","
                                        + "\"TG_Content\":\"" + jsonList[t].TG_Info.TG_Content + "\","
                                        + "\"TG_Sort\":\"" + jsonList[t].TG_Info.TG_Sort + "\","
                                        + "\"TG_Score\":\"" + jsonList[t].TG_Info.TG_Score + "\","
                                        + "\"TG_TrueAnswer\":\"" + jsonList[t].TG_Info.TG_TrueAnswer + "\","
                                        + "\"TG_Type\":\"" + jsonList[t].TG_Info.TG_Type + "\""
                                        + "},"
                                        + "\"TZ_Info\":[";

                                    var tzContentJson2 = "";
                                    if (jsonList[t].TZ_Info != null && jsonList[t].TZ_Info.length > 0) {
                                        var str = "";
                                        for (var i = 0; i < jsonList[t].TZ_Info.length; i++) {
                                            if (tzContentJson2 != "")
                                                str = " , ";
                                            else
                                                str = " ";
                                            tzContentJson2 += str + "{\"TZ_Code\":\"" + jsonList[t].TZ_Info[i].TZ_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Num\":\"" + jsonList[t].TZ_Info[i].TZ_Num + "\",\"TZ_Content\":\"" + jsonList[t].TZ_Info[i].TZ_Content.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Score\":\"" + jsonList[t].TZ_Info[i].TZ_Score + "\",\"TZ_Skip\":\"" + jsonList[t].TZ_Info[i].TZ_Skip + "\",\"SerialNumber\":\"" + jsonList[t].TZ_Info[i].SerialNumber + "\"}";

                                            //保存设置过得跳转方向和题支内容，用于设置静态界面上的对应题支的属性值
                                            skipStatic[skipStatic.length] = jsonList[t].TZ_Info[i].TZ_Num + "," + tzSkipArry[i];
                                        }
                                    }

                                    subjectListJson += tzContentJson2;
                                    subjectListJson += "        ]";
                                    subjectListJson += "    }";

                                } else {
                                    if (subjectListJson != "") {
                                        subjectListJson += "," + tzContentJSon;
                                    } else {
                                        subjectListJson += tzContentJSon;
                                    }
                                }
                            }
                        }
                    } else {
                        subjectListJson += "," + tzContentJSon;
                    }
                } else {
                    tgCode = QuestionnaireCode + "_TG_" + tFaw;
                    subjectListJson += tzContentJSon;
                }
                $("#Body_" + tFaw).html(contentHtml);
                $("#Btn_operation_" + tFaw).html("[修改]");

                if (type == singleChoice) {
                    for (var i = 0; i < skipStatic.length; i++) {
                        var skip = skipStatic[i].split(",");
                        if (skip.indexOf("undefined") <= 0 && skip[1] != '0')
                            $("#options_" + tFaw + "_" + skip[0]).attr("data-jump", skip[1]);
                    }
                }

                if (type != singleChoice && type != multipleChoice)
                    $("#Content_" + tFaw).css("display", "none");

                TrueChoose(tFaw, nowProCode, 0);
                layer.msg("保存成功！", { times: 2000, icon: 1 });
                //}
                //return null;
            }
            else {
                return false;
            }
        }
        /*----------修改题干临时存储信息[修改]--------*/
        function UpdateQuestion(tFaw, type, tgCode) {
            /*---------------点击修改按钮重新绘制题目格式--------------*/
            var stemTitle = "";
            switch (type) {//给题目外壳的标题赋值
                case singleChoice:
                    stemTitle = GetQuestionContent(tFaw);
                    break;
                case multipleChoice:
                    stemTitle = GetQuestionContent_More(tFaw);
                    break;
                case gapFilling:
                    stemTitle = GetQuestionContent_TK(tFaw);
                    break;
                case beginner:
                    stemTitle = GetQuestionContent_JD(tFaw);
                    break;
            }
            $("#Question_" + tFaw).empty();
            $("#Question_" + tFaw).html('<label name="TH" id="TH_' + tFaw + '" style="color:#2a6496;font-size:16px;">' + tFaw + '</label>.' + type + '');
            $("#Body_" + tFaw).empty();
            $("#Body_" + tFaw).append(stemTitle);
            //var tgCode = QuestionnaireCode + "_TG_" + tFaw;

            var code = "";//题支编码
            var con = "";//题支内容
            var fra = "";//题支分值
            var skip = "";//题支跳转方向
            if (subjectListJson != "" && subjectListJson.length > 0) {
                var jsonList = eval("[" + subjectListJson + "]");
                if (jsonList != null && jsonList.length > 0) {
                    for (var k = 0; k < jsonList.length; k++) {
                        if (tgCode == jsonList[k].TG_Info.TG_Code) {

                            $("#Prot_" + tFaw).val(jsonList[k].TG_Info.TG_Content);

                            if ($("#Fra_Sub_" + tFaw) != "undefined")
                                $("#Fra_Sub_" + tFaw).val(jsonList[k].TG_Info.TG_Score);

                            $("#TH_" + tFaw).text(jsonList[k].TG_Info.TG_Sort);
                            for (var t = 0; t < jsonList[k].TZ_Info.length; t++) {
                                code = jsonList[k].TZ_Info[t].SerialNumber;
                                con = jsonList[k].TZ_Info[t].TZ_Content;
                                fra = jsonList[k].TZ_Info[t].TZ_Score;
                                skip = jsonList[k].TZ_Info[t].TZ_Skip;
                                var problemContent = "";
                                switch (type) {
                                    case singleChoice:
                                        problemContent = GetProblemContent(tFaw, t, type, skip);//获取题支内容
                                        break;
                                    case multipleChoice:
                                        problemContent = GetProblemContent_More(tFaw, t, type, "");//获取题支内容
                                        break;
                                    case gapFilling, beginner:
                                        problemContent = GetProblemContent_TK(tFaw, t, type);//获取题支内容
                                        break;
                                }
                                $("#Body_" + tFaw).append(problemContent);
                                $("#TZ_Code_" + tFaw + "_" + t).val(code);
                                if (skip != "undefined" && skip != '0')
                                    $("#TZ_Code_" + tFaw + "_" + t).attr("data-jump", skip);
                                $("#TZ_Con_" + tFaw + "_" + t).val(con);
                                $("#TZ_Fra_" + tFaw + "_" + t).val(fra);
                            }
                            TrueChoose(tFaw, tgCode, 1);
                        }
                    }
                    if (type != singleChoice && type != multipleChoice)
                        $("#Content_" + tFaw).css("display", "");
                }
                $("#Btn_operation_" + tFaw).html("[保存]");
            }
        }

        /*-----------------绘制题干框架结构--------------*/
        function CopyDrawQuestion(index, type, tgCode) {
            /*
            P_Title 题干标题
            */
            var last = getLastSort();
            if (last == 0)
                last = index;
            var pTitle = '<div class="panel-heading"><h4 class="panel-title row">';
            pTitle += '<div class="col-md-9 col-sm-12 col-xs-12" style="padding-right: 0px; padding-bottom: 10px; margin-top: 10px;">';
            pTitle += '<a data-toggle="collapse" data-parent="#accordion" id="Question_' + index + '" href="#Content_' + index + '" aria-expanded="true" aria-controls="collapseOne" style="word-break:break-all;"><label name="TH" id="TH_' + index + '" style="color:#2a6496;font-size:16px;">' + last + '</label>.' + type + '</a></div>';
            pTitle += '<div class="col-md-3 col-sm-12 col-xs-12" style="padding-left: 0px; margin-top: 10px;">';

            if (type == singleChoice)
                pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_LogicJump_' + index + '" onclick="return LogicJump(\'' + index + '\');">[逻辑跳转]</a></label>';

            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_deloperation_' + index + '" onclick="return Del_Operation(\'' + index + '\',\'' + tgCode + '\');">[删除本题]</a></label>';
            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_copyoperation_' + index + '" style="color: #999" disabled="disabled">[复制本题]</a></label>';
            pTitle += '<label style="float: right;"><a href="javascript:;" id="Btn_operation_' + index + '" value="1" name="Btn_operation" onclick="return Btn_Operation(\'' + index + '\',\'' + type + '\',\'' + tgCode + '\');">[保存]</a></label>';
            pTitle += '</div></h4></div>';
            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var pBody = ""
            + "    <div id=\"Body_" + index + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var pContent = ""
            + "<div id=\"Content_" + index + "\" class=\"panel-collapse in\">"
            + pBody
            + "</div>";

            /*定义题目的外壳，就是区域边框层*/
            var shellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + index + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + pTitle + pContent + " </div></div></div>";
            $("#ListQuestionPanel").append(shellHtml);
            var stemTitle = "";
            switch (type) {
                case singleChoice:
                    stemTitle = GetQuestionContent(index); //给题目外壳的标题赋值
                    break;
                case multipleChoice:
                    stemTitle = GetQuestionContent_More(index);
                    break;
                case gapFilling:
                    stemTitle = GetQuestionContent_TK(index);
                    break;
                case beginner:
                    stemTitle = GetQuestionContent_JD(index);
                    break;
            }
            $("#Body_" + index).append(stemTitle);
        }
        /*动态添加题目*/
        function CopyAddQuestion(qCode, type, tgCode) {
            var qpArr = $('div[name=QuestionPanel]');//获取题干的数量
            var questionCountK = qpArr.length;
            var index = parseInt(questionCountK)+1;
            var tSort = "";
            for (var p = 0; p < questionCountK; p++) {
                if (tSort != "") {
                    tSort += "," + qpArr[p].id.split('_')[1];
                } else {
                    tSort += qpArr[p].id.split('_')[1];
                }

            }
            var questionCode = GetTT_S(index, tSort);
            CopyDrawQuestion(questionCode, type, QuestionnaireCode + "_TG_" + index);//动态创建题目

            if (subjectListJson != "") {
                if (subjectListJson.indexOf(tgCode) >= 0) {
                    var jsonList = eval("[" + subjectListJson + "]");
                    for (var i = 0; i < jsonList.length; i++) {
                        if (tgCode == jsonList[i].TG_Info.TG_Code) {

                            var tempAry = new Array();
                            tempAry = jsonList[i].TG_Info.TG_TrueAnswer.split(",");
                            for (var j = 0; j < tempAry.length; j++) {
                                if (tempAry[j] == "") {
                                    tempAry.splice(j, 1);
                                    j--;
                                }
                            }
                            if (type == gapFilling || type == beginner)
                                $("#Prot_" + questionCode).val(jsonList[i].TG_Info.TG_Content);
                            if (type == multipleChoice)
                                $("#Fra_Sub_" + questionCode).val(jsonList[i].TG_Info.TG_Score);
                            for (var k = 0; k < jsonList[i].TZ_Info.length; k++) {
                                var oCode = jsonList[i].TZ_Info[k].SerialNumber;
                                var oCon = jsonList[i].TZ_Info[k].TZ_Content;
                                var oFra = jsonList[i].TZ_Info[k].TZ_Score;
                                var oNum = jsonList[i].TZ_Info[k].TZ_Num;

                                var problemContent = "";
                                switch (type) {
                                    case singleChoice:
                                        problemContent = GetProblemContent(questionCode, questionCode, type);//获取题支内容
                                        break;
                                    case multipleChoice:
                                        var boo = "";
                                        for (var t = 0; t < tempAry.length; t++) {
                                            if (tempAry[t] == k.toString())
                                                boo = "checked";
                                        }

                                        problemContent = GetProblemContent_More(questionCode, questionCode, type, boo);//获取题支内容
                                        break;
                                    case gapFilling, beginner:
                                        problemContent = "";
                                        break;
                                }
                                if (problemContent != "") {
                                    $("#Body_" + questionCode).append(problemContent);
                                    $("#TZ_Code_" + questionCode + "_" + k).val(oCode);
                                    $("#TZ_Con_" + questionCode + "_" + k).val(oCon);
                                    $("#TZ_Fra_" + questionCode + "_" + k).val(oFra);
                                }
                            }
                            break;
                        }
                    }
                }
            }
            return false;
        }
        /*--------删除题目-----------*/
        function Del_Operation(tFaw, tgCode) {
            var nowSort = 0;//保存当前题号的索引
            var qpanelList = $('div[name=QuestionPanel]').length;
            if (qpanelList > 1) {
                layer.confirm('题目删除后对应逻辑跳转也将删除，确定删除该题目？', {
                    btn: ['确定', '取消'] //按钮
                }, function () {

                    nowSort = $("#TH_" + tFaw).text();
                    if (nowSort.length <= 0)
                        nowSort = $("#THSort_" + tFaw).text();

                    if ($("#QuestionPanel_" + tFaw) != "undefined") {
                        $("#QuestionPanel_" + tFaw).empty();
                        $("#QuestionPanel_" + tFaw).hide();
                        $("#QuestionPanel_" + tFaw).attr("name", "Error");
                        $("#QuestionPanel_" + tFaw).attr("id", "Error_" + tFaw);
                    }

                    ResetMask(nowSort);
                    AutoSort_Subject(nowSort);

                    if (subjectListJson != "") {
                        if (tgCode == "")
                            tgCode = QuestionnaireCode + "_TG_" + tFaw;
                        if (subjectListJson.indexOf(tgCode) >= 0) {
                            var jsonList = eval("[" + subjectListJson + "]");
                            if (jsonList != null && jsonList.length > 0) {
                                subjectListJson = "";
                                for (var t = 0; t < jsonList.length; t++) {//重新绘制Json结构                                    

                                    if (tgCode != jsonList[t].TG_Info.TG_Code) {
                                        if (subjectListJson != "") {
                                            subjectListJson += ",";
                                        }
                                        if (parseInt(jsonList[t].TG_Info.TG_Sort) > parseInt(nowSort))
                                            jsonList[t].TG_Info.TG_Sort = parseInt(jsonList[t].TG_Info.TG_Sort) - 1;
                                        subjectListJson += "    {";
                                        subjectListJson += "        \"TG_Info\": ";
                                        subjectListJson += "            {";
                                        subjectListJson += "                \"TG_Code\": \"" + jsonList[t].TG_Info.TG_Code + "\",";
                                        subjectListJson += "                \"TG_Content\": \"" + jsonList[t].TG_Info.TG_Content + "\",";
                                        subjectListJson += "                \"TG_Sort\": \"" + jsonList[t].TG_Info.TG_Sort + "\",";
                                        subjectListJson += "                \"TG_Score\":\"" + jsonList[t].TG_Info.TG_Score + "\",";
                                        subjectListJson += "                \"TG_TrueAnswer\":\"" + jsonList[t].TG_Info.TG_TrueAnswer + "\",";
                                        subjectListJson += "                \"TG_Type\":\"" + jsonList[t].TG_Info.TG_Type + "\"";
                                        subjectListJson += "            }";
                                        subjectListJson += "        ,";
                                        subjectListJson += "        \"TZ_Info\": [";

                                        var tzContentJson2 = "";
                                        if (jsonList[t].TZ_Info != null && jsonList[t].TZ_Info.length > 0) {
                                            var str = " ";
                                            for (var i = 0; i < jsonList[t].TZ_Info.length; i++) {
                                                if (tzContentJson2 != "")
                                                    str = " , ";
                                                else
                                                    str = " ";

                                                var data = parseInt(jsonList[t].TZ_Info[i].TZ_Skip);
                                                var data2 = parseInt(nowSort);
                                                if (data > data2)
                                                    data -= 1;
                                                else if (data == data2)
                                                    data = 0;
                                                jsonList[t].TZ_Info[i].TZ_Skip = data;

                                                tzContentJson2 += str + "{\"TZ_Code\":\"" + jsonList[t].TZ_Info[i].TZ_Code + "\",\"TZ_Num\":\"" + jsonList[t].TZ_Info[i].TZ_Num + "\",\"TZ_Content\":\"" + jsonList[t].TZ_Info[i].TZ_Content + "\",\"TZ_Score\":\"" + jsonList[t].TZ_Info[i].TZ_Score + "\",\"TZ_Skip\":\"" + jsonList[t].TZ_Info[i].TZ_Skip + "\",\"SerialNumber\":\"" + jsonList[t].TZ_Info[i].SerialNumber + "\"}";
                                            }
                                        }
                                        subjectListJson += tzContentJson2;
                                        subjectListJson += "        ]";
                                        subjectListJson += "    }";
                                    }
                                }
                            }
                        }
                    }
                    layer.msg('删除成功', { time: 2000, icon: 1 });

                });
            } else {
                layer.msg('请至少保留一道题目。', {
                    time: 2000, //2s后自动关闭
                    btn: ['确定']
                });
            }
        }
        /*删除一个题干之后，重置与之相关的逻辑跳转*/
        function ResetMask(th) {
            var data2 = parseInt(th);
            $("input[name*='options_']").each(function () {
                if ($(this).attr("data-jump") != undefined) {
                    var data = parseInt($(this).attr("data-jump"));
                    if (data == 0)
                        $(this).removeAttr("data-jump");
                    else if (data > data2)
                        $(this).attr("data-jump", data - 1);
                    else if (data == data2)
                        $(this).removeAttr("data-jump");
                }
            });
            $("input[name*='TZ_Code_']").each(function () {
                if ($(this).attr("data-jump") != undefined) {
                    var data = parseInt($(this).attr("data-jump"));
                    if (data == 0)
                        $(this).removeAttr("data-jump");
                    else if (data > data2)
                        $(this).attr("data-jump", data - 1);
                    else if (data == data2)
                        $(this).removeAttr("data-jump");
                }
            });
        }
        /*删除题支*/
        function delopt(objId, type) {
            var arrObj = objId.split('_');
            var tzsort = parseInt(arrObj[1]);//当前删除的题支的序号，用来重新排序题支

            var codeList = $("[name='TZ_Code_" + arrObj[0] + "']");
            if (codeList.length > 1) {
                //询问框
                layer.confirm('您是否要删除当前题支编辑内容？', {
                    btn: ['删除', '取消'] //按钮
                }, function () {
                    $("#row_" + objId).hide();
                    $("#row_" + objId).empty();
                    layer.msg('删除成功', { time: 2000, icon: 1 });
                    if (type == "多选题")
                        $("#Body_" + arrObj[0]).find("[class=row]").each(function (i) {
                            if (i > 0) {
                                if (i > tzsort) {
                                    var tz1 = document.getElementById("TZ_Code_" + arrObj[0] + "_" + i);
                                    if (tz1 != null)
                                        tz1.setAttribute("id", "TZ_Code_" + arrObj[0] + "_" + (i - 1));
                                    var tz2 = document.getElementById("TZ_Con_" + arrObj[0] + "_" + i);
                                    if (tz2 != null)
                                        tz2.setAttribute("id", "TZ_Con_" + arrObj[0] + "_" + (i - 1));
                                    var tz3 = document.getElementById("TZ_CheckBox_" + arrObj[0] + "_" + i);
                                    if (tz3 != null) {
                                        tz3.setAttribute("id", "TZ_CheckBox_" + arrObj[0] + "_" + (i - 1));
                                        tz3.setAttribute("name", "TZ_CheckBox_" + arrObj[0] + "_" + (i - 1));
                                    }
                                }
                            }
                        });
                });
            } else {
                layer.msg('做人要厚道，您好歹给我留个吧？', {
                    time: 2000, //2s后自动关闭
                    btn: ['厚道一把']
                });
            }
            return false;
        }
        /*新增题支*/
        function addopt(objId, type) {
            var arr = objId.split('_');
            /*
                arr[0]  代表的是第几题
                arr[1]  代表的是第几题中的第几个选项
            */
            var nowF = parseInt(arr[1]);
            var problemContent = "";
            if (type == singleChoice)
                problemContent = GetProblemContent(arr[0], nowF, type);//获取题支内容
            else
                problemContent = GetProblemContent_More(arr[0], nowF, type, "");//获取题支内容
            $("#Body_" + arr[0]).append(problemContent);
            return false;
        }
        var maxLength_Logic = 0;//记录逻辑跳转设置里边最大添加的选项数量
        var itemIndex = 1;//创建的逻辑项索引(累加)
        var setOpertionList = new Array();//保存可以用来设计跳转的题支集合
        var val = 0;
        /*---------逻辑跳转---------*/
        function LogicJump(tFaw) {
            var array = new Array();
            /*获取当前单选题的题支数量----编辑状态下*/
            $("#Body_" + tFaw).find("input[name=TZ_Code_" + tFaw + "]").each(function (index) {
                if ($(this).val() != "")
                    array[index] = $(this).val() + "," + $(this).attr("id");
            });
            //静态界面时。获取题支的内容
            if (array.length == 0)
                $("#Body_" + tFaw).find("input[name=options_" + tFaw + "]").each(function (index) {
                    var temp = $(this).parent().text();
                    temp = temp.split("、")[0];
                    array[index] = temp + "," + $(this).attr("id");
                });
            maxLength_Logic = array.length;//设置最大添加的逻辑跳转项数量
            /*----*/
            $("#MaskItems").empty();
            val = 1;

            //添加一个设置项
            addMask();

            var boolValue = false;
            var subjectIndex = new Array();//保存该题之后的题号

            //遍历所有题干，获取当前题干之后的所有题号
            $("div[name=QuestionPanel]").each(function (i) {
                if (boolValue) {
                    var temp = $(this).attr("id").split("_")[1];
                    subjectIndex[subjectIndex.length] = (i + 1) + "," + temp;
                }
                if ($(this).attr("id") == "QuestionPanel_" + tFaw) {
                    boolValue = true;
                }
            });

            /*--给第一个下拉框设置选项--*/
            $("#checked_1").empty();
            $("#show_1").empty();

            for (var i = 0; i < array.length; i++) {
                if (i == 0)
                    $("#checked_1").append("<option selected='selected'>--请选择选项--</option>");
                var arr_temp = array[i].split(',');
                $("#checked_1").append("<option value='" + arr_temp[0] + "' data-code='" + arr_temp[1] + "'>" + arr_temp[0] + "</option>");
            }
            for (var i = 0; i < subjectIndex.length; i++) {
                if (i == 0)
                    $("#show_1").append("<option selected='selected'>--请选择题目--</option>");
                var tempArr = subjectIndex[i].split(",");
                $("#show_1").append("<option value='" + tempArr[0] + "'>" + tempArr[0] + "</option>");
            }
            /*----*/

            //保存所有被设置过逻辑跳转的题支题号和跳转方向            
            var tempArr2 = new Array();
            var opertionId = new Array();//保存题支的编码

            //遍历该题下的所有题支的data-jump属性值和内容
            $("#Body_" + tFaw).find("input[name=TZ_Code_" + tFaw + "]").each(function () {
                if ($(this).attr("data-jump") != undefined && $(this).attr("data-jump") != "0") {
                    tempArr2[tempArr2.length] = $(this).val() + "," + $(this).attr("data-jump");
                    opertionId[opertionId.length] = $(this).attr("id");
                }
            });

            if (tempArr2.length == 0) { /*----*/
                var arr = new Array();
                var tempJSonList = eval("[" + subjectListJson + "]");
                for (var i = 0; i < tempJSonList.length; i++) {
                    if (tempJSonList[i].TG_Info.TG_Sort == tFaw) {
                        for (var j = 0; j < tempJSonList[i].TZ_Info.length - 1; j++) {
                            var skip_temp = tempJSonList[i].TZ_Info[j].TZ_Skip;
                            if (skip_temp != "undefined" && skip_temp != tFaw && skip_temp != "0") {
                                arr[arr.length] = tempJSonList[i].TZ_Info[j].TZ_Code + "," + tempJSonList[i].TZ_Info[j].TZ_Skip;
                                // addMask();
                                //根据之前保存过得跳转方向，设置选中
                                $("#checked_" + tFaw).find("option[value='" + tempJSonList[i].TZ_Info[j].TZ_Code + "']").attr("selected", true);
                                $("#show_" + tFaw).find("option[value='" + tempJSonList[i].TZ_Info[j].TZ_Skip + "']").attr("selected", true);
                            }
                        }
                    }
                }
            } else {
                var ar = tempArr2[0].split(',');
                if (ar.indexOf("undefined") <= 0) {
                    //根据之前保存过得跳转方向，设置选中
                    $("#checked_1").find("option[value='" + ar[0] + "']").attr("selected", true);
                    $("#show_1").find("option[value='" + ar[1] + "']").attr("selected", true);
                }
                for (var i = 1; i < tempArr2.length; i++) {
                    ar = tempArr2[i].split(',');
                    if (ar.indexOf("undefined") <= 0) {
                        addMask();
                        if ($("#checked_" + (1 + i)).find("option[value='" + ar[0] + "']").length <= 0 || $("#show_" + (1 + i)).find("option[value='" + ar[1] + "']").length <= 0) {
                            deleteMask("MaskItem_" + (1 + i));
                        } else {
                            //根据之前保存过得跳转方向，设置选中
                            $("#checked_" + (1 + i)).find("option[value='" + ar[0] + "']").attr("selected", true);
                            $("#show_" + (1 + i)).find("option[value='" + ar[1] + "']").attr("selected", true);
                        }
                    }
                }
            }
            val = 0;
            updateSelect("");
            $("#MaskLayer").show();
            size();
            //给保存按钮添加点击事件
            $("#saveMask").attr("onclick", "SaveMask('QuestionPanel_" + tFaw + "'," + tFaw + ")");
        }
        /*添加逻辑跳转设置项*/
        function addMask() {
            //检查设置跳转的项的数量是否达到了最大数量
            var length = $("select[name=checkedName]").length;
            if (length >= maxLength_Logic)
                return;
            var temp = " "
            + "<div class=\"col-xs-12 col-sm-12 col-md-12\"  name=\"MaskItem\" id=\"MaskItem_" + itemIndex + "\">"
                  + "<label style=\"float: left;font-weight: normal;\">如果本题选中</label>"
                  + "<select onchange='updateSelect(this.id)' style=\"float: left;margin-left:10px;\" class=\"col-xs-12 col-sm-3 col-md-3\" name=\"checkedName\" id=\"checked_" + itemIndex + "\">"
                  + "</select>"
                  + "<label style=\"float: left;margin-left:10px;\" >则显示</label>"
                  + "<select style=\"float: left;margin-left:10px;\" class=\"col-xs-12 col-sm-3 col-md-3\" name=\"showName\" id=\"show_" + itemIndex + "\"></select>"
                  + "<div style=\"float: left;margin-left:10px;\" >"
                  + "<label><a class=\"glyphicon glyphicon-plus\" style=\"cursor: pointer;\" onclick=\"addMask()\"></a></label>"
                  + "<label style=\"margin-left:3px;\"><a class=\"glyphicon glyphicon-minus\" style=\"cursor: pointer;\" onclick=\"deleteMask('MaskItem_" + itemIndex + "')\"></a></label>"
                  + "</div>"
            + "</div>"
            ;
            $("#MaskItems").append(temp);
            $("#checked_" + itemIndex).empty();
            $("#show_" + itemIndex).empty();
            //根据第一个题支的下拉框里的内容，设置其他下拉框里的内容
            $("select[name=checkedName]:first").find("option").each(function (i) {
                $("#checked_" + itemIndex).append("<option value='" + $(this).val() + "' data-code='" + $(this).attr("data-code") + "'>" + $(this).val() + "</option>");
            });
            //根据第一个题干的下拉框里的内容，设置其他下拉框里的内容
            $("select[name=showName]:first").find("option").each(function (i) {
                $("#show_" + itemIndex).append("<option value='" + $(this).val() + "' data-code='" + $(this).attr("data-code") + "'>" + $(this).val() + "</option>");
            });
            itemIndex++;
            if (val != 1)
                updateSelect("");
        }
        /*删除逻辑跳转设置项*/
        function deleteMask(id) {
            var length = $("select[name=checkedName]").length;
            //if (length == 1)
            //    return;
            $("#" + id).empty();
            $("#" + id).css("display", "none");
            $("#" + id).attr("name", "Error");
            $("#" + id).removeAttr("id");
            updateSelect("");
        }
        //保存逻辑跳转设置项
        function SaveMask(subject, tFaw) {
            var length = $("div[name=MaskItem]").length;
            var selectIsNull = false;
            //检查界面上是否有未选中的下拉框。否则不允许点击保存
            $("#MaskItems").find("select").each(function () {
                var tem = document.getElementById($(this).attr("id")).selectedIndex;
                if (tem <= 0)
                    selectIsNull = true;
            });
            if (length >= 1 && selectIsNull) {
                return;
            }

            $("input[name=TZ_Code_" + tFaw + "]").removeAttr("data-jump");
            $("input[name=options_" + tFaw + "]").removeAttr("data-jump");
            //遍历逻辑跳转界面上的所有题支的下拉框
            $("#MaskItems").find("select[name=checkedName]").each(function (i) {
                //根据id获取对应下拉框的选中索引
                var optionSele = document.getElementById($(this).attr("id")).selectedIndex;//题支

                var subjectSele = document.getElementById("show_" + ($(this).attr("id").split('_')[1])).selectedIndex;//题干的索引
                var subIndex = "";
                //检查是否都有选择项
                if (optionSele > 0 && subjectSele > 0) {
                    //获取题干的选择项内容
                    subIndex = document.getElementById("show_" + ($(this).attr("id").split('_')[1])).options[subjectSele].value;
                }
                if (subIndex != "") {
                    var opti = (optionSele - 1);
                    //设置编辑界面上的题支题号控件的自编属性值为，要跳转的题号
                    if ($("#TZ_Code_" + tFaw + "_" + opti) != "undefined")
                        $("#TZ_Code_" + tFaw + "_" + opti).attr("data-jump", subIndex);
                }
            });
            HiddenMask();
        }
        //实时更新设置调整的题支选项内容
        function updateSelect(data) {
            if (data != "") {
                var obj = $("#" + data);
                var index = obj[0].selectedIndex;
                var code = obj[0].options[index].getAttribute("data-code");
            }
            setOpertionList = new Array();
            $("[name=checkedName]").each(function (j) {
                if ($(this)[0].getAttribute("id") != data && $(this)[0].selectedIndex != 0) {
                    setOpertionList[setOpertionList.length] = $(this)[0].options[$(this)[0].selectedIndex].getAttribute("data-code");
                }
            });
            $("[name=checkedName]").each(function (i) {
                if ($(this)[0].getAttribute("id") != data) {
                    for (var j = 1; j < $(this)[0].options.length; j++) {
                        var op = $(this)[0].options[j].getAttribute("data-code");
                        var nowco = $(this)[0].options[$(this)[0].selectedIndex].getAttribute("data-code");
                        $(this)[0].options[j].style.display = "block";
                        if (code != undefined) {
                            if ((setOpertionList.indexOf(op) >= 0 || op == code) && op != nowco)
                                $(this)[0].options[j].style.display = "none";
                        } else if (setOpertionList.indexOf(op) >= 0 && op != nowco)
                            $(this)[0].options[j].style.display = "none";
                    }

                }
            });
        }
        //根据浏览器的大小，设置遮罩弹框的位置
        function size() {
            var winHeight = $(window).height();
            var winWidth = $(window).width();
            var divHeight = $("#MaskContent").height();
            var divWidth = $("#MaskContent").width();
            $("#MaskContent").css("top", (winHeight - divHeight) / 2);
        }
        ///隐藏关闭遮罩层
        function HiddenMask() {
            $("#MaskLayer").hide();
            $("#MaskItems").empty();
            itemIndex = 1;
        }
        ///隐藏关闭遮罩层---遮罩层的点击事件
        $("#MaskContent").click(function (event) {
            event.stopPropagation();
        });
        //限制只能输入数字
        function onlyNumber(obj) {

            //得到第一个字符是否为负号  
            var t = obj.value.charAt(0);
            //先把非数字的都替换掉，除了数字和.   
            obj.value = obj.value.replace(/[^\d\.]/g, '');
            //必须保证第一个为数字而不是.     
            obj.value = obj.value.replace(/^\./g, '');
            //保证只有出现一个.而没有多个.     
            obj.value = obj.value.replace(/\.{2,}/g, '.');
            //保证.只出现一次，而不能出现两次以上     
            obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
            //如果第一位是负号，则允许添加  
            if (t == '-') {
                obj.value = '-' + obj.value;
            }

        }
        function GetTT_S(indexObj, sortStrList) {
            if (sortStrList.indexOf(indexObj) < 0) {
                for (var t = 0; t < indexObj ; t++) {

                    if (t > 0 && sortStrList.indexOf(t) < 0) {
                        return t;
                    }
                }
                return indexObj;
            } else {
                var slList = sortStrList.split(',');
                if (slList != null && slList.length > 0) {
                    for (var k = 0; k < slList.length; k++) {
                        if (k > 0 && sortStrList.indexOf(k) < 0) {
                            return k;
                        }
                    }
                    return GetTT_S(parseInt(indexObj + 1), sortStrList);
                }
            }
        }
        ///*用于填空题，点击添加一个空缺符号"@____;"来代表这是一个填空框*/
        function AddVacancy(idName) {
            var temp = $("#" + idName).val();
            temp += "@____;";
            $("#" + idName).val(temp);
            $("#" + idName).focus();
        }
        ///*根据题干序号和题支的序号，进行题支显示的样式设置*/
        ///*index代表的是处理方式。0代表静态显示时的处理方式；1代表编辑时的处理方式*/
        function TrueChoose(tFaw, tgCode, index) {
            var tempAry = new Array();
            var jsonList = eval("[" + subjectListJson + "]");
            for (var i = 0; i < jsonList.length; i++) {
                if (tgCode == jsonList[i].TG_Info.TG_Code)
                    tempAry = jsonList[i].TG_Info.TG_TrueAnswer.split(",");
            }
            for (var i = 0; i < tempAry.length; i++) {
                if (tempAry[i] == "") {
                    tempAry.splice(i, 1);
                    i--;
                }
            }

            if (index == 0) {
                $("Body_" + tFaw).find("label[name=trueChoose]").text("");
                for (var i = 0; i < tempAry.length; i++) {
                    $("#trueChoose_" + tFaw + "_" + tempAry[i]).text("(正确答案)");
                }
            }
            else if (index == 1) {
                for (var i = 0; i < tempAry.length; i++) {
                    $("#TZ_CheckBox_" + tFaw + "_" + tempAry[i])[0].checked = true;
                }
            }

        }
        /*自动校正题号的排序*/
        function AutoSort_Subject(tFaw) {
            var intB = parseInt(tFaw);
            $("#ListQuestionPanel").find("label[name=TH]").each(function () {
                try {
                    var intA = parseInt($(this).text());
                    if (intA > intB) {
                        var val = $(this).text();
                        val = val - 1;
                        $(this).text(val);
                    }
                } catch (error) {
                    debugger;
                }
            }); $("#ListQuestionPanel").find("span[name=THSort]").each(function () {
                try {
                    var intA = parseInt($(this).text());
                    if (intA > intB) {
                        var val = $(this).text();
                        val = val - 1;
                        $(this).text(val);
                    }
                } catch (error) {
                    debugger;
                }
            });
        }

        function getLastSort() {
            var last = 0;
            var last2 = 0;
            $("#ListQuestionPanel").find("label[name=TH]").each(function () {
                if (parseInt($(this).text()) > parseInt(last))
                    last = $(this).text();
            });

            $("#ListQuestionPanel").find("span[name=THSort]").each(function () {
                if (parseInt($(this).text()) > parseInt(last2))
                    last2 = $(this).text();
            });
            if (parseInt(last) < parseInt(last2))
                last = last2;
            return parseInt(last) + 1;
        }
        //根据数据库中的题干类型，获取对应的题干类型文字描述
        function GetProType(type) {
            //题干类型,0：单选；1：多选；2：填空；3：简单
            var proType = "";
            switch (type) {
                case 0:
                    proType = singleChoice;
                    break;
                case 1:
                    proType = multipleChoice;
                    break;
                case 2:
                    proType = gapFilling;
                    break;
                case 3:
                    proType = beginner;
                    break;
            }
            return proType;
        }

        /*题目编辑保存按钮事件*/
        function SaveSubjectSumit() {

            //修改问卷，进行保存之前，先进行一次判断：
            //该问卷是否有人正在作答或已作答，有则阻止修改操作，并将问卷修改功能置灰不能点击
            $.ajax({
                type: "POST",
                url: "Ajax/Questionnaire_Manage.ashx?operationType=CheckAnwser",
                data: { _qcode: urlCode },
                success: function (msg) {
                    if (msg > 0) {
                        layer.alert('保存失败！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                layer.closeAll();
                                window.location.href = navName;
                            }
                        });
                        return false;
                    } else {
                        $("#save_OK").hide();
                        var btnOk = $("a[name=Btn_operation]");
                        var guidance = $("#textarea_Guidance").val(); //获取问卷说明
                        var questionnaireName = $("#QuestionnaireNameHtm").val(); //获取问卷名称

                        var haveOk = 0;
                        for (var i = 0; i < btnOk.length; i++) {
                            var opk = btnOk[i];
                            if (opk.innerText == "[保存]") {
                                haveOk = 1;
                            }
                        }
                        if ($("#QuestionnaireNameHtm").val().replace(/\ /g, "") == "") {
                            layer.msg('请填写问卷标题！', {
                                time: 2000, //20s后自动关闭
                                btn: ['确定']
                            });
                            return false;
                        }
                        if (haveOk > 0) {
                            layer.msg('请先把没有确定好的题干信息确定好再保存吧！', {
                                time: 2000, //20s后自动关闭
                                btn: ['知道了']
                            });
                            $("#save_OK").show();
                            return false;
                        } else {
                            $.ajax({
                                type: "POST",
                                url: "Ajax/Questionnaire_Manage.ashx",
                                data: {
                                    operationType: "checkName",
                                    name: questionnaireName,
                                    code: urlCode
                                },
                                success: function (msg) {
                                    if (msg > 0) {
                                        layer.msg("问卷名称不能重复！", { icon: 5, time: 2000 });
                                        return;
                                    } else {
                                        if (Q_State == 0) {
                                            SaveQuestionnaire(questionnaireName, guidance, subjectListJson, urlCode, "true");

                                        } else {
                                            var isFinish = "false"; //问卷是否完成
                                            layer.confirm('当前问卷是否完成？', {
                                                btn: ['已完成', '未完成'] //按钮,                              
                                            }, function () {
                                                isFinish = "true";
                                                SaveQuestionnaire(questionnaireName, guidance, subjectListJson, urlCode, isFinish);
                                            }, function () {
                                                SaveQuestionnaire(questionnaireName, guidance, subjectListJson, urlCode, isFinish);
                                            });
                                        }
                                    }
                                }
                            });


                        }
                        return false;
                    }
                }
            });
        }
        //保存问卷信息
        function SaveQuestionnaire(questionnaireName, guidance, subjectListJson, urlCode, isFinish) {
            $.ajax({
                type: "POST",
                url: "Ajax/Questionnaire_Manage.ashx",
                data: {
                    operationType: "updateData",
                    name: questionnaireName,
                    Guidance: guidance,
                    Json: subjectListJson,
                    code: urlCode,
                    Is_Finish: isFinish
                }, //要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {
                        layer.msg("问卷保存成功！", { icon: 6, time: 2000 }, function () {
                            window.location.href = "/FunctionModular/Questionnaire_Record/Questionnaire_Manage.aspx";
                        });
                    } else {
                        $("#save_OK").show();
                        layer.msg("问卷保存失败！", { icon: 5, time: 2000 });
                        return;
                    }
                }
            });
        }

        function CancelSubjectSumit() {
            layer.confirm('退出后当前界面不保存,是否退出？', {
                btn: ['是', '否'] //按钮
            }, function () {
                window.location.href = navName;
            }
            , function () {

            });
        }

    </script>
</asp:Content>
