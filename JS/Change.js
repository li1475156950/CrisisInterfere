var changeFlag = false;
var ReportsValue = 0;
$("input,select,textarea").change(function () {
    changeFlag = true; //改变页面操作即触发
    ReportsValue = 1;
});

function CheckChange() {
    if (changeFlag === true) {
        layer.confirm('没有编辑过你确定要编辑么？', {
            btn: ['是', '否'] //按钮
        }, function () {

        })

    } else {
        return true;
    }
}
//跳转方法
function RedirectURL(url, target) {
    if (ReportsValue==0) {
        if (changeFlag == true) {

            window.location.href = url;
        } else {
            window.location.href = url;
        }
    } else {
        window.location.href = url;
    }
}
