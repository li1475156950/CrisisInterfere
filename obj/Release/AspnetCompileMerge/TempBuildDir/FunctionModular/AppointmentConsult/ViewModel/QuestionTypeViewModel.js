var navName = "/FunctionModular/AppointmentConsult/QuestionType.aspx";
$(document).ready(function () {
    var viewModel = new QuestionTypeViewModel();

});

function QuestionTypeViewModel() {
    var self = this;

    self.Validator;// 验证对象
    self.GroupPeports;// 列表控件
    self.Startindex = 0;//开始条数索引
    self.Endindex = 10;//结束条数索引
    self.EditId = 0;// 编辑的Id

    // 加载 验证
    function fnLoadValidator() {
        if ($("#formInfo").data('bootstrapValidator'))
            $("#formInfo").data('bootstrapValidator').destroy();
        $('#formInfo').data('bootstrapValidator', null);

        // 绑定 验证
        $("#formInfo").bootstrapValidator({
            message: '表单验证失败.',
            feedbackIcons: {
                //valid: 'glyphicon glyphicon-ok',
                //invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                txtName: {
                    message: '问题类型验证失败',
                    validators: {
                        notEmpty: {
                            message: '请输入名称'
                        },
                        stringLength: {
                            min: 1,
                            max: 30,
                            message: '名称长度必须介于1到30之间'
                        },
                        remote: {
                            url: "Ajax/QuestionType.ashx?operationType=CheckName",
                            message: '已存在相同问题类型',
                            delay: 20000,
                            type: "GET",
                            data: function (validator) {
                                return { Identity: self.EditId, name: $("#txtName").val() }
                            }
                        },
                        regexp: {
                            regexp: /^[0-9A-Za-z\u4e00-\u9fa5]{1,30}$/,
                            message: '问题名称格式不正确'
                        }
                    }
                },
                txtDescribe: {
                    message: "问题描述验证失败",
                    validators: {
                        stringLength: {
                            min: 0,
                            max: 500,
                            message: '描述不大于500字'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            // 阻止默认事件提交
            e.preventDefault();
        });
        self.Validator = $("#formInfo").data("bootstrapValidator");
    }

    // 修改标题
    function fnSetCaption(caption) {
        $("#hTitle").text(caption);
    }

    // 重置 
    function fnReset() {
        $("#txtName").val('');
        $("#txtDescribe").val('');
        self.EditId = 0;// 编辑的Id
        fnSetCaption("新增部门");


        $("#txtName").removeAttr("disabled");
        $("#txtDescribe").removeAttr("disabled");
        $("#btSubmit").removeAttr("disabled");
    }

    // 加载 绑定事件
    function fnLoadBindEvent() {
        // 绑定 添加按钮事件
        $("#btnAdd").click(function () { self.eventShowAdd(); });
        //取消按钮
        $("#cancel").click(function () {
            $("#editModal").modal("hide");
            // 重置控件内容
            fnReset();
            return;
        });
        // 模态隐藏操作
        $('#editModal').on('hidden.bs.modal', function () {
            // 重新加载验证
            fnLoadValidator();
            // 重置控件内容
            fnReset();
        });
        // 绑定 验证控件
        fnLoadValidator();

        // 绑定提交事件
        $("#btSubmit").click(function () {
            self.eventSave($("#btSubmit").attr("data-index"));
        });
        //$("input,textarea").blur(function () {
        //    self.Validator.validate();
        //});
    }

    // 加载 问题类型信息
    function fnLoadInfo(callback) {
        NewAJAX({
            url: "Ajax/QuestionType.ashx",
            dataType: "json",
            data: { operationType: "Info", Index: self.EditId },
            callBack: function (result) {

                if (callback) {
                    callback(result);
                }
            }
        });
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
                url: "Ajax/QuestionType.ashx?operationType=Bind"
            },
            createdRow: function (row, data, dataIndex) {
                // 重置 行样式
                $(row).empty();
                var enterpriseCode = data[4];
                var id = data[0];
                var isDisabled = "";// data[3] == "0" ? "disabled" : "";
                //isDisabled = data[4] == "" ? "disabled" : "";
                if (data[3] == "0")
                    isDisabled = "disabled";
                else if (data[4] == "")
                    isDisabled = "disabled";
                else
                    isDisabled = "";
                $(row).append("<td style='text-align:center;'>" + data[1] + "</td>");
                $(row).append("<td style='text-align:center;'>" + data[2] + "</td>");
                var tdBtn = $("<td style='text-align:center;'></td>");

                // 查看按钮
                var btnLook = $("<button id='btnLook" + id + "' style='display:none' name='btnLook" + id + "'  class='btn btn-link'  data-index='" + id + "'>查看</button>");
                // 修改按钮
                var btnEdit = $("<button id='btnEdit" + id + "' name='btnEdit" + id + "'  class='btn btn-link'  " + isDisabled + " data-index='" + id + "'>修改</button>");
                // 删除按钮
                var btnDel = $("<button id='btnDel" + id + "' name='btnDel" + id + "'  class='btn btn-link'   " + isDisabled + " data-index='" + id + "'>删除</button>");

                // 查看按钮 点击事件
                btnLook.on("click", function () {
                    var btnSelf = $(this);
                    self.EditId = btnSelf.attr("data-index");
                    self.eventShowEdit(false);
                });

                // 验证是否需要绑定事件
                if (isDisabled == "") {
                    // 修改按钮 点击事件
                    btnEdit.on("click", function () {
                        var btnSelf = $(this);
                        self.EditId = btnSelf.attr("data-index");
                        $("#btSubmit").attr("data-index", btnSelf.attr("data-index"));
                        $("#editModal").on('shown.bs.modal', function () {
                            if ($("#hTitle").text() == "修改问题类型")
                                self.Validator.validate();
                        });
                        self.eventShowEdit(true);

                    });

                    // 删除按钮 点击事件
                    btnDel.on("click", function () {

                        var btnSelf = $(this);
                        layer.confirm("确定彻底删除该问题类型吗？ ", {
                            btn: ["确定", "取消"]
                        }, function () {
                            self.EditId = btnSelf.attr("data-index");
                            NewAJAX({
                                url: "Ajax/QuestionType.ashx",
                                data: { operationType: "Del", Index: self.EditId },
                                callBack: function (result) {
                                    if (result == "1") {
                                        $('#tableGrid').DataTable().draw(false);
                                        layer.msg("删除成功！", { time: 2000, icon: 6 }, function () {
                                        });
                                    } else {
                                        layer.msg("删除失败!该问题类型已经被使用无法删除，将为您刷新列表。", { time: 3000, icon: 5 }, function () {
                                            $('#tableGrid').DataTable().draw(false);
                                        });
                                    }
                                }

                            });
                        });

                    });
                }
                tdBtn.append(btnLook).append(btnEdit).append(btnDel);
                $(row).append(tdBtn);

            }
        });

    }

    // 展示添加页面
    self.eventShowAdd = function () {

        fnSetCaption("新建问题类型");
        $("#btSubmit").attr("data-index", "0");
        $("#editModal").modal("show");

    }

    // 展示修改、查看页面
    self.eventShowEdit = function (isEdit) {
        var caption = "";
        if (isEdit) {
            caption = "修改问题类型";

        } else {
            caption = "查看问题类型";

            $("#txtName").attr("disabled", "disabled");
            $("#txtDescribe").attr("disabled", "disabled");
            $("#btSubmit").attr("disabled", "disabled");
        }

        fnSetCaption(caption);

        fnLoadInfo(function (result) {

            self.EditId = result.QTID;
            $("#txtName").val(result.QTName);
            $("#txtDescribe").val(result.Describe);
            $("#editModal").modal("show");
        });


    }

    // 保存事件
    self.eventSave = function (date) {

        self.Validator.validate();

        if (!self.Validator.isValid()) {
            return;
        }
        // 调用 AJAX
        NewAJAX({
            url: "Ajax/QuestionType.ashx",
            data: { operationType: "Update", Index: date, Name: $("#txtName").val(), Describe: $("#txtDescribe").val() },
            callBack: function (result) {
                $("#editModal").modal("hide");
                $('#tableGrid').DataTable().draw(false);
                layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {
                });
            }
        });
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
