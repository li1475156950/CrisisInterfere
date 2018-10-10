<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DistributionGauge.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation_DistributionRecord.DistributionGauge" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
      <div class="row">
        <div class="col-md-12">

            <h1 class="page-header">量表管理 <small>量表分配</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">量表分配</a></li>

            </ol>
        </div>
    </div>
        <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    量表展示  
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">
                            <thead>
                                <tr>
                                    <th>选框</th>
                                    <th>
                                        <input type="checkbox" value="0" /></th>
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
            </div>          
            <!--End Advanced Tables -->
                      <div class="panel panel-default">
                <div class="panel-heading">
                    参数设置 
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table >
                          
                            <tbody>
                                <tr style="height:50px;">
                                    <td style=" width:80px;">测试类型</td>
                                     <td style=" width:80px;"><input type="radio" name="TestType" value="0" />日常测验</td>
                                     <td style=" width:80px;"><input type="radio" name="TestType" value="1"/>普测</td>
                                     <td style=" width:80px;" ><input  id="TestTypes" style="display:none"/></td>
                                </tr>
                               <tr style="height:50px;">
                                    <td style=" width:80px;">重测</td>
                                     <td style=" width:80px;"><input type="radio" name="Retest"  value="0"/>不可重测</td>
                                     <td style=" width:80px;"><input type="radio" name="Retest" value="1"/>可重测</td>
                                     <td style=" width:80px; display:none" id="IntervalTime">两次作答时间间隔<input  id="IntervalDay" style="width:30px; "/>天</td>
                                </tr>
                               <tr style="height:50px;">
                                    <td style=" width:100px;">是否发送通知</td>
                                     <td style=" width:80px;"><input type="radio" name="Notice" value="0"/>否</td>
                                     <td style=" width:80px;"><input type="radio" name="Notice" value="3"/>是</td>
                                     <td style=" width:80px; display:none" id="SendTd">
                                          <span><input  type="checkbox"  name="sendtype" id="SendInner" value="1"/>站内信</span>
                                           <span><input  type="checkbox" name="sendtype" id="SendEmail" value="2"/>邮件箱</span>
                                          <span><input  type="text"  id="NoticeContent"/></span>
                                         </td>
                                </tr>
                                 <tr style="height:50px;">
                                    <td style=" width:100px;">是否可查看报告</td>
                                     <td style=" width:80px;"><input type="radio" name="LookR" value="0"/>否</td>
                                     <td style=" width:80px;"><input type="radio" name="LookR" value="1" />是</td>
                                     <td style=" width:80px;">                                       
                                     </td>
                                </tr>
                                 <tr style="height:50px;">
                                    <td style=" width:120px;">是否设置作答时间</td>
                                     <td style=" width:80px;"><input type="radio"   name="SetTime" value="0"/>否</td>
                                     <td style=" width:80px;"><input type="radio" name="SetTime" value="1"/>是</td>
                                     <td style=" width:80px; display:none" id="SetTime">
                                         <span ><input  type="text" style="width:70px; font-size:9px;" id="StarTime"  name="StarTime"/></span>
                                         <span>-</span>
                                         <span ><input  name="EndTime" style="width:70px; font-size:9px;" id="EndTime"/></span>
                                     </td>
                                </tr>
                                 <tr style="height:50px;">
                                    <td style=" width:120px;">是否设置随机呈现</td>
                                     <td style=" width:80px;"><input type="radio" name="Random" value="0"/>否</td>
                                     <td style=" width:80px;"><input type="radio"name="Random"  value="1"/>是</td>                                    
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
            <button  type="button" onclick="Submit()">提交</button>
           <%-- end--%>
        </div>
    </div>
      <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="../../JS/bootstrap-datetimepicker.zh-CN.js"></script>
    <script>
        $("#StarTime").datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式
           
        }).on('hide', function (e) {
            $('#UserInfoAdd').data('bootstrapValidator')
                .updateStatus('Birthday', 'NOT_VALIDATED', null)
                .validateField('Birthday');
        });
        $("#EndTime").datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式
           
        }).on('hide', function (e) {
            $('#UserInfoAdd').data('bootstrapValidator')
                .updateStatus('Birthday', 'NOT_VALIDATED', null)
                .validateField('Birthday');
        });
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        $('#DataTables-Gauge').dataTable({
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
                    return 'type=GetUserInfo &StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex;
                }
            },

            createdRow: function (row, data, dataIndex) {

                $('td:eq(0)', row).html(" <input type=\"checkbox\" name=\"UserNames\" value=\"" + data[0] + "\" />");

             
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



        /*-----列表展现部分END-----*/
        var TestType = "";
        var Retest = "";      
        var Notice = "";
        var NoticeContent = "";
        var LookR = "";
        var StarTime = "";
        var EndTime = "";
        var RandomValue = "";
        //测试类型选中
        $("input[name='TestType']").click(function () {
            if ($(this).val() == 0) {
                TestType = $(this).parent().text();
            } else {
                $("#TestTypes").show();
              
                TestType = $("#TestTypes").val();
            }
        });
        //重测
        $("input[name='Retest']").click(function () {
            if ($(this).val() == 0) {
                Retest = 0;
            } else {
                $("#IntervalTime").show();
                Retest = $("#IntervalDay").val();

            }
        });
        //是否发通知
        $("input[name='Notice']").click(function () {
           
            Notice = $(this).val();
            if (Notice == 3)
            {
                $("#SendTd").show();
            }
           
        });
        //查看报告
        $("input[name='LookR']").click(function () {
            LookR = $(this).val();
        });
        //设置作答时间
        $("input[name='SetTime']").click(function () {
            if ($(this).val() == 0) {
                StarTime = "";
                EndTime = "";;
            } else {
                $("#SetTime").show()
                StarTime = $("#StarTime").val();
                EndTime = $("#StarTime").val();
            }
        });
        //随机呈现
        $("input[name='Random']").click(function () {
            RandomValue = $(this).val();
        });
        //name名称
        $("input[name='sendtype']").click(function () {        
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
        });
        //提交分配
        function Submit() {
            var ss = TestType;
            var ty = Notice;
            var checkbox = document.getElementsByName("UserNames");
            if (checkbox.length > 0) {
                if (TestType == null || TestType == "")
                {
                    layer.alert('请选择类型！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                } else if (Retest == null )
                {
                    layer.alert('请选择重测！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                } else if (Notice == null || Notice == "")
                {
                    layer.alert('请选择通知！', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    });
                } else if (Notice == 3) {
                    if (NoticeContent == null || NoticeContent == "") {
                        layer.alert('请选择通知！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        });
                    }
                } else if (LookR == null || LookR=="")
                {
                    if (NoticeContent == null || NoticeContent == "") {
                        layer.alert('请选择查看报告！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        });
                    }
                } else if (RandomValue == null && RandomValue == "")
                {
                    if (NoticeContent == null || NoticeContent == "") {
                        layer.alert('请选择随机！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        });
                    }
                }
                else {
                    var U_IDs = "";//注意
                    for (var i = 0; i < checkbox.length; i++) {
                        if (checkbox[i].checked) {

                            U_IDs += checkbox[i].value + ",";

                        }
                    }
                    if (U_IDs.length > 0) {
                        layer.confirm('确定通过吗？', {
                            btn: ['是', '否'] //按钮
                        }, function () {

                            $.ajax({
                                url: "Ajax/DistributionGauge.ashx?type=Insert",
                                data: {
                                    U_IDs: U_IDs,
                                    ACode: getUrlParam("Acode"),                              
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
                                    if (result == "True") {
                                        $("#dataTables-example").DataTable().draw();
                                        layer.msg('通过成功！', { icon: 1 });

                                    }
                                    else {
                                        layer.msg('通过失败！', { icon: 1 });
                                    }
                                }

                            })


                        });

                    } else {
                        layer.alert('请选择成员！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        });
                    }
                }
            }
        }
        //获取地址栏的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
    </script>
</asp:Content>
