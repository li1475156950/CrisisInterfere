<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />

    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link rel="shortcut icon" href="favicon.ico" />
    <script type="text/javascript">     
    </script>
    <div class="row">
        <div class="col-md-12">

            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">基础设置</a></li>
                <li><a href="membermanagement.aspx">成员管理</a></li>
                <li><a href="#">新增成员</a></li>
            </ol>

        </div>
        <!-- /. ROW  -->
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="panel-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">单个添加</a>
                        </li>
                        <li class=""><a href="#profile" data-toggle="tab">批量添加</a>
                        </li>
                        <li class=""><a href="#divide" data-toggle="tab">批量导入</a>
                        </li>
                        <li class="" style="display: none"><a href="#messages" data-toggle="tab">审核自助注册</a>
                        </li>

                    </ul>
                    <div class="tab-content">
                        <%--   单个添加--%>
                        <div class="tab-pane fade active in" id="home">
                            <div class="row" style="margin: 15px 0px 0px 0px;">
                                <form id="UserInfoAdd" class="form-horizontal" role="form" onsubmit="Submit()">
                                    <fieldset>
                                        <legend style="font-size: 16px; border-style: dashed">基本信息</legend>
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label">*角色名称：</div>
                                                <div class="col-sm-2">
                                                    <a href="AddMember.aspx"></a>
                                                    <select class="form-control" id="R_ID" name="RoleName">
                                                        <option value="1">1</option>
                                                        <option value="2">2</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label">*所属部门：</div>
                                                <div class="col-sm-2">
                                                    <input id="Department_ID" name="ADepartment" style="top: 0; height: 20px;" />
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label" style="width: 135px;">*部门权限：</div>
                                                <div class="col-sm-2" id="departmentRight">
                                                    <input id="Dauthority" name="Dauthority" style="top: 0; height: 20px;" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label">*登录名：</div>
                                                <div class="col-sm-2">
                                                    <input class="form-control" id="U_LoginName" name="LoginName" maxlength="15" />
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label">*密码：</div>
                                                <div class="col-sm-2">
                                                    <input type="password" class="form-control" id="U_Password" name="Pwds" />
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label" style="width: 135px;">*确认密码：</div>
                                                <div class="col-sm-2">
                                                    <input type="password" class="form-control" id="U_Passwords" name="RepPwds" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label">*姓名：</div>
                                                <div class="col-sm-2">
                                                    <input class="form-control" id="U_Name" name="UserName" maxlength="10" />
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label">*性别：</div>
                                                <div class="col-sm-2">
                                                    <select class="form-control" id="U_Sex" name="Sex">
                                                        <option value="1">女</option>
                                                        <option value="0">男</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2  control-label" style="width: 135px;">* 出生日期：</div>
                                                <div class="col-sm-2">
                                                    <input type="text" class="form-control" id="U_Birthday" name="Birthday" readonly="readonly" />
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <fieldset>
                                        <legend style="font-size: 16px; border-style: dashed">高级信息</legend>
                                        <div class="form-group">
                                            <div class="col-md-2 col-sm-2  control-label">电子邮箱：</div>
                                            <div class="col-sm-2">
                                                <input class="form-control" id="U_EMail" name="Email" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-md-2 col-sm-2  control-label">手机号：</div>
                                            <div class="col-sm-2">
                                                <input class="form-control" id="U_Tel" name="Tel" maxlength="11" />
                                            </div>
                                        </div>
                                        <div class="form-group" id="Did_Remark">
                                            <div class="col-md-2 col-sm-2  control-label">成员描述：</div>
                                            <div class="col-sm-6">
                                                <textarea class="form-control" rows="2" id="U_Remark" name="Remark" maxlength="500"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: none" id="Div_U_Consult">
                                            <div class="col-md-2 col-sm-2  control-label">咨询师简介：</div>
                                            <div class="col-sm-6">
                                                <textarea class="form-control" rows="2" id="U_Consult" name="U_Consult" maxlength="30"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: none" id="Div_GoodField">
                                            <div class="col-md-2 col-sm-2  control-label">擅长领域：</div>
                                            <div class="col-sm-6">
                                                <textarea class="form-control" rows="2" id="GoodField" name="GoodField" maxlength="30"></textarea>
                                            </div>
                                        </div>
                                        <div id="useradds">
                                        </div>
                                    </fieldset>
                                    <%--  <div class="form-group">
                                        <div class="col-md-8 col-sm-2  control-label">
                                            <div class="col-md-10 col-xs-2 col-md-offset-0 col-xs-offset-8 control-label" style="color: green">
                                                <span class="glyphicon glyphicon-minus" id="removes" onclick="removeHTML()"></span>
                                            </div>
                                            <div class="col-md-2 col-sm-2 col-xs-1 control-label" style="color: red" id="TrAdd" onclick="TrAdd()">
                                                <span class="glyphicon glyphicon-plus"></span>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <div class="row" style="text-align: center; margin-top: 20px;">
                                        <div class="col-sm-6 col-xs-5 text-right">
                                            <button type="submit" class="btn btn-sm" style="background-color: orange; color: white" id="buttons">保存</button>
                                        </div>
                                        <div class="col-sm-1 col-xs-5 text-right">
                                            <button class="btn btn-sm" type="button" style="color: white" id="Close" onclick="Quxiao()">取消</button>
                                        </div>
                                    </div>
                                </form>
                            </div>


                        </div>

                        <%--//批量添加--%>
                        <div class="tab-pane fade" id="profile">
                            <div class="row" style="margin: 60px 0px 0px 0px;">
                                <form class="form-horizontal" id="BatchAdd" role="form">
                                    <fieldset>
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2 control-label">
                                                    *角色名称:
                                                </div>
                                                <div class="col-md-3 col-sm-3">
                                                    <select class="form-control" name="RoleNameAll" id="RoleNameAll"></select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2 control-label">
                                                    *所属部门:
                                                </div>
                                                <div class="col-md-3 col-sm-3">
                                                    <input type="text" name="Department" id="Department" style="top: 0; height: 20px;" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2 control-label">
                                                    <span>*</span>    序列数范围:
                                                </div>
                                                <div class="col-md-3 col-sm-3">
                                                    <input class="form-control" id="NumStart" type="text" name="NumStart" />

                                                </div>
                                                <div class=" col-md-3 col-sm-2" style="width: 120px;">&lt;=序列数&lt;=</div>
                                                <div class="col-md-3 col-sm-3">
                                                    <input class="form-control" id="NumEnd" name="NumEnd" type="text" />
                                                </div>
                                                (单次最多支持添加300个)
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="row" style="margin-bottom: 20px">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2 control-label">用户名生成规则：</div>
                                                    <div class="col-md-10 col-sm-10" style="width: 310px;">
                                                        <input name="UserNameR" type="radio" id="Radio01" value="1" />前缀固定,即用户名=前缀+序列数，前缀为  
                                                    </div>
                                                    <div class="col-md-3 col-sm-3">
                                                        <input class="form-control" data-id="1" type="text" id="UserName01" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 20px">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2 control-label"></div>
                                                    <div class="col-sm-10" style="width: 310px;">
                                                        <input value="2" name="UserNameR" type="radio" id="Radio02" />后缀固定,即用户名=序列数+后缀，后缀为 
                                                    </div>
                                                    <div class="col-md-3 col-sm-3">
                                                        <input class="form-control" data-id="2" type="text" id="UserName02" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 20px">
                                                <div class="group">
                                                    <div class="col-md-2 col-sm-2 control-label"></div>
                                                    <div class="col-sm-10" style="width: 310px;">
                                                        <input value="3" name="UserNameR" type="radio" id="Radio03" />前、后缀固定,即用户名=前缀+序列数+后缀<br />

                                                        <%-- <input name="Text1" type="text" id="Text1" placeholder="前缀" autocomplete="off">--%>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row" style="margin-bottom: 20px">
                                                <div class="group">
                                                    <div class="col-md-4 col-sm-4 control-label"></div>
                                                    <div class="col-md-1 col-sm-1" style="margin-left: 42px; width: 72px;">前缀为</div>
                                                    <div class="col-md-3 col-sm-3">
                                                        <input class="form-control" data-id="3" type="text" id="UserName03" />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-bottom: 20px">
                                                <div class="group">
                                                    <div class="col-md-4 col-sm-4 control-label"></div>
                                                    <div class="col-md-1 col-sm-1" style="margin-left: 42px; width: 72px;">后缀为</div>
                                                    <div class="col-md-3 col-sm-3">
                                                        <%--<input class="form-control"data-id="3" type="text" id="UserName04" /> --%>
                                                        <input class="form-control" data-id="3" type="text" id="UserName04" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="group">
                                                <div class="col-md-2 col-sm-2 control-label">*密码生成规则：</div>

                                                <div class=" col-md-2 col-sm-2" style="width: 180px; visibility: hidden">
                                                    <input value="2" name="PwdR" type="radio" id="PwdR2" checked="checked" />统一固定密码 
                                                </div>
                                                <div class="col-md-2 col-sm-2" style="width: 130px;">统一固定密码为</div>
                                                <div class="col-md-3 col-sm-3">
                                                    <input class="form-control" id="PwdName2" name="PwdName2" type="password" data-id="5" />
                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>
                                    <div class="row" style="text-align: center; margin-top: 20px;">
                                        <div class="col-sm-6 col-xs-5 text-right">
                                            <button type="submit" class="btn btn-sm" style="background-color: orange; color: white" id="SubmitID">保存</button>
                                        </div>
                                        <div class="col-sm-1 col-xs-5 text-right">
                                            <button type="button" class="btn btn-sm" id="CancelID" style="color: white" onclick="Calcel()" data-dismiss="modal">取消</button>
                                        </div>
                                    </div>
                                </form>

                            </div>

                        </div>

                        <%-- 批量导入  --%>
                        <%--   <form id="form1" runat="server">--%>

                        <div class="tab-pane fade" id="divide">


                            <form id="form1" class="form-horizontal" role="form" method="post" enctype="multipart/form-data" runat="server">
                                <div class="row" style="margin-top: 35px">

                                    <div id="validation-form" class="form-horizontal" novalidate="novalidate">
                                        <div class="row" style="padding-bottom: 20px">



                                            <%--<input type="file" id="upload" name="upload" onchange="uploadimg()" style="width: 250px; height: 21px;"  runat="server" />--%>
                                            <div class="col-md-3">
                                                <label class="control-label" style="float: right">上传文件</label>
                                            </div>
                                            <div class="col-md-3">
                                                <input id="fileUpload" name="fileUpload" type="file" style="display: none" />

                                                <input id="fileText" type="text" class="form-control" disabled />
                                            </div>
                                            <div class="col-md-3">
                                                <button type="button" style="background-color: RGB(66,139,203); color: white" class=" btn btn-sm" onclick="$('#fileUpload').click()">浏览</button>
                                                <button type="button" style="background-color: orange; color: white" class=" btn  btn-sm" id="upload" name="upload" onclick="uploadimg()">导入</button>
                                                （单次最多支持导入300个）
                                            </div>


                                        </div>
                                        <div class="row" style="margin-bottom: 20px;">
                                            <label for="name" class="control-label col-sm-3 no-padding-right">
                                                下载文件模板
                                            </label>
                                            <div class="c col-sm-9">
                                                <div id="div1" runat="server" style="display: block">
                                                    <%-- <span><a style="color: Blue"  href="" id="dp"onserverclick="submit1_Click()" runat="server" </a><span id="fp"><font color="red">(EXCEL中红色标注为必填项)</font></span></span>--%>
                                                    <%--<span><a style="color: Blue" href="" id="dp" onserverclick="submit1_Click" runat="server">批量导入成员信息模板.xls </a><span id="fp"><font color="red">(EXCEL中红色标注为必填项)</font></span></span>--%>
                                                    <a href="https://pan.baidu.com/s/1c2lDlmS" target="_blank">批量导入成员信息模板.xls</a><font color="red">(Excel中红色标注为必填项)</font>
                                                    <%--  <a href="SaveFile/批量导入成员信息.xls" target="_blank">批量导入成员信息模板.xls</a><font color="red">(Excel中红色标注为必填项)</font>--%>
                                                </div>


                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </form>

                            <div class="row" style="text-align: center; margin-top: 20px;">
                                <div class="col-sm-5 col-xs-5 text-right">
                                    <button class="btn btn-sm" type="button" style="color: white" onclick="Quxiao()">返回</button>
                                </div>
                            </div>
                        </div>



                        <%--   </form>--%>
                        <%-- message--%>
                        <div class="tab-pane fade" id="messages">
                            <div class="row" style="margin-top: 15px; 0px; 0px; 0px;" id="Isopen">
                                <div class="col-sm-12">
                                    是否开启注册功能(注：如开启此功能，所有注册用户需管理员审核。)
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="0" />
                                开启 
                            </label>
                        </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="1" />关闭
                                        </label>
                                    </div>

                                    <%--<div class="col-xs-3">时间:2014/8/30</div>
                                    <div class="col-xs-2">咨询师:着医生</div>
                                    <div class="col-xs-2">咨询方式:面团</div>
                                    <div class="col-xs-2">咨询地点:面团</div>--%>
                                </div>
                            </div>
                            <div class="row" style="margin-top: 15px;" id="row01">

                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                        <div class="lb-panel-left pull-left blue">
                                            审核状态：
                                        </div>

                                        <div class="lb-panel-right pull-right">
                                            <select id="AutiType" class="form-control">
                                                <option value="">全部</option>
                                                <option value="0">待审核</option>
                                                <option value="1">已通过</option>
                                                <option value="2">未通过</option>
                                            </select>

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel-primary text-center  ">
                                        <div class="pull-left ">
                                            <button class="btn btn-blues" id="go_search"><i class="fa fa-search "></i>查询</button>
                                        </div>
                                    </div>
                                </div>


                            </div>
                            <%-- <div class="col-md-3 col-sm-12 col-xs-12" style="text-align: right; float: right">
                                    <button class="btn btn-success btn-sm" onclick=" accepts()"><i class="glyphicon glyphicon-ok"></i>通过</button>
                                    <button class="btn btn-warning btn-sm" onclick='Refuses()'><i class="glyphicon glyphicon-remove"></i>拒绝</button>
                                    <button class="btn btn-danger  btn-sm" onclick='u_deletes()'><i class="glyphicon glyphicon-trash"></i>删除</button>
                                </div>--%>
                            <div class="row">
                                <div class="panel-body" id="panel-body">

                                    <div class="table-responsive">


                                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                            <thead>
                                                <tr>
                                                    <th>
                                                        <input type="checkbox" name="checkbox" id="selectAll" style="float: left" />选框</th>
                                                    <th>序号</th>
                                                    <th>登录名</th>
                                                    <th>姓名</th>
                                                    <th>性别</th>
                                                    <th>申请时间</th>
                                                    <th>审核状态</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>
                                        </table>
                                    </div>

                                    <button class="btn btn-greens btn-sm" onclick=" accepts()"><i class="glyphicon glyphicon-ok"></i>批量通过</button>
                                    <button class="btn btn-reds btn-sm" onclick='Refuses()'><i class="glyphicon glyphicon-remove"></i>批量拒绝</button>
                                    <button class="btn btn-reds  btn-sm" onclick='u_deletes()'><i class="glyphicon glyphicon-trash"></i>批量删除</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <%-- 查看--%>
    <div class="modal fade" id="mychakan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        × 
                    </button>
                    <h4 class="modal-title" id="myModalLabel">查看
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal ">
                        <fieldset>
                            <legend style="font-size: 16px;">基本信息</legend>

                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_username">登录名</label>
                                <div class="col-sm-10">
                                    <input class="form-control" style="font-size: 12px" id="LoginName01" type="text" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_username">姓名</label>
                                <div class="col-sm-10">
                                    <input class="form-control" style="font-size: 12px" id="UserName" type="text" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_password">性别</label>
                                <div class="col-sm-10">
                                    <input class="form-control" style="font-size: 12px" id="Sex" type="text" disabled="disabled" />
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_password">出生日期</label>
                                <div class="col-sm-10">
                                    <input class="form-control" style="font-size: 12px" id="birthday" type="text" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_name">所属部门</label>
                                <div class="col-sm-10">
                                    <input class="form-control" style="font-size: 12px" id="DepartmentName" type="text" disabled="disabled" />
                                </div>
                            </div>
                            <%-- <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_username">邮编</label>
                                <div class="col-sm-10">
                                    <input class="form-control" style="font-size: 12px" id="StudentID" type="text" disabled="disabled" />
                                </div>

                            </div>--%>
                        </fieldset>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                </div>
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <input type="hidden" id="DepID" />
    <input type="hidden" id="DepIDs" />
    <input type="hidden" id="DA" /><%--//部门权限--%>

    <script src="../../JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <%-- <script src="../../JS/bootstrap-datetimepicker.zh-CN.js"></script>--%>
    <script src="../../JS/bootstrapValidator.min.js"></script>

    <script src="../../JS/jquery.form.js"></script>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <script src="../../JS/TreeTables/jquery.treeTable.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>





    <script type="text/javascript">
        var navName = '/FunctionModular/BasicSetting/MemberManagement.aspx';
        var GetFuntionType = 0;
        var RoleTypeByid = 0;
        //GetFuntion();
        initSelectInput("Remark=2", "RoleNameAll", "请选择");//初始化量表类别
        initSelectInput("Remark=1", "R_ID", "请选择");//角色全选
        OnLoadTreeComDID();
        OnLoadTreeComs();
        OnLoadTreeComsA();

        GetIsOpen();
        Test();
        $("#UserName04").empty();
        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        $("#LBGL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');
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
            $('#UserInfoAdd').data('bootstrapValidator')
                .updateStatus('Birthday', 'NOT_VALIDATED', null)
                .validateField('Birthday');
        });
        //判断是否是咨询师
        //function GetFuntion() {          
        //    $.ajax({
        //        url: "Ajax/MemberManagement.ashx?type=10",         
        //        type: "get",
        //        success: function (result) {

        //            GetFuntionType = result;
        //            if (result == 2) {
        //                $("#Div_U_Consult").show();
        //                $("#Div_GoodField").show();
        //                $("#Did_Remark").hide();
        //            } else {
        //                $("#Div_U_Consult").hide();
        //                $("#Div_GoodField").hide();
        //                $("#Did_Remark").show();
        //            }
        //        }
        //    })
        //}
        InitTable();
        var AutiType = "";
        var dtDetail;
        function InitTable() {
            //var AutiType = $("#AutiType").val();
            if (dtDetail != undefined) {
                $("#dataTables-example").DataTable().draw();
                return;
            }

            /*列表展现部分 */

            /*
                   创建时间：2016-09-12
                   创建人：刘亚娟
                   功能介绍：加载量表列表集合
           */
            var Starindex = 0;//开始条数索引
            var Endindex = 10;//结束条数索引
            dtDetail = $('#dataTables-example').dataTable({
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
                    url: "Ajax/Audit.ashx",
                    dataSrc: "data",
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
                        }
                        return 'type=1 &StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&AutiType=' + AutiType;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    $('td:eq(0)', row).html(" <input name=Auditcheckbox   class='childCheck' type=\"checkbox\" value=\"" + data[0] + "\" />");

                    var operation = "";
                    if (data[6] == "已通过" || data[6] == "未通过") {
                        operation = " <button class=\"btn btn btn-blues btn-sm\"onclick=\"Look(" + data[0] + "," + "'" + data[8] + "'" + ")\"><i class=\"glyphicon glyphicon-ok \"></i>查看</button>"
                      + " <button class=\"btn btn-reds  btn-sm\" onclick=\"u_delete(" + data[0] + "," + "'" + data[6] + "'" + ")\"><i class=\"glyphicon glyphicon-trash\"></i>删除</button>";

                    } else if (data[6] == "待审核") {
                        operation = " <button class=\"btn btn btn-blues btn-sm\"onclick=\"Look(" + data[0] + "," + "'" + data[8] + "'" + ")\"><i class=\"glyphicon glyphicon-ok \"></i>查看</button>"
                            + " <button class=\"btn btn-greens btn-sm\"onclick=\"accept(" + data[0] + ")\"><i class=\"glyphicon glyphicon-ok \"></i>通过</button>"
                  + " <button class=\"btn btn-reds btn-sm\" onclick='Refuse(" + data[0] + ")'><i class=\"glyphicon glyphicon-remove\"></i>拒绝</button>";
                    }



                    $('td:eq(7)', row).html(operation);
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
        $(document).on("click", "#go_search", function () {
            AutiType = $("#AutiType").val();
            if (dtDetail != undefined) {
                $("#dataTables-example").DataTable().draw();
                return;
            }
        });



        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
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
                            $("#" + controlname).append("<option value='" + item.Value + "' data-name='" + item.Funtype + "' data-id='" + item.RoleType + "'>" + item.Text + "</option>");

                        });

                    }
                });
            }, 100);
        }
        //角色改变选中的值
        $("#R_ID").change(function () {
            GetFuntionType = $(this).children('option:selected').attr("data-name");
            RoleTypeByid = $(this).children('option:selected').attr("data-id");
            if (GetFuntionType == 4) {
                $("#Div_U_Consult").show();
                $("#Div_GoodField").show();
                $("#Did_Remark").hide();
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
        });
        //查看
        function Look(obj, Dname) {
            var U_ID = obj;
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
        //接受
        /*-----点击接受-----*/
        function accept(U_ID) {
            layer.confirm('确定通过吗？', {
                btn: ['是', '否'] //按钮
            }, function () {
                //alert(U_ID)
                $.ajax({

                    url: "Ajax/Audit.ashx?type=2",
                    data: { U_ID: U_ID },
                    type: 'get',
                    success: function (result) {
                        if (result == "True") {
                            layer.msg('通过成功！', { icon: 1 });
                            $("#dataTables-example").DataTable().draw();
                        }
                        else {
                            layer.msg('通过失败！', { icon: 1 });
                        }
                    }

                })

            });
        }
        /*-----批量接受-----*/
        function accepts() {
            var checkbox = document.getElementsByName("Auditcheckbox");

            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        U_IDs += checkbox[i].value + ",";

                    }
                }
                if (U_IDs.length > 0) {
                    layer.confirm('确定通过吗？', {
                        btn: ['是', '否'] //按钮
                    }, function () {



                        $.ajax({
                            url: "Ajax/Audit.ashx?type=3",
                            data: { U_IDs: U_IDs },
                            type: 'get',
                            success: function (result) {
                                if (result == "True") {

                                    $("#dataTables-example").DataTable().draw();
                                    layer.msg('通过成功！', { icon: 1 });

                                }
                                else {
                                    layer.msg('通过失败！', { icon: 1 });
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
            }
        }
        /*-----点击拒绝-----*/
        function Refuse(U_ID) {
            layer.confirm('确定拒绝吗？', {
                btn: ['是', '否'] //按钮
            }, function () {
                //alert(U_ID)
                $.ajax({

                    url: "Ajax/Audit.ashx?type=4",
                    data: { UID: U_ID },
                    type: 'get',
                    success: function (result) {
                        if (result == "True") {
                            $("#dataTables-example").DataTable().draw();
                            layer.msg('拒绝成功！', { icon: 1 });
                            $("#selectAll").attr("checked", 'false');// 
                        }
                        else {
                            layer.msg('拒绝失败！', { icon: 1 });
                        }
                    }

                });

            });
        }
        /*-----批量拒绝-----*/
        function Refuses() {

            var checkbox = document.getElementsByName("Auditcheckbox");
            if (checkbox.length > 0) {
                var UIDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        UIDs += checkbox[i].value + ",";
                    }
                }
                if (UIDs.length > 0) {
                    layer.confirm('确定拒绝吗？', {
                        btn: ['是', '否'] //按钮
                    }, function () {
                        $.ajax({
                            url: "Ajax/Audit.ashx?type=5",
                            data: { UIDs01: UIDs },
                            type: 'get',
                            success: function (result) {
                                if (result == "True") {
                                    $("#dataTables-example").DataTable().draw();
                                    layer.msg('拒绝成功！', { icon: 1 });

                                }
                                else {
                                    layer.msg('拒绝失败！', { icon: 1 });
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
            }
        }

        /*-----点击删除-----*/
        function u_delete(U_ID, state) {
            layer.confirm('是否确定将此条目移入回收站？', {
                btn: ['是', '否'] //按钮
            }, function () {

                $.ajax({

                    url: "Ajax/RoleDelrte.ashx?type=3",
                    data: { U_ID: U_ID, state: state },
                    type: 'get',
                    success: function (result) {
                        if (result == "True") {
                            $("#dataTables-example").DataTable().draw();
                            $("[name='checkbox']").removeAttr("checked");//取消选中
                            layer.msg('删除成功！', { icon: 1 });

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
            var checkbox = document.getElementsByName("Auditcheckbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        U_IDs += checkbox[i].value + ",";
                    }
                }
                if (U_IDs.length > 0) {
                    layer.confirm('确定删除吗？', {
                        btn: ['是', '否'] //按钮
                    }, function () {
                        $.ajax({
                            url: "Ajax/RoleDelrte.ashx?type=4",
                            data: { U_IDs: U_IDs },
                            type: 'get',
                            success: function (result) {
                                if (result == "True") {
                                    layer.msg('删除成功！', { icon: 1 });
                                    $("[name='checkbox']").removeAttr("checked");//取消选中
                                    $("#dataTables-example").DataTable().draw();
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
            }
        }
        //<end>
        /*----------文件上传----------*/
        $("#fileUpload").change(function () {
            $("#fileText").val($(this).val());
        });
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
                            layer.alert('上传失败！', {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            }
                );
                        }
                    }
                });
            }

        }
        ///全选
        $("#selectAll").click(function () {//全选 
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
                        group: '.group',
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
                    Department: {
                        group: '.group',
                        validators: {
                            callback: {
                                message: '请选择所属部门',
                                callback: function (value, validator) {
                                    //   $("#NumStart")
                                    return value != "无" && value != "" && value != null;
                                }
                            }
                        }
                    },
                    NumStart: {
                        group: '.group',
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
                        group: '.group',
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
                                message: '后面输入框的值要大于前面输入框的值',
                                callback: function (value, validator) {

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
                            },
                            callback: {
                                message: '',
                                callback: function (value, validator) {
                                    if ($('input[name="UserNameR"]:checked').val() == 1) {
                                        $("#UserName02").attr("style", " border-color:#d0c0c0");
                                        $("#UserName03").attr("style", " border-color:#d0c0c0");
                                        $("#UserName04").attr("style", " border-color:#d0c0c0");

                                        return value != null && value != "";

                                    }
                                }
                            }
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
                        group: '.group',
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
                                    if ($('input[name="UserNameR"]:checked').val() == 3) {
                                        $("#UserName01").attr("style", " border-color:#d0c0c0");
                                        $("#UserName02").attr("style", " border-color:#d0c0c0");
                                        return value != null && value != "";
                                    }
                                }
                            }
                        }
                    },
                    UserName04: {
                        group: '.group',
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
                        group: '.group',
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
                                    if ($('input[name="PwdR"]:checked').val() == 2) {

                                        return value != null && value != "";


                                    }
                                }
                            }
                        }
                    },
                    PwdName2: {
                        group: '.group',
                        message: '请指定密码生成规则名称',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 1,
                                max: 20,
                                message: '密码不能小于1位，且不能大于20位'
                            }
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
                if ($('input[name="UserNameR"]:checked').val() == 1) {
                    username_ty = $("#UserName01").val();
                    nametype = 1;
                } else if ($('input[name="UserNameR"]:checked').val() == 2) {
                    username_ty = $("#UserName02").val();
                    nametype = 2;
                }
                else if ($('input[name="UserNameR"]:checked').val() == 3) {
                    nametype = 3;
                }
                var PwdR = "";
                var Pwd = "";
                if ($('input:radio[name=PwdR]:checked').val() == 1) {
                    PwdR = 1;
                } else if ($('input:radio[name=PwdR]:checked').val() == 2) {
                    Pwd = $("#PwdName2").val()
                    PwdR = 2;
                }
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
                    RoleName: {
                        group: '.group',
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

                    LoginName: {
                        group: '.group',
                        message: '用户名验证失败',
                        verbose: false,
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 1,
                                max: 20,
                                message: '用户名长度必须介于1到20之间'
                            },
                            threshold: 3,
                            remote: {
                                url: "Ajax/MemberManagement.ashx?type=9",
                                message: '用户名已存在',
                                delay: 2000,
                                type: "GET",
                            },
                            regexp: {
                                regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                                message: '用户名只能包含汉字、字母、数字'
                            },

                        }
                    }, Pwds: {
                        group: '.group',
                        message: '密码格式不正确',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '用户名密码不能小于6位，且不能大于30位'
                            },
                            //different: {//不能和用户名相同
                            //    field: 'LoginName',//需要进行比较的input name值
                            //    message: '不能和用户名相同'
                            // },
                            //callback: {//修改
                            //    message: '请将必填项填写完整',
                            //    callback: function (value, validator) {
                            //        var tests = $("#U_LoginName").val();
                            //        if (tests == null || tests == "") {
                            //            $('#UserInfoAdd').bootstrapValidator('updateStatus', 'LoginName', 'NOT_VALIDATED')
                            //            $('#UserInfoAdd').bootstrapValidator('validateField', 'LoginName');
                            //        }
                            //        return value != 0;
                            //    }
                            //}
                        }

                    }, RepPwds: {
                        group: '.group',
                        message: '输入第二次密码格式不正确',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '用户名密码不能小于6位，且不能大于30位'
                            },
                            identical: {//相同
                                field: 'Pwds', //需要进行比较的input name值
                                message: '两次密码不一致'
                            },
                            different: {//不能和用户名相同
                                field: 'LoginName',//需要进行比较的input name值
                                message: '不能和用户名相同'
                            },
                        }
                    },
                    UserName: {
                        group: '.group',
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
                    }, Sex: {
                        group: '.group',
                        validators: {
                            callback: {
                                message: '请选择性别',
                                callback: function (value, validator) {
                                    // Determine the numbers which are generated in captchaOperation

                                    return value != "请选择性别";
                                }
                            }
                        }
                    }, Birthday: {
                        group: '.group',
                        message: '出生日期有误',

                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            }
                        }
                    },
                    ADepartment: {
                        group: '.group',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
                            },
                            callback: {
                                message: '请选择所属部门',
                                callback: function (value, validator) {
                                    return value != "全部";
                                }
                            }
                        }
                    }, Email: {
                        //group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                                message: '请输入正确的邮箱格式'
                            }
                        }
                    }, Tel: {
                        //group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^1[0-9]{10}$/,
                                message: '请输入有效的手机号'
                            }
                        }
                    }, Remark: {
                        //group: '.group',
                        message: '成员描述',
                        validators: {
                            stringLength: {
                                min: 0,
                                max: 500,
                                message: '成员描述不能大于500个字符'
                            },

                        }
                    }, ParentsEMail: {
                        group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                                message: '邮箱格式不正确，请输入正确的邮箱格式如123@.com'
                            }
                        }
                    }, ParentsTel: {
                        group: '.group',
                        validators: {
                            regexp: {
                                regexp: /^1[0-9]{10}$/,
                                message: '手机号码不正确'
                            }
                        }
                    }
                    , Dauthority: {
                        group: '.group',
                        validators: {
                            notEmpty: {
                                message: '请将必填项填写完整！'
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
            var U_Birthday = $("#U_Birthday").val();
            var U_ParentsEMail = $("#U_ParentsEMail").val();
            var R_ID = $("#R_ID").val();
            var U_Remark = $("#U_Remark").val();
            var DA = $("#DA").val();
            var U_Consult = $("#U_Consult").val();
            var GoodField = $("#GoodField").val();
            var RFType = GetFuntionType;
            //DA = DA.replace(";", ",");
            var url = "Ajax/UserAdd.ashx";
            $.ajax({
                url: "Ajax/UserAdd.ashx",
                data: {
                    Department_ID: Department_ID,//部门编号
                    ADepartment_ID: ADepartment_ID,
                    U_LoginName: U_LoginName,//登录名
                    U_Birthday: U_Birthday,//日期
                    U_Password: U_Password,//密码
                    U_Name: U_Name,//姓名
                    U_Sex: U_Sex,//性别
                    Student_ID: Student_ID,//学生学号
                    U_EMail: U_EMail,//邮箱
                    U_Tel: U_Tel,//电话
                    U_ParentsTel: U_ParentsTel,//父母电话
                    U_ParentsEMail: U_ParentsEMail,//父母邮箱
                    R_ID: R_ID,//角色编号
                    U_Remark: U_Remark,//备注
                    U_AddField: U_AddField,
                    DA: DA,
                    U_Consult: U_Consult,
                    GoodField: GoodField,
                    RFType: RFType
                },
                type: "Get",
                dataType: "text",
                success: function (data) {


                    if (data) {
                        isSubmit = true;
                        $("#UserInfoAdd :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");//核心

                        layer.msg("保存成功！", { time: 2000, icon: 1 }, function () {
                            setInterval('datass()', 10000);
                            window.location.href = 'MemberManagement.aspx';
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

        function Calcel() {
            window.location.href = "MemberManagement.aspx";
        }
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
        //单个添加页面 所属部门方法
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
                        }, 1000);
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
                .updateStatus('ADepartment', 'NOT_VALIDATED', null)
                .validateField('ADepartment');

                }
            });
        }
        //批量添加-所属部门
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
        //部门权限
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
                    $("#Dauthority").val(text);
                    $("#DA").val(value);
                    $('#UserInfoAdd').data('bootstrapValidator')
                .updateStatus('Dauthority', 'NOT_VALIDATED', null)
                .validateField('Dauthority');

                }
            });
        }
        //验证是否
        function UserAdd() {
            var R_ID = $("#R_ID").val();
            var Department_ID = $("#Department_ID").val();
            var U_LoginName = $("#U_LoginName").val();
            var U_Password = $("#U_Password").val();
            var U_Passwords = $("#U_Passwords").val();
            var U_Name = $("#U_Name").val();
            var U_Sex = $("U_Sex").val();
            var U_Birthday = $("#U_Birthday").val();
            if (R_ID == "0") {
                alert("请将必填项填写完整！");
                return false;
            }
            if (Department_ID == "") {
                alert("请将必填项填写完整！");
                return false;
            }
            if (U_LoginName == "") {
                alert("请将必填项填写完整！");
                return false;
            }
            if (U_Password == "") {
                alert("请将必填项填写完整！");
                return false;
            }
            if (U_Passwords == "") {
                alert("请将必填项填写完整！");
                return false;
            }
            if (U_Name == "") {
                alert("请将必填项填写完整！");
                return false;
            }
            if (U_Sex == "") {
                alert("请将必填项填写完整！");
                return false;
            }
            if (U_Birthday == "0") {
                alert("请将必填项填写完整！");
                return false;
            }
        }
        var count = 1;
        //新增一行
        function TrAdd() {
            var Id = "id" + count;
            var chkId = "chk" + count;
            var div = "";
            div = "<div class='div'> <div class='form-group UserAdd' ><div class='col-md-2 col-sm-2 col-xs-6' ><input  type='text'  data-name='field' class='form-control' id=" + Id + " name=\"chk" + count + "\" style='text-align:right;'></div>";
            div += "<div class='col-sm-6 col-xs-12 nameid'><input    data-name='value' type='text' id=" + chkId + " class='form-control'  /></div></div></div>";
            $("#useradds").append(div);
            count++;


            tdclick(Id, chkId);

        }
        //td的点击事件  
        function tdclick(Id, chkId) {

            $("#" + Id).blur(function (event) {
                //2.获取当前文本框的内容                
                var inputtext = $("#useradds").find("#" + Id).val();
                var tdNode = $("#" + chkId);
                //4.将保存的文本框的内容填充到td中  
                //tdNode.html(inputtext);
                tdNode.attr("name", inputtext)//设置name属性               
                //5.让td重新拥有点击事件  
                tdNode.click(tdclick);
            });
        }
        //移除新行
        function removeHTML() {
            $("#useradds .div:last").remove();
        }

        //取消返回主界面
        function Quxiao() {
            window.location.href = 'MemberManagement.aspx';
        }

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

    </script>
    <!-- /. ROW  -->
</asp:Content>
