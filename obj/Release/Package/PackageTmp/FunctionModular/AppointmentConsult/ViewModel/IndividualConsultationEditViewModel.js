var navName = "";
$(document).ready(function () {
    var viewModel = new IndividualConsultationEditViewModel();
});

function IndividualConsultationEditViewModel() {
    var self = this;
    self.ValidatorFile;// 基本信息验证对象
    self.ValidatorRecord;// 记录信息验证对象
    self.ValidatorSummary;// 总结信息验证对象
    self.ConsultationInfos;
    self.IsInitEnd = false;
    self.Records = new Array();// 记录集 
    self.NotRelated = new Array();// 未关联信息集
    self.IsSummary = false; // 是否可以 启用结案总结
    self.RecordIndexs = new Array();
    self.Summary = {
        ContentCount: 0,// 其他内容计数器
        ConsultingEffect: 0,// 咨询效果评估
        Content: "",// 总结 内容
        Contents: new Array()// 其他内容
    };// 总结
    self.SummaryDetailsIndex = 0;
    self.RecordContainer = "divRecirdMain";// 记录集容器名
    self.CanSummary = false;//能否进行结案总结  flase只能保存，但不结案
    // 编辑Id
    self.EditId = function () {
        var result = 0;
        var param = fnGetUrlParam("i");
        if (!isNaN(param)) {
            result = param;
        }
        return result;
    }

    // 验证登录名是否与问题类型相关联
    function fnLoadValidataConsultationInfo() {
        var result = false;
        var userValue = $("#selectUser").val();
        var questionTypeValue = $("#selectQuestionType").val();

        if (userValue != "" && questionTypeValue != "") {
            for (var i = 0; i < self.ConsultationInfos.length; i++) {
                var item = self.ConsultationInfos[i];
                if (item.U_ID == userValue && item.QTID == questionTypeValue) {
                    result = true;
                    break;
                }
            }
        } else {
            result = true;
        }

        return result;
    }

    // 加载 基本信息验证 
    function fnLoadFileValidator() {
        if ($("#formFile").data('bootstrapValidator'))
            $('#formFile').data('bootstrapValidator', null);

        // 绑定 验证
        $("#formFile").bootstrapValidator({
            message: '表单验证失败.',
            excluded: [':disabled', ':hidden'],
            feedbackIcons: {
                //valid: 'glyphicon glyphicon-ok',
                //invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                selectQuestionType: {
                    message: '问题类型验证失败',
                    trigger: "change",
                    validators: {
                        notEmpty: {
                            message: '请选择问题类型!'
                        }
                    }
                },
                selectUser: {
                    message: '登录名验证失败',
                    validators: {
                        notEmpty: {
                            message: '请选择登录名!'
                        }
                    }
                },
                txtMaritalStatus: {
                    message: '婚姻状况验证失败',
                    validators: {
                        stringLength: {
                            min: 0,
                            max: 30,
                            message: '婚姻状况文字长度必须介于0到30之间!'
                        }
                    }
                },
                txtCulture: {
                    message: '文化程度验证失败',
                    validators: {
                        stringLength: {
                            min: 0,
                            max: 30,
                            message: '文化程度文字长度必须介于0到30之间!'
                        }
                    }
                },
                txtPhone: {
                    message: '联系方式证失败',
                    validators: {
                        regexp: {
                            regexp: /^1[0-9]{10}$/,
                            message: '联系方式格式不正确'
                        },
                        stringLength: {
                            min: 0,
                            max: 30,
                            message: '联系方式文字长度必须介于1到30之间!'
                        }
                    }
                }
            }
        }).on('success.form.bv', function (e) {
            // 阻止默认事件提交
            e.preventDefault();
        });
        self.ValidatorFile = $("#formFile").data("bootstrapValidator");


    }

    // 加载 记录信息验证
    function fnLoadRecordValidator() {
        var formRecord = $("#formRecord");
        if (formRecord.data('bootstrapValidator')) {
            formRecord.data('bootstrapValidator', null);
        }

        // 动态指定验证
        var customFields = {};
        $(self.Records).each(function (indexRecord, itemRecord) {


            customFields["inputStar" + self.RecordIndexs[indexRecord]] = {
                field: "inputStar" + self.RecordIndexs[indexRecord],
                message: '记录标题验证失败',
                trigger: "change",
                validators: {
                    notEmpty: {
                        message: '请评估!'
                    }
                }
            }
            customFields["inputNumber" + self.RecordIndexs[indexRecord]] = {
                field: "inputNumber" + self.RecordIndexs[indexRecord],
                message: '咨询次数验证失败',
                trigger: "change",
                validators: {
                    notEmpty: {
                        message: '请输入咨询次数！'
                    },
                    regexp: {
                        regexp: "^[1-9][0-9]*$",
                        message: '咨询次数必须为大于0的正整数'
                    }
                }
            }
            customFields["inputTime" + self.RecordIndexs[indexRecord]] = {
                field: "inputTime" + self.RecordIndexs[indexRecord],
                message: '日期验证失败',
                trigger: "change",
                validators: {
                    notEmpty: {
                        message: '请选择日期！'
                    }
                }
            }

            $(itemRecord.Contents).each(function (indexContent, itemContent) {
                customFields["txtRecord" + self.RecordIndexs[indexRecord] + "_Title" + itemContent.Index] = {
                    field: "txtRecord" + self.RecordIndexs[indexRecord] + "_Title" + itemContent.Index,
                    message: '记录标题验证失败',
                    validators: {
                        notEmpty: {
                            message: '请填入记录标题!'
                        },
                        stringLength: {
                            min: 0,
                            max: 30,
                            message: '记录标题不大于30字'
                        }
                    }
                }
                /* customFields["txtRecord" + self.RecordIndexs[indexRecord] + "_Content" + itemContent.Index] = {
                     message: '记录内容验证失败',
                     validators: {
                         stringLength: {
                             min: 0,
                             max: 4000,
                             message: '记录内容不大于4000字'
                         }
                     }
                 }*/
            });
        });

        // 绑定 验证
        formRecord.bootstrapValidator({
            message: '表单验证失败.',
            //excluded: [':disabled'],
            feedbackIcons: {
                // valid: 'glyphicon glyphicon-ok',
                //invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: customFields
        }).on('success.form.bv', function (e) {
            // 阻止默认事件提交
            e.preventDefault();
        });
        self.ValidatorRecord = formRecord.data("bootstrapValidator");


    }

    // 加载 结案信息验证
    function fnLoadSummaryValidator() {
        var formSummary = $("#formSummary");
        if (formSummary.data('bootstrapValidator')) {
            formSummary.data('bootstrapValidator', null);

        }

        // 动态指定验证
        var customFields;
        if (self.CanSummary) {
            customFields = {
                txtMainTitle: {
                    field: txtMainTitle,
                    message: "结案描述验证失败",
                    trigger: "change",
                    validators: {
                        notEmpty: {
                            message: '请填入总结标题!'
                        }
                    }
                },
                txtSummaryStar: {
                    field: txtSummaryStar,
                    message: "结案描述验证失败",
                    trigger: "change",
                    validators: {
                        notEmpty: {
                            message: '请评估!'
                        }
                    }
                }
            };
        }
        else {
            customFields = {
                txtMainTitle: {
                    field: txtMainTitle,
                    message: "结案描述验证失败",
                    trigger: "change",
                    validators: {
                        notEmpty: {
                            message: '请填入总结标题!'
                        },
                        stringLength: {
                            min: 0,
                            max: 30,
                            message: '总结标题不大于30字'
                        }
                    }
                }
            }
        }
        $(self.Summary.Contents).each(function (i, item) {
            customFields["txtSummaryundefined_Title" + item.Index] = {
                message: '总结标题验证失败',
                validators: {
                    notEmpty: {
                        message: '请填入总结标题!'
                    },
                    stringLength: {
                        min: 0,
                        max: 30,
                        message: '总结标题不大于30字'
                    }
                }
            }
        });

        // 绑定 验证
        formSummary.bootstrapValidator({
            message: '表单验证失败.',
            //excluded: [':disabled'],
            feedbackIcons: {
                //valid: 'glyphicon glyphicon-ok',
                //invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: customFields
        }).on('success.form.bv', function (e) {
            // 阻止默认事件提交
            e.preventDefault();
        });
        self.ValidatorSummary = formSummary.data("bootstrapValidator");
    }

    // 加载 绑定事件
    function fnLoadBindEvent() {
        // 保存基本信息 按钮 点击事件
        $("#btnSaveFile").click(function () {

            fnSaveFile();
        });
        // 保存记录信息 按钮 点击事件
        $("#btnSaveRecord").click(function () {
            fnSaveRecord();
        });
        // 保存结案总结 按钮 点击事件
        $("#btnSaveSummary").click(function () {
            fnSaveSummary();
        });
        // 添加记录  按钮点击事件
        $("#btnRecordAdd").click(function () {
            fnAddRecord();
        });
        // 返回 按钮点击事件
        $("#btnBack").click(function () {
            layer.confirm("当前界面未保存，是否退出？", {
                btn: ['确定', '取消']
            }, function () {
                window.location.href = "IndividualConsultation.aspx";
            });

        });
        // 总结评价 变换事件
        $("#txtSummaryStar").on("change", function () {
            var val = $(this).val();
            if (val == "0") {
                val = "";
            }
            $("#hideSummaryStar").val(val);
        });
        //if (self.EditId() == 0) {
        //    $('#txtStartTime').datepicker({ format: 'yyyy-mm-dd', weekStart: 1, autoclose: true, todayBtn: 'linked', language: 'cn' });
        //    $('#txtStartTime').val('2017-04-17');
        //}

        // 绑定 取消按钮 点击事件
        $(document).on("click", "[data-back]", function () {
            window.location.href = "IndividualConsultation.aspx";
        });
    }
    // 加载 个案号
    function fnLoadNumber() {
        if ($("#lblNumber").val() == "") {
            NewAJAX({
                url: "Ajax/IndividualConsultation.ashx",
                dataType: "json",
                data: { operationType: "Number" },
                callBack: function (result) {
                    $("#lblNumber").text(result);
                }
            });
        }
        layer.closeAll();
    }

    // 加载 档案基本信息
    function fnLoadInfo(callBack) {
        if (self.EditId() == "0") {
            return;
        }

        NewAJAX({
            url: "Ajax/IndividualConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "Info",// action类型
                identity: self.EditId(),// Id 
                isEdit: "1"// 是否编辑
            },
            callBack: function (result) {

                // 个案号
                $("#lblNumber").text(result.Number);
                // 问题类型
                $("#selectQuestionType").val(result.QuestionTypeId);
                // 开始时间
                //$("#txtStartTime").val(result.StartDateStr);
                // 咨询师
                //$("#txtConsultant").val(result.ConsultantName);
                // 登录控件
                $("#selectUser").val(result.UserId);
                // 年龄
                $("#txtAge").val(result.UserAge);
                // 姓名
                $("#txtName").val(result.UserName);
                // 部门
                $("#txtDepartment").val(result.UserDepartment);
                // 性别
                $("#txtSex").val(result.UserSex);
                // 角色名称
                //$("#txtRoleName").val(result.UserRole);
                // 婚姻状况
                $("#txtMaritalStatus").val(result.MaritalStatus);
                // 文化程度
                $("#txtCulture").val(result.Culture);
                // 联系方式
                $("#txtPhone").val(result.Phone);

                // 加载用户列表
                fnLoadUsers();
                // 加载问题类型
                fnLoadQuestionTyps();

                // 显示记录页面并查询未关联记录
                fnShowRecord(false);

                // 存在记录 不可修改必要信息
                if (result.Record != null) {

                    $("#selectQuestionType").attr("disabled", "disabled");

                    // 隐藏 原有组合控件  显示 新的下拉框
                    $(".bootstrap-select").hide();
                    $("#selectUserdisabled").show();
                    $("#selectUserdisabled").attr("disabled", "disabled");
                    $("#selectUserdisabled").append("<option value='" + result.UserId + "'>" + result.LoginName + "</option>");
                    $("#selectUserdisabled").val(result.UserId);
                    self.IsSummary = true;

                    // 加载 记录信息
                    if (result.Record.Content)
                        self.Records = JSON.parse(result.Record.Content);
                    if (result.Summary) {
                        self.Summary = result.Summary;
                        if (result.Summary.Content)
                            self.Summary.Content = JSON.parse(result.Summary.Content);
                        if (result.Summary.OtherContent)
                            self.Summary.Contents = JSON.parse(result.Summary.OtherContent);
                    }

                    // 遍历 记录集
                    $(self.Records).each(function (indexRecord, itemRecord) {
                        // 修改子元素计数器
                        itemRecord.ContentCount = itemRecord.Contents.length;

                        // 遍历 记录内容集
                        $(itemRecord.Contents).each(function (indexContent, itemContent) {
                            // 修改Index
                            itemContent.Index = indexContent;
                        });
                        //   fnAddRecordControl(indexRecord, itemRecord);

                        // 加载 咨询记录 Tab
                        if ($("#liSummary").find("a").length == 0) {
                            // 加载 结案总结 Tab
                            fnLoadTab({
                                TabId: "liSummary",
                                TabContainerId: "Summary",
                                Caption: "结案总结"
                            });
                        }
                    });

                } else {
                    fnAddRecord();

                }


                if (callBack) {
                    callBack();
                }
            }
        });
    }
    function getAge(brith) {
        var nowDate = new Date();
        var thisYear = nowDate.getFullYear();
        if (!brith) {
            return 0;
        }//再加上其他判断
        brith = brith.substr(0, 4);
        age = (thisYear - brith);
        return age;
    }
    // 加载关联信息
    function fnLoadRelatedInfo() {
        //加载层
        layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2
        var userValue = $("#selectUser").val();
        var questionTypeValue = $("#selectQuestionType").val();

        if (userValue == "" || questionTypeValue == "") {

            layer.closeAll();
            return;
        }
        //if (!fnLoadValidataConsultationInfo()) {
        //    //$("#txtStartTime").val('');
        //    //$("#txtConsultant").val('');
        //    $("#txtAge").val('');
        //    $("#txtName").val('');
        //    $("#txtDepartment").val('');
        //    $("#txtSex").val('');
        //    //$("#txtRoleName").val('');

        //    layer.closeAll();
        //    return;
        //}
        for (var i = 0; i < self.ConsultationInfos.length; i++) {
            var tempInfo = self.ConsultationInfos[i];
            if (tempInfo.U_ID == userValue) {
                // $("#txtStartTime").val(tempInfo.StartTimeNew);
                //$("#txtConsultant").val(tempInfo.teacherName);
                $("#txtAge").val(tempInfo.U_Birthday);
                $("#txtName").val(tempInfo.U_Name);
                $("#txtDepartment").val(tempInfo.D_name);
                $("#txtSex").val(tempInfo.U_Sex);
                //$("#txtRoleName").val(tempInfo.Role_Name);
                break;
            }
        }
        layer.closeAll();



        /* NewAJAX({
             dataType: "json",
             data: { operationType: "RelatedInfo", userId: userValue, questionTypeId: questionTypeValue },
             url: "Ajax/IndividualConsultation.ashx",
             callBack: function (result) {
                 if (result.length > 0) {
                     var item = result[0];
                     $("#txtStartTime").val(item.StartTimeNew);
                     $("#txtConsultant").val(item.teacherName);
                     $("#txtAge").val(item.U_Age);
                     $("#txtName").val(item.U_Name);
                     $("#txtDepartment").val(item.D_name);
                     $("#txtSex").val(item.U_Sex);
                     $("#txtRoleName").val(item.RoleType_Name);
                 }
                 layer.closeAll();
             }
         });*/
    }

    // 添加用户选项
    function addUserOption(control, type) {
        var options;
        var isFind;
        var item;

        for (var i = 0; i < self.ConsultationInfos.length; i++) {
            item = self.ConsultationInfos[i];
            isFind = false;
            options = control.find("option");
            for (var j = 0; j < options.length; j++) {
                if (item.U_ID == null || item.U_ID == $(options[j]).val()) {
                    isFind = true;
                    break;
                }
            }

            if (!isFind) {
                switch (type) {
                    case "1":
                        control.append("<option value='" + item.U_ID + "' >" + item.U_LoginName + "</option>");
                        break;
                    case "2":
                        if (item.QTID == $("#selectQuestionType").val()) {
                            control.append("<option value='" + item.U_ID + "' style='color: #005b8f;' >" + item.U_LoginName + "</option>");
                        }
                        break;
                }
            }
        }
    }
    // 加载用户列表
    function fnLoadUsers() {

        var control = $("#selectUser");
        var selectedVal = control.val();
        control.empty();
        control.append("<option value='' >请选择用户</option>");

        // 绑定推荐列表 
        if ($("#selectQuestionType").val() != "") {
            addUserOption(control, "2");
        }

        addUserOption(control, "1");
        control.val(selectedVal == null ? "" : selectedVal);

        if (!self.IsInitEnd) {
            control.on("change", function (s, d, f) {
                fnLoadQuestionTyps();
                fnLoadRelatedInfo();
            });
        }

        control.attr("multiple", false);

        control.selectpicker('refresh');
    }

    // 添加问题类型选项
    function addQuestionTypeOption(control, type) {
        var options;
        var isFind;
        var item;

        for (var i = 0; i < self.ConsultationInfos.length; i++) {
            item = self.ConsultationInfos[i];
            isFind = false;
            options = control.find("option");
            for (var j = 0; j < options.length; j++) {
                if (item.QTID == null || item.QTID == $(options[j]).val()) {
                    isFind = true;
                    break;
                }
            }

            if (!isFind) {
                var item;
                switch (type) {
                    case "1":
                        item = $("<option value='" + item.QTID + "' >" + item.QTName + "</option>");
                        break;
                    case "2":
                        if (item.U_ID == $("#selectUser").val()) {
                            item = $("<option value='" + item.QTID + "' style='color: #005b8f;' >" + item.QTName + "</option>");
                        }
                        break;
                }
                control.append(item);
            }
        }
    }
    // 加载问题类型
    function fnLoadQuestionTyps() {

        var control = $("#selectQuestionType");
        var selectedVal = control.val();
        control.empty();
        control.append("<option value='' >请选择</option>");

        // 绑定推荐列表 
        if ($("#selectUser").val() != "") {
            addQuestionTypeOption(control, "2");
        }

        addQuestionTypeOption(control, "1");

        control.val(selectedVal == null ? "" : selectedVal);

        if (!self.IsInitEnd) {
            control.off("change").on("change", function (s, d, f) {
                fnLoadFileValidator();
                fnLoadUsers();
                fnLoadRelatedInfo();
            });
        }
    }

    // 获取问题类型及用户
    function fnLoadConsultationInfo(callBack) {
        NewAJAX({
            dataType: "json",
            data: { operationType: "ConsultationInfo", index: self.EditId() },
            url: "Ajax/IndividualConsultation.ashx",
            callBack: function (result) {
                self.ConsultationInfos = result;
                // 加载用户列表
                fnLoadUsers();
                // 加载问题类型
                fnLoadQuestionTyps();

                if (callBack) {
                    callBack();
                }
            }
        });
    }

    // 加载 Tab Control
    function fnLoadTab(param) {
        var control = $("#" + param.TabId);
        control.html("<a href='#" + param.TabContainerId + "'  data-toggle='tab'>" + param.Caption + "</a>");
        return control;
    }

    // 保存 基本信息
    function fnSaveFile() {
        //加载层
        layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2

        // 验证表单
        self.ValidatorFile.validate();
        if (!self.ValidatorFile.isValid()) {
            layer.closeAll();
            return;
        }
        NewAJAX({
            url: "Ajax/IndividualConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "SaveFile",// action类型
                identity: self.EditId(),// Id
                number: $("#lblNumber").text(),// 个案号
                questionType: $("#selectQuestionType").val(),// 问题类型
                userId: $("#selectUser").val(),// 用户Id
                maritalStatus: $("#txtMaritalStatus").val(),// 婚姻状况
                culture: $("#txtCulture").val(),// 文化程度
                phone: $("#txtPhone").val(), // 联系方式
                //startTime: $("#txtStartTime").val() // 开始时间
            },
            callBack: function (result) {

                layer.closeAll();

                if (Number(result) > 0) {
                    layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {

                        self.EditId = function () {
                            return result;
                        }
                        debugger;
                        // 只有添加的时  进行 保存并下一步
                        if ($("#liSummary").find("a").length == 0) {

                            // 显示记录页面并添加默认记录
                            fnShowRecord(true, function () { fnAddRecord() });
                        }
                        else {
                            $('#myTab').find("a[href='#Record']").trigger("click");
                        }

                    });
                } else {
                    layer.msg("保存失败!", { time: 3000, icon: 5 }, function () {

                    });
                }

            }
        });

    }

    // 创建 添加控件按钮
    function fnCreateButtonAdd(rowId, index, recordIndex, btnClick) {
        var button = $("<div class='row' id='" + rowId + "'>" +
                               "<div class='col-md-2 col-ms-6 col-xs-6'>&nbsp;</div>" +
                               "<div class='col-md-7 col-ms-10 col-xs-10'>&nbsp;</div>" +
                               "<div class='col-md-12 col-ms-2 col-xs-2'>" +
                                   "<button class='btn btn-default-zblb x_button' type='button' ><i class='icon iconfont' style='font-size:14px' aria-hidden='true'>&#xe741;</i> 添加</button>" +
                               "</div>" +
                           "</div>");

        // 添加按钮 点击事件
        button.find("button").data("index", recordIndex).on("click", function () {
            var selfBtn = $(this);
            var selfIndex = selfBtn.data("index");
            if (btnClick) {
                btnClick(selfBtn, selfIndex);
            }

        });

        return button;
    }

    // 显示记录页面并添加默认记录
    function fnShowRecord(isTrigger, callback) {
        // 加载 咨询记录 Tab
        var tab = fnLoadTab({
            TabId: "liRecord",
            TabContainerId: "Record",
            Caption: "咨询记录"
        });
        // 是否触发点击事件
        if (isTrigger) {
            tab.find("a").trigger("click");
        }

        // 加载未关联记录集
        /*  fnLoadNotRelated(function () {
  
              if (callback) {
                  callback();
              }
          });*/

    }

    // 创建 明细 控件 -结案咨询记录 btnAdd, mainContainer, typeName, listIndex, list, detailIndex, detail
    function fnCreateDetailControl(params) {

        var detailIndex = params.detail.Index;
        // typeName:  Record 、Summary   listIndex: self.Records self.Summary
        var mainDivId = "div" + params.typeName + params.controlIndex + "_Row" + detailIndex + "";
        var titleDivId = "'txt" + params.typeName + params.controlIndex + "_Title" + detailIndex + "'";
        var contentDivId = "'txt" + params.typeName + params.controlIndex + "_Content" + detailIndex + "'";


        var divDetail = $("<div class='row x_gtda_form' id='" + mainDivId + "'>" +
                                "<div class='col-md-12'>" +
                                    "<div >" +
                                        "<div class='col-md-2 col-ms-6 col-xs-6 form-group'style='margin-right: 0px;' >" +
                                            "<input type='text' class='form-control' style='text-align: right;' id=" + titleDivId + " name=" + titleDivId + " value='" + params.detail.Title + "' /> " +
                                        "</div> " +
                                        "<div class='col-md-7 col-ms-10 col-xs-10 form-group' style='margin-left: 0px;'>" +
                                            "<textarea class='form-control' style='padding-top: 5px;' id=" + contentDivId + " name=" + contentDivId + " >" + params.detail.Content + "</textarea> " +
                                        "</div> " +
                                        "<div class='col-md-3 col-ms-2 col-xs-2' >" +
                                            "<button class='btn btn-default-zblb' type='button' ><i class='fa fa-times' style='color: red;margin-top:0px;font-size:20px' aria-hidden='true'></i></button>" +
                                        "</div> " +
                                    "</div> " +
                                "</div> " +
                            "</div> ");

        // 删除按钮设置
        divDetail.find("button")
            .data("parent", mainDivId)
            .data("index", detailIndex)
            .on("click", function () {
                var selfBtn = $(this);
                layer.confirm("确定要删除记录信息么? ", {
                    btn: ["确定", "取消"]
                }, function () {
                    // 关闭窗口
                    layer.closeAll();
                    // 父容器Id
                    var parentId = selfBtn.data("parent");
                    // 记录明细下标
                    var index = selfBtn.data("index");

                    // 遍历查找数组元素
                    $(params.list.Contents).each(function (i, item) {
                        if (item.Index == index) {
                            index = i;
                        }
                    });

                    // 删除数组中数据
                    params.list.Contents.splice(index, 1);
                    // 删除控件
                    var removeDiv = $("#" + parentId).parent();
                    $("#" + parentId).remove();
                    if (params.list.Contents.length == 0 && parentId.indexOf("divSummar") < 0) {
                        // 已经没了，可以删除该条咨询记录
                        //需要删除界面的元素    #parentId . parent
                        self.RecordIndexs.splice(params.listIndex, 1);
                        self.Records.splice(params.listIndex, 1);
                        removeDiv.remove();
                    }
                    // 删除 回调方法
                    if (params.delCallBack) {
                        params.delCallBack();
                    }
                });

            });

        var divAddDetail = $("#" + params.btnAdd);
        if (divAddDetail) {
            divAddDetail.before(divDetail);
            if (params.btnAdd == "divAddSummaryDetail") {
                $(divDetail).find("textarea[id^='txtSummaryundefined_Title']").attr("maxlength", "30");
                $(divDetail).find("textarea[id^='txtSummaryundefined_Content']").attr("maxlength", "4000").unbind().bind("input propertychange", function () {
                    var text = $("#txtMainSummary").val();
                    var otherText = '';
                    $("#divSummaryMain div[id^='divSummaryundefined_Row'] textarea[id^='txtSummaryundefined_Content']").each(function () {
                        otherText += $(this).val();
                    });
                    var cansum = (text + otherText).length > 0;
                    if (cansum != self.CanSummary) {
                        self.CanSummary = cansum;
                        fnLoadSummaryValidator();
                    }
                });
            }
        } else {
            $("#" + params.mainContainer).append(divDetail);
        }
    }


    // 加载 添加默认记录
    function fnCreateDefaultDetails() {
        // 基本参数
        //var option = { Id: "", StartTime: "", EndTime: "", Evaluate: "5" };
        //$.extend(option, param);

        // 生成默认记录集
        self.Records.push({
            // InterviewId: option.Id,// 预约id
            ConsultationNum: self.RecordIndexs.length > 0 ? (parseInt(self.RecordIndexs[self.RecordIndexs.length - 1]) + 1) : 1,//咨询次数
            InterviewStartTime: '',// 开始时间
            ContentCount: 10,// 内容数量
            Severity: "",// 严重程度
            ConsultationMode: "面谈",//咨询方式
            Contents: [
                  { Index: 0, Title: '来访者主诉', Content: '' },
                  { Index: 1, Title: '既往史', Content: '' },
                  { Index: 2, Title: '咨询师观察', Content: '' },
                  { Index: 3, Title: '主要状况', Content: '' },
                  { Index: 4, Title: '咨询技术和流派', Content: '' },
                  { Index: 5, Title: '咨询过程', Content: '' },
                  { Index: 6, Title: '诊断', Content: '' },
                  { Index: 7, Title: '问题成因', Content: '' },
                  { Index: 8, Title: '咨询目标', Content: '' },
                  { Index: 9, Title: '咨询效果', Content: '' }
            ]
        });
    }
    // 创建 咨询记录基本信息 控件
    function fnCreateRecordControl(recordIndex, controlIndex, itemRecord) {
        var mainControl = $("#" + self.RecordContainer);

        // 记录基本信息
        mainControl.append("<legend class='legendRecord'><div class='form-group' style='margin-left: 0px;'>第 " +
                                "<input class='legendTitle form-control input-sm text-center' style='width: 40px;display:inline;'  id='inputNumber" + controlIndex + "' name='inputNumber" + controlIndex + "' value='" + (itemRecord.ConsultationNum) + "'></input> 次咨询记录" +
                                "（<input class='legendTime form-control input-sm' placeholder='--开始日期--' id='inputTime" + controlIndex + "' name='inputTime" + controlIndex + "' style='width: 100px;display:inline;' value='" + itemRecord.InterviewStartTime + "'> ）</span>" +
                         
                            "</div></legend>" +
                            "<div class='row'>" +
                                "<div class='col-md-12 col-ms-12 col-xs-12 form-group'> " +
                                    "<label class='col-md-2' style='height: 45px; line-height: 45px; text-align: right;'>严重程度评估：</label> " +
                                    "<div class='col-md-7 col-ms-12 col-xs-12'>  " +
                                        "<input type='number'value='" + itemRecord.Severity + "' id='inputStar" + controlIndex + "' name='inputStar" + controlIndex + "'   />   " +
                                    "</div>" +
                                "</div>" +
                            "</div>" +
                            "<div class='row'>" +
                                "<div class='col-md-12 col-ms-12 col-xs-12' style='height: 45px; line-height: 45px; margin-left: -15px;'> " +
                                     "<div class='col-md-2 col-ms-12 col-xs-12' style='text-align: right;margin-top: -8px;'>  " +
                                         "<label >咨询方式：</label> " +
                                     "</div>" +
                                    "<div class='col-md-2 col-ms-12 col-xs-12'>  " +
                                        "<select type='select' class='form-control' value='" + itemRecord.Severity + "' id='inputMode" + controlIndex + "' name='inputMode" + controlIndex + "'   >   " +
                                        "<option value='面谈' >面谈</option>" +
                                        //"<option value='在线' >在线</option>" +
                                       " <select>" +
                                    "</div>" +
                                "</div>" +
                            "</div>");

        $('#inputMode' + controlIndex).val(itemRecord.ConsultationMode);
        $('.legendTime').datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式
            endDate: new Date()
        })

        // 其他内容累加器 赋值
        self.Records[recordIndex].ContentCount = self.Records[recordIndex].Contents.length - 1;

        // 明细添加按钮
        var btnAddId = "divAddRecordDetail" + controlIndex;
        var btnAdd = fnCreateButtonAdd(btnAddId, controlIndex, recordIndex, function (btn, index) {

            // 添加明细信息
            var record = self.Records[index];
            // 子元素累加器 避免重复控件Id
            record.ContentCount++;
            var detail = { Index: record.ContentCount, Title: '', Content: '' };

            record.Contents.push(detail);

            // 添加明细控件 
            fnCreateDetailControl({
                btnAdd: btnAddId,
                mainContainer: self.RecordContainer,
                typeName: "Record",
                listIndex: recordIndex,
                controlIndex: controlIndex,
                list: record,
                detail: detail,
                delCallBack: function () {
                    // 重新加载 验证
                    // fnLoadRecordValidator();
                }
            });

            // 跳转相应位置
            mainControl.scrollTop(mainControl.scrollTop() + 90);

            // 重新加载 验证
            // fnLoadRecordValidator();
        });


        mainControl.append(btnAdd);

        // 重新加载 评星 控件
        $("#inputStar" + controlIndex).rating({
            size: 'xs',
            showClear: false,
            showCaption: false,
            language: 'zh',
            min: 0,
            max: 5,
            step: 1
        }).on("change", function () {
            var val = $(this).val();
            if (val == "0") {
                val = "";
            }
            $(this).attr("value", val);
        });  //带参数初始化
    }
    // 添加一条记录控件
    function fnAddRecordControl(recordIndex, itemRecord) {
        var mainControl = $("#" + self.RecordContainer);
        var _recordIndex = itemRecord.ConsultationNum;
        while ($("#RecordContainer_" + _recordIndex).length > 0) {
            itemRecord.ConsultationNum = itemRecord.ConsultationNum + 1;
            _recordIndex = itemRecord.ConsultationNum;
        }
        self.RecordIndexs.push(_recordIndex);
        mainControl.append("<div id='RecordContainer_" + _recordIndex + "'></div>");
        self.RecordContainer = "RecordContainer_" + _recordIndex;
        // 添加 记录主题控件
        fnCreateRecordControl(recordIndex, _recordIndex, self.Records[recordIndex]);

        // 遍历内容集
        for (var j = 0; j < itemRecord.Contents.length; j++) {
            var itemContents = itemRecord.Contents[j];

            // 添加明细控件 
            fnCreateDetailControl({
                btnAdd: "divAddRecordDetail" + _recordIndex,
                mainContainer: self.RecordContainer,
                typeName: "Record",
                listIndex: recordIndex,
                controlIndex: _recordIndex,
                list: itemRecord,
                detail: itemContents,
                delCallBack: function () {
                    // 重新加载 验证
                    //fnLoadRecordValidator();
                }
            });
        }
        self.RecordContainer = "divRecirdMain";
    }

    // 加载 记录集
    function fnLoadRecord() {
        $("#" + self.RecordContainer).empty();

        self.RecordIndexs = new Array();
        // 遍历记录集
        for (var i = 0; i < self.Records.length > 0; i++) {
            var itemRecord = self.Records[i];
            // 加载记录 基础信息
            fnAddRecordControl(i, itemRecord);
        }

        // 重新加载 验证
        // fnLoadRecordValidator();
    }

    // 获取未关联咨询信息集
    function fnLoadNotRelated(callBack) {

        var userValue = $("#selectUser").val();
        var questionTypeValue = $("#selectQuestionType").val();
        NewAJAX({
            url: "Ajax/IndividualConsultation.ashx",
            dataType: "json",
            data: { operationType: "NotRelated", userId: userValue, questionTypeId: questionTypeValue },
            callBack: function (result) {

                self.NotRelated = result;
                if (self.NotRelated.length == 0) {
                    $("#btnRecordAdd").attr("disabled", "disabled");
                }
                if (callBack) {
                    callBack();
                }
            }
        });
    }

    // 添加 新的记录
    function fnAddRecord() {
        if (self.ValidatorRecord) {
            fnLoadRecordValidator();
            self.ValidatorRecord.validate();
            if (!self.ValidatorRecord.isValid()) {
                layer.closeAll();
                layer.alert("信息未完全验证通过，请检查所填信息完整再添加新的记录。")
                return;
            }
        }
        else {
            if ($("#divRecirdMain").children().length == 0) {
                var formRecord = $("#formRecord");
                if (formRecord.data('bootstrapValidator')) {
                    formRecord.data('bootstrapValidator').destroy();
                    formRecord.data('bootstrapValidator', null);
                }
                formRecord.bootstrapValidator({

                }).on('success.form.bv', function (e) {
                    // 阻止默认事件提交
                    e.preventDefault();
                });
                self.ValidatorRecord = formRecord.data("bootstrapValidator");

            }
            else {
                fnLoadRecordValidator();
            }
        }
        // 添加 明细信息
        fnCreateDefaultDetails();

        // 添加 控件
        var recordIndex = self.Records.length - 1;

        fnAddRecordControl(recordIndex, self.Records[recordIndex]);

        // 主容器
        var mainControl = $("#" + self.RecordContainer);
        // 跳转相应位置
        mainControl.scrollTop(mainControl[0].scrollHeight);
        // 删除以选元素
        //  self.NotRelated.splice(0, 1);
        //if (self.NotRelated.length == 0) {
        //    $("#btnRecordAdd").attr("disabled", "disabled");
        //}
        //  }
    }

    // 保存 记录
    function fnSaveRecord() {
        //加载层
        layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2

        fnLoadRecordValidator();
        // 验证表单
        if (self.ValidatorRecord) {

            self.ValidatorRecord.validate();
            if (!self.ValidatorRecord.isValid()) {
                layer.closeAll();
                layer.alert("信息未完全验证通过，请检查所填信息")
                return;
            }
        }
        // 是否结束操作
        var isEndIndex = -1;

        // 重新绑定
        $(self.Records).each(function (indexRecord, itemRecord) {
            var index = self.RecordIndexs[indexRecord];
            itemRecord.ConsultationNum = $("#inputNumber" + index).val();
            itemRecord.Severity = $("#inputStar" + index).val();
            itemRecord.InterviewStartTime = $("#inputTime" + index).val();
            itemRecord.ConsultationMode = $("#inputMode" + index).val();
            if (itemRecord.Contents.length == 0) {
                isEndIndex = indexRecord;
                return;
            }
            // 遍历 内容
            $(itemRecord.Contents).each(function (indexContent, itemContent) {

                var titleDivId = "txtRecord" + index + "_Title" + itemContent.Index + "";
                var contentDivId = "txtRecord" + index + "_Content" + itemContent.Index + "";
                itemContent.Title = $("#" + titleDivId).val();
                itemContent.Content = $("#" + contentDivId).val();
            });
        });

        // 是否结束操作
        if (isEndIndex > -1) {
            layer.closeAll();
            layer.msg("请将第" + (isEndIndex + 1) + "次记录补充完整!", { time: 2000, icon: 5 }, function () {

            });
            return;
        }
        NewAJAX({
            url: "Ajax/IndividualConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "SaveRecord",// action类型
                identity: self.EditId(),// Id
                records: JSON.stringify(self.Records)
            },
            callBack: function (result) {

                layer.closeAll();
                if (Number(result) > 0) {
                    layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {


                        // 加载 咨询记录 Tab
                        if ($("#liSummary").find("a").length == 0) {
                            // 加载 结案总结 Tab
                            var tab = fnLoadTab({
                                TabId: "liSummary",
                                TabContainerId: "Summary",
                                Caption: "结案总结"
                            });
                            fnLoadSummaryData();

                        }

                        // 加载 结案信息
                        $("#liSummary").find("a").trigger("click");

                    });
                } else {
                    layer.msg("保存失败!", { time: 3000, icon: 5 }, function () {

                    });
                }
            }
        });

    }

    // 加载 结案总结
    function fnLoadSummary() {
        var mainControl = $("#divSummaryMain");
        $("#txtSummaryStar").val(self.Summary.ConsultingEffect);
        if (self.Summary.Content.Content)
            $("#txtMainSummary").val(self.Summary.Content.Content);
        $("#txtMainTitle").attr("maxlength", "30");
        if (self.Summary.Content.Title)
            $("#txtMainTitle").val(self.Summary.Content.Title);
        $("#txtMainSummary").attr("maxlength", "4000").bind("input propertychange", function () {
            var text = $(this).val();
            var otherText = '';
            $("#divSummaryMain div[id^='divSummaryundefined_Row'] textarea[id^='txtSummaryundefined_Content']").each(function () {
                otherText += $(this).val();
            });
            var cansum = (text + otherText).length > 0;
            if (cansum != self.CanSummary) {
                self.CanSummary = cansum;
                fnLoadSummaryValidator();
            }
        });

        // 明细添加按钮
        var btnAddId = "divAddSummaryDetail";
        var btnAdd = fnCreateButtonAdd(btnAddId, 0, 0, function (btn, index) {

            // 其他内容累加器
            self.Summary.ContentCount++;
            var detail = { Index: self.Summary.ContentCount, Title: '', Content: '' };
            // 添加明细信息
            self.Summary.Contents.push(detail);

            // 创建明细控件 
            fnCreateDetailControl({
                btnAdd: btnAddId,
                mainContainer: self.RecordContainer,
                typeName: "Summary",
                listIndex: 0,
                list: self.Summary,
                detail: detail,
                delCallBack: function () {
                    // 重新加载 验证
                    fnLoadSummaryValidator();
                }
            });

            // 跳转相应位置
            mainControl.scrollTop(mainControl.scrollTop() + mainControl.height());
            // 加载 结案总结 验证
            fnLoadSummaryValidator();
        });
        mainControl.append(btnAdd);

        // 添加结案总结明细
        $(self.Summary.Contents).each(function (i, item) {

            // 添加明细控件 
            fnCreateDetailControl({
                btnAdd: "divAddSummaryDetail",
                mainContainer: "divSummaryMain",
                typeName: "Summary",
                listIndex: 0,
                list: self.Summary,
                detail: item,
                delCallBack: function () {
                    // 重新加载 验证
                    fnLoadSummaryValidator();
                }

            });

        });

        // 其他内容累加器 赋值
        self.Summary.ContentCount = self.Summary.Contents.length - 1;



        // 初始化 评星 控件
        $("#txtSummaryStar").rating({
            size: 'xs',
            showClear: false,
            showCaption: false,
            language: 'zh',
            min: 0,
            max: 5,
            step: 1
        }).on("change", function () {
            var val = $(this).val();
            if (val == "0") {
                val = "";
            }
            $(this).attr("value", val);
        });;

        // 加载 结案总结 验证
        fnLoadSummaryValidator();
        self.ValidatorSummary.validate();
    }

    // 保存 结案总结
    function fnSaveSummary() {
        self.ValidatorSummary.validate();
        if (!self.ValidatorSummary.isValid()) {
            layer.closeAll();
            return;
        }
        if (self.CanSummary) {
            layer.confirm('结案后不可修改，是否保存？', {
                btn: ['是', '否'] //按钮
            }, function () {
                SaveSummary();
            });
        }
        else
            SaveSummary();

    }
    function SaveSummary() {
        //加载层
        layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2

        // 验证表单
        self.ValidatorSummary.validate();
        if (!self.ValidatorSummary.isValid()) {
            layer.closeAll();
            return;
        }

        // 遍历 内容
        $(self.Summary.Contents).each(function (indexContent, itemContent) {
            var titleDivId = "txtSummaryundefined_Title" + itemContent.Index + "";
            var contentDivId = "txtSummaryundefined_Content" + itemContent.Index + "";
            itemContent.Title = $("#" + titleDivId).val();
            itemContent.Content = $("#" + contentDivId).val();
        });

        NewAJAX({
            url: "Ajax/IndividualConsultation.ashx",
            dataType: "json",
            data: {
                canSummary: self.CanSummary,//是否结案
                operationType: "SaveSummary",// action类型
                identity: self.EditId(),// Id
                consultingEffect: $("#txtSummaryStar").val(),// 咨询效果评估
                content: JSON.stringify({ Title: $("#txtMainTitle").val(), Content: $("#txtMainSummary").val() }),// 总结
                contents: JSON.stringify(self.Summary.Contents)// 其他总结
            },
            callBack: function (result) {

                layer.closeAll();

                if (Number(result) > 0) {
                    layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {
                        window.location.href = "IndividualConsultation.aspx";
                    });
                } else {
                    layer.msg("保存失败!", { time: 3000, icon: 5 }, function () {

                    });
                }
            }
        });
    }

    // 加载 基本信息
    function fnLoadFileData(callBack) {
        // 加载验证
        fnLoadFileValidator();
        // 加载咨询信息
        fnLoadConsultationInfo(function () {
            if (callBack) {
                callBack();
            }
        });
    }

    // 加载 记录信息
    function fnLoadRecordData(callBack) {

        if (callBack) {
            callBack();
        }
        // 加载 记录集
        fnLoadRecord();
        // 加载 未关联信息
        /* fnLoadNotRelated(function () {
 
             if (callBack) {
                 callBack();
             }
             // 加载 记录集
             fnLoadRecord();
         });*/

    }

    // 加载 总结
    function fnLoadSummaryData() {

        // 加载 评价
        fnLoadSummary();

    }

    // 初始化事件
    self.fnInit = function () {
        //加载层
        layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2

        // 绑定事件
        fnLoadBindEvent();

        // 首次加载基本数据信息
        fnLoadFileData(function () {
            // 加载完毕
            self.IsInitEnd = true;

            if (self.EditId() > 0) { // 编辑
                // 加载个案信息
                fnLoadInfo(function () {
                    // 加载 记录信息
                    fnLoadRecordData(function () {

                        // 存在记录 结案模块可用
                        if (self.IsSummary) {

                            // 加载 结案总结 Tab
                            fnLoadTab({
                                TabId: "liSummary",
                                TabContainerId: "Summary",
                                Caption: "结案总结"
                            });

                            // 加载 结案信息
                            fnLoadSummaryData();
                        }
                        layer.closeAll();
                    });
                });

            } else {

                // 加载个案号
                fnLoadNumber();
            }
        });

    }

    // 执行初始化
    self.fnInit();
}
