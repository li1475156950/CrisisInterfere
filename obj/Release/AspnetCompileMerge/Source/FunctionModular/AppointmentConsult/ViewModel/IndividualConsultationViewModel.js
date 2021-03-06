﻿var zips;
function getZip() {
    return zips;
}

$(document).ready(function () {
    var viewModel = new IndividualConsultationViewModel();
    
});

function IndividualConsultationViewModel() {
    var self = this;

    self.Validator;// 验证对象
    self.GroupPeports;// 列表控件
    self.Startindex = 0;//开始条数索引
    self.Endindex = 10;//结束条数索引 

    // 重置 
    function fnReset() {
        $("#txtNumber").val('');
        $("#txtName").val('');
        $("#selectStatu").val('');
    }

    // 跳转编辑页面
    function fnJumpEdit(param) {
        var id = param == null ? 0 : param;
        window.location.href = "IndividualConsultationEdit.aspx?i=" + id;
    }


    // 加载 绑定事件
    function fnLoadBindEvent() {
        // 绑定 添加按钮事件
        $("#btnAdd").click(function () {
            fnJumpEdit();
        });

        // 查询按钮 点击事件
        $("#btnSearch").click(function () {
            self.fnLodaData();
        });

        //回车进行搜索
        $(document).keyup(function (e) {
            if (e.keyCode == 13) {
                self.fnLodaData();
            }
        });

        // 设置全选
        SetCheckAll();

        // 批量导出按钮 点击事件
        $("#btnBatchExport").click(function () {
            zips = new ZipArchive;


            var checkboxs = document.getElementsByName("checkbox");// 获取所有复选框
            var checkboxCheckeds = 0;// 复选框勾选状态的数量
            var checkboxCheckedIndex = 0;// 复选框遍历累加器

            // 遍历复选框
            $(checkboxs).each(function (i, item) {
                if (item.checked) {
                    checkboxCheckeds++;
                    return;
                }
            });
            // 验证是否选择要导出的报告
            if (checkboxCheckeds == 0) {
                layer.alert("选择要导出的报告！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            //加载层
            layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2

            // 递归加载Iframe 地址--批量导出
            function loadIframe() {
                var index = checkboxCheckedIndex;
                // 验证是否超出选中报告数组上限
                if (index >= checkboxCheckeds) {

                    layer.closeAll();
                    return;
                }
                // 加载iframe
                $("#iframeBatchExport").attr("src", "IndividualConsultationInfo.aspx?i=" + $(checkboxs[index]).val() + "&Allcount="
                    + checkboxCheckeds + "&Numbers=" + (checkboxCheckedIndex+1));
                // 累加选择框
                checkboxCheckedIndex++;
                localStorage.setItem("zips", zips);
            }

            // 加载iframe
            $("#iframeBatchExport").off("load").on("load", function () {
                // 延迟加载
                setTimeout(function () {
                    // 调用内容页 导出事件
                    $("#btnExport", window.frames["iframeBatchExport"].document).click();

                    // 延迟加载 iframe 地址
                    setTimeout(function () {
                        loadIframe();// 设置 iframe 地址
                    }, 500);

                }, 500);

            });

            // 设置 iframe 地址
            loadIframe();

        });

        // 批量删除按钮 点击事件
        $("#btnBatchDelete").click(function () {
            var identitys = "";
            var names = "";
            GetCheckedCheckBox({
                eachCallBack: function (index, item) {
                    var id = $(item).attr("value");
                    var name = $(item).attr("data-name");
                    identitys += id + ",";
                    names += name + ",";
                }
            });
            if (names == "") {
                layer.alert("请选择要删除的选项！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                });
                return;
            }
            layer.confirm("确定要将所选数据放入回收站吗? ", {
                btn: ["确定", "取消"]
            }, function () {
                layer.closeAll();
                NewAJAX({
                    url: "Ajax/IndividualConsultation.ashx?operationType=Del",
                    data: { id: identitys,name:names },
                    callBack: function (result) {
                        //var count = Number(result);
                        if (result) {
                            // 重新加载数据
                            self.fnLodaData();
                            layer.msg("删除成功！", { time: 2000, icon: 1 }, function () {
                                if ($("#tableGrid").find("tr").length == 2) {
                                    $("#allCheck")[0].checked = false;
                                }
                            });
                            
                        } else {
                            layer.msg("删除失败！", { time: 2000, icon: 5 }, function () {
                            });
                        }
                    }
                });
            });
            
        });


        $('#dtstart').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn', format: "yyyy-mm-dd", endDate: new Date() });
        $('#dtstart').datepicker('setStartDate', '2016-08-25');

        $('#EndDate').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn', format: "yyyy-mm-dd", endDate: new Date() });
        $('#EndDate').datepicker('setStartDate', '2016-08-25');
    }


    // 加载数据
    self.fnLodaData = function () {

        if (self.GroupPeports != undefined) {
            $("#tableGrid").DataTable().draw();
            return;
        }

        self.GroupPeports = NewDataTable({
            container: "tableGrid",
            ajax: {
                url: "Ajax/IndividualConsultation.ashx?operationType=Bind",
                data: function () {
                    return { keywords: $("#txtKeywords").val(), status: $("#selectStatu").val(), startTime: $("#dtstart").val(), endTime: $("#EndDate").val() }
                }
            },
            createdRow: function (row, data, dataIndex) {
                // 重置 行样式
                $(row).empty();

                var id = data[0];
                var status = data[5] == "" ? "未结案" : "已结案";

                // 查看按钮
                var btnLook = $("<button id='btnLook" + id + "' name='btnLook" + id + "'  class='btn btn-link' data-index='" + id + "'>查看</button>");
                // 删除按钮
                var btnDel = $("<button id='btnDel" + id + "' name='btnDel" + id + "' data-name='" + data[2] + "'  class='btn btn-link' data-index='" + id + "' >删除</button>");

                // 查看按钮 点击事件
                btnLook.on("click", function () {
                    var btnSelf = $(this);
                    var editId = btnSelf.attr("data-index");
                    // 跳转查看页
                    window.location.href = "IndividualConsultationInfo.aspx?i=" + editId;

                });

                // 删除按钮 点击事件
                btnDel.on("click", function () {

                    var btnSelf = $(this);
                    layer.confirm("确定要将该数据放入回收站吗? ", {
                        btn: ["确定", "取消"]
                    }, function () {

                        var editId = btnSelf.attr("data-index");
                        var editName = btnSelf.attr("data-name");
                        NewAJAX({
                            url: "Ajax/IndividualConsultation.ashx?operationType=Del",
                            data: { id: editId, name: editName },
                            callBack: function (result) {

                                if (result) {
                                    // 重新加载数据
                                    self.fnLodaData();
                                    layer.msg("删除成功！", { time: 2000, icon: 1 }, function () {
                                    });
                                } else {
                                    layer.msg("删除失败！", { time: 2000, icon: 5 }, function () {
                                    });
                                }
                            }
                        });
                    });
                });

                // 设置操作单元格
                var tdBtn = $("<td style='text-align:center;' width='200'></td>");
                // 添加 查看按钮
                tdBtn.append(btnLook);

                // 设置修改按钮
                if (status == "未结案") {
                    // 修改按钮
                    var btnEdit = $("<button id='btnEdit" + id + "' name='btnEdit" + id + "'  class='btn btn-link' data-index='" + id + "'>修改</button>");
                    // 修改按钮 点击事件
                    btnEdit.on("click", function() {
                        var btnSelf = $(this);
                        var editId = btnSelf.attr("data-index");
                        fnJumpEdit(editId);
                    });
                    tdBtn.append(btnEdit);
                } else {

                    var btnEdit = $("<button id='btnEdit" + id + "' name='btnEdit" + id + "' disabled='disabled' style='color:#333;' class='btn btn-link' data-index='" + id + "'>修改</button>");
                    tdBtn.append(btnEdit);
                }

                // 绑定 删除按钮
                tdBtn.append(btnDel);

                // 绑定其他列
                $(row).append("<td style='text-align:center;'><input class='childCheck' id='check" + data[0] + "'  value='" + data[0] + "'data-name='" + data[2] + "' name='checkbox' type='checkbox'  /></td>");
                $(row).append("<td style='text-align:center;'  >" + (dataIndex + 1) + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[1] + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[2] + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[3] + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[4] + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[6] + "</td>");
                $(row).append("<td style='text-align:center;' >" + status + "</td>");
                $(row).append(tdBtn);


            },
            initComplete: function () {

                $(".sorting_disabled").css("width", "auto");
            }

        });
    }

    // 展示添加页面
    self.eventShowAdd = function () {


    }

    // 展示修改、查看页面
    self.eventShowEdit = function (isEdit) {

        $("#editModal").modal("show");


    }

    // 初始化事件
    self.fnInit = function () {
        // 加载事件
        self.fnLodaData();
        // 绑定事件
        fnLoadBindEvent();
    }

    // 执行初始化
    self.fnInit();
}
