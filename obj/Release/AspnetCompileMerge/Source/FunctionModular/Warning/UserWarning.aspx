<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="UserWarning.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Warning.UserWarning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script src="../../assets/js/jquery-2.0.3.min.js"></script>
    <style type="text/css">
        .ctions {
            float: left;
        }

        .ctions {
            float: left;
        }
    </style>

    <script>
        function addRow() {

            //创建DIV标签
            var newdiv = document.getElementById("newdiv");
            var input = document.createElement("div");
            input.innerHTML = '<div class="row"><div class="col-md-2 col-sm-12 col-xs-12"><div class="panel panel-primary text-center no-boder bg-color-blue"><div class="lb-panel-left pull-left blue">--逻辑-- </div> <div class="lb-panel-right pull-right"><select class="form-control"><option>不限</option><option>男</option> <option>女</option></select> </div></div></div> <div class="col-md-2 col-sm-12 col-xs-12"><div class="panel panel-primary text-center no-boder bg-color-blue"><div class="lb-panel-left pull-left blue">--量表名称--</div><div class="lb-panel-right pull-right"><select class="form-control"><option>不限</option> <option>男</option><option>女</option></select></div></div></div><div class="col-md-2 col-sm-12 col-xs-12"> <div class="panel panel-primary text-center no-boder bg-color-blue"><div class="lb-panel-left pull-left blue">--维度--</div> <div class="lb-panel-right pull-right"> <select class="form-control"><option>不限</option> <option>一部门</option> <option>二部门</option></select></div> </div></div><button class="btn btn-primary"  onclick="detele(this)"><i></i>-</button> <button class="btn btn-primary" onclick="addRow()"><i></i>+</button></div>';
            newdiv.appendChild(input);
        }
        function detele(obj) {
            var newobj = obj.parentNode;
            newobj.innerHTML = "";
        }
    </script>

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a></a>当前位置：</li>
                <li><a href="#">危机预警</a></li>

            </ol>
        </div>
    </div>

    <!-- /. ROW  -->
    <div class="row">
        <div class="col-sm-3">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    日期：
                </div>
                <div class="lb-panel-right pull-right">
                    <input type="date" class="form-control" />
                </div>


            </div>
        </div>
        <div class="lb-panel-left pull-left blue" style="width: 4%; text-align: center;">
            至
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12">

            <div style="width: 80%">
                <input type="date" class="form-control" />
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="padding-left: 0px;">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue" style="width: 30%;">
                    登录名/姓名：
                </div>

                <div class="lb-panel-right pull-right">
                    <input class="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    性别：
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>不限</option>
                        <option>男</option>
                        <option>女</option>
                    </select>

                </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    部门：
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>不限</option>
                        <option>一部门</option>
                        <option>二部门</option>
                    </select>

                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    --逻辑--
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>不限</option>
                        <option>男</option>
                        <option>女</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    量表名称
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>不限</option>
                        <option>男</option>
                        <option>女</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    --维度--
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>不限</option>
                        <option>一部门</option>
                        <option>二部门</option>
                    </select>

                </div>
            </div>
        </div>

        <%--        <button class="btn btn-primary" onclick="detele(this)"><i></i>-</button>--%>
        <button class="btn btn-primary" onclick="addRow()"><i></i>+</button>

        <button class="btn btn-primary"><i class="fa fa-edit "></i>查询</button>
    </div>
    <div id="newdiv">
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    预警管理
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-Warning">
                            <thead>
                                <tr>
                                    <th>选框</th>
                                    <th>序号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <th>部门</th>
                                    <th>量表名称</th>
                                    <th>预警名称</th>
                                    <th>提交时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">

                            <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">1到10条 共57条</div>

                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination" style="margin: 0px 0;">
                                    <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">首页</a></li>
                                    <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">6</a></li>
                                    <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">下一页</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">预约咨询
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-10">
                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                <div class="lb-panel-left pull-left blue">
                                    日期：
                                </div>
                                <div class="lb-panel-right pull-right">
                                    <input type="date" class="form-control" />
                                </div>


                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                <div class="lb-panel-left pull-left blue">
                                    时间：
                                </div>
                                <div class="lb-panel-right pull-right">
                                    <input type="date" class="form-control"/>
                                </div>


                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12 col-xs-12" style="padding-left: 0px;">
                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="width: 30%;">
                                    ------
                                </div>

                                <div class="lb-panel-right pull-right">
                                    <input type="date" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-sm-12 col-xs-12">
                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                <div class="lb-panel-left pull-left blue">
                                    咨询师姓名:
                                </div>

                                <div class="lb-panel-right pull-right">
                                    <select class="form-control">
                                        <option>不限</option>
                                        <option>男</option>
                                        <option>女</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                            关闭
                        </button>
                        <button type="button" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div>
            </div>
        </div>
        </div>

        <script>
            Warninginfo();
            var Warning;
            function Warninginfo() {
                var D_name;
                var D_Remark;
                var D_number;
                /*列表展现部分
                  创建时间：2016-10-17
                  创建人：李兆典
                  功能介绍：加载量表列表集合
               */
                if (Places != undefined) {
                    $("#dataTables-Warning").DataTable().draw();
                    return;
                }

                var Starindex = 0;//开始条数索引
                var Endindex = 10;//结束条数索引
                Warning = $('#dataTables-Warning').dataTable({
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
                            return 'type=select  &Starindex=' + Starindex + '&Endindex=' + Endindex;
                        }
                    },
                    createdRow: function (row, data, dataIndex) {
                        var operation = "";

                        operation = " <button class=\"btn btn btn-info btn-sm\"onclick=\"Updata(" + data[0] + ")\"><i class=\"glyphicon glyphicon-ok \"></i>查看</button>"
                     + " <button class=\"btn btn-danger  btn-sm\" onclick=\"Parameter_delete(" + data[0] + ")\"><i class=\"glyphicon glyphicon-trash\"></i>预约查询</button>"+
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
        </script>

</asp:Content>
