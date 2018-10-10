<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Questionnaire_Gauges.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.Questionnaire_Gauges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="#" onclick="Exit()">问卷管理</a></li>
                <li><a href="#">分配问卷</a></li>
            </ol>
        </div>
    </div>
    <div class="row" style="margin-left: 0px; margin-right: 0px;">
        <div class="col-md-2 col-sm-12 col-xs-12">
            <div >
                <input type="text" id="T_parent" name="T_parent" placeholder="--部门名称--" />
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="display: none;">
            <div>
                <select class="form-control" id="Sel_RoleType"></select>
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12">
            <div >
                <input class="form-control" id="user_infos" placeholder="登录名/姓名" />
            </div>
        </div>
        <div class="col-md-1 col-sm-12 col-xs-12">
            <div style="float: right; margin-bottom: 20px;">
                <button class="btn btn-primary btn-sm" onclick="tp()" id="go_search"><i class="fa fa-search"></i>查询</button>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">

            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">
                        <thead>
                            <tr>
                                <th class="text-center">选框</th>
                                <th class="text-center">
                                    <input onclick="chebox()" type="checkbox" id="checkbox" name="checkbox" value="0" /></th>
                                <th class="text-center">序号</th>
                                <th class="text-center">登录名</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">角色名称</th>
                                <th class="text-center">所属部门</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                </div>

            </div>


            <div class="row" style="margin: 15px 0px 0px 0px;">
                <div id="DisAdd" class="form-horizontal" role="form">
                    <div class="form-group">
                        <div class="group">
                            <div class="col-md-2 col-sm-2  control-label"><span class="text-danger">*</span> 是否支持匿名作答：</div>
                            <div class="col-sm-6">
                                <input type="radio" name="LookR" value="0" checked="cheched" onclick="Anonymity(this)" />否
                                <input type="radio" name="LookR" value="1" onclick="Anonymity(this)" />是
                            </div>
                        </div>
                    </div>
                    <div class="row" style="text-align: center; margin-top: 20px;">
                        <div class="col-md-6 col-sm-2  control-label">
                            <button type="button" class="btn btn-sm" style="background-color: orange; color: white" id="FenPei" onclick="Distribution()">分配</button>
                        </div>
                        <div class="col-md-1 col-sm-2  control-label">
                            <button type="button" onclick="Exit()" class="btn  btn-sm btn-primary">返回</button>
                        </div>
                    </div>

                </div>

            </div>

        </div>
    </div>
    <input type="hidden" id="DepID" />
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <script>
        var navName = '/FunctionModular/Questionnaire_Record/Questionnaire_Manage.aspx';
        var IsAnonymity = "0";//是否允许匿名作答的全局变量，用于点击分配之后的判断0:不允许

        initSelectInput("Remark=1", "Sel_RoleType", "--角色名称--");//初始化量表类别

        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            t = setTimeout(function () {
                $.ajax({
                    type: "POST",
                    url: "../BasicSetting/Ajax/Type.ashx",
                    data: types,//要执行查询的数据参数
                    success: function (msg) {
                        clearTimeout(t);
                        $.each(eval(msg), function (index, item) {

                            $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                        });

                    }
                });
            }, 100);

        }
        //是否允许匿名作答的选择按钮。给一个全局变量赋值，用于分配时判断
        function Anonymity(data) {
            IsAnonymity = $(data)[0].value;
        }
        //返回到问卷管理页面
        function Exit() {
            var url = window.location;
            var urlArr = url.toString().split('/');
            var ustr = "http://" + urlArr[1] + "/" + urlArr[2] + "/" + urlArr[3] + "/Questionnaire_Record/Questionnaire_Manage.aspx";
            window.location.href = ustr;
        }
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var departmentID = 0; //部门
        var dtDetail;
        var user_infos = "";
        yangshi();
        function yangshi() {
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
            var Sel_RoleType = $("#Sel_RoleType").val();
            user_infos = $("#user_infos").val();
            dtDetail = $('#DataTables-Gauge').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    }
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Questionnaire_Distribution.ashx",
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
                        return 'type=GetUserInfo &StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + "&departmentID=" + departmentID + "&Sel_RoleType=" + Sel_RoleType + "&user_infos=" + user_infos;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    $('td:eq(0)', row).html(" <input class='checkbox' type=\"checkbox\" name=\"UserNames\" value=\"" + data[0] + "\" />");
                    $('td:eq(0)', row).css("text-align", "center");

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
        //获取地址栏的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }

        //参数类型添加
        var TestType = "";
        var Retest = "";
        //分配按钮
        function Distribution() {

            $("#FenPei").attr({ "disabled": "disabled" });
            setInterval('butt()', 3000);

            //新增字段
            var ss = TestType;
            var checkbox = document.getElementsByName("UserNames");
            if (checkbox.length > 0) {
                var U_IDs = "";//选中的用户ID     
                var names = "";//选中的用户姓名
                for (var i = 0; i < checkbox.length; i++) {
                    if (checkbox[i].checked) {
                        U_IDs += checkbox[i].value + ",";
                        names += checkbox[i].parentNode.parentNode.childNodes[2].innerHTML + ",";
                    }
                }
                if (U_IDs.length > 0) {
                    layer.confirm('确定分配吗？', {
                        btn: ['是', '否'] //按钮
                    }, function () {

                        $.ajax({
                            url: "Ajax/Questionnaire_Distribution.ashx?type=Insert",
                            data: {
                                U_IDs: U_IDs,
                                name: names,
                                QCode: getUrlParam("Qcode"),
                                TestType: TestType,
                                Anonymity: IsAnonymity
                            },
                            type: 'post',
                            success: function (result) {
                                results = eval("(" + result + ")");
                                if (results != null && results != "") {
                                    var msg = "";
                                    if (results.FailName != null)
                                        msg = results.FailName + "分配失败！";
                                    else if (results.Sucess != 0)
                                        msg = results.Sucess + "份问卷分配成功！";
                                    layer.msg(msg, { icon: 1, time: 2000 }, function () {
                                        Exit();
                                    });

                                } else {
                                    layer.msg('分配失败！', { icon: 5, time: 2000 });
                                }
                            }

                        });
                    });

                } else {
                    layer.alert('请选择成员！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                }
            }
        }
        //加载部门信息
        OnLoadTreeCom();
        function OnLoadTreeCom() {
            $("#T_parent").ligerComboBox({
                width: 150,
                selectBoxWidth: 150,
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
                        $("#DepID").val(node.data['id']);
                    },
                    url: '../BasicSetting/Ajax/DepartmentMain.ashx?Remark=OnLoadDep&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }
            });
            $("#T_parent").parent().css("width", "100%");
        }
        //禁用分配按钮
        function butt() {
            $('#FenPei').attr("disabled", false);
        }
        //查询按钮
        function tp() {

            if ($("#DepID").val() != "" && $("#DepID").val() != null) {
                departmentID = parseInt($("#DepID").val());
            } else {
                departmentID = "";
            }

            Sel_RoleType = $("#Sel_RoleType").val();
            user_infos = $("#user_infos").val();
            $('#checkbox').attr("checked", false);  //取消选中
            //alert(user_infos)
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
        }
        function chebox() {

            var checkbox = document.getElementById("checkbox").checked;//得到主要 checkbox id 的状态
            var items = document.getElementsByName("UserNames"); //得到 name=chec的控件
            for (var i = 0; i < items.length; i++) {//然后循环
                //当前checkbox 的状态 = 所有的控件状态
                items[i].checked = checkbox;
            }
        }

        //设置复选框的CheckboxID        
        $(document).on("click", ".checkbox", function () {

            if (!$(this)[0].checked) {
                $("#checkbox")[0].checked = false;
            }
            else {
                var arrayCheck = $(".checkbox");
                var isSuccess = true;
                for (var i = 0; i < arrayCheck.length; i++) {
                    if (arrayCheck[i].checked == false) {
                        isSuccess = false;
                        break;
                    }
                }
                $("#checkbox")[0].checked = isSuccess;
            }

        });
        $("[name='checkbox']").removeAttr("checked");//取消选中
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
    </script>
</asp:Content>
