var navName = "/FunctionModular/AppointmentConsult/GroupConsultation.aspx";
var UserList = "";
$(document).ready(function () {
    var viewModel = new GroupConsultationEditViewModle();
});

function GroupConsultationEditViewModle() {
    var self = this;
    self.GroupUserlist;// 列表控件
    self.Startindex = 0;//开始条数索引
    self.Endindex = 10;//结束条数索引 

    self.ValidatorFile;// 基本信息验证对象
    self.ValidatorRecord;// 记录信息验证对象
    self.ValidatorSummary;// 总结信息验证对象
    self.ConsultationInfos;
    self.IsInitEnd = false;
    self.Records = new Array();// 记录集 
    self.NotRelated = new Array();// 未关联信息集
    self.IsSummary = false; // 是否可以 启用结案总结
    self.Summary = {
        ContentCount: 0,// 其他内容计数器
        ConsultingEffect: 0,// 咨询效果评估
        Content: "",// 总结 内容
        Contents: new Array()// 其他内容
    };// 总结
    self.SummaryDetailsIndex = 0;
    self.RecordContainer = "divRecirdMain";// 记录集容器名
    self.UserList;
    self.NewRecord = 0;

    // 编辑Id
    self.EditId = function () {
        var result = 0;
        var param = fnGetUrlParam("i");
        if (!isNaN(param)) {
            result = param;
        }
        return result;
    }
    //判断是否是编辑还是添加
    self.IsEditId = function () {
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
                        },
                        callback: {
                            message: "未查询到登录名和问题类型相对应的信息！",
                            callback: function (value, validator) {
                                return fnLoadValidataConsultationInfo();
                            }
                        }
                    }
                },
                selectThemType: {
                    message: '问题类型验证失败',
                    trigger: "change",
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整'
                        },
                    }
                },

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
        if (formRecord.data('bootstrapValidator'))
            formRecord.data('bootstrapValidator', null);

        // 动态指定验证
        var customFields = {};
        $(self.Records).each(function (indexRecord, itemRecord) {

            customFields["RecordCount" + indexRecord] = {

                message: '咨询次数验证失败',
                trigger: "change",
                validators: {
                    notEmpty: {
                        message: '请输入访谈次数！'
                    }, stringLength: {
                        min: 0,
                        max: 10,
                        message: '访谈次数不大于10位'
                    }, regexp: {
                        regexp: /^\d+$/,
                        message: '只能输入数字'
                    },
                }
            };
            customFields["RecordTime" + indexRecord] = {

                message: '日期验证失败',
                trigger: "change",
                validators: {
                    notEmpty: {
                        message: '请选择日期！'
                    }, stringLength: {
                        min: 0,
                        max: 30,
                        message: '日期不大于30字'
                    },
                }
            }
            customFields["selectRecord" + indexRecord] = {
                message: '咨询方式验证失败',
                trigger: "change",
                validators: {
                    notEmpty: {
                        message: '咨询方式不能为空!'
                    }
                }
            }

            $(itemRecord.Contents).each(function (indexContent, itemContent) {
                customFields["txtRecord" + indexRecord + "_Title" + itemContent.Index] = {
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
                //customFields["txtRecord" + indexRecord + "_Content" + itemContent.Index] = {
                //    message: '记录内容验证失败',
                //    validators: {
                //        stringLength: {
                //            min: 0,
                //            max: 4000,
                //            message: '记录内容不大于4000字'
                //        }
                //    }
                //}
            });
        });

        // 绑定 验证
        formRecord.bootstrapValidator({
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
        self.ValidatorRecord = formRecord.data("bootstrapValidator");


    }

    // 加载 结案信息验证
    function fnLoadSummaryValidator() {
        var startContent = "";
        var formSummary = $("#formSummary");
        if (formSummary.data('bootstrapValidator'))
            formSummary.data('bootstrapValidator', null);

        // 动态指定验证
        var customFields = {

            txtMainTitle: {
                message: "结案描述验证失败",
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
            },
            txtMainSummary: {
                message: "结案描述验证失败",
                validators: {
                    stringLength: {
                        min: 0,
                        max: 4000,
                        message: '结案总结不大于4000字'
                    }, callback: {
                        message: '请输入',
                        callback: function (value, validator) {
                            if (value != null && value != "") {
                                startContent = 1;
                                self.ValidatorSummary.updateStatus('txtSummaryStar', 'NOT_VALIDATED').validateField('txtSummaryStar');
                            }
                            return true;
                        }
                    },
                }
            },
            txtSummaryStar: {
                field: txtSummaryStar,
                message: "验证失败",
                trigger: "change",
                validators: {
                    callback: {
                        message: '请将必填项填写完整！',
                        callback: function (value, validator) {

                            if (startContent == 1) {

                                if (value == null || value == "") {
                                    return false;
                                } else {
                                    return true;
                                }
                            } else {
                                return true;
                            }
                            return true;
                        }
                    }


                }
            }
        };
        $(self.Summary.Contents).each(function (i, item) {
            customFields["txtSummary0_Title" + item.Index] = {
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
            customFields["txtSummary0_Content" + item.Index] = {
                message: '总结内容验证失败',
                validators: {
                    stringLength: {
                        min: 0,
                        max: 4000,
                        message: '总结内容不大于4000字'
                    }, callback: {
                        message: '请输入',
                        callback: function (value, validator) {
                            if (value != null && value != "") {
                                startContent = 1;
                                self.ValidatorSummary.updateStatus('txtSummaryStar', 'NOT_VALIDATED').validateField('txtSummaryStar');
                            }
                            return true;
                        }
                    },
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
                btn: ["确定", "取消"]
            }, function () {
                window.location.href = "GroupConsultation.aspx";
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
        $("#defaultbtn").click(function () {
            //self.Records.splice(0, 1);
            //self.Summary.splice(1, 1);

            layer.confirm("确定要删除记录信息么? ", {
                btn: ["确定", "取消"]
            }, function () {
                // 关闭窗口
                layer.closeAll();
                $("#default").remove();
            });
        })

        // 绑定 取消按钮 点击事件
        $(document).on("click", "[data-back]", function () {
            window.location.href = "IndividualConsultation.aspx";
        });
    }

    // 加载 个案号
    function fnLoadNumber() {
        NewAJAX({
            url: "Ajax/GroupConsultation.ashx",
            dataType: "json",
            data: { operationType: "Number" },
            callBack: function (result) {
                $("#lblNumber").text(result);

                layer.closeAll();
            }
        });
    }

    // 加载 基本信息--第一步
    function fnLoadFileData(callBack) {
        // 加载验证
        fnLoadFileValidator();
        // 加载咨询信息
        fnLoadQuestionType(function () {
            if (callBack) {
                callBack();
            }
        });
    }

    //编辑--加载个体档案基本信息--第二步
    function fnLoadInfo(callBack) {
        if (self.EditId() == "0") {
            return;
        }

        NewAJAX({
            url: "Ajax/GroupConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "GetGroupInfo",// action类型
                identity: self.EditId(),// Id 
                isEdit: "1"// 是否编辑
            },
            callBack: function (result) {

                // 个案号
                $("#lblNumber").text(result.Number);
                // 问题类型
                $("#selectQuestionType").val(result.QuestionTypeId);
                //主题名称
                $("#selectThemType").val(result.ThemName);
                //团体介绍
                $("#GroupDescribe").val(result.GroupDescribe);


                // 加载用户列表
                //fnLoadUsers();
                // 加载问题类型
             //   fnLoadQuestionType();2017.6.5

                // 显示记录页面并查询未关联记录
                fnShowRecord(false);

                // 存在记录 不可修改必要信息
                if (result.Record != null) {
                    if (result.Record.Content != "") {

                        //$("#selectQuestionType").attr("disabled", "disabled");

                        // 隐藏 原有组合控件  显示 新的下拉框
                        $(".bootstrap-select").hide();
                        //$("#selectUserdisabled").show();
                        //$("#selectUserdisabled").attr("disabled", "disabled");
                        //$("#selectUserdisabled").append("<option value='" + result.UserId + "'>" + result.LoginName + "</option>");
                        //$("#selectUserdisabled").val(result.UserId);
                        self.IsSummary = true;
                        // 加载 记录信息
                        self.Records = JSON.parse(result.Record.Content);
                        //加载 结案总结

                        if (result.Summary != null && result.Summary != "") {
                            self.Summary = result.Summary;

                        } else {

                            self.IsEditId = 0;
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
                            fnAddRecordControl(indexRecord, itemRecord);

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
                } else {
                    fnAddRecord();

                }
                if (callBack) {
                    callBack();
                }
            }
        });
    }


    //加载根据主题团体内容和问题类型
    function LoadGroupContent() {
        var ThemType = $("#selectThemType").val();
        for (var i = 0; i < self.ConsultationInfos.length; i++) {

            item = self.ConsultationInfos[i];
            if (ThemType == item.CSID) {
                $("#txtQuestionType").val(item.QTName);
                $("#GroupDescribe").val(item.CSContent);
            }
        }
    }



    //加载问题类型
    function fnLoadQuestionType(callBack) {
        fnLoadFileValidator();
        var options;
        var control = $("#selectQuestionType");
        NewAJAX({
            dataType: "json",
            data: { operationType: "GetQuestionType", index: self.EditId() },
            url: "Ajax/GroupConsultation.ashx",
            callBack: function (result) {

                for (var i = 0; i < result.length; i++) {
                    item = result[i];
                    options = control.find("option");
                    item = $("<option value='" + item.QTID + "' >" + item.QTName + "</option>");
                    control.append(item);
                }
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
        $("#btnSaveFile").attr("disabled",true);
        // 验证表单
        self.ValidatorFile.validate();
        if (!self.ValidatorFile.isValid()) {
            layer.closeAll();
            return;
        }
        NewAJAX({
            url: "Ajax/GroupConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "SaveFile",// action类型
                identity: self.EditId(),// Id
                number: $("#lblNumber").text(),// 个案号
                csname: $("#selectThemType").val(),// 主题类型
                groupdescribe: $("#GroupDescribe").val(),// 团体介绍
                QID: $("#selectQuestionType").val(),// 咨询师Id

            },
            callBack: function (result) {

                layer.closeAll();

                if (Number(result) > 0) {
                    layer.msg("保存成功！", { time: 1000, icon: 6 }, function () {
                       
                        self.EditId = function () {
                            return result;
                        }

                        debugger;
                        // 只有添加的时  进行 保存并下一步
                        if ($(".legendRecord").length == 0) {
                            fnAddRecord();
                        }
                        fnShowRecord(true, function () {
                           
                        });
                        //if ($("#liSummary").find("a").length == 0) {

                        //    // 显示记录页面并添加默认记录
                        //    fnShowRecord(true, function () {
                        //        //fnAddRecord();
                        //    });
                        //}
                    });
                    $("#btnSaveFile").attr("disabled", false);
                } else {
                    layer.msg("保存失败!", { time: 3000, icon: 5 }, function () {

                    });
                }

            }
        });

    }

    // 创建 添加控件按钮
    function fnCreateButtonAdd(rowId, index, btnClick) {
        var button = $("<div class='row' id='" + rowId + "'>" +
                               "<div class='col-md-2 col-ms-6 col-xs-6'>&nbsp;</div>" +
                               "<div class='col-md-7 col-ms-10 col-xs-10'>&nbsp;</div>" +
                               "<div class='col-md-3 col-ms-2 col-xs-2'>" +
                                   "<button class='btn btn-default-zblb' type='button' ><i class='fa fa-plus' style='color: green;' aria-hidden='true'></i></button>" +
                               "</div>" +
                           "</div>");

        // 添加按钮 点击事件
        button.find("button").data("index", index).on("click", function () {
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

        //// 加载未关联记录集
        //fnLoadNotRelated(function () {

        //    if (callback) {
        //        callback();
        //    }
        //});

    }

    // 创建 明细 控件 -结案咨询记录 btnAdd, mainContainer, typeName, listIndex, list, detailIndex, detail
    function fnCreateDetailControl(params) {

        var detailIndex = params.detail.Index;
        // typeName:  Record 、Summary   listIndex: self.Records self.Summary
        var selectDivId = "select" + params.typeName + params.listIndex + "_select" + detailIndex;
        var mainDivId = "div" + params.typeName + params.listIndex + "_Row" + detailIndex + "";
        var titleDivId = "'txt" + params.typeName + params.listIndex + "_Title" + detailIndex + "'";
        var contentDivId = "'txt" + params.typeName + params.listIndex + "_Content" + detailIndex + "'";

        var slecthtml = "";
        if (params.typeName == "Record" && self.NewRecord == 1) {
            slecthtml = "<div class='row'><div class='col-md-12'>" +
                                    "<div class='form-group'>" +
                                        "<div class='col-md-2 col-ms-6 col-xs-6' style='float:left'>"
                                           + "咨询方式:" +
                                        "</div> " +
                                        "<div class='col-md-2 col-ms-10 col-xs-10' >" +
                                            "<select class='form-control' style='padding-top: 5px;' id=" + selectDivId + " name=" + selectDivId + ">" +
                                          " <option value='4' >团体(面谈)</option>" +
                                             " <option value='2'>团体(在线)</option>" +


                                            "</select>" +
                                        "</div> " +
                                    "</div></div></div> ";
        }
        var divDetail = $(slecthtml + "<div class='row' id='" + mainDivId + "'>" +
                                "<div class='col-md-12'>" +
                                    "<div class='form-group'>" +
                                        "<div class='col-md-2 col-ms-6 col-xs-6' style='padding-bottom:10px;'>" +
                                            "<input type='text' class='form-control' style='text-align: right;' maxlength='30'; id=" + titleDivId + " name=" + titleDivId + " value='" + params.detail.Title + "' /> " +
                                        "</div> " +
                                        "<div class='col-md-7 col-ms-10 col-xs-10' >" +
                                            "<textarea class='form-control' style='padding-top: 5px;' maxlength='500'; id=" + contentDivId + " name=" + contentDivId + " >" + params.detail.Content + "</textarea> " +
                                        "</div> " +
                                        "<div class='col-md-3 col-ms-2 col-xs-2' >" +
                                            "<button class='btn btn-default-zblb' type='button' ><i class='fa fa-times' style='color: red;' aria-hidden='true'></i></button>" +
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
                    var Recordlength = params.list.Contents.length;
                    // 遍历查找数组元素
                    $(params.list.Contents).each(function (i, item) {
                        if (item.Index == index) {
                            index = i;
                        }
                    });
                    // 删除数组中数据
                    params.list.Contents.splice(index, 1);
                    if (params.list.Contents.length == 0) {           // && self.NewRecord == 1                                  
                        if (params.typeName == "Record") {
                            self.Records.splice(params.listIndex, 1);
                            $("#" + params.btnAdd).remove();
                            $("#" + parentId).prev().prev().remove();
                            $("#" + parentId).prev().remove();//记录                         

                        } else {
                            $("#" + parentId).remove();//总结

                        }
                    }

                    // 删除控件
                    $("#" + parentId).remove();
                    // 删除 回调方法
                    if (params.delCallBack) {
                        params.delCallBack();
                    }
                });

            });

        var divAddDetail = $("#" + params.btnAdd);
        if (divAddDetail) {
            divAddDetail.before(divDetail);
        } else {
            $("#" + params.mainContainer).append(divDetail);
        }
        if (params.detail.ConsultWay != null && params.detail.ConsultWay != "") {
            $("#" + selectDivId).val(params.detail.ConsultWay);
        }
    }


    // 加载 添加默认记录--2.1
    function fnCreateDefaultDetails() {
        // 基本参数
        //var option = { Id: "", StartTime: "", EndTime: "", Evaluate: "5" };
        //$.extend(option, param);

        // 生成默认记录集
        self.Records.push({
            ContentCount: 10,// 内容数量           
            Contents: [
                   { Index: 0, RecordCount: '', RecordTime: '', Title: '来访者主诉', Content: '', ConsultWay: '' },

            ]
        });
    }
    // 创建 记录基本信息 控件2.2
    function fnCreateRecordControl(recordIndex, itemRecord) {
        self.NewRecord = 1;
        var mainControl = $("#" + self.RecordContainer);
        var RecordCountVal = "";
        var RecordTimeVal = "";
        if (itemRecord.Contents[0] != null && itemRecord.Contents[0] != "" && itemRecord.Contents[0] != undefined) {
            if (itemRecord.Contents[0].RecordCount != null && itemRecord.Contents[0].RecordCount != "" && itemRecord.Contents[0].RecordCount != undefined) {
                RecordCountVal = itemRecord.Contents[0].RecordCount;
                RecordTimeVal = itemRecord.Contents[0].RecordTime;
            }
        }
        // 记录基本信息
        mainControl.append("<legend class='legendRecord'><div class='form-group'style='margin-left:20px;'>第" +
                                "<input class='legendTitle form-control input-sm' maxlength='10' style='width: 40px;display:inline;' onkeyup='value=value.replace(/[^\d]/g,'')' id='RecordCount" + recordIndex + "' name='RecordCount" + recordIndex + "' value=" + RecordCountVal + " ></input>次咨询记录" +
                                "<input class='legendTime form-control input-sm' id='RecordTime" + recordIndex + "' name='RecordTime" + recordIndex + "'readonly='readonly' style='width: 100px;display:inline;'  value='" + RecordTimeVal + "'></span>" +
                            "</div>" +
                            "</legend>");
        $('.legendTime').datepicker({
            language: "zh-CN",
            format: "yyyy-dd-mm",
            autoclose: true,
            todayHighlight: true,
            language: 'cn',
            format: "yyyy-mm-dd",//日期格式
            endDate: new Date()
        }).on('hide', function (e) {
            $("#formRecord").data('bootstrapValidator')
                .updateStatus('RecordTime'+recordIndex, 'NOT_VALIDATED', null)
                .validateField('RecordTime' + recordIndex);
        });


        // 其他内容累加器 赋值
        self.Records[recordIndex].ContentCount = self.Records[recordIndex].Contents.length - 1;

        // 明细添加按钮
        var btnAddId = "divAddRecordDetail" + recordIndex;
        var btnAdd = fnCreateButtonAdd(btnAddId, recordIndex, function (btn, index) {
            self.NewRecord = 0;
            // 添加明细信息
            var record = self.Records[index];
            // 子元素累加器 避免重复控件Id
            record.ContentCount++;
            var detail = { Index: record.ContentCount, RecordCount: '', RecordTime: '', Title: '', Content: '', ConsultWay: '' };

            record.Contents.push(detail);

            // 添加明细控件 
            fnCreateDetailControl({
                btnAdd: btnAddId,
                mainContainer: self.RecordContainer,
                typeName: "Record",
                listIndex: recordIndex,
                list: record,
                detail: detail,
                delCallBack: function () {
                    // 重新加载 验证
                    fnLoadRecordValidator();
                }
            });

            // 跳转相应位置
            mainControl.scrollTop(mainControl.scrollTop() + 90);

            // 重新加载 验证
            fnLoadRecordValidator();
        });


        mainControl.append(btnAdd);

        // 重新加载 评星 控件
        $("#inputStar" + recordIndex).rating({
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
        // 添加 记录主题控件
        fnCreateRecordControl(recordIndex, self.Records[recordIndex]);

        // 遍历内容集
        for (var j = 0; j < itemRecord.Contents.length; j++) {
            var itemContents = itemRecord.Contents[j];
            if (j > 0) {
                self.NewRecord = 0;
            }
            // 添加明细控件 
            fnCreateDetailControl({
                btnAdd: "divAddRecordDetail" + recordIndex,
                mainContainer: self.RecordContainer,
                typeName: "Record",
                listIndex: recordIndex,
                list: itemRecord,
                detail: itemContents,
                delCallBack: function () {
                    // 重新加载 验证
                    fnLoadRecordValidator();
                }
            });
        }
    }

    // 加载 记录集
    function fnLoadRecord() {
        $("#" + self.RecordContainer).empty();

        // 遍历记录集
        for (var i = 0; i < self.Records.length > 0; i++) {
            var itemRecord = self.Records[i];
            // 加载记录 基础信息
            fnAddRecordControl(i, itemRecord);
        }

        // 重新加载 验证
        fnLoadRecordValidator();
    }

    // 获取未关联咨询信息集
    function fnLoadNotRelated(callBack) {

        //var userValue = $("#selectUser").val();
        var ThemTypeValue = $("#selectThemType").val();
        NewAJAX({
            url: "Ajax/GroupConsultation.ashx",
            dataType: "json",
            data: { operationType: "NotRelated", ThemTypeId: ThemTypeValue },
            callBack: function (result) {

                //self.NotRelated = result;
                //if (self.NotRelated.length == 0) {
                //    $("#btnRecordAdd").attr("disabled", "disabled");
                //}
                if (callBack) {
                    callBack();
                }
            }
        });
    }

    // 添加 新的记录
    function fnAddRecord() {
        //self.NotRelated.length > 0 

        //if (self.NotRelated.length> 0 ) {
        var item = self.NotRelated[0];
        // 添加 明细信息
        fnCreateDefaultDetails();

        // 添加 控件
        var recordIndex = self.Records.length - 1;
        fnAddRecordControl(recordIndex, self.Records[recordIndex]);

        // 主容器
        var mainControl = $("#" + self.RecordContainer);
        // 跳转相应位置
        mainControl.scrollTop(mainControl[0].scrollHeight);
        // 重新加载 验证
        fnLoadRecordValidator();

        //// 删除以选元素
        //self.NotRelated.splice(0, 1);
        //if (self.NotRelated.length == 0) {
        //    $("#btnRecordAdd").attr("disabled", "disabled");
        //}
        //}
    }

    // 保存 记录
    function fnSaveRecord() {
        //加载层
        layer.load(0, { shade: 0.5 }); //0代表加载的风格，支持0-2

        // 验证表单
        self.ValidatorRecord.validate();
        if (!self.ValidatorRecord.isValid()) {
            layer.closeAll();
            return;
        }
        // 是否结束操作
        var isEndIndex = -1;

        // 重新绑定
        $(self.Records).each(function (indexRecord, itemRecord) {
            itemRecord.Severity = $("#inputStar" + indexRecord).val();

            if (itemRecord.Contents.length == 0) {
                isEndIndex = indexRecord;
                return;
            }
            // 遍历 内容
            $(itemRecord.Contents).each(function (indexContent, itemContent) {
                var RecordCountId = "RecordCount" + indexRecord;
                var RecordTimeId = "RecordTime" + indexRecord;


                var selectDivId = "selectRecord" + indexRecord + "_select" + itemContent.Index;
                var titleDivId = "txtRecord" + indexRecord + "_Title" + itemContent.Index + "";
                var contentDivId = "txtRecord" + indexRecord + "_Content" + itemContent.Index + "";
                if ($("#" + titleDivId).val() != null && $("#" + titleDivId).val() != "") {
                    itemContent.Title = $("#" + titleDivId).val();
                } else {
                    itemContent.Titl = "";
                }
                if ($("#" + contentDivId).val() != null && $("#" + contentDivId).val() != "") {
                    itemContent.Content = $("#" + contentDivId).val();
                } else {
                    itemContent.Content = "";
                }
                if ($("#" + RecordCountId).val() != null && $("#" + RecordCountId).val() != "") {
                    itemContent.RecordCount = $("#" + RecordCountId).val();
                } else {
                    itemContent.RecordCount = "";
                }
                if ($("#" + RecordTimeId).val() != null && $("#" + RecordTimeId).val() != "") {
                    itemContent.RecordTime = $("#" + RecordTimeId).val();
                } else {
                    itemContent.RecordTime = "";
                }
                if ($("#" + selectDivId).val() == "" || $("#" + selectDivId).val() == null) {
                    itemContent.ConsultWay = "";
                }
                else {
                    itemContent.ConsultWay = $("#" + selectDivId).val();
                }
            });
        });

        // 是否结束操作
        //if (isEndIndex > -1) {
        //    layer.closeAll();
        //    layer.msg("请将第" + (isEndIndex + 1) + "次记录补充完整!", { time: 2000, icon: 5 }, function () {

        //    });
        //    return;
        //}

        NewAJAX({
            url: "Ajax/GroupConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "SaveRecord",// action类型
                identity: self.EditId(),// Id
                records: JSON.stringify(self.Records),

            },
            callBack: function (result) {

                layer.closeAll();
                if (Number(result) > 0) {
                    layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {


                        // 加载 咨询记录 Tab
                        if ($("#liSummary").find("a").length == 0) {
                            // 加载 结案总结 Tab
                            fnLoadTab({
                                TabId: "liSummary",
                                TabContainerId: "Summary",
                                Caption: "结案总结"
                            });
                        }

                        // 加载 结案信息
                        fnLoadSummaryData();
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

        if (self.Summary.Content != null && self.Summary.Content != "") {
            self.Summary.Content = JSON.parse(self.Summary.Content);
            self.Summary.Contents = JSON.parse(self.Summary.OtherContent);
        }
        var mainControl = $("#divSummaryMain");
        $("#txtSummaryStar").val(self.Summary.ConsultingEffect);
        if (self.Summary.Content.Title != null && self.Summary.Content.Title != "") {
            $("#txtMainTitle").val(self.Summary.Content.Title);
        }
        $("#txtMainSummary").val(self.Summary.Content.Content);


        // 其他内容累加器 赋值
        self.Summary.ContentCount = self.Summary.Contents.length - 1;

        // 明细添加按钮
        var btnAddId = "divAddSummaryDetail";
        var btnAdd = "";
        var btnAdd = fnCreateButtonAdd(btnAddId, 0, function (btn, index) {

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
        //// 添加结案总结明细
        $(self.Summary.Contents).each(function (i, item) {

            // 添加明细控件 
            fnCreateDetailControl({
                btnAdd: btnAddId,
                mainContainer: "divSummaryMain",
                typeName: "Summary",
                listIndex: 0,
                list: self.Summary,//把 self.RecordContainer 改为self.Summary-2017.5.18
                detail: item,
                delCallBack: function () {
                    // 重新加载 验证
                    fnLoadSummaryValidator();
                }

            });

        });

        // 初始化 评星 控件
        $("#txtSummaryStar").rating({
            size: 'xs',
            showClear: false,
            showCaption: false,
            language: 'zh',
            min: 0,
            max: 5,
            step: 1
        });

        // 加载2 结案总结 验证
        fnLoadSummaryValidator();
    }

    // 保存 结案总结
    function fnSaveSummary() {
        var Contentval = 0;

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

            var titleDivId = "txtSummary0_Title" + itemContent.Index + "";
            var contentDivId = "txtSummary0_Content" + itemContent.Index + "";
            var ContentDIv = $("#" + contentDivId).val();
            if ($("#" + titleDivId).val() != null && $("#" + titleDivId).val() != "") {
                itemContent.Title = $("#" + titleDivId).val();
            } else {
                itemContent.Title = "";
            }
            if (ContentDIv != null && ContentDIv != "") {
                Contentval = 1;
                itemContent.Content = ContentDIv;
            } else {
                itemContent.Content = "";
            }
        });

        var txtMainTitles = "";
        var txtMainSummary = "";
        if ($("#txtMainTitle").val() != null && $("#txtMainTitle").val() != "") {
            txtMainTitles = $("#txtMainTitle").val();
        } else {
            txtMainTitles = "";
        }
        if ($("#txtMainSummary").val() != "" && $("#txtMainSummary").val() != null) {
            Contentval = 1;
            txtMainSummary = $("#txtMainSummary").val();
        } else {
            txtMainSummary = "";
        }

        var ZJ = JSON.stringify({ Title: txtMainTitles, Content: txtMainSummary });

        if (Contentval == 1) {
            layer.confirm("结案后不可修改，是否保存? ", {
                btn: ["确定", "取消"],
                cancel: function () {
                    layer.closeAll();
                    return;
                }
            }, function () {
                SummaryAdd(ZJ, Contentval);
            }, function () {
                layer.closeAll();
                return;
            });
        } else {
            SummaryAdd(ZJ, Contentval);

        }

    }

    //添加结案总结
    function SummaryAdd(ZJ, Contentval) {
        var IsEditId = self.IsEditId();
        NewAJAX({
            url: "Ajax/GroupConsultation.ashx",
            dataType: "json",
            data: {
                operationType: "SaveSummary",// action类型
                identity: self.EditId(),// Id
                consultingEffect: $("#txtSummaryStar").val(),// 咨询效果评估
                content: ZJ,// 总结
                contents: JSON.stringify(self.Summary.Contents),// 其他总结
                users: JSON.stringify(self.UserList),
                Contentval: Contentval,
                IsEditId: IsEditId
            },
            callBack: function (result) {

                layer.closeAll();

                if (Number(result) > 0) {
                    layer.msg("保存成功！", { time: 2000, icon: 6 }, function () {
                        window.location.href = " GroupConsultation.aspx";

                    });
                } else {
                    layer.msg("保存失败!", { time: 3000, icon: 5 }, function () {

                    });
                }
            }
        });
    }


    // 加载 记录信息
    function fnLoadRecordData(callBack) {

        // 加载 未关联信息
        fnLoadRecord();
        if (callBack) {
            callBack();
        }
        //fnLoadNotRelated(function () {

        //    if (callBack) {
        //        callBack();
        //    }
        //    // 加载 记录集
        //    fnLoadRecord();
        //});

    }

    // 加载 总结
    function fnLoadSummaryData() {

        // 加载 评价
        fnLoadSummary();
    }

    // 初始化事件
    self.fnInit = function () {
        //fnLoadBindEvent();
        //fnLoadQuestionType();
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
