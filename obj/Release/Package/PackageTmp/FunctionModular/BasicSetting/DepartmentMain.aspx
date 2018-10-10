<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DepartmentMain.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.DepartmentMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" id="icons" href="" />
    <!-- Bootstrap Styles-->
    <link href="/CSS/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="../../CSS/custom-styles.css" rel="stylesheet" />
    <link href="../../CSS/custom-styles_1.css" rel="stylesheet" />
    <link href="../../CSS/font-awesome.min.css" rel="stylesheet" />
    <link href="../../CSS/base.css" rel="stylesheet" />
    <link href="../../CSS/rysz.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <link href="../../JS/TreeTables/vsStyle/jquery.treeTable.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/TreeTables/jquery.treeTable.js"></script>
    <script src="../../JS/jquery.metismenu.js"></script>

    <script src="../../JS/custom-scripts.js"></script>
    <!-- 左侧下拉框 Js 结束 -->
    <!-- Bootstrap Js -->
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerForm.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>

    <style>
        .l-tree li {
            text-align: left;
        }

        #treeTable > tbody > tr > td:first-of-type {
            text-align: left;
        }
        #treeTable > tbody > tr > td{
            word-wrap:break-word;
            word-break:break-all;
        }
    </style>

    <div class="content">
        <!-- 新建角色 -->
        <div class="row">
            <div style="padding-bottom: 20px" class="col-md-12 col-sm-12 col-xs-12">
                <a class="btn btn-sm pull-right" name="QX_NewDepartment" data-toggle="modal" onclick="DepartmentTX()" data-target=".x_new" style="border: 1px solid orange; color: orange">+新建部门</a>
            </div>
        </div>
        <!-- 表格 -->
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" style="width: 100%" id="treeTable">
                            <thead>
                                <tr>
                                    <th class="text-center" style="width: 15%">部门名称</th>
                                    <th class="text-center" style="width: 15%">成员数量</th>
                                    <th class="text-center" style="">部门描述</th>
                                    <th class="text-center" style="width: 25%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                        <!--<div class="dataTables_info" id="tableGrid_info" role="status" aria-live="polite">每页显示10条，共 30 项</div><div class="dataTables_paginate paging_simple_numbers" id="tableGrid_paginate"><a class="paginate_button previous disabled" aria-controls="tableGrid" data-dt-idx="0" tabindex="0" id="tableGrid_previous">上页</a><span><a class="paginate_button current" aria-controls="tableGrid" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="tableGrid" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="tableGrid" data-dt-idx="3" tabindex="0">3</a><a class="paginate_button " aria-controls="tableGrid" data-dt-idx="4" tabindex="0">4</a></span><a class="paginate_button next" aria-controls="tableGrid" data-dt-idx="5" tabindex="0" id="tableGrid_next">下页</a></div>-->
                    </div>

                </div>
            </div>
        </div>
    </div>
    <input id="D_ID" type="text" style="display: none" />
    <input type="hidden" name="T_parent_val" id="T_parent_val" value="0">
    <!-- 新建部门色弹框 -->
    <%--    <div class="modal fade x_new" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog" style="width: 600px">
            <div class="modal-content" style="margin-top: 35%; width: 100%">
                <h4 class="modal-title text-center xia_title">新建部门
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  text-right">
                            <label class="col-sm-3  col-xs-4 control-label">*部门名称:</label>
                            <div class="col-sm-6  col-xs-6">
                                <input id="D_ID" type="text" style="display: none">
                                <input id="D_name" maxlength="20" type="text" style="width: 100%" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">隶属部门:</label>
                            <div class="col-sm-6 col-xs-6">
                                <input maxlength="20" id="T_parent" name="T_parent" type="text" style="width: 100%">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">部门描述:</label>
                            <div class="col-sm-6  col-xs-6">
                                <textarea id="D_Remark" style="width: 100%; height: 200px" maxlength="500" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="DeInsert()" id="Sumit" type="button" class="btn btn-sm x_btn f14">保存</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>--%>
    <!-- 添加下级弹框 -->
    <div class="modal fade x_add" id="Insertmdoels" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog" style="width: 600px">
            <div class="modal-content" style="margin-top: 35%; width: 100%">
                <h4 class="modal-title text-center xia_title" id="TitleAdd">添加下级
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  text-right">
                            <label class="col-sm-3  col-xs-4 control-label">*部门名称:</label>
                            <div class="col-sm-6  col-xs-6">
                                <input id="editRoleID" type="text" style="display: none">
                                <input id="editRoleName" maxlength="20" type="text" style="width: 100%" onchange="txtNameCheck(this)" onblur="txtNameCheck(this)" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">隶属部门:</label>
                            <div class="col-sm-6 col-xs-6">
                                <input maxlength="20" id="lishuDepart" readonly="true" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">部门描述:</label>
                            <div class="col-sm-6  col-xs-6">
                                <textarea id="editRoleDescribe" style="width: 100%; height: 200px" maxlength="500" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="DeInsert()" type="button" class="btn btn-sm x_btn f14">保存</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 修改部门弹框 -->
    <div class="modal fade" id="editRole" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog" style="width: 600px;">
            <div class="modal-content" style="margin-top: 35%; width: 100%">
                <h4 class="modal-title text-center xia_title">修改部门
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  text-right">
                            <label class="col-sm-3  col-xs-4 control-label">*部门名称:</label>
                            <div class="col-sm-6  col-xs-6">
                                <input id="editRoleID" type="text" style="display: none">
                                <input id="editRoleName" maxlength="20" type="text" style="width: 100%" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">*隶属部门:</label>
                            <div class="col-sm-6 col-xs-6">
                                <input maxlength="20" type="text" style="width: 100%" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">部门描述:</label>
                            <div class="col-sm-6  col-xs-6">
                                <textarea id="editRoleDescribe" style="width: 100%; height: 200px" maxlength="500" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditRoleValue()" type="button" class="btn btn-sm f14 x_btn">保存</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right ml20">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 删除部门弹框 -->
    <div class="modal fade x_del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">提示
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <p class="f16 c666 pl30 pr20 mt15 pb50">删除后将同步清除本部门在回收站中的成员及其数据，确定删除吗？</p>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">确定</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <script src="../../JS/layer.js"></script>
    <script>

        //非法字符
        var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;


        var navName = '/FunctionModular/BasicSetting/DepartmentMain.aspx';
        //隶属部门ID
        var Dep_ID = 0;
        //var D_ID = 0;//部门ID
        var TitleAdd;
        function DepartmentTX() {

            Empty();
            OperationType = "add";
            $("#TitleAdd").html("新增部门");
            $('#Insertmdoels').modal('show');
            $('#lishuDepart').removeAttr("disabled");
            $("#D_name").val();
            $("#D_Remark").val("");
            $("#D_ID").val("");
            $("#lishuDepart").val("");
        }

        OnLoadTreeCom();
        var lishuTree;
        function OnLoadTreeCom() {
            lishuTree = $("#lishuDepart").ligerComboBox({
                width: "100%",
                selectBoxWidth: "85%",
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    onBeforeSelect: function (node) {
                        Dep_ID = node.data['id'];
                    },
                    url: 'Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }
            });
        }
        OnLoadDEP();

        function OnLoadDEP() {
            $.ajax({
                type: "POST",
                url: "Ajax/DepartmentMain.ashx",
                data: "Remark=InitDep",//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        var obj1 = eval('[' + msg + ']');
                        var $treeTable = $("#treeTable");
                        for (var i = 0; i < obj1[0].data.length; i++) {
                            var tableHtmltd = "<td>" + obj1[0].data[i][1] + "</td><td>" + obj1[0].data[i][3] + "</td><td>" + obj1[0].data[i][2] + "</td><td><button class=\"btn btn-link\" name='QX_NewsDepartment' onclick='AddNext(" + obj1[0].data[i][0] + ")' >添加下级</button>  <button name='QX_UpdateDepartment' class=\"btn btn-link\" onclick='UpdateDep(" + obj1[0].data[i][0] + ")' >修改</button>    <button class=\"btn btn-link\" name='QX_DeleteDepartment' onclick='D_delete(this)'value=" + obj1[0].data[i][0] + ">删除</button></td>";
                            var TableHtml = "<tr id=\"" + obj1[0].data[i][0] + "\" pId=\"" + obj1[0].data[i][5] + "\">" + tableHtmltd + "</tr>";
                            $treeTable.append(TableHtml);
                        }
                        DrawOption();
                    }
                }
            });

        }

        function DrawOption() {
            var $treeTable = $("#treeTable");
            var option = {
                theme: 'vsStyle',
                expandLevel: 1,
                beforeExpand: function ($treeTable, id) {
                    if ($('.' + id, $treeTable).length) { return; }
                },
                afterExpand: function ($treeTable, id) {
                    alert(id);
                }
                ,
                onSelect: function ($treeTable, id) {
                    alert(1);
                }

            };
            $treeTable.treeTable(option);
        }


        function TabEmpty() {
            $("#treeTable  tbody").empty("");
            OnLoadDEP();
        }

        function desem() {
            $('#Sumit').removeAttr("disabled")  //部门解禁 禁用
        }
        function IsChildElement(Pid, Cid) {
            if (Pid == Cid)
                return 0;//属于Pid下的子节点
            if (Cid == 0)
                return 2;//已查到最顶级，不属于Pid下的子节点
            var childElement = $("#treeTable tr[id=" + Cid + "]");
            if (childElement.length == 0)
                return 1;//未找到该节点的父节点，刷新再重试
            var _pid = childElement.eq(0).attr("pid");
            if (_pid == 0)
                return 2;//已查到最顶级，不属于Pid下的子节点
            if (Pid == _pid)
                return 0;//属于Pid下的子节点
            else
                return IsChildElement(Pid, _pid);//查询该节点的父节点是否为Pid下子节点
        }

        function DeInsert() {
            $("#Sumit").attr({ "disabled": "disabled" });
            setInterval('desem()', 2000);
            var D_name = $("#editRoleName").val();

            var reg = /\s/;
            if (reg.exec(D_name) != null) {
                layer.alert('部门名称不能包含空格！', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                });
                return;
            }
            var D_Remark = $("#editRoleDescribe").val();
            var D_ID = $("#D_ID").val();
            if (D_ID != 0) {
                Updete();
                return;
            }
            if (D_ID == null || D_ID == 0 || D_ID == "") {
                D_ID = "空";
            }
            /*为空*/
            function trim(str) {
                return str.replace(/(^\s*)|(\s*$)/g, "");
            }
            if (trim(D_name) == "") {
                layer.alert('请输入部门名称！', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                });
                return;
            }
            //非法字符
            var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;


            if (!reg.test(D_name)) {
                layer.alert('部门名称不可以为特殊字符!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                    //shift: 2,//动画效果
                })
                return;
            }

            var chiID = $("#lishuDepart_val").val();

            $.ajax({
                url: "Ajax/Department.ashx",
                type: "post",
                data: { D_name: D_name, type: 7, D_ID: D_ID, D_chiID: chiID },
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data.trim() == "True") {
                        layer.alert('该部门已存在！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                        return;
                    }
                    else {
                        insertinto()
                    }
                }
            })
        }

        ///添加
        function insertinto() {
            var D_name = $("#editRoleName").val();
            var D_chiID = $("#lishuDepart_val").val();
            var D_Remark = $("#editRoleDescribe").val();

            if (OperationType == "add") {
                if (D_name == "" || D_name == null) {
                    layer.alert('请输入部门名称!', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0,
                        //shift: 1,//动画效果
                    })
                    return;
                }
                /*为空*/
                function trim(str) {
                    return str.replace(/(^\s*)|(\s*$)/g, "");
                }

                if (trim(D_name) == "") {
                    layer.alert('请输入部门名称', {
                        skin: 'layui-layer-lan',
                        closeBtn: 0
                    });
                    return;
                }
                //非法字符
                var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;


                if (!reg.test(D_name)) {
                    layer.alert('部门名称不可以为特殊字符!', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0,
                        //shift: 1,//动画效果
                    })
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: "Ajax/DepartmentMain.ashx",
                    data: {
                        Remark: "DepAdd",
                        D_name: D_name,
                        D_chiID: D_chiID,
                        D_Remark: D_Remark
                    },
                    success: function (result) {

                        if (result = "1") {
                            layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {
                                window.location = "DepartmentMain.aspx"
                            });
                            $('#Insertmdoels').modal("hide");
                            $("#D_name").val("");
                            $("#D_Remark").val("");
                            $("#D_ID").val("");
                            $("#lishuDepart").val("");
                            //window.location = "DepartmentMain.aspx"
                            // OnLoadDEP();
                            //DrawOption()
                        }
                        else {
                            layer.msg("添加失败", { time: 2000, icon: 6 }, function () {

                            });

                        }
                    }
                });
            }
        }

        //删除
        function D_delete(D_ID) {

            var classs = D_ID.parentNode.parentNode.childNodes[0].childNodes[1].className;
            if (classs == "vsStyle_active_node vsStyle_shut" || classs == "vsStyle_active_node vsStyle_open") {
                layer.alert('该部门下存在归属部门，请将其移除再进行此项操作', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                })
                return;
            }
            var wei = D_ID.parentNode.parentNode.childNodes[1].childNodes[0].nodeValue;

            if (wei != '0' && wei != "") {
                layer.alert('该部门下有' + wei + '名成员，请将其转移成员后,再进行此项操作!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                })
                return;
            }
            var D_ID = D_ID.getAttribute('value')
            //var childDepart = $("." + D_ID + "")
            //if (childDepart.length > 0) {
            //    layer.alert('该部门已存在!', {
            //        skin: 'layui-layer-lan', //样式类名
            //        closeBtn: 0
            //    })
            //    return;
            //}

            //if()
            layer.confirm('删除后将同步清除本部门在回收站中的成员及其数据，确定删除吗？', {
                btn: ['是', '否'] //按钮
            }, function () {
                //先提示删除部门后会清空该部门相关的所有数据，点击确定先删除相关用户
                $.ajax({
                    type: "post",
                    data: { Remark: "befor_delete", D_ID: D_ID },
                    url: "Ajax/DepartmentMain.ashx",
                    success: function (msg) {
                        if (msg == "0") {
                            layer.msg("删除失败", { time: 2000, icon: 6 }, function () {
                            });
                        } else {
                            //删除相关数据成功后再删部门
                            $.ajax({
                                type: "post",
                                data: { Remark: "de_del", D_ID: D_ID },
                                url: "Ajax/DepartmentMain.ashx",
                                success: function (result) {
                                    if (result = "1") {
                                        layer.msg("删除成功", { time: 2000, icon: 1 }, function () {
                                            window.location = "DepartmentMain.aspx"
                                        });

                                    } else {
                                        layer.msg("删除失败", { time: 2000, icon: 6 }, function () {
                                        });
                                    }
                                }
                            });
                        }
                    }
                });
            });

        }
        var Membership = "";

        function UpdateDep(obj, Dname) {
            Empty();

            OnLoadTreeCom(obj);
            Dep_ID = obj;
            OperationType = "up";
            $("#Sumit").text("保存");
            $("#TitleAdd").html("修改部门");
            $('#lishuDepart').removeAttr("disabled")  //隶属部门禁用
            $.ajax({
                type: "POST",
                data: { type: 5 },
                dataType: "html",
                url: "Ajax/DepartmentMain.ashx",
                data: { Remark: "sel_ID", UP_D_ID: Dep_ID },
                success: function (result) {

                    result = eval('(' + result + ')');
                    $("#editRoleName").val(result._d_name);
                    Dep_ID = result._d_chiid;
                    $("#D_ID").val(result._d_id)

                    $("#lishuDepart").ligerGetComboBoxManager().selectValue(result._d_chiid);
                    if ($("#lishuDepart").val() == "" || $("#lishuDepart").val() == "null") {
                        $("#lishuDepart").val("无")
                    }
                    else {
                        $("#lishuDepart").ligerGetComboBoxManager().selectValue(result._d_chiid);
                    }

                    $("#editRoleDescribe").val(result._d_remark);
                }
            })

            $('#Insertmdoels').modal('show');
        }

        //修改
        function Updete() {

            var D_name = $("#editRoleName").val();
            var D_Remark = $("#editRoleDescribe").val();
            var D_ID = $("#D_ID").val();
            var D_chiID = Dep_ID;
            if ($("#lishuDepart").val().length == 0)
                D_chiID = 0;

            if (D_chiID == D_ID) {
                layer.alert('录属部门不能关联自己!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                    //shift: 1,//动画效果
                })
                return;
            }
            var isChild = IsChildElement(D_ID, D_chiID);
            if (isChild != 2) {
                if (isChild == 0) {
                    layer.alert('所选隶属部门属于该部门下的子部门，请重新选择！', {
                        skin: 'layui-layer-lan',
                        closeBtn: 0
                    });
                    return;
                }
                if (isChild == 1) {
                    layer.alert('未找到隶属部门，请刷新后重试！', {
                        skin: 'layui-layer-lan',
                        closeBtn: 0
                    });
                    return;
                }
            }
            /*为空*/
            function trim(str) {
                return str.replace(/(^\s*)|(\s*$)/g, "");
            }
            if (trim(D_name) == "") {
                layer.alert('请输入部门名称!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }
            //非法字符
            var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;


            if (!reg.test(D_name)) {
                layer.alert('部门名称不可以为特殊字符!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                    //shift: 1,//动画效果
                })
                return;
            }

            $.ajax({
                url: "Ajax/Department.ashx",
                type: "GET",
                data: { D_name: D_name, type: 7, D_ID: D_ID },
                dataType: "text",
                success: function (data) {
                    //得到录属部门
                    if (data.trim() == "True") {
                        layer.alert('该部门已存在！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                        return;
                    }
                    else {
                        $.ajax({
                            type: "POST",
                            dataType: "html",
                            url: "Ajax/DepartmentMain.ashx",
                            data: { Remark: "DepUp", D_name: D_name, D_Remark: D_Remark, UP_D_IDS: D_ID, ChildID: D_chiID },
                            success: function (result) {
                                if (result = "1") {
                                    layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {
                                        // $("#treeTable").DataTable().draw();
                                        //$("#treeTable  tr:not(:first)").html("");
                                        window.location = "DepartmentMain.aspx"
                                    });
                                    $('#Insertmdoels').modal("hide");
                                    $("#editRoleName").val("");
                                    $("#editRoleDescribe").val("");
                                    $("#D_ID").val("");
                                    $("#lishuDepart").val("");
                                    // TabEmpty();
                                }
                                else {
                                    layer.msg("保存失败", { time: 2000, icon: 6 }, function () { });
                                }
                            }
                        })
                    }
                }
            })
        }
        var OperationType = "";//add添加  up修改
        //添加下级
        function AddNext(id) {
            Empty();

            lishuTree.selectValue();

            $("#lishuDepart").ligerGetComboBoxManager().selectValue(id);
            Dep_ID = id;
            OperationType = "add";
            $("#Sumit").text("保存");
            $("#TitleAdd").html("添加下级");
            $('#lishuDepart').attr("disabled", "disabled");  //隶属部门禁用
            // $("#lishuDepart").attr("style", " width: 278px;");
            $('#Insertmdoels').modal('show');
            $("#editRoleName").val();
            $("#editRoleDescribe").val("");

            $('#lishuDepart').val($('#treeTable').find('tr[id=' + id + ']').find('td').eq(0).text());
            $("#D_ID").val('');

        }

        function Empty() {
            $("#Insertmdoels").find("input").val("");
            $("#Insertmdoels").find("textarea").val("");
        }
        //判断名称格式与长度
        function txtNameCheck(obj) {
            var txt = $("#editRoleName").val();
            if (txt.length > 20) {
                //var a = $(this).find("[data-bv-for=txtName]");
                txt = txt.substring(0, 20);
                $("#editRoleName").val(txt);
                //$("small[data-bv-for=txtName]").text('');
                $("#editRoleName").css("border-color", "#2b542c");
                // $("#txtName_LB").css("color", "#2b542c");
            }
        }

    </script>
</asp:Content>
