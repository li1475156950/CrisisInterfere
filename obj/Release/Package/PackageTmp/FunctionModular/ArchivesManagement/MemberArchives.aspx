<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MemberArchives.aspx.cs" Inherits="CrisisInterfere.FunctionModular.ArchivesManagement.MemberArchives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="/css/xlcp.css" rel="stylesheet" />
    <link href="/css/dagl.css" rel="stylesheet" />
    <link href="/JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <div class="content">
        <!-- main -->
        <div class="row" style="margin-left: 7px; margin-bottom: 10px;">
            <!-- 部门名称 -->
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
                <input type="text" class="form-control" id="loginName" placeholder="登录名/姓名">
            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                <input id="departmentName" placeholder="部门名称" class="form-control">
            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                <select id="sex" class="form-control c999">
                    <option value="0">性别</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
                <button class="btn btn-primary btn-sm pull-left" id="go_search" name="QX_SelectUser" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px;"><i class="fa fa-search "></i>查询</button>
            </div>
        </div>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <!-- Advanced Tables -->
            <div class="table-responsive">
                <div id="tableGrid_wrapper" class="dataTables_wrapper no-footer">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableGrid" role="grid" aria-describedby="tableGrid_info">
                        <thead>
                            <tr role="row">
                                <th class="text-center sorting_disabled" style="width: 13px;" rowspan="1" colspan="1">
                                    <input type="checkbox" id="allCheck" onclick="SelectAll(this)" />
                                </th>
                                <th class="text-center sorting_disabled" style="width: 47px;" rowspan="1" colspan="1">序号</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 300px;">登录名</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 236px;">姓名</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 150px;">性别</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 150px;">年龄</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 236px;">所属部门</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 240px;">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <button class="btn btn-or w_radius multiDelete"><i class="icon iconfont">&#xeb8d;</i> 批量删除</button>
            <!--End Advanced Tables -->
        </div>
        <!-- main结束 -->
    </div>
    <!-- 删除报告提示框 -->
    <div class="modal fade x_del in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">提示
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
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- JS Scripts-->
    <!-- 左侧下拉框 Js -->
    <script src="/js/jquery.metismenu.js"></script>
    <script src="/js/object.js"></script>
    <script src="../../JS/vue.js"></script>
    <script src="../../JS/ExtendJS.js"></script>
    <script>
        var navName = '/FunctionModular/ArchivesManagement/MemberArchives.aspx';
        var tableGrid;
        var searchModel = {};
        searchModel.StartIndex = 0;
        searchModel.EndIndex = 10;
        window.SetCheckAll();
        OnLoadTreeCom();
        function OnLoadTreeCom() {
            var tmep = false;
            $("#departmentName").ligerComboBox({
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
                        searchModel.DepartmentID = node.data['id'];
                    },
                    url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random() + '&mark=searchCondition',
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false,
                    onClick: function (node) {//单击事件  
                        if ($("#departmentName").val() == "")
                            searchModel.DepartmentID = 0;
                    }
                }
            });
        }
        InitTable();
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
        function InitTable() {


            searchModel.LoginName = $("#loginName").val();
            searchModel.Sex = $("#sex").find("option:selected")[0].getAttribute('value') == '0' ? "" : $("#sex").find("option:selected").text();
            //searchModel.Sex = $("#sex").find("option:selected").text();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tableGrid = $('#tableGrid').dataTable({
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
                    method: 'post',
                    url: "Ajax/MemberArchives.ashx",
                    dataSrc: "data",
                    async: true,
                    data: function (d) {
                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        searchModel.StartIndex = 0;
                        searchModel.EndIndex = 0;
                        if (d.start == 0) {
                            searchModel.EndIndex = d.length;
                        } else {
                            searchModel.StartIndex = d.start + 1;
                            searchModel.EndIndex = d.start + d.length;
                            $("#selectAll").removeAttr("checked", "checked");
                        }
                        return 'operationType=InitialTable&searchModel=' + JSON.stringify(searchModel);
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    $('td:eq(0)', row).html(" <input class='childCheck'  type=\"checkbox\" name='CheckboxID' value=\"" + data[8] + "\" />");
                    var operation = "";
                    operation =
                   " <button  class='btn btn-link showMemberArchives' data-uid='" + data[8] + "'>查看</button>"
                    + " <button class='btn btn-link deleteMemberArchive'  data-uid=" + data[8] + " >删除</button>";
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(5)', row).css("text-align", "center");
                    $('td:eq(6)', row).css("text-align", "center");
                    $('td:eq(7)', row).css("text-align", "center");
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
            searchModel.LoginName = $("#loginName").val();

            searchModel.Sex = $("#sex").find("option:selected")[0].getAttribute('value') == '0' ? "" : $("#sex").find("option:selected").text();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        })
        //$(document).on("click", ".childCheck", function () {
        //    uIDArray.push($(this).attr("value"));
        //})
        $(document).on("click", ".showMemberArchives", function () {
            var userID = $(this).attr("data-uid");
            sessionStorage.setItem("UserID", userID);
            window.location.href = "MemberArchivesView.aspx";
        })
        //全选的时候把checked给选中--全选勾选状态
        function SelectAll(obj) {
            if (obj.checked) {

                $("input[type=checkbox][name=CheckboxID]").prop("checked", true);

            } else {
                $("input[type=checkbox][name=CheckboxID]").prop("checked", false);
            }
        };
        $(document).on("click", "[name=CheckboxID]", function () {

            var isAllCheck = true;
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
                //else
                //    uIDArray.push($(this).attr("value"));
            }

            $("#allCheck")[0].checked = isAllCheck;
        })
        $(document).on("click", ".multiDelete", function () {
            var checkedArray = window.GetCheckedCheckBox();
            if (checkedArray.length == 0) {
                layer.alert('请选择需要的删除的项目');
                return;
            }
            layer.confirm("确定将所选档案放入到回收站中?", {
                btn: ["确定", "取消"]
            }, function () {
                var recycleBinModelList = [];
                for (var i = 0; i < checkedArray.length; i++) {
                    var recycleBinModel = {
                        RBTitle: "删除成员档案",
                        RBModularID: 37, //对应模块权限ID
                        RBTableName: "MemberArchive", //删除的表名
                        RBFieldName: "UserID", //删除相对应字段的id
                        RBFieldValue: $(checkedArray[i]).attr("value"),//删除的具体id
                        RBDeleteFieldName: "IsDelete",
                    };
                    recycleBinModelList.push(recycleBinModel);
                }
                var parameter = {
                    recycleBinModelList: recycleBinModelList,
                    callBack: function (data) {
                        if (data.State) {
                            layer.msg("删除成功!", { time: 2000, icon: 6 }, function () {
                                $("#tableGrid").DataTable().draw(false);
                            });
                        } else {
                            layer.msg("删除失败!", { time: 2000, icon: 6 });
                        }
                    }
                };
                window.PutDataToRecycleBin(parameter);
            }, function () {
                layer.closeAll();
            })
        })
        $(document).on("click", ".deleteMemberArchive", function () {
            var userID = $(this).attr("data-uid");
            layer.confirm("确定将此项档案放到回收站吗？", {
                btn: ["确定", "取消"]
            }, function () {
                var recycleBinModelList = [];
                var recycleBinModel = {
                    RBTitle: "删除成员档案",
                    RBModularID: 37, //对应模块权限ID
                    RBTableName: "MemberArchive", //删除的表名
                    RBFieldName: "UserID", //删除相对应字段的id
                    RBFieldValue: userID,//删除的具体id
                    RBDeleteFieldName: "IsDelete",
                };
                recycleBinModelList.push(recycleBinModel);
                var parameter = {
                    recycleBinModelList: recycleBinModelList,
                    callBack: function (data) {
                        if (data.State) {
                            layer.msg("删除成功!", { time: 2000, icon: 6 }, function () {
                                $("#tableGrid").DataTable().draw(false);
                            });
                        } else {
                            layer.msg("删除失败!", { time: 2000, icon: 6 });
                        }
                    }
                };
                window.PutDataToRecycleBin(parameter);
            }, function () {
                layer.closeAll();
            }
                )
        })
    </script>
</asp:Content>
