<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ParameterReservation.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Reservation.ParameterReservation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <link href="../../JS/datatables/media/css/jquery.dataTables.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <!--表单提示-->
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>


    <style type="text/css">
        .table.dataTable.no-footer {
            border-bottom: #ffffff;
        }

        .table.dataTable thead th, table.dataTable thead td {
            border-bottom: #ffffff;
        }
    </style>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">心理咨询</a></li>
                <li><a href="#">参数设置</a></li>
            </ol>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="panel-body">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#home" onclick="Way()" data-toggle="tab">咨询方式</a>
                    </li>
                    <li class=""><a href="#profile" data-toggle="tab" id="Place" onclick="Place()">咨询地点</a>
                    </li>
                    <li class=""><a href="#divide" data-toggle="tab" id="Problem" onclick="Problem()">问题类型</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <%--咨询方式 --%>
                    <div class="tab-pane fade active in" id="home">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                咨询方式  
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right;">
                                                <button onclick="insertshows(1)" class="btn btn-search btn-sm" style="height: 22px; padding-top: 0px;">
                                                    <i class="fa fa-search "></i>添加</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 20%">序号</th>
                                                        <th style="width: 20%">名称</th>
                                                        <th style="width: 40%">描述</th>
                                                        <th style="width: 20%">操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--咨询地点--%>
                    <div class="tab-pane fade" id="profile">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                咨询地点  
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right;">
                                                <button onclick="insertshows(2)" class="btn btn-search btn-sm" style="height: 22px; padding-top: 0px;">
                                                    <i class="fa fa-search "></i>添加</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="DataTables-Place">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 20%">序号</th>
                                                        <th style="width: 20%">名称</th>
                                                        <th style="width: 40%">描述</th>
                                                        <th style="width: 20%">操作</th>
                                                    </tr>
                                                </thead>
                                                <tbody></tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- 问题类型  --%>
                    <div class="tab-pane fade" id="divide">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4 col-xs-4">
                                                问题类型  
                                            </div>
                                            <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right;">
                                                <button onclick="insertshows(3)" class="btn btn-search btn-sm" style="height: 22px; padding-top: 0px;">
                                                    <i class="fa fa-search "></i>添加</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="DataTables-Problem">
                                                <thead>
                                                    <tr>
                                                        <th style="width: 20%">序号</th>
                                                        <th style="width: 20%">名称</th>
                                                        <th style="width: 40%">描述</th>
                                                        <th style="width: 20%">操作</th>
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
                    </div>
                    <%--以后备用--%>
                    <div class="tab-pane fade" id="messages">
                    </div>

                </div>
            </div>
        </div>
    </div>

    <!--修改的model-->
    <div class="modal fade" id="update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 35%; width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="xiu">修改参数</h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="panel panel-default text-center bg-color-blue no-boder">
                                <div class="lb-panel-left pull-left blue">
                                    *名称:
                                </div>
                                <div class=" lb-panel-right pull-right">
                                    <input id="ParameterID" type="hidden" class="form-control" />
                                    <input id="ParameterType" type="hidden" class="form-control" />
                                    <input id="ParameterName" maxlength="20" type="text" class="form-control" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                描述:
                            </div>
                            <div class="panel-body">
                                <textarea id="descr" maxlength="500" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                    <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                        取消
                    </button>
                    <button onclick="updateParameter()" type="button" class="btn btn-primary">
                        保存
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!--添加model-->
    <div class="modal fade" id="insertshow" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 35%; width: 100%">

                <form id="prompt" class="form-horizontal" role="form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="tian">添加参数
                        </h4>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel panel-default text-center bg-color-blue no-boder">
                                    <div class="lb-panel-left pull-left blue">
                                        *名称:
                                    </div>
                                    <div class=" lb-panel-right pull-right">
                                        <input id="ParameterTypeinsert" type="hidden" class="form-control" />
                                        <input id="ParameterNameinsert" name="ParameterNameinsert" maxlength="20" type="text" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    描述:
                                </div>
                                <div class="panel-body">
                                    <textarea id="descrinsert" name="descrinsert" maxlength="500" class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                        <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                            取消
                        </button>
                        <button onclick="insert()" type="button" class="btn btn-primary">
                            保存
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script>
        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        $("#LBGL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');
        Way();
        var Tian_Title = "添加咨询方式";
        var update_title = "修改咨询方式";
        var Ways;
        function Way() {
            var D_name;
            var D_Remark;
            var D_number;
            /*
              列表展现部分
              创建时间：2016-10-17
              创建人：李兆典
              功能介绍：加载量表列表集合
           */

            Tian_Title = "添加咨询方式";
            update_title = "修改咨询方式";

            if (Ways != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
            var Starindex = 0;//开始条数索引
            var Endindex = 10;//结束条数索引
            Ways = $('#DataTables-Gauge').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中” 
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    },
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Parameter.ashx?type=Way",
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
                        return 'Starindex=' + Starindex + '&Endindex=' + Endindex;
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    if (data[0] != 1 && data[0] != 2 && data[0] != 3) {


                        operation = " <button class=\"btn btn btn-info btn-sm\"onclick=\"Updata(" + data[0] + ")\"><i class=\"glyphicon glyphicon-ok \"></i>修改</button>"
                     + " <button class=\"btn btn-danger  btn-sm\" onclick=\"Parameter_delete(" + data[0] + ")\"><i class=\"glyphicon glyphicon-trash\"></i>删除</button>";
                    }
                    else {
                        operation = " <button class=\"btn btn btn-info btn-sm\"onclick=\"Updata(" + data[0] + ")\"><i class=\"glyphicon glyphicon-ok \"></i>修改</button>"
                    }

                    $('td:eq(2)', row).html(operation);
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

        var Places;
        function Place() {
            var D_name;
            var D_Remark;
            var D_number;
            /*列表展现部分
              创建时间：2016-10-17
              创建人：李兆典
              功能介绍：加载量表列表集合
           */

            Tian_Title = "添加咨询地点";
            update_title = "修改咨询地点";
            if (Places != undefined) {
                $("#DataTables-Place").DataTable().draw();
                return;
            }

            var Starindex = 0;//开始条数索引
            var Endindex = 10;//结束条数索引
            Places = $('#DataTables-Place').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中” 
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    },
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Parameter.ashx",
                    dataSrc: "data",
                    data: function (d) {
                        Endindex = 0;
                        Starindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'type=Place&Starindex=' + Starindex + '&Endindex=' + Endindex;
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    var operation = "";

                    operation = " <button class=\"btn btn btn-info btn-sm\"onclick=\"Updata(" + data[0] + ")\"><i class=\"glyphicon glyphicon-ok \"></i>修改</button>"
                 + " <button class=\"btn btn-danger  btn-sm\" onclick=\"Parameter_delete(" + data[0] + ")\"><i class=\"glyphicon glyphicon-trash\"></i>删除</button>";


                    $('td:eq(2)', row).html(operation);
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

        var Problems;
        function Problem() {
            var D_name;
            var D_Remark;
            var D_number;
            /*列表展现部分
              创建时间：2016-10-17
              创建人：李兆典
              功能介绍：加载量表列表集合
           */
            Tian_Title = "添加问题类型";
            update_title = "修改问题类型";
            if (Problems != undefined) {
                $("#DataTables-Problem").DataTable().draw();
                return;
            }

            var Starindex = 0;//开始条数索引
            var Endindex = 10;//结束条数索引
            Problems = $('#DataTables-Problem').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中” 
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    },
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Parameter.ashx",
                    dataSrc: "data",
                    data: function (d) {
                        Endindex = 0;
                        Starindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'type=Problem&Starindex=' + Starindex + '&Endindex=' + Endindex;
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    operation = " <button class=\"btn btn btn-info btn-sm\"onclick=\"Updata(" + data[0] + ")\"><i class=\"glyphicon glyphicon-ok \"></i>修改</button>"
                 + " <button class=\"btn btn-danger  btn-sm\" onclick=\"Parameter_delete(" + data[0] + ")\"><i class=\"glyphicon glyphicon-trash\"></i>删除</button>";


                    $('td:eq(2)', row).html(operation);
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

        function Updata(obj) {
            $("#xiu").html("");
            $('#ParameterName').attr("disabled", false);
            $("#xiu").html(update_title);
            $('#update').modal('show');
            var ParameterID = obj

            $.ajax({
                url: "Ajax/Parameter.ashx?type=select",
                data: { ParameterID: ParameterID },
                type: "GET",
                dataType: "text",
                success: function (result) {
                    result = eval("(" + result + ")");
                    $("#ParameterID").val(result._parameterid);
                    $("#ParameterName").val(result._parametername);
                    $("#descr").val(result._descr);
                    $("#ParameterType").val(result._parametertype)
                    if (result._parameterid < 3) {
                        $("#ParameterName").attr("disabled", "disabled");
                    }
                }
            })
        }
        function updateParameter() {
            var parameterid = $("#ParameterID").val();
            var ParameterName = $("#ParameterName").val();
            var ParameterType = $("#ParameterType").val();
            var descr = $("#descr").val();

            if (Trim(ParameterName) == "" || Trim(ParameterName) == null) {
                layer.alert('请填写名称！!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                })
                return;
            }

            $.ajax({
                url: "Ajax/Parameter.ashx?type=update",
                data: { parameterid: parameterid, ParameterName: ParameterName, descr: descr, ParameterType: ParameterType },
                type: "GET",
                dataType: "text",
                success: function (result) {
                    if (result) {
                        $("#DataTables-Gauge").DataTable().draw();
                        $("#DataTables-Place").DataTable().draw();
                        $("#DataTables-Problem").DataTable().draw();
                        $('#update').modal('hide');
                        layer.alert('保存成功!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })

                    }
                    else {
                        layer.alert('保存失败!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })
                    }
                }
            })
        }

        function Parameter_delete(obj) {
            var ParameterID = obj;

            $.ajax({
                url: "Ajax/Parameter.ashx?type=delete",
                data: { ParameterID: ParameterID },
                type: "GET",
                dataType: "text",
                success: function (result) {
                    if (result) {
                        $("#DataTables-Gauge").DataTable().draw();
                        $("#DataTables-Place").DataTable().draw();
                        $("#DataTables-Problem").DataTable().draw();
                        layer.msg("删除成功", { icon: 1, time: 2000 }, function () {
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

        function insertshows(obj) {
           
            $("#ParameterTypeinsert").val(obj);
            $('#insertshow').modal('show');
            $("#tian").html(Tian_Title);
        }
        function Trim(str) {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }
        function insert() {
            $('#ParameterName').attr("disabled", false);

            var ParameterName = $("#ParameterNameinsert").val();
            var ParameterType = $("#ParameterTypeinsert").val();
            var descr = $("#descrinsert").val();

            if (Trim(ParameterName) == "" || Trim(ParameterName) == null) {
                layer.alert('请填写名称！!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                })
                return;
            }
            $.ajax({
                url: "Ajax/Parameter.ashx?type=Insert",
                data: { ParameterName: ParameterName, ParameterType: ParameterType, descr: descr },
                type: "GET",
                dataType: "text",
                success: function (result) {
                    if (result) {
                        $("#DataTables-Gauge").DataTable().draw();
                        $("#DataTables-Place").DataTable().draw();
                        $("#DataTables-Problem").DataTable().draw();
                        $('#insertshow').modal('hide');
                        $("#ParameterTypeinsert").val("");
                        $("#ParameterNameinsert").val("");
                        $("#descrinsert").val("");
                        layer.alert('添加成功!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        })
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

    </script>

    <script type="text/javascript">
        //$(function () {
        //    $('form').bootstrapValidator({
        //        message: '提示',
        //        feedbackIcons: {
        //            valid: 'glyphicon glyphicon-ok',
        //            invalid: 'glyphicon glyphicon-remove',
        //            validating: 'glyphicon glyphicon-refresh'
        //        },
        //        fields: {
        //            ParameterNameinsert: {
        //                message: '验证失败',
        //                validators: {
        //                    notEmpty: {
        //                        message: '请填写名称！'
        //                    }
        //                }
        //            }
        //        }
        //    });
        //});
    </script>

</asp:Content>
