<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LetterList.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Letter.LetterList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">        
    <link href="../../CSS/custom-styles.css" rel="stylesheet" />
    <link href="../../CSS/custom-styles_1.css" rel="stylesheet" />
    <link href="../../CSS/font-awesome.min.css" rel="stylesheet" />
    <link href="../../CSS/base.css" rel="stylesheet" />
    
    <link href="../../CSS/rysz.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <style type="text/css">
        .text-overflow-fag {
            width: 500px;
            white-space: nowrap;
            text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            overflow: hidden;
        }
    </style>
    <ul id="myTabs" class="nav nav-tabs" role="tablist">
        <li class="active"><a class="x_lbfp" href="#home" data-toggle="tab">收件箱</a></li>
        <li><a class="x_zhfp" href="#profile" data-toggle="tab">发件箱</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane fade active in" id="home">
            <div class="row" style="margin-top: 15px;">
                <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px;">

                    <input type="text" placeholder="收件箱" class="form-control" id="Title" />
                </div>

                <div class="col-md-3 col-sm-12 col-xs-12" style="text-align: right; margin-top: 5px;">


                    <button class="btn btn-primary btn-sm pull-left" id="go_search" name="QX_SelectUser" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px; font-size: 14px"><i class="fa fa-search "></i>查询</button>

                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">

                    <button class="btn btn-primary btn-sm pull-right" onclick="NewInfoClick()" data-toggle="modal" data-target=".x_xjzh" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 13px; font-size: 14px;">+ 新建消息</button>

                </div>

            </div>
            <div class="row">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-Inbox">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" onclick="SelectAll(this);" value="全选" id="selectAll" />
                                    </th>
                                    <th>序号</th>
                                    <th>内容</th>
                                    <th>来源</th>
                                    <th>时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!--<div class="row">
                                    <button class="btn btn-danger btn-sm" style="margin-left: 20px; background-color: #4CB1CF;" onclick="updatedeletes()"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
                                </div>-->
                    <div class="dataTables_info" id="tableGrid_info" role="status" aria-live="polite" style="margin-bottom: 5px;">
                        <button class="btn btn-or w_radius" name="QX_DeletesUser" data-id="57" onclick="updatedeletes(false)" data-toggle="modal" data-target=".x_dels"><i class="icon iconfont">&#xeb8d;</i> 批量删除</button>
                    </div>
                </div>
            </div>


        </div>
        <!-- /. ROW  -->

        <div class="tab-pane fade" id="profile">
            <div class="row" style="margin-top: 15px;">
                <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px;">
                    <input type="text" placeholder="发件箱" class="form-control" id="SenderTitle" />
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12" style="text-align: right; margin-top: 5px;">
                    <button class="btn btn-primary btn-sm pull-left" id="go_searchSender" name="QX_SelectUser" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px; font-size: 14px"><i class="fa fa-search "></i>查询</button>
                    <!--<button class="btn btn-sm" id="go_searchSender" style=" color: white"><i class="fa fa-search "></i>查询</button>-->
                </div>
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <button class="btn btn-primary btn-sm pull-right" onclick="NewInfoClick()" data-toggle="modal" data-target=".x_xjzh" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 13px; font-size: 14px;">+ 新建消息</button>
                </div>
            </div>
            <div class="row">
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-Sender">
                            <thead>
                                <tr>
                                    <th>
                                        <input type="checkbox" value="全选" id="selectAllSender" />
                                    </th>
                                    <th>序号</th>
                                    <th>内容</th>
                                    <th>发送到</th>
                                    <th>时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <!--<div class="row">
                                    <button class="btn btn-danger btn-sm" style="margin-left: 20px; background-color: #4CB1CF;" onclick="updatedeletes01()"><i class="fa fa-pencil"></i>批量删除</button>
                                </div>-->
                    <div class="dataTables_info" id="tableGrid_info" role="status" aria-live="polite" style="margin-bottom: 5px;">
                        <button class="btn btn-or w_radius" name="QX_DeletesUser" data-id="57" onclick="updatedeletes(true)" data-toggle="modal" data-target=".x_dels"><i class="icon iconfont">&#xeb8d;</i> 批量删除</button>
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
                            <button class="btn btn-primary btn-sm pull-left" id="go_search" name="QX_SelectUser" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px; font-size: 14px"><i class="fa fa-search "></i>查询</button>
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
                                    <th>
                                        <input type="checkbox" value="全选" />
                                    </th>
                                    <th>序号</th>
                                    <th class="zxx_text_overflow">内容</th>
                                    <th>发送到</th>
                                    <th>时间</th>
                                    <th>操作</th>
                                </tr>
                            </thead>

                        </table>

                    </div>
                    <div class="row">
                        <div class="dataTables_info" id="tableGrid_info" role="status" aria-live="polite" style="margin-bottom: 5px;">
                            <button class="btn btn-or w_radius" name="QX_DeletesUser" data-id="57" onclick="updatedeletesC()"><i class="icon iconfont">&#xeb8d;</i> 批量删除</button>

                        </div>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- /. ROW  -->
    <!--新建信息-->
    <div class="modal fade x_xjzh" id="NewInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 25%;">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title text-center" style="color: #4CB1CF; font-size: 25px; font-weight: 700" id="myModalLabel06">新增信息
                    </h4>
                </div>
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-1 control-label"></label>
                        <div class="col-sm-11">
                            <select id="SenderPepole" multiple="multiple" class="selectpicker" data-done-button="true" data-live-search="true"></select>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-1 control-label"></label>
                        <div class="col-sm-10" id="summernote">

                            <textarea id="NewContent" class="form-control" placeholder="内容" style="height: 200px;" maxlength="200"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row" style="margin-top: 20px">
                            <div class="col-sm-6 col-xs-5 text-right">
                                <button type="button" class="btn btn-sm" id="Sender" style="border: 1px solid orange; color: orange" onclick="SenderInfo()">
                                    发送
                                </button>
                            </div>
                            <div class="col-sm-2 col-xs-5 text-right">
                                <button type="button" class="btn btn-sm" style="border: 1px solid orange; color: orange" data-dismiss="modal">
                                    取消
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <input type="hidden" id="selectHidden" value="" />
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <!--查看-->
    <div class="modal fade" id="chankan01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 25%;">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                </div>
                <label class="col-sm-12 control-label" style="text-align: center; font-size: 25px; color: #4CB1CF">内容详情</label>

                <div class="row">
                    <div class="col-md-10 col-sm-10 col-xs-10 col-md-offset-1 col-sm-offset-1 col-xs-offset-1 " id="" style="margin-top: 10px;">
                        <textarea id="NewContent01" class="form-control" readonly="readonly" style="height: 200px;"></textarea>
                    </div>
                </div>
                <div class="modal-footer" style="text-align: center; border-top: 0px;">
                    <button type="button" class="btn btn-sm" data-dismiss="modal" style="color: white">
                        确定
                    </button>
                </div>
            </div>


        </div>
    </div>
    <!--回复-->
    <div class="modal fade" id="NewInfo01" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 25%;">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <label class="col-sm-12 control-label" id="" style="text-align: center; font-size: 25px; color: #4CB1CF">
                        回复
                    </label>
                </div>

                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-1 control-label"></label>
                        <div class="col-sm-11">
                            <select id="SenderPepole01" class="selectpicker" multiple="multiple" data-done-button="true" placeholder="请选择成员..."></select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-1 control-label"></label>
                        <div class="col-sm-11" id="summernote01">
                            <textarea id="NewContent001" class="form-control" placeholder="内容" style="height: 200px; width: 90%;" maxlength="200"></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6 col-xs-5 text-right">
                                <button type="button" class="btn btn-sm" style="border: 1px solid orange; color: orange" id="Sender01" onclick="SenderInfo01()">
                                    发送
                                </button>
                            </div>
                            <div class="col-sm-2 col-xs-5 text-right">
                                <button type="button" class="btn btn-sm" style="border: 1px solid orange; color: orange" data-dismiss="modal">
                                    取消
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
                <input type="hidden" id="selectHidden01" value="" />
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <!--编辑-->
    <div class="modal fade" id="NewInfo02" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 25%;">
                <div class="modal-header" style="border-bottom: 0px;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>

                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11" style="height: 40px;">

                                <select multiple="multiple" class="width-280 chosen-select form-control" id="SenderPepole02"
                                    data-placeholder="发送用户">
                                </select>

                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-sm-1 control-label"></label>
                            <div class="col-sm-11" id="summernote02">

                                <textarea id="NewContent02" class="form-control" placeholder="内容" style="height: 200px;"></textarea>
                            </div>
                        </div>

                        <div class="modal-footer" style="border-top: 0px;">
                            <button type="button" class="btn btn-primary" id="Sender02" onclick="SenderInfo02()">
                                发送
                            </button>



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
    <script src="../../JS/jquery.metismenu.js"></script>
    <script src="../../JS/custom-scripts.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="JS/Content.js"></script>
    <script src="JS/Letter.js"></script>
    <script>
        var navName = '';
        $("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        $("#LBGL").addClass('active-menu');
        $("#XLCY").addClass('active-menu');
        var UserIDs;
        //NewReSelectInput("type=11", "SenderPepole", "");//初始化新建
        //NewReSelectInput("type=11", "SenderPepole01", "");//初始回复
        //NewReSelectInput("type=11", "SenderPepole02", "全部分类");//初始编辑

        $('#NewInfo').on('shown.bs.modal', function () {
            $("[aria-label='Search']").attr("placeholder", "请输入用户登录名")
            $("[data-id='SenderPepole']").find(".filter-option").text("请选择");
        })
        /*列表展现部分 */

        /*
               创建时间：2016-09-07
               创建人：刘亚娟
               功能介绍：加载收件箱列表集合
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
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
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
                    if (data[8] == "1") {
                        $('td:eq(2)', row).css('color', '#969696');
                    } else {
                        $('td:eq(2)', row).css('font-weight', 'bold');
                    }
                    var Cotent = $('td:eq(2)', row).text();

                    var maxwidth = 20;
                    if (Cotent.length > maxwidth) {
                        $('td:eq(2)', row).text(Cotent.substring(0, maxwidth));
                        $('td:eq(2)', row).html($('td:eq(2)', row).html() + '…');
                    }
                    var operation = "";
                    if (data[3] == "系统") {
                        // operation = " <button class=\"btn btn-link\" onclick=\"Jump(" + data[0] + ")\" value=\"" + data[6] + "\" id=\"JumpID\">跳转至</button>"
                        operation = " <button class=\"btn btn-link\"  onclick=\"look(" + data[0] + ")\">查看</button>"
                        operation += " &nbsp;&nbsp&nbsp;&nbsp ";
                        operation += " <button class=\"btn btn-link\"  onclick='updatedelete(" + data[0] + ")'>删除</button>";
                    } else {
                        operation = " <button class=\"btn btn-link\"  onclick=\"look(" + data[0] + ")\">查看</button>"
                       + " <button class=\"btn btn-link\" onclick=\"Reply(" + data[7] + ") \" value=\"" + data[3] + "\" id=\"Reply\">回复</button>"
                       + " <button class=\"btn btn-link\" onclick='updatedelete(" + data[0] + ")'>删除</button>";
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



        //全选
        function SelectAll(obj) {

            if (obj.checked) {
                $("input[type=checkbox][name=checkbox]").prop("checked", true);
            } else { $("input[type=checkbox][name=checkbox]").prop("checked", false); }
        }
        //表格内复选框的点击事件。判断是否选中/取消全选按钮
        $(document).on("click", "[name=checkbox]", function () {

            var isAllCheck = true;
            var checkArray = $("#dataTables-Inbox").find("input[type=checkbox]").not("#selectAll");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }

            $("#selectAll")[0].checked = isAllCheck;
        });

        $(document).on("click", "#go_search", function () {

            Title = $("#Title").val();
            if (dtDetail != undefined) {
                $("#dataTables-Inbox").DataTable().draw();
                return;
            }
        });


        /*-----列表展现部分END-----*/


        /*-----接受者初始化下拉列表公共方法-----*/
        function NewReSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            $.ajax({
                type: "POST",
                url: "Ajax/Letter.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    //$("#" + controlname).append("<option value='0'>--请选择成员--</option>");
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                    });
                    //$("#" + controlname).attr("multiple", true);

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

            //$('#SenderPepole').attr("disabled", false);
            $("#SenderPepole").val("");
            $("#selectHidden").val('');
            $('#NewContent').val('');
            //初始化
            NewReSelectInput("type=11", "SenderPepole", "");//初始化新建
            $("#ISRetype").val("0");
        }
        function checkChange(obj) {
            var nowIndex = $('#needEstimateLoginName').find("option:selected").val();
            if (nowIndex == '0') {
                $('span[name=tip]').show();
            } else
                $('span[name=tip]').hide();
        }

        //新建信息提交//发送的用户不存在
        function SenderInfo() {

            var title = ""
            var receveid = "";
            receveid = $("#selectHidden").val();

            if (receveid == null || receveid == "") {
                layer.msg('输入要发送的用户！');
                return false;
            }
            var content = $("#NewContent").val().trim();
            if (content == "") {
                layer.msg("请输入信息", { time: 2000 });
                return;
            }
            $.ajax({
                url: "Ajax/Letter.ashx?type=2",
                data: { receveid: receveid, title: title, content: content },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('发送成功！', { icon: 1 });
                        $("#SenderPepole").empty();
                        //$("#SenderPepole").selectpicker('refresh');
                        $("#NewTitle").val("");
                        $("#NewContent").val("");
                        $('#NewInfo').modal('hide');
                        $("#selectHidden").val("")
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

            //var title = $("#NewTitle").val();
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
        function updatedeletes(send) {
            var checkbox;
            if (send == true)//发件箱
                checkbox = $('#dataTables-Sender').find("[name=checkbox]");
            else//收件箱
                checkbox = $('#dataTables-Inbox').find("[name=checkbox]");
            var chenum = "";
            var U_IDs = "";//注意
            for (var i = 0; i < checkbox.length; i++) {
                if (checkbox[i].checked) {
                    U_IDs += checkbox[i].value + ",";

                }
            }
            if (U_IDs == "" || U_IDs == null) {
                layer.msg('请选择要删除的条目！', { icon: 1 });
                return false;
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
                            $("#selectAll").prop("checked", false);
                            $("#dataTables-Inbox").DataTable().draw();
                            $('#dataTables-Sender').DataTable().draw();

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
            $('#NewContent001').val('');
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
            //title = "Re:" + $("#NewTitle01").val();
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
                        $("#dataTables-Inbox").DataTable().draw();
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
            $("#SenderPepole02").trigger("chosen:updated");
            $("#SenderPepole02").chosen({
                no_results_text: "未找到此选项!",
                width: "70%",
                allow_single_deselect: true
            });
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
                        //$("#NewTitle02").val(parsedJson._ul_title);
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
            //title = $("#NewTitle02").val();
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
        //编辑存草稿
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
                        alert("我的测验");
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
        $("#selectAll").click(function () {//全选
            if (this.checked) {
                $("#dataTables-Inbox :checkbox").prop("checked", true);
            }
            else {
                $("#dataTables-Inbox :checkbox").prop("checked", false);
            }
        });
        $("#selectAllSender").click(function () {//全选
            if (this.checked) {
                $("#dataTables-Sender :checkbox").prop("checked", true);
            }
            else {
                $("#dataTables-Sender :checkbox").prop("checked", false);
            }
        });


    </script>
</asp:Content>
