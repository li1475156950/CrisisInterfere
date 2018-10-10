<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HeartEvaluation_old.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.HeartEvaluation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link rel="shortcut icon" href="favicon.ico" />
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <%--  <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />--%>
    <link href="../../Font-Awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link href="../../CSS/rysz.css" rel="stylesheet" />
    <%-- 李兆典创建 --%>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">心理测验</a></li>
                <li><a href="#">量表管理</a></li>
            </ol>
        </div>
    </div>

    <!-- /. ROW  -->
    <div class="row" style="padding-bottom: 20px">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="form-control" data-placeholder="请选择量表类别..." id="Sel_AmountType"></select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <input type="text" class="form-control" id="GaugeName" placeholder="--量表名称--" />
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <select class="form-control" id="Amount_Source">
                <option value="0">--量表来源--</option>
                <option value="1">系统量表</option>
                <%--   <option value="2">组合量表</option>--%>
                <option value="3">自编量表</option>
            </select>
        </div>

        <div class="col-md-6 col-sm-12 col-xs-12" style="margin-top: 5px; text-align: right;">

            <button class="btn btn-primary btn-sm pull-left" id="select" style="margin-right: 10px;border: 1px solid orange; color: orange;"><i class="fa fa-search "></i>查询</button>

            <button class="btn  btn-sm text-right w_radius" style="border: 1px solid orange; color: orange;" id="QX_AddNewAmount" onclick="AddNewAmount()">+新量表</button>
            <%-- <div class="lb-panel-left pull-right " style="background: #FFF;">
                    <div class="btn-group" style="width: 100%">
                        <button data-toggle="dropdown" class="btn btn-warning dropdown-toggle"><span class="caret"></span></button>
                        <ul class="dropdown-menu" style="text-align: left; min-width: 120px; max-width: 120px;">
                            <li><a href="HeartEvaluationAdd.aspx">维度组合</a></li>
                            <li><a href="HeartEvaluationCustomAdd.aspx">自编量表</a></li>
                        </ul>
                    </div>
                </div> --%>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge" style="width: 100%;">
                    <thead>
                        <tr>
                            <th>量表ID</th>
                            <th style="width: 1%;">
                                <input id="allCheck" type="checkbox" onclick="SelectAll(this);" value="0" /></th>
                            <th class="text-center" style="width: 6%;">序号</th>
                            <th class="text-center" style="width: 10%;">量表名称</th>
                            <th class="text-center">显示名称</th>
                            <th class="text-center" style="width: 10%;">量表类别</th>
                            <th class="text-center" style="width: 7%;">题数</th>
                            <th class="text-center" style="width: 10%;">适用人群</th>
                            <th class="text-center" style="width: 10%;">量表来源</th>
                            <th class="text-center" style="width: 8%">编制人</th>
                            <th class="text-center" style="width: 10%;">量表完成</th>
                            <th class="text-center" style="width: 18%">操作</th>
                        </tr>
                    </thead>
                    <tbody id="lbSource"></tbody>
                </table>

            </div>
            <button type="button" class="btn btn-blues" name="QX_FenPeiAmount" onclick='GetDistributionTable()' style='margin-left: 10px;'><i class="icon-check"></i>分配量表</button>


            <!--End Advanced Tables -->
        </div>
    </div>


    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">量表预览
                    </h4>
                </div>
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
                    <button type="button" class="btn btn-info" onclick="onprint()" style="display: none">
                        打印
                    </button>
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
        <!-- /.modal -->
    </div>


    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <%-- <script src="../../JS/bootstrap-select.min.js"></script>--%>

    <script>


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
        var CheckArray = [];
        function getselect() {
            if (Starindex == 0) {
                Starindex = 0;//开始条数索引
            }
            if (Endindex == 0) {
                Endindex = 10;//结束条数索引
            }

            Amount_TypeID = $("#Sel_AmountType").val(); //量表类别
            Amount_Name = $("#GaugeName").val();
            Amount_Source = $("#Amount_Source").val();

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
                    $.each(CheckArray, function (index, value) {

                        $("#" + value).attr("checked", true);
                    });
                    var checkArray = $("#DataTables-Gauge").find("input[type=checkbox]").not("#allCheck");
                    for (var i = 0; i < checkArray.length; i++) {
                        if (!checkArray[i].checked) {
                            isAllCheck = false;
                        }
                    }

                    $("#allCheck")[0].checked = isAllCheck;
                },
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    }, { //隐藏列
                        bVisible: false,
                        aTargets: [4]
                    }
                ],
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
                        return 'type=init&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&Amount_Name=' + Amount_Name + '&Amount_TypeID=' + Amount_TypeID + '&Amount_Source=' + Amount_Source;
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
                    $('td:eq(0)', row).html(" <input type=\"checkbox\" id='" + data[0] + "' name='checkboxname'  value=\"" + data[0] + "\" />");
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(2)', row).css("text-align", "center");
                    $('td:eq(4)', row).css("text-align", "center");
                    $('td:eq(7)', row).css("text-align", "center");
                    $('td:eq(9)', row).css("text-align", "center");
                    var operation = "";
                    operation = " <button  href=\"javascript:;\" name=\"QX_LookAmount\" class=\"btn btn-link \" onclick=\" AmountPreview('" + data[0] + "')\" >查看</button>"
                    if (data[12] == '5730154747404') {
                        operation += "<button href=\"javascript:;\" name=\"QX_AmountUpdate\" onclick=\"UpdateEvaluation('" + data[0] + "','" + data[9] + "')\"class=\"btn btn-link \">修改</button>"

                        operation += " <button  href=\"javascript:;\" name=\"QX_DelAmount\" class=\"btn btn-link \" onclick=\"DelAmount('" + data[0] + "','" + data[12] + "','" + data[3] + "')\" >删除</button>";
                    } else {
                        //if (data[8] == "自编量表") {
                        operation += "<button href=\"javascript:;\" name=\"QX_AmountUpdate\" onclick=\"UpdateEvaluation('" + data[0] + "','" + data[9] + "')\"class=\"btn btn-link \">修改</button>"

                        operation += " <button  href=\"javascript:;\" name=\"QX_DelAmount\" class=\"btn btn-link \" onclick=\"DelAmount('" + data[0] + "','" + data[12] + "','" + data[3] + "')\" >删除</button>";
                        //}
                    }
                    $('td:eq(9)', row).html(operation);
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
                    $("#allCheck").removeAttr("checked")
                    //$("#DataTables-Gauge_info").css("margin-bottom", "5px");
                    //var htmls = "";
                    //htmls += " ";
                    //$("#DataTables-Gauge_info").html(htmls);
                    //GetFunction();
                }
            });

        }
        //单击勾选状态
        $('#DataTables-Gauge').on('click', 'input', function () {
            var tdArr = $(this);
            var check = tdArr.prop("checked")
            var id = tdArr.val();
            if (check && check == true) {
                if (id != null && id != "" && id != 0) {
                    CheckArray.push(id);
                }
            } else {
                if (id != null && id != "" && id != 0) {
                    CheckArray.splice($.inArray(id, CheckArray), 1);
                }
            }
        });
        //全选的时候把checked给选中--全选勾选状态
        function SelectAll(obj) {
            if (obj.checked) {

                $("input[type=checkbox][name=checkboxname]").prop("checked", true);

            } else {
                $("input[type=checkbox][name=checkboxname]").prop("checked", false);
            }
            $("#DataTables-Gauge").find("tr").each(function () {
                var tdArr = $(this).find("input");
                var check = tdArr.prop("checked")
                var id = tdArr.val();
                if (check && check == true) {
                    if (id != null && id != "" && id != 0) {                     
                        CheckArray.push(id);
                    }
                } else {
                    if (id != null && id != "" && id != 0) {
                        CheckArray.splice($.inArray(id, CheckArray), 1);
                    }
                }
            });
        }
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
            //var checkbox = document.getElementsByName("checkboxname");
            //if (checkbox.length > 0) {
            //var U_IDs = "";//注意
            //for (var i = 0; i < checkbox.length; i++) {
            //    if (checkbox[i].checked) {
            //        var Cvalue = checkbox[i].value;
            //        var test = $("#" + Cvalue).parent().parent().find(".progress-bar>span").attr("data-name");
            //        //U_IDs += Cvalue + ",";
            //        if (test == 100) {
            //            U_IDs += Cvalue + ",";
            //        } else {
            //            U_IDs += 0 + ",";

            //        }
            //    }
            //}
            localStorage.setItem("Acode", CheckArray);
            if (CheckArray.length>0) {
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
            + "                 <label>"
            + "                       <input type=\"radio\" name=\"options_" + T_Faw + "\" id=\"options_" + T_Faw + "_" + T_Faw_Con + "\" >" + num + "、<label style=\"color:#101010;\">" + option + "</label>"
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
            + "                 <label>"
            + "                       <input type=\"radio\" name=\"options_" + T_Faw + "\" id=\"options_" + T_Faw + "_" + T_Faw_Con + "\" >" + num + "、<label style=\"color:#101010;\"><img src=" + option + " /></label>"
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
        $(document).on("click", "[name=checkboxname]", function () {

            var isAllCheck = true;
            var checkArray = $("#DataTables-Gauge").find("input[type=checkbox]").not("#allCheck");
            for (var i = 0; i < checkArray.length; i++) {
                if (!checkArray[i].checked) {
                    isAllCheck = false;
                }
            }

            $("#allCheck")[0].checked = isAllCheck;
        })

        $(document).ready(function () {
            $("#export").click(function (event) {
                $(".collapsed").removeAttr("href");
                //$("[type=radio]").attr("style", "display:none");
                var AmountNameHtm = $("#AmountNameHtm").html();
                if (AmountNameHtm == "瑞文标准推理测验") {
                    window.open("瑞文标准推理测验.docx");
                    //window.open("http://pan.baidu.com/s/1kUQwYDT");
                } else {
                    $("#ListQuestionPanel").find("input[type=radio]").attr({ type: "hidden", name: "radios" });
                    $("#ListQuestionPanel").wordExport(AmountNameHtm);
                    $("#ListQuestionPanel").find("input[name=radios]").attr({ type: "radio" });
                }
            });
        });

    </script>

</asp:Content>
