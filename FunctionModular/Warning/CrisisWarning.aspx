<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="CrisisWarning.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Warning.CrisisWarning" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">危机预警</a></li>
                <li><a href="#" style="color: #666;">查看预警</a></li>
            </ol>

        </div>
    </div>
    <div class="row">

        <div class="col-md-3 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-left: 3px; margin-right: 3px; margin-top: 10px;">

            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                <input type='text' readonly="readonly" placeholder="---选择日期---" onclick="javascript: $(this).val('')" class='form-control input-sm' id='dtstart' style="border-radius: 0px; height: 28px; line-height: 28px;" />
            </div>
            <div class="col-md-2 col-sm-2 col-xs-2" style="line-height: 30px;">
                到
            </div>
            <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                <input type='text' readonly="readonly" placeholder="---选择日期---" onclick="javascript: $(this).val('')" class='form-control input-sm' id='dtend' style="border-radius: 0px; height: 28px; line-height: 28px;" />
            </div>



        </div>
        <div class="col-md-1 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-left: 3px; margin-right: 3px; margin-top: 10px;">

            <input type='text' placeholder="登录名/姓名" class='form-control input-sm' id="Search_Name" style="border-radius: 0px; height: 28px; line-height: 28px;" />
        </div>
        <div class="col-md-1 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-left: 3px; margin-right: 3px; margin-top: 10px;">
            <select id="Sel_Sex" class="form-control" style="height: 28px; line-height: 28px;">
                <option value="性别">性别</option>
                <option value="男">男</option>
                <option value="女">女</option>
            </select>

        </div>
        <div class="col-md-1 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-left: 3px; margin-right: 3px; margin-top: 10px;">
            <input type="text" id="TSel_BM" name="TSel_BM" placeholder="--选择部门--" />

        </div>

        <div class="col-md-2 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-left: 3px; margin-right: 3px; margin-top: 10px;">
            <select class="selectpicker form-control" onchange="initWD();" data-done-button="true" data-live-search="true" data-placeholder="量表名称" style="width: 100%;" id="Sel_Amount">
            </select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-left: 3px; margin-right: 3px; margin-top: 10px;" id="D_WD">
            <select class="selectpicker form-control" data-done-button="true" title="--维度名称--" data-live-search="true" data-placeholder="维度名称" style="width: 190px;" id="Sel_WD">
            </select>

            <div class="col-md-10" style="padding-left: 0px; padding-right: 0px; margin-left: 3px; margin-right: 3px;">
                <div class="list-group" id="G_Additional" style="max-height: 83px; overflow-y: auto; margin-right: 0px;">

                    <%--   <a href="#" class="list-group-item">
                        <span class="badge">X</span>
                        <i class="fa fa-fw fa-comment"></i>Commented on a post
                    </a>--%>
                </div>
            </div>
        </div>


        <div class="col-md-1 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-top: 10px; text-align: right;">

            <%-- <div class="col-md-5" style="padding-left: 0px; padding-right: 0px;"><a href="#" onclick="DepartmentTX();" class="btn btn-bm btn-sm">追加</a></div>
            <div class="col-md-5" style="padding-left: 0px; padding-right: 0px;">
                <button class="btn btn-primary btn-sm"><i class=" fa fa-search "></i>查询</button>
            </div>--%>
             <div class="btn-group">
                    <button class="btn btn-primary btn-sm" onclick="OnLoadUserList();" id="go_search" name="QX_SelectOnLoad"><i class=" fa fa-search"></i>查询</button>
                    <button data-toggle="dropdown" class="btn btn-blues btn-sm" style="background-color: RGB(66,139,203); color: white"><span class="caret"></span></button>
                    <ul class="dropdown-menu" style="text-align: center; width: 90px; min-width: 10px;">
                        <li><a href="javascript:;" onclick="G_Additional();" name="QX_AddLoad" style="padding: 0px;">追加条件</a></li>
                    </ul>
                </div>

        </div>

    </div>
    <div class="row" style="text-align: right; display: none;">
    </div>

    <div class="row">
        <div class="col-md-12" style="padding-left: 0px; padding-right: 0px;">
            <!-- Advanced Tables -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="dataTables-Warning">
                    <thead style="background-color: RGB(245,248,253); color: RGB(110,164,213);">
                        <tr>
                            <th class="text-center" style="width: 1%;">
                                <input type="checkbox" id="C_CheckAll" onclick="CheckAll(this)" value="0" /></th>
                            <th class="text-center" style="width: 40px;">序号</th>
                            <th class="text-center">登录名</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center" style="width: 40px;">性别</th>
                            <th class="text-center">部门</th>
                            <th class="text-center">量表名称</th>
                            <th class="text-center">维度名称</th>
                            <th class="text-center">预警级别</th>
                            <th class="text-center">提交时间</th>
                            <th class="text-center">操作</th>
                            <th class="text-center" style="display: none;">AnswerAdd_ID</th>
                            <th class="text-center" style="display: none;">CrisisList_Code</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
            <button type="button" class="btn btn-reds" onclick='DelByCodeList()' style='margin-left: 10px;'><i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>

    </div>


    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script>

        var navName = '/FunctionModular/Warning/CrisisWarning.aspx';


        initAmount();//初始化量表下拉列表

        var myDate = new Date();

        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        $('#dtstart').datepicker('setEndDate', myDate);//设置结束时间
        $('#dtstart').val('<%=GetDate(-7)%>');


        $('#dtend').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //$('#dtend').datepicker('setStartDate', '2016-08-25');
        $('#dtend').datepicker('setEndDate', myDate);//设置结束时间
        $('#dtend').val('<%=GetDate(0)%>');
        OnLoadTreeCom();


        function OnLoadTreeCom() {
            $("#TSel_BM").ligerComboBox({
                width: "100%",
                selectBoxWidth: "98%",
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
                        bm = node.data['id'];
                    },
                    url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false,
                    onClick:function(data) {
                        if ($('#TSel_BM').val() == "")
                            bm = 0;
                    }
                }
            });
        }



        /*-----初始化量表下拉方法-----*/
        function initAmount() {
            $("#Sel_Amount").empty();
            $("#Sel_Amount").append("<option value='0'>--量表名称--</option>");
            $.ajax({
                type: "POST",
                url: "Ajax/Warning.ashx",
                data: "type=InitAmount",//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        if (item.Text == "霍兰德职业兴趣倾向测验" || item.Text == "艾森克人格问卷-少年版（EPQ）" || item.Text == "卡特尔十六种人格因素测验" || item.Text == "心理年龄自测表" || item.Text == "应付方式问卷" || item.Text == "防御方式问卷" || item.Text == "QIUS在校学生气质量表（QTS）" || item.Text == "学龄前儿童活动调查表")
                        { } else
                        {
                            $("#Sel_Amount").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                        }
                    });
                    $("#Sel_Amount").attr("multiple", false);

                    $("#Sel_Amount").selectpicker('refresh');

                }
            });
        }


        function initWD() {
            $("#Sel_WD").html("");
            $("#D_WD").find("ul").empty();
            $("#D_WD").find("div").find("button").find("span:first").html('--维度名称--');
            $("#D_WD").find("div").find("button").attr('class', 'btn dropdown-toggle bs-placeholder btn-default');
            $("#Sel_WD").append("<option value='0'>所有维度</option>");
            $.ajax({
                type: "POST",
                url: "Ajax/Warning.ashx",
                data: "type=InitWD&aCode=" + $("#Sel_Amount").val(),//要执行查询的数据参数
                success: function (msg) {

                    $.each(eval(msg), function (index, item) {
                        $("#Sel_WD").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                    });
                    $("#Sel_WD").attr("multiple", false);
                    $("#Sel_WD").selectpicker('refresh');

                }
            });
        }

        /*-----追加维度查询条件-----*/
        function G_Additional() {
            var Acode = $("#Sel_Amount").val();
            var wcode = $("#Sel_WD").val();
            var A_NextSelText = $("#Sel_Amount").find("option:selected").text();
            var WD_NextSelText = $("#Sel_WD").find("option:selected").text();
            if (A_NextSelText == "所有量表") {
                layer.msg('量表名称为必填项', {
                    time: 2000, //20s后自动关闭
                    btn: ['确定']
                });
                return;
            } else {

                if (LB_Code_Str.indexOf(Acode) < 0) {
                    if (LB_Code_Str != "") {
                        LB_Code_Str += "," + Acode;
                    } else {
                        LB_Code_Str = Acode;
                    }
                }
            }
            if (WD_NextSelText == "所有维度" || WD_NextSelText == "--维度名称--") {
                layer.alert("维度名称不能为空！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            } else {
                if (WD_Code_Str.indexOf(wcode) > -1) {
                    layer.alert("维度名称重复，请重新添加！", {
                        skin: "layui-layer-lan",
                        closeBtn: 0
                    });
                    return;
                }
                if (WD_Code_Str != "") {
                    WD_Code_Str += "," + wcode;
                } else {
                    WD_Code_Str = wcode;
                }
            }

            var GroupHTML = "";
            GroupHTML += "<a href=\"javascript:;\" id=\"Additional_" + wcode + "\" class=\"list-group-item\">";
            GroupHTML += "     <span class=\"badge\" onclick=\"DelAdditional('" + wcode + "')\" >X</span>";
            GroupHTML += A_NextSelText + "[" + WD_NextSelText + "]";
            GroupHTML += "</a>";
            $("#G_Additional").append(GroupHTML);

        }

        /*-----删除查找的维度信息-----*/
        function DelAdditional(wdc) {
            layer.confirm('您是否要删除该组合？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $("#Additional_" + wdc + "").css('display', 'none');
                if (WD_Code_Str != "") {
                    var ed_List = WD_Code_Str.split(',');
                    if (ed_List != null && ed_List.length > 0) {
                        WD_Code_Str = "";
                        for (var t = 0; t < ed_List.length; t++) {
                            if (ed_List[t] != wdc) {
                                if (WD_Code_Str != "") {
                                    WD_Code_Str = "," + ed_List[t];
                                } else {
                                    WD_Code_Str = ed_List[t];
                                }

                            }

                        }
                    }
                }
                layer.closeAll();
            });

        }



        /*----------加载页面列表---------*/

        var startTime = "";//开始时间
        var endTime = "";//结束时间
        var loginName = "";//登陆名称
        var sex = "";//性别
        var bm = 0;//部门
        var WarningList;//预警数据表集合
        var LB_Code_Str = "";
        var WD_Code_Str = "";
        var Sel_LBCode = "";
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var isLoadDataTable = true; // 是否为第一次初始化数据
        OnLoadUserList();
        function OnLoadUserList() {


            Sel_LBCode = $("#Sel_Amount").val();
            //if (LB_Code_Str == "" && Sel_LBCode == "0") {

            //     layer.alert("请选择一个量表在统计！", {
            //        skin: "layui-layer-lan",
            //        closeBtn: 0
            //    })
            //    return;
            //}

            if (LB_Code_Str == "" || LB_Code_Str.indexOf(",") < 0) {
                LB_Code_Str = Sel_LBCode;
            }
            if (WD_Code_Str == "") {
                WD_Code_Str = $("#Sel_WD").val() == null ? "" : $("#Sel_WD").val();
            }
            startTime = $("#dtstart").val();
            endTime = $("#dtend").val();
            loginName = $("#Search_Name").val();
            sex = $("#Sel_Sex").val();
            // alert(WD_Code_Str);



            //alert(LB_Code_Str);
            //alert(WD_Code_Str);



            if (WarningList != undefined) {
                $("#dataTables-Warning").DataTable().draw();
                return;
            }
            WarningList = $('#dataTables-Warning').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                aoColumnDefs: [

                    { //隐藏列
                        bVisible: false,
                        aTargets: [11]
                    },
                    { //隐藏列
                        bVisible: false,
                        aTargets: [12]
                    }
                    //, { //隐藏列
                    //    bVisible: false,
                    //    aTargets: [4]
                    //}
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Warning.ashx",
                    dataSrc: "data",
                    data: function (d) {

                        var pageIndex = fnGetRequiredPageIndex();
                        // 当初始化的时候
                        if (isLoadDataTable && $("#dataTables-Warning").DataTable().page() != pageIndex) {
                            d.start = pageIndex * d.length;
                        }

                        Endindex = 0;
                        Starindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'type=LoadWring&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&SatrtTime=' + startTime + '&EndTime=' + endTime + '&sex=' + sex + '&AcodeStr=' + LB_Code_Str + '&WcodeStr=' + WD_Code_Str + '&LogingName=' + loginName + "&bm=" + bm;
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    //if (ChangeValue != "") {
                    //    if (ChangeValue.indexOf(data[0]) > -1) {

                    //        $('td:eq(0)', row).html(" <input type=\"checkbox\" onchange=\"ChangeRecoed(this);\" id=\"Tck_" + data[0] + "\" checked=\"checked\" value=\"{'AID':'" + data[0] + "','LogName':'" + data[2] + "','TName':'" + data[3] + "'}\"  name='checkboxname'   />");
                    //    } else {
                    //        $('td:eq(0)', row).html(" <input type=\"checkbox\" onchange=\"ChangeRecoed(this);\"  id=\"Tck_" + data[0] + "\"  value=\"{'AID':'" + data[0] + "','LogName':'" + data[2] + "','TName':'" + data[3] + "'}\"  name='checkboxname'   />");
                    //    }
                    //} else {
                    //    $('td:eq(0)', row).html(" <input type=\"checkbox\" onchange=\"ChangeRecoed(this);\"   id=\"Tck_" + data[0] + "\" value=\"{'AID':'" + data[0] + "','LogName':'" + data[2] + "','TName':'" + data[3] + "'}\"  name='checkboxname'   />");
                    //}
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(0)', row).html("<input type=\"checkbox\" name=\"SelCrisis\" value=\"" + data[12] + "\" />");
                    $('td:eq(1)', row).css("text-align", "center");

                    var lookUrl = "";
                    // 当前页码
                    var tablePageIndex = $("#dataTables-Warning").DataTable().page() + 1;

                    // 当初始化的时候
                    var pageIndex = fnGetRequiredPageIndex();
                    if (isLoadDataTable && $("#dataTables-Warning").DataTable().page() != pageIndex) {
                        tablePageIndex = pageIndex + 1;
                    }

                    // 获取查看跳转的地址
                    function getLookUrl(urlType, aId, contenType) {
                        var result = "";
                        switch (urlType) {
                            case 1: // MMPI报告 lookMMPI
                                result = "MMPI_Report.aspx?A_ID=" + aId + "&type=3" + "&AmountType=" + 0 + "&p=" + tablePageIndex;
                                break;
                            case 2: // LookR
                                result = "LookReport.aspx?A_ID=" + aId + "&type=3" + "&AmountType=0&p=" + tablePageIndex;
                                break;
                            case 3: // 特殊量表 LookRS
                                result = "SpecialReport.aspx?A_ID=" + aId + "&type=3" + "&types=" + contenType + "&AmountType=0&p=" + tablePageIndex;
                                break;
                            case 4: // 特殊量表M LookRSS
                                result = "SpecialReportM.aspx?A_ID=" + aId + "&type=3" + "&types=" + contenType + "&AmountType=0&p=" + tablePageIndex;
                                break;
                        }

                        return result;
                    }

                    if (data[13] == "LB_14814373314360") {
                        lookUrl = getLookUrl(4, data[11], 1);
                    } else if (data[13] == "LB_14809941842260" || data[13] == "LB_14811084564180" || data[13] == "LB_14810118744850") {
                        lookUrl = getLookUrl(3, data[11], 3);
                    } else if (data[13] == "LB_14809227671290") {
                        lookUrl = getLookUrl(4, data[11], 4);
                    } else if (data[13] == "LB_14809953564280" || data[13] == "LB_14809270976120" || data[13] == "LB_14810979035220") {
                        lookUrl = getLookUrl(3, data[11], 6);
                    } else if (data[13] == "LB_14811056565390") {
                        lookUrl = getLookUrl(4, data[11], 7);
                    } else if (data[13] == "LB_14811852410670") {
                        lookUrl = getLookUrl(3, data[11], 8);
                    } else if (data[13] == "LB_14812009694200") {
                        lookUrl = getLookUrl(3, data[11], 801);
                    } else if (data[13] == "LB_14814373314360") {
                        lookUrl = getLookUrl(3, data[11], 802);
                    } else if (data[13] == "LB_14812009852840") {
                        lookUrl = getLookUrl(3, data[11], 9);
                    } else if (data[13] == "LB_14811658719780") {
                        lookUrl = getLookUrl(3, data[11], 901);
                    } else if (data[13] == "LB_14811181207060") {
                        lookUrl = getLookUrl(3, data[11], 10);
                    } else if (data[13] == "LB_14811661311050") {
                        lookUrl = getLookUrl(4, data[11], 11);
                    } else if (data[13] == "LB_14812024172130") {
                        lookUrl = getLookUrl(4, data[11], 13);
                    } else if (data[13] == "LB_14811899593960") {
                        lookUrl = getLookUrl(3, data[11], 14);
                    } else if (data[13] == "LB_14809330635970") {
                        lookUrl = getLookUrl(4, data[11], 15);
                    } else if (data[13] == "LB_14811899636250") //明
                    {
                        lookUrl = getLookUrl(1, data[11]);
                    } else if (data[13] == "LB_14808297050440") {
                        lookUrl = getLookUrl(4, data[11], 16);
                    } else if (data[13] == "LB_14812458422370") {
                        lookUrl = getLookUrl(4, data[11], 17);
                    } else if (data[13] == "LB_14824009961900")//生活事件
                    {
                        lookUrl = getLookUrl(4, data[11], 18);
                    }
                    else if (data[13] == "LB_14963937158670") {
                        lookUrl = getLookUrl(4, data[11], 19);
                    } else if (data[13] == "LB_14966568047910") {
                        lookUrl = getLookUrl(4, data[11], 20);
                    } else if (data[13] == "LB_14963915437340") {
                        lookUrl = getLookUrl(4, data[11], 21);
                    }
                    else {
                        lookUrl = getLookUrl(2, data[11]);
                    }

                    var btnLook = $(" <button  class=\"btn btn-link\" name='QX_SelectReport' data-name='lookReportS'  onclick=look('"+lookUrl+"')>查看</button>");
                    //btnLook.on("click", function () {
                    //    window.location.href = "../PersonalReport/" + lookUrl;
                    //});
                    
                    $('td:eq(10)', row).append(btnLook);
                    $('td:eq(10)', row).append("      <button  href=\"javascript:;\" class=\"btn btn-link\" onclick=\"DelByCode('" + data[12] + "')\" >删除</button>");
                },

                "oLanguage": {
                    "sProcessing": "数据加载中...",
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
                    //$("#UserList_info").css("display", "none");
                    //$("#UserList_info").html("<input style=\"margin-left:27px;\" type=\"checkbox\" name=\"checkboxname\" />全选");
                    // 获取分页重新定位


                    // 获取请求的页码
                    var pageIndex = fnGetRequiredPageIndex();
                    if ($("#dataTables-Warning").DataTable().page() != pageIndex) {
                        $('#dataTables-Warning').dataTable().fnPageChange(pageIndex);
                    }
                    isLoadDataTable = false;
                },
                drawCallback: function (s) {
                    $("#C_CheckAll").removeAttr("checked");
                    // $("#UserList_info").html("<input style=\"margin-left:27px;\" type=\"checkbox\" name=\"checkboxname\" />全选");
                }
            });

        }
        function look(lookUrl) {
            window.location.href = "../PersonalReport/" + lookUrl;
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
            var pageIndex  = fnGetUrlParam("p");
            var result = /^[1-9]\d*$/.test(pageIndex) ? Number(pageIndex) - 1 : 0;

            return result;
        }

        function DrewWarningList() {
            if (WarningList != undefined) {
                $("#dataTables-Warning").DataTable().draw();
            }
        }



        /*--------单个删除----*/
        function DelByCode(objID) {
            layer.confirm('您是否要删除该预警呢？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                //Del_ByCode

                $.ajax({
                    type: "POST",
                    url: "Ajax/Warning.ashx",
                    data: "type=Del_ByCode&CID=" + objID,//要执行查询的数据参数
                    success: function (msg) {
                        if (msg > 0) {

                            layer.msg('删除成功！', {
                                time: 2000, //2s后自动关闭
                                icon: 1
                            });
                            DrewWarningList();
                        } else {
                            layer.msg('删除失败！', {
                                time: 2000, //2s后自动关闭
                                icon: 5
                            });
                        }

                    }
                });



            });


        }

        function CheckAll(obj) {
            if (obj.checked) {
                //alert('lihai');
                $("[name = SelCrisis]:checkbox").prop("checked", true);
            } else {
                $("[name = SelCrisis]:checkbox").removeAttr("checked");;
            }

        }

        /*--------批量删除------------*/
        function DelByCodeList() {

            //var tempRecycleBinArray = $("#tableGrid").find("input[type=checkbox]")
            var SelCrisis = $("#dataTables-Warning").find("input[type=checkbox]").not("#C_CheckAll");
            var isDelete = false;
            for (var i = 0; i < SelCrisis.length; i++) {

                if ($(SelCrisis[i])[0].checked) {

                    isDelete = true;
                }
            }
            if (isDelete == false) {
                layer.alert("您没有勾选任何数据！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            }

            layer.confirm('您是否要删除该批预警数据呢？', {
                btn: ['删除', '取消'] //按钮
            }, function () {



                var DelCode = "";
                $('input[name="SelCrisis"]:checked').each(function () {
                    if (DelCode != "") {
                        DelCode += ",'" + $(this).val() + "'";
                    } else {
                        DelCode += "'" + $(this).val() + "'";
                    }
                });

                if (DelCode != "") {
                    $.ajax({
                        type: "POST",
                        url: "Ajax/Warning.ashx",
                        data: "type=Del_ByCodeList&CID_List=" + DelCode,//要执行查询的数据参数
                        success: function (msg) {
                            if (msg > 0) {
                                C_CheckAll
                                $("#C_CheckAll").removeAttr("checked");
                                //layer.msg('删除成功了,共删除' + DelCode.split(',').length + '条数据', {
                                //    time: 2000, //20s后自动关闭
                                //    btn: ['知道了']
                                //});
                                layer.msg('删除成功！', {
                                    time: 2000, //20s后自动关闭
                                    icon: 1
                                });
                                DrewWarningList();
                            } else {
                                layer.msg('删除失败！', {
                                    time: 2000, //20s后自动关闭
                                    icon: 1
                                });
                            }

                        }
                    });


                } else {
                    layer.alert("您没有勾选任何数据！", {
                        skin: "layui-layer-lan",
                        closeBtn: 0
                    })

                }
                //layer.closeAll();
            });


        }
        $(document).on("click", "[name=SelCrisis]", function () {
            var isAllCheck = true;
            var checkArray = $("#dataTables-Warning").find("input[type=checkbox]").not("#C_CheckAll");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }
            $("#C_CheckAll")[0].checked = isAllCheck;
        })
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
        /*---产看MMPI报告---*/
        function LookMMPI(AID) {
            window.location.href = "../PersonalReport/MMPI_Report.aspx?A_ID=" + AID + "&type=3" + "&AmountType=" + 1;
        }


        function LookR(vals) {
            //location.href = "LookReport.aspx?A_ID=" + vals + "";

            window.location.href = "../PersonalReport/LookReport.aspx?A_ID=" + vals + "&type=3" + "&AmountType=0";
        }
        //特殊量表
        function LookRS(vals, types) {
            window.location.href = "../PersonalReport/SpecialReport.aspx?A_ID=" + vals + "&type=3" + "&types=" + types + "&AmountType=0";
        }
        //特殊量表M
        function LookRSS(vals, types) {
            window.location.href = "../PersonalReport/SpecialReportM.aspx?A_ID=" + vals + "&type=3" + "&types=" + types + "&AmountType=0";
        }
        function LookRNew() {

            window.location.href = "../PersonalReport/LookReport.aspx?A_ID=" + vals + "&type=3" + "&AmountType=0";
        }
    </script>



</asp:Content>


