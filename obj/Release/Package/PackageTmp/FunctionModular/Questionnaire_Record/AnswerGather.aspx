<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AnswerGather.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.AnswerGather" %>

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
                <li><a href="#">问卷调查</a></li>
                <li><a href="SurveyResult.aspx">调查结果</a></li>
                <li><a href="#">答卷收集</a></li>
            </ol>
        </div>
    </div>

    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input id="Name" type="text" class="selectpicker form-control" data-done-button="true" placeholder="--姓名/登录名--" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input id="Department_ID" placeholder="--选择部门--" name="ADepartment" style="top: 0; height: 20px;" />
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtstart' style="height: 34px; line-height: 34px;" placeholder="--提交时间--" />
            </div>
            <div class="col-md-1 col-sm-2 col-xs-2">
                <label style="height: 34px; line-height: 34px;">-</label>
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5 " style="padding-right: 0px; padding-left: 0px;">
                <input type='text' readonly="readonly" onclick="javascript: $(this).val('');" class='form-control input-sm' id='dtend' style="height: 34px; line-height: 34px;" placeholder="--提交时间--" />
            </div>
        </div>
        <div class="col-md-5 col-sm-12 col-xs-12" style="text-align: right; margin-top: 10px;">
            <button id="go_search" class="btn btn-primary btn-sm" style="float: left" name="QX_SelectViewResult"><i class="fa fa-search "></i>查询</button>
            <button id="go_back" class="btn  btn-sm btn-primary" style="float: right">返回</button>
        </div>
    </div>
    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th></th>
                            <th style="width: 10px">
                                <input id="allCheck" onclick="AllCheck()" type="checkbox" /></th>
                            <th class="text-center" style="width: 8%;">序号</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">登录名</th>
                            <th class="text-center">部门</th>
                            <th class="text-center">作答时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody id="lbSource">
                    </tbody>
                </table>
            </div>
            <iframe id="iframeBatchExport" name="iframeBatchExport" style="display: none;"></iframe>
            <button onclick="BatchExport()" style="margin-left: 5px; margin-right: 5px;" class="btn  btn-oranges"><i class="glyphicon glyphicon-share"></i>批量导出</button>
            <button onclick="BulkDelete()" class="btn btn-reds">
                <i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>
    </div>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script>

        var navName = '/FunctionModular/Questionnaire_Record/SurveyResult.aspx';

        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });

        $('#dtend').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });

        var Q_Code = getUrlParam("Q_Code");//问卷编码
        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var loginName = '';
        var distriStartTime = '';
        var distriEndTime = '';
        var UName = "";
        var departmentID = "";
        var ansID = 0;
        var tablelist;

        var zips;

        BindGrid();


        function BindGrid() {
            UName = $("#Name").val();
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#dtend").val();
            if ($("#Department_ID").val() != undefined && $("#Department_ID").val() != "") {
                departmentID = $("#Department_ID").val();
            }
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
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    }
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Questionnaire_Manage.ashx?operationType=AnswerGather",
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

                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&Q_Code=' + Q_Code + '&UName=' + UName + '&D_ID=' + departmentID + '&StartTime=' + distriStartTime + '&EndTime=' + distriEndTime;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    $('td:eq(0)', row).html(data[0]);
                    $('td:eq(1)', row).html(data[10]);
                    if (data[4] == "True") {
                        $('td:eq(2)', row).html("匿名");
                        $('td:eq(3)', row).html("匿名");
                    } else {
                        $('td:eq(2)', row).html(data[8]);
                        $('td:eq(3)', row).html(data[7]);
                    }
                    $('td:eq(4)', row).html(data[9]);
                    $('td:eq(5)', row).html(data[6]);
                    var obj = "LookAnwserRecord.aspx?QD_Code=" + data[2] + "&Q_Code=" + data[3] + "&Allcount=0&Numbers=1" + "&id=" + data[1] + "&type=AnwserGather";//标明是从答卷收集界面跳转过去的

                    operation = " <button class=\"btn btn-link\" data-name=remind name='QX_look' onclick=\"LookRecord('" + obj + "')\">查看</button>"
                        + " <button class=\"btn btn-link\" data-name=remove name='QX_remove' id='" + data[1] + "'>删除</button>";
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(2)', row).css("text-align", "center");
                    $('td:eq(3)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(5)', row).css("text-align", "center");
                    $('td:eq(6)', row).css("text-align", "center");
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
                },
                drawCallback: function (s) {
                    $("#allCheck").removeAttr("checked");
                }
            });

        }

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
        //回车进行搜索
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                $('#go_search').click();
            }
        });
        //搜索
        $(document).on("click", "#go_search", function () {
            UName = $("#Name").val();
            distriStartTime = $("#dtstart").val();
            distriEndTime = $("#dtend").val();

            if ($("#Department_ID").val() != undefined && $("#Department_ID").val() != "") {
                departmentID = $("#Department_ID").val();
            } else
                departmentID = "";

            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        //返回
        $(document).on("click", "#go_back", function () {
            window.location.href = navName;
        });
        //批量删除
        function BulkDelete() {
            //获得表格内所有复选框
            var tempDistriArray = $("#lbSource").find("input[type=checkbox]").not("#allCheck");
            var anwId = '';
            var names = '';
            var isReturn = true;
            //获取所有被选中的信息ID
            for (var i = 0; i < tempDistriArray.length; i++) {
                if (tempDistriArray[i].checked) {
                    if (anwId == '') {
                        anwId = tempDistriArray[i].getAttribute("id");
                        names = tempDistriArray[i].parentNode.parentNode.childNodes[3].innerHTML;
                    } else {
                        anwId += "," + tempDistriArray[i].getAttribute("id");
                        names += "," + tempDistriArray[i].parentNode.parentNode.childNodes[3].innerHTML;
                    }
                    isReturn = false;
                }
            }
            if (isReturn) {
                layer.alert("请选择要删除的作答记录！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            layer.confirm("确定将所选数据放入回收站吗？", {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/MyQuestionnaire.ashx?type=Delete",
                    data: {
                        id: anwId,
                        name: names,
                        source: "调查结果"
                    },
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功！', { time: 2000, icon: 1 });
                            if (tablelist != undefined) {
                                $("#tableGrid").DataTable().draw();
                                return;
                            }
                        } else {
                            layer.msg('删除失败！', { time: 2000, icon: 5 });
                        }
                    }
                });
            });
        }
        //单个删除
        $(document).on("click", "[name=QX_remove]", function () {
            var anwId = $(this)[0].getAttribute("id");
            var name = $(this)[0].parentNode.parentNode.childNodes[3].innerHTML;
            layer.confirm("确定将该作答记录放入回收站吗？", {
                btn: ["确定", "取消"]
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/MyQuestionnaire.ashx?type=Delete",
                    data: {
                        id: anwId,
                        name: name,
                        source: "调查结果"
                    },
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功！', { time: 2000, icon: 1 });
                            if (tablelist != undefined) {
                                $("#tableGrid").DataTable().draw();
                                return;
                            }
                        } else {
                            layer.msg('删除失败！', { time: 2000, icon: 5 });
                        }
                    }
                });
            });

        });

        function getZip() {
            return zips;
        }
        // 批量导出
        function BatchExport() {
            zips = new ZipArchive;


            var checkboxs = $("#lbSource").find("input[type=checkbox]").not("#allCheck");
            var checkboxCheckeds = 0;// 复选框勾选状态的数量
            var checkboxCheckedIndex = 0;// 复选框遍历累加器
            var qdCodes = new Array();//分配编码
            var qCodes = new Array();//问卷编码
            var ids = new Array();//作答ID
            // 遍历复选框
            $(checkboxs).each(function (i, item) {
                if (item.checked) {
                    qdCodes[qdCodes.length] = item.getAttribute('data-qdCode');
                    qCodes[qCodes.length] = item.getAttribute('data-qCode');
                    ids[ids.length] = item.getAttribute('id');
                    checkboxCheckeds++;
                    return;
                }
            });
            // 验证是否选择要导出的报告
            if (checkboxCheckeds == 0) {
                layer.alert("选择要导出的报告！", {
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
                // 加载iframe
                $("#iframeBatchExport").attr("src", "LookAnwserRecord.aspx?QD_Code=" + qdCodes[index] + "&Q_Code=" + qCodes[index]
                    + "&id=" + ids[index] + "&type=AnwserGather" + "&Allcount=" + checkboxCheckeds + "&Numbers=" + (checkboxCheckedIndex + 1));

                // 累加选择框
                checkboxCheckedIndex++;
                localStorage.setItem("zips", zips);
            }
            // 加载iframe--批量导出
            $("#iframeBatchExport").off("load").on("load", function () {
                // 延迟加载
                setTimeout(function () {

                    // 调用内容页 导出事件
                    $("#btnExport", window.frames["iframeBatchExport"].document).click();

                    // 延迟加载 iframe 地址
                    setTimeout(function () {

                        loadIframe();// 设置 iframe 地址
                    }, 500);

                }, 500);
            });
            // 设置 iframe 地址
            loadIframe();
        }
        //查看
        function LookRecord(url) {
            window.location.href = url;
        }
        OnLoadTreeComDID();
        function OnLoadTreeComDID() {
            $("#Department_ID").ligerComboBox({
                width: "100%",
                selectBoxWidth: "85%",
                selectBoxHeight: 150,
                valueField: 'id',
                textField: 'text',
                treeLeafOnly: false,
                tree: {
                    onSuccess: function () {
                        setTimeout(function () {
                            var manager = $(".l-tree").ligerGetTreeManager();
                        }, 1000);
                    },
                    onBeforeSelect: function (node) {

                        $("#DepID").val(node.data['id']);
                    },
                    url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }, onSelected: function (value, text) {
                }
            });
        }
        //获取地址栏的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
    </script>
</asp:Content>
