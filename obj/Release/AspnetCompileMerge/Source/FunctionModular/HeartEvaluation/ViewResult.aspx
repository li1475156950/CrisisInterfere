<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewResult.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.ViewResult" %>

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
                <li><a href="#">心理测验</a></li>
                <li><a href="#">查看结果</a></li>
            </ol>
        </div>
    </div>


    <!-- /. ROW  -->
    <div class="row" style="margin-left: 9px; margin-bottom: 20px;">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input id="Sel_AmountName" type="text" class="selectpicker form-control" data-done-button="true" placeholder="--量表名称--" />
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="text-align: right; margin-top: 10px;">
            <button id="go_search" class="btn btn-primary btn-sm" name="QX_SelectViewResult"><i class="fa fa-search "></i>查询</button>
        </div>
    </div>

    <div class="row" style="margin-left: 9px;">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <!-- Advanced Tables -->
            <%-- <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-4 col-sm-4 col-xs-4">
                            记录展示  
                        </div>
                        <div class="col-md-8 col-sm-8 col-xs-8" style="text-align: right;">

                            <button onclick="BulkDelete()" class="btn btn-reds btn-sm" style="height: 22px; padding-top: 0px;">
                                <i class="fa fa-trash "></i>批量删除</button>
                        </div>
                    </div>

                </div>
            </div>--%>
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 1%;">
                                <input type="checkbox" id="allCheck" /></th>
                            <th class="text-center" style="width: 8%;">序号</th>
                            <th class="text-center">量表名称</th>
                            <th class="text-center">完成时间</th>
                            <th class="text-center">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

            </div>

            <!--End Advanced Tables -->
        </div>
    </div>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script>
        var navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
        
        var Startindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var amountID = 0;
        var nameLB = "";
        var isLoadDataTable = true; // 是否为第一次初始化数据
        var tablelist;

        BindGrid();
        function BindGrid() {
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
                    url: "Ajax/ViewResult.ashx?operationType=Bind",
                    dataSrc: "data",
                    data: function (d) {

                        var pageIndex = fnGetRequiredPageIndex();
                        // 当初始化的时候
                        if (isLoadDataTable && $("#tableGrid").DataTable().page() != pageIndex) {
                            d.start = pageIndex * d.length;
                        }

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
                        return 'StartPageIndex=' + Startindex + '&EndPageIndex=' + Endindex + '&nameLB=' + nameLB;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    var lookUrl = "";
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
                                result = "MMPI_Report.aspx?A_ID=" + aId + "&type=1" + "&AmountType=" + 1 + "&p=" + tablePageIndex;
                                break;
                            case 2: // LookR
                                result = "LookReport.aspx?A_ID=" + aId + "&type=1" + "&AmountType=" + amountType + "&p=" + tablePageIndex;
                                break;
                            case 3: // 特殊量表 LookRS
                                result = "SpecialReport.aspx?A_ID=" + aId + "&type=1" + "&types=" + contenType + "&AmountType=" + amountType + "&p=" + tablePageIndex;
                                break;
                            case 4: // 特殊量表M LookRSS
                                result = "SpecialReportM.aspx?A_ID=" + aId + "&type=1" + "&types=" + contenType + "&AmountType=" + amountType + "&p=" + tablePageIndex;
                                break;
                        }

                        return result;
                    }

                    //if (data[8] == 2) {
                    if (data[5] == "LB_14814373314360") {
                        lookUrl = getLookUrl(4, data[7], 1, data[6]);
                    }
                    else if (data[5] == "LB_14809941842260" || data[5] == "LB_14811084564180" || data[5] == "LB_14810118744850") {
                        lookUrl = getLookUrl(3, data[7], 3, data[6]);

                    } else if (data[5] == "LB_14809227671290") {
                        lookUrl = getLookUrl(4, data[7], 4, data[6]);
                    }
                    else if (data[5] == "LB_14809953564280" || data[5] == "LB_14809270976120" || data[5] == "LB_14810979035220") {
                        lookUrl = getLookUrl(3, data[7], 6, data[6]);
                    }
                    else if (data[5] == "LB_14811852410670") {
                        lookUrl = getLookUrl(3, data[7], 8, data[6]);
                    } else if (data[5] == "LB_14812009694200") {
                        lookUrl = getLookUrl(3, data[7], 801, data[6]);
                    } else if (data[5] == "LB_14811639146570") {
                        lookUrl = getLookUrl(3, data[7], 802, data[6]);
                    }
                        //else if (data[5] == "LB_14811639146570")
                        //    {
                        //     operation += " <button  class=\"btn btn-link\" name='QX_SelectReport' data-name='lookReportS'onclick=LookRS(" + data[7] + ",802," + data[6] + ")>查看报告</button>"
                        //}
                    else if (data[5] == "LB_14812009852840") {
                        lookUrl = getLookUrl(3, data[7], 9, data[6]);
                    } else if (data[5] == "LB_14811658719780") {
                        lookUrl = getLookUrl(3, data[7], 901, data[6]);
                    }
                    else if (data[5] == "LB_14811661311050") {
                        lookUrl = getLookUrl(4, data[7], 11, data[6]);
                    } else if (data[5] == "LB_14812024172130") {
                        lookUrl = getLookUrl(4, data[7], 13, data[6]);
                    }
                    else if (data[5] == "LB_14811899636250") {
                        lookUrl = getLookUrl(1, data[7],null,null);
                    }
                    else if (data[5] == "LB_14811899593960") {
                        lookUrl = getLookUrl(3, data[7], 14, data[6]);
                    }
                    else if (data[5] == "LB_14812458422370") {
                        lookUrl = getLookUrl(4, data[7], 17, data[6]);
                    } else if (data[5] == "LB_14811181207060") {
                        lookUrl = getLookUrl(3, data[7], 10, data[6]);
                    } else if (data[5] == "LB_14808297050440") {
                        lookUrl = getLookUrl(4, data[7], 16, data[6]);
                    } else if (data[5] == "LB_14811056565390") {
                        lookUrl = getLookUrl(4, data[7], 7, data[6]);
                    }
                    else if (data[5] == "LB_14809330635970") {
                        lookUrl = getLookUrl(4, data[7], 15, data[6]);
                    } else if (data[5] == "LB_14824009961900")
                    {
                        lookUrl = getLookUrl(4, data[7], 18, data[6]);
                    } else if (data[5] == "LB_14963937158670") {
                        lookUrl = getLookUrl(4, data[7], 19, data[6]);
                    } else if (data[5] == "LB_14966568047910") {
                        lookUrl = getLookUrl(4, data[7], 20, data[6]);
                    } else if (data[5] == "LB_14963915437340") {
                        lookUrl = getLookUrl(4, data[7], 21, data[6]);
                    }
                    else {
                        lookUrl = getLookUrl(2, data[7], null, data[6]);
                    }


                    var btnLook = $(" <button  class=\"btn btn-link\" data-amountCode='"+data[8]+"' data-belongToCode='"+data[9]+"' name='QX_SelectReport' data-name='lookReportS' >查看报告</button>");
                    btnLook.on("click", function () {
                        var amountCode = $(this).attr("data-amountCode");
                        var belongToCode = $(this).attr("data-belongToCode");
                        $.ajax({
                            url: "Ajax/ViewResult.ashx?operationType=LookType",
                            type: "GET",
                            data: { A_ID: data[7] },
                            dataType: "Text",
                            success: function (data) {
                                if (data == "2") {
                                    if (amountCode == "LB_14943307579630") {
                                        sessionStorage.setItem("BelongToCode", belongToCode);
                                        sessionStorage.setItem("PageMark","查看结果");
                                        window.location.href = "/FunctionModular/RiskWarning/PotentialRiskEstimateReport.aspx";
                                        return;
                                    }
                                    if (amountCode == "LB_15131477237610") {
                                        sessionStorage.setItem("BelongToCode", belongToCode);
                                        sessionStorage.setItem("PageMark", "查看结果");
                                        window.location.href = "/FunctionModular/RiskWarning/IdioctoniaEstimateReport.aspx";
                                        return;
                                    } else {
                                        window.location.href = "../PersonalReport/" + lookUrl;
                                    }
                                    
                                }
                                else {
                                    layer.alert('未获得相关权限！', {
                                        skin: 'layui-layer-lan', //样式类名
                                        closeBtn: 0,
                                    });
                                }
                            }
                        });
                    });

                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(4)', row).append(btnLook);
                    $('td:eq(4)', row).append("<button  class=\"btn btn-link\"data-remove='remove' name='QX_DelectReport'>删除</button>");
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

                    // 获取请求的页码
                    var pageIndex = fnGetRequiredPageIndex();
                    if ($("#tableGrid").DataTable().page() != pageIndex) {
                        $('#tableGrid').dataTable().fnPageChange(pageIndex);
                    }
                    isLoadDataTable = false;

                },
                drawCallback: function (s) {
                    $("#tableGrid_info").css("margin-bottom", "5px");

                    var htmls = "";
                    htmls += "<button onclick=\"BulkDelete()\"style='margin-left:10px;' name='QX_DelReport' class=\"btn btn-reds\" style=\"height: 22px; padding-top: 0px;\"> <i class=\"fa fa-trash \"></i>批量删除</button>";
                    $("#tableGrid_info").html(htmls);
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

        $(document).on("click", "#go_search", function () {

            nameLB = $("#Sel_AmountName").val();

            if (tableGrid != undefined) {
                $("#allCheck")[0].checked = false;
                $("#tableGrid").DataTable().draw();
                return;
            }
        });
        $(document).on("click", "[data-remove=remove]", function () {
            var answerAddID = $(this).parent().parent().find("input[type=checkbox]").attr("data-id");

            var name = $(this).parent().parent().find("input[type=checkbox]").attr("data-name");
            DeleteAnswerAdd(answerAddID, name);
        })
        function DeleteAnswerAdd(val, name) {

            layer.confirm("确认删除此报告吗？", {
                btn: ["确定", "取消"]
            }, function () {
                $.ajax({
                    url: "Ajax/ViewResult.ashx?operationType=DeleteViewResult",
                    type: "GET",
                    data: { answerAddID: val, name: name },
                    dataType: "Text",
                    success: function (data) {
                        if (data == "True") {
                            layer.msg('删除成功', { time: 2000, icon: 1 }, function () {
                                $("#allCheck")[0].checked = false;
                                layer.closeAll('dialog');
                                $("[name='checkbox']").removeAttr("checked");//取消选中
                                $("#tableGrid").dataTable().fnDraw();
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
            var tempAnswerAddArray = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var name = $("#tableGrid").find("input[type=checkbox]").not("#allCheck");
            var answerID = '';
            var names = '';
            //for (var i = 0; i < name.length; i++) {
            //    alert($(name[i]).attr("data-name"));
            //}

            var isDelete = false;
            for (var i = 0; i < tempAnswerAddArray.length; i++) {
                if ($(tempAnswerAddArray[i])[0].checked) {
                    isDelete = true;

                }
            }

            if (!isDelete) {
                layer.alert("请选择要删除的测试结果", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            }
            for (var i = 0; i < tempAnswerAddArray.length; i++) {
                if ($(tempAnswerAddArray[i])[0].checked) {

                    answerID += $(tempAnswerAddArray[i]).attr("data-id") + ",";
                    names += $(name[i]).attr("data-name") + ",";
                }
            }
            DeleteAnswerAdd(answerID, names);
        }
        $(document).on("click", ".checkAnswerAdd", function () {

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

        //特殊量表
        function LookR(vals, AmountType) {
            //window.location.href = "../PersonalReport/LookReport.aspx?A_ID=" + vals + "&type=1" + "&AmountType=" + AmountType + "";
            var answerAddID = $(this).parent().parent().find("input[type=checkbox]").attr("data-id");
            $.ajax({
                url: "Ajax/ViewResult.ashx?operationType=LookType",
                type: "GET",
                data: { A_ID: vals },
                dataType: "Text",
                success: function (data) {
                    if (data == "2") {

                        window.location.href = "../PersonalReport/LookReport.aspx?A_ID=" + vals + "&type=1" + "&AmountType=" + AmountType + "";
                        //window.open("../PersonalReport/LookReport.aspx?A_ID=" + vals + "&type=1" + "&AmountType=" + AmountType + "");
                    }
                    else {
                        layer.alert('未获得相关权限！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0,
                        });
                    }
                }
            });
        }
        //特殊量表
        function LookRS(vals, types, AmountType) {
            // window.location.href = "../PersonalReport/SpecialReport.aspx?A_ID=" + vals + "&types=" + types + "&AmountType=" + AmountType + "";
            $.ajax({
                url: "Ajax/ViewResult.ashx?operationType=LookType",
                type: "GET",
                data: { A_ID: vals },
                dataType: "Text",
                success: function (data) {
                    if (data == "2") {

                        window.location.href = "../PersonalReport/SpecialReport.aspx?A_ID=" + vals + "&type=1" + "&types=" + types + "&AmountType=" + AmountType + "";
                        //window.open("../PersonalReport/SpecialReport.aspx?A_ID=" + vals + "&type=1" + "&types=" + types + "&AmountType=" + AmountType + "");
                    }
                    else {
                        layer.alert('未获得相关权限！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0,
                        });
                    }
                }
            });

        }
        //特殊量表M
        function LookRSS(vals, types, AmountType) {
            //  window.location.href = "../PersonalReport/SpecialReportM.aspx?A_ID=" + vals + "&types=" + types + "&AmountType=" + AmountType + "";
            $.ajax({
                url: "Ajax/ViewResult.ashx?operationType=LookType",
                type: "GET",
                data: { A_ID: vals },
                dataType: "Text",
                success: function (data) {
                    if (data == "2") {

                        window.location.href = "../PersonalReport/SpecialReportM.aspx?A_ID=" + vals + "&type=1" + "&types=" + types + "&AmountType=" + AmountType + "";
                        //window.open("../PersonalReport/SpecialReportM.aspx?A_ID=" + vals + "&type=1" + "&types=" + types + "&AmountType=" + AmountType + "");
                    }
                    else {
                        layer.alert('未获得相关权限！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0,
                        });
                    }
                }
            });
        }
        function LookRQuanxian() {
            layer.alert('未获得相关权限！', {
                skin: 'layui-layer-lan', //样式类名
                closeBtn: 0,
            });
        }
        /*---产看MMPI报告---*/
        function LookMMPI(AID) {
            window.location.href = "../PersonalReport/MMPI_Report.aspx?A_ID=" + AID + "&type=1" + "&AmountType=" + 1 + "";
            //window.open("../PersonalReport/MMPI_Report.aspx?A_ID=" + AID + "&type=1" + "&AmountType=" + 1 + "");
        }

        $(document).keyup(function (e) {
            if (e.keyCode === 13) {

                $('#go_search').trigger('click');
            }
        });
    </script>
</asp:Content>
