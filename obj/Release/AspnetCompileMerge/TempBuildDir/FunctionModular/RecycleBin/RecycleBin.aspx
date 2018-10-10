<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="RecycleBin.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RecycleBin.RecycleBin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">回收站</a></li>

            </ol>
        </div>
    </div>


    <!-- /. ROW  -->

    <div class="row" style="padding-bottom:20px">
        <div class="col-md-3 col-xs-9">
            <select id="sel_ModularName" class="form-control">
            </select>
        </div>
        <div class="col-md-3 col-xs-3">
            <button id="go_search" class="btn btn-primary btn-sm" name="QX_SelectRecycleBin" ><i class="fa fa-search "></i>查询</button>

        </div>


    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th class="text-center" style="width:3%"><input id="allCheck" type="checkbox" name="checkbox" value="" /></th>
                            <th class="text-center" style="width:8%">序号</th>
                            <th class="text-center">标题</th>
                            <th class="text-center">创建用户</th>
                            <th class="text-center">模块名称</th>
                            <th class="text-center">删除时间</th>
                            <th class="text-center">操作</th>
                        </tr>  
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <button onclick="BulkDelete()" class="btn btn-reds" name="QX_DeletessRecycleBin">
                <i class="fa fa-trash "></i>批量删除</button>


            <button onclick="BulkRestore()" class="btn btn-greens" name="QX_UpdatesRecycleBin">
                <i class="fa fa-undo "></i>批量还原</button>


            <button type="button" class="btn btn-or" onclick='deletesrr()'name="QX_DelRecycleBin">清空</button>

            <!--End Advanced Tables -->
        </div>
    </div>

    <script src="../../JS/layer.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script>
        var navName = '/FunctionModular/RecycleBin/RecycleBin.aspx';

        initSelectInput("Remark=1", "sel_ModularName", "模块名称")
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/RecycleBin.ashx?operationType=LoadModularName",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    console.info(msg)
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item["Role_ID"] + "'>" + item["Role_Name"] + "</option>");
                 
                    });

                }
            });
        }
        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var modularID = 0;
        var tablelist;
        // var nums = 0;
        BindGrid();
        function BindGrid() {
            amountID = $("#sel_ModularName").find("option:selected").val();
            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tablelist = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                //aoColumnDefs: [
                //    { //隐藏列
                //        bVisible: false,
                //        aTargets: [0]
                //    },
                //],
                ajax: {
                    method: 'get',
                    url: "Ajax/RecycleBin.ashx?operationType=Bind",
                    dataSrc: "data",
                    data: function (d) {

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        Endindex = 0;
                        Startindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&modularID=' + modularID;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    $('td:eq(0)', row).html("<input class='checkRecycleBin' data-id='"+data[7]+"' data-tableName='"+data[8]+"' data-fieldName='"+data[9]+"' data-fieldValue='"+data[10]+"' data-fieldNameDelete='"+data[11]+"' type='checkbox'>");
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    operation = " <button  class=\"btn btn-link\" name='QX_UpdateRecycleBin' data-restore='restore'>还原</button>"
                   + " <button  class=\"btn btn-link\" data-remove='remove' name='QX_DeleteRecycleBin'>删除</button>";
                    $('td:eq(6)', row).html(operation);
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
                    //alert(1);
                },
                drawCallback: function (s) {
                    $("#allCheck").removeAttr("checked")
                    //$("#DataTables-Gauge_info").css("margin-bottom", "5px");
                    //var htmls = "";
                    //htmls += " ";
                    //$("#DataTables-Gauge_info").html(htmls);
                    //GetFunction();
                }
            });
        }
        $(document).on("click", "#go_search", function () {

            modularID = $("#sel_ModularName").find("option:selected").val();
            if (tableGrid != undefined) {
                //$("#allCheck")[0].checked = false;
                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        $(document).on("click", ".checkRecycleBin", function () {

            var isAllCheck = true;
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }

            $("#allCheck")[0].checked = isAllCheck;
        })
        $(document).on("click", "#allCheck", function () {
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                checkArray[i].checked = $("#allCheck")[0].checked;
            }
        })
        $(document).on("click", "[data-remove=remove]", function () {
            var rBID = $(this).parent().parent().find("input[type=checkbox]").attr("data-id");
            DeleteRecycleBin(rBID);
        })
        function DeleteRecycleBin(val) {
            layer.confirm("确实要永久删除所选数据吗？", {
                btn: ["是", "否"]
            }, function () {
                $.ajax({
                    url: "Ajax/RecycleBin.ashx?operationType=DeleteRecycleBin",
                    type: "GET",
                    data: { rBID: val },
                    dataType: "Text",
                    success: function (data) {
                        if (data == "True") {
                            layer.msg('删除成功', { time: 2000, icon: 1}, function () {
                                layer.closeAll('dialog');
                                $("[name='checkbox']").removeAttr("checked");//取消选中
                                $("#tableGrid").dataTable().fnDraw(false);
                            });
                        }
                        else {
                            layer.msg('删除失败', { time: 2000, icon: 2 }, function () {
                                layer.closeAll('dialog');
                                $("#tableGrid").dataTable().fnDraw(false);
                            });
                        }
                    }
                })
            })

        }
        function BulkDelete() {


            var tempRecycleBinArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var rBID = '';
           
            var isDelete = false;
            for (var i = 0; i < tempRecycleBinArray.length; i++) {

                if ($(tempRecycleBinArray[i])[0].checked) {

                    isDelete = true;

                    rBID += $(tempRecycleBinArray[i]).attr("data-id") + ",";
                }
            }
            if (!isDelete) {
                layer.alert("请选择要删除的回收站数据", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            }
            DeleteRecycleBin(rBID);
        }

        function BulkRestore() {


            var rBJson = [];
            var tempRecycleBinArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var isDelete = false;
            for (var i = 0; i < tempRecycleBinArray.length; i++) {

                if ($(tempRecycleBinArray[i])[0].checked) {
                    var objJson = {
                        'RBID': $(tempRecycleBinArray[i]).attr("data-id"),
                        'TableName': $(tempRecycleBinArray[i]).attr("data-tableName"),
                        'FieldName': $(tempRecycleBinArray[i]).attr("data-fieldName"),
                        'FieldValue': $(tempRecycleBinArray[i]).attr("data-fieldValue"),
                        'FieldNameDelete': $(tempRecycleBinArray[i]).attr("data-fieldNameDelete")
                    };
                    rBJson.push(objJson);

                    isDelete = true;
                }
            }
            if (!isDelete) {
                layer.alert("请选择要还原的回收站数据", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            }
            Restore(rBJson);

        }
        $(document).on("click", "[data-restore=restore]", function () {
            var rBID = $(this).parent().parent().find("input[type=checkbox]").attr("data-id");
            var tableName = $(this).parent().parent().find("input[type=checkbox]").attr("data-tableName");
            var fieldName = $(this).parent().parent().find("input[type=checkbox]").attr("data-fieldName");
            var fieldValue = $(this).parent().parent().find("input[type=checkbox]").attr("data-fieldValue");
            var fieldNameDelete = $(this).parent().parent().find("input[type=checkbox]").attr("data-fieldNameDelete");
            var objJson = { 'RBID': rBID, 'TableName': tableName, 'FieldName': fieldName, 'FieldValue': fieldValue, 'FieldNameDelete': fieldNameDelete }

            Restore(objJson);

        })

        function Restore(val) {
            layer.confirm("您确认要还原此项数据吗?", {
                btn: ["确定", "取消"]
            }, function () {
                $.ajax({
                    url: "Ajax/RecycleBin.ashx?operationType=RestoreData",
                    type: "GET",
                    data: { DataJson: JSON.stringify(val) },
                    dataType: "Text",
                    success: function (data) {
                        if (data == "True") {
                            layer.msg('还原成功', { time: 2000, icon: 6 }, function () {
                                layer.closeAll('dialog');
                                $("[name='checkbox']").removeAttr("checked");//取消选中
                                $("#tableGrid").dataTable().fnDraw(false);
                            });
                        }
                        else {
                            layer.msg('还原失败', { time: 2000, icon: 6 }, function () {
                                layer.closeAll('dialog');
                                $("#tableGrid").dataTable().fnDraw(false);
                            });
                        }
                    }
                })
            })
        }
        function deletesrr() {
            var rows = $("#tableGrid").find("tr");
            if(rows.length==2)
            {
                if($(rows[1]).find("td:eq(0)").text()=="没有匹配的记录")
                {
                    layer.alert("当前回收站没有数据，此操作无效", {
                        skin: "layui-layer-lan",
                        closeBtn: 0
                    });
                    return;
                }
                
            }
            $.ajax({
                url: "Ajax/RecycleBin.ashx?operationType=counts",
                type: "GET",
                dataType: "Text",
                success: function (data) {
                    if (data > 0) {
                        layer.closeAll('dialog');

                        layer.confirm("确认要永久删除" + data + "个数据吗？", {
                            btn: ["是", "否"]
                        }, function () {
                            $.ajax({
                                url: "Ajax/RecycleBin.ashx?operationType=recydelete",
                                type: "GET",
                                dataType: "Text",
                                success: function (data) {
                                    if (data == "True") {
                                        layer.msg('删除成功', { time: 2000, icon: 1 }, function () {
                                            layer.closeAll('dialog');
                                            $("[name='checkbox']").removeAttr("checked");//取消选中
                                            $("#tableGrid").dataTable().fnDraw(false);
                                        });
                                    }
                                    else {
                                        layer.msg('删除失败', { time: 2000, icon: 2 }, function () {
                                            layer.closeAll('dialog');
                                            $("#tableGrid").dataTable().fnDraw(false);
                                        });
                                    }
                                }
                            })
                        })
                    }
                    else {
                        layer.msg('删除失败', { time: 2000, icon: 6 }, function () {
                            layer.closeAll('dialog');
                            $("#tableGrid").dataTable().fnDraw(false);
                        });
                    }
                }
            })


        }

        function counts() {

        }
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });

    </script>
</asp:Content>
