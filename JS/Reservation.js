$(function () {
    //悬浮框
    ////$("[data-toggle='tooltip']").tooltip();
    //模拟框
    $('#Mymodel1').on("click", function () {
        $("#Mymodel1").removeAttr('data-toggle');
        $("#Mymodel1").attr('data-toggle', 'modal');

    });
    $('#xiao1').on("click", function () {

        $('#secondmodal').modal();
    });
    $('#xiao2').on("click", function () {

        $('#three03').modal();
    });
    $('#xiugai03').on("click", function () {

        $('#three03').modal();
    });
    //$('#method').on("click", function () {

    //    $('#tuanti04').modal();
    //});
    $('#chakan01').on("click", function () {

        $('#chakan05').modal();
    });  
    $('#textarea').hide();
    //切换用户
    $("#user").hide();
    $("#Nouser").hide();
    $(".user01").change(function () {
        var $selectedvalue = $("input[name='user']:checked").val();

        if ($selectedvalue == 0) {
            $("#Nouser").hide();
            $("#user").show();


        } else if ($selectedvalue == 1) {
            $("#user").hide();
            $("#Nouser").show();
        }
        else {
            $("#user").hide();
            $("#Nouser").hide();

        }
    });
    //切换主题
    $("#nothem").hide();
    $("#them").hide();
    $(".Newzhuti").change(function () {
        var $selectedvalue = $("input[name='zhuti']:checked").val();

        if ($selectedvalue == 0) {
            ThemAdd();
            $("#nothem").show();
            $("#them").hide();
        } else if ($selectedvalue == 1) {
            OldThemAdd();
            $("#nothem").hide();
            $("#them").show();;
        }
        else {
            $("#nothem").hide();
            $("#them").hide();

        }
    });
    //选中主题显示相应的主题
    $('#Changethem').change(function () {
        var themid = $('#Changethem').val();
        if (themid != "" && themid !=null && themid !=0) {
            $.ajax({
                url: "Ajax/Reservation.ashx?type=5",
                data: { YNTID: themid },
                type: "get",
                success: function (result) {
                    result = eval('(' + result + ')');
                    $("#textarea").find("div:eq(0) > ul>li:eq(0)").html(result._ynt_themname);
                    $("#textarea").find("div:eq(0) > ul>li:eq(1)").html(result._ynt_describe);
                    $("#textarea").find("div:eq(0) > ul>li:eq(2)").html(result._ynt_entrycondition)
                    //$('#mychakan').modal('show');
                }
            })
            $('#textarea').show();
        } else {
            $('#textarea').hide();
        }
    });
    //切换是关闭还是开发
    $('#yyfszs').hide();
    $('#yyfs').change(function () {
        var themid = $('#yyfs').val();
        if (themid == '0') {
            $('#yyfszs').show();
        } else {
            $('#yyfszs').hide();
        }
    });
});


