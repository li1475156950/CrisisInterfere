<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Questionnaire_Manage.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.Questionnaire_Manage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-table.min.js"></script>
    <link rel="shortcut icon" href="favicon.ico" />
    <%--  <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />--%>
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>


    <%-- 李兆典创建 --%>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="#">问卷管理</a></li>
            </ol>
        </div>
    </div>

    <!-- /. ROW  -->
    <div class="row" style="padding-bottom: 20px">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input type="text" class="form-control input-sm" style="width: 100%" placeholder="--问卷名称--" id="QuestionnaireName" />
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px;">
                <input type="text" readonly="readonly" placeholder="--编制日期--" class="form-control input-sm" onclick="javascript: $(this).val('')" id="dtstart" style="width: 100%; border-radius: 0px;">
            </div>
            <div class="col-md-1 col-sm-2 col-xs-2">
                <label style="height: 34px; line-height: 34px;">-</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px;">
                <input type="text" readonly="readonly" placeholder="--编制日期--" class="form-control input-sm" onclick="javascript: $(this).val('')" id="dtend" style="width: 100%; border-radius: 0px;">
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="form-control" data-placeholder="--问卷状态--" id="Sel_QuestionnaireState">
                <option value="-1" selected="selected">全部</option>
                <option value="0">未分配</option>
                <option value="1">已分配</option>
                <option value="2">未完成</option>
                >
            </select>
        </div>

        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
            <button class="btn btn-primary btn-sm" id="select" style="margin-right: 10px; float: left;"><i class="fa fa-search "></i>查询</button>
            <button class="btn btn-sm pull-right" style="background-color: orange; float: right; color: white" id="QX_AddNewQuestionnaire" onclick="AddNewQuestionnaire()">+新问卷</button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>问卷ID</th>
                            <th class="text-center" style="width: 1%;">
                                <input id="allCheck" type="checkbox" onclick="SelectAll(this);" value="0" />
                            </th>
                            <th class="text-center" style="width: 6%;">序号</th>
                            <th class="text-center" style="width: 10%;">问卷名称</th>
                            <th class="text-center" style="width: 6%;">编制人</th>
                            <th class="text-center" style="width: 10%;">编制时间</th>
                            <th class="text-center" style="width: 6%;">状态</th>
                            <th class="text-center" style="width: 12%;">操作</th>
                        </tr>
                    </thead>
                    <tbody id="lbSource"></tbody>
                </table>

            </div>
            <div class="row" style="margin-left: 0px; margin-right: 0px;">
                <button type="button" class="btn btn-blues" name="QX_FenPeiAmount" onclick='GetDistributionTable()' style='margin-left: 0px;'><i class="glyphicon glyphicon-edit"></i>分配问卷</button>
                <button onclick="BulkRemind()" style="margin-left: 5px; margin-right: 5px;" class="btn  btn-blues"><i class="glyphicon glyphicon-share"></i>批量导出</button>
                <button onclick="RBdeletes()" class="btn btn-reds"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
            </div>

            <!--End Advanced Tables -->
        </div>
    </div>

    <!--问卷查看遮罩窗-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">问卷预览
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row" id="ListQuestionPanel">

                        <div class="row" style="text-align: center; margin-left: 0px; margin-right: 0px;">
                            <h4 id="QuestionNameHtm">XX问卷</h4>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <h4 id="textarea_Guidance" style="word-break: break-all;"></h4>
                            </div>
                        </div>
                        <div class="row" name="QuestionPanel" id="QuestionPanel_1" style="margin-top: 15px;">
                            <div class="col-md-12">
                                <div>
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a data-toggle="collapse" data-parent="#accordion" id="Question_1" href="#Content_0" aria-expanded="true" aria-controls="collapseOne" class="collapsed">1.&nbsp;抑郁情绪</a></h4>
                                    </div>
                                    <div id="Content_0" class="panel-collapse in" tyle="height: auto;">
                                        <div id="Body_1" class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 col-xs-12 col-sm-12">
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="options_1" id="options_1_1" style="font-weight: normal">5、<label style="color: #101010;">很重</label>
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <%-- <button type="button" class="btn btn-info" onclick="onprint()" style="display: none">
                        打印
                    </button>--%>
                    <button type="button" class="btn btn-info" id="export">
                        导出
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>


    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="../AppointmentConsult/ViewModel/IndividualConsultationViewModel.js"></script>
    <script src="../../JS/word/zip.js"></script>
    <script src="../../JS/word/ZipArchive.js"></script>
    <script src="../../JS/deflate.js"></script>
    <script src="../../JS/mime-types.js"></script>
    <script src="../../JS/jquery.wordexportBatch.js"></script>
    <script src="../../JS/jquery.js"></script>
    <%-- <script src="../../JS/bootstrap-select.min.js"></script>--%>

    <script>

        /*设置时间框的默认时间*/

        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtstart').val('<%=GetDate(-7)%>');

        $('#dtend').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtend').val('<%=GetDate(0)%>');

        /*------*/
        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var questionnaireName = "";//问卷名称
        var startTime = "";//编制日期
        var endTime = "";
        var state = "";//问卷状态
        var tableGrid;//数据表

        var nowUserId = "<%=Session["UserID"]%>";

        BindGrid();

        //回车进行搜索
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                $('#select').click();
            }
        });

        var navName = '/FunctionModular/Questionnaire_Record/Questionnaire_Manage.aspx';

        //初始化数据
        function BindGrid() {
            questionnaireName = $("#QuestionnaireName").val();
            if (questionnaireName == undefined)
                questionnaireName = "";
            startTime = $("#dtstart").val();
            endTime = $("#dtend").val();
            state = $("#Sel_QuestionnaireState").find("option:selected").val();
            if (tableGrid != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
            tableGrid = $('#DataTables-Gauge').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    }
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Questionnaire_Manage.ashx",
                    dataSrc: "data",
                    data: function (d) {

                        Endindex = 0;
                        Startindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }

                        return 'operationType=Bind&StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&questionnaireName=' + questionnaireName + '&startTime=' + startTime + '&endTime=' + endTime + '&state=' + state;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    $('td:eq(0)', row).html(data[1]);
                    $('td:eq(1)', row).html(data[2]);
                    $('td:eq(2)', row).html(data[3]);
                    $('td:eq(3)', row).html(data[10]);
                    $('td:eq(4)', row).html(data[4]);
                    $('td:eq(5)', row).html(data[5]);
                    if (data[11] == "False")
                        $('td:eq(5)', row).html("未完成");
                    operation = " <button  class=\"btn btn-link\" data-code=\"" + data[7] + "\" data-value=\"" + data[3] + "\" name='QX_Look' onclick=\"CheckQuestion('" + data[7] + "',true)\">查看</button>";
                    if ((data[8] == nowUserId || data[9] == "超级管理员")) {
                        operation += " <button class=\"btn btn-link\" data-code=\"" + data[7] + "\" data-id=\"" + data[6] + "\" data-value=\"" + data[3] + "\" data-create=\"" + data[8] + "\" name='QX_Copy' onclick=\"CopyQuestion(this)\" >复制</button>";
                        if (data[12] != "0")
                            operation += " <button style='color:#333;'  class=\"btn btn-link\" data-code=\"" + data[7] + "\" data-id=\"" + data[6] + "\" data-value=\"" + data[3] + "\" data-create=\"" + data[8] + "\" name='QX_Update' disabled=\"disabled\" onclick=\"UpdateQuestion(this,'" + data[5] + "')\">修改</button>";
                        else
                            operation += " <button  class=\"btn btn-link\" data-code=\"" + data[7] + "\" data-id=\"" + data[6] + "\" data-value=\"" + data[3] + "\" data-create=\"" + data[8] + "\" name='QX_Update' onclick=\"UpdateQuestion(this,'" + data[5] + "')\">修改</button>";
                        operation += " <button  class=\"btn btn-link\" data-id=\"" + data[6] + "\" data-value=\"" + data[3] + "\" data-create=\"" + data[8] + "\" name='QX_Delete' onclick=\"DeleteQuestion(this)\">删除</button>";
                    } else {
                        operation += " <button style='color:#333;'  class=\"btn btn-link\" data-code=\"" + data[7] + "\" data-id=\"" + data[6] + "\" data-value=\"" + data[3] + "\" disabled=\"disabled\" data-create=\"" + data[8] + "\" name='QX_Copy' onclick=\"CopyQuestion(this)\" >复制</button>";
                        operation += " <button style='color:#333;'  class=\"btn btn-link\" data-code=\"" + data[7] + "\" data-id=\"" + data[6] + "\" data-value=\"" + data[3] + "\" disabled=\"disabled\" data-create=\"" + data[8] + "\" name='QX_Update' onclick=\"UpdateQuestion(this,'" + data[5] + "')\">修改</button>";
                        operation += " <button style='color:#333;'  class=\"btn btn-link\" data-id=\"" + data[6] + "\" data-value=\"" + data[3] + "\" disabled=\"disabled\" data-create=\"" + data[8] + "\" name='QX_Delete'  onclick=\"DeleteQuestion(this)\">删除</button>";
                    }
                    for (var i = 0; i < 7; i++) {
                        $('td:eq(' + i + ')', row).css("text-align", "center");
                        $('td:eq(2)', row).css({ "word-break": "break-all" });
                    }
                    $('td:eq(6)', row).html(operation);
                },

                "oLanguage": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "_MENU_ 记录/页",
                    "sZeroRecords": "没有匹配的记录",
                    "sInfo": "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项记录，共 0 项",
                    "sInfoFiltered": "",
                    "sInfoPostFix": "",
                    "sSearch": "过滤:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    }
                },
                initComplete: function (setting, json) {
                },
                //移除全选按钮的选中
                drawCallback: function (s) {
                    $("#allCheck").removeAttr("checked");
                }
            });

        }

        //删除单个问卷信息
        function DeleteQuestion(obj) {
            //获取该问卷的ID
            var quesId = obj.getAttribute("data-id");
            //获取问卷的名称
            var name = obj.getAttribute("data-value");
            layer.confirm('确实要将该问卷放入回收站吗？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/Questionnaire_Manage.ashx?operationType=delete",
                    data: {
                        id: quesId, names: name
                    },
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功', { time: 2000, icon: 1 });
                            if (tableGrid != undefined) {
                                $("#DataTables-Gauge").DataTable().draw();
                                return;
                            }
                        } else {
                            layer.msg('删除失败', { time: 2000, icon: 5 });
                        }
                    }
                });
            });
        }
        //查看问卷
        function CheckQuestion(code, isShow) {
            //var name = obj.getAttribute("data-value");//问卷名称
            //var code = obj.getAttribute("data-code");//问卷编码
            $.ajax({
                type: "POST",
                url: "Ajax/Questionnaire_Manage.ashx?operationType=look",
                data: { quesCode: code },
                success: function (msg) {
                    if (msg != "") {
                        $("#ListQuestionPanel").find("[name=QuestionPanel]").remove();
                        var objEntity = eval(msg);
                        if (objEntity != null) {
                            $("#textarea_Guidance").html("<span style=\"font-weight:Bold;margin-left:20px;\">指导语：</span>" + objEntity[0].TG_Info.Instruction);
                            $("#QuestionNameHtm").html(objEntity[0].TG_Info.Name);
                            for (var i = 0; i < objEntity.length; i++) {
                                var tempContent = objEntity[i].TG_Info.TG_Content;//临时的题干内容。仅用于填空题
                                if (objEntity[i].TG_Info.TG_Type == 2)
                                    tempContent = objEntity[i].TG_Info.TG_Content.replace(/@____;/g, "____") + "（下划线部分为空缺）";
                                else if (objEntity[i].TG_Info.TG_Type == 1)
                                    tempContent = objEntity[i].TG_Info.TG_Content + "（多选）";
                                CreateProFrame(objEntity[i].TG_Info.TG_Type, objEntity[i].TG_Info.TG_Sort, tempContent, objEntity[i].TZ_Info);
                            }
                        }
                        //加载题干题支
                    }
                }
            });
            if (isShow == true)
                $("#myModal").modal('show');
        }
        //生成题干的框架
        function CreateProFrame(proType, proIndex, content, tzInfo) {
            var frame = '';
            frame += '<div class="row" name="QuestionPanel" id="QuestionPanel_' + proIndex + '" style="margin-top: 15px;word-break:break-all;">';
            frame += '<div class="col-md-12" > ';
            frame += '<div> ';
            frame += '<div class="panel-heading">';
            frame += '<h4 class="panel-title" style="word-break:break-all;"><a data-toggle="collapse" data-parent="#accordion" id="Question_' + proIndex + '" href="#Content_' + proIndex + '" aria-expanded="true" aria-controls="collapseOne" class="collapsed">' + proIndex + '.&nbsp;' + content + '</a></h4>';
            frame += '</div>';
            if (proType != 2 && proType != 3) {
                frame += '<div id="Content_' + proIndex + '" class="panel-collapse in" tyle="height: auto;">';
                frame += '<div id="Body_' + proIndex + '" class="panel-body">';
                for (var i = 0; i < tzInfo.length; i++) {
                    frame += CreateSingelPro(proType, proIndex, (i + 1), tzInfo[i]);
                }

                frame += '</div>';
                frame += '</div>';
            }
            frame += '</div>';
            frame += '</div>';
            frame += '</div>';
            ;

            $("#ListQuestionPanel").append(frame);
        }
        //生成题支显示效果
        function CreateSingelPro(proType, proIndex, tzIndex, tzInfo) {
            var singel_TZ = '';

            singel_TZ += '<div class="row">';
            singel_TZ += '                       <div class="col-md-12 col-xs-12 col-sm-12">';
            if (proType == 0)
                singel_TZ += '<div>';
            if (proType == 1)
                singel_TZ += '<div class="checkbox">';
            singel_TZ += '<label style="word-break:break-all;font-weight:normal">';
            if (proType == 0)
                singel_TZ += '<input type="radio" disabled="disabled" style="font-weight:normal" name="options_' + proIndex + '" id="options_' + proIndex + '_' + tzIndex + '">' + tzInfo.SerialNumber + '、<label style="color: #101010;font-weight:normal">' + tzInfo.TZ_Content + '</label>';
            if (proType == 1)
                singel_TZ += '<input type="checkbox" disabled="disabled" style="font-weight:normal" name="options_' + proIndex + '" id="options_' + proIndex + '_' + tzIndex + '">' + tzInfo.SerialNumber + '、<label style="color: #101010;font-weight:normal">' + tzInfo.TZ_Content + '</label>';
            singel_TZ += '</label>';
            singel_TZ += '</div>';
            singel_TZ += '</div>';
            singel_TZ += '</div>';

            return singel_TZ;
        }
        //单个导出按钮
        $(document).ready(function () {
            $("#export").click(function (event) {
                $(".collapsed").removeAttr("href");
                $("#ListQuestionPanel").find("input[type=radio]").attr({ type: "hidden", name: "radios" });
                $("#ListQuestionPanel").find("input[type=checkbox]").attr({ type: "hidden", name: "checkboxs" });
                var questionNameHtm = $("#QuestionNameHtm").html();
                $("#ListQuestionPanel").wordExport(questionNameHtm);
                $("#ListQuestionPanel").find("input[name=radios]").attr({ type: "radio" });
                $("#ListQuestionPanel").find("input[name=checkboxs]").attr({ type: "checkbox" });
            });
        });

        //复制问卷
        function CopyQuestion(obj) {
            layer.load(0, { shade: 0.5 });

            var questionnaireName = obj.getAttribute("data-value"); //问卷名称
            var code = obj.getAttribute("data-code"); //问卷编码

            $.ajax({
                type: "POST",
                url: "Ajax/Questionnaire_Manage.ashx?operationType=copy",
                data: { quesCode: code },
                success: function (msg) {
                    if (msg != "") {

                        var finish = "false";
                        //var sta = obj.parentNode.parentNode.childNodes[5].innerHTML;
                        //if (sta != "未完成")
                        //    finish = "true";
                        $.ajax({
                            type: "POST",
                            url: "Ajax/Questionnaire_CustomAdd.ashx",
                            data: {
                                operationType: "CopyQuestionnaire",
                                name: questionnaireName,
                                Guidance: "",
                                Is_Finish: finish,
                                Json: msg
                            }, //要执行查询的数据参数
                            success: function (msg) {
                                if (msg == -1) {
                                    $("#save_OK").show();
                                    layer.closeAll();
                                    layer.msg("当前问卷名称位数超过最大限制，请修改后重试。", { icon: 5, time: 2000 });
                                    return;
                                }
                                if (msg > 0) {
                                    layer.closeAll();
                                    layer.msg("问卷复制成功！", { icon: 6, time: 2000 });
                                    if (tableGrid != undefined) {
                                        $("#DataTables-Gauge").DataTable().draw();
                                        return;
                                    }
                                } else {
                                    $("#save_OK").show();
                                    layer.closeAll();
                                    layer.msg("问卷复制失败！", { icon: 5, time: 2000 });
                                    return;
                                }
                            }
                        });
                    } else {
                        layer.closeAll();
                        layer.msg('复制失败', { time: 2000, icon: 5 });
                    }
                }
            });
        }
        //修改问卷信息
        function UpdateQuestion(obj, state) {
            var queCode = obj.getAttribute("data-code");
            var stateId = state == "已分配" ? 0 : 1;
            window.location.href = "Questionnaire_Update.aspx?&code=" + queCode + "&state=" + stateId;

        }
        //全选
        function SelectAll(obj) {

            if (obj.checked) {
                $("input[type=checkbox][name=checkboxname]").prop("checked", true);
            } else { $("input[type=checkbox][name=checkboxname]").prop("checked", false); }
        }
        //新建问卷的点击事件
        function AddNewQuestionnaire() {
            window.location.href = "/FunctionModular/Questionnaire_Record/Questionnaire_Add.aspx";
        }

        //检查是否有选中项
        function examineCheckBox(text) {
            //获得表格内所有复选框
            var tempDistriArray = $("#DataTables-Gauge").find("input[type=checkbox]").not("#allCheck");
            var questionId = '';
            //判断是否有勾选的信息，否则弹框提示
            var isRemind = false;
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked)
                    isRemind = true;
            }
            if (!isRemind) {
                layer.alert(text, {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return false;
            }
            return true;
        }

        //批量删除
        function RBdeletes() {

            if (examineCheckBox("请选择要删除的问卷！") == false) {
                return;
            }
            //获得表格内所有复选框
            var tempDistriArray = $("#lbSource").find("input[type=checkbox]").not("#allCheck");
            var questionId = '';
            var name = '';
            var failNames = '';//临时保存删除失败的问卷名称
            //获取所有被选中的信息ID
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked) {
                    if (tempDistriArray[i].getAttribute("data-uid") == nowUserId || tempDistriArray[i].getAttribute("data-role") == "超级管理员") {
                        questionId += tempDistriArray[i].getAttribute("data-id") + ",";
                        name += tempDistriArray[i].getAttribute("data-name") + ",";
                    }
                    else
                        failNames += tempDistriArray[i].getAttribute("data-name") + "、";
                }
            }

            layer.confirm("确实要将所选问卷放入回收站吗?", {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/Questionnaire_Manage.ashx?operationType=delete",
                    data: {
                        id: questionId, names: name
                    },
                    success: function (msg) {
                        if (failNames != '') {
                            layer.msg(failNames + '删除失败！', { time: 2000, icon: 5 });
                            if (tableGrid != undefined && questionId != '') {
                                $("#DataTables-Gauge").DataTable().draw();
                                return;
                            }
                        }
                        else if (msg > 0) {
                            layer.msg('删除成功！', { time: 2000, icon: 1 });
                            if (tableGrid != undefined) {
                                $("#DataTables-Gauge").DataTable().draw();
                                return;
                            }
                        } else {
                            layer.msg('删除失败！', { time: 2000, icon: 5 });
                        }
                    }
                });
            });
        }

        //批量导出
        function BulkRemind() {
            //获得表格内所有复选框
            var tempDistriArray = $("#DataTables-Gauge").find("input[type=checkbox]").not("#allCheck");
            var exportCount = new Array();//保存所选中的问卷code
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked)
                    exportCount[exportCount.length] = tempDistriArray[i].getAttribute("data-code");
            }
            if (exportCount.length <= 0) {
                layer.alert("请选择要导出的问卷！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            var isEnd = false;//批量导出时，判断是否是最后一个
            var z = new ZipArchive;
            var tmep_j = 0;//因为ajax会先将所有代码执行过后才会执行，所以声明了一个临时变量，判断这是执行的第几次后台访问
            layer.load(0, { shade: 0.5 });
            for (var i = 0; i < exportCount.length; i++) {

                $.ajax({
                    type: "POST",
                    url: "Ajax/Questionnaire_Manage.ashx?operationType=look",
                    data: { quesCode: exportCount[i] },
                    success: function (msg) {

                        //添加一个加载图标
                        //if (tmep_j == 0) {
                        //    //此处演示关闭
                        //    setTimeout(function () {
                        //        layer.closeAll('loading');
                        //    }, 3000);
                        //}
                        //判断执行的是否为最后一次，打开文件保存弹框
                        if (tmep_j == exportCount.length - 1)
                            isEnd = true;
                        tmep_j++;
                        if (msg != "") {
                            $("#ListQuestionPanel").find("[name=QuestionPanel]").remove();
                            var objEntity = eval(msg);
                            if (objEntity != null) {
                                $("#textarea_Guidance").html("<span style=\"font-weight:Bold;margin-left:20px;\">指导语：</span>" + objEntity[0].TG_Info.Instruction);
                                $("#QuestionNameHtm").html(objEntity[0].TG_Info.Name);
                                for (var i = 0; i < objEntity.length; i++) {
                                    var tempContent = objEntity[i].TG_Info.TG_Content;//临时的题干内容。仅用于填空题
                                    if (objEntity[i].TG_Info.TG_Type == 2)
                                        tempContent = objEntity[i].TG_Info.TG_Content.replace(/@____;/g, "____") + "（____为空缺）";
                                    else if (objEntity[i].TG_Info.TG_Type == 1)
                                        tempContent = objEntity[i].TG_Info.TG_Content + "（多选）";
                                    CreateProFrame(objEntity[i].TG_Info.TG_Type, (i + 1), tempContent, objEntity[i].TZ_Info);
                                }
                            }
                            //加载题干题支
                            $(".collapsed").removeAttr("href");
                            $("#ListQuestionPanel").find("input[type=radio]").attr({ type: "hidden", name: "radios" });
                            $("#ListQuestionPanel").find("input[type=checkbox]").attr({ type: "hidden", name: "checkboxs" });
                            var questionNameHtm = $("#QuestionNameHtm").html();
                            $("#ListQuestionPanel").wordExport_Batch(questionNameHtm + "_" + tmep_j, isEnd, z);
                            if (isEnd)
                                layer.closeAll();
                        }
                    }
                });
            }
        }
        //分配问卷
        function GetDistributionTable() {
            var checkbox = document.getElementsByName("checkboxname"); if (checkbox.length > 0) {
                var quesCodes = "";//问卷编码   
                var failPeple = "";
                for (var i = 0; i < checkbox.length; i++) {
                    var isDis = document.getElementById("DataTables-Gauge").rows[i + 1].cells[5].innerHTML;
                    if (checkbox[i].checked) {
                        if (isDis != "未完成")
                            quesCodes += checkbox[i].getAttribute("data-code") + ",";
                        else
                            failPeple += i + ",";
                    }
                } if (quesCodes == "" && failPeple != "") {
                    layer.alert('未完成问卷不可被分配！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                    return;
                }
                if (quesCodes != "") {
                    location.href = "../Questionnaire_Record/Questionnaire_Gauges.aspx?Qcode=" + quesCodes;
                } else {
                    layer.alert('选择要分配的问卷！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            }

        }
        //搜索
        $(document).on("click", "#select", function () {
            questionnaireName = $("#QuestionnaireName").val();
            if (questionnaireName == undefined)
                questionnaireName = "";
            startTime = $("#dtstart").val();
            endTime = $("#dtend").val();
            state = $("#Sel_QuestionnaireState").find("option:selected").val();
            if (tableGrid != undefined)
                $("#DataTables-Gauge").DataTable().draw();
            return;
        });

        //表格内复选框的点击事件。判断是否选中/取消全选按钮
        $(document).on("click", "[name=checkboxname]", function () {

            var isAllCheck = true;
            var checkArray = $("#DataTables-Gauge").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }

            $("#allCheck")[0].checked = isAllCheck;
        });

    </script>

</asp:Content>
