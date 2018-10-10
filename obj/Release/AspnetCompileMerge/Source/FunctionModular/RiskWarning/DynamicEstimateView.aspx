<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="DynamicEstimateView.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.DynamicEstimateView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <object style="width: 100%; height: 100%">
        <script src="../../js/bootstrap-datepicker.js"></script>
        <script src="../../js/bootstrap-datepicker.zh-CN.js"></script>
        <script src="../../js/jquery.metismenu.js"></script>
        <script src="../../js/custom-scripts.js"></script>
        <script src="../../js/object.js"></script>
        <link href="../../CSS/wjyj.css" rel="stylesheet" type="text/css" />
        <link href="../../css/font-awesome.min.css" rel="stylesheet" />
        <link href="../../css/base.css" rel="stylesheet" />
        <link href="../../css/rysz.css" rel="stylesheet" />
        <link href="../../css/font-awesome.min_1.css" rel="stylesheet" />
          <style>
              .updowm{
                 right:60px;top:5px;
              }
       </style>
        <div class="content pr" id="content">
            <!-- main -->
            <form action="">
                <h3 class="fb tc mt10">跟踪评估记录</h3>
                <div class="panel-group mt40" id="accordion" role="tablist" aria-multiselectable="true">
                </div>
                <div class="row mt50" id="FontExport">
                    <div class="col-sm-6  col-xs-6 text-right">
                        <button type="button" id="memberArchiveExport" class="btn btn-sm x_btn f14" onclick="MemberArchivesExport()">导出</button>
                    </div>
                    <div class="col-sm-2  col-xs-3  text-right">
                        <button type="button" class="btn btn-sm x_btn1 f14" onclick="back()">取消</button>
                    </div>
                </div>
            </form>
            <!-- main结束 -->
        </div>
        <!-- JS Scripts-->
        <!-- 左侧下拉框 Js -->
        <!-- 左侧下拉框 Js 结束 -->
         <script src="../../JS/word/FileSaver.js"></script>
        <script src="../../JS/word/jquery.wordexport.js"></script>
        <script type="text/javascript">
            var navName = '/FunctionModular/RiskWarning/DynamicEstimate.aspx';
            $("#page-wrapper").addClass("x_dtpg");
            var userID = sessionStorage.getItem("userID");
            GetDynamicEstimateReportInfo();
            function GetDynamicEstimateReportInfo() {
                $.ajax({
                    url: "Ajax/DynamicEstimate.ashx",
                    type: "post",
                    dataType: "json",
                    async: false,
                    data: { userID: userID, operationType: "GetDynamicEstimateReportInfo" },
                    success: function (data) {
                        $.each(data, function (index, item) {
                            item.DynamicEstimateContent = item.DynamicEstimateContent.replace(/●/g, '</br>')
                            var html = '<div class="panel panel-default">' +
                                    '<div   class="panel-heading pr DivWord" role="tab" id="headingOne">' +
                                     '<h4 class="panel-title">' +
                                        '<a role="button" data-toggle="collapse" data-parent="#accordion" id="accordions"  href="#' + item.DyEstiID + '" aria-controls="collapseOne" class="">' +
                                          '<div class="pull-left">' +
                                              '危机级别：<span >' + item.WarningState + '</span>' +
                            '&nbsp;&nbsp;&nbsp;&nbsp;评估人：<span ">' + item.CounselorName + '</span>' +
                            '&nbsp;&nbsp;&nbsp;&nbsp;<span>' + item.DynamicEstimateDate + '</span>' +
                            '</div>' +
                        '<div class="pull-right">' +
                          '<span class="x_fh mr30"></span><span id=' + item.DyEstiID + "a" + ' class="glyphicon glyphicon-chevron-down updowm" ></span>' +
                        '</div>' +
                      '</a>' +
                    '</h4>' +

                    '<i class="iconfont f12  words" id="x_close" data-id="' + item.DyEstiID + '" >&#xebf9;</i>' +
                  '</div>' +
                  '<div id="' + item.DyEstiID + '" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">' +
                    '<div  style="border: 1px solid #ccc;font-size: 16px;padding: 15px;font-family: 微软雅黑; word-wrap: break-word;">' +
                       '<div class="tc mt10">评估人：<span class="mr40">' + item.CounselorName + '</span> 危机级别：<span>' + item.WarningState + '</span></div>' +
                       '<div class="box">' +
                                             '<dl class="pl30 pr30 mt30" style="margin-top:0px;word-wrap: break-word;">' + item.DynamicEstimateContent
                                             +
                                             '</dl>' +
                                         '</div>' +
                                      '</div>' +
                                    '</div>' +
                                  '</div>';
                            $("#accordion").append(html);
                        })
                    }
                })
            }
            function back() {
                window.location.href = 'DynamicEstimate.aspx';
            }
            $(document).on("click", "#x_close", function () {
                var id = $(this).attr("data-id");
                layer.confirm("删除后不可恢复，确定删除本次评估吗?", {
                    btn: ["确定", "取消"],
                }, function () {
                    $.ajax({
                        url: "Ajax/DynamicEstimate.ashx?operationType=DeleteDynamic",
                        type: "post",
                        async: false,
                        dataType: "json",
                        data: { id: id },
                        success: function (data) {
                            if (data.State) {
                                layer.msg("删除成功", { time: 2000, icon: 6 }, function () {
                                    if ($(".panel").length == 1) {
                                        $.ajax({
                                            url: "Ajax/DynamicEstimate.ashx",
                                            type: "post",
                                            dataType: "json",
                                            data: { operationType: "AbsoluteDeleteDynamicEstimate", userID: sessionStorage.getItem("userID") },
                                            async: false,
                                            success: function (data) {
                                                if (data.State) {
                                                    window.location.href = "DynamicEstimate.aspx";
                                                }
                                            }
                                        })
                                    } else {
                                        window.location.href = "DynamicEstimateView.aspx";
                                    }

                                });
                            } else {
                                layer.msg("删除失败", { time: 2000, icon: 5 });
                            }
                        }
                    })
                });
            })
            //function accordions(obj) {
            //    var aa = $("#accordions").attr("class")
            //    var bb = $("#accordions").attr("href")

            //    if (aa != null && aa != "") {                
            //        $(bb+"a").removeAttr("class");
            //        $(bb + "a").attr("class", "glyphicon glyphicon-chevron-up updowm");
            //    } else {
            //        $(bb + "a").removeAttr("class");
            //        $(bb + "a").attr("class", "glyphicon glyphicon-chevron-down updowm ");
            //    }

            //};
            function MemberArchivesExport() {
                $("i").remove(".words");
                //$("#headingOne")
                $("#FontExport").hide();
                $("#content").wordExport("动态评估");
                $("#FontExport").show();
                var htmls = "<i class=\"iconfont f12 \" id=\"x_close\" data-id=\"' + item.DyEstiID + '\" >&#xebf9;</i>"
                $(".DivWord").append(htmls);
            }
        </script>
    </object>
</asp:Content>
