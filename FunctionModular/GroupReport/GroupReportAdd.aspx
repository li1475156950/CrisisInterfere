<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GroupReportAdd.aspx.cs" Inherits="CrisisInterfere.FunctionModular.GroupReport.GroupReportAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-2 col-sm-12 col-xs-12">
            <input type="text" id="reportName"  maxlength="20"  placeholder="报告名称" class="form-control" />

        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel" style="background-color: white; border: none">
                <div class="panel-heading">
                    <h4>选择成员：</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="row">

        <div class="col-md-2 col-xs-12">
            <div class="col-md-12 col-sm-12 col-xs-6" style="padding-bottom: 10%;">
                <select class="selectpicker form-control" data-done-button="true" data-live-search="true" id="amountName" onchange="AmountNameChange()"></select>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-6" style="padding-bottom: 10%;">
                 <select  id="role" class="form-control" onchange="RoleChange()"></select>

                <%--<select id="role" class="selectpicker" onchange="RoleChange()" data-done-button="true" data-live-search="true"></select>--%>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-6" style="padding-bottom: 10%;">
                <input  placeholder="所属部门"  name="department" id="department" onchange="DepartmentChange()" />

            </div>
            <%--<div class="col-md-12 col-sm-12 col-xs-6"style="padding-bottom: 10%;">
                <div>
                    <input type="text" id="minAge" placeholder="最小年龄" class="col-md-10" />
                    <div class="col-md-10 col-sm-12 col-xs-6 text-center">-</div>
                    <input id="maxAge" placeholder="最大年龄" type="text" class="col-md-10" /></div>
            </div>--%>
            <div class="col-md-12 col-sm-12 col-xs-6" style="padding-bottom: 10%;">
                <select id="gender" class="form-control" onchange="GenderChange()">
                    <option selected="selected">性别</option>
                    <option>男</option>
                    <option>女</option>
                </select>


            </div>
            <div class="col-md-12 col-sm-12 col-xs-6" style="padding-bottom: 10%;">
                <select id="testType" class="selectpicker form-control" data-done-button="true" data-live-search="true" onchange="TestTypeChange()"></select>
            </div>
        </div>
        <div class="col-md-10 col-xs-12">
            <div class="well">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="tableGrid">
                                <thead>
                                    <tr>
                                        <th class="text-center"><%--<input type="checkbox" id="checkboxGrid"/>--%></th>
                                        <th class="text-center">序号</th>
                                        <th class="text-center">登录名</th>
                                        <th class="text-center">姓名</th>
                                        <th class="text-center">提交时间</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">


        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGridAdd">
                    <thead>
                        <tr>
                            <th>
                                <input data-ck="addAllCheck" name="checkboxs" type="checkbox" /></th>
                            <th class="text-center">序号</th>
                            <th class="text-center">登录名</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">部门</th>
                            <th class="text-center">年龄</th>
                            <th class="text-center">性别</th>
                            <th class="text-center">提交时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>
            
        <div class="row">
            <div class="col-md-1 col-sm-1 col-xs-1 text-right ">


                <button onclick="BulkDelete()" class="btn btn-reds" style="margin-right: 15px;">
                    <i class="glyphicon glyphicon-trash"></i>批量删除</button>

            </div>
        </div>
        </div>
    </div>

    <div class="row" style="text-align: center">
        <div class="col-sm-5 col-xs-5 text-right">
        <button class="btn   btn-sm" id="buttonsbox" style="background-color: orange; color: white" onclick="CreateGroupReport()">生成报告</button>
            </div>
         <div class="col-sm-1 col-xs-5 text-right">
        <button onclick="exit()" class="btn btn-primary btn-sm">返回</button>
             </div>
    </div>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script>
        var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;
        var navName = '/FunctionModular/GroupReport/GroupReport.aspx';
        function exit() {
            layer.confirm('退出后，当前数据将不会保留！', {
                btn: ['是', '否']
            }, function () {
                window.location.href = "GroupReport.aspx";
            })
        }
        var tempIndex = 0;
        //var groupReportJson = [];
        initSelectInput('InitiAmountName', 'amountName', '全部量表');
        //initSelectInput('InitiRole', 'role', '全部角色');

        initSelectInputs("Remark=1", "role", "角色名称");//初始化量表类别

        /*-----初始化下拉列表公共方法-----*/
        function initSelectInputs(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            t = setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "../BasicSetting/Ajax/Type.ashx",
                    data: types,//要执行查询的数据参数
                    success: function (msg) {
                        clearTimeout(t);
                        $.each(eval(msg), function (index, item) {

                            $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                        });

                    }
                });
            }, 100);

        }





        initSelectInput('InitiTestType', 'testType', '全部类型');
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "GET",
                url: "Ajax/GroupReportAdd.ashx?",
                data: { OperationType: types },//要执行查询的数据参数
                async: false,
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        if (item.Text == "强迫症状问卷" || item.text == "气质量表")
                        { }
                        else
                        {
                            $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                        }

                    });
                    $("#" + controlname).attr("multiple", false);

                    $("#" + controlname).selectpicker('refresh');
                }
            });
        }
        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var amountCode = '';
        var roleID = 0;
        var departmentID = 0;
        var minAge = 0;
        var maxAge = 0;
        var gender = '';
        var testName = '';
        var tablelist;
        BindGrid();

        function BindGrid() {
            //$("#amountName").find("option:eq(1)").attr("selected", "selected")
            //amountCode = $("#amountName").find("option:eq(1)").val();
            //$("[data-id=amountName]").find("span:eq(0)").text($("#amountName").find("option:eq(1)").text())
            //alert($("#amountName").find("option:selected").val());
            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tablelist = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,
                pageLength: 5,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                //aoColumnDefs: [
                //    { //隐藏列
                //        bVisible: false,
                //        aTargets: [0]
                //    },
                //],
                ajax: {
                    method: 'get',
                    url: "Ajax/GroupReportAdd.ashx?operationType=Bind",
                    dataSrc: "data",
                    data: function (d) {

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        Endindex = 0;
                        Startindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&amountCode=' + amountCode + '&roleID=' + roleID + '&departmentID=' + departmentID + '&minAge=' + minAge + '&maxAge=' + maxAge + '&gender=' + gender + '&testName=' + testName;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    //var operation = "";
                    //operation = " <button class='btn btn-danger' data-remove='remove'><i class=\"glyphicon glyphicon-trash\"></i>删除</button>";

                    //$('td:eq(4)', row).html(operation);
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
                }
            });
        }
        OnLoadTreeComs();
        function OnLoadTreeComs() {
            $("#department").ligerComboBox({
                width: "100%",
                selectBoxWidth: "85%",
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    onSuccess: function () {
                        setTimeout(function () {
                            var manager = $(".l-tree").ligerGetTreeManager();
                        }, 100);
                    },
                    onBeforeSelect: function (node) {
                        $("#department").attr("data-id", node.data['id']);
                    },
                    url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }
            });
        }
        function GetQueryCondition() {


            if (!($("#amountName").find("option:selected").text().trim() == '全部量表')) {

                amountCode = $("#amountName").find("option:selected").val();
            }

            roleID = $("#role").find("option:selected").val();
            if ($("#department").val() == "") {
                $("#department").removeAttr("data-id");
                departmentID = 0;
            }
            if ($("#department").attr("data-id") != undefined) {
                departmentID = $("#department").attr("data-id");
            }
            if ($("#minAge").val() != "") {
                minAge = $("#minAge").val();
            }
            if ($("#maxAge").val() != "") {
                maxAge = $("#maxAge").val();
            }
            gender = $("#gender").find("option:selected").text();

            if ($("#testType").find("option:selected").text() != '全部分类') {
                testName = $("#testType").find("option:selected").text();
            }
        }
        function ClearTable() {
            $("#tableGridAdd").find("tbody").remove();
        }
        function AmountNameChange() {
            ClearTable();
            GetQueryCondition();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }

        }
        function RoleChange() {
            GetQueryCondition();
            if (tableGrid != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }
        }
        function DepartmentChange() {
            GetQueryCondition();
            if (tableGrid != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }
        }
        $("#minAge").bind("keyup", function () {
            GetQueryCondition();
            if (tableGrid != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        $("#maxAge").bind("keyup", function () {
            GetQueryCondition();
            if (tableGrid != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        function GenderChange() {
            GetQueryCondition();
            if (tableGrid != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }
        }
        function TestTypeChange() {
            GetQueryCondition();
            if (tableGrid != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }
        }
        $(document).on('click', '.checkMemberChoose', function () {

            if ($(this)[0].checked) {
                var isAdd = true;
                var trLen = $("#tableGridAdd").find("tr");
                if (trLen == 1) {
                    tempIndex = 0;
                }
                else {
                    tempIndex = $("#tableGridAdd").find("tr:last").find("td:eq(1)").text();
                }
                tempIndex++;
                //var objJson = {
                //    'AnswerAddID': $($(this)[0]).attr("data-answeraddid"),
                //    'LoginName': $($(this)[0]).attr("data-loginname"),
                //    'UserName': $($(this)[0]).attr("data-username"),
                //    'Department': $($(this)[0]).attr("data-department"),
                //    'Age': $($(this)[0]).attr("data-age"),
                //    'Gender': $($(this)[0]).attr("data-gender"),
                //    'SubmitDate': $($(this)[0]).attr("data-submitdate")
                //};
                //groupReportJson.push(objJson);
                var jundgeItem = $("#tableGridAdd").find("[data-tempansweraddid]");
                for (var i = 0; i < jundgeItem.length; i++) {
                    if ($(this).attr("data-answeraddid") == $(jundgeItem[i]).attr("data-tempansweraddid")) {
                        isAdd = false;
                        layer.alert("所选数据已经存在团体报告待生成的列表中，不能重复添加", {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        }, function () {
                            
                            layer.closeAll();
                        })
                        $(this).removeAttr("checked");
                    }
                }
                if (!isAdd) {
                    return;
                }
                var htmlContent = "<tr><td><input class='TempGroupReportAdd' type='checkbox' data-tempansweraddid ='" + $($(this)[0]).attr("data-answeraddid") + "' data-uid='" + $($(this)[0]).attr("data-uid") + "' data-amountcode='" + $($(this)[0]).attr("data-amountCode") + "'/></td>" +
                    "<td data-name ='index'>" + tempIndex + "</td>" +
                    "<td>" + $($(this)[0]).attr("data-loginname") + "</td>" +
                "<td>" + $($(this)[0]).attr("data-username") + "</td>" +
                "<td>" + $($(this)[0]).attr("data-department") + "</td>" +
                "<td>" + $($(this)[0]).attr("data-age") + "</td>" +
                "<td>" + $($(this)[0]).attr("data-gender") + "</td>" +
                "<td>" + $($(this)[0]).attr("data-submitdate") + "</td>" +
                "<td><button class='btn btn-link' onclick='DeleteTempMember(" + $($(this)[0]).attr("data-answeraddid") + ")'>删除</button></td>" +
                    "</tr>";
                $("#tableGridAdd").append(htmlContent);
            }else{
                var val = $(this).attr("data-answeraddid");
                $("[data-tempansweraddid=" + val + "]").parent().parent().remove();
                SortTableTd();
            }
        })
        function DeleteTempMember(val) {
            layer.confirm('确定删除此项吗？', {
                btn: ['确定', '取消']
            }, function () {
                $("[data-tempansweraddid=" + val + "]").parent().parent().remove();
                SortTableTd();
                layer.closeAll();
            })
        }
        function SortTableTd() {
            var tdArray = $("[data-name=index]");
            for (var i = 0; i < tdArray.length; i++) {
                $(tdArray[i]).text(i + 1);
            }
        }
        function DeInsert() {
            $("#buttonsbox").attr("disabled",false);
           
        }
        function CreateGroupReport() {

          
            $("#buttonsbox").attr("disabled", "disabled");
            setInterval('DeInsert()', 2000);
            var userIDList = '';
            var ansIDList = '';
            var jundgeReportName = '';
            var checkArray = $("#tableGridAdd").find("input[type=checkbox]:gt(0)");
            if (trim($("#reportName").val()) == "") {
                layer.alert('请填写报告名称', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                })
                return;
            }
            if (!reg.test($("#reportName").val())) {
                layer.alert('报告名称不可以为特殊字符!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                    shift: 1,//动画效果
                })
                return;
            }

                $.ajax({
                    url: "Ajax/GroupReportAdd.ashx?OperationType=JundgeReportName",
                    type: "GET",
                    data: { reportName: $("#reportName").val() },
                    dataType: "text",
                    async: false,
                    success: function (data) {
                        jundgeReportName = data;
                    }
                })
                if (jundgeReportName == "True") {
                    layer.alert('当前报告名称已存在，请重新填写', {
                        skin: '请填写报告名称',
                        closeBtn: 0
                    });
                    return;
                }
                if (checkArray.length == 0) {
                    layer.alert('请添加成员！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                    return;
                }
                if (checkArray.length  < 2) {
                    layer.alert('请添加成员！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                    return;
                }
            var amountNs = $("#amountName").val();
           
            if (amountNs == 0) {
                layer.alert('请选择报告！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
                return;
            }
            for (var i = 0; i < checkArray.length; i++) {
                userIDList += $(checkArray[i]).attr("data-uid") + ',';
                ansIDList+=$(checkArray[i]).attr("data-tempansweraddid")+',';
            }
           
            $.ajax({
                url: "Ajax/GroupReportAdd.ashx?OperationType=CreateGroupReport",
                type: "POST",
                data: {
                    reportName: $("#reportName").val(),
                    amountCode: $(checkArray[0]).attr('data-amountcode'),
                    userIDList: userIDList,
                    ansIDList:ansIDList
                },
                dataType: "text",
                success: function (data) {
                    if (data == "True") {
                        layer.msg('生成成功！', { icon: 1, time: 2000 }, function () { window.location.href = "GroupReport.aspx" });
                    }
                    else {
                        layer.msg('生成失败！', { icon: 1, time: 2000 });
                    }
                }
            })
        }
        $(document).on("click", "[data-ck=addAllCheck]", function () {

            var checkArray = $("#tableGridAdd").find("input[type=checkbox]").not("[data-ck=addAllCheck]");

            for (var i = 0; i < checkArray.length; i++) {
                checkArray[i].checked = $(this)[0].checked;
            }
        })
        $(document).on("click", ".TempGroupReportAdd", function () {
            var isChecked = true;
            var checkArray = $(".TempGroupReportAdd")
            for (var i = 0; i < checkArray.length; i++) {
                if(!checkArray[i].checked)
                {
                    isChecked = false;
                }
            }
            $("[data-ck=addAllCheck]")[0].checked = isChecked;
        })

        function BulkDelete() {
            var checkArray = $("#tableGridAdd").find("input[type=checkbox]").not("[data-ck=allCheck]");

            var isDelete = false;

            for (var i = 0; i < checkArray.length; i++) {

                if (checkArray[i].checked) {

                    isDelete = true;
                }
            }
            if (!isDelete) {
                layer.alert("请选择要删除的数据", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            }
            layer.confirm('确定删除选中的数据吗?', {
                btn: ["确定", "取消"]
            }, function () {
                for (var i = 0; i < checkArray.length; i++) {
                    if (checkArray[i].checked) {
                        $("[data-tempansweraddid=" + $(checkArray[i]).attr("data-tempansweraddid") + "]").parent().parent().remove();
                        $("[name='checkboxs']").removeAttr("checked");//取消选中
                    }
                }
                SortTableTd();
                layer.closeAll();
            })

        }    
        /*为空*/
        function trim(str) {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }

        /////全选
        //$("#checkboxGrid").click(function () {//全选 
        //    if (this.checked) {
        //        $("#tableGrid :checkbox").prop("checked", true);
        //    }
        //    else {
        //        $("#tableGrid :checkbox").prop("checked", false);
        //    }
        //});


    </script>
</asp:Content>
