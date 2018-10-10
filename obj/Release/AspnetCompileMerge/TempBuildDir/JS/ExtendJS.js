//错误信息提示  不可删除  不可删除


// 封装 Ajax  创建人：夏增文 创建时间：2017-03-30
window.NewAJAX = function (params) {
    var defaultParam = {
        type: "POST",
        dataType: "html",
        url: "",
        data: {},
        async:"",
        callBack: function (result) { }
    }
    defaultParam = $.extend(defaultParam, params);

    $.ajax({
        type: defaultParam.type,
        dataType: defaultParam.dataType,
        url: defaultParam.url,
        data: defaultParam.data,
        async:false,
        success: function (result) {
            defaultParam.callBack(result);
        },
        error: function (xmlHttpRequest, textStatus, errorThrown) {
            debugger;
            layer.closeAll();
        }
    });
}

// 封装 DataTable 创建人：夏增文 创建时间：2017-03-31
window.NewDataTable = function (params) {
    var isLoadDataTable = true;
    // 默认参数
    var defaultParam = {
        container: "",
        pageParamName: "p",
        pageLength: 10,
        ajax: {
            method: 'get',
            url: "",
            dataSrc: "data",
            data: function () {
                return {};
            }
        },
        createdRow: function (row, data, dataIndex) {

        },
        initComplete: function (setting, json) {

        },
        drawCallback: function (s) {

        }
    }
    defaultParam = $.extend(defaultParam, params);

    // 获取请求页码
    function fnGetRequiredPageIndex() {
        var pageIndex = fnGetUrlParam(defaultParam.pageParamName);
        var result = /^[1-9]\d*$/.test(pageIndex) ? Number(pageIndex) - 1 : 0;

        return result;
    }

    var tableGrid = $('#' + defaultParam.container).dataTable({
        serverSide: true,//分页，取数据等等的都放到服务端去
        searching: false,
        pageLength: defaultParam.pageLength,//首次加载的数据条数
        ordering: false,//排序操作在服务端进行，所以可以关了。
        processing: true,//载入数据的时候是否显示“载入中”
        clickToSelect: true,
        bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
        clickToSelect: true,
        aoColumnDefs: [
            { //隐藏列
                bVisible: true,
                aTargets: [0]
            }
        ],
        ajax: {
            method: defaultParam.ajax.method,
            url: defaultParam.ajax.url,
            dataSrc: defaultParam.ajax.dataSrc,
            data: function (d) {
                var result = {};
                if (defaultParam.ajax.data) {
                    result = defaultParam.ajax.data();
                }

                var pageIndex = fnGetRequiredPageIndex();
                // 当初始化的时候
                if (isLoadDataTable && $('#' + defaultParam.container).DataTable().page() != pageIndex) {
                    d.start = pageIndex * d.length;
                }

                var startindex = 0;
                var endindex = 0;
                if (d.start == 0) {
                    endindex = d.length;
                } else {
                    startindex = d.start + 1;
                    endindex = d.start + d.length;
                }
                result.startRowIndex = startindex;
                result.endRowIndex = endindex;

                return result;
            }
        },
        createdRow: function (row, data, dataIndex) {

            // 当前页码
            var tablePageIndex = $('#' + defaultParam.container).DataTable().page() + 1;

            // 当初始化的时候
            var pageIndex = fnGetRequiredPageIndex();
            // 当初始化的时候
            if (isLoadDataTable && $('#' + defaultParam.container).DataTable().page() != pageIndex) {
                tablePageIndex = pageIndex + 1;
            }

            if (defaultParam.createdRow) {
                defaultParam.createdRow(row, data, dataIndex, tablePageIndex);
            }
        },
        "oLanguage": {
            "sProcessing": "处理中...",
            "sLengthMenu": "_MENU_ 记录/页",
            "sZeroRecords": "查询无结果！",
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
            // 获取请求的页码
            var pageIndex = fnGetRequiredPageIndex();
            if ($('#' + defaultParam.container).DataTable().page() != pageIndex) {
                $('#' + defaultParam.container).dataTable().fnPageChange(pageIndex);
            }
            isLoadDataTable = false;


            if (defaultParam.initComplete) {
                defaultParam.initComplete(setting, json);
            }
        },
        drawCallback: function (s) {

            if (defaultParam.drawCallback) {
                defaultParam.drawCallback(s);
            }
        }

    });
    return tableGrid;
}

// 获取地址栏参数 创建人：夏增文 创建时间：2017-03-31
window.fnGetUrlParam = function (paramName) {
    var result = "";

    var usr = window.location.href;
    var ul = usr.toString().split('?');
    if (ul.length == 2) {
        var params = ul[1].split('&');
        for (var i = 0; i < params.length; i++) {
            var param = params[i].split('=');
            if (param.length == 2) {
                if (param[0] + "" == paramName) {
                    result = param[1];
                    break;
                }
            }
        }
    }

    return result;
}

// 设置全选 创建人：夏增文 创建时间：2017-04-01
window.SetCheckAll = function (params) {
    var defaultParam = {
        checkAllControl: "allCheck",
        checkChildClass: "childCheck",
        callBack: function () { }
    }
    defaultParam = $.extend(defaultParam, params);

    // 设置 全选控件 点击事件
    $("#" + defaultParam.checkAllControl).click(function () {

        var checkAllControl = $("#" + defaultParam.checkAllControl);
        var arrayCheck = $("." + defaultParam.checkChildClass);
        for (var i = 0; i < arrayCheck.length; i++) {
            //当前checkbox 的状态 = 所有的控件状态
            arrayCheck[i].checked = checkAllControl[0].checked;
        }
    });

    // 设置 子选控件 点击事件       
    $(document).on("click", "." + defaultParam.checkChildClass, function () {

        var checkAllControl = $("#" + defaultParam.checkAllControl);
        var arrayCheck = $("." + defaultParam.checkChildClass);

        if (!$(this)[0].checked) {
            checkAllControl[0].checked = false;
        }
        else {
            var isSuccess = true;
            for (var i = 0; i < arrayCheck.length; i++) {
                if (arrayCheck[i].checked == false) {
                    isSuccess = false;
                    break;
                }
            }
            checkAllControl[0].checked = isSuccess;
        }

        // 回调函数
        if (defaultParam.callBack) {
            defaultParam.callBack();
        }

    });

}

// 获取选中的CheckBox 创建人：夏增文 创建时间：2017-04-01
window.GetCheckedCheckBox = function (params) {
    var defaultParam = {
        checkChildClass: "childCheck",
        eachCallBack: function (index, item) { },
        callBack: function () { }
    }
    defaultParam = $.extend(defaultParam, params);
    var result = new Array();

    (function () {

        var checkbox = $("." + defaultParam.checkChildClass);

        for (var i = 0; i < checkbox.length; i++) {
            if (checkbox[i].checked) {

                // 遍历回调
                if (defaultParam.eachCallBack) {
                    defaultParam.eachCallBack(i, checkbox[i]);
                }

                result.push(checkbox[i]);
            }
        }
        // 外部 回调
        if (defaultParam.callBack) {
            defaultParam.callBack();
        }

    }());
    return result;
}
//获取系统当前时间
//创建人:李超
window.GetNowTime = function () {
    var nowtime = new Date();
    var year = nowtime.getFullYear();
    var month = (nowtime.getMonth() + 1);
    var day = (nowtime.getDate());
    return year + "-" + month + "-" + day;
}
window.GetNowTimeContainHourAndMinutes = function () {
    var nowtime = new Date();
    var year = nowtime.getFullYear();
    var month = (nowtime.getMonth() + 1);
    var day = (nowtime.getDate());
    var hour = (nowtime.getHours());
    var minutes = (nowtime.getMinutes());
    return year + "-" + month + "-" + day + " " + hour + ":" + minutes;
}
//日期相减得到天数方法
//创建人:李超
window.DateMinus = function (startDate,endDate) {
    var startDate = new Date(startDate);
    var endDate = new Date(endDate);
    var days = endDate.getTime() - startDate.getTime();
    var day = parseInt(days / (1000 * 60 * 60 * 24));
    return day;
}
//日期加天数得到新的日期
//创建人:李超
window.GetAddDayDate = function (dateTemp, days)
{
    var dateTemp = dateTemp.split("-");
    var nDate = new Date(dateTemp[0] + '-' + dateTemp[1] + '-' + dateTemp[2]); //转换为YYYY-MM-dd格式    
    var millSeconds = Math.abs(nDate) + (days * 24 * 60 * 60 * 1000);
    var rDate = new Date(millSeconds);
    var year = rDate.getFullYear();
    var month = rDate.getMonth() + 1;
    if (month < 10) month = "0" + month;
    var date = rDate.getDate();
    if (date < 10) date = "0" + date;
    return (year + "-" + month + "-" + date);
}
//添加数组的contains方法
//创建人:李超
Array.prototype.contains = function (item) {
    return RegExp("\\b" + item + "\\b").test(this);
};
//判断两个日期间包含的星期，返回数组
//李超
window.GetWeekArray = function (startDate, endDate) {
    var days = window.DateMinus(startDate, endDate);
    var weekArray = [];
    for (var i = 0; i < days+1; i++) {
        var tempWeek = new Date(window.GetAddDayDate(startDate, i)).getDay();
        if (!weekArray.contains(tempWeek)) {
            weekArray.push(tempWeek);
        }
        
    }
    return weekArray;
}
//求两个数组之间的交集
window.GetIntersectArray = function (beforeArary, newArray) {
    var tempArray = [];
    var length = newArray.length;
    for (var i = 0; i < length; i++) {
        if(beforeArary.contains(newArray[i]))
        {
            tempArray.push(newArray[i]);
        }
    }
    return tempArray;
}
//发站内信公共方法
window.SendWebLetter = function (receiveID, title, content) {
    $.ajax({
        url: "/FunctionModular/Letter/Ajax/Letter.ashx?type=16",
        data: { receveid: receiveID, title: title, content:content},
        type: 'get',
        dataType: "json",
        success: function (result) {
        }
    })
}
//得到实体星星
window.GetStarString = function (starCount) {
    var totalCount = 5;
    var hollowStar = "☆";
    var solidStar = "★"
    var showStar = "";
    for (var i = 0; i < starCount; i++) {
        showStar += solidStar;
    }
    for (var i = 0; i < totalCount-starCount; i++) {
        showStar += hollowStar;
    }
    return showStar;
}
//加减小时数，返回日期格式
window.GetAddHoursDate = function (hours,date) {
    var nowtime = new Date(date);
    var year = nowtime.getFullYear();
    var month = (nowtime.getMonth() + 1);
    var day = (nowtime.getDate());
    var hour = (nowtime.getHours());
    var minutes = (nowtime.getMinutes());
    if (hours == 24) {
        day = day - 1;
    }
    if (hours != 24 && hour < hours) {
        day = day - 1;
        hour = 24 - (hours - hour);
    } 
    if(hours<hour) {
        hour = hour - hours;
    }
    return year + "-" + month + "-" + day + " " + hour + ":" + minutes;
}
//验证数字的正则表达式
window.ValidateNumber = function (val) {
    var regNumber = new RegExp("^[0-9]*$");
    if (regNumber.test(val)) {
        return true;
    }
    return false;
}
//验证手机号码的正则表达式
window.ValidateCellPhone = function (val) {
    var phoneReg = /^\d{11}$/;
    if (phoneReg.test(val)) {
        return true;
    }
    return false;
}
//得到当前系统的用户登录名
window.GetCurrentLoginName = function () {
    var loginName;
    $.ajax({
        url: "/FunctionModular/AppointmentConsult/Ajax/AppointmentManagement.ashx?operationType=GetCurrentLoginName",
        type: "GET",
        dataType: "text",
        async:false,
        success: function (result) {
            loginName = result;
        }
    })
    return loginName;
}
//特殊字符正则表达验证
window.ValidateIsContainSpecialChar = function (val) {
    var reg = /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/;
    if (reg.test(val)) {
        return true;
    }
    return false;
}
//年数相加方法
window.GetAddYearDate = function () {
    var nowtime = new Date();
    var year = nowtime.getFullYear()+1;
    var month = (nowtime.getMonth() + 1);
    var day = (nowtime.getDate());
    return year + "-" + month + "-" + day;
}
window.ClearSpace = function (str) {
    return str.replace(/\s/g, '')
}
window.PutDataToRecycleBin = function (parameter) {
    $.ajax({
        url: "/FunctionModular/CommonMethod/Ajax/CommonMethod.ashx?operationType=PutDataToRecycleBin",
        type: "post",
        async:false,
        data: { recycleBinModelList: JSON.stringify(parameter.recycleBinModelList) },
        dataType: "json",
        success: function (data) {
            parameter.callBack(data);
        }
    })
}
Array.prototype.remove = function (val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};
$.fn.dataTable.ext.errMode = function (s, h, m) {
    //  如果需要弹框错误提示  请分别判断 s,h,m
};