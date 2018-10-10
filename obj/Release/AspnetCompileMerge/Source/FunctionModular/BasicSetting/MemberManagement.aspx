<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MemberManagement.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.MemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>京师博仁危机干预人员设置-成员管理</title>
    <link rel="shortcut icon" id="icons" href="" />
    <!-- 左侧下拉框 Js -->


    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />


    <!-- Bootstrap Styles-->
    <link href="/CSS/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="/CSS/custom-styles.css" rel="stylesheet" />
    <link href="/CSS/custom-styles_1.css" rel="stylesheet" />
    <link href="/CSS/font-awesome.min.css" rel="stylesheet" />
    <link href="/CSS/base.css" rel="stylesheet" />
    <link href="/CSS/rysz.css" rel="stylesheet" />
    <%--<link href="/CSS/bootstrap-datepicker.css" rel="stylesheet" />--%>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="/assets/skin/layer.css" rel="stylesheet" />
    <link href="/CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="/JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="/CSS/morris-0.4.3.min.css" rel="stylesheet" />
    <script src="../../JS/jquery.form.js"></script>
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/TreeTables/jquery.treeTable.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <!-- /. ROW  -->
    <div class="row" style="margin-left: 7px; margin-bottom: 10px;">
        <!-- 登录名/姓名 -->
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input type="text" class="form-control" id="LoginName" placeholder="登录名/姓名">
        </div>
        <!-- 角色名称 -->
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="form-control" id="Sel_RoleType"></select>
        </div>
        <!-- 部门名称 -->
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <div class="l-text l-text-combobox" style="width: 100%;">
                <input type="text" id="T_parent" name="T_parent" placeholder="--部门名称--" readonly="" class="l-text-field form-control">
            </div>
        </div>
        <!-- 性别 -->
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="form-control" id="sex">
                <option value="">性别</option>
                <option value="0">男</option>
                <option value="1">女</option>
            </select>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
            <button class="btn btn-primary btn-sm pull-left" id="go_search" name="QX_SelectUser" style="border: 1px solid orange; color: orange;"><i class="fa fa-search "></i>查询</button>

            <button class="btn  btn-sm text-right w_radius" name="QX_NewUser" style="border: 1px solid orange; color: orange;" data-id="54"
                data-toggle="modal" data-target=".tjcy" onclick="addMember()">
                +添加成员</button>
            <!--onclick="fun()" -->
        </div>
    </div>
    <!-- 表格 -->
    <div class="row" style="margin-left: 7px; margin-bottom: 10px;">
        <div class="col-md-12">
            <div class="panel-body" style="padding: 0px;">
                <div class="table-responsive">
                    <div id="DataTables-Gauge_wrapper" class="dataTables_wrapper no-footer">
                        <div id="DataTables-Gauge_processing" class="dataTables_processing" style="display: none;">处理中...</div>
                        <table class="table table-striped table-bordered table-hover dataTable no-footer" id="DataTables-Gauge" role="grid" aria-describedby="DataTables-Gauge_info" style="width: 100%;">
                            <thead>
                                <tr role="row">
                                    <th class="text-center sorting_disabled" style="width: 3%;" rowspan="1" colspan="1">
                                        <input class="parentCheck" id="selectAll" type="checkbox" onclick="funchange(this)">
                                    </th>
                                    <th class="text-center sorting_disabled" style="width: 11%;" rowspan="1" colspan="1">序号</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 11%;">登录名</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 11%">姓名</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 11%">性别</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 11%;">角色名称</th>
                                    <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 11%;">所属部门</th>
                                    <th class="text-center sorting_disabled" style="width: 30%;" rowspan="1" colspan="1">操作</th>
                                </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <button class="btn btn-or w_radius" name="QX_DeletesUser" data-id="57" onclick="u_deletes()"><i class="fa fa-search"></i>批量删除</button>
                <button class="btn btn-or w_radius" data-id="58" name="QX_NewPwd" onclick="u_updatepwds()"><i class="fa fa-refresh"></i>批量重置密码</button>
                <button class="btn btn-or w_radius" data-id="58" name="QX_NewPwd" onclick="u_updateBM()"><i class="fa fa-exchange"></i>批量转移部门</button>
            </div>
        </div>
    </div>
    <!--批量转移部门弹框-->
    <div class="modal fade" id="ZYDepart" role="dialog" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header" style="height: 200px; padding: 0px;">
                <h2 class="modal-title text-center xia_title">批量转移部门</h2>
                <div class="modal-body">
                    <div class="row text-center">
                        <div class="col-md-3 col-sm-3 control-label">
                            目标部门:
                        </div>
                        <div class="col-sm-6">
                            <input id="ZY_Department" style="top: 0; height: auto; width: 99%; border: none;"
                                readonly="" class="l-text-field form-control" />
                        </div>
                    </div>
                    <span id="tip" style="display: none; color: #a94442; margin-left: 125px;">请选择目标部门</span>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-5 text-right">
                            <button type="button" class="btn btn-sm f14 x_btn" id="save_YZ" disabled="disabled" onclick="TransferDepart()">保存</button>
                        </div>
                        <div class="col-sm-2 col-xs-4  text-right">
                            <button type="button" class="btn btn-sm f14 x_btn1" onclick="hideZYDepart()">取消</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 查看/修改资料弹窗 -->
    <div class="modal fade ckzl x_ckzl" id="viewPersonalInfo" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-header">
                <h2 class="modal-title text-center xia_title" id="ModalLabel">成员资料</h2>
                <div class="modal-body">
                    <!--查看界面-->
                    <div id="showpage" class="x_zlxq x_zlxq_ckzl overflow">
                        <div class="jbxx f14 overflow">
                            <h3 class="f16 zhuse pl100 pb30">基本信息</h3>
                            <div class="pull-left pl100">
                                <div class="form-group">
                                    <label class="fl">登&nbsp;录&nbsp;&nbsp;名：</label>
                                    <div class="fl c333" data-name="loginName">
                                        梦奇
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="fl tl"><span style='padding-right: 26px'>性</span>别：</label>
                                    <div class="fl c333" data-name="sex">
                                        梦奇
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="fl"><span style='padding-right: 26px'>密</span>码：</label>
                                    <div class="fl c333" data-name="passWord">
                                        ●●●●●●
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ds_name" style="width: auto; padding-left: 0px; padding-right: 0px;">所属部门：</label>
                                    <div class="col-sm-4" style="width: auto; padding-left: 0px; padding-right: 0px;">
                                        <div class="fl c333" data-name="department_id">
                                            默认部门
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="fl">手机号码：</label>
                                    <div class="fl c333" data-name="cellPhone">
                                        18211013898
                                    </div>
                                </div>
                            </div>
                            <div class="pull-left pl30">
                                <div class="form-group">
                                    <label class="fl tl"><span style='padding-right: 26px'>姓</span>名：</label>
                                    <div class="fl c333" data-name="userName">
                                        梦奇
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="fl">出生日期：</label>
                                    <div class="fl c333" data-name="bornDate">
                                        2017-1-1
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="fl">角色名称：</label>
                                    <div class="fl c333" data-name="RoleNameAdd">
                                        普通用户
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="fl">部门权限：</label>
                                    <div class="fl c333" data-name="departmentAuthority">
                                        无
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="fl">电子邮箱：</label>
                                    <div class="fl c333" data-name="email">
                                        13939236760@163.com
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="jbxx f14 overflow">
                            <h3 class="f16 zhuse pl100 pb30">拓展信息</h3>
                            <div class="pl100">
                                <div class="form-group overflow">
                                    <label class="fl">家庭住址：</label>
                                    <div class="fl c333" data-name="homeAddress">
                                        <textarea id="homeAddress" readonly="true" cols="30" rows="10" style="width: 500px; height: 40px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group overflow">
                                    <label class="fl">个人简介：</label>
                                    <div class="fl c333 grjj" data-name="personalIntroduce">
                                        <textarea id="personalIntroduce" readonly="true" cols="30" rows="10" style="width: 500px; height: 50px;"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row" style="margin-top: 20px">
                            <div class="col-sm-6  col-xs-5 text-right">
                                <button class="btn btn-sm f14 x_btn x_xg" data-id='56' name='QX_UpdateUser' onclick="seupdate(this)">修改</button>
                            </div>
                            <div class="col-sm-2 col-xs-4  text-right">
                                <button class="btn btn-sm f14 x_btn1 closeModal" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                    <!--修改界面-->
                    <form id="UserInfoUpdate" class="form-horizonta" role="form">
                        <div id="updatepage" class="x_zlxq x_zlxq_xgzl  overflow">

                            <fieldset>
                                <div class="jbxx f14 overflow">
                                    <h3 class="f16 zhuse pl80 pb30">基本信息</h3>
                                    <div class="pull-left pl80">
                                        <div class="form-group">
                                            <label class="fl">登&nbsp;录&nbsp;&nbsp;名：</label>
                                            <%-- <div class="fl c333">--%>
                                            <input class="form-control" data-update="loginName" type="text" name="LoginName" disabled="disabled">
                                            <%-- </div>--%>
                                        </div>
                                        <div class="form-group">
                                            <label class="fl tl"><span style='padding-right: 26px'>性</span>别：</label>
                                            <%--<div class="fl c333">--%>
                                            <select name="Sex" data-update="sex" id="">
                                                <option value="女">女</option>
                                                <option value="男">男</option>
                                                  </select>
                                        <%--</div>--%>
                                    </div>
                                    <div class="form-group">
                                        <label class="fl"><span style='padding-right: 26px'>密</span>码：</label>
                                        <%-- <div class="fl c333">--%>
                                        <input type="password" style="top: 0; height: 30px;" readonly="true" disabled="disabled" value="●●●●●●" />

                                        <%--</div>--%>
                                    </div>
                                    <div class="form-group">
                                        <label class="fl">所属部门：</label>
                                           <div class="fl c333">
                                        <input id="Department_IDs" name="Department_IDs" style="top: 0; height: 30px;" />

                                                                                    </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="fl">手机号码：</label>
                                        <%-- <div class="fl c333">--%>
                                        <input data-update="cellPhone" name="Tel" type="text"onchange="txtNameCheckA(this,30") onblur="txtNameCheckA(this,30)"/>
                                        <%-- </div>--%>
                                    </div>
                                </div>
                                <div class="pull-left pl50">
                                    <div class="form-group">
                                        <label class="fl tl"><span style='padding-right: 26px'>姓</span>名：</label>
                                        <%-- <div class="fl c333">--%>
                                        <input class="form-control" data-update="userName" name="UserName" maxlength="10"/>
                                        <%--    </div>--%>
                                    </div>
                                    <div class="form-group">
                                        <label class="fl">出生日期：</label>
                                        <%--<div class="fl c333">--%>
                                        <input data-update="birthday" type="text" class="form-control" id="U_Birthday" name="Birthday" readonly="readonly" />
                                        <%-- </div>--%>
                                    </div>
                                    <div class="form-group">

                                        <label class="fl">角色名称：</label>
                                       <%--  <div class="fl c333">--%>
                                        <select data-update="roleName" id="R_IDs" name="RoleName"></select>
                                         <%--</div>--%>
                                    </div>
                                    <div class="form-group">
                                        <label class="fl" for="ds_name">部门权限：</label>
                                        <div class="fl c333" id="departmentRight">
                                            <input id="Dauthority" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="fl">电子邮箱：</label>
                                       <%-- <div class="fl c333">--%>
                                            <input data-update="email" name="Email" type="text" onchange="txtNameCheckA(this,30") onblur="txtNameCheckA(this,30)">
                                        <%--</div>--%>
                                    </div>
                                </div>
                        </div>
                        </fieldset>
                            <fieldset>
                                <div class="jbxx f14 overflow jbxx_last">
                                    <fieldset>
                                        <h3 class="f16 zhuse pl80 pb30">拓展信息</h3>
                                        <div class="pl80">
                                            <div class="form-group">
                                                <label class="fl">家庭住址：</label>
                                                <div class="fl c333">
                                                    <input data-update="homeAddress" type="text" maxlength="50">
                                                </div>
                                            </div>
                                            </br>
                                            <div class="form-group">
                                                <label class="fl" style="margin-top: 10px;">个人简介：</label>
                                                <div class="fl c333 grjj" style="margin-top: 10px;">
                                                    <textarea name="" data-update="remark" cols="30" rows="10" maxlength="500"></textarea>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                </div>
                            </fieldset>
                        <div class="row" style="margin-top: 20px">
                            <div class="col-sm-6  col-xs-5 text-right">
                                <button type="submit" id="Sumit" class="btn btn-sm f14 x_btn">保存</button>
                            </div>
                            <div class="col-sm-2 col-xs-4  text-right">
                                <button type="button" class="btn btn-sm f14 x_btn1" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                </div>

                </form>
            </div>
        </div>
    </div>
    </div>

    <style>
        .help-block small {
            width: 200px;
            margin-left: 85px;
            display: block;
            top: 0px;
            float: left;
            margin-bottom: 0px;
        }

        tr {
            word-break: break-all;
            word-wrap: break-word;
        }

        .l-box-select div {
            width: auto;
        }

        .tjcy .modal-dialog {
            width: 800px;
        }

            .tjcy .modal-dialog .modal-header {
                border-radius: 0;
                padding: 0;
                height: auto;
            }

        .tjcy .bs-example-tabs {
            width: 690px;
            margin: 0 auto;
        }

        .l-tree ul {
            height: auto;
        }

        .tjcy .bs-example-tabs ul li {
            width: 229px;
            text-align: left;
            height: auto;
            border-bottom: 0px solid #ccc;
        }

            .tjcy .bs-example-tabs ul li.acitve a {
                border-top: 0;
                border-left: 0;
                border-right: 0;
            }

        .tjcy .bs-example-tabs ul {
            height: auto;
            border-bottom: 0;
        }

            .tjcy .bs-example-tabs ul li a {
                border-radius: 0;
                border-top: 0;
                border-left: 0;
                border-right: 1px dashed #ccc;
                outline: none;
                height: 39px;
                background: #fff;
                font-size: 16px;
                color: #666;
                line-height: 17px;
            }

            .tjcy .bs-example-tabs ul li:last-child a {
                border-right: 0;
                width: 230px;
            }

            .tjcy .bs-example-tabs ul li.active:last-child a {
                border-right: 0;
            }

            .tjcy .bs-example-tabs ul li.active {
                border-bottom: none;
            }

        .tjcy .nav-tabs > li.active > a, .tjcy .nav-tabs > li.active > a:hover, .tjcy .nav-tabs > li.active > a:focus {
            border-top: 0;
            border-bottom: 2px solid #50ace2;
            color: #50ace2;
        }

            .tjcy .nav-tabs > li.active > a, .tjcy .nav-tabs > li.active > a:hover, .tjcy .nav-tabs > li.active > a:focus {
                border-left: 0;
                border-right: 1px dashed #ccc;
                height: 40px;
            }

        .tjcy .nav-tabs > li > a:hover {
            border-bottom: none;
        }

        .tjcy.x_ckzl .x_zlxq.x_zlxq_xgzl .pull-left {
            width: 320px;
        }

        .tjcy.x_ckzl .x_zlxq.x_zlxq_xgzl .jbxx_last textarea, .tjcy.x_ckzl .x_zlxq.x_zlxq_xgzl .jbxx_last input {
            width: 527px;
        }

        .tjcy .pltj {
            position: relative;
        }

            .tjcy .pltj input {
                width: 230px;
                border: 1px solid #ccc;
            }

            .tjcy .pltj .form-group {
                width: 375px;
                margin: 0 auto 30px;
            }

            .tjcy .pltj .x_xhfw:after {
                content: '(单次最多添加300个，包含所填序号)';
                position: absolute;
                color: #666;
                font-size: 12px;
                top: 155px;
                padding-left: 5px;
            }

            .tjcy .pltj .x_xhfw input {
                width: 107px;
            }

            .tjcy .pltj .x_qz:after {
                content: '(用户名生成规则：用户名=前缀+序号)';
                position: absolute;
                color: #666;
                font-size: 12px;
                top: 215px;
                padding-left: 5px;
            }

        .pldr input {
            width: 230px;
        }

        .pldr .x_upload {
            position: relative;
            display: inline-block;
            width: 36px;
            height: 20px;
            font-size: 12px;
            color: #f9906f;
            border: 1px solid #f9906f;
            border-radius: 5px;
            text-align: center;
            line-height: 18px;
            margin-top: 5px;
            margin-left: 10px;
            cursor: pointer;
        }

            .pldr .x_upload input {
                width: 36px;
                height: 20px;
                position: absolute;
                top: 0;
                left: -2px;
                opacity: 0;
            }

        #fixDatePicker:after {
            content: "";
            height: 0;
            visibility: hidden;
            display: block;
            clear: both;
        }

        .scrollbar {
            overflow-y: scroll;
        }

        .style_1::-webkit-scrollbar {
            width: 12px;
            background-color: #F5F5F5;
        }

        .style_1::-webkit-scrollbar-thumb {
            border-radius: 10px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);
            background-color: #ccc;
        }

        .style_1::-webkit-scrollbar-track {
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
            border-radius: 10px;
            background-color: #F5F5F5;
        }
    </style>
    <!-- 添加成员弹窗 -->
    <div class="modal fade tjcy x_ckzl" id="addMemberModal" tabindex="-1" aria-hidden="true">
        <div class="    modal-dialog">
            <div class="modal-header scrollbar style_1" id="fixDatePicker">
                <h2 class="modal-title text-center xia_title" id="ModalLabel">成员资料</h2>
                <div class="modal-body">
                    <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                        <ul id="myTabs" class="nav nav-tabs" role="tablist">
                            <li class="active"><a href="#home" data-toggle="tab">单个添加</a></li>
                            <li class=""><a href="#profile" data-toggle="tab">批量添加</a></li>
                            <li><a href="#Lead-in" data-toggle="tab">批量导入</a></li>
                        </ul>
                        <div id="myTabContent" class="tab-content">
                            <!--单个添加-->
                            <div class="tab-pane fade active in" id="home">
                                <div class="row" style="margin: 15px 0px 0px 0px;">
                                    <form id="UserInfoAdd" class="form-horizontal" role="form" onsubmit="Submit()">
                                        <fieldset>
                                            <h3 class="f16 zhuse pl40 pb30 mt30">基本信息</h3>
                                            <div class="form-group">

                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2 control-label">登录名：</div>
                                                    <div class="col-sm-4">
                                                        <!--<input class="form-control" id="U_LoginName" name="LoginName" maxlength="15" />-->
                                                        <input class="form-control" id="U_LoginName" name="LoginNameAdd" maxlength="30" data-bv-field="LoginName" onblur="txtNameCheck(this,30)">
                                                    </div>
                                                </div>
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2 control-label">姓名：</div>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="U_Name" name="UserNameAdd" maxlength="10" onblur="txtNameCheck(this,10)" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2  control-label">性别：</div>
                                                    <div class="col-sm-4">
                                                        <select class="form-control" id="U_Sex" name="SexAdd">
                                                            <option value="1">女</option>
                                                            <option value="0">男</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2  control-label" style="width: 120px; top: 0; height: 30px;">出生日期：</div>
                                                    <div class="col-sm-4">
                                                        <input type="text" class="form-control" id="birthdays" name="BirthdayAdd" readonly="readonly" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2  control-label">密码：</div>
                                                    <div class="col-sm-4">
                                                        <input type="password" class="form-control" id="U_Password" name="PwdsAdd" maxlength="20" data-bv-field="PwdsAdd"
                                                            onkeyup="surePwd()" onblur="surePwd()" />
                                                    </div>
                                                </div>
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2  control-label">确认密码：</div>
                                                    <div class="col-sm-4">
                                                        <input type="password" class="form-control" id="U_Passwords" name="RepPwds" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2 control-label">角色名称:</div>
                                                    <div class=" col-sm-4">
                                                        <select class="form-control" name="RoleNameAdd" id="R_ID">
                                                            <option value="1">1</option>
                                                            <option value="2">2</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2 control-label">
                                                        所属部门:
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <input id="Department_ID" name="ADepartmentAdd" style="top: 0; height: auto; width: auto; border: none;"
                                                            readonly="" class="l-text-field" data-bv-field="ADepartmentAdd">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2  control-label" id="departmentAddDiv">部门权限：</div>
                                                    <div class="col-sm-4">

                                                        <input id="DauthorityAdd" name="DauthorityAdd" style="height: auto; width: auto; border: none;">
                                                    </div>
                                                </div>
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2  control-label">手机号：</div>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="U_Tel" name="TelAdd" maxlength="11" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2  control-label">电子邮箱：</div>
                                                    <div class="col-sm-4">
                                                        <input class="form-control" id="U_EMail" name="EmailAdd" />
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <fieldset>
                                            <h3 class="f16 zhuse pl40 pb30">拓展信息</h3>

                                            <div class="form-group" id="U_Address">
                                                <div class="col-md-2 col-sm-2  control-label">家庭住址：</div>
                                                <div class="col-sm-9">
                                                    <textarea class="form-control" rows="2" id="U_Address" name="AddressAdd" maxlength="50" onblur="return txtNameCheck(this,50)" style="width: 500px; height: 50px;"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group" id="Did_Remark">
                                                <div class=" col-md-2 col-sm-2 control-label">个人简介：</div>
                                                <div class="col-sm-9">
                                                    <textarea class="form-control" rows="2" id="U_Remark" name="RemarkAdd" maxlength="500" onblur="return txtNameCheck(this,500)" style="width: 500px; height: 50px;"></textarea>
                                                </div>
                                            </div>
                                            <div id="useradds"></div>
                                        </fieldset>
                                        <div class="row" style="text-align: center; margin-top: 20px;">
                                            <div class="col-sm-6 col-xs-5 text-right">
                                                <button type="submit" class="btn btn-sm f14 x_btn" style="background-color: orange; color: white" id="buttons">保存</button>
                                            </div>
                                            <div class="col-sm-1 col-xs-5 text-right">
                                                <button class="btn btn-sm f14 x_btn" type="button" style="color: white" id="Close" data-dismiss="modal">取消</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!--批量添加-->
                            <div class="tab-pane fade" id="profile">
                                <div class="row" style="margin: 15px 0px 0px 0px;">
                                    <form class="form-horizontal" id="BatchAdd" role="form">
                                        <fieldset>
                                            <div class="pltj mt50 pt30">
                                                <div class="form-group">
                                                    <div class="group">
                                                        <label class="fl">*角色名称：</label>
                                                        <div class="fl c333">
                                                            <select class="form-control" name="RoleNameAll" id="RoleNameAll"></select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="group">
                                                        <label class="fl">*所属部门：</label>
                                                        <div class="fl c333">
                                                            <input type="text" class="form-control" name="Department" id="Department" style="top: 0; height: 30px;" />

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="group">

                                                        <label class="fl">*序号范围：</label>
                                                        <div class="fl c333">
                                                            <input class="form-control" id="NumStart" type="text" name="NumStart" style="width: 110px; float: left;" />
                                                            <span style="margin-left: 2px; margin-right: 2px;">-</span>
                                                            <input class="form-control" id="NumEnd" name="NumEnd" type="text" style="width: 110px; float: right;" />
                                                            <p style="font-size: 14px;">(单次最多支持添加300个)</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="group">
                                                        <label class="fl tl"><span style="padding-right: 28px">*前</span>缀：</label>
                                                        <div class="fl c333">
                                                            <input class="form-control" data-id="3" type="text" id="UserName03" name="UserName03" onkeyup="changeStyle('UserName03',85,45,0)" onblur="changeStyle('UserName03',85,45,0)" />
                                                            <p style="font-size: 14px;">(用户名生成规则：用户名=前缀+序号)</p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="group" style="margin-bottom: 20px">
                                                        <div class="group">
                                                            <label class="fl tl">固定密码：</label>
                                                            <div class="fl c333">
                                                                <input class="form-control" id="PwdName2" name="PwdName2" type="password" maxlength="20" data-id="5" onkeyup="changeStyle('PwdName2',85,50,0)" onblur="changeStyle('PwdName2',85,50,0)" />
                                                            </div>

                                                            <%--<div class="col-md-2 col-sm-2" style="width: 130px;">固定密码:</div>
                                                            <div class="col-md-3 col-sm-3">
                                                                <input class="form-control" id="PwdName2" name="PwdName2" type="password" maxlength="20" data-id="5" />
                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div class="row" style="text-align: center; margin-top: 20px;">
                                            <div class="col-sm-6 col-xs-5 text-right">
                                                <button type="submit" class="btn btn-sm f14 x_btn" style="background-color: orange; color: white" id="SubmitID">保存</button>
                                            </div>
                                            <div class="col-sm-1 col-xs-5 text-right">
                                                <button type="button" class="btn btn-sm f14 x_btn" id="CancelID" style="color: white" data-dismiss="modal">取消</button>
                                            </div>
                                        </div>
                                    </form>

                                </div>

                            </div>
                            <!--批量导入-->
                            <div class="tab-pane fade " id="Lead-in">
                                <div class="row" style="margin: 15px 0px 0px 0px;">
                                    <form id="form1" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
                                        <div class="pldr mt100 pt50 pl80">
                                            <div class="form-group overflow">
                                                <label class="fl">批量导入：</label>
                                                <div class="fl c333">
                                                    <input id="fileUpload" name="fileUpload" type="file" style="display: none" />

                                                    <input id="fileText" type="text" class="form-control" disabled />
                                                </div>
                                                <div class="fl">

                                                    <button type="button" class=" btn btn-sm" onclick="$('#fileUpload').click()">浏览</button>
                                                    <button type="button" class=" btn  btn-sm" id="upload" name="upload" onclick="uploadimg()">导入</button>

                                                    <span class="f12 c666 pl5">(单次最多导入300个)</span>
                                                </div>
                                            </div>
                                            <div class="form-group overflow mt15">
                                                <label class="fl" for="name">下载模版：</label>
                                                <div class="fl zhuse pl20 pr20" id="div1" style="display: block">
                                                    <a href="Ajax/批量导入成员信息.xls" download="批量导入成员信息">批量导入成员信息模板.xlss</a>
                                                    <font color="red">(Excel中红色标注为必填项)</font>
                                                </div>
                                                <div class="fl">
                                                    <span class="f12 c666 pl5">(单次最多导入300个)</span>
                                                </div>
                                            </div>
                                            <div class="row mt100 mb100">
                                                <div class="col-sm-12 tc pt50">
                                                    <button type="button" class="btn btn-sm f14 x_btn1 mr80" data-dismiss="modal">取消</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 批量转移部门弹框 -->
    <!--<div class="modal fade x_plzy" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 50%; width: 100%">
                        <h4 class="modal-title text-center xia_title">
                            批量转移部门
                        </h4>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group  text-right" style="margin-top: 20px">
                                    <label class="col-sm-3  col-xs-4 control-label mt5 nopr ml50">*目标位置：&nbsp;</label>
                                    <div class="col-sm-6 col-xs-6 nopl">
                                        <select class="form-control" id="editRoleType">
                                            <option value="0">全部分类</option>
                                            <option value="2" selected="selected">管理员</option>
                                            <option value="3">普通用户</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 80px; margin-bottom:10px">
                                <div class="col-sm-6  col-xs-6 text-right">
                                    <button onclick="EditRoleValue()" type="button" class="btn btn-sm
                 f14" data-toggle="modal" data-target=".x_plzy_sure">确定</button>
                                </div>
                                <div class="col-sm-2  col-xs-3  text-right">
                                    <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>-->
    <!-- 批量转移成功提示 -->
    <!--<div class="modal fade x_plzy_sure" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 50%; width: 100%">
                        <h4 class="modal-title text-center xia_title">
                            提示
                        </h4>
                        <div class="modal-body">
                            <p class="tc f16 c666 pt80 pb80">批量转移成功！</p>
                        </div>
                    </div>

                </div>

            </div>-->
    <!-- 删除成员弹框 -->
    <!--<div class="modal fade x_del" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 50%; width: 100%">
                        <h4 class="modal-title text-center xia_title">
                            提示
                        </h4>
                        <div class="modal-body">
                            <div class="row">
                                <p class="f16 c666 pl30 pr20 mt15 pb50">您确定将该成员放入回收站吗？删除后该成员对应的数据也将一起删除。</p>
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

                </div>

            </div>-->
    <!-- 批量删除成员弹框 -->
    <!--<div class="modal fade x_dels" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 50%; width: 100%">
                        <h4 class="modal-title text-center xia_title">
                            提示
                        </h4>
                        <div class="modal-body">
                            <div class="row">
                                <p class="f16 c666 tc mt30 pb50">您确定要将所选成员放入回收站吗？</p>
                            </div>
                            <div class="row" style="margin-top: 30px">
                                <div class="col-sm-6  col-xs-6 text-right">
                                    <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">确定</button>
                                </div>
                                <div class="col-sm-2  col-xs-3  text-right">
                                    <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>-->
    <!-- 重置密码提示弹框 -->
    <!--<div class="modal fade x_czmm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 50%; width: 100%">
                        <h4 class="modal-title text-center xia_title">
                            提示
                        </h4>
                        <div class="modal-body">
                            <div class="row">
                                <p class="f16 c666 tc mt30 pb50">您确定要将密码重置吗？重置密码为123456。</p>
                            </div>
                            <div class="row" style="margin-top: 30px">
                                <div class="col-sm-6  col-xs-6 text-right">
                                    <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">确定</button>
                                </div>
                                <div class="col-sm-2  col-xs-3  text-right">
                                    <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>-->
    <!-- 批量重置密码提示弹框 -->
    <!--<div class="modal fade x_czmms" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog">
                    <div class="modal-content" style="margin-top: 50%; width: 100%">
                        <h4 class="modal-title text-center xia_title">
                            提示
                        </h4>
                        <div class="modal-body">
                            <div class="row">
                                <p class="f16 c666 tc mt30 pb50">您确定要将所选成员的密码批量重置吗？重置密码为123456。</p>
                            </div>
                            <div class="row" style="margin-top: 30px">
                                <div class="col-sm-6  col-xs-6 text-right">
                                    <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">确定</button>
                                </div>
                                <div class="col-sm-2  col-xs-3  text-right">
                                    <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>-->
    <input type="hidden" id="DepID" />
    <input type="hidden" id="DepIDs" />
    <input type="hidden" id="DA" />
    <input type="hidden" id="U_ID" />
    <!-- JS Scripts-->
    <script src="../../JS/ExtendJS.js"></script>
    <script>
        var addDepartmentAuthority;
        //function LoadAddDepartmentAuthority() {

        //    GetTrees = $("#DauthorityAdd").ligerComboBox({
        //        width: "100%",
        //        selectBoxWidth: "90%",
        //        selectBoxHeight: 150,
        //        valueField: 'id',
        //        textField: 'text',
        //        treeLeafOnly: false,
        //        tree: {
        //            onSuccess: function () {
        //                setTimeout(function () {
        //                    var manager = $(".l-tree").ligerGetTreeManager();
        //                }, 1000);
        //            },
        //            onBeforeSelect: function (node) {
        //                //$("#DepIDs").val(node.data['id']);
        //            },
        //            url: 'Ajax/DepartmentMain.ashx?Remark=DepartmentAuthorityRole&Roletype=' + RoleTypeByid + '&rnd=' + Math.random(),
        //            usericon: 'd_icon',
        //            idFieldName: 'id',
        //            checkbox: true,
        //            cache: false,

        //        }, onSelected: function (value, text) {
        //            $("#DauthorityAdd").val(text);
        //            //    $("#DA").val(value);
        //            //    $('#UserInfoAdd').data('bootstrapValidator')
        //            //.updateStatus('Dauthority', 'NOT_VALIDATED', null)
        //            //.validateField('Dauthority');

        //        }
        //    });
        //}

        function uploadimg() {
            var filename = $("#fileText").val();
            if (filename == null || filename == "") {
                layer.alert('请上传文件', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                }, function () {
                    layer.closeAll('dialog');

                });

            } else {
                $("#form1").ajaxSubmit({
                    type: "get",
                    url: "Ajax/ExcelImport.ashx", /* 注意后面的名字对应CS的方法名称 */
                    data: { filename: filename, rnd: Math.random(), type: '1' }, /* 注意参数的格式和名称 */
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (result) {
                        if (result != null && result != "") {
                            result = result.split(",");

                            $('#mdoels').modal('hide');
                            var msg = "";
                            msg = "上传成功" + result[0] + "条";// + ",";//+ "上传失败" + result[1] + "条";
                            layer.alert(msg, {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            }, function () {
                                window.location.href = "MemberManagement.aspx";
                            });

                        } else {
                            layer.alert('成功上传0条！', {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            }
                );
                        }
                    }
                });
            }

        }
        //全选
        function funchange(obj) {

            if (obj.checked) {
                $("input[type=checkbox][name=checkbox]").prop("checked", true);
            } else { $("input[type=checkbox][name=checkbox]").prop("checked", false); }
        }
        $('.x_xg').on('click', function () {
            $('.x_ckzl .x_zlxq.x_zlxq_xgzl').css('display', 'block')
            $('.x_ckzl .x_zlxq.x_zlxq_ckzl ').css('display', 'none')
        })
        var navName = '/FunctionModular/BasicSetting/MemberManagement.aspx';
        var RoleTypes = 0;
        var GetFuntionType = 0;
        var RoleTypeByid = 0;
        initSelectInput("Remark=1", "Sel_RoleType", "--角色名称--");//初始化量表类别
        initSelectInput("Remark=1", "R_IDs", "--角色名称--");//初始化量表类别
        //日期格式加bootsop验证
        $("#birthdays").datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            pickerReferer: "#birthdays",
            format: "yyyy-mm-dd",//日期格式
            endDate: new Date()

        }).on('hide', function (e) {
            $('#UserInfoAdd').data('bootstrapValidator')
                .updateStatus('BirthdayAdd', 'NOT_VALIDATED', null)
                .validateField('BirthdayAdd');
        });

        OnLoadTreeCom();
        //OnDauthority();
        OnLoadTreeComD();


        UserInfoUpdate();
        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        $("#LBGL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');
        /*列表展现部分 */

        /*
               创建时间：2016-09-07
               创建人：刘玉京
               功能介绍：加载量表列表集合
       */
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引

        var LoginName = "";
        var RoleName = "";
        var departmentname = "";
        var sex = "";
        var dtDetail;
        InitTable();

        function InitTable() {


            LoginName = $("#LoginName").val();
            RoleName = $("#RoleName").val();
            departmentname = $("#T_parent_val").val();
            sex = $("#sex").val();
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
            dtDetail = $('#DataTables-Gauge').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: true,
                        aTargets: [0]
                    },
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/MemberManagement.ashx",
                    dataSrc: "data",
                    async: true,
                    data: function (d) {
                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        Endindex = 0;
                        Starindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                            $("#selectAll").removeAttr("checked", "checked");
                        }
                        return 'type=1&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&LoginName=' + LoginName + '&RoleName=' + RoleName + '&departmentname=' + departmentname + '&sex=' + sex;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    $('td:eq(0)', row).html(" <input class='childCheck' data-address='" + data[9] + "' data-remark='" + data[10] + "' data-birthday='" + data[11] + "' data-tel='" + data[12] + "' data-email='" + data[13] + "' data-name=" + data[2] + " name=checkbox type=\"checkbox\" name='CheckboxID' value=\"" + data[0] + "\" />");
                    var operation = "";
                    operation =

                   " <button  class='btn btn-link showPersonalInfo' data-id=" + data[0] + " data-toggle='modal'; data-target='#viewPersonalInfo'  >查看资料</button>"
                    + " <button  class=\"btn btn-link\" name='QX_UpdateUserPwd' data-id='58' onclick='u_updatepwd(" + data[0] + ")'>重置密码</button>"
                    + " <button class=\"btn btn-link\" data-id='57' name='QX_DeleteUser' data-name=" + data[2] + " value=" + data[0] + " onclick='u_delete(this)'>删除成员</button>";
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(5)', row).css("text-align", "center");
                    $('td:eq(6)', row).css("text-align", "center");
                    if ((dataIndex + 1) % 2 == 0) {

                    }
                    $('td:eq(7)', row).html(operation);
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

        $(document).on("click", "#go_search", function () {

            LoginName = $("#LoginName").val();
            RoleName = $("#Sel_RoleType").val();
            departmentname = $("#T_parent_val").val();
            sex = $("#sex").val();
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
        });

        //判断名称格式与长度
        function txtNameCheck(data, length) {
            var obj = data.getAttribute('name');
            var txt = $("[name=" + obj + "]").val();
            var le = parseInt(length);
            if (txt.length > le) {
                var a = $(this).find("[data-bv-for=" + obj + "]");
                txt = txt.substring(0, le);
                $("[name=" + obj + "]").val(txt);
                $("small[data-bv-for=" + obj + "]").text('');
                $("[name=" + obj + "]").css("border-color", "#2b542c");
                $('[data-bv-icon-for=' + obj + ']i').css('display', 'none');
            }
        }
        function txtNameCheckA(data, length) {
            var obj = data.getAttribute('name');
            var txt = $("[name=" + obj + "]").val();
            $('[data-bv-icon-for=' + obj + ']i').css('top', '0px');

            $('[data-bv-icon-for=' + obj + ']i').css('left', '240px');
            $("small[data-bv-for=" + obj + "]").css('margin-left', '100px')
            //var le = parseInt(length);
            //if (txt.length > le) {
            //    var a = $(this).find("[data-bv-for=" + obj + "]");
            //    txt = txt.substring(0, le);
            //    $("[name=" + obj + "]").val(txt);
            //    $("small[data-bv-for=" + obj + "]").text('');
            //    $("[name=" + obj + "]").css("border-color", "#2b542c");
            //    $('[data-bv-icon-for=' + obj + ']i').css('display', 'none');
            //}
        }

        /*-----列表展现部分END-----*/

        /*----------文件上传----------*/
        $("#fileUpload").change(function () {
            $("#fileText").val($(this).val());
        });
        //修改成员信息时---角色改变选中的值
        $("#R_IDs").change(function () {
            R_IDs_Change();
        });
        function R_IDs_Change() {
            GetFuntionType = $('#R_IDs').children('option:selected').attr("data-name");
            RoleTypeByid = $('#R_IDs').children('option:selected').attr("data-id");
            if (GetFuntionType == 4) {
                $("#Div_U_Consult").show();
                $("#Div_GoodField").show();
                //$("#Did_Remark").hide();
            } else {
                $("#Div_U_Consult").hide();
                $("#Div_GoodField").hide();
                $("#Did_Remark").show();
            }
            if (RoleTypeByid == 3) {
                //$("#departmentRight").find("div").remove();
                //$("#departmentRight").find("input").remove();
                //$("#departmentRight").append('<input id="Dauthority" name="Dauthority" style="top: 0; height: 20px;" />');
                $("#Dauthority").ligerGetComboBoxManager().clearContent();
                OnLoadTreeComsA();
                GetTrees.selectValue(0);
                $("#Dauthority").attr("disabled", true);
            } else {
                $("#Dauthority").attr("disabled", false);
            }
        }

        //添加成员是----角色改变选中的值
        $("#R_ID").change(function () {
            GetFuntionType = $(this).children('option:selected').attr("data-name");
            RoleTypeByid = $(this).children('option:selected').attr("data-id");
            if (GetFuntionType == 4) {
                $("#Div_U_Consult").show();
                $("#Div_GoodField").show();
                //$("#Did_Remark").hide();
            } else {
                $("#Div_U_Consult").hide();
                $("#Div_GoodField").hide();
                $("#Did_Remark").show();
            }
            if (RoleTypeByid == 3) {
                $("#DauthorityAdd").ligerGetComboBoxManager().clearContent();
                OnLoadTreeComsA();
                GetTrees.selectValue(0);
                $("#DauthorityAdd").attr("disabled", true);
            } else {
                $("#DauthorityAdd").attr("disabled", false);
            }
        });
        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).find("option").remove();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            t = setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/Type.ashx",
                    data: types,//要执行查询的数据参数
                    success: function (msg) {
                        clearTimeout(t);
                        $.each(eval(msg), function (index, item) {

                            $("#" + controlname).append("<option value='" + item.Value + "'  data-name='" + item.Funtype + "' data-id='" + item.RoleType + "' data-mark='" + item.Text + "'>" + item.Text + "</option>");

                        });

                    }
                });
            }, 100);

        }
        /*------查----看-----*/
        /*----编辑----*/
        function editInfo(obj, Dname, RoleName) {
            var U_ID = obj;
            $("#UserIDhid").val(obj);
            var U_ID = obj;
            $.ajax({
                url: "Ajax/RoleUpdate.ashx?type=1",
                data: { U_ID: U_ID },
                type: "get",
                success: function (result) {
                    result = eval('(' + result + ')');
                    $("#RoleName").val(RoleName);
                    $("#Role_Type").val(result.Role_Type)
                    $("#LoginName01").val(result._u_loginname);
                    $("#DepartmentName").val(Dname);
                    $("#UserName").val(result._u_name);
                    $("#Sex").val(result._u_sex);
                    $("#StudentID").val(result._student_id);//学号
                    $("#birthday").val(result._u_birthday);
                    $("#Email").val(result._u_email);
                    $("#Tel").val(result._u_tel);
                    $("#Remark").val(result._u_remark);
                    $("#P_Email").val(result._u_parentsemail);
                    $("#P_Tel").val(result._u_parentstel);
                    $("#U_ID").val(U_ID)
                    $('#mychakan').modal('show');
                }
            })
        }

        /*-----点击删除-----*/
        function u_delete(obj) {
            var name = obj.getAttribute("data-name");
            var U_ID = obj.value;
            layer.confirm('您确定将该成员放入回收站吗?（删除后该成员对应的数据也将一起删除）', {
                btn: ['是', '否'] //按钮
            }, function () {

                $.ajax({
                    url: "Ajax/RoleDelrte.ashx?type=1",
                    data: { U_ID: U_ID, name: name },
                    type: 'get',
                    success: function (result) {
                        if (result) {
                            layer.msg('删除成功！', { icon: 1 });
                            $("#selectAll").attr("checked", false);
                            $("#DataTables-Gauge").DataTable().draw();
                        }
                        else {
                            layer.msg('删除失败！', { icon: 1 });
                        }
                    }

                })

            });
        }
        /*-----批量删除-----*/
        function u_deletes() {
            var checkArray = window.GetCheckedCheckBox();
            if (checkArray.length == 0) {
                layer.alert('请选择成员！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
                return;
            }
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                var U_IDsnames = "";
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {
                        U_IDs += checkbox[i].value + ",";
                        U_IDsnames += checkbox[i].getAttribute("data-name") + ',';
                    }
                }

                if (U_IDs.length > 0) {
                    layer.confirm('您确定要将所选条目放入回收站吗？', {
                        btn: ['是', '否'] //按钮
                    }, function () {
                        $.ajax({
                            url: "Ajax/RoleDelrte.ashx?type=2",
                            data: { U_IDs: U_IDs, name: U_IDsnames },
                            type: 'get',
                            success: function (result) {
                                if (result == "True") {
                                    layer.msg('删除成功！', { icon: 1 });
                                    $("#selectAll").attr("checked", false);
                                    $("#DataTables-Gauge").DataTable().draw();
                                }
                                else {
                                    layer.msg('删除失败！', { icon: 1 });
                                }
                            }

                        })


                    });
                } else {
                    layer.alert('请选择成员！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            } else {
                layer.alert('请选择成员！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
            }
        }
        /*-----点击密码重置-----*/
        function u_updatepwd(U_ID) {
            layer.confirm('您确定要将密码重置吗？重置密码为123456', {
                btn: ['重置', '取消'] //按钮
            }, function () {
                $.ajax({

                    url: "Ajax/MemberManagement.ashx?type=3",
                    data: { U_ID: U_ID },
                    type: "POST",
                    success: function (result) {
                        if (result == "True") {
                            layer.msg('密码重置成功！', { icon: 1 });
                            $("#DataTables-Gauge").DataTable().draw();
                        }
                        else {
                            layer.msg('密码重置失败！', { icon: 1 });

                        }
                    }

                })

            });
        }
        /*-----密码重置-----*/
        function u_updatepwds() {
            var checkArray = window.GetCheckedCheckBox();
            if (checkArray.length == 0) {
                layer.alert('请选择成员！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
                return;
            }
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var chenum = "";
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        U_IDs += checkbox[i].value + ",";
                    }
                }
                if (U_IDs.length > 0) {
                    layer.confirm('您确定要将密码重置吗？重置密码为123456', {
                        btn: ['重置', '取消'] //按钮
                    }, function () {
                        $.ajax({
                            url: "Ajax/MemberManagement.ashx?type=4",
                            data: { U_IDs: U_IDs },
                            type: 'get',
                            success: function (result) {
                                if (result == "True") {
                                    layer.msg('密码重置成功！', { icon: 1 });
                                    $("#DataTables-Gauge").DataTable().draw();
                                }
                                else {
                                    layer.msg('密码重置失败！', { icon: 1 });

                                }
                            }

                        })


                    });
                } else {
                    layer.alert('请选择成员！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            } else {
                layer.alert('请选择成员！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
            }
        }

        /*隐藏转移部门的遮罩*/
        function hideZYDepart() {
            $('#ZYDepart').modal('hide');
        }
        /*-----部门转移-----*/
        function u_updateBM() {
            var checkbox = $("#DataTables-Gauge").find("input[type=checkbox]").not("#selectAll");
            $('[class=l-box-select]').css({ "width": "auto", "text-align": "left" });
            var isRemind = false;
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked)
                    isRemind = true;
            }
            if (isRemind) {
                ZY_Tree.selectValue(0);
                $('#ZY_Department').val('');
                $('#ZY_Department').attr('data-value', '0');
                $('#tip').css("display", "none");

                $('#ZYDepart').modal('show');
            }
            else {
                layer.alert('请选择成员！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
            }
            //if (checkbox.length > 0) {
            //    var chenum = "";
            //    var U_IDs = "";//注意
            //    for (var i = 0; i < checkbox.length; i++) {
            //        if (checkbox[i].checked) {
            //            U_IDs += checkbox[i].value + ",";
            //        }
            //    }
            //    if (U_IDs.length > 0) {
            //        $('#ZYDepart').show();
            //    } else {
            //        layer.alert('请选择成员！', {
            //            skin: 'layui-layer-lan', //样式类名
            //            closeBtn: 0
            //        });
            //    }
            //}
        }
        /*转移部门*/
        function TransferDepart() {

            var checkbox = $("#DataTables-Gauge").find("input[type=checkbox]").not("#allCheck");
            var chenum = "";
            var U_IDs = "";//成员id
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].getAttribute('id') != 'selectAll' && checkbox[i].checked) {
                    U_IDs += checkbox[i].value + ",";
                }
            }
            var did = $("#ZY_Department").attr('data-value');//部门id
            $.ajax({
                url: "Ajax/MemberManagement.ashx?type=11",
                data: { U_IDs: U_IDs, D_ID: did },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        $('#ZYDepart').modal('hide');

                        layer.msg('批量转移部门成功！', { icon: 1 });
                        $("#DataTables-Gauge").DataTable().draw();
                    }
                    else {
                        layer.msg('批量转移部门失败！', { icon: 1 });
                    }
                }
            })
        };

        /*-----查询单条数据---------*/

        var groupTree;
        var GetTrees;
        function seupdate(obj) {

            quxis();
            $("#UserInfoUpdate").data('bootstrapValidator').destroy();
            UserInfoUpdate();

            $('[class=l-box-select]').css("width", "auto");

            var uid = obj.getAttribute('data-id');
            $("#Dauthority").val('');
            $("#DepID").val("");
            $(".UserAdd").remove();
            $(".UserID").remove();
            //$("#UserInfoAdd").data('bootstrapValidator').destroy();
            //$('#UserInfoAdd').data('bootstrapValidator', null);
            //$("#UserInfoUpdate").data('bootstrapValidator').destroy();
            //$('#UserInfoUpdate').data('bootstrapValidator', null);
            UserAdd();
            $("#UserIDhid").val(uid);
            $("#U_ID").val(uid);
            var U_ID = uid;
            $.ajax({
                url: "Ajax/RoleUpdate.ashx?type=1",
                data: { U_ID: U_ID },
                type: "get",
                success: function (result) {
                    result = eval('(' + result + ')');
                    //$("#DIDW").val(Did);
                    $("#R_IDs").val(result._r_id);
                    R_IDs_Change();
                    $("#Role_Type").val(result.role_type)
                    $("#U_LoginName").val(result._u_loginname);

                    //groupTree.reload();
                    //初始化选中
                    if (result.role_type != '3' && (result._departmentauthority != null && result._departmentauthority != "" && result._departmentauthority != 0)) {
                        //alert(result._departmentauthority);
                        GetTrees.selectValue(result._departmentauthority);
                        GetTrees.selectedText.replace(/;null/g, '');
                        $("#Dauthority").val($("#Dauthority").val().replace(/;null/g, ''));
                        //$("#Dauthority").val(result._departmentauthority);
                    }
                    else {
                        $("#Dauthority").val("无");
                    }
                    if (result._department_id != null && result._department_id != "") {
                        SS_DeTree.selectValue(result._department_id);
                        $("#DepIDs").val(result._department_id);
                    } else {
                        $("#Department_IDs").val("无");
                    }
                    $("#U_Names").val(result._u_name);
                    $("#Sexs").val(result._u_sex);
                    $("#StudentIDs").val(result._student_id);//学号
                    $("#birthdays").val(result._u_birthday);
                    $("#Emails").val(result._u_email);
                    $("#tels").val(result._u_tel);
                    $("#U_Remarkss").val(result._u_remark);
                    $("#P_Emails").val(result._u_parentsemail);
                    $("#P_Tels").val(result._u_parentstel);
                    $("#U_ID").val(U_ID);
                    $("#U_Consult").val(result._CouIntroduce);
                    $("#GoodField").val(result._CouSkilledField)


                    if (result._u_addfield != null && result._u_addfield != "") {

                        var obj = JSON.parse(result._u_addfield);
                        $.each(obj, function (name, item) {
                            var tr = "";
                            tr = "<div class='form-group UserID' ><input  type='text'  class='col-sm-2 col-xs-3 control-label' data-name='field' value=" + item["Field"] + " style='margin-left: 2%;width: 14%;' />";
                            tr += "<div class='col-sm-10 col-xs-10 nameid'><input  type='text'  class='form-control'  data-name='value' value=" + item["Value"] + " /></div></div>";
                            $("#useradds").append(tr);
                        });

                    }
                    var RoleTypeByids = $("#R_IDs").children('option:selected').attr("data-id");
                    if (RoleTypeByids == 3) {
                        //OnDauthority();
                        GetTrees.selectValue(0);
                        $("#Dauthority").attr("disabled", true);
                    } else {
                        $("#Dauthority").attr("disabled", false);
                    }
                    $('#mdoels').modal('show');
                }
            })
        }


        /*为空*/
        function trim(str) {
            if (str != undefined)
                return str.replace(/(^\s*)|(\s*$)/g, "");
            else
                return false;
        }
        //校验用户姓名：只能输入1-16个以字母开头的字串
        function isTrueName(str) {
            return str.replace(/^[a-zA-Z]{1,16}$/);
        }
        //校验密码：只能输入6-20个字母、数字、下划线
        function isPasswd(s) {
            var patrn = /^(\w){6,20}$/;
            if (!patrn.exec(s)) return false
            return true
        }
        //校验邮箱
        function isEmail(str) {
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (filter.test(str)) return true;
            else { return false; }
        }

        /*--------修--改-------*/
        var isUpdate = false;
        function UserInfoUpdate() {
            $('#UserInfoUpdate').bootstrapValidator({

                message: '表单验证失败.',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    RoleName: {
                        //group: '.group',
                        message: '角色名验证失败',
                        verbose: false,
                        validators: {
                            notEmpty: {
                                message: '角色名不能为空'
                            },
                            callback: {
                                message: '请选择角色',
                                callback: function (value, validator) {
                                    $('[data-bv-icon-for="RoleName"]i').css('top', '0px');

                                    $('[data-bv-icon-for="RoleName"]i').css('left', '240px');
                                    $('small[data-bv-for="RoleName"]').css('margin-left', '100px')
                                    return value != 0;
                                }
                            }
                        }
                    },
                    LoginName: {
                        message: '用户名验证失败',
                        verbose: false,
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            stringLength: {
                                min: 1,
                                max: 30,
                                message: '用户名长度必须介于4到20之间'
                            },
                            threshold: 3,
                            callback: {
                                message: '登录名已存在',
                                callback: function (value, validator) {
                                    var IsTrue;
                                    var UserID = $('#UserIDhid').val();
                                    $.ajax({
                                        url: "Ajax/MemberManagement.ashx?type=6",
                                        type: "GET",
                                        data: { LoginName: value, UserID: UserID },
                                        dataType: "text",
                                        async: false,
                                        success: function (data) {
                                            var json = eval('(' + data + ')')
                                            IsTrue = json.valid;
                                        }
                                    });
                                    return IsTrue == true;
                                }
                            },


                        }
                    },
                    UserName: {
                        //group: '.group',
                        verbose: false,
                        message: '姓名输入有误',
                        validators: {
                            //notEmpty: {
                            //    message: '用户姓名不能为空.'
                            //},
                            stringLength: {
                                min: 2,
                                max: 10,
                                message: '用户名姓名不能小于2位，且不能大于10位'
                            },
                            regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            },
                            callback: {
                                message: '用户姓名不能为空.',
                                callback: function (value, validator) {
                                    $('[data-bv-icon-for="UserName"]i').css('top', '0px');

                                    $('[data-bv-icon-for="UserName"]i').css('left', '240px');
                                    $('small[data-bv-for="UserName"]').css('margin-left', '100px')
                                    return value != "" && value != null;
                                }
                            },
                        }
                    },
                    Sex: {
                        //group: '.group',
                        validators: {
                            callback: {
                                message: '请选择性别',
                                callback: function (value, validator) {
                                  
                                    return value != null;
                                }
                            }
                        }
                    },
                    Birthday: {
                        //group: '.group',
                        message: '出生日期有误',
                        validators: {
                            callback: {
                                message: '出生日期不能为空.',
                                callback: function (value, validator) {
                                    $('[data-bv-icon-for="Birthday"]i').css('top', '0px');

                                    $('[data-bv-icon-for="Birthday"]i').css('left', '240px');
                                    $('small[data-bv-for="Birthday"]').css('margin-left', '100px')
                                    return value != "" && value != null;
                                }
                            },
                        }
                    },
                    Department: {
                        //group: '.group',
                        validators: {
                            callback: {
                                message: '请选择所属部门',
                                callback: function (value, validator) {
                                    //chageSmallStyle('Department','70');
                                    //changeIStyle('Department', '40', '-25');
                                    return value != "无" && value !== "";
                                }
                            }
                        }
                    },
                    //Department_IDs: {
                    //    validators: {
                    //        callback: {
                    //            message: '请选择所属部门',
                    //            callback: function (value, validator) {                                    
                    //                return value != "无" && value !== "";
                    //            }
                    //        }
                    //    }
                    //},
                    Email: {
                        //group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                                message: '请输入正确的邮箱格式'
                            },
                            callback: {
                                message: '邮箱不能为空',
                                callback: function (value, validator) {
                                    $('[data-bv-icon-for="Email"]i').css('top', '0px');

                                    $('[data-bv-icon-for="Email"]i').css('left', '240px');
                                    $('small[data-bv-for="Email"]').css('margin-left', '100px')
                                    return value != "" && value !=null;
                                }
                            }
                        }
                    },
                    Tel: {
                        //group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^1[0-9]{10}$/,
                                message: '请输入有效的手机号'
                            },
                            callback: {
                                message: '手机号不能为空',
                                callback: function (value, validator) {
                                    $('[data-bv-icon-for="Tel"]i').css('top', '0px');

                                    $('[data-bv-icon-for="Tel"]i').css('left', '240px');
                                    $('small[data-bv-for="Tel"]').css('margin-left', '100px')
                                    return value != 0;
                                }
                            }
                        }
                    }, Student: {
                        //group: '.group',
                        message: '学号验证失败',
                        validators: {
                            numeric: { message: '只能输入数字' },
                            stringLength: {
                                min: 0,
                                max: 20,
                                message: '用户名姓名不能大于500位'
                            }
                        }
                    }, Remark: {
                        //group: '.group',
                        message: '成员描述',
                        validators: {
                            stringLength: {
                                min: 0,
                                max: 500,
                                message: '用户名姓名不能大于500位'
                            }
                        }
                    }
                }

            }).on('success.form.bv', function (e) {
                if (!isUpdate) {
                    $("#Sumit").attr({ "disabled": "disabled" });
                    setInterval('desem()', 2000);
                    /*获取用户自定义信息json串 */
                    var fields = $("[data-name=field]");
                    var value = $("[data-name=value]");
                    var strJson = [];
                    if (fields.length > 0) {
                        for (var i = 0; i < fields.length; i++) {
                            if (i == fields.length - 1 && $(fields[i]).val() == "" && $(fields[i]).text() == "") {
                                layer.alert('请输入自定义信息!', {
                                    skin: 'layui-layer-lan', //样式类名
                                    closeBtn: 0
                                })
                                return;
                            }
                            if ($(fields[i]).val() == "" && $(fields[i]).text() != "") {
                                var field = $(fields[i]).text().replace(":", "");
                                var str = { 'Field': field, 'Value': $(value[i]).val() };
                            }
                            if ($(fields[i]).val() != "") {
                                var field = $(fields[i]).val().replace(":", "");
                                var str = { 'Field': field, 'Value': $(value[i]).val() };
                            }

                            strJson.push(str);
                        }
                    }
                    var U_AddField = JSON.stringify(strJson);//新增字段
                    var Role_Type = $("#R_IDs").val();
                    var U_LoginName = $("[data-update=loginName]").val();
                    var Department_IDs = $("#DepIDs").val()
                    var U_Names = $("[data-update=userName]").val();
                    var Sexs = $("[data-update=sex]").val();
                    var StudentIDs = $("#StudentIDs").val();//学号
                    var birthdays = $("#U_Birthday").val();
                    var Emails = $("[data-update=email]").val();
                    var tels = $("[data-update=cellPhone]").val();
                    var Remarks = $("[data-update=remark]").val();
                    var Address = $("[data-update=homeAddress]").val();
                    var U_ID = $("#U_ID").val();
                    var R_IDs = $("#R_IDs").val();
                    var DA = $("#DA").val();
                    var U_Consult = "";
                    var GoodField = "";
                    if (GetFuntionType == 4) {
                        U_Consult = $("#U_Consult").val();
                        GoodField = $("#GoodField").val();
                    }
                    if (RoleTypes == 4 && GetFuntionType == 0) {
                        RoleTypes = 4;
                    } else if (RoleTypes == 3 && GetFuntionType == 4) {
                        RoleTypes = 3;
                    } else if (RoleTypes == 4 && GetFuntionType == 4) {
                        RoleTypes = 2;
                    }
                    else {
                        RoleTypes = 0;
                    }
                    DA = DA.replace(";", ",");
                    if (Department_IDs == "null" || Department_IDs == null || Department_IDs == "0" || Department_IDs == "") {
                        layer.alert('所属部门不能为空!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })
                        return;
                    }
                    $.ajax({
                        url: "Ajax/RoleUpdate.ashx?type=2",
                        data: {
                            U_ID: U_ID,
                            Role_Type: Role_Type,
                            RoleID: R_IDs,
                            U_LoginName: U_LoginName,
                            Department_IDs: Department_IDs,
                            U_Names: U_Names,
                            Sexs: Sexs,
                            StudentIDs: StudentIDs,
                            birthdays: birthdays,
                            Emails: Emails, tels: tels,
                            Remarks: Remarks,
                            Address: Address,
                            U_AddField: U_AddField,
                            DA: DA,
                            U_Consult: U_Consult,
                            GoodField: GoodField,
                            GetFuntionType: GetFuntionType,
                            RFType: RoleTypes,

                        },
                        type: "post",
                        dataType: "text",
                        success: function (data) {
                            if (data) {
                                $("#DataTables-Gauge").DataTable().draw();
                                $('#mdoels').modal('hide');
                                $(".UserAdd").remove();
                                $(".UserID").remove();
                                layer.msg('保存成功！', { icon: 1, time: 2000 }, function () {
                                    $("#viewPersonalInfo").modal("hide");
                                    isUpdate = true;
                                    $("#DataTables-Gauge").DataTable().draw(false);
                                });


                            } else {
                                layer.alert('保存失败!', {
                                    skin: 'layui-layer-lan', //样式类名
                                    closeBtn: 0
                                }, function () {

                                }
                    );
                            }
                        }
                    })
                }
            });
        }
        function desem() {
            $('#Sumit').removeAttr("disabled")  //部门解禁 禁用
        }
        function OnLoadTreeCom() {
            var tmep = false;
            $("#T_parent").ligerComboBox({
                width: "100%",
                selectBoxWidth: "87%",
                selectBoxHeight: 140,
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
                        $("#DepID").val(node.data['id']);
                    },
                    url: 'Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random() + '&mark=searchCondition',
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false,
                    onClick: function (node) {//单击事件
                        if ($("#T_parent").val() == "")
                            $("#DepID").val("");
                    }
                }
            });
        }
        OnLoadTreeCom_ZY();
        var ZY_Tree;
        //转移部门
        function OnLoadTreeCom_ZY() {
            ZY_Tree = $("#ZY_Department").ligerComboBox({
                width: "100%",
                selectBoxWidth: "90%",
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
                        $("#ZY_Department").attr("data-value", node.data['id']);
                    },
                    url: 'Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }, onSelected: function (value, text) {
                    $("#ZY_Department").attr("data-value", value);
                    if (value == "" || value == "0") {
                        $('#tip').css("display", "block");
                        $('#save_YZ').attr("disabled", "disabled");
                    }
                    else {
                        $('#tip').css("display", "none");
                        $('#save_YZ').removeAttr("disabled");
                    }
                }
            });

        }
        //所属部门--修改
        var SS_DeTree;
        function OnLoadTreeComD() {
            SS_DeTree = $("#Department_IDs").ligerComboBox({
                width: "100%",
                selectBoxWidth: "90%",
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
                    url: 'Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }, onSelected: function (value, text) {
                    $("#DepIDs").val(value);
                    $('#UserInfoUpdate').data('bootstrapValidator')
                    .updateStatus('Department_IDs', 'NOT_VALIDATED', null)
                    .validateField('Department_IDs');
                }
            });

        }

        //设置复选框的CheckboxID
        $(document).on("click", ".childCheck", function () {

            if (!$(this)[0].checked) {
                $(".parentCheck")[0].checked = false;
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
                $(".parentCheck")[0].checked = isSuccess;
            }

        });
        //查询的时候sex
        $(document).keyup(function (e) {
            if (e.keyCode === 13) {

                $('#go_search').trigger('click');
            }
        });
        GetShow();
        //获取权限来判断是否显示
        function GetShow() {
            $.ajax({
                url: "Ajax/RoleUpdate.ashx?type=5",
                type: 'get',
                success: function (result) {
                    result = eval("(" + result + ")");
                    if (result.RoleType == 3) {
                        $("#User").hide();

                    } else {
                        $("#User").show();
                    }
                }
            })
            $(document).on("click", ".showPersonalInfo", function () {
                var id = $(this).attr('data-id');
                $.ajax({
                    url: "Ajax/MemberManagement.ashx?type=2&uid=" + id,
                    success: function (ms) {
                        $('#showpage').css
                        ('display', 'block');
                        $('#updatepage').css
                        ('display', 'none');
                        $.ajax({
                            url: "Ajax/DepartmentMain.ashx?Remark=GetEntity_More",
                            data: {
                                ids: eval("[" + ms + "]")[0]._departmentauthority

                            },
                            success: function (e) {
                                if (e != "") {
                                    var li = eval(e);
                                    var text = '';
                                    for (var i = 0; i < li.length; i++) {
                                        text += li[i]._d_name + ",";
                                    }
                                    if (text.length > 14)
                                        text = text.substring(0, 14) + "...";
                                    $("[data-name=departmentAuthority]").text(text);
                                }
                                else
                                    $("[data-name=departmentAuthority]").text('无')//部门                              
                            }
                        })
                    }
                })
                //给查看界面的控件赋值
                $("[data-name=loginName]").text($(this).parent().parent().find("td:eq(2)").text())//登录名
                $("[data-name=userName]").text($(this).parent().parent().find("td:eq(3)").text())//姓名
                $("[data-name=sex]").text($(this).parent().parent().find("td:eq(4)").text())//性别
                $("[data-name=RoleNameAdd]").text($(this).parent().parent().find("td:eq(5)").text())//角色
                $("[data-name=belongToDepartment]").text($(this).parent().parent().find("td:eq(6)").text())//部门
                $("[data-name=department_id]").text($(this).parent().parent().find("td:eq(6)").text())//部门
                $("[data-name=cellPhone]").text($(this).parent().parent().find("input[type=checkbox]").attr("data-tel"));//手机号
                $("[data-name=email]").text($(this).parent().parent().find("input[type=checkbox]").attr("data-email"))//邮箱
                $("#homeAddress").text($(this).parent().parent().find("input[type=checkbox]").attr("data-address"))//地址
                $("#personalIntroduce").text($(this).parent().parent().find("input[type=checkbox]").attr("data-remark"))//备注
                $("[data-name=bornDate]").text($(this).parent().parent().find("td:eq(0)").find('input').attr('data-birthday'))//出生日期

                //给修改界面的控件赋值
                $("[data-update=loginName]").val($("[data-name=loginName]").text());//登录名
                $("[data-update=userName]").val($("[data-name=userName]").text());//姓名
                $("[data-update=sex]").find("option[value=" + $("[data-name=sex]").text() + "]").attr("selected", "selected");//性别
                $("[data-update=roleName]").find("option[data-mark=" + $("[data-name=roleName]").text() + "]").attr("selected", "selected")//角色
                $("[data-update=cellPhone]").val($("[data-name=cellPhone]").text());//手机号
                $("[data-update=email]").val($("[data-name=email]").text());//邮箱
                $("[data-update=homeAddress]").val($("#homeAddress").text());//地址
                $("[data-update=personalIntroduce]").val($("[data-name=personalIntroduce]").text());//个人简介
                $("[data-update=birthday]").val($("[data-name=bornDate]").text().trim());//出生日期
                $("#Department_IDs").val($("[data-name=department_id]").text().trim());//所属部门
                $('#Dauthority').val($('[data-name="departmentAuthority"]').text().trim())//部门权限
                var val = $("#R_IDs").find("option[data-mark='" + $("[data-name=RoleNameAdd]").text().trim() + "']").eq(0).attr('value');
                document.getElementById("R_IDs").value = val;
                //$('#Department_IDs_val').attr('value', '');
                $("[data-update=remark]").val($("[data-name=personalIntroduce]").text().trim());//角色

                //给修改资料按钮的data-id赋值(要修改的用户的id)
                $('[name=QX_UpdateUser]').attr('data-id', $(this).attr('data-id'));

                //groupTree.selectValue();
                $("#viewPersonalInfo").modal("show");
            })
            $(document).on("click", ".closeModal", function () {
                $("#viewPersonalInfo").modal("hide");
            })
        }

        function quxis() {
            $(".l-checkbox").removeClass('l-checkbox-checked');
            $(".l-checkbox").addClass('l-checkbox-unchecked');
        }
    </script>
    <script type="text/javascript">

        //日期格式加bootsop验证
        $("#U_Birthday").datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式
            endDate: new Date()

        }).on('hide', function (e) {
            $('#UserInfoUpdate').data('bootstrapValidator')
                .updateStatus('Birthday', 'NOT_VALIDATED', null)
                .validateField('Birthday');
        });
        var navName = '/FunctionModular/BasicSetting/MemberManagement.aspx';
        var GetFuntionType = 0;
        var RoleTypeByid = 0;
        //GetFuntion();
        initSelectInput("Remark=2", "RoleNameAll", "请选择");//初始化量表类别
        initSelectInput("Remark=1", "R_ID", "请选择");//角色全选
        //单个添加方法
        OnLoadTreeComDID();
        //批量添加方法
        OnLoadTreeComs();
        //部门权限方法
        OnLoadTreeComsA();

        GetIsOpen();
        Test();

        $("#UserName04").empty();
        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        $("#LBGL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');
        //每次点击添加成员，重置添加表单
        function addMember() {
            isSubmit = false;
            $("#DauthorityAdd").attr("disabled", false);
            $("#UserInfoAdd").data('bootstrapValidator').destroy();
            InitialValidator();
            $("#BatchAdd").data('bootstrapValidator').destroy();
            Test();

            $('[class=l-box-select]').css("width", "auto");

            document.getElementById("UserInfoAdd").reset();
            document.getElementById("BatchAdd").reset();
            $('#fileText').val('');
            $('#Lead-in').removeClass();
            $('#Lead-in').addClass('tab-pane fade')
            $('#home').removeClass();
            $('#home').addClass('tab-pane fade  active in')
            $('#profile').removeClass();
            $('#profile').addClass('tab-pane fade');
            $('#myTabs').find("li").removeClass('active');
            $('#myTabs').find("li").eq(0).addClass('active');
        }
        //查看
        function Look(obj, Dname) {
            //initSelectInput("Remark=1", "Sel_RoleType", "全部分类");
            var U_ID = obj;
            $.ajax({
                url: "Ajax/RoleUpdate.ashx?type=3",
                data: { U_ID: U_ID },
                type: "get",
                success: function (result) {
                    result = eval('(' + result + ')');
                    //$("#CRoleName").val(result._r_id);
                    //$("#Role_Type").val(result.Role_Type)
                    $("#LoginName01").val(result._u_loginname);
                    $("#DepartmentName").val(Dname);
                    $("#UserName").val(result._u_name);
                    $("#Sex").val(result._u_sex);
                    $("#StudentID").val(result._student_id);//学号
                    $("#birthday").val(result._u_birthday);
                    $("#Email").val(result._u_email);
                    $("#Tel").val(result._u_tel);
                    //$("#Remark").val(result._u_remark);
                    //$("#P_Email").val(result._u_parentsemail);
                    //$("#P_Tel").val(result._u_parentstel);
                    $("#U_ID").val(U_ID)
                    $('#mychakan').modal('show');
                }
            });
        }

        //全选
        $("#selectAll").click(function () {
            if (this.checked) {
                $("#dataTables-example :checkbox").prop("checked", true);
            }
            else {
                $("#dataTables-example :checkbox").prop("checked", false);
            }
        });
        //设置复选框的CheckboxID
        $(document).on("click", ".childCheck", function () {

            if (!$(this)[0].checked) {
                $("#selectAll")[0].checked = false;
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
                $("#selectAll")[0].checked = isSuccess;
            }

        });
        //调整错误提示的样式位置
        function chageSmallStyle(name, value) {
            $('small[data-bv-for=' + name + ']').css({ "width": "250px", "margin-left": value + "px", "top": "0px", "float": "left" });
        }
        //调整错误提示的样式位置
        function changeIStyle(name, value, top) {
            $('i[data-bv-icon-for=' + name + ']').css({ 'margin-right': value + 'px', "margin-top": top + "px" });
        }
        function changeStyle(name, Svalue, Ivalue, top) {
            $('small[data-bv-for=' + name + ']').css({ "width": "250px", "margin-left": Svalue + "px", "top": "0px", "float": "left" });
            $('i[data-bv-icon-for=' + name + ']').css({ 'margin-right': Ivalue + 'px', "margin-top": top + "px" });
        }
        //批量添加
        function Test() {
            $('#BatchAdd').bootstrapValidator({
                message: '表单验证失败.',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    RoleNameAll: {
                        //group: '.group',
                        validators: {
                            callback: {
                                message: '请将必填项填写完整',
                                callback: function (value, validator) {
                                    //$("#NumStart")
                                    chageSmallStyle('RoleNameAll', '85');
                                    changeIStyle('RoleNameAll', '70')
                                    return value != 0;
                                }
                            }
                        }
                    },
                    Department: {
                        //group: '.group',
                        validators: {
                            callback: {
                                message: '请选择所属部门',
                                callback: function (value, validator) {
                                    //   $("#NumStart")
                                    chageSmallStyle('Department', '85');
                                    changeIStyle('Department', '-250')
                                    return value != "无" && value != "" && value != null;
                                }
                            }
                        }
                    },
                    NumStart: {
                        //group: '.group',
                        message: '请将必填项填写完整！',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            numeric: { message: '序列范围只能输入数字' },
                            stringLength: {
                                min: 1,
                                max: 10,
                                message: '不能大于10个字符'
                            },
                            callback: {
                                message: '前面输入框的数字小于等于后面输入框的数字,或不等于0',
                                callback: function (value, validator) {
                                    chageSmallStyle('NumStart', '85');
                                    changeIStyle('NumStart', '160')
                                    if (value == 0) {
                                        return false;
                                    }
                                    var EndValue = $("#NumEnd").val();
                                    if (EndValue == "") {
                                        EndValue = 0;
                                    }

                                    return parseInt(value) <= parseInt(EndValue)

                                }
                            }
                        }

                    },
                    NumEnd: {
                        //group: '.group',
                        message: '请将必填项填写完整！',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            numeric: { message: '序列范围只能输入数字' },

                            callback: {
                                message: '后面输入框的值要大于前面输入框的值',
                                callback: function (value, validator) {
                                    chageSmallStyle('NumEnd', '85');
                                    changeIStyle('NumEnd', '40', '0')
                                    var startValue = $("#NumStart").val();
                                    if (startValue == "") {
                                        startValue = 0;
                                    }

                                    return parseInt(value) > parseInt(startValue);
                                }
                            },
                            callback: {
                                message: '单次最多支持添加300个',
                                callback: function (value, validator) {
                                    chageSmallStyle('NumEnd', '85');
                                    changeIStyle('NumEnd', '40', '0')
                                    if (value > 300) {
                                        return false;
                                    } else {
                                        return true;
                                    }
                                }
                            },
                        },


                    },
                    //UserNameR: {
                    //    validators: {
                    //        notEmpty: {
                    //            message: '请将必填项填写完整'
                    //        }
                    //    }
                    //},
                    UserName01: {
                        //group: '.group',
                        message: '请指定用户名生成规则名称',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            }
                            //,
                            //callback: {
                            //    callback: function (value, validator) {

                            //        //chageSmallStyle('85');
                            //    }
                            //}
                        }
                    },
                    UserName02: {
                        //group: '.group',
                        message: '请指定用户名生成规则名称',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            }, regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            },
                            callback: {
                                message: '',
                                callback: function (value, validator) {
                                    chageSmallStyle('UserName02', '85');
                                    if ($('input[name="UserNameR"]:checked').val() == 2) {
                                        $("#UserName01").attr("style", " border-color:#d0c0c0");
                                        $("#UserName03").attr("style", " border-color:#d0c0c0");
                                        $("#UserName04").attr("style", " border-color:#d0c0c0");
                                        return value != null && value != "";
                                    }
                                }
                            }
                        }
                    },
                    UserName03: {
                        //group: '.group',
                        message: '请指定用户名生成规则名称',
                        validators: {
                            regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            },
                            callback: {
                                message: '请将必填项填写完整！',
                                callback: function (value, validator) {
                                    changeStyle('UserName03', 85, 45, 0)
                                    return value != null && value != "";
                                }
                            }

                        }
                    },
                    UserName04: {
                        //group: '.group',
                        message: '请指定用户名生成规则名称',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            },
                            callback: {
                                message: '',
                                callback: function (value, validator) {
                                    chageSmallStyle('UserName04', '85');
                                    if ($('input[name="UserNameR"]:checked').val() == 3) {
                                        $("#UserName01").attr("style", " border-color:#d0c0c0");
                                        $("#UserName02").attr("style", " border-color:#d0c0c0");
                                        return value != null && value != "";
                                    }
                                }
                            }
                        }
                    },
                    PwdName: {
                        //group: '.group',
                        message: '请指定密码生成规则名称',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 1,
                                max: 20,
                                message: '密码不能小于1位，且不能大于20位'
                            },
                            callback: {
                                message: '密码有误',
                                callback: function (value, validator) {
                                    chageSmallStyle('PwdName', '85');
                                    changeIStyle('PwdName', '50')
                                    if ($('input[name="PwdR"]:checked').val() == 2) {

                                        return value != null && value != "";


                                    }
                                }
                            }
                        }
                    },
                    PwdName2: {
                        //group: '.group',
                        message: '请指定密码生成规则名称',
                        validators: {
                            stringLength: {
                                min: 6,
                                max: 10,
                                message: '密码不能小于6位，且不能大于20位'
                            },
                            //callback: {
                            //    message: '密码不能小于1位，且不能大于20位',
                            //    callback: function (value, validator) {
                            //        if (value < 6 || value > 20) {

                            //            return false;
                            //        } else {
                            //            return true;
                            //        }

                            //    }
                            //},

                            callback: {
                                message: '请将必填项填写完整！',
                                callback: function (value, validator) {
                                   
                                    chageSmallStyle('PwdName2', 85,'50',0);
                                    changeIStyle('PwdName2', '50')
                                    return value != null && value != "";
                                }
                            },


                        }
                    },
                }
            }).on('success.form.bv', function (e) {
                e.preventDefault();
                layer.open({
                    type: 1,
                    title: false,
                    closeBtn: false
                });
                //加载层
                layer.load(0, { shade: false }); //0代表加载的风格，支持0-2
                var nametype = 1;
                var username_ty = "";
                username_ty = $("#UserName03").val();
                nametype = 1;
                //if ($('input[name="UserNameR"]:checked').val() == 1) {
                //    username_ty = $("#UserName01").val();
                //    nametype = 1;
                //} else if ($('input[name="UserNameR"]:checked').val() == 2) {
                //    username_ty = $("#UserName02").val();
                //    nametype = 2;
                //}
                //else if ($('input[name="UserNameR"]:checked').val() == 3) {
                //    nametype = 3;
                //}
                var PwdR = "";
                var Pwd = "";
                Pwd = $("#PwdName2").val()
                PwdR = 2;
                //if ($('input:radio[name=PwdR]:checked').val() == 1) {
                //    PwdR = 1;
                //} else if ($('input:radio[name=PwdR]:checked').val() == 2) {
                //    Pwd = $("#PwdName2").val()
                //    PwdR = 2;
                //}
                //批量添加的方法
                $.ajax({
                    url: "Ajax/MemberManagement.ashx?type=5",
                    data: {
                        department: $("#DepIDs").val(),
                        NumStart: $("#NumStart").val(),
                        NumEnd: $("#NumEnd").val(),
                        UserNameR: $("#UserNameR ").val(),
                        nametype: nametype,
                        username_ty: username_ty,
                        UserName03: $("#UserName03").val(),
                        UserName04: $("#UserName04").val(),
                        Pwd: $("#PwdName2").val(),
                        PwdR: PwdR,
                        RoleNameAll: $("#RoleNameAll").val(),
                    },
                    type: "Get",
                    dataType: "text",
                    success: function (data) {
                        layer.closeAll();
                        if (data >= 0) {
                            $("#BatchAdd").data('bootstrapValidator').destroy();
                            $('#BatchAdd').data('bootstrapValidator', null);
                            $("#BatchAdd :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");//核心

                            var msg = "";
                            msg = "上传成功" + data + "条";
                            layer.alert(msg, {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            }, function () {

                                window.location.href = "MemberManagement.aspx";
                            });


                        } else {
                            layer.msg('保存失败！', { time: 2000, icon: 6 }, function () {
                                //layer.closeAll('dialog');
                                $("#tableGrid").dataTable().fnDraw(false);
                            })
                        }
                    }
                })

            })
        }
        $("[name=UserNameR]").click(function () {
            $("#BatchAdd").data('bootstrapValidator').destroy();
            $('#BatchAdd').data('bootstrapValidator', null);
            var aa = $(this).parent().parent();
            for (var i = 1; i <= 4; i++) {
                $("[data-id=" + i + "]").removeAttr("name");

            }
            var temp = $(this).val();
            if (temp == 1) {
                $("#UserName02").val("");
                $("#UserName03").val("");
                $("#UserName04").val("");

            }
            else if (temp == 2) {
                $("#UserName01").val("");
                $("#UserName03").val("");
                $("#UserName04").val("");

            }
            else if (temp == 3) {
                $("#UserName01").val("");
                $("#UserName02").val("");
                var inputArray = $("[data-id=" + temp + "]");
                $(inputArray[0]).attr("name", "UserName03")
                $(inputArray[1]).attr("name", "UserName04")


            }
            $("[data-id=" + temp + "]").attr("name", "UserName0" + temp.toString());
            Test();
        });
        $("[name=PwdR]").click(function () {
            $("#BatchAdd").data('bootstrapValidator').destroy();
            $('#BatchAdd').data('bootstrapValidator', null);
            $("[data-id=5]").removeAttr("name");
            var temp = $(this).val();

            if (temp == 1) {
                $("[data-id=5]").removeAttr("name");
                $("#PwdName2").val("");

            }
            else if (temp == 2) {
                $("[data-id=5]").attr("name", "PwdName");
            }

            Test();
        });
        //在更改新密码的时候，进行确认密码的输入框的验证
        function surePwd() {
            $('#UserInfoAdd').data('bootstrapValidator')
               .updateStatus('RepPwds', 'identical', null)
               .validateField('RepPwds');
        }

        //单个添加
        InitialValidator();
        function InitialValidator() {
            $('#UserInfoAdd').bootstrapValidator({
                message: '表单验证失败.',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    RoleNameAdd: {
                        validators: {
                            callback: {
                                message: '请将必填项填写完整',
                                callback: function (value, validator) {
                                    //$("#NumStart")
                                    return value != 0;
                                }
                            }
                        }
                    },
                    LoginNameAdd: {
                        message: '用户名验证失败',
                        verbose: false,
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 1,
                                max: 30,
                                message: '用户名长度必须介于1到30之间'
                            },
                            threshold: 3,
                            remote: {
                                url: "Ajax/MemberManagement.ashx?type=9",
                                message: '登录名已存在',
                                delay: 2000,
                                type: "GET",
                            },
                            regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            },

                        }

                    }, UserNameAdd: {
                        verbose: false,
                        message: '请将必填项填写完整',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 2,
                                max: 10,
                                message: '用户名姓名不能小于2位，且不能大于10位'
                            },
                            regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            },
                        }
                    },
                    PwdsAdd: {
                        //group: '.group',
                        message: '密码格式不正确',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '用户名密码不能小于6位，且不能大于20位'
                            },
                        }

                    }, RepPwds: {
                        //group: '.group',
                        message: '输入第二次密码格式不正确',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 6,
                                max: 20,
                                message: '用户名密码不能小于6位，且不能大于20位'
                            },
                            identical: {//相同
                                field: 'PwdsAdd', //需要进行比较的input name值
                                message: '两次密码不一致'
                            },
                            different: {//不能和用户名相同
                                field: 'LoginNameAdd',//需要进行比较的input name值
                                message: '不能和用户名相同'
                            },
                        }
                    },
                    SexAdd: {
                        //group: '.group',
                        validators: {
                            callback: {
                                message: '请选择性别',
                                callback: function (value, validator) {
                                    // Determine the numbers which are generated in captchaOperation

                                    return value != "请选择性别";
                                }
                            }
                        }
                    },
                    BirthdayAdd: {
                        //group: '.group',
                        message: '出生日期有误',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            }
                        }
                    },
                    ADepartmentAdd: {
                        //group: '.group',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            callback: {
                                message: '请选择所属部门',
                                callback: function (value, validator) {
                                    $('i[data-bv-icon-for=ADepartmentAdd]').css({ "margin-right": "-25px" });
                                    return value != "全部";
                                }
                            }
                        }
                    }, EmailAdd: {
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            regexp: {
                                regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                                message: '请输入正确的邮箱格式'
                            }
                        }
                    }, TelAdd: {
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            regexp: {
                                regexp: /^1[0-9]{10}$/,
                                message: '请输入有效的手机号'
                            }
                        }
                    }, RemarkAdd: {
                        message: '个人简介',
                        validators: {
                            stringLength: {
                                min: 0,
                                max: 500,
                                message: '成员描述不能大于500个字符'
                            },

                        }
                    }, ParentsEMail: {
                        //group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                                message: '邮箱格式不正确，请输入正确的邮箱格式如123@.com'
                            }
                        }
                    }, ParentsTel: {
                        //group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^1[0-9]{10}$/,
                                message: '手机号码不正确'
                            }
                        }
                    }
                    , DauthorityAdd: {
                        //group: '.group',
                        validators: {
                            callback: {
                                message: '请选择所属部门',
                                callback: function (value, validator) {
                                    $('i[data-bv-icon-for=DauthorityAdd]').css({ "margin-right": "-20px", "color": "#3c763d" })
                                    $('#departmentAddDiv').css("color", "#3c763d");
                                    return true;
                                }
                            }
                        }
                    }
                }

            }).on('success.form.bv', function (e) {
                if (!isSubmit)
                    SubmitCallback();
                e.preventDefault();
                //李兆典创建按钮操作
            });
        }
        var isSubmit = false;
        function Submit() {
            $('#UserInfoAdd').bootstrapValidator();
        }
        function UserInfoUpdate_Submit() {
            $('#UserInfoUpdate').bootstrapValidator();
        }
        function SubmitCallback() {

            isSubmit = true;

            layer.open({
                type: 1,
                title: false,
                closeBtn: false
            });
            //加载层
            layer.load(0, { shade: false }); //0代表加载的风格，支持0-2

            $("#buttons").attr('disabled', true);
            //新增字段
            /*获取用户自定义信息json串 */
            var fields = $("[data-name=field]");
            var value = $("[data-name=value]");
            var strJson = [];
            if (fields.length > 0) {
                for (var i = 0; i < fields.length; i++) {
                    if (i == fields.length - 1 && $(fields[i]).val() == "" && $(fields[i]).text() == "") {
                        layer.alert('请输入自定义信息!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })
                        isSubmit = false;
                        return;
                    }
                    if ($(fields[i]).val() == "" && $(fields[i]).text() != "") {
                        var field = $(fields[i]).text().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                    }
                    if ($(fields[i]).val() != "") {
                        var field = $(fields[i]).val().replace(":", "");
                        var str = { 'Field': field, 'Value': $(value[i]).val() };
                    }

                    strJson.push(str);
                }
            }


            var U_AddField = JSON.stringify(strJson);//新增字段
            var Department_ID = $("#DepID").val();
            var ADepartment_ID = $("#ADepartment_ID").val();
            var U_LoginName = $("#U_LoginName").val();
            var U_Password = $("#U_Password").val();
            var U_Passwords = $("#U_Passwords").val();
            var U_Name = $("#U_Name").val();
            var U_Sex = $("#U_Sex").val();
            var Student_ID = $("#Student_ID").val();
            var U_EMail = $("#U_EMail").val();
            var U_Tel = $("#U_Tel").val();
            var U_ParentsTel = $("#U_ParentsTel").val();
            var U_Birthday = $("#birthdays").val();
            var U_ParentsEMail = $("#U_ParentsEMail").val();
            var R_ID = $("#R_ID").find("option:selected").val();
            var U_Remark = $("#U_Remark").val();
            var U_Address = $("textarea[id=U_Address]").val();
            var DA = $("#DA").val();
            var U_Consult = $("#U_Consult").val();
            var GoodField = $("#GoodField").val();
            var RFType = GetFuntionType;
            //DA = DA.replace(";", ",");
            var url = "Ajax/UserAdd.ashx";
            $.ajax({
                url: "Ajax/UserAdd.ashx",
                data: {
                    Department_ID: Department_ID,
                    ADepartment_ID: ADepartment_ID,
                    U_LoginName: U_LoginName,
                    U_Birthday: U_Birthday,
                    U_Password: U_Password,
                    U_Name: U_Name,
                    U_Sex: U_Sex,
                    Student_ID: Student_ID,
                    U_EMail: U_EMail,
                    U_Tel: U_Tel,
                    U_ParentsTel: U_ParentsTel,
                    U_ParentsEMail: U_ParentsEMail,
                    R_ID: R_ID,
                    U_Remark: U_Remark,
                    U_Address: U_Address,
                    U_AddField: U_AddField,
                    DA: DA,
                    U_Consult: U_Consult,
                    GoodField: GoodField,
                    RFType: RFType
                },
                type: "post",
                dataType: "text",
                success: function (data) {


                    if (data) {
                        $("#UserInfoAdd :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");//核心

                        layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {
                            $(".x_ckzl").modal("hide");
                            layer.closeAll();
                            $("#DataTables-Gauge").DataTable().draw();
                        });
                    } else {
                        isSubmit = false;
                        layer.msg("保存失败！", { time: 2000, icon: 6 }, function () {
                        }, function () {
                        });
                    }
                }
            })
        }

        function Txiao() {
            var R_ID = $("#R_ID").val();

            if (R_ID == 2) {
                $("#Gan").css("display", "none");
                return;
            }
            if (R_ID == 1) {
                $("#Gan").css("display", "show");
                return;
            }
        }
        //用户名验证
        $("[name=UserNameR]").click(function () {
            $("#BatchAdd").data('bootstrapValidator').destroy();
            $('#BatchAdd').data('bootstrapValidator', null);
            var aa = $(this).parent().parent();
            for (var i = 1; i <= 4; i++) {
                $("[data-id=" + i + "]").removeAttr("name");

            }
            var temp = $(this).val();
            if (temp == 1) {
                $("#UserName02").val("");
                $("#UserName03").val("");
                $("#UserName04").val("");

            }
            else if (temp == 2) {
                $("#UserName01").val("");
                $("#UserName03").val("");
                $("#UserName04").val("");

            }
            else if (temp == 3) {
                $("#UserName01").val("");
                $("#UserName02").val("");
                var inputArray = $("[data-id=" + temp + "]");
                $(inputArray[0]).attr("name", "UserName03")
                $(inputArray[1]).attr("name", "UserName04")


            }
            $("[data-id=" + temp + "]").attr("name", "UserName0" + temp.toString());
            Test();
        });
        $("[name=PwdR]").click(function () {
            $("#BatchAdd").data('bootstrapValidator').destroy();
            $('#BatchAdd').data('bootstrapValidator', null);
            $("[data-id=5]").removeAttr("name");
            var temp = $(this).val();

            if (temp == 1) {
                $("[data-id=5]").removeAttr("name");
                $("#PwdName2").val("");

            }
            else if (temp == 2) {
                $("[data-id=5]").attr("name", "PwdName");
            }

            Test();
        });

        //取消返回主界面
        //选择开启还去关闭
        $("input:radio[name=optionsRadios]").on("click", function () {
            var raidos = $('input:radio[name=optionsRadios]:checked').val();
            $.ajax({

                url: "Ajax/RoleUpdate.ashx?type=4",
                data: { IsOpen: raidos },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        if (raidos == "0") {
                            $("#panel-body").show();
                            $("#row01").show();
                            layer.msg('开启成功！', { icon: 1 });
                            $("#dataTables-example").DataTable().draw();
                        } else if (raidos == "1") {
                            $("#panel-body").hide();
                            $("#row01").hide();
                            layer.msg('关闭成功！', { icon: 1 });
                        }

                    }
                    else {
                        if (raidos == "0") {


                            layer.msg('关闭失败！', { icon: 1 });
                            $("#dataTables-example").DataTable().draw();
                        } else if (raidos == "1") {
                            layer.msg('关闭失败！', { icon: 1 });
                        }
                    }
                }

            })

        });
        //获取超级管理员是否关闭
        function GetIsOpen() {
            $.ajax({
                url: "Ajax/RoleUpdate.ashx?type=5",
                type: 'get',
                success: function (result) {
                    result = eval("(" + result + ")");
                    if (result.Role_Name == "超级管理员") {
                        $("#Isopen").show();
                        $("input:radio[name=optionsRadios][value=" + result.IsOpen + "]").attr("checked", true);
                        if (result.IsOpen == "0") {
                            $("#panel-body").show();
                            $("#row01").show();

                        } else if (result.IsOpen == "1") {
                            $("#panel-body").hide();
                            $("#row01").hide();
                        }
                    } else {
                        $("#Isopen").hide();
                    }

                }

            })
        }
        //单个添加所属部门
        function OnLoadTreeComDID() {
            $("#Department_ID").ligerComboBox({
                width: "100%",
                selectBoxWidth: "90%",
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

                        $("#DepID").val(node.data['id']);
                    },
                    url: 'Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false,
                }, onSelected: function (value, text) {

                    $('#UserInfoAdd').data('bootstrapValidator')
                .updateStatus('ADepartmentAdd', 'NOT_VALIDATED', null)
                .validateField('ADepartmentAdd');

                }
            });

        }
        //批量添加所属部门
        function OnLoadTreeComs() {
            $("#Department").ligerComboBox({
                width: "100%",
                selectBoxWidth: "90%",
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
                    url: 'Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }, onSelected: function (value, text) {

                    $('#BatchAdd').data('bootstrapValidator')
                .updateStatus('Department', 'NOT_VALIDATED', null)
                .validateField('Department');

                }
            });
        }
        //部门权限---修改界面
        var GetTrees;
        function OnLoadTreeComsA() {

            GetTrees = $("#Dauthority").ligerComboBox({
                width: "100%",
                selectBoxWidth: "90%",
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    onSuccess: function () {
                        setTimeout(function () {
                            var manager = $(".l-tree").ligerGetTreeManager();
                        }, 1000);
                    },
                    onBeforeSelect: function (node) {
                        //$("#DepIDs").val(node.data['id']);
                    },
                    url: 'Ajax/DepartmentMain.ashx?Remark=DepartmentAuthorityRole&Roletype=' + RoleTypeByid + '&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: true,
                    cache: false,

                }, onSelected: function (value, text) {
                    //$("#Dauthority").val(text);
                    $("#DA").val(value);
                    //$('#UserInfoUpdate').data('bootstrapValidator')
                    //.updateStatus('Dauthority', 'NOT_VALIDATED', null)
                    //.validateField('Dauthority');

                }
            });
        }
        //验证是否
        function UserAdd() {
            var R_ID = $("#R_ID").val();
            var Department_ID = $("#Department_ID").val();
            var U_LoginName = $("#U_LoginName").val();
            var U_Password = $("#U_Password").val();

            var U_Name = $("#U_Name").val();
            var U_Sex = $("U_Sex").val();
            var U_Birthday = $("#U_Birthday").val();

            var U_EMail = $("#U_EMail").val();
            var U_Tel = $("#U_Tel").val();
            var Dauthority = $("#Dauthority").val();//部门权限

            if (R_ID == "0") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (Department_ID == "") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (U_LoginName == "") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (U_Password == "") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (U_Name == "") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (U_EMail == "") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (U_Sex == "") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (U_Birthday == "0") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (U_Tel == "0") {
                //alert("请将必填项填写完整！");
                return false;
            }
            if (Dauthority == "0") {
                //alert("请将必填项填写完整！");
                return false;
            }
        }
        var count = 1;
        $("#NumStart").bind("keyup", function () {
            $("#BatchAdd")
     .data('bootstrapValidator')
     .updateStatus('NumEnd', 'NOT_VALIDATED')
     .validateField('NumEnd');

        });
        $("#NumEnd").bind("keyup", function () {
            $("#BatchAdd")
     .data('bootstrapValidator')
     .updateStatus('NumStart', 'NOT_VALIDATED')
     .validateField('NumStart');

        });
        $(document).on("click", "[name=UserNameR]", function () {
            $("#UserName01").removeAttr("style")
            $("#UserName02").removeAttr("style")
            $("#UserName03").removeAttr("style")
            $("#UserName04").removeAttr("style")
        })
        function datass() {
            $("#buttons").attr('disabled', false);
        }
        LoadAddDepartmentAuthority();
        var getTree_Add;
        //加载添加成员时部门权限下拉框
        function LoadAddDepartmentAuthority() {

            getTree_Add = $("#DauthorityAdd").ligerComboBox({
                width: "100%",
                selectBoxWidth: "90%",
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    onSuccess: function () {
                        setTimeout(function () {
                            var manager = $(".l-tree").ligerGetTreeManager();
                        }, 1000);
                    },
                    onBeforeSelect: function (node) {
                        //$("#DepIDs").val(node.data['id']);
                    },
                    url: 'Ajax/DepartmentMain.ashx?Remark=DepartmentAuthorityRole&Roletype=' + RoleTypeByid + '&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: true,
                    cache: false,

                }, onSelected: function (value, text) {
                    $("#DauthorityAdd").val(text);
                    $("#DA").val(value);
                    if (value == "0")
                        $("#DauthorityAdd").val('无');
                    //    $('#UserInfoAdd').data('bootstrapValidator')
                    //.updateStatus('DauthorityAdd', 'NOT_VALIDATED', null)
                    //.validateField('DauthorityAdd');
                }
            });
        }
        $('#addMemberModal').on('shown.bs.modal', function () {
            $(".l-checkbox").removeClass("l-checkbox-checked").addClass("l-checkbox-unchecked");
        })
        $("#R_ID").change(function () {
            var userRoleType = $("#R_ID").find("option:selected").attr("data-id")
            if (userRoleType == 3) {
                $("#DauthorityAdd").attr("disabled", "disabled");
            } else {
                $("#DauthorityAdd").attr("disabled", false);
            }
        });
    </script>
</asp:Content>
