﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RoleManagement.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.RoleManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>京师博仁危机干预人员设置-角色管理</title>
    <link rel="shortcut icon" id="icons" href="" />
    <!-- Bootstrap Styles-->
    <link href="/CSS/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="../../CSS/custom-styles.css" rel="stylesheet" />
    <link href="../../CSS/custom-styles_1.css" rel="stylesheet" />
    <link href="../../CSS/font-awesome.min.css" rel="stylesheet" />
    <link href="../../CSS/base.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <style>
        tr {
            word-break: break-all;
            word-wrap: break-word;
        }
    </style>

    <!-- 右侧  -->
    <div class="content">
        <!-- 新建角色 -->
        <div class="row">
            <div style="padding-bottom: 20px" class="col-md-12 col-sm-12 col-xs-12">
                <a class="btn btn-sm pull-right" name="QX_NewRole" data-toggle="modal" onclick=" AddEmpty()" data-target="#addRole" style="border: 1px solid orange; color: orange">+新建角色</a>
            </div>
        </div>
        <!-- 表格 -->
        <div class="row">
            <div class="col-md-12">
                <div class="table-responsive">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" style="width: 100%" id="tableGrid">
                            <thead>
                                <tr>
                                    <th class="text-center" style="width: 8%">序号</th>
                                    <th class="text-center" style="width: 12%">角色名称</th>
                                    <th class="text-center" style="width: 10%">角色类型</th>
                                    <th class="text-center" style="width: 10%">成员数量</th>
                                    <th class="text-center" style="width: 30%">角色描述</th>
                                    <th class="text-center" style="width: 30%">操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!--<tr role="row" class="odd">
                                                <td style="text-align: center;">
                                                    <label>1</label>
                                                </td>
                                                <td>学生</td>
                                                <td>学生</td>
                                                <td>37</td>
                                                <td>文学院12级学生</td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link">编辑权限</button>
                                                        <button class="btn btn-link" data-id="角色2" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('角色2')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="65" onclick="DeleteRole('角色2')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td style="text-align: center;">
                                                    <label>2</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('角色3','2')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="角色3" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('角色3')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="9" onclick="DeleteRole('角色3')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td style="text-align: center;">
                                                    <label>3</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('来访者','3')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="来访者" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('来访者')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="1789" onclick="DeleteRole('来访者')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td style="text-align: center;">
                                                    <label>4</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('刘卫东','3')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="刘卫东" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('刘卫东')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="1" onclick="DeleteRole('刘卫东')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td style="text-align: center;">
                                                    <label>5</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('EAP管理员','2')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="EAP管理员" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('EAP管理员')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="1" onclick="DeleteRole('EAP管理员')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td style="text-align: center;">
                                                    <label>6</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('EAP专属管理员','2')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="EAP专属管理员" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('EAP专属管理员')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="1" onclick="DeleteRole('EAP专属管理员')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td style="text-align: center;">
                                                    <label>7</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('用户','3')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="用户" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('用户')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="14" onclick="DeleteRole('用户')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td style="text-align: center;">
                                                    <label>8</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('高岩','2')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="高岩" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('高岩')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="0" onclick="DeleteRole('高岩')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="odd">
                                                <td style="text-align: center;">
                                                    <label>9</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('咨询师','2')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="咨询师" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('咨询师')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="6" onclick="DeleteRole('咨询师')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr role="row" class="even">
                                                <td style="text-align: center;">
                                                    <label>10</label>
                                                </td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td>
                                                    <div class="w_center">
                                                        <button class="btn btn-link" name="QX_permissions" onclick="ShowRights('学生','3')">编辑权限</button>
                                                        <button class="btn btn-link" data-id="学生" name="QX_UpdateRole" data-toggle="modal" data-target="#editRole" onclick="ShowEditRoleValue('学生')">修改角色</button>
                                                        <button class="btn btn-link" name="QX_DeleteRole" data-membercount="1688" onclick="DeleteRole('学生')">删除角色</button>
                                                    </div>
                                                </td>
                                            </tr>-->
                            </tbody>
                        </table>
                        <!--<div class="dataTables_info" id="tableGrid_info" role="status" aria-live="polite">每页显示10条，共 30 项</div><div class="dataTables_paginate paging_simple_numbers" id="tableGrid_paginate"><a class="paginate_button previous disabled" aria-controls="tableGrid" data-dt-idx="0" tabindex="0" id="tableGrid_previous">上页</a><span><a class="paginate_button current" aria-controls="tableGrid" data-dt-idx="1" tabindex="0">1</a><a class="paginate_button " aria-controls="tableGrid" data-dt-idx="2" tabindex="0">2</a><a class="paginate_button " aria-controls="tableGrid" data-dt-idx="3" tabindex="0">3</a><a class="paginate_button " aria-controls="tableGrid" data-dt-idx="4" tabindex="0">4</a></span><a class="paginate_button next" aria-controls="tableGrid" data-dt-idx="5" tabindex="0" id="tableGrid_next">下页</a></div>-->
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- 修改角色弹框 -->
    <div class="modal fade" id="editRole" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 20%; width: 100%">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center" style="color: #4CB1CF; margin-top: 30px; font-size: 25px; font-weight: 700">修改角色
                </h4>

                <div class="modal-body">
                    <div class="row">

                        <div class="form-group  text-right">
                            <label class="col-sm-3  col-xs-4 control-label">*角色名称:</label>
                            <div class="col-sm-6  col-xs-6">
                                <input id="editRoleID" type="text" style="display: none">
                                <input id="editRoleName" maxlength="20" type="text" style="width: 100%" class="form-control">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">*角色类型:</label>
                            <div class="col-sm-6 col-xs-6">
                                <select class="form-control" id="editRoleType">
                                    <option value="0">全部分类</option>
                                    <option value="2" selected="selected">管理员</option>
                                    <option value="3">普通用户</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">角色描述:</label>
                            <div class="col-sm-6  col-xs-6">
                                <textarea id="editRoleDescribe" style="width: 100%; height: 200px" maxlength="500" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditRoleValue()" type="button" class="btn btn-sm" style="border-color: orange; color: white">保存</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm" data-dismiss="modal" style="color: white; border-color: orange;">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="addRole" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 20%; width: 100%">

                <button type="button" class="close clearInfo" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center" style="color: #4CB1CF; margin-top: 30px; font-size: 25px; font-weight: 700">新增角色
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  text-right">
                            <label class="col-sm-3  col-xs-4 control-label">*角色名称:</label>
                            <div class="col-sm-6 col-xs-6">
                                <input id="addRoleName" maxlength="20" type="text" class="form-control" style="width: 100%" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">*角色类型:</label>
                            <div class="col-sm-6 col-xs-6">
                                <select class="form-control" id="roleType"></select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3 col-xs-4 control-label">角色描述:</label>
                            <div class="col-sm-6  col-xs-6">
                                <textarea id="addRoleDescribe" style="width: 100%; height: 200px" maxlength="500" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6 col-xs-5 text-right">
                            <button onclick="addRole()" type="submit" class="btn btn-sm" style="border: 1px solid orange; color: orange">保存</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm clearInfo" data-dismiss="modal" style="color: white">取消</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- JS Scripts-->
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script>
        var navName = '/FunctionModular/BasicSetting/RoleManagement.aspx';
        initSelectInput("Remark=1", "roleType", "全部分类")
        initSelectInput("Remark=1", "editRoleType", "全部分类")
        initSelectInput("Remark=1", "addRoleType", "全部分类")

        /*列表展现部分 */
        /*
               创建时间：2016-09-07
               创建人：李超
               功能介绍：加载角色列表集合
       */

        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var roleName = '';
        var roleType = '';
        var tablelist;
        var bools;
        var current = 0;
        taozhuang();
        //获取当前的地址
        function taozhuang() {
            var urlarr = window.location.href;
            var urlar = urlarr.split('?');
            if (urlar[1] != undefined) {
                var urla = urlar[1].split('/');

                var url = urla[0].split("=");
                var urlb = urla[1].split("=");
                var urlc = urla[2].split("=");
                var urld = urla[3].split("=");

                Startindex = url[1];
                Endindex = urlb[1];
                bools = urlc[1]
                current = urld[1]

                BindGrid();
            }

        }




        var urlarr = window.location.href;
        var urlar = urlarr.split('?');
        if (urlar[1] == undefined) {

            BindGrid();
        }

        function BindGrid() {

            roleName = $("#roleName").val();
            //roleType = $("#roleType").find("option:selected").val();
            if (tablelist != undefined) {

                $("#tableGrid").DataTable().draw();
                return;
            }

            tablelist = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,
                ajax: {
                    method: 'get',
                    url: "Ajax/BasicSetting_Role.ashx?operationType=Bind",
                    dataSrc: "data",
                    data: function (d) {
                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        if (bools == "true" && bools != "undefined") {
                            if (d.start == 0) {
                                //if (Endindex == 10) {
                                Endindex = d.length;
                                if (Endindex == 10) {
                                    Startindex = 0;
                                }
                            } else {
                                Startindex = d.start + 1;
                                Endindex = d.start + d.length;
                            }
                        }
                        bools = "true";
                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&Role_Name=' + roleName + '&Role_Type=' + roleType;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    var operation = "";
                    operation = " <button class=\"btn btn-link\" name='QX_permissions'  onclick=ShowRights('" + data[1] + "','" + data[6] + "')>编辑权限</button>"
                   + " <button class=\"btn btn-link\"  data-id='" + data[1] + "' name='QX_UpdateRole' data-toggle='modal' data-target='#editRole' onclick=ShowEditRoleValue('" + data[1] + "')>修改角色</button>"
                   + " <button  class=\"btn btn-link\"  name='QX_DeleteRole' data-memberCount =" + data[2] + " onclick=DeleteRole('" + data[1] + "')>删除角色</button>";
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(5)', row).html(operation);

                },

                "oLanguage": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "_MENU_ 记录/页",
                    "sZeroRecords": "查询无结果！",
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


        function addRole() {
            var roleType = $("#roleType").find("option:selected").val();
            var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;

            /*为空*/
            function trim(str) {
                return str.replace(/(^\s*)|(\s*$)/g, "");
            }
            if (trim($("#addRoleName").val()) == "") {
                layer.alert('请输入角色名称！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                }
            );
                return;
            }
            if (!reg.test($("#addRoleName").val())) {
                layer.alert('角色名不能包含特殊字符', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                });
                return;
            }
            if (roleType == "0") {
                layer.alert("请选择角色类型", {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                })
                return;
            }
            $.ajax({
                url: "/FunctionModular/BasicSetting/Ajax/BasicSetting_Role.ashx?operationType=JudgeRoleName",
                type: "post",
                data: { roleName: $("#addRoleName").val() },
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data.trim() == "True") {
                        layer.alert('该角色名已存在！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0

                        });
                        return;
                    }
                    else {
                        $.ajax({
                            url: "/FunctionModular/BasicSetting/Ajax/BasicSetting_Role.ashx?operationType=Add",
                            type: "post",
                            data: { roleName: $("#addRoleName").val(), roleType: roleType, roleDescribe: $("#addRoleDescribe").val() },
                            dataType: "text",
                            success: function (data) {
                                if (data) {
                                    layer.msg('保存成功！',
                                        { time: 2000, icon: 6 }, function () {
                                            $("#tableGrid").DataTable().draw();

                                            $(".modal-backdrop").remove();
                                            layer.closeAll('dialog');
                                        });
                                    $('#addRole').modal('hide');
                                    $("#addRoleName").val("");
                                    document.getElementById("roleType").options[0].selected = true;
                                    $("#addRoleDescribe").val("");



                                }
                                else {
                                    layer.alert('添加失败!', {
                                        skin: 'layui-layer-lan', //样式类名
                                        closeBtn: 0
                                    }, function () {
                                        layer.closeAll('dialog');
                                        $('#addRole').modal('hide');
                                        $(".modal-backdrop").remove();
                                    }
                    );
                                }
                            },
                            error: function (data) {
                                alert("返回值失败");
                            }
                        })
                    }
                }
            })
        }

        function ShowRights(val, roletype) {
            //iframe层
            var roleID = $("[data-name=" + val + "]").attr("data-id");
            var current = $('.current').html();
            window.location.href = "FunctionList.aspx?roleID=" + roleID + "/Startindex=" + Startindex + "/Endindex=" + Endindex + "/bools=false/current=" + current + "/Roletype=" + roletype;

        }
        function ShowEditRoleValue(val) {
            UpdateEmpty();

            var val = $("[data-name=" + val + "]").attr("data-id");
            $("#editRoleID").val("");
            $("#editRoleName").val("");
            $("#editRoleDescribe").val("");
            $('#editRole').modal('show');
            $.ajax({
                url: "Ajax/BasicSetting_Role.ashx?operationType=Getrole",
                dataType: "text",
                type: "post",
                data: { roleID: val },
                success: function (data) {
                    data = eval("(" + data + ")");
                    $("#editRoleID").val(data.Role_ID);
                    $("#editRoleName").val(data.Role_Name);
                    $("#editRoleDescribe").val(data.Role_Describe);
                    //$("#editRoleType").find("option[value=" + data.Role_Type + "]").attr("selected", "selected");
                    if (data.Role_Type == 3)
                        document.getElementById("editRoleType").selectedIndex = 2;
                    else
                        document.getElementById("editRoleType").selectedIndex = 1;
                }
            })
        }
        function EditRoleValue() {
            var roleID = $("#editRoleID").val();
            var roleName = $("#editRoleName").val();
            var roleType = $("#editRoleType").find("option:selected").val();
            var roleDescribe = $("#editRoleDescribe").val();
            //非法字符
            var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;
            /*为空*/
            function trim(str) {
                return str.replace(/(^\s*)|(\s*$)/g, "");
            }
            if (trim(roleName) == "") {
                layer.alert('请输入角色名称！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                }
            );
                return;
            }
            if (roleType == "0") {
                layer.alert('请选择角色类型!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                }
            );
                return;
            }
            if (!reg.test($("#editRoleName").val())) {
                layer.alert('角色名不能包含特殊字符', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                });
                return;
            }

            $.ajax({
                url: "/FunctionModular/BasicSetting/Ajax/BasicSetting_Role.ashx?operationType=JudgeRoleName",
                type: "GET",
                data: { roleName: roleName, roleID: roleID },
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data.trim() == "True") {
                        layer.alert('该角色名已存在！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0

                        });
                        return;
                    }
                    else {

                        $.ajax({
                            url: "Ajax/BasicSetting_Role.ashx?operationType=Update",
                            dataType: "text",
                            type: "post",
                            data: { RoleID: roleID, RoleName: roleName, RoleType: roleType, RoleDescribe: roleDescribe },
                            success: function (data) {
                                if (data) {
                                    $('#editRole').modal('hide');
                                    layer.msg('保存成功！', { time: 2000, icon: 6 },
                                        function () {

                                            layer.closeAll('dialog');
                                            $(".modal-backdrop").remove();
                                            $("#editRoleID").val("");
                                            $("#editRoleName").val("");
                                            $("#editRoleDescribe").val("");

                                            $("#addRoleName").val("");
                                            $("#addRoleDescribe").val("");
                                        });
                                    $("#tableGrid").DataTable().draw();
                                }
                                else {
                                    layer.alert('更改失败!', {
                                        skin: 'layui-layer-lan', //样式类名
                                        closeBtn: 0
                                    }
                    );
                                }
                            }

                        }, function () {

                        });
                    }
                }
            })


        }
        function DeleteRole(val) {
            //var memberCount = $("[data-id=" + val + "]").next().attr("data-memberCount");
            var memberCount = $("[data-id=" + val + "]").parent().parent().find('td').eq(3).html();
            var val = $("[data-name=" + val + "]").attr("data-id");

            if (memberCount != '0') {
                layer.confirm('该角色下存在' + memberCount + '个成员，删除该角色后该角色下的成员也将删除，是否继续？', {
                    btn: ['是', '否'] //按钮
                }, function () {
                    $.ajax({
                        url: "Ajax/BasicSetting_Role.ashx?operationType=Delete",
                        type: "post",
                        dataType: "text",
                        data: { RoleID: val },
                        success: function (data) {
                            if (data) {
                                layer.msg('删除成功', { time: 2000, icon: 1 }, function () {
                                    layer.closeAll('dialog');
                                    $("#tableGrid").dataTable().fnDraw(false);
                                });

                            }
                            else {
                                layer.alert('删除失败!', {
                                    skin: 'layui-layer-lan', //样式类名
                                    closeBtn: 0
                                }, function () {
                                    layer.closeAll('dialog');

                                });
                            }
                        }
                    })
                }
            )
            }
            else {
                layer.confirm('您确定要删除当前角色？', {
                    btn: ['是', '否'] //按钮
                }, function () {
                    $.ajax({
                        url: "Ajax/BasicSetting_Role.ashx?operationType=Delete",
                        type: "post",
                        dataType: "text",
                        data: { RoleID: val },
                        success: function (data) {
                            if (data) {
                                layer.msg('删除成功', { time: 2000, icon: 6 }, function () {
                                    layer.closeAll('dialog');
                                    $("#tableGrid").dataTable().fnDraw(false);
                                });
                            }
                            else {
                                layer.alert('删除失败!', {
                                    skin: 'layui-layer-lan', //样式类名
                                    closeBtn: 0
                                }, function () {
                                    layer.closeAll('dialog');

                                }
                                     );
                            }
                        }
                    })
                })
            }
        }

        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/BasicSetting_Role.ashx?operationType=LoadSelect",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item.RoleType_ID + "'>" + item.RoleType_Name + "</option>");

                    });

                }
            });
        }

        $(document).on("click", "#go_search", function () {

            roleName = $("#roleName").val();
            roleType = $("#roleType").find("option:selected").val();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        });


        $(document).ready(function () {
            //function fenyedingwei() {

            var paginate_button = $(".paginate_button");

            for (var i = 0; i < paginate_button.length; i++) {

                if (paginate_button[i].text == current && current != 0) {
                    $(".paginate_button").attr('class', 'paginate_button')
                    $(".paginate_button").eq(i).attr('class', 'paginate_button current')
                }
            }
            //}
        })

        //添加的清空
        function AddEmpty() {
            $("#addRole").find("input").val("");
            $('#addRoleDescribe').val('');
            document.getElementById("roleType").selectedIndex = 0;
        }
        //修改的清空
        function UpdateEmpty() {
            $("#editRole").find("input").val("");
            $("#editRole").find("textarea").val("");
        }
        $(".clearInfo").click(function () {
            $("#addRole").find("input").val("");
            //$("#roleType").find("option[value=" + 0 + "]").attr("selected", "selected");
            document.getElementById("roleType").options[0].selected = true;
            $("#addRole").find("textarea").val("");
        })
    </script>
</asp:Content>
