<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AdvisoryStatistics.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AdvisoryStatistics.AdvisoryStatistics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-select.min.js"></script>
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">预约咨询</a></li>
                <li><a href="#">咨询统计</a></li>
            </ol>
        </div>
    </div>

    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;padding-left: 0px; padding-right: 0px;">
            <input id="Name" type="text" class="selectpicker form-control" data-done-button="true" placeholder="--报表标题/编号--" />
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px;padding-left: 0px; padding-right: 0px;">
            <div class="col-md-4 col-md-offset-1 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtstart' style="height: 34px; line-height: 34px;" placeholder="--请选择日期--" />
            </div>
            <div class="col-md-1 col-sm-2 col-xs-2 text-center">
                <label style="height: 34px; line-height: 34px;">-</label>
            </div>
            <div class="col-md-4 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtend' style="height: 34px; line-height: 34px;" placeholder="--请选择日期--" />
            </div>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12" style="margin-top: 10px;padding-left: 0px;">
            <button id="go_search" class="btn btn-primary btn-sm" name="QX_SelectViewResult" style="float:left"><i class="fa fa-search "></i>查询</button>
            <button class="btn btn-sm pull-right" style="background-color: orange; float: right; color: white" id="AddNewReport" onclick="AddNewReport()">+新建报表</button>
        </div>
    </div>
    <div id="MaskLayer" onclick="HiddenMask()" class="modal" style="display: none; background-color: rgba(0, 0, 0, 0.5);">
        <div class="modal-dialog">
            <div class="modal-content" type="dialog" times="1" showtime="0" contype="string" id="MaskContent" style="width: auto;">
                <div class="modal-header" style="border: solid 0px">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="HiddenMask()">×</button>
                    <h4 class="modal-title text-center" style="color: #4CB1CF; font-size: 24px; font-weight: bold;" id="myModalLabel">新建报表</h4>
                </div>
                <div class="modal-body row" style="margin-left: 0px; margin-right: 0px;">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <label style="float: left; margin-right: 30px;"><span style="color: red;">*</span>报表标题：</label>
                            <input style="float: left;" id="ReportName" maxlength="30" onblur="CheckIsNull()" onkeyup="CheckIsNull()" type="text" class="col-xs-12 col-sm-8 col-md-8">
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-12" style="margin-top: 20px;">
                            <label style="float: left; margin-left: 8px; margin-right: 30px;">咨询方式：</label>
                            <select id="AdvisoryType" style="float: left;" class="col-xs-12 col-sm-8 col-md-8">
                                <option value="0" selected="selected">个体咨询</option>
                                <option value="1">团体咨询</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="modal-footer text-center" style="border: solid 0px">
                    <button id="saveMask" class="btn btn-sm" style="background-color: orange; color: white" onclick="SaveReport()">确定</button>
                    <button id="cancelMask" class="btn btn-sm btn-blues" style="color: white; margin-left: 10px;" onclick="HiddenMask()">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px;">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid" style="width: 100%;margin-left: 0px;margin-right: 0px;">
                    <thead>
                        <tr>
                            <th style="width: 10px">
                                <input id="allCheck" onclick="AllCheck()" type="checkbox" /></th>
                            <th class="text-center" style="width: 8%;">序号</th>
                            <th class="text-center">报表编号</th>
                            <th class="text-center">报表标题</th>
                            <th class="text-center">咨询方式</th>
                            <th class="text-center">生成时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody id="lbSource">
                    </tbody>
                </table>
            </div>
            <iframe id="iframeBatchExport" name="iframeBatchExport" style="display: none;"></iframe>
            <button onclick="BatchExport()" style="margin-left: 5px; margin-right: 5px;" class="btn  btn-oranges">
                <i class="glyphicon glyphicon-share"></i>批量导出
            </button>
            <button onclick="BulkDelete()" class="btn btn-reds">
                <i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>
    </div>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>

    <script>

        var navName = '/FunctionModular/AdvisoryStatistics/AdvisoryStatistics.aspx';
        var nameOrNumber;//报表名称或编号
        var distriStartTime;
        var distriEndTime;
        var tablelist;
        var zips;

        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtstart').val('<%=GetDate(-7)%>');

        $('#dtend').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtend').val('<%=GetDate(0)%>');

        CheckIsNull();
        BindGrid();

        //回车进行搜索
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                $('#go_search').click();
            }
        });

        //绑定
        function BindGrid() {
            nameOrNumber = $("#Name").val();
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#dtend").val();
            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tablelist = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）

                ajax: {
                    method: 'get',
                    url: "Ajax/AdvisoryStatistics.ashx?operationType=Bind",
                    dataSrc: "data",
                    data: function (d) {
                        if (d.start == 0) {
                            //if (Endindex == 10) {
                            Endindex = d.length;
                            if (Endindex == 10) {
                                Startindex = 0;
                            }
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }

                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&name=' + nameOrNumber + '&distriStartTime=' + distriStartTime + '&distriEndTime=' + distriEndTime;
                    }
                },

                createdRow: function (row, data) {
                    var operation = "";
                    $('td:eq(0)', row).html(data[0]);
                    $('td:eq(1)', row).html(data[1]);
                    $('td:eq(2)', row).html(data[2]);
                    $('td:eq(3)', row).html(data[3]);
                    $('td:eq(4)', row).html(data[4]);
                    $('td:eq(5)', row).html(data[5]);

                    operation = " <button class=\"btn btn-link\" data-name=look name='QX_look' onclick='LookAdvisory(\"" + data[6] + "\",\"" + data[4] + "\"" + ")'>查看</button>"
                   + " <button class=\"btn btn-link\" data-name=remove name='QX_remove' data-id='" + data[6] + "' onclick='DeleteAdvisory(this)'>删除</button>";
                    $('td:eq(6)', row).html(operation);

                    for (var i = 0; i < 7; i++) {
                        $('td:eq(' + i + ')', row).css("text-align", "center");
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
                drawCallback: function (s) {
                    $("#allCheck").removeAttr("checked");
                }
            });

        }

        //全选
        function AllCheck() {
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                checkArray[i].checked = $("#allCheck")[0].checked;
            }
        }
        $(document).on("click", ".checkDistri", function () {
            var isAllCheck = true;
            var checkArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }

            $("#allCheck")[0].checked = isAllCheck;
        });
        //新建报表
        function AddNewReport() {
            $("#MaskLayer").show();
        }

        //批量删除
        function BulkDelete() {
            //获得表格内所有复选框
            var tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var id = '';
            var name = '';
            //判断是否有勾选的信息，否则弹框提示
            var isDelete = false;
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked) {
                    isDelete = true;
                    id += tempDistriArray[i].getAttribute("data-id") + ",";
                    name += tempDistriArray[i].parentNode.parentNode.childNodes[3].innerHTML + ",";
                }
            }
            if (isDelete == false) {
                layer.alert("请选择要删除的数据！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            layer.confirm('确实要将所选数据放入回收站吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/AdvisoryStatistics.ashx?operationType=Delete",
                    data: { id: id, name: name },
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功', { time: 2000, icon: 1 });
                            if (tablelist != undefined) {
                                $("#tableGrid").DataTable().draw(false);
                                return;
                            }
                        } else {
                            layer.msg('删除失败', { time: 2000, icon: 5 });
                        }
                    }
                });
            });
        }
        //批量导出
        function BatchExport() {
            zips = new ZipArchive;

            var checkboxs = $("#lbSource").find("input[type=checkbox]").not("#allCheck");
            var checkboxCheckeds = 0;// 复选框勾选状态的数量
            var checkboxCheckedIndex = 0;
            var types = new Array();//报表类型
            var ids = new Array();//作答ID

            // 遍历复选框
            $(checkboxs).each(function (i, item) {
                if (item.checked) {
                    types[types.length] = $(this)[0].parentNode.parentNode.childNodes[4].innerHTML;
                    ids[ids.length] = item.getAttribute('data-id');
                    checkboxCheckeds++;
                    return;
                }
            });
            // 验证是否选择要导出的报告
            if (checkboxCheckeds == 0) {
                layer.alert("选择要导出的数据！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            //加载层
            layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2
            // 递归加载Iframe 地址
            function loadIframe() {
                var index = checkboxCheckedIndex;
                // 验证是否超出选中报告数组上限
                if (index >= checkboxCheckeds) {

                    layer.closeAll();
                    return;
                }

                var src;
                if (types[index] == "个体咨询")
                    src = "PersonalStatementInfo.aspx?lookId=" + ids[index] + "&Allcount=" + checkboxCheckeds + "&Numbers=" + (checkboxCheckedIndex + 1);
                else
                    src = "TeamStatementInfo.aspx?lookId=" + ids[index] + "&Allcount=" + checkboxCheckeds + "&Numbers=" + (checkboxCheckedIndex + 1);

                $("#iframeBatchExport").attr("src", src);
                // 加载iframe
                checkboxCheckedIndex++;
                localStorage.setItem("zips", zips);
                // 累加选择框
            }
            // 加载iframe--批量导出
            $("#iframeBatchExport").off("load").on("load", function () {
                // 延迟加载
                setTimeout(function () {

                    // 调用内容页 导出事件
                    $("#saveMask", window.frames["iframeBatchExport"].document).click();
                    // 延迟加载 iframe 地址
                    setTimeout(function () {
                        loadIframe();// 设置 iframe 地址
                    }, 1100);

                }, 1100);
            });
            // 设置 iframe 地址
            loadIframe();
        }
        //查看
        function LookAdvisory(data, type) {
            if (type == "个体咨询")
                window.location.href = "PersonalStatementInfo.aspx?lookId=" + data;
            else
                window.location.href = "TeamStatementInfo.aspx?lookId=" + data;
        }
        //删除
        function DeleteAdvisory(data) {
            var id = $(data).attr("data-id");
            var name = data.parentNode.parentNode.childNodes[3].innerHTML;

            layer.confirm('确实要将该数据放入回收站吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/AdvisoryStatistics.ashx?operationType=Delete",
                    data: { id: id, name: name },
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功', { time: 2000, icon: 1 });
                            if (tablelist != undefined) {
                                $("#tableGrid").DataTable().draw(false);
                                return;
                            }
                        } else {
                            layer.msg('删除失败', { time: 2000, icon: 5 });
                        }
                    }
                });
            });
        }
        //搜索
        $(document).on("click", "#go_search", function () {
            nameOrNumber = $("#Name").val();
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#dtend").val();
            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        ///隐藏关闭遮罩层
        function HiddenMask() {
            $("#MaskLayer").hide();
            $("#ReportName").val("");
            $("#AdvisoryType")[0].options[0].selected = true;
            CheckIsNull();
        }
        ///隐藏关闭遮罩层---遮罩层的点击事件
        $("#MaskContent").click(function (event) {
            event.stopPropagation();
        });
        //如果没有输入报表名称则将保存按钮置灰
        function CheckIsNull() {
            if ($("#ReportName").val() == "") {
                $("#saveMask").css("background", "#333");
                $("#saveMask").attr("disabled", "disabled");
            } else {
                $("#saveMask").css("background", "orange");
                $("#saveMask").removeAttr("disabled");
            }
        }
        //保存新建的报表标题，传到对应（个体/团体咨询界面）
        function SaveReport() {
            var title = $("#ReportName").val();
            if (title.replace(/\ /g, "") == "") {
                layer.alert("请输入报表标题！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                // $("#ReportName").val('');
                return;
            }
            var type = $("#AdvisoryType")[0].selectedIndex;
            var hrefPath = 'AdvisoryStatistics_Peronal.aspx?TitleName=' + title;
            if (type != 0)//如果没有选择个体咨询
                hrefPath = 'AdvisoryStatistics_Team.aspx?TitleName=' + title;
            window.location.href = hrefPath;
        }
        function getZip() {
            return zips;
        }

    </script>
</asp:Content>
