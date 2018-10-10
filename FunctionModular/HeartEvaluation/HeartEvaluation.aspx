<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HeartEvaluation.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.HeartEvaluation1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link rel="shortcut icon" id="icons" href="" />
    <!-- Bootstrap Styles-->
    <link href="/CSS/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="../../CSS/custom-styles.css" rel="stylesheet" />
    <link href="../../CSS/custom-styles_1.css" rel="stylesheet" />
    <link href="../../CSS/font-awesome.min.css" rel="stylesheet" />
    <link href="../../CSS/base.css" rel="stylesheet" />
    <link href="../../CSS/rysz.css" rel="stylesheet" />
    <link href="../../CSS/xlcp.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>

    <div class="content pr">
        <!-- main -->
        <div class="x_lbgl">
            <div class="bs-example bs-example-tabs" data-example-id="togglable-tabs">
                <ul id="myTabs" class="nav nav-tabs" role="tablist">
                    <li class="active"><a class="x_lbfp" href="#home" data-toggle="tab">量表分配</a></li>
                    <li><a class="x_zhfp" href="#profile" data-toggle="tab">组合分配</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <!-- 量表分配 -->
                    <div role="tabpanel" class="tab-pane fade active in" id="home" aria-labelledby="home-tab">
                        <div class="row mt20" style="margin-left: 0px; margin-bottom: 10px;">
                            <!-- 量表名称 -->
                            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
                                <select class="form-control" data-placeholder="请选择量表类别..." id="Sel_AmountType"></select>
                            </div>
                            <div class="col-md-2 col-sm-12 col-xs-12 nopl" style="margin-top: 5px;">
                                <input type="text" class="form-control" id="GaugeName" placeholder="量表名称">
                            </div>
                            <%-- <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
                                <select class="form-control" id="Amount_Source">
                                    <%--<option value="0">量表分类</option>--%>
                            <%-- <option value="1">系统量表</option>

                                    <option value="3">自编量表</option>
                                </select>
                            </div>--%>
                            <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">
                                <button class="btn btn-primary btn-sm pull-left" id="select" type="button" style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 21px; font-size: 14px"><i class="fa fa-search "></i>查询</button>
                            </div>
                        </div>
                        <!-- 报告列表 -->
                        <div class="col-md-12 col-sm-12 col-xs-12 nopl mt10">
                            <!-- Advanced Tables -->
                            <div class="table-responsive">
                                <div id="tableGrid_wrapper" class="dataTables_wrapper no-footer">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="DataTables-Gauge" role="grid" aria-describedby="tableGrid_info">
                                        <thead>
                                            <tr role="row">
                                                <th class="text-center sorting_disabled" style="width: 13px;" rowspan="1" colspan="1">
                                                    <input type="checkbox" id="allCheck"></th>
                                                <th class="text-center sorting_disabled" style="width: 80px;" rowspan="1" colspan="1">序号</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 344px;">量表名称</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 236px;">显示名称</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 236px;">量表类别</th>
                                                <th class="text-center sorting_disabled" style="width: 77px;" rowspan="1" colspan="1">题数</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 200px;">适用人群</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 140px;">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                    <div class="dataTables_info" id="tableGrid_info" role="status" aria-live="polite" style="margin-bottom: 5px;">
                                        <button class="btn btn-or w_radius" name="QX_DeletesUser" onclick="GetDistributionTable()" data-toggle="modal" data-target=".x_dels"><i class="icon iconfont">&#xebec;</i> 分配量表</button>
                                    </div>
                                </div>
                            </div>
                            <!--End Advanced Tables -->
                        </div>
                    </div>
                    <!-- 组合分配 -->
                    <div role="tabpanel" class="tab-pane fade" id="profile" aria-labelledby="profile-tab">
                        <div class="col-md-12 col-sm-12 col-xs-12 nopr mt20">
                            <button class="btn btn-primary btn-sm pull-right" name="QX_SelectUser" type="button"
                                onclick="AddTeam()"
                                style="border: 1px solid #f9906f; color: #f9906f; padding: 5px 13px; font-size: 14px">
                                + 新建组合</button>
                        </div>
                        <!-- 报告列表 -->
                        <div class="col-md-12 col-sm-12 col-xs-12 nopl mt20 nopr">
                            <!-- Advanced Tables -->
                            <div class="table-responsive">
                                <div id="tableGrid_wrapper" class="dataTables_wrapper no-footer">
                                    <table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableGrid" role="grid" aria-describedby="tableGrid_info">
                                        <thead>
                                            <tr role="row">
                                                <th style="display: none"></th>
                                                <th class="text-center sorting_disabled" style="width: 13px; display: none" rowspan="1" colspan="1">
                                                    <input type="checkbox" id="acAllCheck"></th>
                                                <th class="text-center sorting_disabled" style="width: 80px;" rowspan="1" colspan="1">序号</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 300px;">组合名称</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 650px;">量表名称</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 120px;">量表个数</th>
                                                <th class="text-center sorting_disabled" rowspan="1" colspan="1" style="width: 400px;">操作</th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <%-- <div class="dataTables_info" id="tableGrid_info" role="status" aria-live="polite" style="margin-bottom: 5px;display:none">
                                        <button class="btn btn-or w_radius" name="QX_DeletesUser" data-id="57" onclick="u_deletes()" data-toggle="modal" data-target=".x_dels"><i class="icon iconfont">&#xebec;</i> 分配组合</button>
                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main结束 -->
    </div>
    <!-- 查看量表弹窗 -->
    <div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 100%">
                <h4 class="modal-title text-center xia_title">量表预览
                </h4>
                <div class="modal-body">
                    <div class="row" id="ListQuestionPanel">

                        <div class="row" style="text-align: center;">
                            <h4 id="AmountNameHtm">XX自编量表</h4>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <h4 id="textarea_Guidance"></h4>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <%-- <button type="button" class="btn btn-info" onclick="onprint()" style="display: none">
                        打印
                    </button>--%>
                    <button type="button" class="btn btn-info" id="export">
                        导出
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        关闭
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 修改名称弹窗 -->
    <div class="modal fade x_plzy" id="editAmountCombination" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">修改名称
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label mt5 nopr ml50">*组合名称：&nbsp;</label>
                            <div class="col-sm-6 col-xs-6 nopl">
                                <input id="editAmountCombinationID" class="form-control" type="text" style="display: none" />
                                <input class="form-control f16" id="editName" onkeyup="checkName(this,2)" onblur="checkName(this,2)" />
                            </div>
                        </div>
                    </div>
                    <span style="margin-left: 160px; color: #a94442; display: none" id="nameApeat2">名称重复，请重新输入</span>
                    <div class="row" style="margin-top: 80px; margin-bottom: 10px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditAmountCombinationValue()" type="button" class="btn btn-sm x_btn f14" data-toggle="modal" data-target=".x_plzy_sure">确定</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 新建组合弹窗 -->
    <div class="modal fade x_xjzh" id="addAmountCombination" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">新建组合
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label mt5 nopr ml50">*组合名称：&nbsp;</label>
                            <div class="col-sm-6 col-xs-6 nopl">
                                <input class="form-control f16" id="addAmountCombinationName" maxlength="20" onkeyup="checkName(this,1)" onblur="checkName(this,1)">
                            </div>
                        </div>
                    </div>
                    <span style="margin-left: 160px; color: #a94442; display: none" id="nameApeat1">名称重复，请重新输入</span>
                    <div class="row" style="margin-top: 80px; margin-bottom: 10px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="addAmountCombination()" type="button" class="btn btn-sm x_btn f14" data-toggle="modal" data-target=".x_plzy_sure">确定</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 删除组合弹窗 -->
    <div class="modal fade x_del in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 50%; width: 100%">
                <h4 class="modal-title text-center xia_title">提示
                </h4>
                <div class="modal-body">
                    <div class="row">
                        <p class="f16 c666 pl30 pr20 mt15 pb50">您确定删除改组合吗？删除后该成员对应的数据也将一起删除。</p>
                    </div>
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">确定</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- 编辑量表弹窗 -->
    <div class="modal fade in x_bianji" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 100%">
                <h4 class="modal-title text-center xia_title">量表组合
                </h4>
                <div class="modal-body pl50" style="padding-left: 0px; padding-top: 0px; padding-right: 0px;">
                    <div class="row pl50">
                        <h4 class="f16 tl pl15 fb zhuse">认识自我</h4>
                    </div>
                    <div class="x_nr pl30 pr30 mt20">
                        <form>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    诚信问卷
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    诚信问卷
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    诚信问卷
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    诚信问卷
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    诚信问卷
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    诚信问卷
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox">
                                    诚信问卷
                                </label>
                            </div>
                            <div class="checkbox laxt_checkbox">
                                <label>
                                    <input type="checkbox">
                                    全选
                                </label>
                            </div>
                        </form>
                    </div>
                    <div class="row" style="margin-top: 20px; margin-right: 0px; margin-left: 0px;">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="EditRoleValue()" type="button" class="btn btn-sm x_btn f14">导出</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade in x_bianji" id="showAmountList" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content" style="width: 100%">
                <h4 class="modal-title text-center xia_title">量表组合
                </h4>
                <div class="modal-body pl50" id="showContainAmount" style="padding-left: 0px; padding-top: 0px; padding-right: 0px;">
                    <div id="page-wrapper" style="margin-left: 0px; padding-left: 0px; padding-right: 0px; padding-top: 0px; padding-bottom: 0px;">
                        <div id="page-inner">

                            <div>
                                <div class="row" style="margin-bottom: 5px;">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="col-md-3 col-xs-6">
                                            <input data-id="0" type="checkbox" class="col-md-offset-1" id="AllID" />全选
                                        </div>


                                    </div>
                                </div>

                                <div class="row" id="amountAllCheck">
                                    <div class="col-md-12">
                                        <div id="funPanel" class="panel-group">

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="panel panel-default" id="Boday">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" style="margin-top: 20px; padding: 0px; margin-right: 0px; margin-left: 0px;">
                        <div class="col-sm-6  col-xs-6 text-right">
                            <button onclick="AddRoleFun()" type="button" class="btn btn-sm x_btn f14">保存</button>
                        </div>
                        <div class="col-sm-2  col-xs-3  text-right">
                            <button type="button" class="btn btn-sm x_btn1 f14" data-dismiss="modal">取消</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <script src="../../JS/jquery.metismenu.js"></script>
    <script src="../../JS/custom-scripts.js"></script>
    <!-- 左侧下拉框 Js 结束 -->
    <!-- Bootstrap Js -->
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/ExtendJS.js"></script>
    <script>
        window.SetCheckAll();
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                $('#select').click();
            }
        });
        var navName = '/FunctionModular/Heartevaluation/Heartevaluation.aspx';
        //$("#main-menu").find("a[class='active-menu']").removeClass("active-menu")
        //$("#LBGL").addClass('active-menu');
        initSelectInput("Remark=AmountType", "Sel_AmountType", "--请选择量表类别--");//初始化量表类别
        var Starindex = 0;
        var Endindex = 0;
        getselect();
        var endIndex = 0;
        var startIndex = 0;
        /*列表展现部分 */

        /*
               创建时间：2016-09-07
               创建人：刘玉京
               功能介绍：加载量表列表集合
       */
        var Amount_TypeID = 0; //量表类别
        var Amount_Name = "";
        var Amount_Source = 0;
        var Amount;
        function getselect() {
            if (Starindex == 0) {
                Starindex = 0;//开始条数索引
            }
            if (Endindex == 0) {
                Endindex = 10;//结束条数索引
            }

            Amount_TypeID = $("#Sel_AmountType").val(); //量表类别
            Amount_Name = $("#GaugeName").val();
            Amount_Source = 0;// $("#Amount_Source").val();

            if (Amount != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }

            Amount = $('#DataTables-Gauge').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                //bStateSave: true,  
                fnDrawCallback: function (oSettings) {
                },
                //aoColumnDefs: [
                //    { //隐藏列
                //        bVisible: false,
                //        aTargets: [0]
                //    }, { //隐藏列
                //        bVisible: false,
                //        aTargets: [4]
                //    }
                //],
                ajax: {
                    method: 'get',
                    url: "Ajax/HeartEvaluation.ashx",
                    dataSrc: "data",
                    data: function (d) {
                        if (d.start == 0) {
                            Endindex = d.length;
                            if (Endindex == 10) {
                                Starindex = 0;
                            }
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'type=init&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&Amount_Name=' + Amount_Name + '&Amount_TypeID=' + Amount_TypeID + '&Amount_Source=0';
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    $('#allCheck').attr("checked", false);
                    var J_SourceStr = "";
                    if (data[0] == "LB_15030407954270") {
                        //气质量表
                        data[10] = 100;
                    } else if (data[0] == "LB_15030365064460")//强迫
                    {
                        data[10] = 100;
                    }
                    J_SourceStr += "   <div style=\"margin-bottom:0px;\" class=\"progress progress-striped active\"><div class=\"progress-bar progress-bar-primary\" role=\"progressbar\" aria-valuenow=\"" + data[10] + "\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: " + data[10] + "%\"><span data-name='" + data[10] + "' class=\"sr-only\">" + data[10] + "% Complete (success)</span></div></div>   ";

                    var Y_SourceStr = "";
                    Y_SourceStr += " <div style=\"margin-bottom:0px;\" class=\"progress progress-striped\">";
                    Y_SourceStr += "    <div class=\"progress-bar progress-bar-danger\" role=\"progressbar\" aria-valuenow=\"100\" aria-valuemin=\"0\" aria-valuemax=\"100\" style=\"width: 100%\">";
                    Y_SourceStr += "     <span data-name='" + data[10] + "' class=\"sr-only\">100% Complete</span>";
                    Y_SourceStr += "    </div>";
                    Y_SourceStr += " </div>";
                    if (data[10] == 100) {
                        $('td:eq(8)', row).html(Y_SourceStr);
                    } else {
                        $('td:eq(8)', row).html(J_SourceStr);
                    }
                    $('td:eq(0)', row).html(" <input type='checkbox' id='" + data[0] + "' name='checkboxname'  value='" + data[0] + "' class='childCheck' />");
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    if (data[0] == "LB_14943307579630" || data[0] == "LB_15131477237610") {
                        $('td:eq(2)', row).css("font-weight", "bold");
                    }
                    $('td:eq(2)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(7)', row).css("text-align", "center");
                    $('td:eq(9)', row).css("text-align", "center");
                    var operation = "";
                    if (data[0] != "LB_14943307579630") {
                        operation = " <button  href=\"javascript:;\" name=\"QX_LookAmount\" class=\"btn btn-link \" onclick=\" AmountPreview('" + data[0] + "')\" >查看</button>"
                    }
                   
                    if (data[12] == '5730154747404') {
                        //operation += "<button href=\"javascript:;\" name=\"QX_AmountUpdate\" onclick=\"UpdateEvaluation('" + data[0] + "','" + data[9] + "')\"class=\"btn btn-link \">修改</button>"

                        //operation += " <button  href=\"javascript:;\" name=\"QX_DelAmount\" class=\"btn btn-link \" onclick=\"DelAmount('" + data[0] + "','" + data[13] + "','" + data[3] + "')\" >删除</button>";
                    } else {
                        //if (data[8] == "自编量表") {
                        //operation += "<button href=\"javascript:;\" name=\"QX_AmountUpdate\" onclick=\"UpdateEvaluation('" + data[0] + "','" + data[9] + "')\"class=\"btn btn-link \">修改</button>"

                        //operation += " <button  href=\"javascript:;\" name=\"QX_DelAmount\" class=\"btn btn-link \" onclick=\"DelAmount('" + data[0] + "','" + data[13] + "','" + data[3] + "')\" >删除</button>";
                        //}
                    }
                    $('td:eq(7)', row).html(operation);
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
                    //$("#DataTables-Gauge_info").css("margin-bottom", "5px");
                    //var htmls = "";
                    //htmls += " ";
                    //$("#DataTables-Gauge_info").html(htmls);
                    //GetFunction();
                }
            });

        }

        //单击勾选状态
        //全选的时候把checked给选中--全选勾选状态
        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/HeartAttribute.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                    });
                }
            });
        }

        function DelAmount(_ACode, _AId, _AName) {
            layer.confirm('您确定将该量表放入回收站吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {

                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluation.ashx",
                    data: {
                        type: "DelAmount",
                        ACode: _ACode,
                        AId: _AId,
                        AName: _AName
                    },//要执行查询的数据参数
                    success: function (msg) {
                        if (msg > 0) {
                            layer.msg('删除成功', { time: 3000, icon: 1 });
                            if (Amount != undefined) {
                                $("#DataTables-Gauge").DataTable().draw(false);

                                return;
                            }
                        } else {
                            layer.msg('删除失败', { time: 3000, icon: 1 });
                        }
                        //$.each(eval(msg), function (index, item) {
                        //    $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                        //});
                        //$("#" + controlname).attr("multiple", false);

                        //$("#" + controlname).selectpicker('refresh');

                    }
                });

            });

        }

        /*-----初始化下拉列表公共方法END-----*/

        //分配量表
        var U_IDs = "";
        function CheckboxID(checkid, speed) {
            var U_ID = checkid;

            U_IDs += ss + ",";

            $("#Ahidden").val(U_IDs);
            alert($("#Ahidden").val())
        }
        function GetDistributionTable() {
            var checkArray = window.GetCheckedCheckBox();
            var checkStr = '';
            for (var i = 0; i < checkArray.length; i++) {
                if (i == checkArray.length - 1) {
                    checkStr += $(checkArray[i]).val();
                } else {
                    checkStr += $(checkArray[i]).val() + ',';
                }
            }
            localStorage.setItem("Acode", checkStr);
            if (checkArray.length > 0) {
                location.href = "../HeartEvaluation_DistributionRecord/DistributionGauges.aspx";
            } else {
                layer.alert('选择要分配的量表！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
            }
            //}

        }

        $(document).on("click", "#select", function () {

            Amount_Name = $("#GaugeName").val();
            Amount_TypeID = $("#Sel_AmountType").val();
            Amount_Source = $("#Amount_Source").val();
            $('#allCheck').attr("checked", false);
            if (Amount != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
        });

        /*---------------修改量表-----------*/
        function UpdateEvaluation(A_Code, loginName) {
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=JundgeIsAlter",
                type: "GET",
                data: { loginName: loginName },
                dataType: "text",
                success: function (data) {
                    if (data == "True") {
                        window.location.href = "HeartEvaluationUpdate.aspx?spam=" + generateMixed(18) + "&id=" + A_Code;
                    }
                    else {
                        layer.alert('您无此量表的修改权限，操作无效！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        });
                    }
                }
            })

        }

        /*-------------------产生随机数-------------------*/
        var chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

        function generateMixed(n) {
            var res = "";
            for (var i = 0; i < n ; i++) {
                var id = Math.ceil(Math.random() * 35);
                res += "_" + chars[id];
            }
            return res;
        }
        //alert(generateMixed(14));
        /*--------获取URL中的参数-------*/
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }

        function OnloadAmount(id) {
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "InitAmount",
                    a_id: id
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        var objEntity = eval(msg);
                        if (objEntity != null) {
                            $("#textarea_Guidance").html(objEntity[0].AmountGuidance);
                            $("#AmountNameHtm").html(objEntity[0].AmountDisName);
                        }
                        var WD_str = "";
                        for (var k = 0; k < objEntity.length; k++) {
                            if (WD_str == "") {
                                WD_str += "'" + objEntity[k].DimensionCode + "'";
                            } else {
                                WD_str += ",'" + objEntity[k].DimensionCode + "'";
                            }
                        }

                        OnloadSubjectInfo(WD_str, id);//加载题干 题支信息
                    }
                }
            });
        }
        /*------加载题干信息----------*/
        function OnloadSubjectInfo(WD_str, id) {
            var wcode = WD_str.replace(/\s/g, "").replace(/\'/g, "");
            //if (wcode != "" && wcode.length != 0) {
            //    $.ajax({
            //        type: "POST",
            //        url: "Ajax/HeartEvaluationUpdate.ashx",
            //        data: {
            //            Remark: "GetSubjectMessage",
            //            WD_Str: WD_str
            //        },//要执行查询的数据参数
            //        success: function (msg) {
            //            //  alert(msg);
            //            subjectListJson = msg;

            //            if (subjectListJson != "") {

            //                var jsonListArr = eval("[" + subjectListJson + "]");
            //                if (jsonListArr != null && jsonListArr.length > 0) {

            //                    for (var i = 0; i < jsonListArr.length; i++) {

            //                        UpdateDrawQuestion(i + 1, jsonListArr[i].TG_Info.TG_Content, jsonListArr[i].TZ_List, jsonListArr[i].TG_Info.TG_Code);
            //                    }
            //                }
            //            }


            //            //$("#textarea_Guidance").val(msg);
            //        }
            //    });
            //} else {
            //Update_Sub
            // alert(wcode);
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "Update_Sub",
                    lb_code: id
                },//要执行查询的数据参数
                success: function (msg) {
                    //  alert(msg);

                    if (msg != "") {
                        subjectListJson = msg;
                        if (subjectListJson != "") {
                            if (id == "LB_14814373314360") {
                                var jsonListArr = eval("[" + subjectListJson + "]");
                                if (jsonListArr != null && jsonListArr.length > 0) {

                                    for (var i = 0; i < jsonListArr.length; i++) {

                                        RWUpdateDrawQuestion(jsonListArr[i].TG_Info.TG_Sort, jsonListArr[i].TG_Info.TG_Content, jsonListArr[i].TZ_List, jsonListArr[i].TG_Info.TG_Code);
                                    }
                                }
                            } else {
                                var jsonListArr = eval("[" + subjectListJson + "]");
                                if (jsonListArr != null && jsonListArr.length > 0) {

                                    for (var i = 0; i < jsonListArr.length; i++) {

                                        UpdateDrawQuestion(jsonListArr[i].TG_Info.TG_Sort, jsonListArr[i].TG_Info.TG_Content, jsonListArr[i].TZ_List, jsonListArr[i].TG_Info.TG_Code);
                                    }
                                }
                            }
                        }
                    } else {
                        New_UpdateDrawQuestion(1);
                    }
                }
            });

            //}
        }
        /*-----------------绘制题干框架结构--------------*/
        function UpdateDrawQuestion(FewQuestion, TG_T, tzlist, TGCode) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title\">"
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">" + FewQuestion + ".&nbsp;" + TG_T + "</a>"
            //+ "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return Update_addQuestion();\">[添加新题]</a></label>"
           // + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" onclick=\"CopyAddQuestion('" + FewQuestion + "');\"  >[复制本题]</a></label>"
            //+ "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return UpDel_Operation('" + FewQuestion + "','" + TGCode + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            //+ "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return Update_Btn_Operation('" + FewQuestion + "','" + TGCode + "');\">[修改]</a></label>"
            + "</h4>"
            + "</div>";

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var P_Body = ""
            + "    <div id=\"Body_" + FewQuestion + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var P_Content = ""
            + "<div id=\"Content_" + FewQuestion + "\" class=\"panel-collapse in\" tyle=\"height: auto;\">"
            + P_Body
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var ShellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + FewQuestion + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div>" + P_Title + P_Content + " </div></div></div>";
            $("#ListQuestionPanel").append(ShellHtml);
            //var StemTitle = "";
            //StemTitle = UpdateQuestionContent(FewQuestion, TG_T);//给题目外壳的标题赋值
            //$("#Body_" + FewQuestion).append(StemTitle);

            //alert(tzlist.length);

            if (tzlist != null && tzlist.length > 0) {

                for (var p = 0; p < tzlist.length ; p++) {

                    var ProblemContent = "";
                    ProblemContent = UpdateShowProblemContent(FewQuestion, p, tzlist[p].TZ_Num, tzlist[p].TZ_Con, tzlist[p].TZ_Val);
                    //ProblemContent = GetUpdateProblemContent(p, tzlist[p].TZ_Num, tzlist[p].TZ_Con, tzlist[p].TZ_Val);//获取题支内容
                    $("#Body_" + FewQuestion).append(ProblemContent);
                }
            }
        }
        ///*根据json展现当前题干的题支部分[绘画题支内容]*/
        function UpdateShowProblemContent(T_Faw, T_Faw_Con, num, option, C_val) {
            var ProblemContent = ""
            + "<div class=\"row\" >"
            + "    <div class=\"col-md-12 col-xs-12 col-sm-12\" >"
            + "            <div class=\"radio\">"
            + "                 <label><div class=\"Divradio\">"
            
            + "                       <input type=\"radio\" name=\"options_" + T_Faw + "\" id=\"options_" + T_Faw + "_" + T_Faw_Con + "\" ></div>" + num + "、<label style=\"color:#101010;\">" + option + "</label>"
            + "                 </label>"
            + "           </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }
        function RWUpdateShowProblemContent(T_Faw, T_Faw_Con, num, option, C_val) {
            var ProblemContent = ""
            + "<div class=\"row\" >"
            + "    <div class=\"col-md-12 col-xs-12 col-sm-12\" >"
            + "            <div class=\"radio\">"
            + "                 <label><div class=\"Divradio\">"
            + "                       <input type=\"radio\" name=\"options_" + T_Faw + "\" id=\"options_" + T_Faw + "_" + T_Faw_Con + "\" ></div>" + num + "、<label style=\"color:#101010;\"><img src=" + option + " /></label>"
            + "                 </label>"
            + "           </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }
        function New_UpdateDrawQuestion(FewQuestion) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title\">"
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">第[<input class=\"\" name=\"\"   id=\"TH_" + FewQuestion + "\" style=\"height: 20px; width:40px;\" value=\"" + FewQuestion + "\" placeholder=\"题号\" />]题</a>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return Update_addQuestion();\">[添加新题]</a></label>"
            //+ "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" style=\"color:#999\" disabled=\"disabled\">[复制本题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return Del_Operation('" + FewQuestion + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return New_Btn_Operation('" + FewQuestion + "');\">[确定]</a></label>"
            + "</h4>"
            + "</div>";

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var P_Body = ""
            + "    <div id=\"Body_" + FewQuestion + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var P_Content = ""
            + "<div id=\"Content_" + FewQuestion + "\" class=\"panel-collapse in\" tyle=\"height: auto;\">"
            + P_Body
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var ShellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + FewQuestion + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + P_Title + P_Content + " </div></div></div>";
            $("#ListQuestionPanel").append(ShellHtml);
            var StemTitle = "";
            StemTitle = GetQuestionContent(FewQuestion);//给题目外壳的标题赋值
            $("#Body_" + FewQuestion + "").empty();
            $("#Body_" + FewQuestion + "").append(StemTitle);
            //alert($("#Body_" + FewQuestion + "").id);
            //$("#Body_" + FewQuestion + "").append("000000000");
            var ProblemContent = "";
            ProblemContent = NewAddUpdateGetProblemContent(FewQuestion);//GetProblemContent(FewQuestion, FewQuestion);//获取题支内容



            $("#Body_" + FewQuestion + "").append(ProblemContent);
            //$("#Body_" + FewQuestion + "").append("11111111111");


            //$("#textarea_Guidance").val(ProblemContent);
            //textarea_Guidance


            // alert(FewQuestion);
        }
        /*---------瑞文题干显示-------------*/
        function RWUpdateDrawQuestion(FewQuestion, TG_T, tzlist, TGCode) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title\">"
           // + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">" + FewQuestion + ".&nbsp;" + TG_T + "</a>"
           + "" + FewQuestion + "<img src=" + TG_T + " data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">"

          + "</h4>"

            + "</div>";

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var P_Body = ""
            + "    <div id=\"Body_" + FewQuestion + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var P_Content = ""
            + "<div id=\"Content_" + FewQuestion + "\" class=\"panel-collapse in\" tyle=\"height: auto;\">"
            + P_Body
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var ShellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + FewQuestion + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div>" + P_Title + P_Content + " </div></div></div>";
            $("#ListQuestionPanel").append(ShellHtml);
            //var StemTitle = "";
            //StemTitle = UpdateQuestionContent(FewQuestion, TG_T);//给题目外壳的标题赋值
            //$("#Body_" + FewQuestion).append(StemTitle);

            //alert(tzlist.length);

            if (tzlist != null && tzlist.length > 0) {

                for (var p = 0; p < tzlist.length ; p++) {

                    var ProblemContent = "";
                    ProblemContent = RWUpdateShowProblemContent(FewQuestion, p, tzlist[p].TZ_Num, tzlist[p].TZ_Con, tzlist[p].TZ_Val);
                    //ProblemContent = GetUpdateProblemContent(p, tzlist[p].TZ_Num, tzlist[p].TZ_Con, tzlist[p].TZ_Val);//获取题支内容
                    $("#Body_" + FewQuestion).append(ProblemContent);
                }
            }
        }
        /*----------绘画题干标题-------------------*/
        function GetQuestionContent(T_Faw) {
            var StemTitle = ""
            + "<div class=\"row\" id=\"Prot_F_" + T_Faw + "\"> "
            + "    <div class=\"col-md-12\">"
            + "        <div class=\"form-group input-group\">"
            + "            <input type=\"text\" class=\"form-control\" id=\"Prot_" + T_Faw + "\" style=\"height: 34px;\" placeholder=\"请填写题目标题\" />"
            + "            <span class=\"input-group-btn\">"
            + "                <button class=\"btn btn-default\" type=\"button\">"
            + "                    <i class=\"fa fa-file-image-o\"></i>"
            + "                </button>"
            + "            </span>"
            + "        </div>"
            + "    </div>"
            + "</div>"
            return StemTitle;
        }

        /*---------绘画题支内容------------------*/
        function NewAddUpdateGetProblemContent(T_Faw) {
            var TZ_Con = $("input[name='Code_" + T_Faw + "']").length;
            var ProblemContent = ""
            + "<div class=\"row\" style=\"padding-top: 5px;\" id=\"row_" + T_Faw + "_" + TZ_Con + "\">"
            //+ "<input type=\"hidden\" id=\"\" value=\"\" />";
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\" style=\"margin-bottom: 15px;\">"
            + "        <input class=\"form-control\" name=\"Code_" + T_Faw + "\" id=\"Code_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"编号\" />"
            + "    </div>"
            + "    <div class=\"col-md-9 col-xs-12 col-sm-9\">"
            + "        <div class=\"form-group input-group\">"
            + "            <input type=\"text\" class=\"form-control\" name=\"Con_" + T_Faw + "\" id=\"Con_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"选项内容\" />"
            + "            <span class=\"input-group-btn\">"
            + "                <button class=\"btn btn-default\" type=\"button\">"
            + "                    <i class=\"fa fa-file-image-o\"></i>"
            + "                </button>"
            + "            </span>"
            + "        </div>"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <input onkeyup=\"onlyNumber(this)\"  onblur=\"onlyNumber(this)\" class=\"form-control\" name=\"Fra_" + T_Faw + "\" id=\"Fra_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"分值\" />"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\" onclick=\"return Newaddopt('" + T_Faw + "','" + TZ_Con + "');\"  style=\"float: right\">"
            + "                <i class=\"fa fa-plus\" style=\"color: green;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\"  onclick=\"return delopt('" + T_Faw + "_" + TZ_Con + "');\" style=\"float: right\">"
            + "                <i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }
        function AmountPreview(id) {
            $("#ListQuestionPanel").find("[name=QuestionPanel]").remove();
            OnloadAmount(id);
            $("#myModal").modal('show');

        }
        function printHtml(html) {
            document.body.innerHTML = html;
            window.print();
        }
        function onprint() {
            var html = $("#ListQuestionPanel").html();
            printHtml(html);
        }
        function AddNewAmount() {
            window.location.href = "HeartEvaluationCustomAdd.aspx";
        }
        $(document).ready(function () {
            $("#export").click(function (event) {
                $(".collapsed").removeAttr("href");
                //$("[type=radio]").attr("style", "display:none");
                var AmountNameHtm = $("#AmountNameHtm").html();
                if (AmountNameHtm == "瑞文标准推理测验") {
                    window.open("瑞文标准推理测验.docx");
                    //window.open("http://pan.baidu.com/s/1kUQwYDT");
                } else {
                    //$("#ListQuestionPanel").find("input[type=radio]").attr({ type: "hidden", name: "radios" });
                    $(".Divradio").hide();
                    $("#ListQuestionPanel").wordExport(AmountNameHtm);
                    //$("#ListQuestionPanel").find("input[name=radios]").attr({ type: "radio" });
                    $(".Divradio").show();
                }
            });
        });
        BindGrid();
        var tableGrid;
        var bools;
        function BindGrid() {
            if (startIndex == 0) {
                startIndex = 0;
            }
            if (endIndex == 0) {
                endIndex = 10;
            }
            //roleType = $("#roleType").find("option:selected").val();
            if (tableGrid != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }

            tableGrid = $('#tableGrid').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                clickToSelect: true,
                bLengthChange: false,
                ajax: {
                    method: 'get',
                    url: "Ajax/HeartEvaluation.ashx?type=Bind",
                    async: false,
                    dataSrc: "data",
                    data: function (d) {

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        if (bools == "true" && bools != "undefined") {
                            if (d.start == 0) {
                                //if (Endindex == 10) {
                                endIndex = d.length;
                                if (endIndex == 10) {
                                    startIndex = 0;
                                }
                            } else {
                                startIndex = d.start + 1;
                                endIndex = d.start + d.length;
                            }
                        }
                        bools = "true";
                        return 'StartPageIndex=' + startIndex + '&EndPageIndex=' + endIndex;
                    }
                },

                createdRow: function (row, data, dataIndex) {
                    var operation = "";
                    operation = " <button class=\"btn btn-link\" data-mark='editAmount' data-text='"+data[6]+"'>编辑量表</button>"
                   + " <button class=\"btn btn-link\" data-mark='editAmountCombination'>修改组合</button>"
                   + " <button  class=\"btn btn-link\"  data-mark='deleteAmountCombination'>删除组合</button>" +
                        "<button class='btn btn-link' data-mark ='distributeCombination'>分配组合</button>";
                    var ck = "<input type='checkbox' data-id=" + data[0] + "/>";
                    $("td:eq(0)", row).hide();
                    $("td:eq(1)", row).append(ck);
                    $("td:eq(1)", row).hide();
                    $("td:eq(1)", row).css("text-align", "center")
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

                }
            });

        }
        //验证组合名称格式和是否重复
        function checkName(obj, index) {
            $('#nameApeat' + index).css('display', 'none');
            var id = obj.getAttribute('id');

            var reg = /^(?!.*?[\~\`\ \·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;

            if (trim($("#" + id).val()) == "") {
                $('#nameApeat' + index).html('请输入组合名称！');
                $('#nameApeat' + index).css('display', 'block');
                //layer.alert('请输入组合名称！', {
                //    skin: 'layui-layer-lan', //样式类名
                //    closeBtn: 0
                //}
                //);
                return;
            }
            if (!reg.test($("#" + id).val())) {
                $('#nameApeat' + index).html('组合名称不能包含特殊字符！');
                $('#nameApeat' + index).css('display', 'block');
                //layer.alert('组合名称不能包含特殊字符', {
                //    skin: 'layui-layer-lan',
                //    closeBtn: 0
                //});
                return;
            }
            var txt = $("#" + id).val();
            if (txt.length > 20) {
                var a = $(this).find("[data-bv-for=" + id + "]");
                txt = txt.substring(0, 20);
                $("#" + id).val(txt);
                $("small[data-bv-for=" + id + "]").text('');
                $("#" + id).css("border-color", "#2b542c");
                $('[data-bv-icon-for=' + id + ']i').css('display', 'none');
            }
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=JudgeAmountCombinationName",
                type: "GET",
                data: { acName: $("#" + id).val(), acID: 0 },
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data.trim() == "True") {
                        $('#nameApeat' + index).html('名称重复，请重新输入！');
                        $('#nameApeat' + index).css('display', 'block');
                        //layer.alert('该组合名称已存在！', {
                        //    skin: 'layui-layer-lan',
                        //    closeBtn: 0

                        //});
                        return;
                    }
                }
            });
        }
        //添加量表组合
        function addAmountCombination() {

            var reg = /^(?!.*?[\~\`\ \·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;

            if (trim($("#addAmountCombinationName").val()) == "") {
                $('#nameApeat1').html('请输入组合名称！');
                $('#nameApeat1').css('display', 'block');
                //layer.alert('请输入组合名称！', {
                //    skin: 'layui-layer-lan', //样式类名
                //    closeBtn: 0
                //}
                // );
                return;
            }
            if (!reg.test($("#addAmountCombinationName").val())) {
                $('#nameApeat1').html('组合名称不能包含特殊字符！');
                $('#nameApeat1').css('display', 'block');
                //layer.alert('组合名称不能包含特殊字符', {
                //    skin: 'layui-layer-lan',
                //    closeBtn: 0
                //});
                return;
            }
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=JudgeAmountCombinationName",
                type: "GET",
                data: { acName: $("#addAmountCombinationName").val(), acID: 0 },
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data.trim() == "True") {
                        $('#nameApeat1').html('名称重复，请重新输入！');
                        $('#nameApeat1').css('display', 'block');
                        //layer.alert('该组合名称已存在！', {
                        //    skin: 'layui-layer-lan',
                        //    closeBtn: 0

                        //});
                        return;
                    }
                    else {
                        $.ajax({
                            url: "Ajax/HeartEvaluation.ashx?type=AddAmountCombination",
                            type: "GET",
                            data: { acName: $("#addAmountCombinationName").val() },
                            dataType: "text",
                            success: function (data) {
                                if (data) {
                                    $('#addAmountCombination').modal('hide');
                                    layer.msg('保存成功！',
                                        { time: 2000, icon: 6 }, function () {
                                            layer.closeAll('dialog');
                                            $("#tableGrid").dataTable().fnDraw(false);
                                            $(".modal-backdrop").remove();
                                        })
                                    $("#addAmountCombinationName").val("");
                                }
                                else {
                                    layer.alert('添加失败!', {
                                        skin: 'layui-layer-lan', //样式类名
                                        closeBtn: 0
                                    }, function () {
                                        layer.closeAll('dialog');
                                        $('#addAmountCombination').modal('hide');
                                        $(".modal-backdrop").remove();
                                    }
                    );
                                }
                            },
                            error: function (data) {
                                alert("返回值失败");
                            }
                        })
                    }
                }
            })
        }
        //显示添加组合的遮罩弹框
        function AddTeam() {
            $('#nameApeat1').css('display', 'none');
            $('#addAmountCombinationName').val('');
            $("#addAmountCombination").modal("show");
        }
        $(document).on("click", "[data-mark='editAmount']", function () {
            //$('#amountAllCheck').find('[type=checkbox]').each(function (i,item)
            //{
            //    $('#amountAllCheck').find('[type=checkbox]').eq(i).checked=false;
            //})
            $('#AllID').prop('checked', false);
            var amountCheckBox = $('#amountAllCheck').find('[type=checkbox]');
            //var amountText = $(this).parent().parent().find("td:eq(4)").text().split(',');
            var amountText = $(this).attr('data-text');
            for (var i = 0; i < amountCheckBox.length; i++) {
                amountCheckBox.eq(i).prop('checked', false);
                if (amountCheckBox[i].nextSibling != null && amountText.indexOf(amountCheckBox[i].nextSibling.data) >= 0)
                    amountCheckBox.eq(i).prop('checked', true);
            }
            checkIsAll_BySingelLB();
            acID = $(this).parent().parent().find("td:eq(0)").text();
            $("#showAmountList").modal("show");

        })

        $('#showAmountList').on('shown.bs.modal', function () {
            $("#showContainAmount").scrollTop(0);
        })
        $(document).on("click", "[data-mark='editAmountCombination']", function () {
            $('#nameApeat2').css('display', 'none');
            $(".modal-backdrop").remove();
            $('#editAmountCombination').modal('show');
            $("#editAmountCombinationID").val($(this).parent().parent().find("td:eq(0)").text());
            $("#editName").val($(this).parent().parent().find("td:eq(3)").text());
        })
        /*为空   去除特殊符号*/
        function trim(str) {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }
        //编辑量表组合
        function EditAmountCombinationValue() {
            var acID = $("#editAmountCombinationID").val();
            var acName = $("#editName").val();
            //非法字符
            var reg = /^(?!.*?[\~\`\ \·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;
            if (trim(acName) == "") {
                $('#nameApeat2').html('请输入组合名称！');
                $('#nameApeat2').css('display', 'block');
                //layer.alert('请输入组合名称！', {
                //    skin: 'layui-layer-lan', //样式类名
                //    closeBtn: 0
                //}
                //);
                return;
            }

            if (!reg.test($("#editName").val())) {
                $('#nameApeat2').html('组合名称不能包含特殊字符！');
                $('#nameApeat2').css('display', 'block');
                //layer.alert('组合名称不能包含特殊字符', {
                //    skin: 'layui-layer-lan',
                //    closeBtn: 0
                //});
                return;
            }

            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=JudgeAmountCombinationName",
                type: "GET",
                data: { acName: acName, acID: acID },
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data.trim() == "True") {
                        $('#nameApeat2').html('名称重复，请重新输入！');
                        $('#nameApeat2').css('display', 'block');
                        //layer.alert('该组合名称已存在！', {
                        //    skin: 'layui-layer-lan',
                        //    closeBtn: 0

                        //});
                        return;
                    }
                    else {

                        $.ajax({
                            url: "Ajax/HeartEvaluation.ashx?type=UpdateAmountCombination",
                            dataType: "text",
                            type: "post",
                            data: { acID: acID, acName: acName },
                            success: function (data) {
                                if (data) {
                                    $('#editAmountCombination').modal('hide');
                                    layer.msg('保存成功！', { time: 1000, icon: 6 },
                                        function () {
                                            layer.closeAll('dialog');
                                            $(".modal-backdrop").remove();
                                            $("#editAmountCombinationID").val("");
                                            $("#editName").val("");
                                            $("#addAmountCombinationName").val("");
                                        });
                                    $("#tableGrid").DataTable().draw();
                                }
                                else {
                                    layer.alert('更改失败!', {
                                        skin: 'layui-layer-lan', //样式类名
                                        closeBtn: 0
                                    }
                    );
                                }
                            }

                        }, function () {

                        });
                    }
                }
            })
        }
        $(document).on("click", "[data-mark='distributeCombination']", function () {
            var val = $(this).parent().parent().find("td:eq(0)").text();
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=GetAmountCodeByACID",
                type: "post",
                dataType: "json",
                data: { acID: val },
                success: function (data) {
                    localStorage.setItem("Acode", data);
                    if (data.length > 0) {
                        location.href = "../HeartEvaluation_DistributionRecord/DistributionGauges.aspx";
                    } else {
                        layer.alert('该组合没有任何量表存在，无法进行分配！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        });
                    }
                }
            })
        })
        $(document).on("click", "[data-mark='deleteAmountCombination']", function () {
            var val = $(this).parent().parent().find("td:eq(0)").text();
            layer.confirm('您确定要删除当前组合？', {
                btn: ['是', '否'] //按钮
            }, function () {
                $.ajax({
                    url: "Ajax/HeartEvaluation.ashx?type=DeleteAmountCombination",
                    type: "post",
                    dataType: "text",
                    data: { acID: val },
                    success: function (data) {
                        if (data) {
                            layer.msg('删除成功', { time: 2000, icon: 6 }, function () {
                                layer.closeAll('dialog');
                                $("#tableGrid").dataTable().fnDraw(false);
                            });
                        }
                        else {
                            layer.alert('删除失败!', {
                                skin: 'layui-layer-lan', //样式类名
                                closeBtn: 0
                            }, function () {
                                layer.closeAll('dialog');

                            }
                                 );
                        }
                    }
                })
            })
        })
        var acID = 0;
        LoadAmountType();
        function LoadAmountType() {
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=LoadAmountType",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (index, val) {
                        var firstFuns =
                                "<div class='first'>" +
                                    "<div   class='panel-heading profile-info-name' role='tab' id='headingOne" + index + "'>" +
                                        "<h4 class='panel-title'>" +
                                            "<a data-toggle='collapse' data-parent='#accordion' href='#" + val["AmountTypeID"] + "' aria-expanded='true' aria-controls='collapseOne'>" +
                                                val["AmountTypeName"] +
                        "</a>" +
                        "<input data-id=" + val["AmountTypeID"] + " type='checkbox' class='amountAllCheck col-md-offset-1'/>" +
                    "</h4>" +
                "</div>" +
                "<div id=" + val["AmountTypeID"] + " class='panel-collapse collapse in 'role='tabpanel' aria-labelledby='headingOne'>" +
                    "<div class='panel-body' style='font-size:12px;'>" +
                    "<div class='row' style=\"margin-bottom:10px;\">" +
                                                "<div class='col-md-12'  data-append-id=" + val["AmountTypeID"] + ">"

                        "</div>" +
                                "</div>" +
                            "</div>" +
                        "</div>";
                        $("#Boday").append(firstFuns);
                    });
                    LoadAmount();
                }
            })
        }
        function LoadAmount() {
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=LoadAmount",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (index, val) {
                        var thirdFun = "";
                        thirdFun = "<div class='col-md-2 col-xs-5 pull- right' style='width:123px;'>" +
                                                               "<input class='cancelAllCheck' data-id=" + val["AmountCode"] + " type='checkbox' />" + val["AmountName"] + "" +
                                                           "</div>";
                        $("[data-append-id=" + val["AmountTypeID"] + "]").append(thirdFun);
                    })
                    LoadCheckedAmount();
                }
            })
        }
        $(document).on("click", "#AllID", function () {
            if (this.checked) {
                $("input:checkbox").prop('checked', true)
            } else {
                $("input:checkbox").prop('checked', false)
            }
        });
        $(document).on("click", ".amountAllCheck", function () {
            var arryCheck = $(this).parent().parent().parent().find("input:gt(0)");
            for (var i = 0; i < arryCheck.length; i++) {
                arryCheck[i].checked = $(this)[0].checked;
            }
            var arrayCheck = $(this).parent().parent().parent().parent().find("input");
            var allCheckStatus = true;
            for (var i = 0; i < arrayCheck.length; i++) {
                if (!arrayCheck[i].checked) {
                    allCheckStatus = false;
                    break;
                }
            }
            $("#AllID")[0].checked = allCheckStatus;
        });
        $(document).on("click", ".SecondCheck", function () {
            var arryCheck = $(this).parent().parent().parent().find("input:gt(0)");
            for (var i = 0; i < arryCheck.length; i++) {
                arryCheck[i].checked = $(this)[0].checked;
            }
            var secondArrayCheck = $(this).parent().parent().parent().parent().find(".SecondCheck");
            var secondCheckStatus = true;
            for (var i = 0; i < secondArrayCheck.length; i++) {
                if (!secondArrayCheck[i].checked) {
                    secondCheckStatus = false;
                }
            }
            $(this).parent().parent().parent().parent().parent().parent().find(".amountAllCheck")[0].checked = secondCheckStatus;
            var firstArrayCheck = $(this).parent().parent().parent().parent().parent().parent().parent().find(".amountAllCheck");
            var firstArrayStatus = true;
            for (var i = 0; i < firstArrayCheck.length; i++) {
                if (!firstArrayCheck[i].checked) {
                    firstArrayStatus = false;
                }
            }
            $("#AllID")[0].checked = firstArrayStatus;
        });
        //根据每个量表的选中状态设置量表类型的选中状态，和全选按钮的选中状态
        function checkIsAll_BySingelLB() {
            var firstArr = $('#Boday').find('.first');
            $("#AllID")[0].checked = true;
            for (var i = 0; i < firstArr.length; i++) {
                var second = firstArr.eq(i).find('.cancelAllCheck');
                firstArr.eq(i).find('.amountAllCheck').eq(0)[0].checked = true;
                for (var t = 0; t < second.length; t++) {
                    if (!second.eq(t)[0].checked) {
                        firstArr.eq(i).find('.amountAllCheck').eq(0)[0].checked = false;
                        $("#AllID")[0].checked = false;
                        break;
                    }
                }
            }
        }
        $(document).on("click", ".cancelAllCheck", function () {
            //var arrCheck01 = $(this).parent().parent().find(".SecondCheck");
            if ($(this)[0].checked) {

                //循环该类型下的量表是否全部选中
                var secondCheckStatus = true;//量表类型的复选框选中状态
                var nowType = $(this).parent().parent().find('.cancelAllCheck');
                for (var i = 0; i < nowType.length; i++) {
                    if (!nowType[i].checked) {
                        secondCheckStatus = false;
                        break;
                    }
                }
                $(this).parent().parent().parent().parent().parent().parent().find('.amountAllCheck ').eq(0)[0].checked = secondCheckStatus;
                //循环所有的量表是否被选中
                var firstCheckStatus = true;//全选复选框的选中状态
                var allCheck = $('#Boday').find('.cancelAllCheck');
                for (var i = 0; i < allCheck.length; i++) {
                    if (!allCheck[i].checked) {
                        firstCheckStatus = false;
                        break;
                    }
                }
                $("#AllID")[0].checked = firstCheckStatus;


                //var secondCheckStatus = true;
                //var arrayCheck = $(this).parent().parent().find("input:gt(0)");

                //for (var i = 0; i < arrayCheck.length; i++) {

                //    if (!arrayCheck[i].checked) {
                //        secondCheckStatus = false;
                //        break;
                //    }
                //}
                //$(this).parent().parent().find(".SecondCheck")[0].checked = secondCheckStatus;
                //var secondCheckStatus = true;
                //var secondArrayCheck = $(this).parent().parent().parent().parent().parent().find(".SecondCheck");
                //for (var i = 0; i < secondArrayCheck.length; i++) {
                //    if (!secondArrayCheck[i].checked) {

                //        secondCheckStatus = false;
                //        break;
                //    }
                //}
                //$(this).parent().parent().parent().parent().parent().parent().find(".amountAllCheck")[0].checked = secondCheckStatus;
                //var firstCheckStatus = true;
                //var firstArrayCheck = $(this).parent().parent().parent().parent().parent().parent().parent().find(".amountAllCheck")
                //for (var i = 0; i < firstArrayCheck.length; i++) {
                //    if (!firstArrayCheck[i].checked) {
                //        firstCheckStatus = false;
                //    }
                //}
                //$("#AllID")[0].checked = firstCheckStatus;
            }
            else {
                // $(this).parent().parent().find(".SecondCheck")[0].checked = false;
                $(this).parent().parent().parent().parent().parent().parent().find(".amountAllCheck")[0].checked = false;
                $("#AllID")[0].checked = false;
            }
        })

        function GetQueryStrings(name) {

            var urlarr = window.location.href;
            var urlar = urlarr.split('?');
            var urla = urlar[1].split('/');
            var url = urla[0].split("=");

            var rs = url[1];
            return rs;
            //var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            //var r = window.location.search.substr(1).match(reg);
            //if (rs != null) return unescape(r[2]); return null;
        }
        function AddRoleFun() {
            var arrayCheck = $('input:checkbox[class=cancelAllCheck]:checked');
            var arrayRoleID = [];
            for (var i = 0; i < arrayCheck.length; i++) {
                var data = $(arrayCheck[i]).attr("data-id");
                arrayRoleID.push(data);
            }
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=AddCheckedAmount",
                type: "post",
                dataType: "text",
                data: { arrayACID: JSON.stringify(arrayRoleID), acID: acID },
                success: function (data) {
                    if (data) {
                        layer.msg('保存成功！', { time: 2000, icon: 6 }, function () {
                            $("#showAmountList").modal("hide");
                            $("#tableGrid").dataTable().fnDraw(false);
                        });
                    }
                    else {
                        layer.alert('保存失败！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        }
            );
                    }
                }
            })
        }
        function LoadCheckedAmount() {
            $.ajax({
                url: "Ajax/HeartEvaluation.ashx?type=LoadCheckedAmount",
                type: "GET",
                dataType: "json",
                data: { acID: acID },
                success: function (data) {
                    $.each(data, function (index, item) {
                        $("input:checkbox[data-id=" + item + "]").attr('checked', true);
                    })
                }
            })
        }
    </script>
</asp:Content>
