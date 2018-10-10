<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CrisisInterfereSolution.aspx.cs" Inherits="CrisisInterfere.FunctionModular.CrisisInterfereSolution.CrisisInterfereSolution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="/css/xlcp.css" rel="stylesheet" />
    <link href="/css/dagl.css" rel="stylesheet" />
    <link href="/JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <div class="content">
        <!-- main -->
        <div class="row" style="margin-left: 7px; margin-bottom: 10px;">
            <!-- 部门名称 -->
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px; margin-left: -15px;">
                <select id="solutionType" class="form-control c999">
                    <option value="0">全部</option>
                    <option value="1">成长教育</option>
                    <option value="2">挫折教育</option>
                    <option value="3">就业指导教育</option>
                    <option value="4">理想信念教育</option>
                    <option value="5">情感教育</option>
                    <option value="6">全人教育</option>
                    <option value="7">生涯辅导教育</option>
                    <option value="8">心理健康教育</option>
                    <option value="9">择业观教育</option>
                    <option value="10">其他</option>
                </select>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
                <button class="btn btn-primary btn-sm pull-left" id="go_search" name="QX_SelectUser" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px;"><i class="fa fa-search "></i>查询</button>
            </div>
            <div class="pull-right pr15" style="margin-top: 5px;">
                <button class="btn btn-primary btn-sm pull-right" id="addCrisisInterfereSolution" data-toggle="modal">+ 添加方案</button>
            </div>
        </div>
        <div class="col-md-12 col-sm-12 col-xs-12">
            <!-- Advanced Tables -->
            <div class="table-responsive">
                <div id="tableGrid_wrapper" class="dataTables_wrapper no-footer">
                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableGrid" role="grid" aria-describedby="tableGrid_info">
                        <thead>
                            <tr role="row">
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;"><input id="allCheck" type="checkbox" /></th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 100px;">序号</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 350px;">文章标题</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 180px;">类型</th>
                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 150px;">操作</th>
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
    <!-- JS Scripts-->
    <!-- 左侧下拉框 Js -->
    <script src="/js/jquery.metismenu.js"></script>
    <script src="/js/object.js"></script>
    <script>
        var navName = '/FunctionModular/CrisisInterfereSolution/CrisisInterfereSolution.aspx';
        var tableGrid;
        var searchModel = {};
        searchModel.StartIndex = 0;
        searchModel.EndIndex = 10;
        InitTable();
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
        window.SetCheckAll();
        var userRoleType = 0;
        var userID = 0;//当前系统用户ID
        var getUserRoleTypeParameter = {
            type: "get",
            dataType: "json",
            async: false,
            url: "/FunctionModular/AppointmentConsult/Ajax/AppointmentManagement.ashx?operationType=GetUserRoleTypeAndUserID",
            callBack: function (result) {
                userRoleType = result.UserRoleType;
                userID = result.UserID;
            }
        }
        //得到用户角色类型
        window.NewAJAX(getUserRoleTypeParameter);
        $(function () {
            if (userRoleType == 3) {
                $("#addCrisisInterfereSolution").hide();
            }
        })
        function InitTable() {
            searchModel.SolutionType = $("#solutionType").find("option:selected").val();
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
                    url: "Ajax/CrisisInterfereSolution.ashx",
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
                    var operation = "";
                    operation =
                   " <button  class='btn btn-link showCrisisInterfereSolution' data-cisid='" + data[5] + "'>查看</button>";
                    $('td:eq(0)', row).html(" <input class='childCheck' type=\"checkbox\" name='CheckboxID' value=\"" + data[5] + "\" />");
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(2)', row).css("text-align", "center");
                    $('td:eq(3)', row).css("text-align", "center");
                    $('td:eq(4)', row).html(operation);
                    if (userRoleType < 3) {
                        $('td:eq(4)', row).append(" <button  class='btn btn-link deleteSolution' data-cisid='" + data[5] + "'>删除</button>");
                    }
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
            });
        }
        $.fn.dataTable.ext.errMode = function (s, h, m) {
            
        };
        $(document).on("click", "#go_search", function () {
            searchModel.SolutionType = $("#solutionType").find("option:selected").val();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        })
        //$(document).on("click", ".childCheck", function () {
        //    uIDArray.push($(this).attr("value"));
        //})
        $(document).on("click", ".showCrisisInterfereSolution", function () {
            var CISID = $(this).attr("data-cisid");
            sessionStorage.setItem("CISID", CISID);
            window.location.href = "ShowCrisisInterfereSolution.aspx";
            //全选的时候把checked给选中--全选勾选状态
        })
        $(document).on("click", "#addCrisisInterfereSolution", function () {
            window.location.href = "AddCrisisInterfereSolution.aspx";
        })
        $(document).on("click", ".multiDelete", function () {
            var checkedArray = window.GetCheckedCheckBox();
            if (checkedArray.length == 0) {
                layer.alert('请选择需要的删除的方案');
                return;
            }
            layer.confirm("确定将所选方案放入到回收站中?", {
                btn: ["确定", "取消"]
            }, function () {
                var recycleBinModelList = [];
                for (var i = 0; i < checkedArray.length; i++) {
                    var recycleBinModel = {
                        RBTitle: "删除危机解决方案",
                        RBModularID: 139, //对应模块权限ID
                        RBTableName: "CrisisInterfereSolution", //删除的表名
                        RBFieldName: "CISID", //删除相对应字段的id
                        RBFieldValue: $(checkedArray[i]).val(),//删除的具体id
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
        $(document).on("click", ".deleteSolution", function () {
            var cisID = $(this).attr("data-cisid");
            layer.confirm("确定将此项方案放到回收站吗？", {
                btn: ["确定", "取消"]
            }, function () {
                var recycleBinModelList = [];
                var recycleBinModel = {
                    RBTitle: "删除危机解决方案",
                    RBModularID: 139, //对应模块权限ID
                    RBTableName: "CrisisInterfereSolution", //删除的表名
                    RBFieldName: "CISID", //删除相对应字段的id
                    RBFieldValue: cisID,//删除的具体id
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
