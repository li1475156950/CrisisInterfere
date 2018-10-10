<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="CreateDynamicEstimate.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.CreateDynamicEstimate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <!-- Bootstrap Styles-->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="/css/custom-styles.css" rel="stylesheet" />
    <link href="/css/custom-styles_1.css" rel="stylesheet" />
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/css/base.css" rel="stylesheet" />
    <link href="/css/rysz.css" rel="stylesheet" />
    <link href="/css/wjyj.css" rel="stylesheet" />
    <link href="/css/font-awesome.min_1.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <div class="content">
        <!-- main -->
        <div class="x_reports">
            <form action="">
                <h3 class="fb tc mt10 mb30">新建评估</h3>
                <div class="part mt40">
                    <div class="tc title">
                        <span class="f16 white">基本信息</span>
                    </div>
                    <div class="mt65 mb65 overflow">
                        <div class="form-group col-sm-6 " style="margin-top: 20px; text-align: center">
                            <label class="col-sm-3  col-xs-4 control-label mt5 nopr ml50">评估人：&nbsp;</label>
                            <div class="col-sm-6 col-xs-6 nopl">
                                <input id="loginName" class="form-control" placeholder="登录名/姓名" readonly="true" />
                            </div>
                        </div>
                        <div class="form-group col-sm-6 " style="margin-top: 20px; text-align: center">
                            <label class="col-sm-3  col-xs-4 control-label mt5 nopr ml50">危机等级：&nbsp;</label>
                            <div class="col-sm-6 col-xs-6 nopl">
                                <select id="warningLevel" class="form-control f16">
                                    <option value="0">--请选择等级--</option>
                                    <option value="1">暂无</option>
                                    <option value="2">较低</option>
                                    <option value="3">中级</option>
                                    <option value="4">较高</option>
                                    <option value="5">极高</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="part mt50">
                    <div class="tc title">
                        <span class="f16 white">评估内容</span>
                    </div>
                    <div class="mt50">
                        <div class="form-group overflow mb40">
                            <div class="col-sm-12 col-xs-12 nopl mt15">
                                <textarea name="dynamicEstimateContent" id="dynamicEstimateContent" class="form-control" rows="10" maxlength="5000" onblur="return txtNameCheck(this,5000)">
                                                 家庭内部有矛盾
                                               预期的评选（如学生干部或职位调整）落空
                                               受批评或处分
                                               换工作或转学
                                               被罚款
                                               就业压力
                                               与人打架
                                               遭父母或其他亲友打骂
                                               生活习惯（饮食、休息等）明显变化
                                               长期远离家人不能团聚
                                               本人患急重病
                                            </textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt50 mb50">
                    <div class="col-sm-6  col-xs-6 text-right">
                        <button type="button" class="addDynamicEstimateReport btn btn-sm x_btn f14">保存</button>
                    </div>
                    <div class="col-sm-2  col-xs-3  text-right">
                        <button type="button" class="btn btn-sm x_btn1 f14" onclick="back()">取消</button>
                    </div>
                </div>
            </form>
        </div>
        <!-- main结束 -->
    </div>
    <!-- JS Scripts-->
    <!-- 左侧下拉框 Js -->
    <script src="../../JS/layer.js"></script>
    <!-- 左侧下拉框 Js 结束 -->
    <!-- Bootstrap Js -->
    <script>
        var navName = '/FunctionModular/RiskWarning/DynamicEstimate.aspx';
        $("#page-wrapper").addClass("x_wjgy");
        $("#page-wrapper").addClass("x_dagl");
        var userID = sessionStorage.getItem("userID");
        getName();
        var temp = $('#dynamicEstimateContent').text().replace(//g, '●');
        temp = temp.substring(2, temp.length);
        $('#dynamicEstimateContent').text('●' + temp);
        function getName() {
            $.ajax({
                url: "Ajax/DynamicEstimate.ashx",
                type: "post",
                dataType: "text",
                async: false,
                data: { operationType: "GetNowLoginName" },
                success: function (e) {
                    $('#loginName').val(e);
                }
            })
        }
        var dynamicEstimateReportModel = {};
        $(document).on("click", ".addDynamicEstimateReport", function () {
            var nowIndex = $('#warningLevel').find("option:selected").val();
            if (nowIndex == '0') {
                layer.alert('请选择危机等级！');
                return;
            }

            dynamicEstimateReportModel.WarningLevel = $("#warningLevel").find("option:selected").val();
            dynamicEstimateReportModel.DynamicEstimateContent = $("#dynamicEstimateContent").val();
            dynamicEstimateReportModel.UserID = userID;
            $.ajax({
                url: "Ajax/DynamicEstimate.ashx",
                type: "post",
                dataType: "json",
                async: false,
                data: { operationType: "AddDynamicEstimate", dynamicEstimateReportModel: JSON.stringify(dynamicEstimateReportModel) },
                success: function (data) {
                    if (data.State) {
                        layer.msg("评估成功，将跳转到列表页", { icon: 6, time:2000}, function () {
                            window.location.href = "DynamicEstimate.aspx";
                        })
                    }
                    //layer.alert(data.Data);
                }
            })
        })
        //判断名称格式与长度
        function txtNameCheck(data, length) {
            var obj = data.getAttribute('name');
            var txt = $("[name=" + obj + "]").val();
            var le = parseInt(length);
            if (txt.length > le) {
                var a = $(this).find("[data-bv-for=" + obj + "]");
                txt = txt.substring(0, le);
                $("[name=" + obj + "]").val(txt);
                $("small[data-bv-for=" + obj + "]").text('');
                $("[name=" + obj + "]").css("border-color", "#2b542c");
                $('[data-bv-icon-for=' + obj + ']i').css('display', 'none');
            }
        }
        function back() {
            window.location.href = 'DynamicEstimate.aspx';
        }
    </script>
    </object>
</asp:Content>
