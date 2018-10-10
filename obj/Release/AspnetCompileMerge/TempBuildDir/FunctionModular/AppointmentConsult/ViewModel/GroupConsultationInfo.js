var navName = "/FunctionModular/AppointmentConsult/GroupConsultation.aspx";
$(document).ready(function () {
    var viewModel = new GroupConsultationInfo();

});
function GroupConsultationInfo() {
    var self = this;

    // 编辑Id
    self.EditId = function () {
        var result = 0;
        var param = fnGetUrlParam("i");
        if (!isNaN(param)) {
            result = param;
        }
        return result;
    }

    // 绑定控件事件
    function fnBindControlEvent() {

        // 返回 按钮点击事件
        $("#btnExport").click(function () {
            var Allcount = ""; var Numbers = ""; var z = "";
            var Allcount = fnGetUrlParam("Allcount");
            var Numbers = fnGetUrlParam("Numbers");
            if (Allcount != null && Allcount != "") {              
                var z = parent.getZip();
            }
           
            //z = JSON.parse(z);
            $(".infoMain").wordExport($(".caption").text(), Allcount, Numbers, z, "团体档案批量导出");
            //self.opener.location.reload();//刷新父页面的方法
            //$(".infoMain").wordExport($(".caption").text());
        });
        // 返回 按钮点击事件
        $("#btnBack").click(function () {
            window.location.href = "GroupConsultation.aspx";
        });
    }

    // 加载样式
    function fnLoadStyle() {

        $("#tableInfo th").attr("style", "color: #fff;background-color: #6DA1DD;width:100px;border:1px #E3E3E3 solid;text-align: center;padding:10px");
        $("#tableInfo td:gt(1)").attr("style", "background-color: #F5F5F5;width:150px;border:1px #E3E3E3 solid;text-align: center;padding:10px");
        $("legend").attr("style", "display: block;width: 100%;padding: 0;margin:0px 0px 20px 10px;line-height: inherit;border-bottom: 1px dashed #e5e5e5;font-size: 14px;color: #333333;");
    }

    // 加载legend
    function fnLoadLegend(param) {
        $("#divRecordMain").append("<legend >第<span class='legendTitle' style='font-size: 16px; font-weight: bold;'> " + param.Index + " </span>次咨询记录<span class='legendTime' style='font-size:12px;color:#999999;'> " + param.Time + "</span></legend>");
    }

    // 加载记录行样式
    function fnLoadRowControl(param) {
        param.Container.append("<th style='width: 150px;text-align:right;font-weight: bold;padding: 5px 5px 5px 0px;font-size:12px;'><label>" + param.Title + "：" + "<label></th>" +
                               "<td style='text-align:left;padding: 5px 5px 5px 5px;font-size:12px;'>" + param.Content + "</td>");
    }
    // 加载第一行
    function fnLoadRowOne(param) {
        var starDefault = 5;// 星星默认数量
        var starNull = "☆";// 空星星
        var star = "★";// 实心星星
        var starStr = "";// 星星显示字符串

        // 遍历添加 使用的星星
        var starCount = param.StarCount;
        var i;
        for (i = 0; i < starCount; i++) {
            starStr += star;
        }

        // 遍历添加空空
        for (i = 0; i < starDefault - starCount; i++) {
            starStr += starNull;
        }

        var title = "<span style='font-size:20px;'>" + param.Title + "</span>";
        var content = "<span style='color: #DFAA17;font-size:20px;'>" + starStr + "</span>";
        fnLoadRowControl({ Title: title, Content: content, Container: param.Container });

    }
    // 加载 其他行信息
    function fnLoadRowOther(param) {

        var content = (param.Content == "" ? "&nbsp;" : param.Content);
        fnLoadRowControl({ Title: param.Title, Content: content, Container: param.Container });
    }


    // 加载 数据
    function fnLoadInfo() {
        var table = $("#UserListInfo")
        //加载层
        layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2
        NewAJAX({
            url: "Ajax/GroupConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "GetGroupInfo",// action类型
                identity: self.EditId(),// Id 
                isEdit: "1"// 是否编辑
            },
            callBack: function (result) {
               
                var Numbers = 0;
                $("#GroupTitle").text(result.ThemName + "-团体咨询档案")
                $("#labelThemName").text(result.ThemName);//主题
                $("#labelQuestionType").text(result.QTName);//问题类型
                $("#labelNumber").text(result.Number);//团体档案号
                $("#GroupDescribe").text(result.GroupDescribe);
               
                var table;
                var container;
                var tableStr = "<table style='border-spacing: 0px; border-collapse: collapse; width:100%;margin-top:20px;'></table>";
                var endDateStr = "";

                if (result.Record.Content == "") {
                    $("#divRecordCaption").hide();
                    $("#divRecordMain").hide();
                } else {
                    $("#divRecordCaption").show();
                    $("#divRecordMain").show();
                    container = $("#divRecordMain"); // 加载 记录信息
                    var records = JSON.parse(result.Record.Content);
                    $(records).each(function (indexRecord, itemRecord) {

                        table = $(tableStr); // 遍历 记录集
                        //var tr = $("<tr></tr>");
                        fnLoadLegend({ Index: itemRecord.Contents[0].RecordCount, Time: itemRecord.Contents[0].RecordTime });
                        //fnLoadRowOne({ Container: tr, Title: '严重程度', StarCount: itemRecord.Severity });
                        //table.append(tr);

                        // 遍历 记录内容集
                        $(itemRecord.Contents).each(function (indexContent, itemContent) {
                            tr = $("<tr></tr>");
                            fnLoadRowOther({ Container: tr, Title: itemContent.Title, Content: itemContent.Content });
                            table.append(tr);
                            if (itemContent.InterviewEndDate != null) {
                                // 设置 结束时间
                                endDateStr = itemContent.InterviewEndDate;
                            }
                        });
                        container.append(table);
                    });
                }

                // 持续时间
                //$("#labelTimeSlot").text(result.StartDateStr + " - " + endDateStr);


                // 加载 结案总结 
                var summary = result.Summary;
                if (summary == null) {
                    $("#divSummaryCaption").hide();
                    $("#divSummaryMain").hide();

                } else {

                    $("#divSummaryCaption").show();
                    $("#divSummaryMain").show();
                    container = $("#divSummaryMain");

                    table = $(tableStr);
                    if (summary.ConsultingEffect > 0) {
                        var tr = $("<tr></tr>");
                        fnLoadRowOne({ Container: tr, Title: '咨询效果评估', StarCount: summary.ConsultingEffect });
                        table.append(tr);
                    }

                    // 加载必填总结
                    tr = $("<tr></tr>");
                    var mainSummary ="";
                    if (summary.Content != null && summary.Content != "")
                    {
                        mainSummary = JSON.parse(summary.Content);
                        var mainSummaryTitle = "";
                        var  mainSummaryContent = "";
                        if (mainSummary.Title != null && mainSummary.Title != "" && mainSummary.Title != undefined)
                        {
                            mainSummaryTitle = mainSummary.Title;

                        }
                        if (mainSummary.Content != null && mainSummary.Content != "" && mainSummary.Content != undefined)
                        {
                            mainSummaryContent = mainSummary.Content;
                        }
                        if (mainSummaryTitle != null && mainSummaryTitle != "")
                        {
                            fnLoadRowOther({ Container: tr, Title: mainSummaryTitle, Content: mainSummaryContent });
                            table.append(tr);
                        }
                    }
                    

                    // 遍历 记录内容集
                    if (summary.OtherContent != null && summary.OtherContent != "") {
                        $(JSON.parse(summary.OtherContent)).each(function (indexContent, itemContent) {
                            tr = $("<tr></tr>");
                            fnLoadRowOther({ Container: tr, Title: itemContent.Title, Content: itemContent.Content });
                            table.append(tr);
                        });
                    }
                    container.append(table);
                }
                // 加载样式
                fnLoadStyle();
                layer.closeAll();
            }
        });
    }

    // 初始化事件
    self.fnInit = function () {
        // 绑定 控件时间
        fnBindControlEvent();

        // 加载 个案信息
        fnLoadInfo();
    }

    // 执行 初始化事件
    self.fnInit();
}