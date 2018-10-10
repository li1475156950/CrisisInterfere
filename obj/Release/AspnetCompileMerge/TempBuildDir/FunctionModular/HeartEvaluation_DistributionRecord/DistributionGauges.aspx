<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DistributionGauges.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation_DistributionRecord.DistributionGauges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <link href="../../CSS/rysz.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="lb-panel-right pull-right">
                <input type="text" id="T_parent" name="T_parent" class="form-control" placeholder="--部门名称--" />
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12" style="display: none;">
            <div class="lb-panel-right pull-right">
                <select class="form-control" id="Sel_RoleType"></select>
            </div>
        </div>
        <div class="col-md-2 col-sm-12 col-xs-12">
            <div class="lb-panel-right pull-right">
                <input class="form-control" id="user_infos" placeholder="登录名/姓名" />
            </div>
        </div>
        <div class="col-md-1 col-sm-12 col-xs-12">
            <div style="float: right; margin-bottom: 20px;">
                <button class="btn btn-primary btn-sm pull-left" onclick="tp()" id="go_search" style="border: 1px solid orange; color: orange;"><i class="fa fa-search"></i>查询</button>
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
                                <th>选框</th>
                                <th>
                                    <input onclick="SelectAll(this);" type="checkbox" id="checkbox" name="checkbox" value="0" /></th>
                                <th>序号</th>
                                <th>登录名</th>
                                <th>姓名</th>
                                <th>角色名称</th>
                                <th>所属部门</th>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>

                </div>

            </div>


            <div class="row" style="margin: 15px 0px 0px 0px;">
                <form id="DisAdd" class="form-horizontal" role="form">
                    <div class="form-group">
                        <div class="group">
                            <div class="col-md-2 col-sm-2  control-label"><span class="text-danger">*</span><span class="textlei">测试类型：</span> </div>
                            <div class="col-sm-6">
                                <input type="radio" name="TestType" value="0" onclick="saveAdmin()" />日常测验
                                         <input type="radio" name="TestType" value="1" onclick="saveupdate()" />普测
                                                  <input id="TestTypes" style="display: none" maxlength="10" name="TestTypes" />
                            </div>
                        </div>


                    </div>
                    <div class="form-group">
                        <div class="group">
                            <div class="col-md-2 col-sm-2  control-label"><span class="text-danger">*</span> 重测：</div>
                            <div class="col-sm-6">
                                <input type="radio" name="Retest" value="0" />不可重测
                                                       <input type="radio" name="Retest" value="1" />可重测
                                                        <span style="width: 80px; display: none" id="IntervalTime">两次作答时间间隔<input id="IntervalDay" name="IntervalDaynmae" style="width: 50px;" onkeyup="onlyNumber(this)" maxlength="10" onblur="onlyNumber(this)" />天</span>

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <div class="col-md-2 col-sm-2  control-label"><span class="text-danger">*</span><span id="noinset"><span class="textcolor"> 是否发送通知</span></span></div>
                            <div class="col-sm-6">
                                <input type="radio" name="Notice" value="0" onclick="bb()" />否
                                                      <input type="radio" name="Notice" value="3" onclick="aa()" />是
                                                        <span id="SendTd" style="display: none">
                                                            <input type="checkbox" name="sendtype" id="SendInner" value="1" onclick="SendEmailF()" />站内信
                                                       <input type="checkbox" name="sendtype" id="SendEmail" onclick="SendEmailF(this)" value="2" />邮件箱
                                                       <input type="text" id="NoticeContent" style="display: none;" name="NoticeContent" /></span>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <div class="col-md-2 col-sm-2  control-label"><span class="text-danger">*</span> 是否可查看报告：</div>
                            <div class="col-sm-6">
                                <input type="radio" name="LookR" value="0" />否
                                                      <input type="radio" name="LookR" value="1" />是
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <div class="col-md-2 col-sm-2  control-label"><span class="text-danger">*</span> 是否设置作答时间：</div>
                            <div class="col-sm-6">
                                <input type="radio" name="SetTime" value="0" onclick="edd()" />否
                                                       <input type="radio" name="SetTime" value="1" onclick="ecc()" />是
                                                        <div id="SetTimes" style="display: none">
                                                            <span>
                                                                <input type="text" style="width: 70px; font-size: 9px;" id="StarTime" name="StarTime" /></span>
                                                            <span>-</span>
                                                            <span>
                                                                <input name="EndTime" style="width: 70px; font-size: 9px;" id="EndTime" /></span>
                                                        </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="group">
                            <div class="col-md-2 col-sm-2  control-label"><span class="text-danger">*</span> 是否设置随机呈现：</div>
                            <div class="col-sm-6">
                                <input type="radio" name="Random" value="0" />否
                                <input type="radio" name="Random" value="1" />是
                                                     
                                               
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="text-align: center;">
                        <div class="col-md-6 col-sm-2  control-label">
                            <button type="submit" class="btn btn-primary btn-sm" style="border: 1px solid orange; color: orange;" id="FenPei">分配</button>
                        </div>
                        <div class="col-md-1 col-sm-2  control-label">
                            <button type="button" onclick="Exit()" class="btn  btn-sm btn-primary">返回</button>
                        </div>


                    </div>

                </form>

            </div>

        </div>
    </div>
    <input type="hidden" id="DepID" />
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <%-- <script src="../../JS/bootstrap-datetimepicker.zh-CN.js"></script>--%>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>
    <script>
        var navName = '/FunctionModular/Heartevaluation/Heartevaluation.aspx';
        //initSelectInput("Remark=1", "Sel_RoleType", "--角色名称--");//初始化量表类别
        var CheckArray = [];
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


        function Exit() {
            var url = window.location;
            var urlArr = url.toString().split('/');
            var ustr = "http://" + urlArr[1] + "/" + urlArr[2] + "/" + urlArr[3] + "/heartevaluation/heartevaluation.aspx";
            window.location.href = ustr;
        }

        $("#StarTime").datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式

        }).on('hide', function (e) {
            $('#DisAdd').data('bootstrapValidator')
                .updateStatus('StarTime', 'NOT_VALIDATED', null)
                .validateField('StarTime');
        });
        $("#EndTime").datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式

        }).on('hide', function (e) {
            $('#DisAdd').data('bootstrapValidator')
                .updateStatus('EndTime', 'NOT_VALIDATED', null)
                .validateField('EndTime');
        });

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
                fnDrawCallback: function (oSettings) {
                    $.each(CheckArray, function (index, value) {

                        $("#" + value).attr("checked", true);
                        //$("#checkbox").attr("checked", false);                                                   
                    });
                    var arrayCheck = $(".checkbox");
                    var isSuccess = true;
                    for (var i = 0; i < arrayCheck.length; i++) {
                        if (arrayCheck[i].checked == false) {
                            isSuccess = false;
                            break;
                        }
                    }
                    if (arrayCheck.length <= 0)
                        isSuccess = false;
                    $("#checkbox")[0].checked = isSuccess;
                },
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: false,
                        aTargets: [0]
                    },
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/DistributionGauge.ashx",
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

                    $('td:eq(0)', row).html(" <input class='checkbox' type=\"checkbox\" id=\"" + data[0] + "\" name=\"UserNames\" value=\"" + data[0] + "\" />");


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
        //单击勾选状态
        $('#DataTables-Gauge').on('click', 'input', function () {
            var tdArr = $(this);
            var check = tdArr.prop("checked")
            var id = tdArr.val();
            if (check && check == true) {
                if (id != null && id != "" && id != 0) {
                    //var result = $.inArray(id, CheckArray);//如果不存在的话追加数据
                    //if (result == -1) {
                    //    CheckArray.push(id);
                    //}
                    CheckArray.push(id);
                }
            } else {
                if (id != null && id != "" && id != 0) {
                    CheckArray.splice($.inArray(id, CheckArray), 1);
                }
            }
        });
        //全选
        function SelectAll(obj) {
            if (obj.checked) {
                $("input[type=checkbox][name=UserNames]").prop("checked", true);

            } else {
                $("input[type=checkbox][name=UserNames]").prop("checked", false);
            }
            $("#DataTables-Gauge").find("tr").each(function () {
                var tdArr = $(this).find("input");
                var check = tdArr.prop("checked")
                var id = tdArr.val();
                if (check && check == true) {
                    if (id != null && id != "" && id != 0) {
                        //var result = $.inArray(id, CheckArray);//如果不存在的话追加数据
                        //if (result == -1) {
                        //    CheckArray.push(id);
                        //}
                        CheckArray.push(id);
                    }
                } else {
                    if (id != null && id != "" && id != 0) {
                        CheckArray.splice($.inArray(id, CheckArray), 1);
                    }
                }
            });
        }

        //参数类型添加
        var TestType = "";
        var Retest = "";
        var Notice = "";
        var NoticeContent = "";
        var LookR = "";
        var StarTime = "";
        var EndTime = "";
        var RandomValue = "";


        //function bootstrapValidator_XH()
        //{
        //    $('#DisAdd').data('bootstrapValidator').destroy();
        //    $('#DisAdd').data('bootstrapValidator', null);
        //}

        //function bootstrapValidator_JH()

        //{


        $('#DisAdd').bootstrapValidator({
            message: '表单验证失败.',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                TestType: {
                    group: '.group',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        },
                        callback: {
                            message: '请将必填项填写完整',
                            callback: function (value, validator) {

                                var vals = $('input:radio[name="TestType"]:checked').val();
                                if (vals == 1) {
                                    TestType = 1;
                                    //$("#TestTypes").css("border", "1px solid red");
                                    $("#TestTypes").val("");

                                    $('#DisAdd').bootstrapValidator('updateStatus', 'TestTypes', 'NOT_VALIDATED')
                                    $('#DisAdd').bootstrapValidator('validateField', 'TestTypes');
                                    return true;
                                } else {
                                    TestType = 0;
                                    $("#TestTypes").val("");
                                    $("#TestTypes").removeAttr("style");
                                    $("#TestTypes").val("1");
                                    $("#TestTypes").hide();

                                    //$('#DisAdd').bootstrapValidator('updateStatus', 'TestTypes', 'NOT_VALIDATED')
                                    //$('#DisAdd').bootstrapValidator('validateField', 'TestTypes');

                                    return true;
                                }
                            }
                        }
                    }
                },
                TestTypes: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        },
                        stringLength: {
                            min:1,
                            max: 10,
                            message:"请输入少于10位的内容"
                        }

                    }
                },

                Retest: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        },
                        callback: {
                            message: '请将必填项填写完整',
                            callback: function (value, validator) {
                                var vals = $('input:radio[name="Retest"]:checked').val();
                                if (vals == 1) {
                                    Retest = vals;

                                    //$("#IntervalDay").css("border", "1px solid red");
                                    $("#IntervalTime").show();


                                    return true;

                                } else {
                                    Retest = 999;
                                    $("#IntervalDay").val("");
                                    //$("#IntervalDay").removeAttr("style");
                                    $("#IntervalTime").hide();
                                    return true;
                                }
                                //$('#DisAdd').data('bootstrapValidator')
                                //    .updateStatus('IntervalDaynmae', 'NOT_VALIDATED', null)
                                //    .validateField('IntervalDaynmae');
                            }
                        },

                    }
                }, Notice: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        },
                        callback: {
                            message: '请将必填项填写完整',
                            callback: function (value, validator) {
                                //alert(1);
                                var vals = $('input:radio[name="Notice"]:checked').val();
                                var CheckVal = "";
                                if (vals == 3) {
                                    Notice = 3;
                                    $("#NoticeContent").css("border", "1px solid red");
                                    $("#SendTd").show();
                                    CheckVal = $('[name="sendtype"]:checked').val();
                                    if (CheckVal != undefined) {

                                        return true;
                                    }
                                    $("data-bv-for='sendtype'").attr("style", "display: none;")
                                    // return true;

                                } else {
                                    $("[name='sendtype']").removeAttr("checked")
                                    $("#noinset").css("color", "#3C763D")
                                    $("#NoticeContent").val("");
                                    Notice = value;
                                    //$("#NoticeContent").removeAttr("style");
                                    $("#SendTd").hide();
                                    return true;
                                }


                            }
                        }

                    }
                }, LookR: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        },
                        callback: {
                            message: '请将必填项填写完整',
                            callback: function (value, validator) {
                                var vals = $('input:radio[name="LookR"]:checked').val();
                                LookR = value;
                                return true;

                            }
                        }

                    }
                },
                sendtype: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整'
                        }
                    },

                },
                SetTime: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整'
                        },
                        callback: {
                            message: '请将必填项填写完整',
                            callback: function (value, validator) {
                                var vals = $('input:radio[name="SetTime"]:checked').val();
                                var CheckVal = "";
                                if (vals == 1) {
                                    $("#StarTime").css("border", "1px solid red");
                                    $("#EndTime").css("border", "1px solid red");
                                    $("#SetTimes").show();
                                    CheckVal = $('[name="sendtype"]:checked').val();

                                    if (CheckVal != undefined) {

                                        return true;
                                    }
                                    return true;

                                } else {
                                    $("#StarTime").val("");
                                    $("#EndTime").val("");
                                    //$("#NoticeContent").removeAttr("style");
                                    $("#StarTime").removeAttr("style");
                                    $("#EndTime").removeAttr("style");
                                    $("#SetTimes").hide();
                                    $("[ class='help-block'][data-bv-for='EndTime' ]").css("display", "none");
                                    return true;
                                }


                            }
                        }

                    }
                },
                Random: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        },
                        callback: {
                            message: '请将必填项填写完整',
                            callback: function (value, validator) {
                                var vals = $('input:radio[name="Random"]:checked').val();
                                RandomValue = vals;
                                return true;

                            }
                        }

                    }
                },

                IntervalDaynmae: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        numeric: { message: '序列范围只能输入数字' },
                        stringLength: {
                            
                            max: 9,
                            message: '数字长度最大为9位'
                        }

                    }
                }
                //,
                //NoticeContent: {
                //    group: '.group',
                //    message: '验证失败',
                //    verbose: false,
                //    validators: {
                //        //notEmpty: {
                //        //    message: '请将必填项填写完整！'
                //        //},
                //        callback: {
                //            message: '请将必填项填写完整',
                //            callback: function (value, validator) {
                //                var SendEmailSel = $("#SendEmail").is(':checked');
                //                if (value != null && value != "") {
                //                    // $("#NoticeContent").removeAttr("style");
                //                    return true;

                //                } else {
                //                    return false;
                //                }
                //                return true;

                //            }
                //        }
                //    }
                //}
                , StarTime: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        }, callback: {
                            message: '起始时间小于结束时间！',
                            callback: function (value, validator) {
                                if (value != null && value != "") {
                                    $("#StarTime").removeAttr("style");
                                    StarTime = $("#StarTime").val();
                                    var Endtime = $("#EndTime").val();
                                    var start = new Date(StarTime.replace("-", "/").replace("-", "/"));
                                    if (Endtime != null && Endtime != "") {
                                        var end = new Date(Endtime.replace("-", "/").replace("-", "/"));
                                        return start <= end;
                                    } else {
                                        return true;
                                    }
                                }
                            }
                        }

                    }
                }, EndTime: {
                    group: '.group',
                    message: '验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整！'
                        }, callback: {
                            message: '起始时间小于结束时间！',
                            callback: function (value, validator) {
                                if (value != null && value != "") {
                                    $("#EndTime").removeAttr("style");
                                    StarTime = $("#StarTime").val();
                                    EndTime = value;
                                    var start = new Date(StarTime.replace("-", "/").replace("-", "/"));
                                    var end = new Date(EndTime.replace("-", "/").replace("-", "/"));
                                    return end >= start;
                                }

                            }
                        }

                    }
                },
            }

        }).on('success.form.bv', function (e) {
            e.preventDefault();

            var AcodeItem = localStorage.getItem("Acode");
            var UserOld = localStorage.setItem("UserOld", CheckArray);
            var UserNew = localStorage.getItem("UserOld");
            layer.load(0, { shade: false }); //0代表加载的风格，支持0-2
            $("#FenPei").attr({ "disabled": "disabled" });
            setInterval('butt()', 3000);

            if (TestType == 0) {
                TestType = "日常测验";
            } else {
                TestType = $("#TestTypes").val();

            }
            if ($("#SendInner ").prop("checked") == true && $("#SendEmail ").prop("checked") == true) {
                Notice = 3;
                NoticeContent = $("#NoticeContent").val();

            } else if ($("#SendEmail").prop("checked") == true) {
                Notice = 2;
                NoticeContent = $("#NoticeContent").val();
            } else if ($("#SendInner ").prop("checked")) {
                Notice = 1;
                NoticeContent = $("#NoticeContent").val();
            }
            if (Retest == 1) {
                Retest = 0;
            } else {
                Retest = 999;
            }
            //新增字段
            var ss = TestType;
            var ty = Notice;
            //var checkbox = document.getElementsByName("UserNames");

            //for (var i = 0; i < checkbox.length; i++) {
            //    if (checkbox[i].checked) {

            //        U_IDs += checkbox[i].value + ",";

            //    }
            //}
            if (CheckArray.length > 0) {
                layer.confirm('确定分配吗？', {
                    btn: ['是', '否'] //按钮
                }, function () {
                    layer.closeAll();
                    $.ajax({
                        url: "Ajax/DistributionGauge.ashx?type=Insert",
                        data: {
                            U_IDs: UserNew,
                            ACode: AcodeItem,//获取量表的传值
                            TestType: TestType,
                            Retest: Retest,
                            Notice: Notice,
                            NoticeC: NoticeContent,
                            LookR: LookR,
                            StarTime: StarTime,
                            EndTime: EndTime,
                            RandomValue: RandomValue
                        },
                        type: 'post',
                        success: function (result) {
                            results = eval("(" + result + ")")
                            if (results != null && results != "") {
                                var msg = "";
                                msg = "分配成功" + results.Sucess + "条" + "," + "分配失败" + results.Fail + "条";
                                layer.closeAll('dialog');
                                layer.msg(msg, { icon: 1, time: 2000 }, function () {
                                    Exit();
                                });

                            }
                            else {
                                layer.closeAll('dialog');
                                layer.msg('分配失败！', { icon: 5, time: 2000 });
                            }
                        }

                    })
                },
                function () {
                    layer.closeAll();
                }
                );

            } else {
                layer.closeAll('dialog');
                layer.alert('请选择成员！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
            }
        });
        //$("[name='UserNames']").click(function () {
        //    alert("*****");
        //});





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
                    url: '../BasicSetting/Ajax/DepartmentMain.ashx?Remark=OnLoadDep&rnd=' + Math.random() + '&mark=searchCondition',
                    usericon: 'd_icon',
                    idFieldName: 'id',
                    checkbox: false
                }
            });
        }

        function butt() {
            $('#FenPei').attr("disabled", false);
        }



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


        //function chebox() {

        //    var checkbox = document.getElementById("checkbox").checked;//得到主要 checkbox id 的状态
        //    var items = document.getElementsByName("UserNames"); //得到 name=chec的控件
        //    for (var i = 0; i < items.length; i++) {//然后循环
        //        //当前checkbox 的状态 = 所有的控件状态
        //        items[i].checked = checkbox;
        //    }
        //}

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



        function SendEmailF(obj) {

            var SendInner = document.getElementById("SendInner")
            var SendEmail = document.getElementById("SendEmail")
            if (SendInner.checked == true || SendEmail.checked == true) {
                $(".textcolor").css("color", "#3c763d")
            }
            else {
                $(".textcolor").css("color", "rgb(169, 68, 66)")
            }

        }
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });


        function onlyNumber(obj) {

            //得到第一个字符是否为负号  
            var t = obj.value.charAt(0);
            //先把非数字的都替换掉，除了数字和.   
            obj.value = obj.value.replace(/[^\d]/g, '');
            //必须保证第一个为数字而不是.     
            obj.value = obj.value.replace(/^\./g, '');
            //保证只有出现一个.而没有多个.     
            //obj.value = obj.value.replace(/\.{2,}/g, '.');
            //保证.只出现一次，而不能出现两次以上     
            obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
            //如果第一位是负号，则允许添加  
            //if (t == '-') {
            //    obj.value = '-' + obj.value;
            //}

        }


        function saveAdmin() {
            $(".textlei").css("color", "#3C763D")
            $("#TestTypes").val("132");
            $("#TestTypes").hide();

            //---在这里    $("#TestTypes")

            $("[data-bv-icon-for='TestTypes']").hide();//取消选中
            $("[data-bv-for='TestTypes']").hide();//取消选中


        }
        function aa() {
            $("[data-bv-validator='callback']").hide();
            $("[data-bv-validator='notEmpty']").hide();
            $("[data-bv-for='sendtype']").show();
            $("[data-bv-icon-for='Notice']").hide();
            $(".textcolor").css("color", "#a94442")
            $("[data-bv-for='sendtype']").css("color", "#a94442")
        }
        function bb() {

            $("[data-bv-for='sendtype']").hide();
            $(".textcolor").css("color", "#3C763D")
            //$("data-bv-for='sendtype'").attr("style", "display: none;")
            $("#SendInner").attr("checked", 'true');

        }
        function ecc() {
            //data-bv-icon-for="SetTime"
            $("[data-bv-icon-for='SetTime']").hide();
            $("[data-bv-icon-for='SetTime']").css("color", "#FFFFFF");
        }
        function edd() {
            $("[data-bv-icon-for='SetTime']").css("color", "#3c763d;");
            StarTime = "";
            EndTime = "";
        }

        function saveupdate() {
            $("#TestTypes").show();
            $("#TestTypes").val("")
            var newval = $("#TestTypes").val();
            if (newval == "") {
                $(".textlei").css("color", "#a94442")
            }
        }
    </script>
</asp:Content>
