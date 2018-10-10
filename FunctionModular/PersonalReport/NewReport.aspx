<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="NewReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.NewReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
     <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">心理测验</a></li>
                <li><a href="#">个体报告</a></li> 
                 
            </ol>
        </div>
    </div> 
    

    <div class="row" style="margin-left: 9px;">
        <div class="col-md-2 col-sm-12 col-xs-12">
            <select class="selectpicker" data-done-button="true" data-live-search="true" id="Sel_AmountType">
            </select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-left: 30px;">
            <input id="Department_IDs" name="Department" style="top: 0; height: 20px; text-align: left" placeholder="选择部门" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12">
            <select id="testType" class="form-control">
                <option value="">全部
                </option>
                <option value="日常测验">日常测验</option>
                <option value="普测">普测</option>
            </select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12">
            <select id="pushStatus" class="form-control">
                <option value="0">全部</option>
                <option value="1">未授权</option>
                <option value="2">已授权</option>
            </select>
        </div>
        <div class="col-md-1 col-sm-12 col-xs-12" style="width: 135px;">

            <input id="loginName" type="text" class="form-control" placeholder="登录名/姓名" />

        </div>
        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                    <button class="btn btn-primary btn-sm" id="go_search" name=" QX_SearchSelect"><i class="fa fa-search "></i>查询</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <%-- <div class="pull-left white">
                    <button class="btn btn-primary btn-sm"data-toggle="modal" data-target="#myModal"><i class="fa fa-cog"></i>报告设置</button>
            </div>--%>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">报告设置
                        </h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>项目</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>测验简介</td>

                                </tr>
                                <tr class="even gradeC">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>有效性分析</td>

                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>测试结果</td>

                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>结果分析</td>

                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>心理建议</td>

                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>原始答卷</td>

                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                        <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                            关闭
                        </button>
                        <button type="button" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </div>

    <div class="row" style="margin-top: 20px;">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <%--   <label>提醒方式：</label>
                            <label>
                               <input id="webLetter" type="checkbox" value="" />站内信
                            </label>
                            <label>
                                <input id="email" type="checkbox" value="" />邮箱
                            </label>--%>
            <div class="panel-body">
                <div class="table-responsive">

                    <table class="table table-striped table-bordered table-hover" id="tableGrid">
                        <thead>
                            <tr>

                                <th class="text-center" style="width: 10px">
                                    <input id="allCheck" onclick="AllCheck()" type="checkbox" value="" /></th>
                                <th class="text-center">序号</th>
                                <th class="text-center">登录名</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">部门</th>
                                <th class="text-center">量表名称</th>
                                <th class="text-center">提交时间</th>
                                <th class="text-center">报告授权</th>
                                <th class="text-center">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
                <div class="row">

                    <form id="form1" runat="server" style="float: left; margin: 0px 5px;">
                        <input type="hidden" id="Ahidden" name="Ahidden" />
                       <%-- <button runat="server" class="btn  btn-blues  btn-sm"  onclientclick="return Test()"  onclick="btn_import_07_click"><i class="icon-signout"></i>数据导出</button>--%>
                        <asp:Button ID="Button1"  class="btn  btn-blues  btn-sm" runat="server" Text="数据导出" onclientclick="return Test()" OnClick="btn_import_07_click" />
                    </form>

                    <button onclick='RBdeletes()' class="btn btn-reds btn-sm" name="QX_RBdeletes"><i class="glyphicon glyphicon-trash"></i>批量删除</button>

                  <%--  <button onclick="BulkRemind()" class="btn  btn-greens btn-sm" name="QX_BulkRemind">
                        <i class="icon-bookmark"></i>报告授权</button>--%>
                </div>

            </div>
            <!--End Advanced Tables -->
        </div>
    </div>


    <input type="hidden" id="DepIDs" />
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <link href="../../Font-Awesome/css/font-awesome.min.css" rel="stylesheet" />
    <script>
        var navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        function Test() {
            var Anserid = "";
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        Anserid += checkbox[i].value + ",";

                    }
                }
            }
            $("#Ahidden").val(Anserid);
            return true;
        }
        var UserIDs = "";
        initSelectInput("operationType=LoadAmountName", "Sel_AmountType", "量表名称");//初始化量表名称
        OnLoadTreeComD();//加载部门
        var amountTypeID = 0;
        var departmentID = 0;
        var testTypeID = 0;
        var pushStatusID = 0;
        var loginName = '';
        var tableGrid;
        BindGrid();
        function BindGrid() {
            amountTypeID = $("#Sel_AmountType").find("option:selected").val();//量表名称的id
            departmentID = $("#DepIDs").val();
            testTypeID = $("#testType").find("option:selected").val();
            pushStatusID = $("#pushStatus").find("option:selected").val();
            //alert(amountTypeID)
            //alert(departmentID)
            //alert(testTypeID)
            //alert(pushStatusID)
            loginName = $("#loginName").val();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tableGrid = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: true,
                        aTargets: [0]
                    }
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/PersonalReport.ashx?operationType=Bind",
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
                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&amountTypeID=' + amountTypeID + '&departmentID=' + departmentID + '&testTypeID=' + testTypeID + '&pushStatusID=' + pushStatusID + '&loginName=' + loginName;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    $('td:eq(0)', row).html(" <input class=childCheck id='" + data[0] + "' data-name=" + data[5] + " value=" + data[0] + " name=checkbox type=\"checkbox\" value=\"" + data[0] + "\" />");
                    var operation = "";
                    var operations = "";
                    //没有发送
                    //if (data[7] == 2) {
                    //    operation = " <button  class=\"btn btn-link\" style=\"color:#000000\"  data-id='" + data[9] + "' data-name='" + data[7] + "'>已授权</button>";
                    //} else 

                    if (data[7] == 2) {
                        operation = " <button  class=\"btn btn-link\" style=\"color:#000000\"  data-id='" + data[9] + "' data-name='" + data[7] + "'>已授权</button>";
                    }
                    else {
                        operation = " <button  class=\"btn btn-link\" data-id='" + data[9] + "' data-name='" + data[7] + "' onclick=Remind(" + data[0] + "," + data[9] + ")>未授权</button>";

                    }
                    if (data[14] == "1") {
                        if (data[12] == "LB_14814373314360") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRSS(" + data[0] + ",1," + data[13] + ")>查看</button>";

                        }
                        else if (data[12] == "LB_14809941842260" || data[12] == "LB_14811084564180" || data[12] == "LB_14810118744850") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRS(" + data[0] + ",3," + data[13] + ")>查看</button>";

                        } else if (data[12] == "LB_14809227671290") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRS(" + data[0] + ",4," + data[13] + ")>查看</button>";
                        }
                        else if (data[12] == "LB_14809953564280" || data[12] == "LB_14809270976120" || data[12] == "LB_14810979035220") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRS(" + data[0] + ",6," + data[13] + ")>查看</button>";
                        }
                        else if (data[12] == "LB_14811852410670") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRS(" + data[0] + ",8," + data[13] + ")>查看</button>";
                        }
                        else if (data[12] == "LB_14812009852840") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRS(" + data[0] + ",9," + data[13] + ")>查看</button>";
                        } else if (data[12] == "LB_14811658719780") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRS(" + data[0] + ",901," + data[13] + ")>查看</button>";
                        }
                        else if (data[12] == "LB_14811661311050") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRSS(" + data[0] + ",11," + data[13] + ")>查看</button>";
                        } else if (data[12] == "LB_14812024172130") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookRSS(" + data[0] + ",13," + data[13] + ")>查看</button>";
                        } else if (data[12] == "LB_14811899636250") {
                            operations = " <button class=\"btn btn-link\"  name='QX_SelectPersonalReport' onclick=LookMMPI(" + data[0] + ")>查看</button>";
                        }
                        else {
                            operations = " <button class=\"btn btn-link\" name='QX_SelectPersonalReport' onclick=LookR(" + data[0] + "," + data[13] + ")>查看</button>";
                        }
                    } else {
                        operations = " <button class=\"btn btn-link\" name='QX_SelectPersonalReport' onclick=LookRNew(" + data[0] + "," + data[13] + ")>查看</button>";
                    }
                    operations += " <button  class=\"btn btn-link\" name='QX_DelectPersonalReport'data-name=" + data[5] + " value=" + data[0] + " onclick='RBdelete(this)'>删除</button>";
                    $('td:eq(7)', row).html(operation);
                    $('td:eq(8)', row).html(operations);
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                },

                "oLanguage": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "_MENU_ 记录/页",
                    "sZeroRecords": "没有查询结果",
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
        //查询

        $(document).on("click", "#go_search", function () {

            amountTypeID = $("#Sel_AmountType").find("option:selected").val();
            departmentID = $("#DepIDs").val();
            testTypeID = $("#testType").find("option:selected").val();
            pushStatusID = $("#pushStatus").find("option:selected").val();
            loginName = $("#loginName").val();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        });

        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "../HeartEvaluation_DistributionRecord/Ajax/DistributionRecord.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item["_amount_id"] + "'>" + item["_amount_name"] + "</option>");

                    });
                    $("#" + controlname).attr("multiple", false);

                    $("#" + controlname).selectpicker('refresh');

                }
            });
        }

        function Remind(obj, Uid) {
            var receiveID = obj;

            RemindByWebState(receiveID)
            //alert(receiveID)
            //var webLetter = $("#webLetter")[0].checked;
            //var email = $("#email")[0].checked;
            //if (!webLetter && !email) {
            //    layer.alert("选选择要推送的报告！", {
            //        skin: "layui-layer-lan",
            //        closeBtn: 0
            //    })
            //    return;
            //}
            //if (webLetter && email) {
            //    RemindByEmail(receiveID, Uid);
            //    RemindByWebLetter(receiveID, Uid);
            //    return;
            //}
            //if (webLetter && !email) {
            //    RemindByWebLetter(receiveID, Uid);
            //    return;
            //}
            //if (!webLetter && email) {
            //    RemindByEmail(receiveID, Uid);
            //    return;
            //}

        }
        //推送站内信
        function RemindByWebLetter(receiveID, UIDs) {

            $.ajax({
                url: "Ajax/PersonalReport.ashx?operationType=SendWrite",
                data: { receveid: receiveID, title: "测评提醒", content: "您有测评未进行测试！", uid: UIDs },
                type: 'get',
                async: false,
                success: function (result) {
                    if (result == "True") {
                        layer.msg('推送成功！', { icon: 1 });
                        $("#tableGrid").DataTable().draw();
                    }
                    else {
                        layer.msg('推送失败！', { icon: 1 });

                    }
                }
            })
        }
        //推送Email
        function RemindByEmail(receiveID, UIDs) {

            $.ajax({
                url: "Ajax/PersonalReport.ashx?operationType=RemindByEmail",
                data: { receveid: receiveID, title: "测评提醒", content: "您有测评未进行测试！", uid: UIDs },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('推送成功！', { icon: 1 });
                        $("#tableGrid").DataTable().draw();
                    }
                    else {
                        layer.msg('推送失败！', { icon: 1 });

                    }
                }
            })
        }

        //批量推送-站内信，邮箱
        function BulkRemindByWebLetter() {
            var tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var userIDList = '';
            var webLetter = $("#webLetter")[0].checked;
            var email = $("#email")[0].checked;
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {
                        var User = "";
                        Cvalue = checkbox[i].value;
                        var test = $("#" + Cvalue).parent().parent().find("td:eq(6)>button:eq(0)");
                        User = test.attr("data-id");
                        SendState = test.attr("data-name");
                        if (SendState != 2) {
                            U_IDs += Cvalue + ",";
                        }
                        UserIDs += User + ",";

                    }
                }
                if (U_IDs.length > 0) {
                    ///要写
                    U_IDs = U_IDs.substring(0, U_IDs.length - 1)
                    userIDList = U_IDs;
                    if (!webLetter && !email) {
                        layer.alert("选选择要推送的报告！", {
                            skin: "layui-layer-lan",
                            closeBtn: 0
                        })
                        return;
                    }
                    if (webLetter && email) {
                        RemindByEmail(userIDList, UserIDs);
                        RemindByWebLetter(userIDList, UserIDs);
                        return;
                    }
                    if (webLetter && !email) {
                        RemindByWebLetter(userIDList, UserIDs);
                        return;
                    }
                    if (!webLetter && email) {
                        RemindByEmail(userIDList, UserIDs);
                        return;
                    }
                }
            }

        }

        /*---产看MMPI报告---*/
        function LookMMPI(AID) {
            window.open("MMPI_Report.aspx?A_ID=" + AID);
        }


        function LookR(vals, AmountType) {
            //location.href = "LookReport.aspx?A_ID=" + vals + "";
            window.open("LookReport.aspx?A_ID=" + vals + "&type=2" + "&AmountType=" + AmountType + "");
        }
        //特殊量表
        function LookRS(vals, types, AmountType) {
            window.open("SpecialReport.aspx?A_ID=" + vals + "&types=" + types + "&AmountType=" + AmountType + "");
        }
        //特殊量表M
        function LookRSS(vals, types, AmountType) {
            window.open("SpecialReportM.aspx?A_ID=" + vals + "&types=" + types + "&AmountType=" + AmountType + "");
        }
        function LookRNew() {
            window.open("LookReport.aspx?A_ID=" + vals + "&type=2" + "&AmountType=" + AmountType + "");
        }
        //数据导出

        //$(document).on("click", "[name=checkbox]", function () {
        //    var ss = $(this).val();

        //    UserIDs += ss + ",";

        //    $("#Ahidden").val(UserIDs);
        //});
        //报告导出
        function printPage() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint-->";
            eprnstr = "<!--endprint-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr));
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();


        }

        //function GetExcel()
        //{
        //    $.ajax({
        //        url: "Ajax/PersonalReport.ashx?operationType=GetExcel",
        //        data: { Auserid: U_IDs },
        //        type: 'get',
        //        success: function (result) {

        //        }
        //    })

        //}
        //加载部门表
        function OnLoadTreeComD() {
            $("#Department_IDs").ligerComboBox({
                width: 150,
                selectBoxWidth: 150,
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
                        $("#DepIDs").val(node.data['id']);
                    },
                    url: '../BasicSetting/Ajax/DepartmentMain.ashx?Remark=OnLoadDep&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }
            });
        }
        //单个删除
        function RBdelete(obj) {
            var name = obj.getAttribute("data-name");
            var U_ID = obj.value;
            layer.confirm("确定要将此项个体报告放入回收站中吗？", {
                btn: ["是", "否"]
            }, function () {
                $.ajax({
                    url: "Ajax/PersonalReport.ashx?operationType=RBdelete",
                    data: { receveid: U_ID, name: name },
                    type: 'get',
                    success: function (result) {
                        if (result == "True") {
                            layer.msg('删除成功！', { icon: 1 });
                            $("#tableGrid").DataTable().draw();
                        }
                        else {
                            layer.msg('删除失败！', { icon: 1 });

                        }
                    }
                });
            })
        }
        //批量删除
        function RBdeletes() {
            var checkbox = document.getElementsByName("checkbox");
            var isDelete = false;
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                var name = "";
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        U_IDs += checkbox[i].value + ",";
                        name += checkbox[i].getAttribute("data-name") + ',';
                        isDelete = true;
                    }

                }
                if (U_IDs.length > 0) {
                    ///要写
                    U_IDs = U_IDs.substring(0, U_IDs.length - 1);

                    layer.confirm("确定要将此项个体报告放入回收站中吗? ", {
                        btn: ["确定", "取消"]
                    }, function () {
                        $.ajax({
                            url: "Ajax/PersonalReport.ashx?operationType=RBdelete",
                            data: { receveid: U_IDs, name: name },
                            type: 'get',
                            success: function (result) {
                                if (result == "True") {
                                    layer.msg('删除成功！', { icon: 1 });
                                    $("#tableGrid").DataTable().draw();
                                }
                                else {
                                    layer.msg('删除失败！', { icon: 1 });
                                }
                            }
                        });
                    })
                } else {
                    layer.msg('请选择要删除的报告！', { icon: 1 });
                }
            }

        }

        //推送-最后修改
        function RemindByWebState(receiveID) {

            $.ajax({
                url: "Ajax/PersonalReport.ashx?operationType=SendState",
                data: { receveid: receiveID },
                type: 'get',
                async: false,
                success: function (result) {
                    if (result == "True") {
                        layer.msg('授权成功！', { icon: 1 });
                        $("#tableGrid").DataTable().draw();
                    }
                    else {
                        layer.msg('授权失败！', { icon: 1 });

                    }
                }
            });
        }
        function BulkRemind() {
            var tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var userIDList = '';
            //var webLetter = $("#webLetter")[0].checked;
            //var email = $("#email")[0].checked;
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {
                        var User = "";
                        Cvalue = checkbox[i].value;
                        var test = $("#" + Cvalue).parent().parent().find("td:eq(6)>button:eq(0)");
                        User = test.attr("data-id");
                        SendState = test.attr("data-name");
                        if (SendState != 2) {
                            U_IDs += Cvalue + ",";
                        }
                        UserIDs += User + ",";

                    }
                }
                if (U_IDs.length > 0) {
                    ///要写
                    U_IDs = U_IDs.substring(0, U_IDs.length - 1)
                    RemindByWebState(U_IDs);


                } else {
                    layer.alert("请选择要推送的报告！", {
                        skin: "layui-layer-lan",
                        closeBtn: 0
                    })
                    return;
                }
            }

        }
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
        function AllCheck() {
            var checkbox = document.getElementById("allCheck").checked;//得到主要 checkbox id 的状态
            var items = document.getElementsByName("checkbox"); //得到 name=chec的控件
            for (var i = 0; i < items.length; i++) {//然后循环
                //当前checkbox 的状态 = 所有的控件状态
                items[i].checked = checkbox;
            }
        };

        //设置复选框的CheckboxID        
        $(document).on("click", ".childCheck", function () {

            if (!$(this)[0].checked) {
                $("#allCheck")[0].checked = false;
            }
            else {
                var arrayCheck = $(".childCheck");
                var isSuccess = true;
                for (var i = 0; i < arrayCheck.length; i++) {
                    if (arrayCheck[i].checked == false) {
                        isSuccess = false;
                        break;
                    }
                }
                $("#allCheck")[0].checked = isSuccess;
            }

        });
        $("[name='checkbox']").removeAttr("checked");//取消选中

        //查询按钮的单击事件
        $(document).keyup(function (e) {
            if (e.keyCode === 13) {

                $('#go_search').trigger('click');
            }
        });
    </script>
</asp:Content>
