<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="EvaluationFiles.aspx.cs" Inherits="CrisisInterfere.FunctionModular.EvaluationFiles.EvaluationFiles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link rel="shortcut icon" href="favicon.ico" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link href="../../assets/css/chosen.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">档案管理</a></li>
                <li><a href="#" style="color: #666;">测评档案</a></li>
            </ol>
        </div>
    </div>
    <!-- /. ROW  -->

    <div class="row" style="padding-bottom: 20px; ">
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <input id="LoginName" class="form-control" placeholder="登录名/姓名" />

        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <select class="chosen-select" style="width: 100%;" id="Sel_AmountName">
            </select>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px; text-align: right;">
            <button class="btn btn-primary btn-sm" id="go_search" name="QX_SelectEvaluationFiles"><i class="fa fa-search "></i>查询</button>

        </div>
    </div>
    <div class="row">
        <div class="col-md-12">

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">
                    <thead>
                        <tr>
                            <th></th>
                            <th class="text-center" style="width: 1%;">
                                <input onclick="chebox()" id="checkbox" name="checkbox" type="checkbox" /></th>
                            <th class="text-center" style="width: 8%;">序号</th>
                            <th>登录名</th>
                            <th>姓名</th>
                            <th>部门</th>
                            <th>量表名称</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>

            </div>
            <button onclick="deletes()" name="QX_deletesEvaluationFiles" class="btn btn-reds">
                <i class="glyphicon glyphicon-trash"></i>批量删除</button>
        </div>
        <!--End Advanced Tables -->
    </div>

    <!-- /. ROW  -->


    <!-- /. ROW  -->



    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>

    <script src="../../JS/chosen.jquery.min.js"></script>
    <script>
        var navName = '/FunctionModular/EvaluationFiles/EvaluationFiles.aspx';
        initSelectInput("operationType=LoadAmountName", "Sel_AmountName", "--量表名称--");//初始化量表类别
        /*列表展现部分 */

        /*
               创建时间：2016-09-07
               创建人：刘玉京
               功能介绍：加载量表列表集合
       */
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var GaugeName = "";
        var LoginName = "";
        news();
        var dtDetail;
        function news() {
            if (dtDetail != undefined) {
                $("#tableGrid").DataTable().draw();
                return;
            }



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
                    },
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/EvaluationFiles.ashx",
                    dataSrc: "data",
                    data: function (d) {

                        if (d.start == 0) {
                            //if (Endindex == 10) {
                            Endindex = d.length;
                            if (Endindex == 10) {
                                Starindex = 0;
                            }
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        //Endindex = 0;
                        //Starindex = 0;
                        //if (d.start == 0) {
                        //    Endindex = d.length;
                        //} else {
                        //    Starindex = d.start + 1;
                        //    Endindex = d.start + d.length;
                        //}

                        return 'type=Load&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&GaugeName=' + GaugeName + '&LoginName=' + LoginName;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    $('td:eq(0)', row).html(" <input class=childCheck name=checkbox data-name=" + data[6] + " type=\"checkbox\" name='CheckboxID' value=\"" + data[0] + "\" />");
                    var operation = "";
                    if (data[8] == 'LB_14809941842260' || data[8] == "LB_14811084564180" || data[8] == "LB_14810118744850") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',3,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == 'LB_14809227671290') {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',4,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }
                    else if (data[8] == "LB_14809953564280" || data[8] == "LB_14809270976120" || data[8] == "LB_14810979035220") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',6,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14811056565390") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',7,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }

                    else if (data[8] == "LB_14811852410670") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',8,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14812009694200") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',801,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }
                    else if (data[8] == "LB_14811639146570") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',802,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }
                    else if (data[8] == "LB_14812009852840") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',9,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14811658719780") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',901,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14811181207060") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',10,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }
                    else if (data[8] == "LB_14811661311050") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',11,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14814373314360") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',1,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14811899636250") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRS('" + data[8] + "',12,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14811899593960") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',14,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14809330635970") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',15,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }
                    else if (data[8] == "LB_14808297050440") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',16,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } 
                    else if (data[8] == "LB_14824009961900") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',18,'" + data[3] + "','" + data[9] + "')\">查看</button>";//生活事件
                    } else if (data[8] == "LB_14963937158670") {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',19,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14966568047910")
                    {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',20,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    } else if (data[8] == "LB_14963915437340")
                    {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookRSS('" + data[8] + "',21,'" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }
                    else {
                        operation += " <button  class=\"btn btn-link\" name='QX_LookRSelect' onclick=\"LookR('" + data[8] + "','" + data[3] + "','" + data[9] + "')\">查看</button>";
                    }
                    operation += " <button  class=\"btn btn-link\" name='QX_Adelete' data-name=" + data[6] + " value=" + data[0] + " onclick='Adelete(this)'>删除</button>";

                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(1)', row).css("text-align", "center");
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
                    $("#checkbox").removeAttr("checked")
                    //$("#DataTables-Gauge_info").css("margin-bottom", "5px");
                    //var htmls = "";
                    //htmls += " ";
                    //$("#DataTables-Gauge_info").html(htmls);
                    //GetFunction();
                }
            });
        }

        //查询
        $(document).on("click", "#go_search", function () {
            LoginName = $("#LoginName").val();
            GaugeName = $("#Sel_AmountName").val();
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
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
                    $(".chosen-select").chosen();

                }
            });
        }

        function deletes() {

            var chenum = "";
            var name = "";
            var check = $("input[name='checkbox']");//得到主要 checkbox id 的状态
            for (var i = 0; i < check.length; i++) {
                if (check[i].checked) {
                    chenum += check[i].value + ",";
                    name += check[i].getAttribute("data-name") + ',';

                }
            }
            if (chenum.length > 0) {
                layer.confirm('确实要将所选档案放入回收站吗？', {
                    btn: ['确定', '取消'] //按钮
                }, function () {
                    $('#checkbox').attr("checked", false);  //取消选中
                    $.ajax({
                        url: "Ajax/EvaluationFiles.ashx?Type=deletes",
                        data: { chenum: chenum, name: name },
                        type: "POST",
                        success: function (result) {
                            if (result) {
                                layer.msg('删除成功', { time: 2000, icon: 1 }, function () {
                                    //  layer.closeAll('DataTables-Gauge');
                                    $("#DataTables-Gauge").DataTable().draw(false);
                                });

                            }
                            else {
                                layer.msg('删除失败', { time: 2000, icon: 6 }, function () {
                                    //      layer.closeAll('DataTables-Gauge');
                                });
                            }
                        }
                    })
                })
            } else {
                layer.alert("您没有勾选任何数据！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
            }
        }
        function Adelete(obj) {

            var name = obj.getAttribute("data-name");
            var userID = obj.value;
            layer.confirm('确实要将所选档案放入回收站吗？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                $.ajax({
                    url: "Ajax/EvaluationFiles.ashx?Type=deletes",
                    data: { chenum: userID, name: name },
                    type: "POST",
                    success: function (result) {
                        if (result) {
                            layer.msg('删除成功', { time: 2000, icon: 1 }, function () {
                                //  layer.closeAll('DataTables-Gauge');
                                $("#DataTables-Gauge").DataTable().draw(false);
                            });

                        }
                        else {
                            layer.msg('删除失败', { time: 2000, icon: 6 }, function () {
                                //      layer.closeAll('DataTables-Gauge');
                            });
                        }
                    }
                })
            })
        }

        //查看报告
        function LookR(Acode, Name, UID) {
            //var UserNames = encodeURI(Name);
            window.open(encodeURI("ViewFiles.aspx?Acode=" + Acode + "&names=" + Name + "&UIDs=" + UID));
        }
        function LookRS(Acode, types, Name, UID) {
            window.open("SpecialViewFiles.aspx?Acode=" + Acode + "&types=" + types + "&names=" + Name + "&UIDs=" + UID);
        }
        function LookRSS(Acode, types, Name, UID) {
            window.open("SpecialViewFilesM.aspx?Acode=" + Acode + "&types=" + types + "&names=" + Name + "&UIDs=" + UID);
        }
        //全选
        function chebox() {
            var checkbox = document.getElementById("checkbox").checked;//得到主要 checkbox id 的状态
            var items = document.getElementsByName("checkbox"); //得到 name=chec的控件
            for (var i = 0; i < items.length; i++) {//然后循环
                //当前checkbox 的状态 = 所有的控件状态
                items[i].checked = checkbox;
            }
        }
        //设置复选框的CheckboxID        
        $(document).on("click", ".childCheck", function () {

            if (!$(this)[0].checked) {
                $("#checkbox")[0].checked = false;
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
                $("#checkbox")[0].checked = isSuccess;
            }

        });
        $("[name='checkbox']").removeAttr("checked");//取消选中
        //查询按钮的单击事件
        $(document).keyup(function (e) {
            if (e.keyCode === 13) {

                $('#go_search').trigger('click');
            }
        });
    </script>


</asp:Content>
