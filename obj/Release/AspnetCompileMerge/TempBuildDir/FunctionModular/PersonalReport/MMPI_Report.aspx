<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MMPI_Report.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.MMPI_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
     <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <style>
        .obj {
            /*width: 98%;*/
            margin-top: 50px;
            margin-left: 15%;
            margin-right: 15%;
            margin-bottom: 50px;
            background: #fff;
            color: #333;
        }


        .box-shadow {
            /*//Firefox4.0-*/
            -moz-box-shadow: 3px 3px 3px;
            /*//Safariand Google chrome10.0-*/
            -webkit-box-shadow: 3px 3px 3px;
            /*//Firefox4.0+、 Google chrome 10.0+ 、 Oprea10.5+ and IE9*/
            box-shadow: 3px 3px 3px;
        }
    </style>


    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">MMPI个体报告</a></li>
            </ol>

        </div>
    </div>


    <div class="row" id="StatisticsDiv" style="background-color: #eee;">
        <%--<div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
            <button class="btn btn-primary btn-sm" onclick="javascript:window.close();" style="margin-left: 10px; float: right;" data-id="54">关闭</button>
        </div>--%>
        <div class="obj box-shadow " id="Print">

            <div id="BG_Title" style="padding-top: 100px; margin-left: 7%; margin-right: 7%">
                <h1 align="center" id="TJ_Title">《明尼苏达多相个性测查表(MMPI)》测评报告 </h1>
                <p align="center" id="BG_Data">(报告制作时间：2016-12-20)</p>
                <br />
                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; width: 98%;">
                    <tr style="height: 30px;">
                        <td><strong id="U_Name">姓名:</strong></td>
                        <td><strong id="U_Sex">性别:</strong></td>
                        <td><strong id="AN_Code">编号:</strong></td>
                    </tr>
                    <tr style="height: 30px;">
                        <td><strong id="U_B">出生年月:</strong></td>
                        <td colspan="2"><strong id="U_OD">完成日期:</strong></td>

                    </tr>

                </table>
            </div>


            <div id="BG_Describe" style="padding-top: 20px; margin-left: 7%; margin-right: 7%;">
                <p><strong>一. 测验简介： </strong></p>
                <p>&nbsp;&nbsp;&nbsp;&nbsp;明尼苏达多相个性测查表（MMPI)是目前世界上使用范围最广和使用频率最高的人格与临床心理学测验之一，由美国明尼苏达大学教授哈撒韦与麦金利于20世纪40年代初期编制。虽然Hathaway和McKinley(1940)原来编制MMPI的目的是为了帮助医生对精神疾病进行全面客观地检查和分类，但是它并不仅仅应用于精神科临床和研究工作，也广泛用于其他医学各科以及人类行为的研究、司法审判、犯罪调查、教育和职业选择等领域。本版本为简版MMPI，共399题，包含10个临床量表和4个效度量表。分别考察了人格的不同方面。分数越高，表明在此项上的症状越严重</p>
            </div>


            <div id="BG_Difference" style="padding-top: 20px; margin-left: 7%; margin-right: 7%;">
                <p><strong>二. 测试结果： </strong></p>
                <div id="container">
                </div>
                 <div class="row" style="text-align: center; width: 100%; display: none" id="ContainerImage">                     
                        <img id="imagescr" width="600px" height="400px" />
                    </div>

            </div>


            <div id="BG_Conclusion"  style="padding-top: 20px;  padding-bottom: 100px; margin-left: 7%; margin-right: 7%;">
                <p><strong>三. 分析与建议： </strong></p>
                <div id="ResultHTML">
                    <p style="color: red; margin-left: 5px; margin-top: 20px;"><strong>XXX维度 </strong></p>
                    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; width: 98%;">
                        <tr>
                            <td>量表标准分：</td>
                            <td>原始分：</td>
                            <td>状态：</td>
                        </tr>
                        <tr>
                            <td colspan="3"><strong>【结果分析】</strong><br />
                            </td>

                        </tr>
                        <tr>
                            <td colspan="3"><strong>【心理建议】</strong><br />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
          <div class="row" style="text-align: center; margin-bottom: 10px;">
            <button type="button" class="btn btn-sm" style="background-color: orange; color: white" id="export">
                导出
            </button>&nbsp;&nbsp;
            <button type="button" id="ExitsID" class="btn btn-sm" style="color: white" onclick="Exits()">返回</button>
        </div>
    </div>
    <%--<div id="ResultHTMLJson">
    </div>

    <div id="ResultHTMLJsonAA">
    </div>--%>
   <%-- <script src="../../JS/Highcharts/highcharts.js"></script>
    <script src="../../JS/Highcharts/theme/grid-light.js"></script>--%>
     <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
   
    <script src="../../JS/Highcharts/highcharts-zh_CN.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/Highcharts/theme/grid-light.js"></script>
    <script>
        var navName = "";
        MMPI();
        function MMPI() {
            var myDate = new Date();
            $("#BG_Data").empty();
            $("#BG_Data").html("报告制作时间:" + myDate.toLocaleDateString());
        }
        var Types = getUrlParam("type");
        var AmountTypes = getUrlParam("AmountType");
        if (Types == 1 && AmountTypes == 1) {
            navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
            $("#recovery").hide();
        } else if (Types == 3) {
            navName = '/FunctionModular/Warning/CrisisWarning.aspx';
            $("#recovery").hide();
        }
        else {
            navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
            $("#recovery").show();
        }
        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
    </script>



    <script type="text/javascript">
        var Request = new Object();
        Request = GetRequest();


        /*获取浏览器网址参数*/
        function GetRequest() {
            var url = location.search; //获取url中"?"符后的字串
            var theRequest = new Object();
            if (url.indexOf("?") != -1) {
                var str = url.substr(1);
                strs = str.split("&");
                for (var i = 0; i < strs.length; i++) {
                    theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
                }
            }
            return theRequest;
        }


        function OnloadChar(NameJsonStr, vl) {
            var nameJson = eval(NameJsonStr);
            var valueJson = eval(vl);
            var chart;
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',          //放置图表的容器  
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    zoomType: 'xy' //支持图表放大缩小的范围  
                },
                title: {
                    text: 'MMPI剖面图'
                },
                subtitle: {
                    text: '明尼苏达多相个性测查表(MMPI)'
                },
                xAxis: [{
                    categories: nameJson,
                    labels: {
                        rotation: -50, //字体倾斜  
                        align: 'right',
                        style: { font: 'normal 13px 宋体' }
                    },
                    lineWidth: 1,//纵轴一直为空所对应的轴，即X轴  
                    plotLines: [{//一条竖线  
                        color: '#FF0000',
                        width: 2,
                        value: 4
                    }],
                    gridLineDashStyle: 'ShortDash',//横向网格线样式
                    //,
                    //opposite: true
                }
                ],
                yAxis: [{ // Primary yAxis  
                    title: {
                        text: ' ',
                        style: {
                            color: '#89A54E'
                        }
                    },
                    labels: {
                        format: '{value} ',//格式化Y轴刻度  
                        style: {
                            color: '#89A54E'
                        }
                    },
                    lineWidth: 1,//纵轴一直为空所对应的轴，即X轴 
                    plotLines: [{//一条竖线  
                        color: '#FF0000',
                        width: 2,
                        value: 40
                    },
                    {//一条竖线  
                        color: '#FF0000',
                        width: 2,
                        value: 60
                    }],
                    max: 150
                }, { // Secondary yAxis  
                    title: {
                        text: ' ',
                        style: {
                            color: '#4572A7'
                        }
                    },
                    labels: {
                        format: '{value} ',
                        style: {
                            color: '#4572A7'
                        }
                    },
                    opposite: true
                    ,
                    max: 150
                }],
                tooltip: {
                    shared: true, //公用一个提示框  
                    formatter: function () {
                        return this.x + "<br>"
                           + "<span style='color:#4572A7'>维度分数：" + this.points[0].y + "</span><br>"
                        // + "<span style='color:#89A54E'>成功率：" + this.points[1].y + " %</span>"
                        ;
                    }
                },
                //图例样式设置  
                legend: {
                    layout: 'vertical',
                    align: 'left',
                    x: 0,
                    verticalAlign: 'top',
                    y: 0,
                    floating: true,
                    backgroundColor: '#FFFFFF'
                },
                series: [{
                    name: ' ',
                    color: '#FFF',
                    //type: 'spline',
                    yAxis: 1,
                    data: valueJson,
                    tooltip: {
                        formatter: function () {
                            return this.y;
                        }
                    }

                }, {
                    name: '维度得分',
                    color: '#4572A7',
                    //type: 'spline',
                    legendIndex: 2,
                    yAxis: 0,
                    data: valueJson,
                    tooltip: {
                        formatter: function () {
                            return this.y;
                        }
                    }
                }]
            });
        }
        var filename = "";
        GetMMPIResult();
        /*返回测评结果*/
        function GetMMPIResult() {

            $.ajax({
                type: "POST",
                url: "Ajax/MMPI_Report.ashx",
                data: {
                    Remark: "GetResult",
                    A_ID: Request["A_ID"]
                },//要执行查询的数据参数
                success: function (msg) {
                    //$("#ResultHTMLJson").html(msg);
                    if (msg != "NOTHING") {
                        $("#ResultHTML").empty();
                        var WD_NameList = "";
                        var WD_ValueList = "";
                        var MMPI = eval(msg);
                        if (MMPI != null && MMPI.length > 0) {
                            filename = "明尼苏达多相个性测查表(MMPI)" + "-" + MMPI[0].UserInfo.Uname;
                            $("#U_Name").html("姓名:" + MMPI[0].UserInfo.Uname);
                            $("#U_Sex").html("性别:" + MMPI[0].UserInfo.Usex);
                            $("#AN_Code").html("编号:" + MMPI[0].UserInfo.Anscode);
                            $("#U_B").html("出生年月:" + MMPI[0].UserInfo.Birthday);
                            $("#U_OD").html("完成日期:" + MMPI[0].UserInfo.AnswerDate1);


                            for (var index = 0; index < MMPI.length; index++) {
                                var resuHTML = "";
                                resuHTML += "";

                                var k = new change("" + parseInt(index + 1) + "");
                                //  alert(k.pri_ary());
                                if (WD_NameList != "") {
                                    if (index == 4) {
                                        WD_NameList += ",'','" + MMPI[index].WD_Name + "'";
                                    } else {
                                        WD_NameList += ",'" + MMPI[index].WD_Name + "'";
                                    }

                                } else {
                                    WD_NameList += "'" + MMPI[index].WD_Name + "'";
                                }
                                //resuHTML += "<p style=\" margin-left: 5px; margin-top: 20px;\"><strong>维度" + k.pri_ary() + "、" + MMPI[index].WD_Name + " </strong></p>";
                                resuHTML += "          <table border=\"1\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: collapse; width: 98%;\">";


                                resuHTML += "<tr style=\" height:50px; background-color:RGB(190,190,190)\"><td colspan=\"3\"><strong style=\"margin-left:20px;\">" + MMPI[index].WD_Name + "</strong></td></tr>";


                                resuHTML += "              <tr style=\" height:50px;\">";
                                // alert(eval(MMPI[index].WD_ZHGS));
                                //$("#ResultHTML").append(MMPI[index].WD_ZHGS);
                                var NF = eval(MMPI[index].WD_ZHGS).toFixed(2);

                                if (WD_ValueList != "") {
                                    if (index == 4) {
                                        WD_ValueList += ",null," + NF + "";
                                    } else {
                                        WD_ValueList += "," + NF + "";
                                    }

                                } else {
                                    WD_ValueList += "" + NF + "";
                                }

                                var NEList = MMPI[index].NormExplainList;
                                var NState = "";
                                var N_Explain = "";
                                var N_Proposal = "";
                                //var HH = "";
                                if (NEList != null && NEList.length > 0) {
                                    for (var s = 0; s < NEList.length; s++) {

                                        var F_Symbol = NEList[s].StartFraction + NEList[s].First_Symbol + NF;
                                        var S_Symbol = NF + NEList[s].First_Symbol + NEList[s].EndFraction;
                                        //HH = NEList[s].StartFraction + NEList[s].First_Symbol + NF + NEList[s].First_Symbol + NEList[s].EndFraction;
                                        if (eval(F_Symbol) && eval(S_Symbol)) {
                                            NState = NEList[s].ExplainName;
                                            N_Explain = NEList[s].NormExplain;
                                            N_Proposal = NEList[s].NormProposal;
                                            break;
                                        }
                                    }
                                }
                                resuHTML += "                  <td>量表标准分：" + NF + "</td>";
                                resuHTML += "                  <td>原始分：" + MMPI[index].WD_BZF + "</td>";
                                resuHTML += "                  <td>状态：" + NState + "</td>";
                                resuHTML += "              </tr>";
                                resuHTML += "              <tr>";
                                resuHTML += "                  <td colspan=\"3\"><strong>【结果分析】</strong><br />";
                                resuHTML += "<p>&nbsp;&nbsp;&nbsp;&nbsp;" + N_Explain + "</p>";
                                resuHTML += "                  </td>";
                                resuHTML += "              </tr>";
                                if (MMPI[index].WD_Name != "疑问【Q】") {
                                    resuHTML += "              <tr>";
                                    resuHTML += "                  <td colspan=\"3\"><strong>【心理建议】</strong><br />";
                                    resuHTML += "<p>&nbsp;&nbsp;&nbsp;&nbsp;" + N_Proposal + "</p>";
                                    resuHTML += "                  </td>";
                                    resuHTML += "              </tr>";
                                }
                                resuHTML += "          </table>";
                                $("#ResultHTML").append(resuHTML);
                            }


                        }


                        var NameJsonStr = "[" + WD_NameList + "]";
                        var vl = "[" + WD_ValueList + "]";
                        //$("#ResultHTMLJsonAA").html(NameJsonStr + vl);
                        OnloadChar(NameJsonStr, vl);

                    }



                }
            });

        }





        //<p style="color: red; margin-left: 5px; margin-top: 20px;"><strong>XXX维度 </strong></p>
        //          <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse; width: 98%;">
        //              <tr>
        //                  <td>量表标准分：</td>
        //                  <td>原始分：</td>
        //                  <td>状态：</td>
        //              </tr>
        //              <tr>
        //                  <td colspan="3"><strong>【结果分析】</strong><br />
        //                  </td>

        //              </tr>
        //              <tr>
        //                  <td colspan="3"><strong>【心理建议】</strong><br />
        //                  </td>
        //              </tr>
        //          </table>

    </script>
    <script>
        /*阿拉伯转汉字（数字）*/
        var _change = {
            ary0: ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"],
            ary1: ["", "十", "百", "千"],
            ary2: ["", "万", "亿", "兆"],
            init: function (name) {
                this.name = name;
            },
            strrev: function () {
                var ary = []
                for (var i = this.name.length; i >= 0; i--) {
                    ary.push(this.name[i])
                }
                return ary.join("");
            }, //倒转字符串。  
            pri_ary: function () {
                var $this = this
                var ary = this.strrev();
                var zero = ""
                var newary = ""
                var i4 = -1
                for (var i = 0; i < ary.length; i++) {
                    if (i % 4 == 0) { //首先判断万级单位，每隔四个字符就让万级单位数组索引号递增  
                        i4++;
                        newary = this.ary2[i4] + newary; //将万级单位存入该字符的读法中去，它肯定是放在当前字符读法的末尾，所以首先将它叠加入$r中，  
                        zero = ""; //在万级单位位置的“0”肯定是不用的读的，所以设置零的读法为空  

                    }
                    //关于0的处理与判断。  
                    if (ary[i] == '0') { //如果读出的字符是“0”，执行如下判断这个“0”是否读作“零”  
                        switch (i % 4) {
                            case 0:
                                break;
                                //如果位置索引能被4整除，表示它所处位置是万级单位位置，这个位置的0的读法在前面就已经设置好了，所以这里直接跳过  
                            case 1:
                            case 2:
                            case 3:
                                if (ary[i - 1] != '0') {
                                    zero = "零"
                                }
                                ; //如果不被4整除，那么都执行这段判断代码：如果它的下一位数字（针对当前字符串来说是上一个字符，因为之前执行了反转）也是0，那么跳过，否则读作“零”  
                                break;

                        }

                        newary = zero + newary;
                        zero = '';
                    }
                    else { //如果不是“0”  
                        newary = this.ary0[parseInt(ary[i])] + this.ary1[i % 4] + newary; //就将该当字符转换成数值型,并作为数组ary0的索引号,以得到与之对应的中文读法，其后再跟上它的的一级单位（空、十、百还是千）最后再加上前面已存入的读法内容。  
                    }

                }
                if (newary.indexOf("零") == 0) {
                    newary = newary.substr(1)
                }//处理前面的0  
                return newary;
            }
        }

        //创建class类  
        function change() {
            this.init.apply(this, arguments);
        }
        change.prototype = _change

        //创建实例  


        function Export() {
            var svgFirst;

            chartFirst = $('#container').highcharts();
            svgFirst = chartFirst.getSVG();
            $.ajax({
                url: "Ajax/PersonalReportInfo.ashx?Remark=SaveImage",
                type: "post",
                async: false,
                data: { svg: svgFirst },
                success: function (result) {
                    var ImageSrc = "Ajax/image/" + result;
                    $("#imagescr").attr("src", ImageSrc);

                }
            })

        }

        //导出

        $("#export").click(function (event) {
            var svgXml = $(".highcharts-container").html()

            var image = new Image();
            image.src = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgXml))); //给图片对象写入base64编码的svg流
            var base64 = image.src;
            $("#imagescr").attr("src", base64);
            $("#ContainerImage").show();
            $("#container").hide();
            var timeout = window.setTimeout(function () {
                $("#ContainerImage").show();
                $("#container").hide();
                $("#Print").wordExport(filename);
                $("#ContainerImage").hide();
                $("#container").show();
                window.clearTimeout(timeout);
            }, 500)

        });

        //退出
        function Exits() {
            var param = fnGetUrlParam("type");
            var usr = "";
            // 设置地址连接
            switch (param) {
                case "1":
                    //usr = "http:/" + tiaoarr[1] + "/" + tiaoarr[2] + "/" + tiaoarr[3] + "/heartevaluation/ViewResult.aspx";
                    usr = "/FunctionModular/HeartEvaluation/ViewResult.aspx";
                    break;
                case "3":
                    usr = "/FunctionModular/Warning/CrisisWarning.aspx";
                    break;
                default:
                    usr = "/FunctionModular/PersonalReport/PersonalReport.aspx";
                    break;
            }
            // 设置返回页码参数
            param = fnGetUrlParam("p");
            if (param != "" && param != "1") {
                usr = usr + "?p=" + param;
            }

            window.location.href = usr;
        }

        // 获取地址栏参数
        function fnGetUrlParam(paramName) {
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

    </script>

</asp:Content>
