<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Statistical.aspx.cs" Inherits="CrisisInterfere.FunctionModular.StatisticalAnalysis.Statistical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <style>
        .obj {
            /*width: 98%;*/
            margin-top: 50px;
            margin-left: 5%;
            margin-right: 5%;
            margin-bottom: 50px;
            background: #fff;
            color: #333;
        }


        .box-shadow {
            /*//Firefox4.0-*/
            -moz-box-shadow: 3px 3px 3px;
            /*//Safariand Google chrome10.0-*/
            -webkit-box-shadow: 3px 3px 3px;
            /*//Firefox4.0+、 Google chrome 10.0+ 、 Oprea10.5+ and IE9*/
            box-shadow: 3px 3px 3px;
        }
    </style>

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                 <li><a href="#" style="color: #666;">心理测验</a></li>
                <li><a href="#" style="color: #666;">统计分析</a></li>
            </ol>

        </div>
    </div>

    <div class="row" id="ContentBody">
        <div class="row">
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
                <select class="selectpicker form-control" data-done-button="true" data-live-search="true" data-placeholder="--量表名称--" style="width: 100%;" id="Sel_Amount">
                </select>
            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
                <input type="text" id="TSel_BM" name="TSel_BM" style="width: 98%;" placeholder="--选择部门--" />
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 10px;">
                <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px;" >
                    <input type='text' readonly="readonly" class='form-control input-sm' onclick="javascript: $(this).val('')" id='dtstart' style="width: 100%; border-radius: 0px;" />
                </div>
                <div class="col-md-1 col-sm-2 col-xs-2">
                    <label style="height: 34px; line-height: 34px;">-</label>
                </div>
                <div class="col-md-5 col-sm-5 col-xs-5" style="padding-right: 0px;" >
                    <input type='text' readonly="readonly" class='form-control input-sm' onclick="    javascript: $(this).val('')" id='dtend' style="width: 100%; border-radius: 0px;" />
                </div>
            </div>

            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px; display: none">
                <select style="width: 100%;" id="Sel_TType" class='form-control input-sm'>
                    <option value="全部">全部</option>

                </select>
            </div>

            <div class="col-md-2 col-sm-12 col-xs-12" style="margin-top: 10px;">
                <select style="width: 100%;" id="Sel_Sex" class='form-control input-sm'>
                    <option value="全部">性别</option>
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
            </div>

            <div class="col-md-1 col-sm-12 col-xs-12" style="margin-top: 10px; text-align: right;">
                <button class="btn btn-primary" onclick="OnLoadUserList();" id="StatisticalSelect" name="QX_StatisticalSelect"><i class=" fa fa-search "></i>查询</button>
            </div>

        </div>
        <div class="row" style="margin-top: 20px;">
            <div class="col-md-5 col-sm-12 col-xs-12" style="margin-top: 10px;">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="UserList">
                        <thead style="background-color: RGB(245,248,253); color: RGB(110,164,213);">
                            <tr>
                                <th style="text-align: center;">
                                    <input type="checkbox" id="ceckboxs" /></th>
                                <th class="text-center">序号</th>
                                <th class="text-center">登录名</th>
                                <th class="text-center">姓名</th>
                                <th class="text-center">提交时间</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="col-md-2 col-sm-12 col-xs-12" style="text-align: center; margin-top: 10px;">
                <button class="btn btn-primary btn-sm" onclick="combination();" id="combination" name="QX_combination"><i class=" fa fa-search "></i>组合</button>
            </div>
            <div class="col-md-5 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 0px; margin-top: 10px;">

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-Warning">
                            <thead style="background-color: RGB(245,248,253); color: RGB(110,164,213);">
                                <tr id="title">
                                    <th style="text-align: center;">名称</th>
                                    <th style="text-align: center;">操作</th>

                                </tr>
                            </thead>
                            <tbody id="OperationTable">
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">                    
                    <button class="btn btn-greens" onclick="StatisticsCL();" style="margin-left: 10px; float: right;"" data-id="54"><i class="fa fa-bar-chart" aria-hidden="true">&nbsp;&nbsp;</i>统计</button>
                    <button  class="btn btn-reds " onclick="ClearAll_WarnTable()" style="margin-left: 10px; float:right " data-id="54"><i class="fa fa-trash " aria-hidden="true">&nbsp;&nbsp;</i>清空</button>
                </div>


            </div>
        </div>
    </div>


    <div class="row" id="StatisticsDiv" style="background-color: #eee; display: none;">
        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <button class="btn btn-bm btn-sm" onclick="TJClose();" style="margin-left: 10px; float: right;" data-id="54">关闭</button>
        </div>
        <div class="obj box-shadow " id="Print">

            <div id="BG_Title" style="padding-top: 100px; margin-left: 7%; margin-right: 7%">
                <h1 align="center" id="TJ_Title">XXXX统计报告 </h1>
                <p align="center" id="BG_Data">(报告制作时间：2016-12-20)</p>
            </div>


            <div id="BG_Describe" style="padding-top: 30px; margin-left: 7%; margin-right: 7%;">
                <p><strong>一. 描述统计： </strong></p>
                <div class="table-responsive">
                    
                <table class="table table-striped table-bordered table-hover" id="TB_Describe">
                    <thead style="background-color: RGB(245,248,253); color: RGB(110,164,213);">
                        <tr>

                            <th style="text-align: center">团体</th>
                            <th style="text-align: center">维度</th>
                            <th style="text-align: center">平均值</th>
                            <th style="text-align: center">标准差</th>
                        </tr>
                    </thead>
                    <tbody id="RemarkLogic">
                        <tr>
                            <td rowspan="3" style="text-align: center; vertical-align: middle;">团体一</td>
                            <td>维度</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>

                            <td>维度一</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>

                            <td>维度二</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td rowspan="3" style="text-align: center; vertical-align: middle;">团体二</td>
                            <td>维度</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>

                            <td>维度一</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>

                            <td>维度二</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>

                    </tbody>
                </table>
                    
                </div>
            </div>


            <div id="BG_Difference" style="padding-top: 20px; margin-left: 7%; margin-right: 7%;">
                <p><strong>二. 差异分析： </strong></p>
                
                <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="TB_Describe">
                    <thead style="background-color: RGB(245,248,253); color: RGB(110,164,213);">
                        <tr>

                            <th style="text-align: center">维度名称</th>
                            <th style="text-align: center">差异分析</th>
                            <th style="text-align: center">平方和</th>
                            <th style="text-align: center">自由度</th>
                            <th style="text-align: center">均方</th>
                            <th style="text-align: center">F值</th>
                            <th style="text-align: center">P值</th>
                        </tr>
                    </thead>
                    <tbody id="DifferenceBody">
                        <tr>
                            <td rowspan="3" style="text-align: center; vertical-align: middle;">维度一</td>
                            <td>组间变异</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>

                            <td>组内变异</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>

                        </tr>
                        <tr>

                            <td>总变异</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>

                        <tr>
                            <td rowspan="3" style="text-align: center; vertical-align: middle;">维度二</td>
                            <td>组间变异</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>
                        <tr>

                            <td>组内变异</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>

                        </tr>
                        <tr>

                            <td>总变异</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                            <td>1</td>
                        </tr>


                    </tbody>
                </table>
                </div>
            </div>


            <div id="BG_Conclusion" style="padding-top: 20px; padding-bottom: 100px; margin-left: 7%; margin-right: 7%;">
                <p><strong>三. 结论： </strong></p>
                <p id="Conclusion">各团体间在维度一上得分差异显著（<em>F</em>=***，<em>p&lt;=0.05</em>），在维度二上得分差异不显著（<em>F</em>=***，<em>p&gt;0.05</em>），在维度三上得分差异显著（<em>F</em>=***，<em>p&lt;=0.05</em>）。 </p>
            </div>

        </div>
    </div>
    <%--<div class="row">
              <button id="export">
                 导出
              </button>
          </div>--%>
    <%--<div id="dpp"></div>--%>
    <%--<br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div id="dpp2"></div>--%>

    <input type="hidden" value="0" id="DepID" />
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script>

        var navName = '/FunctionModular/StatisticalAnalysis/Statistical.aspx';
        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        $('#dtstart').val('<%=GetDate(-7)%>');

        $('#dtend').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        $('#dtend').val('<%=GetDate(0)%>');
        initAmount();
        Init_Sel_TType();//初始化测评类型
        GetAnalyJson();//加载F对比值
        /*-----初始化量表下拉方法-----*/
        function initAmount() {
            $("#Sel_Amount").empty();
            $("#Sel_Amount").append("<option value='0'>--量表名称--</option>");
            $.ajax({
                type: "POST",
                url: "Ajax/Statistical.ashx",
                data: "Remark=InitAmount",//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        if (item.Value == "LB_14809227671290" || item.Value == "LB_14811899593960" || item.Value == "LB_14811639146570" || item.Value == "LB_14812009694200" || item.Value == "LB_14812458422370" || item.value == "强迫症状问卷" || item.Text == "LB_14963915437340") {
                            var aa = "";
                        } else {
                            $("#Sel_Amount").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                        }
                    });
                    $("#Sel_Amount").attr("multiple", false);
                    $("#Sel_Amount").selectpicker('refresh');

                }
            });
        }

        /*-----------------加载部门----------------*/
        OnLoadTreeCom();
        function OnLoadTreeCom() {
            $("#TSel_BM").ligerComboBox({
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
                        }, 98);
                    },
                    onBeforeSelect: function (node) {
                        $("#DepID").val(node.data['id']);
                    },
                    url: '/FunctionModular/BasicSetting/Ajax/DepartmentMain.ashx?Remark=GetDepartments&rnd=' + Math.random(),
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false,
                    onClick: function (data) {
                        if ($("#TSel_BM").val() == "")
                            $("#DepID").val("0");
                    }
                }
            });
        }


        var lb_code = "";//量表编码
        var bm_code = "";//部门编码
        var t_sex = "";//性别
        var tablelist;//用户列表对象
        var Stime = "";
        var Etime = "";
        OnLoadUserList();
        function OnLoadUserList() {
            var Starindex = 0;//开始条数索引
            var Endindex = 10;//结束条数索引

            lb_code = $("#Sel_Amount").val();
            t_sex = $("#Sel_Sex").val();
            bm_code = $("#DepID").val();
            Stime = $("#dtstart").val();
            Etime = $("#dtend").val();
            if (tablelist != undefined) {
                $("#UserList").DataTable().draw();
                return;
            }
            tablelist = $('#UserList').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                aoColumnDefs: [

                    //{ //隐藏列
                    //    bVisible: false,
                    //    aTargets: [0]
                    //}, { //隐藏列
                    //    bVisible: false,
                    //    aTargets: [4]
                    //}
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Statistical.ashx",
                    dataSrc: "data",
                    data: function (d) {
                        Endindex = 0;
                        Starindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'Remark=OnLoadUserList&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&A_Code=' + lb_code + '&DID=' + bm_code + '&sex=' + t_sex + '&ST=' + Stime + '&ET=' + Etime;
                    }
                },
                createdRow: function (row, data, dataIndex) {
                    if (ChangeValue != "") {
                        if (ChangeValue.indexOf(data[0]) > -1) {

                            $('td:eq(0)', row).html(" <input type=\"checkbox\" onchange=\"ChangeRecoed(this);\" id=\"Tck_" + data[0] + "\" checked=\"checked\" value=\"{'AID':'" + data[0] + "','LogName':'" + data[2] + "','TName':'" + data[3] + "'}\"  name='checkboxname'   />");
                        } else {
                            $('td:eq(0)', row).html(" <input type=\"checkbox\" onchange=\"ChangeRecoed(this);\"  id=\"Tck_" + data[0] + "\"  value=\"{'AID':'" + data[0] + "','LogName':'" + data[2] + "','TName':'" + data[3] + "'}\"  name='checkboxname'   />");
                        }
                    } else {
                        $('td:eq(0)', row).html(" <input type=\"checkbox\" onchange=\"ChangeRecoed(this);\"   id=\"Tck_" + data[0] + "\" value=\"{'AID':'" + data[0] + "','LogName':'" + data[2] + "','TName':'" + data[3] + "'}\"  name='checkboxname'   />");
                    }
                    $('td:eq(1)', row).css("text-align", "center");
                    $('td:eq(0)', row).css("text-align", "center");
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
                },
                drawCallback: function (s) {
                    $("#ceckboxs").removeAttr("checked");
                    $("#UserList input:checkbox").each(function () {
                        $(this).removeAttr("checked");
                    })
                    // $("#UserList_info").html("<input style=\"margin-left:27px;\" type=\"checkbox\" name=\"checkboxname\" />全选");
                }
            });

        }




        function Init_Sel_TType() {
            var aCode = $("#Sel_Amount").val();
            var Did = $("#DepID").val();
            var StarTime = $("#dtstart").val();
            var EndTime = $("#dtend").val();
            $("#Sel_TType").empty();
            $("#Sel_TType").append("<option value='0'>类型名称</option>");
            $.ajax({
                type: "POST",
                url: "Ajax/Statistical.ashx",
                data: "Remark=InitST&aCode=" + aCode + "&Did=" + Did + "&StarTime=" + StarTime + "&EndTime=" + EndTime,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#Sel_TType").append("<option style=\"pading-left:20px;\" value='" + item.Value + "'>" + item.Text + "</option>");
                    });
                }
            });


        }
        var ChangeValue = "";
        function ChangeRecoed(obj) {
            var ck_id = obj.id;
            var ck_val = ck_id.split('_')[1];
            if (ChangeValue != "") {
                if (ChangeValue.indexOf(ck_val) > -1) {
                    if (!obj.checked) {
                        ChangeValue = ChangeValue.replace('' + ck_val + '', '0');
                    }

                } else {
                    ChangeValue += "," + ck_val;
                }
            } else {
                ChangeValue += ck_val;
            }

            if (X_Json == "") {
                X_Json += obj.value.replace(/'/g, "\"");
            } else {


                var XList = eval("[" + X_Json + "]");
                var njson = obj.value.replace(/'/g, "\"");
                var bList = eval("[" + njson + "]");
                if (XList != null && XList.length > 0) {
                    // X_Json = "";

                    if (!obj.checked)//移除
                    {
                        X_Json = "";
                        for (var j = 0; j < XList.length; j++) {
                            if (XList[j].AID == bList[0].AID) {
                                continue;
                            } else {
                                if (X_Json != "") {
                                    X_Json += ",{\"AID\":\"" + XList[j].AID + "\",\"LogName\":\"" + XList[j].LogName + "\",\"TName\":\"" + XList[j].TName + "\"}";
                                } else {
                                    X_Json += "{\"AID\":\"" + XList[j].AID + "\",\"LogName\":\"" + XList[j].LogName + "\",\"TName\":\"" + XList[j].TName + "\"}";
                                }
                            }
                        }

                    } else {//添加

                        var hv = true;
                        for (var r = 0; r < XList.length; r++) {
                            if (XList[r].AID == bList[0].AID) {
                                hv = false;
                                break;
                            }
                        }

                        if (hv) {
                            if (X_Json == "") {
                                X_Json += njson;
                            } else {
                                X_Json += "," + njson;
                            }

                        }
                    }
                }
            }



        }


        var LB_Name = "";//量表名称
        function combination() {

            var c = "{";
            var regex = new RegExp(c, 'g'); // 使用g表示整字符串都要匹配
            var result = X_Json.match(regex);
            //var count = !result ? 0 : result.length;:checkbox[id!='ceckboxs']
            var count = $("#UserList input:checkbox[id!='ceckboxs']:checked").length;
            var warnCount = $("#dataTables-Warning").find("tr")
            if (count < 2) {//&& warnCount.length>1
                layer.alert("选择的成员必须大于或等于二个！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });

                return;
            }
            if (LB_Name != "") {
                //修改人：田闯
                //修改日期:2017/3/1 16:40
                //修改内容：$("#dataTables-Warning")改为了$("#OperationTable")
                //          find("td")改为了find("tr")
                var warnDable = $("#OperationTable").find("tr");
                var NextSelText = $("#Sel_Amount").find("option:selected").text();
                if (LB_Name != NextSelText && warnDable.length >= 1) {
                    layer.alert("每次统计只能选择一个量表！", {
                        skin: "layui-layer-lan",
                        closeBtn: 0
                    });
                    return;
                }
                    //修改人：田闯
                    //修改日期:2017/3/1 16:40
                else
                    LB_Name = NextSelText;
            } else {
                LB_Name = $("#Sel_Amount").find("option:selected").text();
            }


            layer.open({
                type: 1
              , title: false //不显示标题栏
              , closeBtn: false
              , area: '300px;'
              , shade: 0.8
              , id: 'LAY_layuipro' //设定一个id，防止重复弹出
              , btn: ['保存', '取消']
              , moveType: 1 //拖拽模式，0或者1
              , content: ' <div style="padding: 50px; line-height: 22px; background-color:#ffffff; font-weight: 300;"><input type="text" id="SetName" name="SetName" style="width: 100%;" placeholder="输入团体名称" /></div>'
              , success: function (layero) {
                  var btn = layero.find('.layui-layer-btn');
                  btn.css('text-align', 'center');
                  btn.find('.layui-layer-btn0').attr("onclick", "Savecombination()");
              }
            });

        }
        //非法字符
        var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;
        /*为空*/
        function trim(str) {
            return str.replace(/(^\s*)|(\s*$)/g, "");
        }
        function Savecombination() {
            var groupName = $("#SetName").val();
            if (trim(groupName) == "") {
                layer.alert('不能为空!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }

            if (!reg.test(groupName)) {
                layer.alert('报告名称不可以为特殊字符!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }

            var TL = $("#OperationTable tr").length;
            if (TJ_Json != "") {
                TJ_Json += ",";
                TJ_Json += "{";
                TJ_Json += "    \"Group\":";
                TJ_Json += "    {";
                TJ_Json += "        \"GroupID\":\"GRP_" + TL + "\",";
                TJ_Json += "        \"GroupName\":\"" + groupName + "\"";
                TJ_Json += "    },";
                TJ_Json += "    \"GroupContent\":";
                TJ_Json += "        [";
                TJ_Json += X_Json;
                TJ_Json += "        ]";
                TJ_Json += "}";
            } else {

                TJ_Json += "{";
                TJ_Json += "    \"Group\":";
                TJ_Json += "    {";
                TJ_Json += "        \"GroupID\":\"GRP_" + TL + "\",";
                TJ_Json += "        \"GroupName\":\"" + groupName + "\"";
                TJ_Json += "    },";
                TJ_Json += "    \"GroupContent\":";
                TJ_Json += "        [";
                TJ_Json += X_Json;
                TJ_Json += "        ]";
                TJ_Json += "}";
            }
            DrawGroup();
            // $("#CCList").html(TJ_Json);
        }

        //var active = {
        //    combination: function () {
        //        示范一个公告层
        //        layer.open({
        //            type: 1
        //          , title: false //不显示标题栏
        //          , closeBtn: false
        //          , area: '300px;'
        //          , shade: 0.8
        //          , id: 'LAY_layuipro' //设定一个id，防止重复弹出
        //          , btn: ['火速围观', '残忍拒绝']
        //          , moveType: 1 //拖拽模式，0或者1
        //          , content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">你知道吗？亲！<br>layer ≠ layui<br><br>layer只是作为Layui的一个弹层模块，由于其用户基数较大，所以常常会有人以为layui是layerui<br><br>layer虽然已被 Layui 收编为内置的弹层模块，但仍然会作为一个独立组件全力维护、升级。<br><br>我们此后的征途是星辰大海 ^_^</div>'
        //          , success: function (layero) {
        //              var btn = layero.find('.layui-layer-btn');
        //              btn.css('text-align', 'center');
        //              btn.find('.layui-layer-btn0').attr({
        //                  href: 'http://www.layui.com/'
        //                , target: '_blank'
        //              });
        //          }
        //        });
        //    }
        //};


        var TJ_Json = "";//统计列表数据json集合
        var X_Json = "";//单个统计团体的数据Json集合


        function DrawGroup() {
            if (TJ_Json != "") {
                var TjList = eval("[" + TJ_Json + "]");
                $("#OperationTable").empty();
                if (TjList != null) {
                    var TableHTML = "";
                    for (var k = 0; k < TjList.length; k++) {
                        //[查看]&nbsp;&nbsp;
                        TableHTML += "<tr>";
                        TableHTML += " <td style=\"text-align:center;\">" + TjList[k].Group.GroupName + "</td><td style=\"text-align:center;\"><a style=\"cursor:pointer\" onclick=\"DelTj_Json('" + TjList[k].Group.GroupID + "');\">[删除]</a></td>";
                        TableHTML += "</tr>";
                    }
                    $("#OperationTable").html(TableHTML);
                }
            }
            X_Json = "";
            $("input[type=checkbox][name=checkboxname]").prop("checked", false);
            $("#ceckboxs").prop("checked", false);
        }


        function DelTj_Json(GR_ID) {
            layer.confirm('您是否要删除该组合？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                if (TJ_Json != "") {

                    var TjList = eval("[" + TJ_Json + "]");
                    $("#OperationTable").empty();
                    if (TjList != null) {
                        TJ_Json = "";
                        for (var k = 0; k < TjList.length; k++) {

                            if (TjList[k].Group.GroupID != GR_ID) {
                                if (TJ_Json != "") {
                                    TJ_Json += ",";
                                    TJ_Json += "{";
                                    TJ_Json += "    \"Group\":";
                                    TJ_Json += "    {";
                                    TJ_Json += "        \"GroupID\":\"" + TjList[k].Group.GroupID + "\",";
                                    TJ_Json += "        \"GroupName\":\"" + TjList[k].Group.GroupName + "\"";
                                    TJ_Json += "    },";
                                    TJ_Json += "    \"GroupContent\":";
                                    TJ_Json += "        [";

                                    var xjsonList1 = TjList[k].GroupContent;
                                    TJ_Json += Getxx_json(xjsonList1);
                                    TJ_Json += "        ]";
                                    TJ_Json += "}";
                                } else {
                                    TJ_Json += "{";
                                    TJ_Json += "    \"Group\":";
                                    TJ_Json += "    {";
                                    TJ_Json += "        \"GroupID\":\"" + TjList[k].Group.GroupID + "\",";
                                    TJ_Json += "        \"GroupName\":\"" + TjList[k].Group.GroupName + "\"";
                                    TJ_Json += "    },";
                                    TJ_Json += "    \"GroupContent\":";
                                    TJ_Json += "        [";
                                    var xjsonList2 = TjList[k].GroupContent;
                                    TJ_Json += Getxx_json(xjsonList2);
                                    TJ_Json += "        ]";
                                    TJ_Json += "}";
                                }

                            }
                        }
                        DrawGroup();
                    }
                    layer.msg('删除成功！', { time: 3000, icon: 1 });
                }



            });


        }

        function Getxx_json(xjsonList) {
            var xx_json = "";
            if (xjsonList != null && xjsonList.length > 0) {
                xx_json = "";
                for (var x = 0; x < xjsonList.length ; x++) {
                    if (xx_json != "") {
                        xx_json += ",{\"AID\":\"" + xjsonList[x].AID + "\",\"LogName\":\"" + xjsonList[x].LogName + "\",\"TName\":\"" + xjsonList[x].TName + "\"}";

                    } else {
                        xx_json += "{\"AID\":\"" + xjsonList[x].AID + "\",\"LogName\":\"" + xjsonList[x].LogName + "\",\"TName\":\"" + xjsonList[x].TName + "\"}";
                    }

                }
            }
            return xx_json;
        }
        /*-----描述清空-----*/
        function ClearAll_WarnTable() {
            if (TJ_Json != "") {
                TJ_Json = "";
                $("#OperationTable").html("");
                layer.msg('删除成功！', { time: 2000, icon: 1 });
            }
        }

        /*------描述统计------*/
        function StatisticsCL() {
            var myDate = new Date();
            //myDate.toLocaleDateString();//可以获取当前日期
            $("#TJ_Title").empty();
            $("#TJ_Title").html(LB_Name + "统计报告");
            $("#BG_Data").empty();
            $("#BG_Data").html("报告制作时间:" + myDate.toLocaleDateString());


            if (TJ_Json != "") {
                $.ajax({
                    type: "POST",
                    url: "Ajax/Statistical_logic.ashx",
                    data: "Remark=Getlogic&LB_code=" + $("#Sel_Amount").val() + "&XmlJson=" + TJ_Json,//要执行查询的数据参数
                    success: function (msg) {
                        //$("#dpp").html(msg);
                        if (msg != "") {
                            $("#RemarkLogic").empty();
                            var XML = eval(msg);
                            if (XML != null && XML.length > 0) {
                                var RL_HTML = "";
                                for (var k = 0; k < XML.length; k++) {
                                    var rowspan = 0;
                                    rowspan = XML[k].Group.GroupLogic.length;
                                    var ObjList = XML[k].GroupContent;
                                    var _BZ = 0;

                                    if (rowspan > 1) {
                                        if (lb_code == "LB_14809330635970")//学龄前儿童
                                        {
                                            RL_HTML += "<tr>";
                                            RL_HTML += "<td rowspan=\"" + rowspan + "\">" + XML[k].Group.GroupName + "</td>";
                                            RL_HTML += "<td>总评</td>";
                                            /*------------特殊取整---------*/
                                            // lb_code : 量表编码   

                                            RL_HTML += "<td>" + eval(XML[k].Group.GroupLogic[1].ZhuanHuaPingJunFen).toFixed(2) + "</td>";
                                            RL_HTML += "<td>" + Math.sqrt(eval(XML[k].Group.GroupLogic[1].ZHBZC)).toFixed(2) + "</td>";
                                            RL_HTML += "</tr>";                                           
                                        } else
                                        {
                                            RL_HTML += "<tr>";
                                            RL_HTML += "<td rowspan=\"" + rowspan + "\">" + XML[k].Group.GroupName + "</td>";
                                            RL_HTML += "<td>" + XML[k].Group.GroupLogic[0].W_Name + "</td>";
                                            /*------------特殊取整---------*/
                                            // lb_code : 量表编码   

                                            if (lb_code == "LB_14809953564280" || lb_code == "LB_14809270976120" || lb_code == "LB_14810979035220") {
                                                if (ObjList != null && ObjList.length > 0) {

                                                    for (var o = 0; o < ObjList.length; o++) {
                                                        _BZ += parseInt(eval(ObjList[o].Logic[0].ZhuanHuaFen));
                                                    }
                                                }
                                                RL_HTML += "<td>" + (_BZ / ObjList.length).toFixed(2) + "</td>";
                                            } else {
                                                RL_HTML += "<td>" + eval(XML[k].Group.GroupLogic[0].ZhuanHuaPingJunFen).toFixed(2) + "</td>";
                                            }
                                            RL_HTML += "<td>" + Math.sqrt(eval(XML[k].Group.GroupLogic[0].ZHBZC)).toFixed(2) + "</td>";
                                            RL_HTML += "</tr>";
                                            for (var r = 1; r < rowspan; r++) {

                                                RL_HTML += "<tr>";
                                                RL_HTML += "<td>" + XML[k].Group.GroupLogic[r].W_Name + "</td>";
                                                RL_HTML += "<td>" + eval(XML[k].Group.GroupLogic[r].ZhuanHuaPingJunFen).toFixed(2) + "</td>";
                                                RL_HTML += "<td>" + Math.sqrt(eval(XML[k].Group.GroupLogic[r].ZHBZC)).toFixed(2) + "</td>";
                                                RL_HTML += "</tr>";
                                            }
                                        }

                                    } else {

                                        RL_HTML += "<tr>";
                                        RL_HTML += "<td rowspan=\"" + rowspan + "\">" + XML[k].Group.GroupName + "</td>";
                                        RL_HTML += "<td>" + XML[k].Group.GroupLogic[0].W_Name + "</td>";

                                        /*------------特殊取整---------*/
                                        // lb_code : 量表编码   

                                        if (lb_code == "LB_14809953564280" || lb_code == "LB_14809270976120" || lb_code == "LB_14810979035220") {
                                            if (ObjList != null && ObjList.length > 0) {

                                                for (var o = 0; o < ObjList.length; o++) {
                                                    _BZ += parseInt(eval(ObjList[o].Logic[0].ZhuanHuaFen));
                                                }
                                            }
                                            RL_HTML += "<td>" + (_BZ / ObjList.length).toFixed(2) + "</td>";
                                        } else {
                                            RL_HTML += "<td>" + eval(XML[k].Group.GroupLogic[0].ZhuanHuaPingJunFen).toFixed(2) + "</td>";
                                        }

                                        // RL_HTML += "<td>" + eval(XML[k].Group.GroupLogic[0].ZhuanHuaPingJunFen).toFixed(2) + "</td>";
                                        RL_HTML += "<td>" + Math.sqrt(eval(XML[k].Group.GroupLogic[0].ZHBZC)).toFixed(2) + "</td>";
                                        RL_HTML += "</tr>";

                                    }
                                }
                            }
                            $("#RemarkLogic").html(RL_HTML);
                            if (lb_code == "LB_14809330635970") {
                                CY(msg);
                            } else {
                                DifferenceMes(msg);
                            }
                        }
                    }
                });
                $("#ContentBody").css('display', 'none');
                $("#StatisticsDiv").css('display', 'block');
            } else {
                layer.alert("没有可统计的数据！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
            }
        }

        function TJClose() {

            $("#ContentBody").css('display', 'block');
            $("#StatisticsDiv").css('display', 'none');
            $("#dataTables-Warning").find("tr:gt(0)").remove();
            //修改人：田闯
            //修改日期：2017/3/2  15：54
            //修改内容：ClearWarnTable('GRP_0');改为了ClearWarnTable('');
            ClearWarnTable('');

        }
        function ClearWarnTable(GR_ID) {
            if (TJ_Json != "") {

                var TjList = eval("[" + TJ_Json + "]");
                $("#OperationTable").empty();
                if (TjList != null) {
                    TJ_Json = "";
                    for (var k = 0; k < TjList.length; k++) {

                        if (TjList[k].Group.GroupID != GR_ID) {
                            if (TJ_Json != "") {
                                TJ_Json += ",";
                                TJ_Json += "{";
                                TJ_Json += "    \"Group\":";
                                TJ_Json += "    {";
                                TJ_Json += "        \"GroupID\":\"" + TjList[k].Group.GroupID + "\",";
                                TJ_Json += "        \"GroupName\":\"" + TjList[k].Group.GroupName + "\"";
                                TJ_Json += "    },";
                                TJ_Json += "    \"GroupContent\":";
                                TJ_Json += "        [";

                                var xjsonList1 = TjList[k].GroupContent;
                                TJ_Json += Getxx_json(xjsonList1);
                                TJ_Json += "        ]";
                                TJ_Json += "}";
                            } else {
                                TJ_Json += "{";
                                TJ_Json += "    \"Group\":";
                                TJ_Json += "    {";
                                TJ_Json += "        \"GroupID\":\"" + TjList[k].Group.GroupID + "\",";
                                TJ_Json += "        \"GroupName\":\"" + TjList[k].Group.GroupName + "\"";
                                TJ_Json += "    },";
                                TJ_Json += "    \"GroupContent\":";
                                TJ_Json += "        [";
                                var xjsonList2 = TjList[k].GroupContent;
                                TJ_Json += Getxx_json(xjsonList2);
                                TJ_Json += "        ]";
                                TJ_Json += "}";
                            }

                        }
                    }
                    DrawGroup();
                }
            }
        }

        /*展现差异分析*/
        function DifferenceMes(dataJson) {
            if (dataJson != "") {
                var XMLList = eval(dataJson);
                if (XMLList != null && XMLList.length > 0) {
                    $("#DifferenceBody").empty();
                    var DifferenceHTML = "";
                    DifferenceHTML += "";
                    var GroupLogicEN = XMLList[0].Group.GroupLogic;

                    /*------求组间变异平方和-----*/
                    var ZH_All = "";//减数
                    var B_ZH_All = "";//被减数
                    var All_ZhuanHuaFen = "";//所有人转化分
                    var All_RenShu = 0;

                    var D_data = new Dictionary();
                    var ConclusionHTML = "各团体间";

                    for (var zn = 0; zn < XMLList.length; zn++) {
                        var GR_ID = XMLList[zn].Group.GroupID;
                        var ContentList = XMLList[zn].GroupContent;
                        if (ContentList != null && ContentList.length > 0) {
                            for (var cl = 0; cl < ContentList.length; cl++) {

                                var LogicList = ContentList[cl].Logic;
                                if (LogicList != null && LogicList.length > 0) {

                                    for (var clk = 0; clk < LogicList.length; clk++) {
                                        var clk_ZHF = LogicList[clk].ZhuanHuaFen;
                                        if (D_data.get("ZN" + GR_ID + "#" + LogicList[clk].W_Code) != undefined) {

                                            if (D_data.get("ZN" + GR_ID + "#" + LogicList[clk].W_Code) != "") {

                                                D_data.put("ZN" + GR_ID + "#" + LogicList[clk].W_Code, D_data.get("ZN" + GR_ID + "#" + LogicList[clk].W_Code) + "+((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                                            } else {
                                                D_data.put("ZN" + GR_ID + "#" + LogicList[clk].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                                            }

                                        } else {
                                            D_data.put("ZN" + GR_ID + "#" + LogicList[clk].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                                        }


                                        if (D_data.get("ZNPFH#" + LogicList[clk].W_Code) != undefined) {

                                            if (D_data.get("ZNPFH#" + LogicList[clk].W_Code) != "") {

                                                D_data.put("ZNPFH#" + LogicList[clk].W_Code, D_data.get("ZNPFH#" + LogicList[clk].W_Code) + "+((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                                            } else {
                                                D_data.put("ZNPFH#" + LogicList[clk].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                                            }
                                        } else {
                                            D_data.put("ZNPFH#" + LogicList[clk].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                                        }

                                    }
                                }

                            }

                        }
                    }

                    for (var cc = 0; cc < XMLList.length; cc++) {
                        var GroupLogicList = XMLList[cc].Group.GroupLogic;

                        for (var ty = 0; ty < GroupLogicList.length; ty++) {
                            var wdCode = GroupLogicList[ty].WD;
                            if (D_data.get(wdCode) == undefined) {
                                D_data.put(wdCode, "");
                            }
                            if (D_data.get(XMLList[cc].Group.GroupID + "#" + GroupLogicList[ty].WD) == undefined) {
                                D_data.put(XMLList[cc].Group.GroupID + "#" + GroupLogicList[ty].WD, "");
                            }

                            if (D_data.get(XMLList[cc].Group.GroupID + "#RenShu") == undefined) {
                                D_data.put(XMLList[cc].Group.GroupID + "#RenShu", "");
                            }
                        }//----定义维度键值组

                        if (GroupLogicList != null && GroupLogicList.length > 0) {
                            var ZhuanHuaFen = "";//个人转化分
                            var PingFangZhuanHuaFen = "";//转化分相加的平方和
                            var FirstGroupValue = "";
                            var RenShu = XMLList[cc].Group.RenShu;
                            All_RenShu = parseInt(All_RenShu) + parseInt(RenShu);
                            for (var ct = 0; ct < GroupLogicList.length; ct++) {
                                if (D_data.get(GroupLogicList[ct].WD) != undefined) {
                                    if (D_data.get(GroupLogicList[ct].WD) != "") {
                                        D_data.put(GroupLogicList[ct].WD, D_data.get(GroupLogicList[ct].WD) + "+ " + "(" + GroupLogicList[ct].ZhuanHuaFen + ")");
                                    } else {
                                        D_data.put(GroupLogicList[ct].WD, "(" + GroupLogicList[ct].ZhuanHuaFen + ")");
                                    }
                                }
                                if (D_data.get(XMLList[cc].Group.GroupID + "#" + GroupLogicList[ct].WD) != undefined) {
                                    if (D_data.get(XMLList[cc].Group.GroupID + "#" + GroupLogicList[ct].WD) != "") {
                                        D_data.put(XMLList[cc].Group.GroupID + "#" + GroupLogicList[ct].WD, "(" + GroupLogicList[ct].ZhuanHuaFen + ")");
                                    } else {
                                        D_data.put(XMLList[cc].Group.GroupID + "#" + GroupLogicList[ct].WD, "(" + GroupLogicList[ct].ZhuanHuaFen + ")");
                                    }
                                }
                            }

                            if (D_data.get(XMLList[cc].Group.GroupID + "#RenShu") != undefined) {
                                D_data.put(XMLList[cc].Group.GroupID + "#RenShu", XMLList[cc].Group.RenShu);
                            }
                        }
                    }
                    if (GroupLogicEN != null && GroupLogicEN.length > 0) {
                        for (var gl = 0; gl < GroupLogicEN.length; gl++) {
                            DifferenceHTML += "<tr>";

                            var ZjPFH = "";//组间平方和
                            var ZnPFH = "";//组内平方和
                            var E_JianShu = "";//减数（个）
                            var A_JianShu = "";//减数(总)
                            var FB_JianShu = "";//被减数分支
                            var A_RenShu = "";
                            var zyd = 0;
                            var Zby = "";//总变异
                            var GrZRS = 0;//总人数
                            var zzyd = 0;//总变异（自由度）
                            for (var zj = 0; zj < XMLList.length; zj++) {
                                E_JianShu = "";//减数
                                var GroupID = XMLList[zj].Group.GroupID;// 找到的组的ID
                                var Wd_Id = GroupLogicEN[gl].WD;
                                E_JianShu = "((" + D_data.get(GroupID + "#" + Wd_Id) + ")*(" + D_data.get(GroupID + "#" + Wd_Id) + "))/" + D_data.get(GroupID + "#RenShu");

                                if (FB_JianShu != "") {
                                    FB_JianShu += "+(" + D_data.get(GroupID + "#" + Wd_Id) + ")";
                                } else {
                                    FB_JianShu += "(" + D_data.get(GroupID + "#" + Wd_Id) + ")";
                                }

                                if (A_JianShu != "") {
                                    A_JianShu += "+ (" + E_JianShu + ")"
                                } else {
                                    A_JianShu += "(" + E_JianShu + ")"
                                }
                                var rs = XMLList[zj].Group.RenShu;

                                if (A_RenShu != "") {
                                    A_RenShu += "+ " + rs;
                                } else {
                                    A_RenShu += rs;
                                }

                            }

                            var znWd = GroupLogicEN[gl].WD;
                            ZjPFH = "(" + A_JianShu + ")-(((" + FB_JianShu + ")*(" + FB_JianShu + "))/(" + A_RenShu + "))";

                            if (D_data.get("ZNPFH#" + znWd) != undefined) {
                                ZnPFH = "(" + D_data.get("ZNPFH#" + znWd) + ")-(" + A_JianShu + ")";
                            } else {
                                ZnPFH = "0";
                            }

                            Zby = ZjPFH + "+(" + ZnPFH + ")";
                            zyd = XMLList.length - 1;

                            for (var Grzn = 0; Grzn < XMLList.length; Grzn++) {
                                GrZRS += parseInt(D_data.get(XMLList[Grzn].Group.GroupID + "#RenShu"));
                            }
                            zzyd = GrZRS - 1;
                            GrZRS = GrZRS - XMLList.length;
                            var zjjf = 0;
                            if (zyd != 0) {
                                zjjf = eval(ZjPFH) / zyd;//组间自由度
                            }

                            var znjf = 0;
                            if (GrZRS != 0) {
                                znjf = eval(ZnPFH).toFixed(2) / GrZRS;//组内自由度
                            }
                            var fz = 0;
                            if (znjf != 0) {
                                fz = zjjf / znjf;
                            }
                            var Pvalue = GetP(zyd, GrZRS);//真实的P值
                            var Presult = "";//状态
                            var zx = "";
                            if (Pvalue > fz) {
                                Presult = "P&gt;0.05";
                                zx = "差异不显著";
                            } else if (Pvalue == fz) {
                                Presult = "P=0.05";
                                zx = "差异显著";
                            } else {
                                Presult = "P&lt;0.05";
                                zx = "差异显著";
                            }

                            DifferenceHTML += "<td rowspan=\"3\" style=\"text-align:center;vertical-align:middle;\" >" + GroupLogicEN[gl].W_Name + "</td>";
                            DifferenceHTML += "<td>组间变异</td>";
                            DifferenceHTML += "<td>" + eval(ZjPFH).toFixed(2) + "</td>";
                            DifferenceHTML += "<td>" + zyd + "</td>";
                            DifferenceHTML += "<td>" + zjjf.toFixed(2) + "</td>";
                            DifferenceHTML += "<td rowspan=\"3\" style=\"text-align:center;vertical-align:middle;\">" + fz.toFixed(2) + "</td>";



                            DifferenceHTML += "<td rowspan=\"3\" style=\"text-align:center;vertical-align:middle;\">" + Presult + "</td>";
                            DifferenceHTML += "</tr>";
                            DifferenceHTML += "<tr>";
                            DifferenceHTML += "<td>组内变异</td>";
                            DifferenceHTML += "<td>" + eval(ZnPFH).toFixed(2) + "</td>";
                            DifferenceHTML += "<td>" + GrZRS + "</td>";
                            DifferenceHTML += "<td>" + znjf.toFixed(2) + "</td>";
                            DifferenceHTML += "</tr>";
                            DifferenceHTML += "<tr>";
                            DifferenceHTML += "<td>总变异</td>";
                            DifferenceHTML += "<td>" + eval(Zby).toFixed(2) + "</td>";
                            DifferenceHTML += "<td>" + zzyd + "</td>";
                            DifferenceHTML += "<td>--</td>";
                            DifferenceHTML += "</tr>";



                            // P  <或者 =  差异显著 
                            // P > 差异不显著

                            if (ConclusionHTML != "各团体间") {
                                ConclusionHTML += ",在" + GroupLogicEN[gl].W_Name + "上得分" + zx + "（<em>F</em>=" + fz.toFixed(2) + "，<em>" + Presult + "</em>）";
                            } else {
                                ConclusionHTML += "在" + GroupLogicEN[gl].W_Name + "上得分" + zx + "（<em>F</em>=" + fz.toFixed(2) + "，<em>" + Presult + "</em>）";
                            }


                        }
                    }
                    $("#DifferenceBody").html(DifferenceHTML);
                    $("#Conclusion").empty();
                    $("#Conclusion").html(ConclusionHTML);
                }
            }

        }
        function CY(dataJson)
        {           
            if (dataJson != "") {
                var XMLList = eval(dataJson);
                if (XMLList != null && XMLList.length > 0) {
                    $("#DifferenceBody").empty();
                    var DifferenceHTML = "";
                    DifferenceHTML += "";
                    var GroupLogicEN = XMLList[0].Group.GroupLogic;

                    /*------求组间变异平方和-----*/
                    var ZH_All = "";//减数
                    var B_ZH_All = "";//被减数
                    var All_ZhuanHuaFen = "";//所有人转化分
                    var All_RenShu = 0;

                    var D_data = new Dictionary();
                    var ConclusionHTML = "各团体间";
                    if (lb_code == "LB_14809330635970")//学龄前儿童
                    {
                        var GR_ID = XMLList[0].Group.GroupID;
                        var ContentList = XMLList[0].GroupContent;
                        var LogicList = ContentList[0].Logic;
                        var clk_ZHF = LogicList[1].ZhuanHuaFen;
                        if (D_data.get("ZN" + GR_ID + "#" + LogicList[1].W_Code) != undefined) {

                            if (D_data.get("ZN" + GR_ID + "#" + LogicList[1].W_Code) != "") {

                                D_data.put("ZN" + GR_ID + "#" + LogicList[1].W_Code, D_data.get("ZN" + GR_ID + "#" + LogicList[1].W_Code) + "+((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                            } else {
                                D_data.put("ZN" + GR_ID + "#" + LogicList[1].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                            }

                        } else {
                            D_data.put("ZN" + GR_ID + "#" + LogicList[1].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                        }


                        if (D_data.get("ZNPFH#" + LogicList[1].W_Code) != undefined) {

                            if (D_data.get("ZNPFH#" + LogicList[1].W_Code) != "") {

                                D_data.put("ZNPFH#" + LogicList[1].W_Code, D_data.get("ZNPFH#" + LogicList[1].W_Code) + "+((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                            } else {
                                D_data.put("ZNPFH#" + LogicList[1].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                            }
                        } else {
                            D_data.put("ZNPFH#" + LogicList[1].W_Code, "((" + clk_ZHF + ")*(" + clk_ZHF + "))");
                        }
                        var GroupLogicList = XMLList[0].Group.GroupLogic;

                        var wdCode = GroupLogicList[1].WD;
                        if (D_data.get(wdCode) == undefined) {
                            D_data.put(wdCode, "");
                        }
                        if (D_data.get(XMLList[0].Group.GroupID + "#" + GroupLogicList[1].WD) == undefined) {
                            D_data.put(XMLList[0].Group.GroupID + "#" + GroupLogicList[1].WD, "");
                        }

                        if (D_data.get(XMLList[0].Group.GroupID + "#RenShu") == undefined) {
                            D_data.put(XMLList[0].Group.GroupID + "#RenShu", "");
                        }
                        var ZhuanHuaFen = "";//个人转化分
                        var PingFangZhuanHuaFen = "";//转化分相加的平方和
                        var FirstGroupValue = "";
                        var RenShu = XMLList[0].Group.RenShu;
                        All_RenShu = parseInt(All_RenShu) + parseInt(RenShu);
                        if (D_data.get(GroupLogicList[1].WD) != undefined) {
                            if (D_data.get(GroupLogicList[1].WD) != "") {
                                D_data.put(GroupLogicList[1].WD, D_data.get(GroupLogicList[1].WD) + "+ " + "(" + GroupLogicList[1].ZhuanHuaFen + ")");
                            } else {
                                D_data.put(GroupLogicList[1].WD, "(" + GroupLogicList[1].ZhuanHuaFen + ")");
                            }
                        }
                        if (D_data.get(XMLList[0].Group.GroupID + "#" + GroupLogicList[1].WD) != undefined) {
                            if (D_data.get(XMLList[0].Group.GroupID + "#" + GroupLogicList[1].WD) != "") {
                                D_data.put(XMLList[0].Group.GroupID + "#" + GroupLogicList[1].WD, "(" + GroupLogicList[1].ZhuanHuaFen + ")");
                            } else {
                                D_data.put(XMLList[0].Group.GroupID + "#" + GroupLogicList[1].WD, "(" + GroupLogicList[1].ZhuanHuaFen + ")");
                            }
                        }

                        if (D_data.get(XMLList[0].Group.GroupID + "#RenShu") != undefined) {
                            D_data.put(XMLList[0].Group.GroupID + "#RenShu", XMLList[0].Group.RenShu);
                        }
                        if (GroupLogicEN != null && GroupLogicEN.length > 0) {
                            DifferenceHTML += "<tr>";

                            var ZjPFH = "";//组间平方和
                            var ZnPFH = "";//组内平方和
                            var E_JianShu = "";//减数（个）
                            var A_JianShu = "";//减数(总)
                            var FB_JianShu = "";//被减数分支
                            var A_RenShu = "";
                            var zyd = 0;
                            var Zby = "";//总变异
                            var GrZRS = 0;//总人数
                            var zzyd = 0;//总变异（自由度）
                            for (var zj = 0; zj < XMLList.length; zj++) {
                                E_JianShu = "";//减数
                                var GroupID = XMLList[zj].Group.GroupID;// 找到的组的ID
                                var Wd_Id = GroupLogicEN[1].WD;
                                E_JianShu = "((" + D_data.get(GroupID + "#" + Wd_Id) + ")*(" + D_data.get(GroupID + "#" + Wd_Id) + "))/" + D_data.get(GroupID + "#RenShu");

                                if (FB_JianShu != "") {
                                    FB_JianShu += "+(" + D_data.get(GroupID + "#" + Wd_Id) + ")";
                                } else {
                                    FB_JianShu += "(" + D_data.get(GroupID + "#" + Wd_Id) + ")";
                                }

                                if (A_JianShu != "") {
                                    A_JianShu += "+ (" + E_JianShu + ")"
                                } else {
                                    A_JianShu += "(" + E_JianShu + ")"
                                }
                                var rs = XMLList[zj].Group.RenShu;

                                if (A_RenShu != "") {
                                    A_RenShu += "+ " + rs;
                                } else {
                                    A_RenShu += rs;
                                }

                            }

                            var znWd = GroupLogicEN[1].WD;
                            ZjPFH = "(" + A_JianShu + ")-(((" + FB_JianShu + ")*(" + FB_JianShu + "))/(" + A_RenShu + "))";

                            if (D_data.get("ZNPFH#" + znWd) != undefined) {
                                ZnPFH = "(" + D_data.get("ZNPFH#" + znWd) + ")-(" + A_JianShu + ")";
                            } else {
                                ZnPFH = "0";
                            }

                            Zby = ZjPFH + "+(" + ZnPFH + ")";
                            zyd = XMLList.length - 1;

                            for (var Grzn = 0; Grzn < XMLList.length; Grzn++) {
                                GrZRS += parseInt(D_data.get(XMLList[Grzn].Group.GroupID + "#RenShu"));
                            }
                            zzyd = GrZRS - 1;
                            GrZRS = GrZRS - XMLList.length;
                            var zjjf = 0;
                            if (zyd != 0) {
                                zjjf = eval(ZjPFH) / zyd;//组间自由度
                            }

                            var znjf = 0;
                            if (GrZRS != 0) {
                                znjf = eval(ZnPFH).toFixed(2) / GrZRS;//组内自由度
                            }
                            var fz = 0;
                            if (znjf != 0) {
                                fz = zjjf / znjf;
                            }
                            var Pvalue = GetP(zyd, GrZRS);//真实的P值
                            var Presult = "";//状态
                            var zx = "";
                            if (Pvalue > fz) {
                                Presult = "P&gt;0.05";
                                zx = "差异不显著";
                            } else if (Pvalue == fz) {
                                Presult = "P=0.05";
                                zx = "差异显著";
                            } else {
                                Presult = "P&lt;0.05";
                                zx = "差异显著";
                            }

                            DifferenceHTML += "<td rowspan=\"3\" style=\"text-align:center;vertical-align:middle;\" >总评</td>";
                            DifferenceHTML += "<td>组间变异</td>";
                            DifferenceHTML += "<td>" + eval(ZjPFH).toFixed(2) + "</td>";
                            DifferenceHTML += "<td>" + zyd + "</td>";
                            DifferenceHTML += "<td>" + zjjf.toFixed(2) + "</td>";
                            DifferenceHTML += "<td rowspan=\"3\" style=\"text-align:center;vertical-align:middle;\">" + fz.toFixed(2) + "</td>";



                            DifferenceHTML += "<td rowspan=\"3\" style=\"text-align:center;vertical-align:middle;\">" + Presult + "</td>";
                            DifferenceHTML += "</tr>";
                            DifferenceHTML += "<tr>";
                            DifferenceHTML += "<td>组内变异</td>";
                            DifferenceHTML += "<td>" + eval(ZnPFH).toFixed(2) + "</td>";
                            DifferenceHTML += "<td>" + GrZRS + "</td>";
                            DifferenceHTML += "<td>" + znjf.toFixed(2) + "</td>";
                            DifferenceHTML += "</tr>";
                            DifferenceHTML += "<tr>";
                            DifferenceHTML += "<td>总变异</td>";
                            DifferenceHTML += "<td>" + eval(Zby).toFixed(2) + "</td>";
                            DifferenceHTML += "<td>" + zzyd + "</td>";
                            DifferenceHTML += "<td>--</td>";
                            DifferenceHTML += "</tr>";



                            // P  <或者 =  差异显著 
                            // P > 差异不显著

                            if (ConclusionHTML != "各团体间") {
                                ConclusionHTML += ",在总评上得分" + zx + "（<em>F</em>=" + fz.toFixed(2) + "，<em>" + Presult + "</em>）";
                            } else {
                                ConclusionHTML += "在总评上得分" + zx + "（<em>F</em>=" + fz.toFixed(2) + "，<em>" + Presult + "</em>）";
                            }
                        }
                        $("#DifferenceBody").html(DifferenceHTML);
                        $("#Conclusion").empty();
                        $("#Conclusion").html(ConclusionHTML);
                    }
                }
            }
        }
        /*-- 获取对比值 --*/
        function GetP(HZB, ZZB) {
            var V = 0;
            if (TJFZ_Json != "") {
                var TJFZ_List = eval(TJFZ_Json);
                for (var t = 0; t < TJFZ_List.length; t++) {
                    //if (TJFZ_List[t].HZB == HZB && TJFZ_List[t].ZZB == ZZB) {
                    //    V = TJFZ_List[t].Valie;
                    //    break;
                    //}
                    if (HZB <= TJFZ_List[t].HZB && ZZB <= TJFZ_List[t].ZZB) {
                        V = TJFZ_List[t].Valie;
                        break;
                    }
                }
            }
            return V;
        }


        var TJFZ_Json = "";//统计分析F对比值
        function GetAnalyJson() {

            $.ajax({
                type: "POST",
                url: "Ajax/Statistical_logic.ashx",
                data: "Remark=TJFX",//要执行查询的数据参数
                success: function (msg) {
                    TJFZ_Json = msg;
                }
            });
        }


        //自定义字典对象
        function Dictionary() {
            this.data = new Array();

            this.put = function (key, value) {
                this.data[key] = value;
            };

            this.get = function (key) {
                return this.data[key];
            };

            this.remove = function (key) {
                this.data[key] = null;
            };

            this.isEmpty = function () {
                return this.data.length == 0;
            };

            this.size = function () {
                return this.data.length;
            };
        }

        ///全选
        $("#ceckboxs").click(function () {//全选 
            if (this.checked) {
                $("[name=checkboxname]").each(function () {
                    var temp = $(this);
                    if (!this.checked)
                        temp.click();
                });
            }
            else {
                $("[name=checkboxname]").each(function () {
                    var temp = $(this);
                    if (this.checked)
                        temp.click();
                });
            }
        });

        //设置复选框的CheckboxID        
        $(document).on("click", "[name=checkboxname]", function () {

            if (!$(this)[0].checked) {
                $("#ceckboxs")[0].checked = false;
            }
            else {
                var arrayCheck = $("[name=checkboxname]");
                var isSuccess = true;
                for (var i = 0; i < arrayCheck.length; i++) {
                    if (arrayCheck[i].checked == false) {
                        isSuccess = false;
                        break;
                    }
                }
                $("#ceckboxs")[0].checked = isSuccess;
            }

        });
        $("#export").click(function (event) {
            $("#Print").wordExport("统计分析");

        });
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#StatisticalSelect").click();
            }
        });
    </script>

</asp:Content>
