<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MemberManagement_old.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.MemberManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    
    <div class="row">
        <div class="col-md-12">

            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">基础设置</a></li>
                <li><a href="#" style="color: #666;">成员管理</a></li>
            </ol>
        </div>
    </div>
    <!-- /. ROW  -->
    <div class="row" style="margin-left: 7px; margin-bottom: 10px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input type="text" class="form-control" id="LoginName" placeholder="登录名/姓名" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="form-control" id="Sel_RoleType"></select>
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input type="text" id="T_parent" name="T_parent" placeholder="--部门名称--" />

        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="form-control" id="sex">
                <option value="">性别</option>
                <option value="0">男</option>
                <option value="1">女</option>

            </select>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
            <button class="btn btn-primary btn-sm" id="go_search" name="QX_SelectUser"><i class="fa fa-search "></i>查询</button>
            <button class="btn  btn-sm text-right" name="QX_NewUser" style="background-color: orange; color: white" data-id="54" onclick="javascript:window.location.href='AddMember.aspx'">+新成员</button>
        </div>
    </div>

    <div class="row" style="margin-left: 7px; margin-bottom: 10px;">
        <div class="col-md-12">

            <div class="panel-body" style="padding: 0px;">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">
                        <thead>
                            <tr>
                                <th class="text-center" style="width: 6%">
                                    <input class="parentCheck" type="checkbox" id="selectAll" /></th>
                                <th class="text-center" style="width: 8%">序号</th>
                                <th class="text-center">登录名</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">性别</th>
                                <th class="text-center">角色名称</th>
                                <th class="text-center">所属部门</th>
                                <th class="text-center" style="width: 23%">操作</th>

                            </tr>
                        </thead>
                    </table>

                </div>
                <button class="btn btn-reds" name="QX_DeletesUser" data-id="57" onclick='u_deletes()'><i class="glyphicon glyphicon-trash"></i>批量删除</button>
                <button class="btn btn-or" data-id="58" name="QX_NewPwd" onclick="u_updatepwds()"><i class="glyphicon glyphicon-lock"></i>重置密码</button>
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
                                <label class="col-sm-2 control-label" for="ds_host">角色名称</label>
                                <div class="col-sm-4">
                                    <input class="form-control" style="font-size: 12px" id="RoleName" type="text" disabled="disabled" />
                                    
                                </div>
                                <label class="col-sm-2 control-label" for="ds_name">所属部门</label>
                                <div class="col-sm-4">
                                    <input class="form-control" style="font-size: 12px" id="DepartmentName" type="text" disabled="disabled" />
                                </div>

                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_username">登录名</label>
                                <div class="col-sm-4">
                                    <input class="form-control" style="font-size: 12px" id="LoginName01" type="text" disabled="disabled" />
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="ds_username">姓名</label>
                                    <div class="col-sm-4">
                                        <input class="form-control" style="font-size: 12px" id="UserName" type="text" disabled="disabled" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_password">性别</label>
                                <div class="col-sm-4">
                                    <input class="form-control" style="font-size: 12px" id="Sex" type="text" disabled="disabled" />
                                </div>
                                <label class="col-sm-2 control-label" for="ds_password">出生日期</label>
                                <div class="col-sm-4">
                                    <input class="form-control" style="font-size: 12px" id="birthdayss" type="text" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label" for="ds_username">学号</label>
                                <div class="col-sm-4">
                                    <input class="form-control" style="font-size: 12px" id="StudentID" type="text" disabled="disabled" />
                                </div>

                            </div>
                        </fieldset>
                        <fieldset>

                            <legend style="font-size: 16px;">高级信息</legend>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">电子邮箱</label>
                                <div class="col-sm-4">
                                    <input type="text" style="font-size: 12px" class="form-control" id="Email" disabled="disabled" />
                                </div>
                                <label class="col-sm-2 control-label">手机号</label>
                                <div class="col-sm-4">
                                    <input type="text" style="font-size: 12px" class="form-control" id="Tel" disabled="disabled" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">成员描述</label>
                                <div class="col-sm-10">

                                    <textarea class="form-control" style="font-size: 12px" id="Remarks" disabled="disabled" maxlength="500"></textarea>
                                </div>
                            </div>

                        </fieldset>

                        <fieldset>
                            <legend style="font-size: 16px;">家长信息</legend>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">电子邮箱</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" style="font-size: 12px" id="P_Email" disabled="disabled" />
                                </div>
                                <label class="col-sm-2 control-label">手机号</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" style="font-size: 12px" id="P_Tel" disabled="disabled" />
                                </div>
                            </div>

                        </fieldset>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm" data-dismiss="modal">
                        关闭
                    </button>
                </div>
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <%-- 修改 --%>
    <div class="modal fade" id="mdoels" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <form id="UserInfoAdd" class="form-horizontal" role="form">
            <div class="modal-dialog">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h2 class="modal-title text-center" id="ModalLabel" style="color: #4CB1CF;">个人信息
                    </h2>


                    <div class="modal-body">

                        <fieldset>
                            <legend style="font-size: 16px;">基本信息</legend>
                            <div class="form-group " hidden="hidden" id="User">
                                <div class="group">
                                    <label class="col-sm-2 control-label">角色名称</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" id="R_IDs" name="RoleName">
                                        </select>
                                    </div>
                                </div>
                                <div class="group">
                                    <label class="col-sm-2 control-label">所属部门</label>
                                    <div class="col-sm-4">
                                        <input id="Department_IDs" name="Department" style="top: 0; height: 20px;" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <%--  <div class="group">--%>
                                <label class="col-sm-2 control-label" for="ds_name">部门权限</label>
                                <div class="col-sm-4">
                                    <input id="Dauthority" style="top: 0; height: 20px;" />
                                </div>
                                <%-- </div>--%>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-2  control-label">
                                    <div class="form-group ">
                                        <div class="group">
                                            <label class="col-sm-4 control-label">登录名</label>
                                            <input type="hidden" class="form-control" id="U_ID" />
                                            <div class="col-md-8 col-sm-2  control-label">
                                                <input type="text" class="form-control" id="U_LoginName" name="LoginName" disabled="disabled" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-2  control-label">
                                    <div class="form-group ">
                                        <div class="group">
                                            <label class="col-sm-4 control-label">姓名</label>
                                            <div class="col-md-8 col-sm-2  control-label">
                                                <input type="text" class="form-control" id="U_Names" name="UserName" maxlength="10" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group ">
                                <div class="group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-4">
                                        <select class="form-control" id="Sexs" name="Sex">
                                            <option value="女">女</option>
                                            <option value="男">男</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="group">
                                    <label class="col-sm-2 control-label">出生日期</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" id="birthdays" name="Birthday" />
                                    </div>
                                </div>
                            </div>

                        </fieldset>
                        <fieldset>
                            <div id="Add">
                                <legend style="font-size: 16px;">高级信息</legend>
                                <div class="form-group ">
                                    <div class="group">
                                        <label class="col-sm-2 control-label">电子邮箱</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="Emails" name="Email" />
                                        </div>
                                    </div>
                                    <div class="group">
                                        <label class="col-sm-2 control-label">手机号</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" id="tels" name="Tel" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" id="Did_Remark">
                                    <div class="group">
                                        <label class="col-sm-2 control-label">成员描述</label>
                                        <div class="col-sm-10">
                                            <textarea class="form-control" style="font-size: 12px;" id="U_Remarkss" name="Remark"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group" style="display: none" id="Div_U_Consult">
                                    <label class="col-sm-2 control-label">咨询师简介</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="2" id="U_Consult" name="U_Consult" maxlength="30"></textarea>
                                    </div>
                                </div>
                                <div class="form-group" style="display: none" id="Div_GoodField">
                                    <label class="col-sm-2 control-label">擅长领域</label>
                                    <div class="col-sm-10">
                                        <textarea class="form-control" rows="2" id="GoodField" name="GoodField" maxlength="30"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div id="useradds">
                            </div>
                            <div class="row" style="margin-top: 20px">
                                <div class="col-sm-6  col-xs-5 text-right">
                                    <button type="submit" class="btn btn-sm" id="Sumit" style="background-color: orange; color: white">保存</button>
                                </div>
                                <div class="col-sm-2 col-xs-4  text-right">
                                    <button type="button" class="btn btn-sm" id="Colse" style="color: white">取消</button>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <input type="hidden" id="UserIDhid" />
    <input type="hidden" id="DepID" />
    <input type="hidden" id="DepIDs" />
    <input type="hidden" id="DA" />
    <input type="hidden" id="DIDW" />
    <%--  //从后台查询出的数据--%>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>

     <script>
         var navName = '/FunctionModular/BasicSetting/MemberManagement.aspx';
         var RoleTypes = 0;
         var GetFuntionType = 0;
         var RoleTypeByid = 0;
         initSelectInput("Remark=1", "Sel_RoleType", "--角色名称--");//初始化量表类别
         initSelectInput("Remark=1", "R_IDs", "--角色名称--");//初始化量表类别
         //initSelectInput("Remark=1", "CRoleName", "请选择");//初始化量表类别
         //  $('#birthdays').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });

         //日期格式加bootsop验证
         $("#birthdays").datepicker({
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

         OnLoadTreeCom();
         OnDauthority();
         OnLoadTreeComD();
         UserAdd();
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
             departmentname = $("#T_parent").val();
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
                     $('td:eq(0)', row).html(" <input class=childCheck data-name=" + data[2] + " name=checkbox type=\"checkbox\" name='CheckboxID' value=\"" + data[0] + "\" />");
                     var operation = "";
                     operation =
                    " <button  class=\"btn btn-link\" data-id='56'  name='QX_UpdateUser'  onclick=\"seupdate(" + data[0] + "," + "'" + data[6] + "'" + "," + "'" + data[8] + "')\">修改</button>"
                    + " <button class=\"btn btn-link\" data-id='57' name='QX_DeleteUser' data-name=" + data[2] + " value=" + data[0] + " onclick='u_delete(this)'>删除</button>"
                     + " <button  class=\"btn btn-link\" name='QX_UpdateUserPwd' data-id='58'onclick='u_updatepwd(" + data[0] + ")'>重置密码</button>";
                     $('td:eq(0)', row).css("text-align", "center");
                     $('td:eq(1)', row).css("text-align", "center");
                     $('td:eq(4)', row).css("text-align", "center");
                     $('td:eq(5)', row).css("text-align", "center");
                     $('td:eq(6)', row).css("text-align", "center");
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
             departmentname = $("#DepID").val();
             sex = $("#sex").val();
             if (dtDetail != undefined) {
                 $("#DataTables-Gauge").DataTable().draw();
                 return;
             }
         });


         /*-----列表展现部分END-----*/


         //角色改变选中的值
         $("#R_IDs").change(function () {
             GetFuntionType = $(this).children('option:selected').attr("data-name");
             RoleTypeByid = $(this).children('option:selected').attr("data-id");
             if (GetFuntionType == 4) {
                 $("#Div_U_Consult").show();
                 $("#Div_GoodField").show();
                 $("#Did_Remark").hide();
             } else {
                 $("#U_Consult").text("");
                 $("#GoodField").text("");
                 $("#Div_U_Consult").hide();
                 $("#Div_GoodField").hide();
                 $("#Did_Remark").show();
             }
             if (RoleTypeByid == 3) {
                 //$("#Dauthority_val").ligerGetComboBoxManager().clearContent();
                 OnDauthority();
                 GetTrees.selectValue(0);
                 $("#Dauthority").attr("disabled", true);
             } else {
                 $("#Dauthority").attr("disabled", false);
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

                             $("#" + controlname).append("<option value='" + item.Value + "'  data-name='" + item.Funtype + "' data-id='" + item.RoleType + "'>" + item.Text + "</option>");

                         });

                     }
                 });
             }, 100);

         }
         /*------查----看-----*/
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

         /*-----初始化下拉列表公共方法END-----*/

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
             }
         }

         /*-----查询单个---------*/

         var groupTree;
         var GetTrees;
         function seupdate(obj, Dname, Did) {

             quxis();

             $("#DepID").val("");
             $(".UserAdd").remove();
             $(".UserID").remove();
             $("#UserInfoAdd").data('bootstrapValidator').destroy();
             $('#UserInfoAdd').data('bootstrapValidator', null);
             UserAdd();
             $("#UserIDhid").val(obj);
             //initSelectInput("Remark=1", "Sel_RoleType", "全部分类");
             var U_ID = obj;
             $.ajax({
                 url: "Ajax/RoleUpdate.ashx?type=1",
                 data: { U_ID: U_ID },
                 type: "get",
                 success: function (result) {
                     result = eval('(' + result + ')');

                     //判断是否是咨询师
                     if (result._RFtype == "4") {
                         RoleTypes = 4;
                         GetFuntionType = 4;
                         $("#Div_U_Consult").show();
                         $("#Div_GoodField").show();
                         $("#Did_Remark").hide();
                     } else {
                         RoleTypes = 3;
                         $("#U_Consult").text("");
                         $("#GoodField").text("");
                         $("#Div_U_Consult").hide();
                         $("#Div_GoodField").hide();
                         $("#Did_Remark").show();
                     }
                     //alert(result)
                     //console.info(result);
                     $("#DIDW").val(Did);
                     $("#R_IDs").val(result._r_id);
                     if (result._department_id != null && result._department_id) {
                         GetTrees.selectValue(result._department_id);
                     }
                     $("#Role_Type").val(result.Role_Type)
                     $("#U_LoginName").val(result._u_loginname);

                     //groupTree.reload();
                     //初始化选中  
                     if (result._departmentauthority != null && result._departmentauthority != "" && result._departmentauthority != 0) {
                         //alert(result._departmentauthority);
                         groupTree.selectValue(result._departmentauthority);
                     }
                     else {
                         $("#Dauthority").val("无");

                     }
                     if (result._department_id != null && result._department_id != "") {
                         GetTrees.selectValue(result._department_id);
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
                         OnDauthority();
                         groupTree.selectValue(0);
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

         function UserAdd() {
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
                         message: '角色名验证失败',
                         verbose: false,
                         validators: {
                             notEmpty: {
                                 message: '角色名不能为空'
                             },
                             callback: {
                                 message: '请选择角色',
                                 callback: function (value, validator) {
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
                                 message: '用户名已存在',
                                 callback: function (value, validator) {
                                     var IsTrue;
                                     var UserID = $('#UserIDhid').val();
                                     $.ajax({
                                         url: "Ajax/MemberManagement.ashx?type=6",
                                         type: "GET",
                                         data: { loginName: value, UserID: UserID },
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
                         group: '.group',
                         message: '姓名输入有误',
                         validators: {
                             notEmpty: {
                                 message: '用户姓名不能为空.'
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

                                     return value != null;
                                 }
                             }
                         }
                     }, Birthday: {
                         group: '.group',
                         message: '出生日期有误',
                         validators: {
                             notEmpty: {
                                 message: '出生日期不能为空.'
                             }
                         }
                     },
                     Department: {
                         group: '.group',
                         validators: {
                             callback: {
                                 message: '请选择所属部门',
                                 callback: function (value, validator) {
                                     return value != "无" && value !== "";
                                 }
                             }
                         }
                     }, Email: {
                         group: '.group',
                         validators: {
                             regexp: {
                                 regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                                 message: '请输入正确的邮箱格式'
                             }
                         }
                     }, Tel: {
                         group: '.group',
                         validators: {
                             regexp: {
                                 regexp: /^1[0-9]{10}$/,
                                 message: '请输入有效的手机号'
                             }
                         }
                     }, Student: {
                         group: '.group',
                         message: '学号验证失败',
                         validators: {
                             numeric: { message: '只能输入数字' },
                             stringLength: {
                                 min: 0,
                                 max: 20,
                                 message: '用户名姓名不能大于500位'
                             },
                         }
                     }, Remark: {
                         group: '.group',
                         message: '成员描述',
                         validators: {
                             stringLength: {
                                 min: 0,
                                 max: 500,
                                 message: '用户名姓名不能大于500位'
                             },

                         }
                     }, ParentsEMail: {
                         group: '.group',
                         validators: {
                             regexp: {
                                 regexp: /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                                 message: '请输入正确的邮箱格式'
                             }
                         }
                     }, ParentsTel: {
                         group: '.group',
                         validators: {

                             regexp: {
                                 regexp: /^1[0-9]{10}$/,
                                 message: '请输入有效的手机号'
                             }
                         }
                     }
                 }

             }).on('success.form.bv', function (e) {
                 e.preventDefault();
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
                 var Role_Type = $("#Role_Type").val();
                 var U_LoginName = $("#U_LoginName").val();
                 var Department_IDs = $("#DepIDs").val()
                 //if (Department_IDs == null || Department_IDs == "")
                 //{
                 //    Department_IDs = $("#DIDW").val();
                 //}
                 var U_Names = $("#U_Names").val();
                 var Sexs = $("#Sexs").val();
                 var StudentIDs = $("#StudentIDs").val();//学号
                 var birthdays = $("#birthdays").val();
                 var Emails = $("#Emails").val();
                 var tels = $("#tels").val();
                 var Remarks = $("#U_Remarkss").val();
                 var P_Emails = $("#P_Emails").val();
                 var P_Tels = $("#P_Tels").val();
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
                 //DA = DA.replace(";", ",");
                 //if (Department_IDs == "null" || Department_IDs == null || Department_IDs == "0" || Department_IDs == "") {
                 //    layer.alert('所属部门不能为空!', {
                 //        skin: 'layui-layer-lan', //样式类名
                 //        closeBtn: 0
                 //    })
                 //    return;
                 //}
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
                         P_Emails: P_Emails,
                         P_Tels: P_Tels,
                         U_AddField: U_AddField,
                         DA: DA,
                         U_Consult: U_Consult,
                         GoodField: GoodField,
                         GetFuntionType: GetFuntionType,
                         RFType: RoleTypes,

                     },
                     type: "Get",
                     dataType: "text",
                     success: function (data) {
                         if (data) {
                             $("#DataTables-Gauge").DataTable().draw();
                             $('#mdoels').modal('hide');
                             $(".UserAdd").remove();
                             $(".UserID").remove();
                             layer.msg('保存成功！', { icon: 1 });

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

             });
         }

         $("#selectAll").click(function () {//全选 
             if (this.checked) {
                 $("#DataTables-Gauge :checkbox").prop("checked", true);
             }
             else {
                 $("#DataTables-Gauge :checkbox").prop("checked", false);
             }
         });

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
                     url: 'Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
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
         //部门权限

         function OnLoadTreeComD() {
             GetTrees = $("#Department_IDs").ligerComboBox({
                 width: "100%",
                 selectBoxWidth: "87%",
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
                     $('#UserInfoAdd').data('bootstrapValidator')
                     .updateStatus('Department', 'NOT_VALIDATED', null)
                     .validateField('Department');
                 }
             });

         }
         //部门权限
         function OnDauthority() {
             groupTree = $("#Dauthority").ligerComboBox({
                 width: "100%",
                 selectBoxWidth: "87%",
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
                     url: 'Ajax/DepartmentMain.ashx?Remark=DepartmentAuthorityRole&Roletype=' + RoleTypeByid + '&rnd=' + Math.random(),
                     usericon: 'd_icon',
                     idFieldName: 'id',
                     checkbox: true
                 }, onSelected: function (value, text) {
                     $("#Dauthority").val(text);
                     $("#DA").val(value);
                     //$("#Dauthority").text(text);
                     //$('#mdoels').data('bootstrapValidator')
                     //.updateStatus('Department', 'NOT_VALIDATED', null)
                     //.validateField('Department');
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
         }
         //新增一行
         var count = 1;
         function TrAdd() {
             $("#removes").show();
             var Id = "id" + count;
             var chkId = "chk" + count;
             var div = "";
             div = "<div class='div'> <div class='form-group UserAdd' ><div class='col-md-2 col-sm-2 '><input  type='text' data-name='field' class='form-control' id=" + Id + " name=\"chk" + count + "\"></div>";
             div += "<div class='col-md-10 col-sm-10 nameid'><input data-name='value'  type='text'  id=" + chkId + " class='form-control' /></div></div></div>";
             $("#useradds").append(div);
             count++;
             tdclick(Id, chkId);
         }
         ////td的点击事件  
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
         //修改关闭       
         $("#Colse").click(function () {
             $('#mdoels').modal('hide');
             $(".UserAdd").remove();
             $(".UserID").remove();
         });

         function removehtml() {
             $("#useradds .form-group:last").remove();
         }
         function quxis() {
             $(".l-checkbox").removeClass('l-checkbox-checked');
             $(".l-checkbox").addClass('l-checkbox-unchecked');
         }

    </script>
</asp:Content>
