<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PersonalReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.PersonalReport1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">心理测验</a></li>
                <li><a href="#">个体报告</a></li>

            </ol>
        </div>
    </div>


    <div class="row" style="margin-left: 9px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="selectpicker" data-done-button="true" data-live-search="true" id="Sel_AmountType" style="width: 100%">
            </select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input id="Department_IDs" class="form-control" name="Department" style="top: 0; height: 20px;text-align: left" placeholder="--选择部门--" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select id="testType" class="form-control">
                <option value="">--测试类型--</option>
                <option value="日常测验">日常测验</option>
                <option value="普测">普测</option>
            </select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select id="pushStatus" class="form-control">
                <option value="0">--报告授权--</option>
                <option value="1">未授权</option>
                <option value="2">已授权</option>
            </select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">

            <input id="loginName" type="text" class="form-control" placeholder="--登录名/姓名--" />

        </div>
        <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
            <button class="btn btn-primary btn-sm" id="go_search" name=" QX_SearchSelect"><i class="fa fa-search "></i>查询</button>
        </div>
         <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;display:none;">
            <button class="btn btn-primary btn-sm" id="Template" name=" QX_SearchSelect"><i class="fa fa-search "></i>新增模板</button>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
           
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">报告设置
                        </h4>
                    </div>
                    <div class="modal-body">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th></th>
                                    <th>项目</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>测验简介</td>

                                </tr>
                                <tr class="even gradeC">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>有效性分析</td>

                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>测试结果</td>

                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>结果分析</td>

                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>心理建议</td>

                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>原始答卷</td>

                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                        <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                            关闭
                        </button>
                        <button type="button" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>

    </div>

    <div class="row" style="margin-top: 20px; margin-left: 9px;">
        <div class="col-md-12">
            <!-- Advanced Tables -->
        
            <div class="panel-body" style="padding: 0px;">
                <div class="table-responsive">

                    <table class="table table-striped table-bordered table-hover" id="tableGrid">
                        <thead>
                            <tr>

                                <th class="text-center" style="width: 10px">
                                    <input id="allCheck" onclick="AllCheck()" type="checkbox" value="" /></th>
                                <th class="text-center">序号</th>
                                <th class="text-center">登录名</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">部门</th>
                                <th class="text-center">量表名称</th>
                                <th class="text-center">提交时间</th>
                                <th class="text-center">报告授权</th>
                                <th class="text-center">操作</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>

                </div>
                <div class="row">

                    <form id="form1" runat="server" style="float: left; margin: 0px 5px;">
                        <input type="hidden" id="userInfoList" name="userInfoList" />
                        <input type="hidden" id="amountNameList" name="amountNameList" />
                      
                        <asp:Button ID="Button1" class="btn  btn-blues " runat="server" Text="数据导出" OnClientClick="return GetExportUserInfo()" OnClick="btn_import_07_click" />
                    </form>
                    <iframe id="iframeBatchExport" name="iframeBatchExport" style="display: none;"></iframe>
                    <button onclick='BatchExport()' class="btn btn-blues" id="btnBatchExport">批量导出</button>

                  
                    <button onclick='RBdeletes()' class="btn btn-reds" name="QX_RBdeletes"><i class="glyphicon glyphicon-trash"></i>批量删除</button>

                    <button onclick="BulkRemind()" class="btn  btn-greens" name="QX_BulkRemind">
                        <i class="icon-bookmark"></i>报告授权</button>
                </div>

            </div>
            <!--End Advanced Tables -->
        </div>
    </div>


    <input type="hidden" id="DepIDs" />
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <link href="../../Font-Awesome/css/font-awesome.min.css" rel="stylesheet" />
    <script>
        var zips;
        function getZip() {
            return zips;
        }
        var navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        function Test() {
            var Anserid = "";
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        Anserid += checkbox[i].value + ",";

                    }
                }
            }
            if (Anserid == null || Anserid == "") {
                //layer.msg('选择要导出的报告！', { icon: 1 });
                //return false;
                layer.alert("选择要导出的报告！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return false;
            }
            else {
                $("#Ahidden").val(Anserid);
                return true;
            }

        }

        // 批量导出
        function BatchExport() {
            zips = new ZipArchive;

            var checkboxs = document.getElementsByName("checkbox");// 获取所有复选框
            var checkboxCheckeds = 0;// 复选框勾选状态的数量
            var checkboxCheckedIndex = 0;// 复选框遍历累加器

            var checkval = [];

            // 遍历复选框
            $(checkboxs).each(function (i, item) {
                if (item.checked) {
                    var cval = $(this).val();
                    checkval.push(cval);
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



                checkboxCheckedIndex++;
                // 获取数据ID
                var id = checkval[index];
                // 获取地址
                var url = $("#btnLook" + id).attr("data-url");
                localStorage.setItem("zips", zips);
                // 加载iframe
                $("#iframeBatchExport").attr("src", url + "&i="
                    + checkval[index] + "&Allcount=" + checkboxCheckeds + "&Numbers=" + checkboxCheckedIndex);
                // 累加选择框

            }

            // 加载iframe
            $("#iframeBatchExport").off("load").on("load", function () {
                // 延迟加载
                setTimeout(function () {
                    // 调用内容页 导出事件
                    $("#export", window.frames["iframeBatchExport"].document).click();

                    // 延迟加载 iframe 地址
                    setTimeout(function () {
                        loadIframe();// 设置 iframe 地址
                    }, 1000);

                }, 1000);

            });

            // 设置 iframe 地址
            loadIframe();
            ChangeCheckBoxState(false);
            $("#allCheck")[0].checked = false;
        }
        //改变复选框状态
        function ChangeCheckBoxState(value) {
            var items = document.getElementsByName("checkbox"); //得到 name=chec的控件
            for (var i = 0; i < items.length; i++) {//然后循环
                //当前checkbox 的状态 = 所有的控件状态
                items[i].checked = value;
            }
        }
        var Numbers = 0;
        function GetExportUserInfo() {
            var userInfoList = [];
            var amountNameList = [];
            var checkbox = document.getElementsByName("checkbox");
            var tempAmountName = "";// 临时属性量表名称
            var isContainAmountNameCount = 0;// 不导出量表计数器
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    tempAmountName = $(checkbox[i]).attr("data-name");
                    if (checkbox[i].checked && IsExportAmountName(tempAmountName)) {
                        var userInfo = {};
                        userInfo.AnswerID = checkbox[i].value;
                        userInfo.AmountName = tempAmountName;
                        userInfoList.push(userInfo);
                        amountNameList.push(tempAmountName);
                    }
                }
            }            
            if ((Numbers == 5 && userInfoList.length == 0) || (Numbers > 0 && userInfoList.length == 0)) {
                layer.alert("该量表暂不支持数据导出！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return false;
            }
            else if (userInfoList.length == 0) {
                //layer.msg('选择要导出的报告！', { icon: 1 });
                //return false;
                layer.alert("选择要导出的报告！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return false;
            }

            else {
                $("#userInfoList").val(JSON.stringify(userInfoList));
                $("#amountNameList").val(JSON.stringify(amountNameList));
                return true;
            }


        }
        // 是否为导出量表名称
        // amountName 量表名称
        function IsExportAmountName(amountName) {

            var result = true;
            if (amountName.indexOf("瑞文标准推理测验") > -1 ||
                amountName.indexOf("霍兰德职业兴趣倾向测验") > -1 ||
                amountName.indexOf("艾森克人格测验(EPQ)") > -1 ||
                amountName.indexOf("艾森克人格问卷-少年版（EPQ）") > -1 ||
                amountName.indexOf("明尼苏达多相个性调查表") > -1 ||
                amountName.indexOf("心理年龄自测表") > -1 ||
                amountName.indexOf("应付方式问卷") > -1 ||
                amountName.indexOf("防御方式问卷") > -1 ||
                amountName.indexOf("Achenbach儿童行为量表") > -1 ||
                amountName.indexOf("QIUS在校学生气质量表（QTS）") > -1 ||
                amountName.indexOf("气质量表") > -1 ||
                amountName.indexOf("强迫症状问卷") > -1)
                    {
                result = false;
                Numbers++;
            }

            return result;
        }
        var Endindex = 0;
        var Startindex = 0;
        var UserIDs = "";
        initSelectInput("operationType=LoadAmountName", "Sel_AmountType", "--量表名称--");//初始化量表名称
        OnLoadTreeComD();//加载部门
        var amountTypeID = 0;
        var departmentID = 0;
        var testTypeID = 0;
        var pushStatusID = 0;
        var loginName = '';
        var isLoadDataTable = true; // 是否为第一次初始化数据
        var tablelist;
        BindGrid();
        function BindGrid() {
            if (Startindex == 0) {
                Startindex = 0;//开始条数索引
            }
            if (Endindex == 0) {
                Endindex = 10;//结束条数索引
            }

            amountTypeID = $("#Sel_AmountType").find("option:selected").val();//量表名称的id
            departmentID = $("#DepIDs").val();
            testTypeID = $("#testType").find("option:selected").val();
            pushStatusID = $("#pushStatus").find("option:selected").val();
            //alert(amountTypeID)
            //alert(departmentID)
            //alert(testTypeID)
            //alert(pushStatusID)
            loginName = $("#loginName").val();
            if (tablelist != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
            tablelist = $('#tableGrid').dataTable({
                serverSide: true, //分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10, //首次加载的数据条数
                ordering: false, //排序操作在服务端进行，所以可以关了。
                processing: true, //载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false, //是否显示分页条数（就是那个显示页面条数的下拉按钮）
                aoColumnDefs: [
                    {
                        //隐藏列
                        bVisible: true,
                        aTargets: [0]
                    }
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/PersonalReport.ashx?operationType=Bind",
                    dataSrc: "data",
                    data: function (d) {

                        if (d.start == 0) {
                            Endindex = d.length;
                            if (Endindex == 10) {
                                Startindex = 0;
                            }
                        } else {
                            Startindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&amountTypeID=' + amountTypeID + '&departmentID=' + departmentID + '&testTypeID=' + testTypeID + '&pushStatusID=' + pushStatusID + '&loginName=' + loginName;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    $('td:eq(0)', row).html(" <input class=childCheck id='" + data[0] + "' data-name='" + data[5] + "' value=" + data[0] + " name=checkbox type=\"checkbox\" value=\"" + data[0] + "\" />");
                    var operation = "";
                    var operations = "";
                    var lookUrl = "";
                    //没有发送
                    //if (data[7] == 2) {
                    //    operation = " <button  class=\"btn btn-link\" style=\"color:#000000\"  data-id='" + data[9] + "' data-name='" + data[7] + "'>已授权</button>";
                    //} else 

                    if (data[7] == 2) {
                        operation = " <button disabled='disabled'  class=\"btn btn-link\" style=\"color:#000000\"  data-id='" + data[9] + "' data-name='" + data[7] + "'>已授权</button>";
                    } else {
                        operation = " <button  class=\"btn btn-link\" data-id='" + data[9] + "' data-name='" + data[7] + "' onclick=Remind(" + data[0] + "," + data[9] + ")>未授权</button>";

                    }
                    // 当前页码
                    var tablePageIndex = $("#tableGrid").DataTable().page() + 1;

                    // 当初始化的时候
                    var pageIndex = fnGetRequiredPageIndex();
                    if (isLoadDataTable && $("#tableGrid").DataTable().page() != pageIndex) {
                        tablePageIndex = pageIndex + 1;
                    }

                    // 获取查看跳转的地址
                    function getLookUrl(urlType, aId, contenType, amountType) {
                        var result = "";
                        switch (urlType) {
                            case 1: // MMPI报告 lookMMPI
                                result = "MMPI_Report.aspx?A_ID=" + aId + "&type=2" + "&AmountType=" + 1 + "&p=" + tablePageIndex;
                                break;
                            case 2: // LookR
                                result = "LookReport.aspx?A_ID=" + aId + "&type=2" + "&AmountType=" + amountType + "&p=" + tablePageIndex;
                                break;
                            case 3: // 特殊量表 LookRS
                                result = "SpecialReport.aspx?A_ID=" + aId + "&type=2" + "&types=" + contenType + "&AmountType=" + amountType + "&p=" + tablePageIndex;
                                break;
                            case 4: // 特殊量表M LookRSS
                                result = "SpecialReportM.aspx?A_ID=" + aId + "&type=2" + "&types=" + contenType + "&AmountType=" + amountType + "&p=" + tablePageIndex;
                                break;
                        }

                        return result;
                    }

                    // 设置查看地址
                    if (data[12] == "LB_14814373314360") {
                        lookUrl = getLookUrl(4, data[0], 1, data[13]);
                    } else if (data[12] == "LB_14809941842260" || data[12] == "LB_14811084564180" || data[12] == "LB_14810118744850") {
                        lookUrl = getLookUrl(3, data[0], 3, data[13]);
                    } else if (data[12] == "LB_14809227671290") {
                        lookUrl = getLookUrl(4, data[0], 4, data[13]);
                    } else if (data[12] == "LB_14809953564280" || data[12] == "LB_14809270976120" || data[12] == "LB_14810979035220") {
                        lookUrl = getLookUrl(3, data[0], 6, data[13]);
                    } else if (data[12] == "LB_14811056565390") {
                        lookUrl = getLookUrl(4, data[0], 7, data[13]);
                    } //应付方式问卷
                    else if (data[12] == "LB_14811852410670") {
                        lookUrl = getLookUrl(3, data[0], 8, data[13]);
                    } else if (data[12] == "LB_14812009694200") {
                        lookUrl = getLookUrl(3, data[0], 801, data[13]);
                    } else if (data[12] == "LB_14811639146570") {
                        lookUrl = getLookUrl(3, data[0], 802, data[13]);
                    } else if (data[12] == "LB_14812009852840") {
                        lookUrl = getLookUrl(3, data[0], 9, data[13]);
                    } else if (data[12] == "LB_14811658719780") {
                        lookUrl = getLookUrl(3, data[0], 901, data[13]);
                    } else if (data[12] == "LB_14811181207060") {
                        lookUrl = getLookUrl(3, data[0], 10, data[13]);
                    } else if (data[12] == "LB_14811661311050") {
                        lookUrl = getLookUrl(4, data[0], 11, data[13]);
                    } else if (data[12] == "LB_14812024172130") {
                        lookUrl = getLookUrl(4, data[0], 13, data[13]);
                    } else if (data[12] == "LB_14811899593960") {
                        lookUrl = getLookUrl(3, data[0], 14, data[13]);
                    } else if (data[12] == "LB_14809330635970") //学龄前儿童调查
                    {
                        lookUrl = getLookUrl(4, data[0], 15, data[13]);
                    } else if (data[12] == "LB_14811899636250") {
                        lookUrl = getLookUrl(1, data[0], null, null);
                    } else if (data[12] == "LB_14808297050440") {
                        lookUrl = getLookUrl(4, data[0], 16, data[13]);
                    } else if (data[12] == "LB_14812458422370") {
                        lookUrl = getLookUrl(4, data[0], 17, data[13]);
                    } else if (data[12] == "LB_14824009961900") {
                        lookUrl = getLookUrl(4, data[0], 18, data[13]);
                    } else if (data[12] == "LB_14963937158670") {
                        lookUrl = getLookUrl(4, data[0], 19, data[13]);
                    } else if (data[12] == "LB_14966568047910") {
                        lookUrl = getLookUrl(4, data[0], 20, data[13]);
                    } else if (data[12] == "LB_14963915437340")
                    {
                        lookUrl = getLookUrl(4, data[0], 21, data[13]);
                    }
                    else {
                        lookUrl = getLookUrl(2, data[0], null, data[13]);
                    }
                    operations = " <button class=\"btn btn-link\" id='btnLook" + data[0] + "' name='QX_SelectPersonalReport' data-amountCode='"+data[15]+"' data-belongToCode='"+data[14]+"' data-url=" + lookUrl + " >查看</button>";
                    operations += " <button  class=\"btn btn-link\" name='QX_DelectPersonalReport'data-name=" + data[5] + " value=" + data[0] + " onclick='RBdelete(this)'>删除</button>";
                    $('td:eq(7)', row).html(operation);
                    $('td:eq(8)', row).html(operations);
                    // 设置查询按钮点击事件
                    $('td:eq(8)', row).find("button[name='QX_SelectPersonalReport']").on("click", function () {
                        if ($(this).attr("data-amountCode") == "LB_14943307579630") {
                            sessionStorage.setItem("BelongToCode", $(this).attr("data-belongToCode"));
                            sessionStorage.setItem("PageMark", "个体报告");
                            window.location.href = "/FunctionModular/RiskWarning/PotentialRiskEstimateReport.aspx";
                            return;
                        }
                        if ($(this).attr("data-amountCode") == "LB_15131477237610") {
                            sessionStorage.setItem("BelongToCode", $(this).attr("data-belongToCode"));
                            sessionStorage.setItem("PageMark", "个体报告");
                            window.location.href = "/FunctionModular/RiskWarning/IdioctoniaEstimateReport.aspx";
                            return;
                        }
                        var url = $(this).attr("data-url");
                        window.location.href = url;
                    });

                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                },

                "oLanguage": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "_MENU_ 记录/页",
                    "sZeroRecords": "没有查询结果",
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


                    // 获取请求的页码
                    var pageIndex = fnGetRequiredPageIndex();
                    if ($("#tableGrid").DataTable().page() != pageIndex) {
                        setTimeout(function () {
                            $('#tableGrid').dataTable().fnPageChange(pageIndex)
                        }, 100);
                    }
                    isLoadDataTable = false;

                },
                drawCallback: function (s) {
                    $("#allCheck").removeAttr("checked");
                    // $("#UserList_info").html("<input style=\"margin-left:27px;\" type=\"checkbox\" name=\"checkboxname\" />全选"); 
                }
            });

            //$("#tableGrid").DataTable().page(2).draw(false);
        }
        //查询

        $(document).on("click", "#go_search", function () {

            amountTypeID = $("#Sel_AmountType").find("option:selected").val();
            departmentID = $("#DepIDs").val();
            testTypeID = $("#testType").find("option:selected").val();
            pushStatusID = $("#pushStatus").find("option:selected").val();
            loginName = $("#loginName").val();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }
        });

        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "../HeartEvaluation_DistributionRecord/Ajax/DistributionRecord.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item["Amount_ID"] + "'>" + item["Amount_Name"] + "</option>");

                    });
                    $("#" + controlname).attr("multiple", false);

                    $("#" + controlname).selectpicker('refresh');

                }
            });
        }

        function Remind(obj, Uid) {
            var receiveID = obj;

            RemindByWebState(receiveID)
            //alert(receiveID)
            //var webLetter = $("#webLetter")[0].checked;
            //var email = $("#email")[0].checked;
            //if (!webLetter && !email) {
            //    layer.alert("选选择要推送的报告！", {
            //        skin: "layui-layer-lan",
            //        closeBtn: 0
            //    })
            //    return;
            //}
            //if (webLetter && email) {
            //    RemindByEmail(receiveID, Uid);
            //    RemindByWebLetter(receiveID, Uid);
            //    return;
            //}
            //if (webLetter && !email) {
            //    RemindByWebLetter(receiveID, Uid);
            //    return;
            //}
            //if (!webLetter && email) {
            //    RemindByEmail(receiveID, Uid);
            //    return;
            //}

        }
        //推送站内信
        function RemindByWebLetter(receiveID, UIDs) {

            $.ajax({
                url: "Ajax/PersonalReport.ashx?operationType=SendWrite",
                data: { receveid: receiveID, title: "测评提醒", content: "您有测评未进行测试！", uid: UIDs },
                type: 'get',
                async: false,
                success: function (result) {
                    if (result == "True") {
                        layer.msg('推送成功！', { icon: 1 });
                        $("#tableGrid").DataTable().draw();
                    }
                    else {
                        layer.msg('推送失败！', { icon: 1 });

                    }
                }
            })
        }
        //推送Email
        function RemindByEmail(receiveID, UIDs) {

            $.ajax({
                url: "Ajax/PersonalReport.ashx?operationType=RemindByEmail",
                data: { receveid: receiveID, title: "测评提醒", content: "您有测评未进行测试！", uid: UIDs },
                type: 'get',
                success: function (result) {
                    if (result == "True") {
                        layer.msg('推送成功！', { icon: 1 });
                        $("#tableGrid").DataTable().draw();
                    }
                    else {
                        layer.msg('推送失败！', { icon: 1 });

                    }
                }
            })
        }

        //批量推送-站内信，邮箱
        function BulkRemindByWebLetter() {
            var tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var userIDList = '';
            var webLetter = $("#webLetter")[0].checked;
            var email = $("#email")[0].checked;
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {
                        var User = "";
                        Cvalue = checkbox[i].value;
                        var test = $("#" + Cvalue).parent().parent().find("td:eq(6)>button:eq(0)");
                        User = test.attr("data-id");
                        SendState = test.attr("data-name");
                        if (SendState != 2) {
                            U_IDs += Cvalue + ",";
                        }
                        UserIDs += User + ",";

                    }
                }
                if (U_IDs.length > 0) {
                    ///要写
                    U_IDs = U_IDs.substring(0, U_IDs.length - 1)
                    userIDList = U_IDs;
                    if (!webLetter && !email) {
                        layer.alert("选选择要推送的报告！", {
                            skin: "layui-layer-lan",
                            closeBtn: 0
                        })
                        return;
                    }
                    if (webLetter && email) {
                        RemindByEmail(userIDList, UserIDs);
                        RemindByWebLetter(userIDList, UserIDs);
                        return;
                    }
                    if (webLetter && !email) {
                        RemindByWebLetter(userIDList, UserIDs);
                        return;
                    }
                    if (!webLetter && email) {
                        RemindByEmail(userIDList, UserIDs);
                        return;
                    }
                }
            }

        }

        /*---产看MMPI报告---*/
        function LookMMPI(AID) {

            window.location.href = "MMPI_Report.aspx?A_ID=" + AID + "&type=2" + "&AmountType=" + 1;
        }
        function LookR(vals, AmountType) {
            //location.href = "LookReport.aspx?A_ID=" + vals + "";

            window.location.href = "LookReport.aspx?A_ID=" + vals + "&type=2" + "&AmountType=" + AmountType;
        }
        //特殊量表
        function LookRS(vals, types, AmountType) {

            window.location.href = "SpecialReport.aspx?A_ID=" + vals + "&type=2" + "&types=" + types + "&AmountType=" + AmountType;
        }
        //特殊量表M
        function LookRSS(vals, types, AmountType) {

            window.location.href = "SpecialReportM.aspx?A_ID=" + vals + "&type=2" + "&types=" + types + "&AmountType=" + AmountType;

        }
        function LookRNew() {

            window.location.href = "LookReport.aspx?A_ID=" + vals + "&type=2" + "&AmountType=" + AmountType;
        }
        //数据导出

        //$(document).on("click", "[name=checkbox]", function () {
        //    var ss = $(this).val();

        //    UserIDs += ss + ",";

        //    $("#Ahidden").val(UserIDs);
        //});
        //报告导出
        function printPage() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint-->";
            eprnstr = "<!--endprint-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr));
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();


        }

        //function GetExcel()
        //{
        //    $.ajax({
        //        url: "Ajax/PersonalReport.ashx?operationType=GetExcel",
        //        data: { Auserid: U_IDs },
        //        type: 'get',
        //        success: function (result) {

        //        }
        //    })

        //}
        //加载部门表
        function OnLoadTreeComD() {
            $("#Department_IDs").ligerComboBox({
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
                        }, 100);
                    },
                    onBeforeSelect: function (node) {
                        $("#DepIDs").val(node.data['id']);
                    },
                    url: '../BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random() + '&mark=searchCondition',
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false,
                    onClick: function (data) {
                        if ($("#Department_IDs").val() == "")
                            $("#DepIDs").val("");
                    }
                }
            });
        }
        //单个删除
        function RBdelete(obj) {
            var name = obj.getAttribute("data-name");
            var U_ID = obj.value;
            layer.confirm("确定要将此项个体报告放入回收站中吗？", {
                btn: ["是", "否"]
            }, function () {
                $.ajax({
                    url: "Ajax/PersonalReport.ashx?operationType=RBdelete",
                    data: { receveid: U_ID, name: name },
                    type: 'get',
                    success: function (result) {
                        if (result == "True") {
                            layer.msg('删除成功！', { icon: 1 });
                            $("#tableGrid").DataTable().draw();
                        }
                        else {
                            layer.msg('删除失败！', { icon: 1 });

                        }
                    }
                });
            })
        }
        //批量删除
        function RBdeletes() {
            var checkbox = document.getElementsByName("checkbox");
            var isDelete = false;
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                var name = "";
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        U_IDs += checkbox[i].value + ",";
                        name += checkbox[i].getAttribute("data-name") + ',';
                        isDelete = true;
                    }

                }
                if (U_IDs.length > 0) {
                    ///要写
                    U_IDs = U_IDs.substring(0, U_IDs.length - 1);

                    layer.confirm("确定要将此项个体报告放入回收站中吗? ", {
                        btn: ["确定", "取消"]
                    }, function () {
                        $.ajax({
                            url: "Ajax/PersonalReport.ashx?operationType=RBdelete",
                            data: { receveid: U_IDs, name: name },
                            type: 'get',
                            success: function (result) {
                                if (result == "True") {
                                    layer.msg('删除成功！', { icon: 1 });
                                    $("#tableGrid").DataTable().draw();
                                    $("#allCheck")[0].checked = false;
                                }
                                else {
                                    layer.msg('删除失败！', { icon: 1 });
                                }
                            }
                        });
                    })
                } else {
                    layer.alert("请选择要删除的报告！", {
                        skin: "layui-layer-lan",
                        closeBtn: 0
                    })
                }
            }

        }

        //推送-最后修改
        function RemindByWebState(receiveID) {

            $.ajax({
                url: "Ajax/PersonalReport.ashx?operationType=SendState",
                data: { receveid: receiveID },
                type: 'get',
                async: false,
                success: function (result) {
                    if (result == "True") {
                        layer.msg('授权成功！', { icon: 1 });
                        $("#tableGrid").DataTable().draw();
                    }
                    else {
                        layer.msg('授权失败！', { icon: 1 });

                    }
                }
            });
        }
        // 获取地址栏参数
        function fnGetUrlParam(paramName) {
            var result = "";

            var usr = window.location.href;
            var ul = usr.toString().split('?');
            if (ul.length == 2) {
                var params = ul[1].split('&');
                for (var i = 0; i < params.length; i++) {
                    var param = params[i].split('=');
                    if (param.length == 2) {
                        if (param[0] + "" == paramName) {
                            result = param[1];
                            break;
                        }
                    }
                }
            }

            return result;
        }

        // 获取请求页码
        function fnGetRequiredPageIndex() {
            var pageIndex = fnGetUrlParam("p");
            var result = /^[1-9]\d*$/.test(pageIndex) ? Number(pageIndex) - 1 : 0;

            return result;
        }

        function BulkRemind() {
            var tempDistriArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var userIDList = '';
            //var webLetter = $("#webLetter")[0].checked;
            //var email = $("#email")[0].checked;
            var checkbox = document.getElementsByName("checkbox");
            if (checkbox.length > 0) {
                var U_IDs = "";//注意
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {

                        var User = "";
                        Cvalue = checkbox[i].value;
                        var test = $("#" + Cvalue).parent().parent().find("td:eq(7)>button:eq(0)");
                        User = test.attr("data-id");
                        SendState = test.attr("data-name");
                        if (SendState != 2) {
                            U_IDs += Cvalue + ",";
                        }
                        UserIDs += User + ",";

                    }
                }
                if (U_IDs.length > 0) {
                    ///要写
                    U_IDs = U_IDs.substring(0, U_IDs.length - 1)
                    RemindByWebState(U_IDs);
                } else {
                    layer.alert("请选择要推送的报告！", {
                        skin: "layui-layer-lan",
                        closeBtn: 0
                    });
                    return;
                }
            }

        }
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
        function AllCheck() {
            var checkbox = document.getElementById("allCheck").checked;//得到主要 checkbox id 的状态
            var items = document.getElementsByName("checkbox"); //得到 name=chec的控件
            for (var i = 0; i < items.length; i++) {//然后循环
                //当前checkbox 的状态 = 所有的控件状态
                items[i].checked = checkbox;
            }
        };

        //设置复选框的CheckboxID        
        $(document).on("click", ".childCheck", function () {

            if (!$(this)[0].checked) {
                $("#allCheck")[0].checked = false;
            }
            else {
                var arrayCheck = $(".childCheck");
                var isSuccess = true;
                for (var i = 0; i < arrayCheck.length; i++) {
                    if (arrayCheck[i].checked == false) {
                        isSuccess = false;
                        break;
                    }
                }
                $("#allCheck")[0].checked = isSuccess;
            }

        });
        $("[name='checkbox']").removeAttr("checked");//取消选中

        //查询按钮的单击事件
        $(document).keyup(function (e) {
            if (e.keyCode === 13) {

                $('#go_search').trigger('click');
            }
        });
        //新增模板
        $("#Template").click(function ()
        {
            window.location.href = "AddTemplate.aspx";
        })
    </script>
</asp:Content>
