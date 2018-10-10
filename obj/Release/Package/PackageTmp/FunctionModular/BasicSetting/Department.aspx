<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.Department" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
 
    <link href="../../JS/datatables/media/css/jquery.dataTables.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-table.min.js"></script>
    <div class="row">
        <div class="col-md-12">

            <h1 class="page-header">基础设置 <small>部门管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">基础设置</a></li>
                <li><a href="#">部门管理</a></li>
            </ol>
        </div>
    </div>
    <div style="float: right; margin-bottom: 20px">
        <button class="btn btn-warning" style="margin-left: 10px" onclick="DepartmentTX()"><a style="color: white"><i class="glyphicon glyphicon-plus"></i>新增部门</a></button>
    </div>
    <div class="row">
        <div class="col-md-12">  
            <div class="panel panel-default">
                <div class="panel-heading">
                    量表展示  
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge"> 
                            <thead>
                                <tr> 
                                    <th>序号</th>
                                    <th>名称</th>
                                    <th>描述</th> 
                                    <th>数量</th>
                                    <th>操作</th>
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
    <div class="modal fade" id="Insertmdoels" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button> 
                    <h4 class="modal-title" id="ModalLabel">添加部门
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal ">

                        <div class="form-group ">

                            <div class="col-sm-12">
                                <label class="col-sm-3 control-label">*部门名称：</label>
                                <div class="lb-right-left pull-left">
                                    <input type="text" onkeydown="limite(this.value)"style="width: 200px" id="D_name" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <label class="col-sm-3 control-label">*录属部门：</label>
                                <div class="lb-right-left pull-left">
                                    <select class="form-control" id="D_chiID">
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal ">
                        <div class="form-group ">

                            <div class="col-sm-12">
                                <label class="col-sm-3 control-label">成员描述：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" style="font-size: 12px; margin-left: -15px;" id="D_Remark"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        取消
                    </button>
                    <button type="button" class="btn btn-primary" onclick="DeInsert()">
                        保存
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Updetamdoels" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title">查看部门
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal ">

                        <div class="form-group ">

                            <div class="col-sm-12">
                                <label class="col-sm-3 control-label">*部门名称：</label>
                                <div class="lb-right-left pull-left">
                                    <input type="hidden" id="UP_D_IDS" />

                                    <input type="text" class="form-control" style="width: 200px" id="D_names" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <label class="col-sm-3 control-label">*录属部门：</label>
                                <div class="lb-right-left pull-left">
                                    <input type="text" class="form-control" style="width: 200px" id="D_chiIDs" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal ">
                        <div class="form-group ">

                            <div class="col-sm-12">
                                <label class="col-sm-3 control-label">成员描述：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" style="font-size: 12px; margin-left: -15px;" id="D_Remarks"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="D_updeta()">
                        提交更改
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script>

        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        $("#LBGL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');

        data();
        function data()
        {


            var D_name;
            var D_Remark;
            var D_number;
            /*列表展现部分
              创建时间：2016-09-19
              创建人：李兆典
              功能介绍：加载量表列表集合
           */
            var Starindex = 0;//开始条数索引
            var Endindex = 10;//结束条数索引
            $('#DataTables-Gauge').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
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
                    url: "Ajax/Department.ashx",
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
                        return 'type=1 &Starindex=' + Starindex + '&Endindex=' + Endindex;
                    }
                },
                createdRow: function (row, data, dataIndex) {

                    //$('td:eq(0)', row).html(" <input name=checkbox type=\"checkbox\" value=\"" + data[0] + "\" />");

                    var operation = "";

                    operation = " <button class=\"btn btn-primary  btn-sm\"onclick=\"Updetamdoels(" + data[0] + ")\"><i class=\"fa fa-edit \"></i> 修改</button>"
                   + " <button class=\"btn btn-danger  btn-sm\" onclick='D_delete(" + data[0] + ")'><i class=\"glyphicon glyphicon-trash\"></i> 删除</button>";

                    $('td:eq(4)', row).html(operation);
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

        function DepartmentTX() {
            initSelectInput("type=2", "D_chiID", "---请选择部门---");//初始化量表类别
            $('#Insertmdoels').modal('show');
        }
        //得到id找到当前列
        function Updetamdoels(UP_D_ID) {
            var UP_D_ID = UP_D_ID;
            $.ajax({
                type: "POST",
                data: { type: 5 },
                dataType: "html",
                url: "Ajax/Department.ashx",
                data: { type: 5, UP_D_ID: UP_D_ID },
                success: function (result) {
                    console.info(result)
                    result = eval('(' + result + ')');
                    $("#UP_D_IDS").val(result._d_id);
                    $("#D_names").val(result._d_name);
                    $("#D_chiIDs").val(result.d_chiIDs);
                    $("#D_Remarks").val(result._d_remark);
                }
            })
            $('#Updetamdoels').modal('show');
        }

        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(type, DepartmentID, Exhibition) {
            $("#" + DepartmentID).empty();
            if (Exhibition != "") {
                $("#" + DepartmentID).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/Department.ashx",
                data: type,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + DepartmentID).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                    });

                }
            });
        }
        //添加
        function DeInsert() {
            var D_name = $("#D_name").val();
            var D_chiID = $("#D_chiID").val();
            var D_Remark = $("#D_Remark").val();
            $.ajax({
                type: "POST",
                dataType: "html",
                url: "Ajax/Department.ashx",
                data: { type: 3, D_name: D_name, D_chiID: D_chiID, D_Remark: D_Remark },
                success: function (result) {
                    if (result = "1") {
                        layer.alert('添加成功!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })

                        $('#Insertmdoels').modal("hide")
                    }
                    else {
                        layer.alert('添加失败!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })

                    }
                }
            })
        }
        //删除
        function D_delete(D_ID) {
            var D_ID = D_ID;
            $.ajax({
                type: "post",
                data: { type: 4, D_ID: D_ID },
                url: "Ajax/Department.ashx",
                success: function (result) {
                    if (result = "1") {
                        layer.msg('删除成功', { time: 2000, icon: 1 }, function () {
                            layer.closeAll('dialog');
                        });
                    }
                    else {
                        layer.alert('删除失败!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })

                    }
                }
            })
        }
        //修改
        function D_updeta() {
            var UP_D_IDS = $("#UP_D_IDS").val();
            var D_name  = $("#D_names").val();
            var D_Remark = $("#D_Remarks").val();


            $.ajax({
                type: "POST",
                dataType: "html",
                url: "Ajax/Department.ashx",
                data: { type: 6, D_name: D_name, D_Remark: D_Remark ,UP_D_IDS:UP_D_IDS},
                success: function (result) {
                    if (result = "1") {
                        layer.alert('添加成功!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })

                        $('#Updetamdoels').modal("hide")
                    }
                    else {
                        layer.alert('添加失败!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })

                    }
                }
            })
        }

        //文本框特征
        function limite(obj) {
            if (obj.length > 10)
                $("#D_name").val() = obj.substr(0, 10)
        }
    </script>
       
</asp:Content>
