initSelectInput("type=4", "Changethem", "请选择往期主题");//初始化量表类别
PaiBanAdd();
function PaiBanAdd() {
    $('#PaibanAdd').bootstrapValidator({
        message: '表单验证失败.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            Consultant: {
                validators: {
                    callback: {
                        message: '请选择',
                        callback: function (value, validator) {
                            //$("#NumStart")
                            return value != "请选择";
                        }
                    }
                }
            },
            BDate: {
                message: '请将必填项填写完整！',
                validators: {
                    notEmpty: {
                        message: '时间不能为空.'
                    },
                    data: {
                        format: 'YYYY-MM-DD',
                        message: '时间格式不对.'
                    },
                   
                }

            },
            NumEnd: {
                message: '请将必填项填写完整！',
                validators: {
                    notEmpty: {
                        message: '时间不能为空.'
                    },
                   
                }

            },

        }
    }).on('success.form.bv', function (e) {
        e.preventDefault();
        var chk_value = "";
        $('input[name="week"]:checked').each(function () {

            chk_value += $(this).val() + ",";
        });
        $.ajax({
            url: "Ajax/Reservation.ashx?type=1",
            data: {
                Consultant: $("#Consultant").val(),
                BDate: $("#BDate").val(),
                EDate: $("#EDate").val(),
                Week: chk_value,
                BTime: $("#BTime").val(),
                EndTime: $("#EndTime").val(),
                ConselingType: $("#ConselingType").val(),
                ConselingAddress: $("#ConselingAddress").val(),
            },
            type: "Get",
            dataType: "text",
            success: function (data) {
                if (data > 0) {
                    $("#YYtimehid").val(data);
                    $("#PaibanAdd").data('bootstrapValidator').destroy();
                    $('#PaibanAdd').data('bootstrapValidator', null);
                    var ConselingVal = $("#ConselingType").val();
                    if (ConselingVal == 3 || ConselingVal == 4) {
                        $('#paiban06').modal('hide');
                        $('#tuanti04').modal();
                    } else {
                        $('#paiban06').modal('hide');
                        layer.msg('预约成功！', { icon: 1 });
                    
                      
                       
                    }
                    $("#PaibanAdd :input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");//核心
                } else {
                    layer.msg('预约失败！', { icon: 1 });
                }
            }

        })

    })
}
function ThemAdd()
{
    $('#NewThem').bootstrapValidator({
        message: '表单验证失败.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            Them: {
                message: '请将必填项填写完整！',
                validators: {
                    notEmpty: {
                        message: '请输入主题！'
                    },

                }
            },        

        }
    }).on('success.form.bv', function (e) {
        e.preventDefault();
     
        $.ajax({
            url: "Ajax/Reservation.ashx?type=2",
            data: {
                Them: $("#Them").val(),
                content: $("#content").val(),
                EntryCondition: $("#EntryCondition").val(),
                YYID: $("#YYtimehid").val(),
            },
            type: "Get",
            dataType: "text",
            success: function (data) {
                if (data>0) {
                    $("#NewThem").data('bootstrapValidator').destroy();
                    $('#NewThem').data('bootstrapValidator', null);
                    $("#NewThem:input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");//核心
                    layer.alert('保存成功!', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0,

                    }, function () {
                        //window.location.href = "MemberManagement.aspx";
                    });

                } else {
                    layer.alert('保存失败!', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    }, function () {

                    });
                }
            }
        })

    })
}
function OldThemAdd() {
    $('#NewThem').bootstrapValidator({
        message: '表单验证失败.',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            Changethem: {
                validators: {
                    callback: {
                        message: '请选择',
                        callback: function (value, validator) {
                            return value != "请选择";
                        }
                    }
                }
            },
            CType: {
                message: '请将必填项填写完整！',
                validators: {
                    notEmpty: {
                        message: '时间不能为空.'
                    },

                }

            },
         
        }
    }).on('success.form.bv', function (e) {
        e.preventDefault();

        $.ajax({
            url: "Ajax/Reservation.ashx?type=3",
            data: {
                Changethem: $("#Changethem").val(),
                CType: $("#CType").val(),
                YYID: $("#YYtimehid").val(),
               
            },
            type: "Get",
            dataType: "text",
            success: function (data) {
                if (data == "True") {
                    $("#OldThemAdd").data('bootstrapValidator').destroy();
                    $('#OldThemAdd').data('bootstrapValidator', null);
                    $("#OldThemAdd:input").not(":button, :submit, :reset, :hidden").val("").removeAttr("checked").remove("selected");//核心
                    layer.alert('保存成功!', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0,

                    }, function () {
                        //window.location.href = "MemberManagement.aspx";
                    });

                } else {
                    layer.alert('保存失败!', {
                        skin: 'layui-layer-lan', //样式类名
                        closeBtn: 0
                    }, function () {

                    });
                }
            }
        })

    })
}
function validTime() {

    var startTime = $("#BDate").val();
    var endTime = $("#EDate").val();
    var arr1 = startTime.split("-");
    var arr2 = endTime.split("-");
    var arr3 = GetDateStr(0).split("-");
    var date1 = new Date(parseInt(arr1[0]), parseInt(arr1[1]) - 1, parseInt(arr1[2]), 0, 0, 0);
    var date2 = new Date(parseInt(arr2[0]), parseInt(arr2[1]) - 1, parseInt(arr2[2]), 0, 0, 0);
    var date3 = new Date(parseInt(arr3[0]), parseInt(arr3[1]) - 1, parseInt(arr3[2]), 0, 0, 0);
    var d2 = new Date(); //取今天的日期
    if (date1.getTime() > date2.getTime()) {
        layer.msg('结束日期不能小于开始日期', this);
        $("#EDate").val("");
        //$("#divtime").hide();
        //$("#divtime1").show();
        return false;
    }
    else if (date1.getTime() < date3.getTime()) {
        layer.msg('开始时间不能在当前日期之前', { icon: 1 });
        $("#BDate").val("");
        //$("#divtime").hide();
        //$("#divtime1").show();
        return false;
    }
    else if (date2.getTime() < date3.getTime()) {
        alert('结束时间不能在当前日期之前', { icon: 1 });
        $("#EDate").val("");
       
        return false;
    }
    //else if (startTime == endTime && startTime != "" && endTime != "") {
    //    $("#lbltime").text(MenuUI_U_Conseling_AddColselingDate.GetDatetime(endTime).value);
        
    //}
    

}
function validTime1() {
    var startTime = $("#BTime").val();
    var endTime = $("#EndTime").val();
    var startTime1 = $("#BDate").val();
    var arr1 = startTime.split(":");
    var arr2 = endTime.split(":");
    var arr3 = GetDateStr(0).split("-");
    var arr4 = startTime1.split("-");
    var date1 = new Date(parseInt(arr1[0]), parseInt(arr1[1]) - 1, parseInt(arr1[2]), 0, 0, 0);
    var date2 = new Date(parseInt(arr2[0]), parseInt(arr2[1]) - 1, parseInt(arr2[2]), 0, 0, 0);

    if (date1.getTime() > date2.getTime()) {
        layer.msg('结束日期不能小于开始日期', { icon: 1 });
        $("#BTime").val("");
        $("#EndTime").val("");
        return false;
    }
}

function GetDateStr(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate() + AddDayCount); //获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth() + 1; //获取当前月份的日期
    var d = dd.getDate();
    return y + "-" + m + "-" + d;
}
/*-----初始化下拉列表公共方法-----*/
function initSelectInput(types, controlname, Exhibition) {
    $("#" + controlname).empty();
    if (Exhibition != "") {
        $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
    }
    $.ajax({
        type: "POST",
        url: "Ajax/Reservation.ashx",
        data: types,//要执行查询的数据参数
        success: function (msg) {
            $.each(eval(msg), function (index, item) {
                $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

            });

        }
    });
}
