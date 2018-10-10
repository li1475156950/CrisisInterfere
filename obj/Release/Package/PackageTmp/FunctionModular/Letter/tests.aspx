<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="tests.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Letter.tests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-select.min.js"></script>
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <%--<link href="../../CSS/ace.min.css" rel="stylesheet" />--%>
    <%--    <link href="../../CSS/chosen.css" rel="stylesheet" />
    <script src="../../JS/chosen.jquery.min.js"></script>--%>

    <style type="text/css">
        .text-overflow-fag {
            width: 500px;
            white-space: nowrap;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            overflow: hidden;
        }
    </style>

    <div class="row">
        <div class="col-md-12">

            <h1 class="page-header">站内信<small>站内信</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">站内信</a></li>
            </ol>
        </div>
    </div>
    <!-- /. ROW  -->
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-4">
                            站内信
                        </div>
                        <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right;">
                            <button class="btn btn-search btn-sm" style="height: 22px; padding-top: 0px;" onclick="NewInfoClick()">
                                <i class="fa fa-search "></i>新建信息</button>
                        </div>

                    </div>
                </div>
                <div class="panel-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">收件箱</a>
                        </li>
                        <li class=""><a href="#profile" data-toggle="tab" onclick="SenderTable()">发件箱</a>
                        </li>
                        <li class=""><a href="#messages" data-toggle="tab" onclick="DraftTable()">草稿箱</a>
                        </li>

                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="home">

                            <div class="row" style="margin-top: 15px;">
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                        <div class="lb-panel-left pull-left blue">
                                            收件箱：
                                        </div>

                                        <div class="lb-panel-right pull-right">
                                            <input type="text" class="form-control" id="Title" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel-primary text-center  ">
                                        <div class="pull-left ">
                                            <button class="btn btn-search" id="go_search"><i class="fa fa-search "></i>查询</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel-primary text-center  ">
                                        <div class="pull-left ">
                                            <h3>收件箱</h3>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-Inbox">
                                            <thead>
                                                <tr>
                                                    <th>选框</th>
                                                    <th>序号</th>
                                                    <th>内容</th>
                                                    <th>来源</th>
                                                    <th>时间</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">

                                            <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                                                <input type="checkbox" value="全选" />全选
                                 <button class="btn btn-danger btn-sm" style="margin-left: 20px;" onclick="updatedeletes()"><i class="fa fa-pencil"></i>批量删除</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile">
                            <div class="row" style="margin-top: 15px;">
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                        <div class="lb-panel-left pull-left blue">
                                            发件箱：
                                        </div>

                                        <div class="lb-panel-right pull-right">
                                            <input type="text" class="form-control" id="SenderTitle" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel-primary text-center  ">
                                        <div class="pull-left ">
                                            <button class="btn btn-search" id="go_searchSender"><i class="fa fa-search "></i>查询</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel-primary text-center  ">
                                        <div class="pull-left ">
                                            <h3>发件箱</h3>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-Sender">
                                            <thead>
                                                <tr>
                                                    <th>选框</th>
                                                    <th>序号</th>
                                                    <th>内容</th>
                                                    <th>发送到</th>
                                                    <th>时间</th>

                                                    <th>操作</th>
                                                </tr>
                                            </thead>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">

                                            <div class="dataTables_info" id="dataTables-example_infos" role="alert" aria-live="polite" aria-relevant="all">
                                                <input type="checkbox" value="全选" />全选
                                 <button class="btn btn-danger btn-sm" style="margin-left: 20px;" onclick="updatedeletes01()"><i class="fa fa-pencil"></i>批量删除</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="messages">

                            <div class="row" style="margin-top: 15px;">
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                        <div class="lb-panel-left pull-left blue">
                                            草稿箱：
                                        </div>

                                        <div class="lb-panel-right pull-right">
                                            <input type="text" class="form-control" id="DraftTitle" />

                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel-primary text-center  ">
                                        <div class="pull-left ">
                                            <button class="btn btn-search" id="go_searchDraft"><i class="fa fa-search "></i>查询</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-12 col-xs-12">
                                    <div class="panel-primary text-center  ">
                                        <div class="pull-left ">
                                            <h3>草稿箱</h3>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <!-- /. ROW  -->
                            <div class="row">
                                <div class="panel-body">
                                    <div class="table-responsive">
                                        <table class="table table-striped table-bordered table-hover" id="dataTables-Draft">
                                            <thead>
                                                <tr>
                                                    <th>选框</th>
                                                    <th>序号</th>
                                                    <th class="aa">内容</th>
                                                    <th>发送到</th>
                                                    <th>时间</th>
                                                    <th>操作</th>
                                                </tr>
                                            </thead>

                                        </table>

                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">

                                            <div class="dataTables_info" id="dataTables-example_infos02" role="alert" aria-live="polite" aria-relevant="all">
                                                <input type="checkbox" value="全选" />全选
                                 <button class="btn btn-danger btn-sm" style="margin-left: 20px;" onclick="updatedeletesC()"><i class="fa fa-pencil"></i>批量删除</button>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                    </div>
                </div>
            </div>
        </div>

    </div>
    <%--新建信息--%>
    <div class="modal fade" id="NewInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <%-- <h4 class="modal-title" id="myModalLabel06">
                       新建信息
                    </h4>--%>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11">

                                <%--<input class="form-control input-sm"  type="text" id="SenderPepole"/>--%>
                                <%--  <select multiple="multiple" class="width-280 chosen-select form-control" id="SenderPepole"
                                    data-placeholder="请选择成员...">
                                </select>--%>
                                <select id="SenderPepole" class="selectpicker" multiple="multiple" data-done-button="true" data-placeholder="请选择成员...">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11">
                                <input class="form-control input-sm" type="text" id="NewTitle" placeholder="标题" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11" id="summernote">
                                <%--<input class="form-control input-sm"  type="text"  id="NewContent"/>--%>
                                <textarea id="NewContent" class="form-control" placeholder="内容"></textarea>
                            </div>
                        </div>

                        <div class="modal-footer" style="border-top: 0px;">
                            <button type="button" class="btn btn-primary" id="Sender" onclick="SenderInfo()">
                                发送
                            </button>

                            <%--  <button type="button" class="btn btn-primary" onclick="SaveDrafts()" id="Drafts">
                                存草稿
                            </button>--%>

                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                取消
                            </button>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
                <input type="hidden" id="selectHidden" value="" />
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <%-- 查看--%>
    <div class="modal fade" id="chankan01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <%--  <h4 class="modal-title" id="myModalLabel01">内容详情
                    </h4>--%>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">

                        <div class="form-group">
                            <label class="col-sm-2 control-label">内容</label>
                            <div class="col-sm-10" id="summernote01">
                                <%--<input class="form-control input-sm"  type="text"  id="NewContent"/>--%>
                                <textarea id="NewContent01" class="form-control" readonly="readonly" style="height: 200px;"></textarea>
                            </div>
                        </div>
                        <div class="modal-footer" style="text-align: center; border-top: 0px;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                确定
                            </button>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <%-- 回复--%>
    <div class="modal fade" id="NewInfo01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <%--   <h4 class="modal-title" id="myModalLabel06">
                      回复
                    </h4>--%>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11">
                                <%--<input class="form-control input-sm"  type="text" id="SenderPepole"/>--%>
                                <%--    <select multiple="multiple" class="width-280 chosen-select form-control" id="SenderPepole01">
                                </select>--%>
                                <select id="SenderPepole01" class="selectpicker" multiple="multiple" data-done-button="true" data-placeholder="请选择成员...">
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-10">
                                <input class="form-control input-sm" type="text" id="NewTitle01" placeholder="标题" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11" id="summernote01">
                                <%--<input class="form-control input-sm"  type="text"  id="NewContent"/>--%>
                                <textarea id="NewContent001" class="form-control" placeholder="内容" style="height: 200px;"></textarea>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center; border-top: 0px;">
                            <button type="button" class="btn btn-primary" id="Sender01" onclick="SenderInfo01()">
                                发送
                            </button>

                            <%--  <button type="button" class="btn btn-primary" onclick="SaveDrafts01()" id="Drafts01">
                                存草稿
                            </button>--%>

                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                取消
                            </button>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
                <input type="hidden" id="selectHidden01" value="" />
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <%--编辑--%>
    <div class="modal fade" id="NewInfo02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <%--  <h4 class="modal-title" id="myModalLabel06">
                       编辑
                    </h4>--%>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11" style="height: 40px;">
                                <%--<input class="form-control input-sm"  type="text" id="SenderPepole"/>--%>
                                <select multiple="multiple" class="width-280 chosen-select form-control" id="SenderPepole02"
                                    data-placeholder="发送用户">
                                </select>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11">
                                <input class="form-control input-sm" type="text" id="NewTitle02" placeholder="标题" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11" id="summernote02">
                                <%-- <input class="form-control input-sm"  type="text"  id="NewContent"/>--%>
                                <textarea id="NewContent02" class="form-control" placeholder="内容" style="height: 200px;"></textarea>
                            </div>
                        </div>

                        <div class="modal-footer" style="border-top: 0px;">
                            <button type="button" class="btn btn-primary" id="Sender02" onclick="SenderInfo02()">
                                发送
                            </button>

                            <%--    <button type="button" class="btn btn-primary" onclick="SaveDrafts02()" id="Drafts02">
                                存草稿
                            </button>--%>

                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                取消
                            </button>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
                <input type="hidden" id="selectHidden02" value="" />
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <%-- //存储是否新建或者回复--%>
    <input type="hidden" id="ISRetype" />
    <input type="hidden" id="ISRetype02" />
    <input type="hidden" id="RemoveSelect" />
    <%-- 回复--%>
    <script src="JS/Content.js"></script>
    <script src="JS/Letter.js"></script>
    <script>


        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        $("#LBGL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');
        var UserIDs;

        //initSelectInput("Remark=1", "Sel_RoleType", "全部分类");//初始化量表类别


        /*列表展现部分 */

        /*
               创建时间：2016-09-07
               创建人：刘亚娟
               功能介绍：加载量表列表集合
        */
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引


        var Title = "";
        var dtDetail;
        InitTable();

        function InitTable() {


            Title = $("#Title").val();
            if (dtDetail != undefined) {
                $("#dataTables-Inbox").DataTable().draw();
                return;
            }
            dtDetail = $('#dataTables-Inbox').dataTable({
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
                    url: "Ajax/Letter.ashx",
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
                        return 'type=1&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&Title=' + Title;
                    }
                },

                createdRow: function (row, data, dataIndex) {


                    $('td:eq(0)', row).html(" <input name=checkbox type=\"checkbox\" value=\"" + data[0] + "\" />");

                    var operation = "";
                    if (data[3] == "系统") {
                        operation = " <button class=\"btn btn-info btn-sm\" onclick=\"Jump(" + data[0] + ")\" value=\"" + data[6] + "\" id=\"JumpID\"><i class=\"fa fa-search \"></i> 跳转至</button>"
                    } else {
                        operation = " <button class=\"btn btn-info btn-sm\" onclick=\"look(" + data[0] + ")\"><i class=\"fa fa-search \"></i> 查看</button>"
                       + " <button class=\"btn btn-primary  btn-sm\"onclick=\"Reply(" + data[7] + ") \" value=\"" + data[3] + "\" id=\"Reply\"><i class=\"fa fa-edit \"></i> 回复</button>"
                       + " <button class=\"btn btn-danger  btn-sm\" onclick='updatedelete(" + data[0] + ")'><i class=\"glyphicon glyphicon-trash\"></i> 删除</button>";
                    }
                    $('td:eq(5)', row).html(operation);
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

            Title = $("#Title").val();
            if (dtDetail != undefined) {
                $("#dataTables-Inbox").DataTable().draw();
                return;
            }
        });


        /*-----列表展现部分END-----*/


        NewReSelectInput("type=11", "SenderPepole", "");//初始化新建
        NewReSelectInput("type=11", "SenderPepole01", "");//初始回复
        NewReSelectInput("type=11", "SenderPepole02", "");//初始编辑
        /*-----接受者初始化下拉列表公共方法-----*/
        function NewReSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/Letter.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                    });
                    $("#" + controlname).attr("multiple", true);
                    $("#" + controlname).selectpicker('refresh');
                }
            });
        }

        //新建
        $('#SenderPepole').on('change', function () {
            document.getElementById('selectHidden').value = $(this).val();
        });
        //回复
        $('#SenderPepole01').on('change', function () {
            document.getElementById('selectHidden01').value = $(this).val();
        });
        //编辑
        $('#SenderPepole02').on('change', function () {
            document.getElementById('selectHidden02').value = $(this).val();
        });
        function NewInfoClick() {

            $("#SenderPepole").val("");
            $("#ISRetype").val("0");
            $('#NewInfo').modal();
        }

        //新建信息提交//发送的用户不存在
        function SenderInfo() {
         

            var title = ""
            var receveid = "";
            if ($("#ISRetype").val() == "1") {
                receveid = UserIDs;
                title = "Re:" + $("#NewTitle").val();
            } else {
                receveid = $("#selectHidden").val();
                title = $("#NewTitle").val();
            }
            if (receveid == null || receveid == "") {
                layer.msg('输入要发送的用户！');
                return false;
            }

            var content = $("#NewContent").val();
            $.ajax({
                url: "Ajax/Letter.ashx?type=2",
                data: { receveid: receveid, title: title, content: content },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('发送成功！', { icon: 1 });
                        $("#SenderPepole").val("");

                        $("#NewTitle").val("");
                        $("#NewContent").val("");
                        $('#NewInfo').modal('hide');
                        $("#dataTables-Inbox").DataTable().draw();
                        $("#dataTables-Sender").DataTable().draw();
                    }
                    else {
                        layer.msg('发送失败！', { icon: 1 });

                    }
                }

            })
        }
        //新建存草稿
        function SaveDrafts() {

            var receveid;
            if ($("#ISRetype").val() == "1") {
                receveid = UserIDs;
                //title = "Re:" + $("#NewTitle").val();
            } else {
                receveid = $("#selectHidden").val();

            }
            if (receveid == null || receveid == "") {
                layer.msg('输入要发送的用户！');
                return false;
            }

            var title = $("#NewTitle").val();
            var content = $("#NewContent").val();
            $.ajax({

                url: "Ajax/Letter.ashx?type=5",
                data: { receveid: receveid, content: content },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('保存成功！', { icon: 1 });
                        $("#NewTitle").val("");
                        $("#NewContent").val("");

                        $('#NewInfo').modal('hide');
                        $("#dataTables-Draft").DataTable().draw();

                    }
                    else {
                        layer.msg('保存失败！', { icon: 1 });

                    }
                }

            })
        }
        //单个删除
        function updatedelete(U_ID) {
            layer.confirm('您确定要删除吗？', {
                btn: ['删除', '取消'] //按钮
            }, function () {

                $.ajax({
                    url: "Ajax/Letter.ashx?type=3",
                    data: { U_ID: U_ID },
                    type: 'get',
                    success: function (result) {
                        if (result == "True") {
                            layer.msg('删除成功！', { icon: 1 });
                            $("#dataTables-Inbox").DataTable().draw();

                        }
                        else {
                            layer.msg('删除失败！', { icon: 1 });

                        }
                    }

                })

            });
        }
        //批量删除
        function updatedeletes() {
            var checkbox = document.getElementsByName("checkbox");
            var chenum = "";
            var U_IDs = "";//注意
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked) {
                    U_IDs += checkbox[i].value + ",";

                }
            }
            layer.confirm('您确定要删除吗？', {
                btn: ['删除', '取消'] //按钮
            }, function () {

                $.ajax({
                    url: "Ajax/Letter.ashx?type=4",
                    data: { U_IDs: U_IDs },
                    type: 'get',
                    success: function (result) {
                        if (result == "True") {
                            layer.msg('删除成功！', { icon: 1 });
                            $("#dataTables-Inbox").DataTable().draw();
                        }
                        else {
                            layer.msg('删除失败！', { icon: 1 });

                        }
                    }

                })

            });
        }
        //回复RE
        function Reply(uid) {
            UserIDs = uid;
            $("#SenderPepole01").empty();
            NewReSelectInput2("type=11", "SenderPepole01", "", UserIDs);//初始回复
           

        }

        /*-----接受者初始化下拉列表公共方法-----*/
        function NewReSelectInput2(types, controlname, Exhibition, UserIDs) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/Letter.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                    });
                    $("#" + controlname).attr("multiple", true);
                    $("#" + controlname).selectpicker('refresh');
                    $("#ISRetype").val(UserIDs);
                    $('#SenderPepole01').attr("disabled", "disabled");
                    document.getElementById('selectHidden01').value = UserIDs;
                    $("#SenderPepole01 option[value='" + UserIDs + "']").attr("selected", true);
                    $('#SenderPepole01').selectpicker('refresh');
                    $('#NewInfo01').modal();
                }
            });
        }

        //回复发送详细信息
        function SenderInfo01() {
            var title = ""
            var receveid = "";
            receveid = UserIDs;
            title = "Re:" + $("#NewTitle01").val();
            var content = $("#NewContent001").val();
            if (content == null || content == "") {
                layer.msg('输入要发送的内容！');
                return false;
            }



            $.ajax({
                url: "Ajax/Letter.ashx?type=2",
                data: { receveid: receveid, title: title, content: content },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('发送成功！', { icon: 1 });
                        //$("#SenderPepole01").val("");
                        $("#NewTitle01").val("");
                        $("#NewContent001").val("");
                        $('#NewInfo01').modal('hide');
                        //$("#dataTables-Inbox").DataTable().draw();
                        $("#dataTables-Sender").DataTable().draw();
                    }
                    else {
                        layer.msg('发送失败！', { icon: 1 });

                    }
                }

            })
        }
        //回复存草稿
        function SaveDrafts01() {
            var receveid;
            receveid = UserIDs;
            //title = "Re:" + $("#NewTitle01").val();
            var content = $("#NewContent001").val();
            if (content == null || content == "") {
                layer.msg('输入要发送的内容！');
                return false;
            }

            $.ajax({

                url: "Ajax/Letter.ashx?type=5",
                data: { receveid: receveid, content: content },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('已存至草稿箱！', { icon: 1 });
                        $("#NewTitle01").val("");
                        $("#NewContent001").val("");

                        $('#NewInfo01').modal('hide');

                        $("#dataTables-Inbox").DataTable().draw();
                        $("#dataTables-Draft").DataTable().draw();

                    }
                    else {
                        layer.msg('保存失败！', { icon: 1 });

                    }
                }

            })
        }
        //根据id获取查看内容
        function look(U_ID) {
            $.ajax({
                url: "Ajax/Letter.ashx?type=6",
                data: { uid: U_ID },
                type: 'get',
                success: function (result) {
                    if (result != null && result != "") {
                        var parsedJson = jQuery.parseJSON(result);
                        //$("#NewTitle").val(parsedJson._ul_title);
                        $("#NewContent01").val(parsedJson._ul_note);
                        $('#chankan01').modal();
                    }
                    else {
                        layer.msg('删除失败！', { icon: 1 });
                    }
                }

            })
        }
        //编辑
        var Euid;
        function seupdate(uid, RID) {
            Euid = uid


            $("#SenderPepole02 option[value='" + $("#ISRetype02").val() + "']").attr("selected", false);
            $("#SenderPepole01").val("");
            //$("#SenderPepole02").trigger("chosen:updated");
            //$("#SenderPepole02").chosen({
            //    no_results_text: "未找到此选项!",
            //    width: "70%",
            //    allow_single_deselect: true
            //});
            $("#ISRetype02").val(RID);;
            $("#SenderPepole02 option[value='" + RID + "']").attr("selected", "selected");
            var selectetext = $("#SenderPepole02 option[value='" + RID + "']").text();

            $(".chosen-choices").prepend("<li class=\"search-choice\"><span>" + selectetext + "</span><a class=\"search-choice-close\" data-option-array-index=\"8\"></a></li>");
            $(".search-field input").hide();
            $.ajax({
                url: "Ajax/Letter.ashx?type=6",
                data: { uid: uid },
                type: 'get',
                success: function (result) {
                    if (result != null && result != "") {
                        var parsedJson = jQuery.parseJSON(result);
                        $("#NewTitle02").val(parsedJson._ul_title);
                        $("#NewContent02").val(parsedJson._ul_note);
                        $('#NewInfo02').modal();
                    }
                    else {
                        layer.msg('删除失败！', { icon: 1 });
                    }
                }

            })
        }
        //编辑发送详细信息
        function SenderInfo02() {
            var title = ""
            var receveid = "";
            receveid = $("#SeupdateID").val();

            if (receveid == null || receveid == "") {
                layer.msg('输入要发送的用户！');
                return false;
            }
            title = $("#NewTitle02").val();
            var content = $("#NewContent02").val();
            $.ajax({
                url: "Ajax/Letter.ashx?type=12",
                data: { receveid: receveid, title: title, content: content, uid: Euid },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('发送成功！', { icon: 1 });
                        $("#SenderPepole02").val("");
                        $("#NewTitle02").val("");
                        $("#NewContent02").val("");
                        $('#NewInfo02').modal('hide');
                        $("#dataTables-Sender").DataTable().draw();
                        $('#dataTables-Draft').DataTable().draw();
                    }
                    else {
                        layer.msg('发送失败！', { icon: 1 });

                    }
                }

            })
        }
        // //编辑存草稿
        function SaveDrafts02() {
            var title = ""
            var receveid = "";
            receveid = $("#SeupdateID").val();

            if (receveid == null || receveid == "") {
                layer.msg('输入要发送的用户！');
                return false;
            }
            //title = $("#NewTitle02").val();
            var content = $("#NewContent02").val();
            $.ajax({

                url: "Ajax/Letter.ashx?type=13",
                data: { receveid: receveid, content: content, uid: Euid },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('保存成功！', { icon: 1 });
                        $("#SenderPepole02").val("");
                        $("#NewTitle02").val("");
                        $("#NewContent02").val("");
                        $('#NewInfo02').modal('hide');
                        $("#dataTables-Draft02").DataTable().draw();

                    }
                    else {
                        layer.msg('保存失败！', { icon: 1 });

                    }
                }

            })
        }
        //跳转到那个页面
        //var JumpID;
        function Jump(U_ID) {

            $.ajax({
                url: "Ajax/Letter.ashx?type=3",
                data: { U_ID: U_ID },
                type: 'get',
                success: function (result) {
                    var JumpID = $("#JumpID").val();
                    if (JumpID == "1") {
                        //我的测验
                    } else if (JumpID == "2") {
                        //查看报告
                    } else if (JumpID == "3") {
                        //我的问卷
                    } else if (JumpID == "4") {
                    } else if (JumpID == "5") {
                        //我的预约
                    }

                }

            })

        }
        ////限制字数
        ////限制字符个数 4  
        $(".aa").each(function () {
            var maxwidth = 2;
            if ($(this).text().length > maxwidth) {
                $(this).text($(this).text().substring(0, maxwidth));
                $(this).html($(this).html() + '...');
            }

        })


    </script>

</asp:Content>
