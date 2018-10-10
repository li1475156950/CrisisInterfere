var navName = "/FunctionModular/AppointmentConsult/CaseanalysisList.aspx";

$(document).ready(function () {
    var viewModel = new LoadCaseanaly();

});
function LoadCaseanaly() {
    var self = this;
    self.Caseanal;//列表控件

    //self.fnLodaData();
    // 加载数据
    self.fnLodaData = function () {

        if (self.Caseanal != undefined) {
            $("#tableGrid").DataTable().draw();
            return;
        }

        self.Caseanal = NewDataTable({
            container: "tableGrid",
            ajax: {
                url: "Ajax.ashx?operationType=Bind",
                data: function () {
                    return {}
                }
            },
            createdRow: function (row, data, dataIndex) {
                // 重置 行样式

                $(row).empty();
                var btnlook = $("<button  name='btnLook'  id='Look' class='btn btn-link'  value='" + data[2] + "'>查看</button>");
                var tdBtn = $("<td style='text-align:center;'></td>");
                tdBtn.append(btnlook);
                $(row).append("<td style='text-align:center;'>" + data[0] + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[1] + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[3] + "</td>");
                $(row).append(tdBtn);
                btnlook.on("click", function () {
                    var looks = $(this).val();
                    window.location.href = "TeachingPlan.aspx?i=" + looks;

                });
            },
            initComplete: function () {

                $(".sorting_disabled").css("width", "auto");
            }

        });
    }
    //function fnLoadBindEvent() {
    //    $("#Look").click(function () {
    //        look(url)
    //    });
    //}
    //function look(url) {
    //    window.location.href = url;
    //}
    ////查看页面

    // 初始化事件
    self.fnInit = function () {
        // 加载事件
        self.fnLodaData();
        // 绑定事件

    }

    // 执行初始化
    self.fnInit();
}