<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="StartAnswerLiftEvens.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.StartAnswerLiftEvens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    <link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script type="text/javascript">


        function TiJiao() {
            layer.open({
                type: 1,
                title: false,
                closeBtn: false
            });
            //加载层
            layer.load(0, { shade: false }); //0代表加载的风格，支持0-2

            var eeee = {};
            var qq1 = $(".table-responsive").find(":radio,:text").serializeArray();
            //var type = "false";//一过性次数选中，但是没有输入内容
            var notcheck = "";// 漏选题号字符串
            //var numtype = "false";//文本输入次数是否是正整数
            $.each(qq1, function () {
                var name = this.name;
                var EventValue = this.value;
                if (name.indexOf("text") > -1) {
                    var name1 = name.split("o");
                    var name2 = "radio" + name1[1];
                    var id = name1[1].split("_");
                    var list = $('input:radio[name="' + name2 + '"]:checked').val();
                    var lisval = $('input[name="' + name2 + '"]:checked').val();
                    if (this.value == "" && list != null && lisval == "on") {//选中“一过性事件”文本输入列，但是没有输入数据
                        // type = "true";
                        var num = parseInt(id[0]) + 1 + "题";
                        if (notcheck == "") {
                            notcheck += num + ",";
                        }
                        else {
                            if (notcheck.indexOf(num) < 0) {//不包含
                                notcheck += num + ",";
                            }
                        }
                    }
                    else if (this.value != "") {
                        eeee[name2] = this.value;
                        //if (isNaN(this.value)) {
                        //    numtype = "true";
                        //}
                        //else {
                        //    eeee[name2] = this.value;
                        //}
                    }
                }
                else if (this.value != "on") {
                    eeee[this.name] = this.value;
                }
            });
            //if (type == "true") {
            //    alert("请输入“一过性事件”的次数！");
            //    return;
            //}
            //else if (numtype == "true") {
            //    alert("您输入的“一过性事件”有不合法数据！");
            //    return;
            //}
            var jsonsname = JSON.stringify(eeee);
            jsons = JSON.parse(jsonsname);
            var lengths = getJsonObjLength(jsons);
            //if (lengths < 8) {//行数*4
            //    alert("请答完题再交卷！");
            //    return;
            //}

            /*        判断是否漏选开始              */
            var ischeck = ",";
            $("input:radio:checked").each(function () {
                var name = $(this).attr("name");
                ischeck += name + ",";
            })
            $("input:radio:not([checked])").each(function () {
                var name = $(this).attr("name");
                if (ischeck.indexOf("," + name + ",") < 0) {//漏选项
                    var NameStr = name.split("o");
                    var id = NameStr[1];//0_1
                    var idStr = id.split("_");
                    var num = parseInt(idStr[0]) + 1 + "题";
                    if (notcheck == "") {
                        notcheck += num + ",";
                    }
                    else {
                        if (notcheck.indexOf(num) < 0) {//不包含
                            notcheck += num + ",";
                        }
                    }
                }
            })
            if (notcheck != "") {
                var langu = "未作答题目：" + notcheck.substring(0, notcheck.lastIndexOf(','));
                DivDialog(langu);
                return;
            }
            /*        判断是否漏选结束              */

            var CountScore = "";//发生次数分数
            var EventType = "";//事件性质
            var LevelScore = "";//影响程度分数
            var TimeScore = "";//持续时间分数
            var AllGoodScore = "0";//正性事件刺激量
            var AllBadScore = "0";//坏性事件刺激量
            var AllScore = "0";//事件总刺激量
            $.each(jsons, function (name, value) {
                var name1 = name.split("_");
                if (name1[1] == 0) {//此列是“事件发生时间”列
                    //CountScore = value;
                    $("#hidCountScore").val(value);
                }
                else if (name1[1] == 1) {//此列是事件性质列，0是好事，1是坏事
                    //EventType = value;
                    $("#hidEventType").val(value);
                }
                else if (name1[1] == 2) {//此列是“精神影响程度”列
                    //LevelScore = value;
                    $("#hidLevelScore").val(value);
                }
                else if (name1[1] == 3) {//此列是“持续时间”列
                    //TimeScore = value;
                    $("#hidTimeScore").val(value);
                }
                if ($("#hidEventType").val() == "0" && $("#hidCountScore").val() != "" && $("#hidLevelScore").val() != "" && $("#hidTimeScore").val() != "")//好事
                {
                    if (AllGoodScore == "0") {
                        AllGoodScore = parseInt($("#hidCountScore").val()) * parseInt($("#hidLevelScore").val()) * parseInt($("#hidTimeScore").val());
                    }
                    else {
                        AllGoodScore = parseInt(AllGoodScore) + parseInt($("#hidCountScore").val()) * parseInt($("#hidLevelScore").val()) * parseInt($("#hidTimeScore").val());
                    }
                    $("#hidEventType").val("")
                    $("#hidCountScore").val("");
                    $("#hidLevelScore").val("");
                    $("#hidTimeScore").val("");
                }
                else if ($("#hidEventType").val() == "1" && $("#hidCountScore").val() != "" && $("#hidLevelScore").val() != "" && $("#hidTimeScore").val() != "") {//坏事
                    if (AllBadScore == "0") {
                        AllBadScore = parseInt($("#hidCountScore").val()) * parseInt($("#hidLevelScore").val()) * parseInt($("#hidTimeScore").val());
                    }
                    else {
                        AllBadScore = parseInt(AllBadScore) + parseInt($("#hidCountScore").val()) * parseInt($("#hidLevelScore").val()) * parseInt($("#hidTimeScore").val());
                    }
                    $("#hidEventType").val("")
                    $("#hidCountScore").val("");
                    $("#hidLevelScore").val("");
                    $("#hidTimeScore").val("");
                }
            });
            AllScore = AllGoodScore + parseInt(AllBadScore);
            $("#hidAllBadScore").val(AllBadScore);
            $("#hidAllGoodScore").val(AllGoodScore);
            $("#hidAllScore").val(AllScore);
            $.ajax({
                type: "POST",
                url: "Ajax/MyTest.ashx",
                data: {
                    type: "Save",
                    Code: "LB_14824009961900",
                    DID: getUrlParam("DID"),
                    RidoJson: jsonsname,
                    state: 2,
                    AnserID: getUrlParam("AnserID"),
                    score: AllScore,
                    startime: $("#Startime").val(),
                    JsonPid: 1,
                    AName: "生活事件",
                },
                success: function (msg) {
                    if (msg == "1") {
                        layer.msg('提交成功!', { icon: 6, time: 2000 }, function () {
                            window.location.href = 'MyTest.aspx';
                        });

                    }
                    else if (msg == "2") {
                        layer.closeAll();
                        $("#Btn_Submit").removeAttr("disabled");

                        layer.msg('管理员已撤销该量表作答权限，请联系管理员咨询详情！', { icon: 5, time: 3000 }, function () {
                            window.location.href = 'MyTest.aspx';
                        });
                    }
                    else {
                        layer.closeAll();
                        $("#Btn_Submit").removeAttr("disabled");
                        layer.msg('提交失败！', { icon: 5, time: 2000 });

                    }
                }
            });

            //alert(obj);

        }
        //设置弹出窗口
        function DivDialog(langu) {
            var Dialogid = $("#DivDialog");
            $("#spanDia").html(langu);
            //$("#lblDia").html(langu);
            //Dialogid.dialog({
               // modal: false,
               // width: 330,
               // height: 230,
               // title: "",
               // clone: true,
                //buttons: {
                //    "关闭": function () {
                        //关闭窗口
                  //      $(this).dialog("close");
                //    }
              //  }
           // });
            layer.open({
                title: '漏答提示窗口',
                //area: ['500px', '300px'],
                shade: 0,
                offset: ["30%", "40%"],
                maxmin: true,
                content: '<div class="row">'+langu+'</div>',
                btn: [ '取消'],
                yes: function () {
                    layer.closeAll();
                },
                btn2: function () {
                    layer.closeAll();
                },
                cancel: function ()
                {
                    layer.closeAll();
                }

            });
        }
        function getJsonObjLength(jsonObj) {
            var Length = 0;
            for (var item in jsonObj) {
                Length++;
            }
            return Length;//返回json的长度
        }
        $(document).ready(function () {
            //点击'一年前'列 单选钮的触发事件,显示一个文本框
            $("#DataTables-Gauge input:radio").change(function () {
                var id = $(this).attr("id");//得到当前循环的单选钮的id: 0_4、0_5
                var id1 = id.split("_");//id1[1]的值: 4、5
                var name = $(this).attr("name");//得到当前循环的单选钮的name
                $("input:radio[name='" + name + "']").each(function () {
                    var textid = $(this).attr("id");
                    $("#span_" + textid).css("display", "none");
                })
                $("#span_" + id).css("display", "");

                /*     单选钮判断是否依次选中开始        */

                //var name1 = name.split("o"); //radio2_3、radio2_0
                //var name2 = name1[1];//2_3、2_0
                //var name3 = name2.split("_");
                //var name4 = name3[0];//2、2
                //var name5 = name3[1];//3、0
                //var list;
                //if (name5 == 0 && name4 != 0) {
                //    name4 = name4 - 1;
                //    name5 = 4;
                //}
                //for (var i = parseInt(name5) - 1 ; i >= 0; i--) {
                //    for (var i = parseInt(name4) ; i >= 0; i--) {
                //        var num = parseInt(name5) - 1;
                //        var name6 = "radio" + name4 + "_" + num;
                //        list = $('input:radio[name="' + name6 + '"]:checked').val();
                //    }
                //    if (list == null) {
                //        //取消当前选中项
                //        $('input:radio[name="' + name + '"]').attr("checked", false);
                //        //隐藏文本框
                //        if (id1[1] == 1) {//此列是"一过性事件"列
                //            $("#span_" + id).css("display", "none");
                //        }
                //        alert("请依次做题！");
                //    }
                //}

                /*     单选钮判断是否依次选中结束        */

            });
            function OnlyNumber(obj) {
                //得到第一个字符是否为负号  
                var t = obj.value.charAt(0);
                //先把非数字的都替换掉，除了数字和.   
                obj.value = obj.value.replace(/[^\d\.]/g, '');
                //必须保证第一个为数字而不是.     
                obj.value = obj.value.replace(/^\./g, '');
                //保证只有出现一个.而没有多个.     
                obj.value = obj.value.replace(/\.{2,}/g, '.');
                //保证.只出现一次，而不能出现两次以上     
                obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
                //如果第一位是负号，则允许添加  
                if (t == '-') {
                    obj.value = '-' + obj.value;
                }
            }
          

        });
        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
    </script>

    <style>
        .fixedfloat {
            position: fixed;
            /*width: 100%;*/
            margin-top: -183px;
        }
    </style>
    <script type="text/javascript">

        //$('#DataTables-Gauge').bind('mousewheel', function (event, delta) {
        //    alert()
        //});
        $(function () {
            $("#goods_lst").removeClass("fixedfloat");
            var namewidth = $($("table")[2]).find("tr").width();
            $("#goods_lst").css("width", parseInt(namewidth) + 1.5)

        })

        $(document).ready(function () {
            var nav = $("#goods_lst");
            var win = $(window);
            var sc = $(document);
            win.scroll(function () {
                if (sc.scrollTop() >= 183) {
                    $("#goods_lst").addClass("fixedfloat");
                }
                else {
                    $("#goods_lst").removeClass("fixedfloat");

                }
            })
        });

    </script>
    <div id="createtable">
        <input type="hidden" id="hidCountScore" />
        <input type="hidden" id="hidEventType" />
        <input type="hidden" id="hidLevelScore" />
        <input type="hidden" id="hidTimeScore" />
        <input type="hidden" id="hidAllGoodScore" />
        <input type="hidden" id="hidAllBadScore" />
        <input type="hidden" id="hidAllScore" />
    </div>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">心理测验</a></li>
                <li><a href="#" style="color: #666;">生活事件</a></li>
            </ol>
        </div>
    </div>
    <div>
        <div>
            <table>
                <tr>
                    <td colspan="17">指导语：下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事件可能对个人精神上的影响（体验为紧张、压力、兴奋或苦恼等）影响的轻重程度是各不相同的。影响持续的事件也不一样。请您根据自己的情况，实事求是地回答下列问题。</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">

            <div class="table-responsive">


                <%--<table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">--%>

                <div id="goods_lst" style="background-color: #f2f2f2;" class="pro_tab fix fixedfloat">
                    <table border="1" cellpadding="1" cellspacing="1" style="width: 100%; overflow: hidden; line-height: 1.5">
                        <tbody>
                            <tr style="align-content: center;">
                                <td class="text-center" rowspan="2" style="width: 151px;">生活事件名称</td>
                                <td class="text-center" colspan="4">事件发生时间</td>
                                <td class="text-center" colspan="2">性质</td>
                                <td class="text-center" colspan="5">精神影响程度</td>
                                <td class="text-center" colspan="4">影响持续时间</td>
                            </tr>
                            <tr style="align-content: center;">

                                <td class="text-center" style="width: 76.5px;">未发生</td>
                                <td class="text-center" style="width: 126px;">一过性事件</td>
                                <td class="text-center" style="width: 275px;">长期性事件（不到半年）</td>
                                <td class="text-center" style="width: 276px;">长期性事件（超过半年）</td>
                                <td class="text-center" style="width: 51px;">好事</td>
                                <td class="text-center" style="width: 51px;">坏事</td>
                                <td class="text-center" style="width: 76px;">无影响</td>
                                <td class="text-center" style="width: 51px;">轻度</td>
                                <td class="text-center" style="width: 51px;">中度</td>
                                <td class="text-center" style="width: 52px;">重度</td>
                                <td class="text-center" style="width: 52px;">极重</td>
                                <td class="text-center" style="width: 77px;">三月内</td>
                                <td class="text-center" style="width: 77px;">半年内</td>
                                <td class="text-center" style="width: 77px;">一年内</td>
                                <td class="text-center" style="width: 103px;">一年以上</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <table id="DataTables-Gauge" border="1" cellpadding="1" cellspacing="1" style="width: 100%; overflow: hidden; line-height: 1.5;">

                    <%--<thead id="LifeEvent">--%>

                    <%--<tr >
                            <th class="text-center" style="width: 200px;">生活事件名称</th>
                            <th class="text-center" colspan="4">事件发生时间</th>
                            <th class="text-center" colspan="2">性质</th>
                            <th class="text-center" colspan="5">精神影响程度</th>
                            <th class="text-center" colspan="4">影响持续时间</th>
                        </tr>
                        <tr>
                            <td class="text-center"></td>
                            <td class="text-center">未发生</td>
                            <td class="text-center">一过性事件</td>
                            <td class="text-center">长期性事件（不到半年）</td>
                            <td class="text-center">长期性事件（超过半年）</td>
                            <td class="text-center">好事</td>
                            <td class="text-center">坏事</td>
                            <td class="text-center">无影响</td>
                            <td class="text-center">轻度</td>
                            <td class="text-center">中度</td>
                            <td class="text-center">重度</td>
                            <td class="text-center">极重</td>
                            <td class="text-center">三月内</td>
                            <td class="text-center">半年内</td>
                            <td class="text-center">一年内</td>
                            <td class="text-center">一年以上</td>
                        </tr>--%>
                    <tr class="asd">
                        <td style="width: 151px;">家庭有关问题：<br />
                            1、恋爱或订婚</td>
                        <td class="text-center" style="width: 76.5px;">
                            <input type="radio" name="radio0_0" value="0" id="0_0" /></td>
                        <td class="text-center" style="width: 126px;">
                            <input type="radio" name="radio0_0" value="on" id="0_1" />
                            <span id="span_0_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto0_0" id="text_0" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span>
                        </td>
                        <td class="text-center" style="width: 275px;">
                            <input type="radio" name="radio0_0" value="1" id="0_2" /></td>
                        <td class="text-center" style="width: 276px;">
                            <input type="radio" name="radio0_0" value="2" id="0_3" /></td>
                        <td class="text-center" style="width: 51px;">
                            <input type="radio" name="radio0_1" value="0" id="0_4" /></td>
                        <td class="text-center" style="width: 51px;">
                            <input type="radio" name="radio0_1" value="1" id="0_5" /></td>
                        <td class="text-center" style="width: 76px;">
                            <input type="radio" name="radio0_2" value="0" id="0_6" /></td>
                        <td class="text-center" style="width: 51px;">
                            <input type="radio" name="radio0_2" value="1" id="0_7" /></td>
                        <td class="text-center" style="width: 51px;">
                            <input type="radio" name="radio0_2" value="2" id="0_8" /></td>
                        <td class="text-center" style="width: 52px;">
                            <input type="radio" name="radio0_2" value="3" id="0_9" /></td>
                        <td class="text-center" style="width: 52px;">
                            <input type="radio" name="radio0_2" value="4" id="0_10" /></td>
                        <td class="text-center" style="width: 77px;">
                            <input type="radio" name="radio0_3" value="1" id="0_11" /></td>
                        <td class="text-center" style="width: 77px;">
                            <input type="radio" name="radio0_3" value="2" id="0_12" /></td>
                        <td class="text-center" style="width: 77px;">
                            <input type="radio" name="radio0_3" value="3" id="0_13" /></td>
                        <td class="text-center" style="width: 103px;">
                            <input type="radio" name="radio0_3" value="4" id="0_14" /></td>
                    </tr>
                    <tr>
                        <td>2. 恋爱失败、破裂</td>
                        <td class="text-center">
                            <input type="radio" name="radio1_0" value="0" id="1_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_0" id="1_1" />
                            <span id="span_1_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto1_0" id="text_1" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_0" value="1" id="1_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_0" value="2" id="1_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_1" value="0" id="1_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_1" value="1" id="1_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_2" value="0" id="1_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_2" value="1" id="1_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_2" value="2" id="1_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_2" value="3" id="1_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_2" value="4" id="1_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_3" value="1" id="1_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_3" value="2" id="1_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_3" value="3" id="1_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio1_3" value="4" id="1_14" /></td>
                    </tr>
                    <tr>
                        <td>3. 结婚</td>
                        <td class="text-center">
                            <input type="radio" name="radio2_0" value="0" id="2_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_0" id="2_1" />
                            <span id="span_2_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto2_0" id="text_2" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_0" value="1" id="2_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_0" value="2" id="2_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_1" value="0" id="2_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_1" value="1" id="2_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_2" value="0" id="2_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_2" value="1" id="2_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_2" value="2" id="2_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_2" value="3" id="2_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_2" value="4" id="2_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_3" value="1" id="2_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_3" value="2" id="2_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_3" value="3" id="2_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio2_3" value="4" id="2_14" /></td>
                    </tr>
                    <tr>
                        <td>4. 自己（爱人）怀孕</td>
                        <td class="text-center">
                            <input type="radio" name="radio3_0" value="0" id="3_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_0" id="3_1" />
                            <span id="span_3_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto3_0" id="text_3" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_0" value="1" id="3_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_0" value="2" id="3_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_1" value="0" id="3_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_1" value="1" id="3_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_2" value="0" id="3_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_2" value="1" id="3_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_2" value="2" id="3_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_2" value="3" id="3_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_2" value="4" id="3_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_3" value="1" id="3_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_3" value="2" id="3_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_3" value="3" id="3_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio3_3" value="4" id="3_14" /></td>
                    </tr>
                    <tr>
                        <td>5. 自己（爱人）流产</td>
                        <td class="text-center">
                            <input type="radio" name="radio4_0" value="0" id="4_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_0" id="4_1" />
                            <span id="span_4_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto4_0" id="text_4" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_0" value="1" id="4_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_0" value="2" id="4_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_1" value="0" id="4_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_1" value="1" id="4_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_2" value="0" id="4_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_2" value="1" id="4_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_2" value="2" id="4_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_2" value="3" id="4_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_2" value="4" id="4_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_3" value="1" id="4_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_3" value="2" id="4_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_3" value="3" id="4_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio4_3" value="4" id="4_14" /></td>
                    </tr>
                    <tr>
                        <td>6. 家庭增添新成员</td>
                        <td class="text-center">
                            <input type="radio" name="radio5_0" value="0" id="5_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_0" id="5_1" />
                            <span id="span_5_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto5_0" id="text_5" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_0" value="1" id="5_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_0" value="2" id="5_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_1" value="0" id="5_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_1" value="1" id="5_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_2" value="0" id="5_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_2" value="1" id="5_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_2" value="2" id="5_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_2" value="3" id="5_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_2" value="4" id="5_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_3" value="1" id="5_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_3" value="2" id="5_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_3" value="3" id="5_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio5_3" value="4" id="5_14" /></td>
                    </tr>
                    <tr>
                        <td>7. 与爱人父母不和</td>
                        <td class="text-center">
                            <input type="radio" name="radio6_0" value="0" id="6_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_0" id="6_1" />
                            <span id="span_6_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto6_0" id="text_6" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_0" value="1" id="6_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_0" value="2" id="6_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_1" value="0" id="6_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_1" value="1" id="6_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_2" value="0" id="6_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_2" value="1" id="6_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_2" value="2" id="6_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_2" value="3" id="6_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_2" value="4" id="6_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_3" value="1" id="6_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_3" value="2" id="6_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_3" value="3" id="6_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio6_3" value="4" id="6_14" /></td>
                    </tr>
                    <tr>
                        <td>8. 夫妻感情不好</td>
                        <td class="text-center">
                            <input type="radio" name="radio7_0" value="0" id="7_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_0" id="7_1" />
                            <span id="span_7_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto7_0" id="text_7" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_0" value="1" id="7_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_0" value="2" id="7_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_1" value="0" id="7_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_1" value="1" id="7_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_2" value="0" id="7_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_2" value="1" id="7_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_2" value="2" id="7_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_2" value="3" id="7_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_2" value="4" id="7_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_3" value="1" id="7_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_3" value="2" id="7_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_3" value="3" id="7_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio7_3" value="4" id="7_14" /></td>
                    </tr>
                    <tr>
                        <td>9. 夫妻分居（因不和）</td>
                        <td class="text-center">
                            <input type="radio" name="radio8_0" value="0" id="8_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_0" id="8_1" />
                            <span id="span_8_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto8_0" id="text_8" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_0" value="1" id="8_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_0" value="2" id="8_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_1" value="0" id="8_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_1" value="1" id="8_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_2" value="0" id="8_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_2" value="1" id="8_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_2" value="2" id="8_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_2" value="3" id="8_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_2" value="4" id="8_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_3" value="1" id="8_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_3" value="2" id="8_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_3" value="3" id="8_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio8_3" value="4" id="8_14" /></td>
                    </tr>
                    <tr>
                        <td>10. 夫妻两地分居（工作需要）</td>
                        <td class="text-center">
                            <input type="radio" name="radio9_0" value="0" id="9_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_0" id="9_1" />
                            <span id="span_9_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto9_0" id="text_9" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_0" value="1" id="9_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_0" value="2" id="9_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_1" value="0" id="9_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_1" value="1" id="9_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_2" value="0" id="9_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_2" value="1" id="9_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_2" value="2" id="9_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_2" value="3" id="9_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_2" value="4" id="9_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_3" value="1" id="9_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_3" value="2" id="9_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_3" value="3" id="9_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio9_3" value="4" id="9_14" /></td>
                    </tr>
                    <tr>
                        <td>11. 性生活不满意或独身</td>
                        <td class="text-center">
                            <input type="radio" name="radio10_0" value="0" id="10_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_0" id="10_1" />
                            <span id="span_10_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto10_0" id="text_10" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_0" value="1" id="10_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_0" value="2" id="10_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_1" value="0" id="10_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_1" value="1" id="10_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_2" value="0" id="10_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_2" value="1" id="10_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_2" value="2" id="10_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_2" value="3" id="10_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_2" value="4" id="10_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_3" value="1" id="10_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_3" value="2" id="10_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_3" value="3" id="10_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio10_3" value="4" id="10_14" /></td>
                    </tr>
                    <tr>
                        <td>12. 配偶一方有外遇</td>
                        <td class="text-center">
                            <input type="radio" name="radio11_0" value="0" id="11_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_0" id="11_1" />
                            <span id="span_11_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto11_0" id="text_11" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_0" value="1" id="11_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_0" value="2" id="11_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_1" value="0" id="11_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_1" value="1" id="11_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_2" value="0" id="11_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_2" value="1" id="11_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_2" value="2" id="11_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_2" value="3" id="11_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_2" value="4" id="11_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_3" value="1" id="11_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_3" value="2" id="11_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_3" value="3" id="11_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio11_3" value="4" id="11_14" /></td>
                    </tr>
                    <tr>
                        <td>13. 夫妻重归于好</td>
                        <td class="text-center">
                            <input type="radio" name="radio12_0" value="0" id="12_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_0" id="12_1" />
                            <span id="span_12_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto12_0" id="text_12" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_0" value="1" id="12_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_0" value="2" id="12_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_1" value="0" id="12_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_1" value="1" id="12_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_2" value="0" id="12_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_2" value="1" id="12_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_2" value="2" id="12_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_2" value="3" id="12_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_2" value="4" id="12_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_3" value="1" id="12_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_3" value="2" id="12_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_3" value="3" id="12_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio12_3" value="4" id="12_14" /></td>
                    </tr>
                    <tr>
                        <td>14. 超指标生育</td>
                        <td class="text-center">
                            <input type="radio" name="radio13_0" value="0" id="13_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_0" id="13_1" />
                            <span id="span_13_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto13_0" id="text_13" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_0" value="1" id="13_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_0" value="2" id="13_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_1" value="0" id="13_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_1" value="1" id="13_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_2" value="0" id="13_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_2" value="1" id="13_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_2" value="2" id="13_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_2" value="3" id="13_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_2" value="4" id="13_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_3" value="1" id="13_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_3" value="2" id="13_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_3" value="3" id="13_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio13_3" value="4" id="13_14" /></td>
                    </tr>
                    <tr>
                        <td>15. 本人（爱人）做绝育手术</td>
                        <td class="text-center">
                            <input type="radio" name="radio14_0" value="0" id="14_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_0" id="14_1" />
                            <span id="span_14_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto14_0" id="text_14" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_0" value="1" id="14_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_0" value="2" id="14_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_1" value="0" id="14_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_1" value="1" id="14_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_2" value="0" id="14_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_2" value="1" id="14_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_2" value="2" id="14_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_2" value="3" id="14_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_2" value="4" id="14_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_3" value="1" id="14_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_3" value="2" id="14_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_3" value="3" id="14_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio14_3" value="4" id="14_14" /></td>
                    </tr>
                    <tr>
                        <td>16. 配偶死亡</td>
                        <td class="text-center">
                            <input type="radio" name="radio15_0" value="0" id="15_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_0" id="15_1" />
                            <span id="span_15_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto15_0" id="text_15" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_0" value="1" id="15_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_0" value="2" id="15_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_1" value="0" id="15_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_1" value="1" id="15_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_2" value="0" id="15_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_2" value="1" id="15_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_2" value="2" id="15_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_2" value="3" id="15_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_2" value="4" id="15_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_3" value="1" id="15_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_3" value="2" id="15_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_3" value="3" id="15_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio15_3" value="4" id="15_14" /></td>
                    </tr>
                    <tr>
                        <td>17. 离婚</td>
                        <td class="text-center">
                            <input type="radio" name="radio16_0" value="0" id="16_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_0" id="16_1" />
                            <span id="span_16_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto16_0" id="text_16" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_0" value="1" id="16_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_0" value="2" id="16_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_1" value="0" id="16_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_1" value="1" id="16_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_2" value="0" id="16_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_2" value="1" id="16_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_2" value="2" id="16_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_2" value="3" id="16_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_2" value="4" id="16_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_3" value="1" id="16_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_3" value="2" id="16_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_3" value="3" id="16_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio16_3" value="4" id="16_14" /></td>
                    </tr>
                    <tr>
                        <td>18. 子女升学（就业）失败</td>
                        <td class="text-center">
                            <input type="radio" name="radio17_0" value="0" id="17_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_0" id="17_1" />
                            <span id="span_17_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto17_0" id="text_17" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_0" value="1" id="17_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_0" value="2" id="17_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_1" value="0" id="17_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_1" value="1" id="17_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_2" value="0" id="17_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_2" value="1" id="17_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_2" value="2" id="17_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_2" value="3" id="17_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_2" value="4" id="17_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_3" value="1" id="17_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_3" value="2" id="17_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_3" value="3" id="17_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio17_3" value="4" id="17_14" /></td>
                    </tr>
                    <tr>
                        <td>19. 子女管教困难</td>
                        <td class="text-center">
                            <input type="radio" name="radio18_0" value="0" id="18_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_0" id="18_1" />
                            <span id="span_18_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto18_0" id="text_18" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_0" value="1" id="18_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_0" value="2" id="18_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_1" value="0" id="18_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_1" value="1" id="18_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_2" value="0" id="18_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_2" value="1" id="18_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_2" value="2" id="18_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_2" value="3" id="18_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_2" value="4" id="18_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_3" value="1" id="18_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_3" value="2" id="18_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_3" value="3" id="18_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio18_3" value="4" id="18_14" /></td>
                    </tr>
                    <tr>
                        <td>20. 子女长期离家</td>
                        <td class="text-center">
                            <input type="radio" name="radio19_0" value="0" id="19_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_0" id="19_1" />
                            <span id="span_19_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto19_0" id="text_19" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_0" value="1" id="19_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_0" value="2" id="19_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_1" value="0" id="19_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_1" value="1" id="19_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_2" value="0" id="19_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_2" value="1" id="19_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_2" value="2" id="19_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_2" value="3" id="19_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_2" value="4" id="19_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_3" value="1" id="19_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_3" value="2" id="19_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_3" value="3" id="19_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio19_3" value="4" id="19_14" /></td>
                    </tr>
                    <tr>
                        <td>21. 父母不和</td>
                        <td class="text-center">
                            <input type="radio" name="radio20_0" value="0" id="20_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_0" id="20_1" />
                            <span id="span_20_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto20_0" id="text_20" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_0" value="1" id="20_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_0" value="2" id="20_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_1" value="0" id="20_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_1" value="1" id="20_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_2" value="0" id="20_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_2" value="1" id="20_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_2" value="2" id="20_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_2" value="3" id="20_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_2" value="4" id="20_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_3" value="1" id="20_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_3" value="2" id="20_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_3" value="3" id="20_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio20_3" value="4" id="20_14" /></td>
                    </tr>
                    <tr>
                        <td>22. 家庭经济困难</td>
                        <td class="text-center">
                            <input type="radio" name="radio21_0" value="0" id="21_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_0" id="21_1" />
                            <span id="span_21_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto21_0" id="text_21" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_0" value="1" id="21_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_0" value="2" id="21_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_1" value="0" id="21_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_1" value="1" id="21_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_2" value="0" id="21_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_2" value="1" id="21_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_2" value="2" id="21_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_2" value="3" id="21_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_2" value="4" id="21_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_3" value="1" id="21_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_3" value="2" id="21_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_3" value="3" id="21_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio21_3" value="4" id="21_14" /></td>
                    </tr>
                    <tr>
                        <td>23. 欠债500元以上</td>
                        <td class="text-center">
                            <input type="radio" name="radio22_0" value="0" id="22_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_0" id="22_1" />
                            <span id="span_22_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto22_0" id="text_22" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_0" value="1" id="22_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_0" value="2" id="22_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_1" value="0" id="22_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_1" value="1" id="22_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_2" value="0" id="22_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_2" value="1" id="22_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_2" value="2" id="22_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_2" value="3" id="22_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_2" value="4" id="22_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_3" value="1" id="22_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_3" value="2" id="22_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_3" value="3" id="22_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio22_3" value="4" id="22_14" /></td>
                    </tr>
                    <tr>
                        <td>24. 经济情况显著改善</td>
                        <td class="text-center">
                            <input type="radio" name="radio23_0" value="0" id="23_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_0" id="23_1" />
                            <span id="span_23_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto23_0" id="text_23" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_0" value="1" id="23_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_0" value="2" id="23_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_1" value="0" id="23_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_1" value="1" id="23_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_2" value="0" id="23_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_2" value="1" id="23_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_2" value="2" id="23_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_2" value="3" id="23_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_2" value="4" id="23_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_3" value="1" id="23_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_3" value="2" id="23_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_3" value="3" id="23_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio23_3" value="4" id="23_14" /></td>
                    </tr>
                    <tr>
                        <td>25. 家庭成员重病、重伤</td>
                        <td class="text-center">
                            <input type="radio" name="radio24_0" value="0" id="24_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_0" id="24_1" />
                            <span id="span_24_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto24_0" id="text_24" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_0" value="1" id="24_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_0" value="2" id="24_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_1" value="0" id="24_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_1" value="1" id="24_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_2" value="0" id="24_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_2" value="1" id="24_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_2" value="2" id="24_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_2" value="3" id="24_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_2" value="4" id="24_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_3" value="1" id="24_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_3" value="2" id="24_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_3" value="3" id="24_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio24_3" value="4" id="24_14" /></td>
                    </tr>
                    <tr>
                        <td>26. 家庭成员死亡</td>
                        <td class="text-center">
                            <input type="radio" name="radio25_0" value="0" id="25_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_0" id="25_1" />
                            <span id="span_25_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto25_0" id="text_25" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_0" value="1" id="25_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_0" value="2" id="25_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_1" value="0" id="25_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_1" value="1" id="25_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_2" value="0" id="25_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_2" value="1" id="25_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_2" value="2" id="25_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_2" value="3" id="25_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_2" value="4" id="25_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_3" value="1" id="25_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_3" value="2" id="25_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_3" value="3" id="25_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio25_3" value="4" id="25_14" /></td>
                    </tr>
                    <tr>
                        <td>27. 本人重病或重伤</td>
                        <td class="text-center">
                            <input type="radio" name="radio26_0" value="0" id="26_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_0" id="26_1" />
                            <span id="span_26_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto26_0" id="text_26" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_0" value="1" id="26_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_0" value="2" id="26_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_1" value="0" id="26_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_1" value="1" id="26_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_2" value="0" id="26_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_2" value="1" id="26_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_2" value="2" id="26_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_2" value="3" id="26_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_2" value="4" id="26_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_3" value="1" id="26_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_3" value="2" id="26_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_3" value="3" id="26_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio26_3" value="4" id="26_14" /></td>
                    </tr>
                    <tr>
                        <td>28. 住房紧张</td>
                        <td class="text-center">
                            <input type="radio" name="radio27_0" value="0" id="27_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_0" id="27_1" />
                            <span id="span_27_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto27_0" id="text_27" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_0" value="1" id="27_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_0" value="2" id="27_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_1" value="0" id="27_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_1" value="1" id="27_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_2" value="0" id="27_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_2" value="1" id="27_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_2" value="2" id="27_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_2" value="3" id="27_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_2" value="4" id="27_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_3" value="1" id="27_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_3" value="2" id="27_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_3" value="3" id="27_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio27_3" value="4" id="27_14" /></td>
                    </tr>
                    <tr>
                        <td>工作学习中的问题<br />
                            29. 待业、无业</td>
                        <td class="text-center">
                            <input type="radio" name="radio28_0" value="0" id="28_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_0" id="28_1" />
                            <span id="span_28_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto28_0" id="text_28" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_0" value="1" id="28_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_0" value="2" id="28_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_1" value="0" id="28_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_1" value="1" id="28_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_2" value="0" id="28_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_2" value="1" id="28_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_2" value="2" id="28_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_2" value="3" id="28_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_2" value="4" id="28_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_3" value="1" id="28_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_3" value="2" id="28_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_3" value="3" id="28_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio28_3" value="4" id="28_14" /></td>
                    </tr>
                    <tr>
                        <td>30. 开始就业</td>
                        <td class="text-center">
                            <input type="radio" name="radio29_0" value="0" id="29_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_0" id="29_1" />
                            <span id="span_29_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto29_0" id="text_29" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_0" value="1" id="29_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_0" value="2" id="29_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_1" value="0" id="29_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_1" value="1" id="29_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_2" value="0" id="29_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_2" value="1" id="29_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_2" value="2" id="29_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_2" value="3" id="29_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_2" value="4" id="29_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_3" value="1" id="29_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_3" value="2" id="29_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_3" value="3" id="29_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio29_3" value="4" id="29_14" /></td>
                    </tr>
                    <tr>
                        <td>31. 高考失败</td>
                        <td class="text-center">
                            <input type="radio" name="radio30_0" value="0" id="30_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_0" id="30_1" />
                            <span id="span_30_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto30_0" id="text_30" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_0" value="1" id="30_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_0" value="2" id="30_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_1" value="0" id="30_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_1" value="1" id="30_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_2" value="0" id="30_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_2" value="1" id="30_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_2" value="2" id="30_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_2" value="3" id="30_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_2" value="4" id="30_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_3" value="1" id="30_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_3" value="2" id="30_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_3" value="3" id="30_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio30_3" value="4" id="30_14" /></td>
                    </tr>
                    <tr>
                        <td>32. 扣发奖金或罚款</td>
                        <td class="text-center">
                            <input type="radio" name="radio31_0" value="0" id="31_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_0" id="31_1" />
                            <span id="span_31_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto31_0" id="text_31" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_0" value="1" id="31_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_0" value="2" id="31_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_1" value="0" id="31_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_1" value="1" id="31_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_2" value="0" id="31_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_2" value="1" id="31_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_2" value="2" id="31_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_2" value="3" id="31_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_2" value="4" id="31_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_3" value="1" id="31_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_3" value="2" id="31_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_3" value="3" id="31_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio31_3" value="4" id="31_14" /></td>
                    </tr>
                    <tr>
                        <td>33. 突出的个人成就</td>
                        <td class="text-center">
                            <input type="radio" name="radio32_0" value="0" id="32_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_0" id="32_1" />
                            <span id="span_32_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto32_0" id="text_32" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_0" value="1" id="32_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_0" value="2" id="32_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_1" value="0" id="32_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_1" value="1" id="32_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_2" value="0" id="32_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_2" value="1" id="32_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_2" value="2" id="32_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_2" value="3" id="32_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_2" value="4" id="32_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_3" value="1" id="32_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_3" value="2" id="32_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_3" value="3" id="32_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio32_3" value="4" id="32_14" /></td>
                    </tr>
                    <tr>
                        <td>34. 晋升、提级</td>
                        <td class="text-center">
                            <input type="radio" name="radio33_0" value="0" id="33_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_0" id="33_1" />
                            <span id="span_33_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto33_0" id="text_33" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_0" value="1" id="33_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_0" value="2" id="33_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_1" value="0" id="33_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_1" value="1" id="33_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_2" value="0" id="33_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_2" value="1" id="33_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_2" value="2" id="33_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_2" value="3" id="33_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_2" value="4" id="33_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_3" value="1" id="33_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_3" value="2" id="33_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_3" value="3" id="33_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio33_3" value="4" id="33_14" /></td>
                    </tr>
                    <tr>
                        <td>35. 对现职工作不满意</td>
                        <td class="text-center">
                            <input type="radio" name="radio34_0" value="0" id="34_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_0" id="34_1" />
                            <span id="span_34_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto34_0" id="text_34" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_0" value="1" id="34_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_0" value="2" id="34_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_1" value="0" id="34_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_1" value="1" id="34_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_2" value="0" id="34_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_2" value="1" id="34_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_2" value="2" id="34_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_2" value="3" id="34_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_2" value="4" id="34_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_3" value="1" id="34_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_3" value="2" id="34_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_3" value="3" id="34_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio34_3" value="4" id="34_14" /></td>
                    </tr>
                    <tr>
                        <td>36. 工作学习中压力大<br />
                            （如成绩不好）</td>
                        <td class="text-center">
                            <input type="radio" name="radio35_0" value="0" id="35_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_0" id="35_1" />
                            <span id="span_35_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto35_0" id="text_35" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_0" value="1" id="35_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_0" value="2" id="35_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_1" value="0" id="35_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_1" value="1" id="35_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_2" value="0" id="35_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_2" value="1" id="35_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_2" value="2" id="35_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_2" value="3" id="35_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_2" value="4" id="35_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_3" value="1" id="35_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_3" value="2" id="35_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_3" value="3" id="35_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio35_3" value="4" id="35_14" /></td>
                    </tr>
                    <tr>
                        <td>37. 与上级关系紧张</td>
                        <td class="text-center">
                            <input type="radio" name="radio36_0" value="0" id="36_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_0" id="36_1" />
                            <span id="span_36_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto36_0" id="text_36" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_0" value="1" id="36_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_0" value="2" id="36_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_1" value="0" id="36_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_1" value="1" id="36_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_2" value="0" id="36_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_2" value="1" id="36_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_2" value="2" id="36_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_2" value="3" id="36_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_2" value="4" id="36_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_3" value="1" id="36_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_3" value="2" id="36_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_3" value="3" id="36_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio36_3" value="4" id="36_14" /></td>
                    </tr>
                    <tr>
                        <td>38. 与同事邻居不和</td>
                        <td class="text-center">
                            <input type="radio" name="radio37_0" value="0" id="37_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_0" id="37_1" />
                            <span id="span_37_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto37_0" id="text_37" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_0" value="1" id="37_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_0" value="2" id="37_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_1" value="0" id="37_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_1" value="1" id="37_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_2" value="0" id="37_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_2" value="1" id="37_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_2" value="2" id="37_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_2" value="3" id="37_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_2" value="4" id="37_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_3" value="1" id="37_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_3" value="2" id="37_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_3" value="3" id="37_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio37_3" value="4" id="37_14" /></td>
                    </tr>
                    <tr>
                        <td>39. 第一次远走他乡异国</td>
                        <td class="text-center">
                            <input type="radio" name="radio38_0" value="0" id="38_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_0" id="38_1" />
                            <span id="span_38_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto38_0" id="text_38" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_0" value="1" id="38_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_0" value="2" id="38_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_1" value="0" id="38_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_1" value="1" id="38_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_2" value="0" id="38_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_2" value="1" id="38_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_2" value="2" id="38_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_2" value="3" id="38_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_2" value="4" id="38_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_3" value="1" id="38_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_3" value="2" id="38_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_3" value="3" id="38_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio38_3" value="4" id="38_14" /></td>
                    </tr>
                    <tr>
                        <td>40. 生活规律重大变动<br />
                            （饮食睡眠规律改变）</td>
                        <td class="text-center">
                            <input type="radio" name="radio39_0" value="0" id="39_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_0" id="39_1" />
                            <span id="span_39_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto39_0" id="text_39" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_0" value="1" id="39_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_0" value="2" id="39_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_1" value="0" id="39_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_1" value="1" id="39_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_2" value="0" id="39_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_2" value="1" id="39_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_2" value="2" id="39_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_2" value="3" id="39_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_2" value="4" id="39_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_3" value="1" id="39_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_3" value="2" id="39_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_3" value="3" id="39_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio39_3" value="4" id="39_14" /></td>
                    </tr>
                    <tr>
                        <td>41. 本人退休离休或未<br />
                            安排具体工作</td>
                        <td class="text-center">
                            <input type="radio" name="radio40_0" value="0" id="40_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_0" id="40_1" />
                            <span id="span_40_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto40_0" id="text_40" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_0" value="1" id="40_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_0" value="2" id="40_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_1" value="0" id="40_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_1" value="1" id="40_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_2" value="0" id="40_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_2" value="1" id="40_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_2" value="2" id="40_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_2" value="3" id="40_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_2" value="4" id="40_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_3" value="1" id="40_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_3" value="2" id="40_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_3" value="3" id="40_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio40_3" value="4" id="40_14" /></td>
                    </tr>
                    <tr>
                        <td>社交与其他问题<br />
                            42. 好友重病或重伤</td>
                        <td class="text-center">
                            <input type="radio" name="radio41_0" value="0" id="41_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_0" id="41_1" />
                            <span id="span_41_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto41_0" id="text_41" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_0" value="1" id="41_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_0" value="2" id="41_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_1" value="0" id="41_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_1" value="1" id="41_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_2" value="0" id="41_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_2" value="1" id="41_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_2" value="2" id="41_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_2" value="3" id="41_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_2" value="4" id="41_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_3" value="1" id="41_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_3" value="2" id="41_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_3" value="3" id="41_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio41_3" value="4" id="41_14" /></td>
                    </tr>
                    <tr>
                        <td>43. 好友死亡</td>
                        <td class="text-center">
                            <input type="radio" name="radio42_0" value="0" id="42_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_0" id="42_1" />
                            <span id="span_42_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto42_0" id="text_42" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_0" value="1" id="42_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_0" value="2" id="42_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_1" value="0" id="42_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_1" value="1" id="42_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_2" value="0" id="42_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_2" value="1" id="42_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_2" value="2" id="42_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_2" value="3" id="42_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_2" value="4" id="42_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_3" value="1" id="42_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_3" value="2" id="42_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_3" value="3" id="42_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio42_3" value="4" id="42_14" /></td>
                    </tr>
                    <tr>
                        <td>44. 被人误会、错怪、诬<br />
                            告、议论</td>
                        <td class="text-center">
                            <input type="radio" name="radio43_0" value="0" id="43_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_0" id="43_1" />
                            <span id="span_43_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto43_0" id="text_43" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_0" value="1" id="43_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_0" value="2" id="43_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_1" value="0" id="43_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_1" value="1" id="43_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_2" value="0" id="43_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_2" value="1" id="43_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_2" value="2" id="43_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_2" value="3" id="43_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_2" value="4" id="43_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_3" value="1" id="43_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_3" value="2" id="43_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_3" value="3" id="43_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio43_3" value="4" id="43_14" /></td>
                    </tr>
                    <tr>
                        <td>45. 介入民事法律纠纷</td>
                        <td class="text-center">
                            <input type="radio" name="radio44_0" value="0" id="44_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_0" id="44_1" />
                            <span id="span_44_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto44_0" id="text_44" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_0" value="1" id="44_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_0" value="2" id="44_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_1" value="0" id="44_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_1" value="1" id="44_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_2" value="0" id="44_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_2" value="1" id="44_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_2" value="2" id="44_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_2" value="3" id="44_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_2" value="4" id="44_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_3" value="1" id="44_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_3" value="2" id="44_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_3" value="3" id="44_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio44_3" value="4" id="44_14" /></td>
                    </tr>
                    <tr>
                        <td>46. 被拘留受审</td>
                        <td class="text-center">
                            <input type="radio" name="radio45_0" value="0" id="45_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_0" id="45_1" />
                            <span id="span_45_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto45_0" id="text_45" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_0" value="1" id="45_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_0" value="2" id="45_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_1" value="0" id="45_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_1" value="1" id="45_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_2" value="0" id="45_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_2" value="1" id="45_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_2" value="2" id="45_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_2" value="3" id="45_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_2" value="4" id="45_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_3" value="1" id="45_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_3" value="2" id="45_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_3" value="3" id="45_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio45_3" value="4" id="45_14" /></td>
                    </tr>
                    <tr>
                        <td>47. 失窃、财产损失</td>
                        <td class="text-center">
                            <input type="radio" name="radio46_0" value="0" id="46_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_0" id="46_1" />
                            <span id="span_46_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto46_0" id="text_46" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_0" value="1" id="46_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_0" value="2" id="46_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_1" value="0" id="46_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_1" value="1" id="46_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_2" value="0" id="46_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_2" value="1" id="46_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_2" value="2" id="46_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_2" value="3" id="46_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_2" value="4" id="46_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_3" value="1" id="46_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_3" value="2" id="46_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_3" value="3" id="46_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio46_3" value="4" id="46_14" /></td>
                    </tr>
                    <tr>
                        <td>48. 意外惊恐、发生事<br />
                            故、自然灾害</td>
                        <td class="text-center">
                            <input type="radio" name="radio47_0" value="0" id="47_0" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_0" id="47_1" />
                            <span id="span_47_1" style="display: none;">
                                <input type="text" onkeypress="onlyNumber(this)" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="texto47_0" id="text_47" style="width: 60px;" />
                                次<br />
                                <span style="color: #808080; font-size: 6px;">请输入正整数</span>
                            </span></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_0" value="1" id="47_2" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_0" value="2" id="47_3" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_1" value="0" id="47_4" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_1" value="1" id="47_5" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_2" value="0" id="47_6" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_2" value="1" id="47_7" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_2" value="2" id="47_8" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_2" value="3" id="47_9" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_2" value="4" id="47_10" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_3" value="1" id="47_11" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_3" value="2" id="47_12" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_3" value="3" id="47_13" /></td>
                        <td class="text-center">
                            <input type="radio" name="radio47_3" value="4" id="47_14" /></td>
                    </tr>
                    <%-- </thead>--%>
                    <tbody></tbody>
                </table>

            </div>

            <div class="text-center">
                <input type="button" id="btnAdd" class="text-center" onclick="TiJiao();" value="交卷" />
            </div>

        </div>
    </div>

    <div id="createrow"></div>
    <div id="DivDialog" style="display: none;">
        <table style="width: 100%; height: 100%">
            <tr>
                <td align="center">
                    <span id="spanDia"></span>
                    <label id="lblDia"></label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

