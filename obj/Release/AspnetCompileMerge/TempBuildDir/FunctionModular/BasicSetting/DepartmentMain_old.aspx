<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DepartmentMain_old.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.DepartmentMain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">基础设置</a></li>
                <li><a href="#" style="color: #666;">部门管理</a></li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="row" style="padding-bottom: 20px">
                <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: right;">
                    <a href="#" onclick="DepartmentTX();" name="QX_NewDepartment" class="btn btn-sm" style="background-color: orange; color: white">+新部门</a>
                </div>
            </div>

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="treeTable">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 15%">部门名称</th>
                            <th class="text-center">部门描述</th>
                            <%--<th class="text-center" style="width: 8%;">成员数量</th>--%>
                            <th class="text-center" style="width: 25%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="Insertmdoels" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 20%;">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center" style="color: #4CB1CF; margin-top: 30px; font-size: 25px; font-weight: 700;" id="TitleAdd">新增部门
                </h4>

                <div class="modal-body">
                    <div class="form-horizontal ">

                        <div class="row">
                            <div class="form-group  text-right">
                                <label class="col-sm-4  col-xs-4 control-label">*部门名称：</label>
                                <div class="col-sm-6  col-xs-8">
                                    <input type="text" maxlength="20" class="form-control" id="D_name" />
                                    <input type="hidden" class="form-control" id="D_ID" />
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label class="col-sm-4  col-xs-4 control-label text-right">隶属部门：</label>
                                <div class="col-sm-6  col-xs-8">
                                    <input type="text" id="T_parent" maxlength="20" name="T_parent" style="top: 0px; height: 25px;" />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal ">
                        <div class="form-group ">

                            <div class="row">
                                <label class="col-sm-4  col-xs-4 control-label text-right">部门描述：</label>
                                <div class="col-sm-6  col-xs-8">
                                    <textarea class="form-control" maxlength="500" style="font-size: 12px; width: 100%; margin-top: 0px; margin-bottom: 0px; height: 182px;" id="D_Remark"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-5 text-right">
                            <button style="background-color: orange; color: white" id="Sumit" class="btn btn-sm" onclick="DeInsert()">
                            </button>
                        </div>
                        <div class="col-sm-2 col-xs-4  text-right">
                            <button class="btn btn-sm" data-dismiss="modal" style="color: white">
                                取消
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <script src="../../JS/TreeTables/jquery.treeTable.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
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
            $("#Sumit").text("保存");
            $("#TitleAdd").html("新增部门");
            $('#Insertmdoels').modal('show');
            $('#T_parent').removeAttr("disabled");
            $("#D_name").val();
            $("#D_Remark").val("");
            $("#D_ID").val("");
            $("#T_parent").val("");
        }

        OnLoadTreeCom();
        function OnLoadTreeCom() {
            $("#T_parent").ligerComboBox({
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
                            var tableHtmltd = "<td>" + obj1[0].data[i][1] + "</td><td>" + obj1[0].data[i][2] + "</td><td><button class=\"btn btn-link\" name='QX_NewsDepartment' onclick='AddNext(" + obj1[0].data[i][0] + ")' >添加下级</button>  <button name='QX_UpdateDepartment' class=\"btn btn-link\" onclick='UpdateDep(" + obj1[0].data[i][0] + ")' >修改</button>    <button class=\"btn btn-link\" name='QX_DeleteDepartment' onclick='D_delete(this)'value=" + obj1[0].data[i][0] + ">删除</button></td>";
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
            var D_name = $("#D_name").val();

            var reg = /\s/;
            if (reg.exec(D_name) != null) {
                layer.alert('部门名称不能包含空格！', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                });
                return;
            }



            var D_Remark = $("#D_Remark").val();
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

            var chiID = $("#T_parent_val").val();

            $.ajax({
                url: "Ajax/Department.ashx",
                type: "GET",
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
            var D_name = $("#D_name").val();
            var D_chiID = $("#T_parent_val").val();
            var D_Remark = $("#D_Remark").val();

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
                            $("#T_parent").val("");
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



            //var wei = D_ID.parentNode.parentNode.childNodes[2].childNodes[0].nodeValue;

            //if (wei != 0 && wei != "") {
            //    layer.alert('该部门下有' + wei + '名成员，请将其转移成员后,再进行此项操作!', {
            //        skin: 'layui-layer-lan', //样式类名
            //        closeBtn: 0
            //    })
            //    return;
            //}
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
                    success: function(msg) {
                        if (msg == "0") {
                            layer.msg("删除失败", { time: 2000, icon: 6 }, function() {
                            });
                        } else {
                            //删除相关数据成功后再删部门
                            $.ajax({
                                type: "post",
                                data: { Remark: "de_del", D_ID: D_ID },
                                url: "Ajax/DepartmentMain.ashx",
                                success: function(result) {
                                    if (result = "1") {
                                        layer.msg("删除成功", { time: 2000, icon: 1 }, function() {
                                            window.location = "DepartmentMain.aspx"
                                        });

                                    } else {
                                        layer.msg("删除失败", { time: 2000, icon: 6 }, function() {
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
            $('#T_parent').removeAttr("disabled")  //隶属部门禁用
            $.ajax({
                type: "POST",
                data: { type: 5 },
                dataType: "html",
                url: "Ajax/DepartmentMain.ashx",
                data: { Remark: "sel_ID", UP_D_ID: Dep_ID },
                success: function (result) {

                    result = eval('(' + result + ')');
                    $("#D_name").val(result._d_name);
                    Dep_ID = result._d_chiid;
                    $("#D_ID").val(result._d_id)

                    $("#T_parent").ligerGetComboBoxManager().selectValue(result._d_chiid);
                    if ($("#T_parent").val() == "" || $("#T_parent").val() == "null") {
                        $("#T_parent").val("无")
                    }
                    else {
                        $("#T_parent").ligerGetComboBoxManager().selectValue(result._d_chiid);
                    }

                    $("#D_Remark").val(result._d_remark);
                }
            })

            $('#Insertmdoels').modal('show');
        }

        //修改
        function Updete() {

            var D_name = $("#D_name").val();
            var D_Remark = $("#D_Remark").val();
            var D_ID = $("#D_ID").val();
            var D_chiID = Dep_ID;
            if ($("#T_parent").val().length == 0)
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
                                    $("#D_name").val("");
                                    $("#D_Remark").val("");
                                    $("#D_ID").val("");
                                    $("#T_parent").val("");
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



        function AddNext(id) {
            Empty();

            $("#T_parent").ligerGetComboBoxManager().selectValue(id);
            Dep_ID = id;
            OperationType = "add";
            $("#Sumit").text("保存");
            $("#TitleAdd").html("添加下级");
            $('#T_parent').attr("disabled", "disabled");  //隶属部门禁用
            // $("#T_parent").attr("style", " width: 278px;");
            $('#Insertmdoels').modal('show');
            $("#D_name").val();
            $("#D_Remark").val("");
            $("#D_ID").val("");

        }

        function Empty() {
            $("#Insertmdoels").find("input").val("");
            $("#Insertmdoels").find("textarea").val("");
        }


    </script>
</asp:Content>
