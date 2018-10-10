<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SpecialViewFilesM.aspx.cs" Inherits="CrisisInterfere.FunctionModular.EvaluationFiles.SpecialViewFilesM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
      <style>
        .groupbox {
            margin: 15px;
            border: thin solid #09C;
            padding: 10px;
            border-radius: 5px;
        }

        .grouptitle {
            display: block;
            margin-top: -24px;
            margin-left: 20px;
            width: 150px;
            text-align: center;
            background-color: #09C;
        }

        .groupfoot {
            display: block;
            margin-bottom: -24px;
            float: right;
            margin-right: 20px;
            width: 80px;
            text-align: center;
            background-color: RGB(245,248,253);
        }

        .heng_s {
            border-bottom: 1px solid #ccc;
            height: 100px;
            position: relative;
            color: white;
        }

        .heng_z {
            position: absolute;
            bottom: 0;
            width: 180px;
        }

            .heng_z:nth-child(1) {
                left: 40px;
            }

            .heng_z:nth-child(2) {
                left: 320px;
            }

            .heng_z:nth-child(3) {
                left: 600px;
            }

        .zz1 {
            left: 40px;
        }
        /*ie8*/
        .spans {
            margin-top: -23px;
            display: inline-block;
            position: absolute;
            right: 11px;
        }

        .hengs {
            height: 30px;
            background: #009966;
            float: left;
            border-bottom: none;
            bottom: 0px;
        }

            .hengs span {
                margin-top: -23px;
                display: inline-block;
                position: absolute;
                right: 11px;
            }

        .heng_xia {
            overflow: hidden;
            zoom: 1;
        }

        .fen_j {
            float: left;
        }

        .jj1 {
            margin-left: 40px;
        }
        /*ie8*/
        .jj2 {
            margin-left: 30px;
        }

        .jj3 {
            float: right;
        }
    </style>
    <style type="text/css">
        .progressA {
            height: 20px;
            overflow: hidden;
        }

        .progress-bar-success {
            background-color: #5cb85c;
        }

        .progress-barA {
            float: left;
            width: 0;
            height: 100%;
            font-size: 12px;
            color: #fff;
            text-align: center;
            background-color: #428bca;
            -webkit-box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
            box-shadow: inset 0 -1px 0 rgba(0,0,0,0.15);
            -webkit-transition: width .6s ease;
            transition: width .6s ease;
        }

        .progress-bar-info {
            background-color: #5bc0de;
        }

        .progress-bar-warning {
            background-color: #f0ad4e;
        }

        .markerA {
            background: #555;
            width: 2px;
            height: 40px;
            position: absolute;
            left: 250px;
            /*top: 50%;*/
            margin-top: -50px;
        }

        .red {
            background: #cd6668;
        }

        .progress-barB {
            float: left;
            width: 0;
            height: 100%;
            font-size: 12px;
            color: #121212;
            text-align: center;
        }
    </style>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <script>
        var navName = '/FunctionModular/EvaluationFiles/EvaluationFiles.aspx';
        var Title = "";
        var categoriedata = [];
        var datas = "";
        var AnswerRs = 0;
        var AnswerR = "";
        var AmountName = "";
        $(function () {

            //动态获取图表
            GetViewFiles();

            function GetViewFiles() {
                var Acode = getUrlParam("Acode");
                var UserName = getUrlVars('names');
                var UserName = decodeURI(UserName.names);
                var types=getUrlParam("types");
                var Sindexs = 0;
                var UID = getUrlParam("UIDs");
                $.ajax({
                    url: "Ajax/EvaluationFiles.ashx?type=GetView",
                    data: { Acode: Acode, UserName: UserName, UIDs: UID },
                    async: true,
                    success: function (msg) {


                        var obj = eval('(' + msg + ')');
                        var sexval = 0;
                        if (obj.UserInfo.Sex == "男") {
                            sexval = 1;
                        } else if (obj.UserInfo.Sex == "女") {
                            sexval = 2;
                        }
                        AmountName = obj.UserInfo.Amount_Name + "测评档案";
                        $("#ReportTitle").html("《" + obj.UserInfo.Amount_Name + "》" + "测评档案");
                        var ageval = obj.UserInfo.Ages;
                        var findtable = $("#pagecontent").find("table");
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(0)").text("登录名：" + obj.UserInfo.LoginName);
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(1)").text("姓名：" + obj.UserInfo.Name);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(0)").text("性别：" + obj.UserInfo.Sex);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(1)").text("部门：" + obj.UserInfo.D_name);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(0)").text("出生日期：" + obj.UserInfo.U_Birthday);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(1)").text("完成次数：" + obj.UserInfo.AllCount);
                        $("#LB").html(obj.UserInfo.AmountIntroduce);
                        AnswerRs = obj.AnswerInfo;
                        Title = obj.UserInfo.Amount_Name;
                        if (types == 4) {
                            TSLB4(Acode, sexval, obj.UserInfo.U_Birthday);                          
                        } else if (types == 802)
                        {
                            TSLB802(Acode, sexval, obj.UserInfo.U_Birthday)
                        } else if (types == 801)
                        {
                            TSLB801(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 14)
                        {
                            TSLB14(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 10)
                        {
                            TSLB10(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 16)
                        {
                            TSLB16(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 7)
                        {
                            TSLB7(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 15)
                        {
                            TSLB15(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 18)
                        {
                            TSLB18(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 19)
                        {
                            TSLB19(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 20)
                        {
                            TSLB20(Acode, sexval, obj.UserInfo.U_Birthday);
                        } else if (types == 21)
                        {
                            TSLB21(Acode, sexval, obj.UserInfo.U_Birthday);
                        }

                    }

                })

            }

        });


        //导出
        //function WordExport() {
        //    $("#container").hide();
        //    $("#ContainerImage").show();
        //    $("#pagecontent").wordExport(AmountName);
        //    $("#ContainerImage").hide();
        //    $("#container").show();
        //}
        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返
        }
        function OcExit() {

            window.location.href = "EvaluationFiles.aspx"

        }
        //获取作答记录表

        /*--------------维度解释解析-----------*/
        var OperationList;

        var Slength = "";

        var WdJsonName = "";

        var Slength802 = "";
        var datas802 = "";
        var TSLB802Index = 0;
        var Lengths = 0;
        function TSLB802(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            var NormName = "";//状态
            var NameID = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB802Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB802Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB802Index].AnswerID;
            var Ajson = AnswerRs[TSLB802Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB802Index++;
                  
                    NameID = "NormName" + TSLB802Index;
                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB802Index;
                    } else {
                        Slength += "," + TSLB802Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval(msg);
                       ;
                        $.each(eval(msg), function (index, item) {
                           
                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }
                         
                            
                            var Scores0A = "";
                            var ConverScoreA = "";
                            var WDNameA = "";
                            var Scores0B = "";
                            var ConverScoreB = "";
                            var WDNameB = "";
                            var WDNameTypeA = "";
                            var WDNameTypeB = "";
                            WdJsonName += "维度" + SectionToChinese(indexs);
                            var Scores0C = "";
                            var WDNameC = "";
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var zt_Type = "";
                            if ((Scores != null && Scores != "")|| Scores==0 ) {
                                if (item.WD_Name.indexOf("退避") > -1) {
                                    Scores = eval(Scores / 10);
                                    Scores = Scores.toFixed(2);
                                    var STA = { 'name': 'A', 'ScoreA': Scores, 'WDName': item.WD_Name }
                                    DataArry.push(STA);

                                } else if (item.WD_Name.indexOf("自责") > -1) {

                                    Scores = eval(Scores / 11);
                                    Scores = Scores.toFixed(2);
                                    var STA = { 'name': 'B', 'ScoreA': Scores, 'WDName': item.WD_Name }
                                    DataArry.push(STA);
                                } else if (item.WD_Name.indexOf("幻想") > -1) {

                                    Scores = eval(Scores / 10);
                                    Scores = Scores.toFixed(2);
                                    var STA = { 'name': 'C', 'ScoreA': Scores, 'WDName': item.WD_Name }
                                    DataArry.push(STA);
                                } else if (item.WD_Name.indexOf("求助") > -1) {

                                    Scores = eval(Scores / 10);
                                    Scores = Scores.toFixed(2);
                                    var STA = { 'name': 'D', 'ScoreA': Scores, 'WDName': item.WD_Name }
                                    DataArry.push(STA);

                                }
                                else if (item.WD_Name.indexOf("解决问题") > -1) {

                                    Scores = eval(Scores / 12);
                                    Scores = Scores.toFixed(2);
                                    var STA = { 'name': 'E', 'ScoreA': Scores, 'WDName': item.WD_Name }
                                    DataArry.push(STA);
                                }
                                else if (item.WD_Name.indexOf("合理化") > -1) {
                                    var WDNames =
                                       Scores = eval(Scores / 11);
                                    Scores = Scores.toFixed(2);
                                    var STA = { 'name': 'F', 'ScoreA': Scores, 'WDName': item.WD_Name }
                                    DataArry.push(STA);
                                   
                                }
                                datas802 += "{name:'" + WDName + "',data:'" + Scores + "'},"
                                if (indexs == 6)
                                {
                                    //alert(1);
                                    var sageOrder = DataArry.sort(
                                     function (a, b) {
                                         return (b.ScoreA - a.ScoreA);
                                     });
                                    var OrderName01 = sageOrder[0].ScoreA;
                                    var OrderName02 = sageOrder[1].ScoreA;
                                    var OrderName03 = sageOrder[2].ScoreA;
                                    var OrderName04 = sageOrder[3].ScoreA;
                                    var OrderName05 = sageOrder[4].ScoreA;
                                    var OrderName06 = sageOrder[5].ScoreA;
                                    $.each(sageOrder, function (index, obj) {
                                        if ((OrderName01 == OrderName02) && (OrderName02 == OrderName02) && (OrderName03 == OrderName04))//几种情况相等的状态
                                        {
                                            if (index == 0) {
                                                Scores0A = item.Score.toFixed(2);
                                                ConverScoreA = obj.ScoreA;

                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name
                                            }
                                            if (index == 1) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                            if (index == 2) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            } if (index == 3) {
                                                Scores0C = item.Score.toFixed(2);
                                                ConverScoreC = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                        }
                                        else if (OrderName01 == OrderName02 == OrderName03) {
                                            if (index == 0) {
                                                Scores0A = item.Score.toFixed(2);
                                                ConverScoreA = obj.ScoreA;

                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name
                                            }
                                            if (index == 1) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                            if (index == 2) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                        } else if (OrderName04 == OrderName05 && OrderName05 == OrderName06) {
                                            if (index == 0) {
                                                Scores0A = item.Score.toFixed(2);
                                                ConverScoreA = obj.ScoreA;

                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name
                                            }
                                            if (index == 1) {
                                                Scores0B = item.Score.toFixed(2);
                                                ConverScoreB = obj.ScoreA;
                                                if (WDName != null && WDName != "") {
                                                    WDNameA += obj.WDName;

                                                } else {
                                                    WDNameA += "," + obj.WDName;
                                                }
                                                WDNameTypeA += obj.name;
                                            }
                                        }
                                        else {
                                            if (index < 2) {
                                                //WdJsonName +="obj.WDName"+",";
                                                if (index == 0) {
                                                    Scores0A = item.Score.toFixed(2);
                                                    ConverScoreA = obj.ScoreA;
                                                    if (WDName != null && WDName != "") {
                                                        WDNameA += obj.WDName;

                                                    } else {
                                                        WDNameA += "," + obj.WDName;
                                                    }
                                                    WDNameTypeA += obj.name
                                                }
                                                if (index == 1) {
                                                    Scores0B = item.Score.toFixed(2);
                                                    ConverScoreB = obj.ScoreA;
                                                    if (WDName != null && WDName != "") {
                                                        WDNameA += obj.WDName;

                                                    } else {
                                                        WDNameA += "," + obj.WDName;
                                                    }
                                                    WDNameTypeA += obj.name;
                                                }
                                            }
                                        }

                                    });
                                    var WDTypeA = 'ABC';
                                    var WDTypeA1 = 'ACB';
                                    var WDTypeA2 = 'BAC';
                                    var WDTypeA3 = 'BCA';
                                    var WDTypeA4 = 'CAB';
                                    var WDTypeA5 = 'CBA';


                                    var WDTypeB = 'DEF';
                                    var WDTypeB1 = 'DFE';
                                    var WDTypeB2 = 'EDF';
                                    var WDTypeB3 = 'EFD';
                                    var WDTypeB4 = 'FDE';
                                    var WDTypeB5 = 'FED';
                                    if (WDTypeA.indexOf(WDNameTypeA) > -1 || WDTypeA1.indexOf(WDNameTypeA) > -1 || WDTypeA2.indexOf(WDNameTypeA) > -1 || WDTypeA3.indexOf(WDNameTypeA) > -1 || WDTypeA4.indexOf(WDNameTypeA) > -1 || WDTypeA5.indexOf(WDNameTypeA) > -1) {
                                        NormName = "非成熟型";
                                        //Result = "   从量表的得分来看，您在面对问题和挫折时，经常采用的应对方式是" + WDNameA + "（选取得分高的两种），您的应对方式属于非成熟型。可能表现为：在生活中常以“退避”、“自责”和“幻想”等应付方式应付困难和挫折，而较少使用“解决问题”和“求助”这类积极的应付方式，情绪和行为缺乏稳定性。";
                                        //Proposal = " 您的应付方式属于不成熟型，这种方式只能起到一定阶段和程度的压力缓解，有利于短时间心态的调整，但往往不能解决根本问题。希望您能够养成正视问题、解决问题的思维习惯，可以通过和老师或父母的沟通得到指导也可以阅读关于积极应对方面的书籍来提高，从而形成一种成熟的压力应对方式。";
                                    } else if (WDTypeB.indexOf(WDNameTypeA) > -1 || WDTypeB1.indexOf(WDNameTypeA) > -1 || WDTypeB2.indexOf(WDNameTypeA) > -1 || WDTypeB.indexOf(WDNameTypeA) > -1 || WDTypeB3.indexOf(WDNameTypeA) > -1 || WDTypeB4.indexOf(WDNameTypeA) > -1 || WDTypeB5.indexOf(WDNameTypeA) > -1) {
                                        NormName = "成熟型";//状态
                                        //Result = " 从量表的得分来看，您在面对问题和挫折时，经常采用的应对方式是" + WDNameA + "（选取得分高的两种），您的应对方式属于成熟型。主要表现为：在面对应激事件或环境时，常能采取“解决问题”和“求助”等成熟的应付方式，而较少使用“退避”，“自责”和“幻想”等不成熟的应付方式；在生活中表现出一种成熟稳定的人格特征和行为方式；善于思考，能理智地应对困境并善于从失败中吸取经验。";//结果
                                        //Proposal = "人在面对困难的时候，会有不同的应对方式，不同的应对方式体现出了一个人的成熟程度是不一样的。面对困难如果能够善于发现一些问题，并根据问题循序渐进地去解决，就可能就会比较游刃有余地去解决所面对的压力和问题。您当前属于一种积极成熟的应对方式，有利于问题的解决，希望您继续保持这种作风。";
                                    }
                                    else {
                                        NormName = "混合型";//状态
                                        //Result = "  从量表的得分来看，您在面对问题和挫折时，经常采用的应对方式是" + WDNameA + "（选取得分高的两种），您的应对方式属于混合型。您的应付方式集成熟与不成熟的应付方式于一体，在应付行为上表现出一种矛盾的心态和两面性的人格特点。";//结果
                                        //Proposal = "   建议您在面对困难时能够善于去发现一些问题，并根据问题循序渐进地去解决，就可能就会比较游刃有余地去解决所面对的压力和问题。反之，就可能就会陷入到一种被动的、消极的状态。希望您可以养成更多地学会面对问题，寻求解决的细微习惯，从而形成一种成熟的压力应对方式。";
                                    }
                                    $("#" + NameID).text(NormName);
                                }
                                    //循环遍历状态
                                    //var CMScorce = item.Score.toFixed(2);
                                    var Startsorse = "";
                                    var Endsorse = "";


                                    //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                    OperationList = item.Tz_List;
                                    Allscore = item.Allscore;
                                    var SectioName = "";
                                    SectioName = "result" + SectionToChinese(index);
                                    SectionValue = item.Result;
                                    WdJsonName += "总评" + ",";
                                    //var zt_Type = "";
                                    //zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName

                                    //状态
                                    //var zt_Type = "";
                                    //zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                                    var PageHtml = "";
                                    index++;
                                    if (indexs == 1) {
                                        PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB802Index + "</td>";//之前是AR
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + EndTime + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";                                     
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\" rowspan=" + msgs.length + " id="+NameID+">" + NormName + "</td>";
                                        PageHtml += "</tr>";
                                    } else {
                                        PageHtml += " <tr>";
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                        //PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + "无" + "</td>";
                                        PageHtml += "  </tr>";
                                    }

                                    $("#GetTableID tbody").append(PageHtml);
                                
                            }
                            if (indexs == msgs.length && Lengths == TSLB802Index) {
                                chartjson(Slength, datas802);
                            }
                        });
                        TSLB802(Acode, sexval, Birthday);

                    }
                }
            });

        }

        var Slength4 = "";
        //var xdatas4 = "";
        //var ydatas4="";
        var datas4 = "";
        var ztype4="";
        var TSLB4Index = 0;
        var Lengths = 0;
        function TSLB4(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB4Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB4Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB4Index].AnswerID;
            var Ajson = AnswerRs[TSLB4Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB4Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB4Index;
                    } else {
                        Slength += "," + TSLB4Index;
                    }
                    if (msg != "") {
                        AR++;
                        var msgs = eval(msg);
                        $.each(eval(msg), function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }
                            datas4 += "{name:'" + WDName + "',data:'" + Seriesdata + "'},"
                         //   datas4 += "{name:'" + "低于生理年龄" + "," + "等于生理年龄" + "," + "高于生理年龄" + "',data:'" + Seriesdata + "'},"
                         
                            WdJsonName += "维度" + SectionToChinese(indexs);
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var zt_Type = "";
                            if (Scores < 30) {
                                if (20 <= AgeVal && AgeVal <= 29) {
                                    Conversage = 1;
                                } else if (AgeVal < 20) {
                                    Conversage = 2;
                                } else if (AgeVal > 29) {
                                    Conversage = 3;
                                }
                            } else if (0 <= Scores && Scores < 50) {
                                if (30 <= AgeVal && AgeVal <= 39) {
                                    Conversage = 1;//等于
                                } else if (AgeVal < 30) {
                                    Conversage = 2;//低于                                    
                                } else if (AgeVal > 39) {
                                    Conversage = 3;//高于
                                }
                            } else if (50 <= Scores && Scores < 65) {
                                if (40 <= AgeVal && AgeVal <= 49) {
                                    Conversage = 1;
                                } else if (AgeVal < 40) {
                                    Conversage = 2;
                                } else if (AgeVal > 49) {
                                    Conversage = 3;
                                }
                            }
                            else if (65 <= Scores && Scores <= 75) {
                                if (50 <= AgeVal && AgeVal <= 59) {
                                    Conversage = 1;
                                } else if (AgeVal < 50) {
                                    Conversage = 2;
                                } else if (AgeVal > 59) {
                                    Conversage = 3;
                                }
                            } else if (Scores > 75) {
                                Conversage = (AgeVal >= 60);
                                if (AgeVal >= 60) {
                                    Conversage = 1;
                                } else if (AgeVal < 60) {
                                    Conversage = 2;
                                }
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            if (Conversage == 1) {
                                zt_Type = "等于生理年龄";
                                NormName = zt_Type;
                                Result = "【结果分析二】";
                                Result += "若您的心理年龄和您的生理年龄相符。主要表现为：言行和思考方式，表现出该年龄段都有的心理特点，跟同龄的大多数人相符。";

                                Proposal += "【心理建议二】";
                                Proposal += "心理年龄和生理年龄基本符合，是一种心理健康的表现，建议您继续保持当前的心理状态。";
                               
                                if (ztype4 == null || ztype4 == "") {
                                    ztype4 = 1;
                                } else {
                                    ztype4 += "," +1;
                                }
                            } else if (Conversage == 2) {
                                zt_Type = "低于生理年龄";
                                NormName = zt_Type;
                                Result = "【结果分析一】"
                                Result += "若您的心理年龄小于您的生理年龄，可能呈现出不协调的情况，主要表现为：有一些行为或者表达方式和年龄较小的同学比较相像，比如注意力集中的时间较短，和他人的意见不一致时会立即苦恼等；学习成绩有时会跟不上老师的教学进度；难以适应学校的规则等。";
                                Proposal += "【心理建议一】";
                                Proposal += "心理年龄”只不过是一种象征的说法，随着人的不断努力，它可以得到调整和优化。一般认为一个人的心理特点如果严重偏离自己所属年龄，往往都有可能是心理不健康的表现。建议您可以多和父母或老师进行沟通，学习改善自己行为或表达方式的方法，比如参加一些训练，多和同龄同学交流，有助于更好地理解自己的状态，进而得到提高。 ";
                               
                                if (ztype4 == null || ztype4 == "") {
                                    ztype4 = 2;
                                } else {
                                    ztype4 += "," +2;
                                }
                            } else if (Conversage == 3) {
                                zt_Type = "高于生理年龄";
                                NormName = zt_Type;
                                Result = "【结果分析三】"
                                Result += " 若您的心理年龄大于您的生理年龄，可能会表现为：思考的问题较多，为人处世相比同年龄段的人要成熟，喜欢回忆过去，很难与同年龄的同学有共同语言与相互理解的体验。";
                                Proposal += "【心理建议三】";
                                Proposal += "心理年龄的高低，和一个人的遗传、性格、经历、环境等等因素密切相关，甚至受到近期的心情等多变因素的影响，并非病态，心理年龄远大于实际年龄的人，会很难与同年龄的人有相互的理解与共同的语言，建议您多与同龄人交流，积极参与同龄人的活动，多了解并融入同龄人的的生活习惯，有助于帮助您减少内心的孤独感以及不舒适的感觉，更好地适应学习和社会生活。";
                               
                                if (ztype4 == null || ztype4 == "") {
                                    ztype4 = 3;
                                } else {
                                    ztype4 += "," + 3;
                                }
                            }
                            
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";                          
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                            //var zt_Type = "";
                            //zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName

                            //状态
                            //var zt_Type = "";
                            //zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB4Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + "总评" + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + "总评" + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            xdatas4='等于生理年龄'+','+'低于生理年龄'+','+'高于生理年龄'
                            if (indexs == msgs.length && Lengths == TSLB4Index) {
                                //chartjsontype(xdatas4,Slength,ztype4);
                                chartjson(Slength, datas4);
                            }
                        });
                        TSLB4(Acode, sexval, Birthday);

                    }
                }
            });

        }

        var Slength801 = "";
        var datas801 = "";
        var TSLB801Index = 0;
        var Lengths = 0;
        function TSLB801(Acode, sexval, Birthday) {
            var AR = 0;
            var IndexA = "";
            var IndexB = "";
            var IndexC = "";
            var IndexMax = "";
            var WDName = "";
            var AllScoreJson = "";
            var datas = "";
            Lengths = AnswerRs.length;
           
            if (TSLB801Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB801Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB801Index].AnswerID;
            var Ajson = AnswerRs[TSLB801Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB801Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB801Index;
                    } else {
                        Slength += "," + TSLB801Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval(msg);
                        var IndexScoresA = msgs[0].Score;
                        var IndexScoreB = msgs[1].Score;
                        var IndexScoreC = msgs[2].Score;
                        IndexA = eval(IndexScoresA / 30.00).toFixed(2);
                        IndexB = eval(IndexScoreB / 40.00).toFixed(2);
                        IndexC = eval(IndexScoreC / 8.00).toFixed(2);
                        $.each(eval(msg), function (index, item) {
                            index++;
                            var Seriesdata = "";
                            var scorejson = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var Scores0A = "";
                           
                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var ConverScoreA = "";
                            if (Scores != null && Scores != "") {
                                if ((IndexA == IndexB) && (IndexA == IndexC)) {
                                    if (index == 1) {
                                      
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexA;
                                        } else {
                                            scorejson +=IndexA
                                        }
                                        ConverScoreA = IndexA;
                                        WDName = "不成熟防御机制";
                                        A = 1;
                                    } else if (index == 2) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexA;
                                        } else {
                                            scorejson += IndexA;
                                        }
                                        ConverScoreA = IndexA;
                                        WDName = "中间型防御机制";
                                        A = 2;
                                    } else if (index == 3) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexA;
                                        } else {
                                            scorejson += IndexA;
                                        }
                                        WDName = "成熟防御机制";
                                        A = 3;
                                        ConverScoreA = IndexA;
                                    }
                                } else if ((IndexA == IndexB && IndexA > IndexC)) {
                                    if (index == 1) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexA;
                                        } else {
                                            scorejson += IndexA
                                        }
                                        WDName = "不成熟防御机制";
                                        A = 1;
                                        ConverScoreA = IndexA;
                                    } else if (index == 2) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexB;
                                        } else {
                                            scorejson += IndexB;
                                        }
                                        WDName = "中间型防御机制";
                                        A = 2;
                                    }
                                }
                                else if ((IndexA == IndexC && IndexA > IndexB)) {
                                    if (index == 1) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexA;
                                        } else {
                                            scorejson += IndexA
                                        }
                                        WDName = "不成熟防御机制";
                                        A = 1;
                                        ConverScoreA = IndexA;
                                    } else if (index == 3) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexC;
                                        } else {
                                            scorejson += IndexC;
                                        }
                                        WDName = "成熟防御机制";
                                        A = 3;
                                        ConverScoreA = IndexA;
                                    }
                                } else if ((IndexB == IndexC && IndexB > IndexA)) {
                                    if (index == 2) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexB;
                                        } else {
                                            scorejson += IndexB;
                                        }
                                        WDName = "中间型防御机制";
                                        A = 2;
                                        ConverScoreA = IndexB;
                                    } else if (index == 3) {
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexC;
                                        } else {
                                            scorejson += IndexC;
                                        }
                                        WDName = "成熟防御机制";
                                        A = 3;
                                        ConverScoreA = IndexC;
                                    }
                                }
                                else {
                                    if (index == 1) {

                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexA;
                                        } else {
                                            scorejson += IndexA
                                        }
                                        ConverScoreA = IndexA;
                                    } else if (index == 2) {

                                        //IndexB = eval(Score / 40.00).toFixed(2);
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexB;
                                        } else {
                                            scorejson += IndexB;
                                        }
                                        ConverScoreA = IndexB;
                                    } else if (index == 3) {
                                        //IndexC = eval(Score / 8.00).toFixed(2);
                                        if (scorejson != "" && scorejson != null) {
                                            scorejson += "," + IndexC;
                                        } else {
                                            scorejson += IndexC;
                                        }
                                        if (IndexA > IndexB) {
                                            WDName = "不成熟防御机制";
                                            A = 1;
                                            IndexMax = IndexA;
                                            ConverScoreA = IndexA;

                                        } else {
                                            A = 2;
                                            WDName = "中间型防御机制";
                                            IndexMax = IndexB;
                                            ConverScoreA = IndexB;
                                        }
                                        if (IndexMax < IndexC) {
                                            A = 3;
                                            WDName = "成熟防御机制";
                                            IndexMax = IndexC;
                                            ConverScoreA = IndexC

                                        }
                                    }
                                  

                                } if (index == 4) {
                                    ConverScoreA = eval(Scores / 10.00).toFixed(2);
                                    if (scorejson != "" && scorejson != null) {
                                        scorejson += "," + ConverScoreA;
                                    } else {
                                        scorejson += ConverScoreA;
                                    }
                                    WDName = item.WD_Name;
                                    if (ConverScoreA < 4) {
                                        NormName = "掩饰性较低";
                                        Result += "您在问卷中的掩饰度较小，表明您本次作答的可信度较高。";
                                        Proposal = "--";

                                    } else if (4 <= ConverScoreA && ConverScoreA <= 6) {
                                        NormName = "掩饰性一般";
                                        Result += "您在掩饰维度上的得分处于中等水平，表明您可能为了制造较好的社会形象而在做答的时候否认一部分您认为自身不太好的情况。";
                                        Proposal = "--";
                                    } else if (ConverScoreA > 6) {
                                        NormName = "掩饰性较高";
                                        Result += "您在掩饰维度上的得分处于较高水平，您可能为了制造较好的社会形象而在做答的时候否认很大一部分您认为自身不太好的情况，没有真实作答。";
                                        Proposal = "--";
                                    }
                                }
                            }
                            //alert(WDName)
                            //alert(ConverScoreA)
                            datas801 += "{name:'" + item.WD_Name + "',data:'" + scorejson + "'},"
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";
                                if (A == 1) {
                                    NormName = "正常";
                                } else if (A == 2) {
                                    NormName = "中间状态";
                                } else if (A == 3) {
                                    NormName = "中间状态";
                                }

                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName +=item.WD_Name + ",";
                              
                                var PageHtml = "";
                                if ((IndexA == IndexB) && (IndexA == IndexC)) {
                                    if (indexs == 1) {
                                        PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"4\">" + TSLB801Index + "</td>";//之前是AR
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"4\">" + EndTime + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                        PageHtml += "</tr>";
                                    } else {
                                        PageHtml += " <tr>";
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                        PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                        PageHtml += "  </tr>";
                                    }

                                    $("#GetTableID tbody").append(PageHtml);
                                }
                                else if (IndexA == IndexB && IndexA > IndexC) {  //
                                    if (index == 2|| index == 4) {
                                        if (indexs == 2) {
                                          
                                            PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + TSLB801Index + "</td>";//之前是AR
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + EndTime + "</td>";
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                            PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                            PageHtml += "</tr>";
                                        } else {
                                            PageHtml += " <tr>";
                                            PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                            PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                            PageHtml += "  </tr>";
                                        }
                                        $("#GetTableID tbody").append(PageHtml);
                                    }
                                }
                                ////else if (IndexA == IndexC && IndexA > IndexB) {
                                ////    if (index == 3 || index == 4) {
                                      
                                ////            if (indexs == 4) {
                                ////                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"3\">" + TSLB801Index + "</td>";//之前是AR
                                ////                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"3\">" + EndTime + "</td>";
                                ////                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                ////                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                ////                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                ////                PageHtml += "</tr>";
                                ////            } else {
                                ////                PageHtml += " <tr>";
                                ////                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                ////                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                ////                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                ////                PageHtml += "  </tr>";
                                ////            }

                                ////            $("#GetTableID tbody").append(PageHtml);
                                ////        }
                                ////    }
                                //else if (IndexB == IndexC && IndexB > IndexA) {
                                //        if (indexs == 3 || index == 4) {
                                //            if (indexs == 3) {
                                //                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"3\">" + TSLB801Index + "</td>";//之前是AR
                                //                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"3\">" + EndTime + "</td>";
                                //                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                //                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                //                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                //                PageHtml += "</tr>";
                                //            } else {
                                //                PageHtml += " <tr>";
                                //                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                //                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                //                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                //                PageHtml += "  </tr>";
                                //            }
                                //            $("#GetTableID tbody").append(PageHtml);
                                //        }
                                //    } 
                                else {
                                        if (index == 3 || index == 4) {
                                            if (indexs == 3) {
                                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + TSLB801Index + "</td>";//之前是AR
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=\"2\">" + EndTime + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                                PageHtml += "</tr>";
                                            } else {
                                                PageHtml += " <tr>";
                                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                                PageHtml += "  </tr>";
                                            }

                                            $("#GetTableID tbody").append(PageHtml);
                                        }
                                    }
                               
                                    if (indexs == msgs.length && Lengths == TSLB801Index) {
                                        chartjsontype(Slength, datas801);
                                    }
                                });
                        TSLB801(Acode, sexval, Birthday);

                    }
                }
            });

        }

        var Slength14 = "";
        var datas14 = "";
        var TSLB14Index = 0;
        var Lengths = 0;
        function TSLB14(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB14Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB14Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB14Index].AnswerID;
            var Ajson = AnswerRs[TSLB14Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB14Index++;
                    var WDScoreA = "";
                    var WDScoreB = "";
                    var AllscoreA = 0;
                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB14Index;
                    } else {
                        Slength += "," + TSLB14Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval(msg);
                        $.each(eval(msg), function (index, item) {
                            index++;
                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                           
                            var WDName = "";
                            var NormName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }


                            if (index == 1) {
                              
                                WDScoreA = Originals;
                                AllscoreA += parseInt(Originals);
                            } else if (index == 2)
                            {
                              
                                AllscoreA += parseInt(Originals);
                            }
                            else if (index == 3) {
                                indexs++;
                                AllscoreA += parseInt(Originals);
                                //alert(AllscoreA)
                                WdJsonName += "总评" + ",";
                                WDScoreB = Originals;
                                scorejson += parseFloat(AllscoreA) + ",";
                                if ((AllscoreA != null && AllscoreA != "") || AllscoreA==0) {
                                    AllscoreA = parseInt(AllscoreA);
                                    if (AllscoreA < 9) {
                                        NormName = "无行为问题";
                                      
                                    } else if (AllscoreA >= 9 && WDScoreA > WDScoreB) {
                                        NormName = "A行为问题";                                       
                                    } else if (AllscoreA >= 9 && WDScoreA < WDScoreB) {
                                        NormName = "N行为问题";                                     

                                    } else if (AllscoreA >= 9 && WDScoreA == WDScoreB) {
                                        NormName = "M行为问题";                                
                                    }
                                }
                                datas14 += "{name:'" + "总评" + "',data:'" + AllscoreA + "'},"
                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";


                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";
                               
                                var PageHtml = "";
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" >" + TSLB14Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + AllscoreA + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                                $("#GetTableID tbody").append(PageHtml);
                            }
                            if (indexs == (msgs.length-2) && Lengths == TSLB14Index) {
                                chartjson(Slength, datas14);
                            }
                        });
                        TSLB14(Acode, sexval, Birthday);

                    }
                }
            });

        }

        var Slength10 = "";
        var datas10 = "";
        var TSLB10Index = 0;
        var Lengths = 0;
        function TSLB10(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB10Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB10Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB10Index].AnswerID;
            var Ajson = AnswerRs[TSLB10Index].AnswerJson
            var AllScores ="";
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB10Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB10Index;
                    } else {
                        Slength += "," + TSLB10Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval(msg);
                        $.each(eval(msg), function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            var NormName = "";
                            var Result = "";//结果
                            var Proposal = "";
                            var TZNumber = 0;
                            // var arr = new Array('TZ_148111893927314', 'TZ_148111893927824', 'TZ_148111893928134', 'TZ_148111893928444', 'TZ_148111893928854', 'TZ_148111893929164', 'TZ_148111893929474', 'TZ_148111893929884', 'TZ_148111893930094', 'TZ_1481118939303104', 'TZ_1481118939307114', 'TZ_1481118939311124', 'TZ_1481118939314134', 'TZ_1481118939317144', 'TZ_1481118939320154');
                            var ArrShuju = ['TZ_148111893927314', 'TZ_148111893927824', 'TZ_148111893928134', 'TZ_148111893928444', 'TZ_148111893928854', 'TZ_148111893929164', 'TZ_148111893929474', 'TZ_148111893929884', 'TZ_148111893930094', 'TZ_1481118939303104', 'TZ_1481118939307114', 'TZ_1481118939311124', 'TZ_1481118939314134', 'TZ_1481118939317144', 'TZ_1481118939320154'];
                            var AnserJSon = JSON.parse(Ajson)
                            for (var o in AnserJSon) {

                                var obj = AnserJSon[o];
                                if (ArrShuju.toString().indexOf(obj) > -1) {
                                    TZNumber++;
                                }

                            }
                            var AnswerIDs = getUrlParam("A_ID");
                            AllScores = Originals;
                            AllscoreA = parseInt(AllScores);
                            if (AllscoreA < 30) {
                                NormName = "正常";
                                Result += " 该学生在量表上的得分较低，表明该学生的社交表现和言语行为等都很正常，表现出与年龄相当的心理与身体功能，并未表现出孤独症状。";
                                Proposal += "该学生当前状态良好，建议老师提示父母在日常生活中应注意为该学生提供一个良好的成长、交友环境，这对该学生的健康发展是必不可少的。";
                            }
                            else if ((30 <= AllscoreA && AllscoreA < 36) || (AllscoreA >= 36) && (TZNumber < 5)) {
                                NormName = "轻-中度孤独症";
                                Result += "该学生在量表上的得分处于中间状态，表明该学生可能有轻微的孤独症症状，可能表现为：在人际关系中有某种程度的回避他人的行为，情感反应和躯体运动能力有些刻板，一些心理机能的发展与年龄不符等。";
                                Proposal += "建议老师提示家长应努力为该学生提供一个良好的成长环境，宽容谨慎地对待该学生的行为表现，不过分批评与评价，不与其他学生作简单地比较。如有需要可以到正规医院做进一步地检查诊断，以明确问题。";

                            }
                            else if (AllscoreA >= 36 && TZNumber >= 5) {
                                NormName = "重度孤独症";
                                Result += "该学生在量表上的得分较高，表明该学生可能属于重度孤独症。可能表现为：该学生的情感反应十分刻板，智力功能也存在一定的障碍，并有强烈的回避人际交往的倾向，某些动作技能迟缓，可能重复性地做一些无意义的小动作等。";
                                Proposal += "重度抑郁症会严重影响该学生正常的人际融入和身心功能的发展，建议老师提示家长带该学生到专科医院进行及时诊断治疗。另外在教学中应为该学生提供一个良好的成长环境，宽容谨慎地对待该学生的行为表现，不过分批评与评价，不与其他学生作简单地比较。";
                            }
                            //alert(WDName)
                            //alert(ConverScoreA)
                            datas10 += "{name:'" + WDName + "',data:'" + AllScores + "'},"
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";


                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                            if (NormName == null || NormName == "") {
                                NormName = "无";
                            }
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB10Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            if (indexs == msgs.length && Lengths == TSLB10Index) {
                                chartjson(Slength, datas10);
                            }
                        });
                        TSLB10(Acode, sexval, Birthday);

                    }
                }
            });

        }


        var Slength16 = "";
        var datas16 = "";
        var TSLB16Index = 0;
        var Lengths = 0;
        function TSLB16(Acode, sexval, Birthday) {
            var L = "";
            var NE = "";
            var PE = "";
            var NC = "";
            var PC = "";
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB16Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB16Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB16Index].AnswerID;
            var Ajson = AnswerRs[TSLB16Index].AnswerJson
            var AllScores = AnswerRs[TSLB16Index].score;
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB16Index++;
                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB16Index;
                    } else {
                        Slength += "," + TSLB16Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                       
                        var msgs = eval(msg);
                        msgs
                        var temp = msgs[0];
                        msgs[0] = msgs[msgs.length - 1];
                        msgs[msgs.length - 1] = temp;

                        $.each(msgs, function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            index++;
                            var Score = "";
                          
                            if (item.ScoreType == 1) {
                                if (item.WD_Name.indexOf('总评') > -1) {
                                    Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                }
                                if (Score == "" || Score == null) {
                                    Score = 0;
                                }
                                if (item.WD_Name.indexOf('L') > -1) {
                                    L = Originals;
                                }  else if (item.WD_Name.indexOf('NE') > -1) {
                                    NE = Originals;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    PE = Originals;
                                } else if (item.WD_Name.indexOf('NC') > -1) {
                                    NC = Originals;
                                } else if (item.WD_Name.indexOf('PC') > -1) {
                                    PC = Originals;
                                } else if (item.WD_Name.indexOf('总评') > -1) {

                                    var GS = "15+2*L+3*NE-PE+5*NC-PC";
                                    if (L == "" || L == null) {
                                        L = 0;
                                    }
                                    if (NE == null || NE == "") {
                                        NE = 0;
                                    }
                                    if (PE == null || PE == "") {
                                        PE = 0;
                                    }
                                    if (NC == null || NC == "") {
                                        NC = 0;
                                    }
                                    if (PC == null || PC == "") {
                                        PC = 0;
                                    }
                                    var GSW = GS.replace("L", L).replace("NE", NE).replace("PE", PE).replace("NC", NC).replace("PC", PC);
                                    Score = eval(GSW);
                                    item.Score = Score;
                                    item.ConversionFormula = Score;
                                }
                                scorejson += Score + ",";
                                var Forms = item.Formulas;
                               
                            } else {
                                Score = item.Score.toFixed(2);
                                if (Score == "" || Score == null) {
                                    Score = 0;
                                }
                                if (item.WD_Name.indexOf('L') > -1) {
                                    L = Originals;
                                }  else if (item.WD_Name.indexOf('NE') > -1) {
                                    NE = Originals;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    PE = Originals;
                                } else if (item.WD_Name.indexOf('NC') > -1) {
                                    NC = Originals;
                                } else if (item.WD_Name.indexOf('PC') > -1) {
                                    PC = Originals;
                                } else if (item.WD_Name.indexOf('总评') > -1) {
                                    var GS = "15+2*L+3*NE-PE+5*NC-PC";
                                    if (L == "" || L == null) {
                                        L = 0;
                                    }
                                    if (NE == null || NE == "") {
                                        NE = 0;
                                    }
                                    if (PE == null || PE == "") {
                                        PE = 0;
                                    }
                                    if (NC == null || NC == "") {
                                        NC = 0;
                                    }
                                    if (PC == null || PC == "") {
                                        PC = 0;
                                    }
                                    GS = GS.replace("L", L).replace("NE", NE).replace("PE", PE).replace("NC", NC).replace("PC", PC);
                                    Score = eval(GS);
                                    item.Score = Score;
                                    item.ConversionFormula = Score;                                  
                                }
                                scorejson += parseFloat(Score) + ",";
                                
                            }//each遍历
                           
                            var cmmlists = item.CmmodelList;
                            var NormName = "";
                            if (Score != null && Score != "") {
                              
                                    for (var i = 0; i < cmmlists.length; i++) {

                                        var StartAgeA = cmmlists[i].NormStartAge <= AgeVal;
                                        var EndAgeA = AgeVal <= cmmlists[i].NormEndAge;
                                        //区分性别和年龄
                                        if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                            if (cmmlists[i].NormSex == sexval && (StartAgeA && EndAgeA)) {
                                                if (item.ScoreType == 1) {
                                                    Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                    Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                } else {
                                                    Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                    Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                                }
                                                var Startstr = Startsorse.replace(/\≤/g, "<=");
                                                var Endstr = Endsorse.replace(/\≤/g, "<=");
                                                var TsStart = eval(Startstr);
                                                var Tsend = eval(Endstr);
                                                if (TsStart && Tsend) {
                                                    NormName = cmmlists[i].NormName;
                                                    Result = cmmlists[i].Result;
                                                    Proposal = cmmlists[i].Proposal;
                                                }
                                            }
                                        } //不区分性别，区分年龄
                                        else if (cmmlists[i].NormSex == 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                            if (StartAgeA && EndAgeA) {
                                                if (item.ScoreType == 1) {
                                                    Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                    Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                } else {
                                                    Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                    Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                                }
                                                var Startstr = Startsorse.replace(/\≤/g, "<=");
                                                var Endstr = Endsorse.replace(/\≤/g, "<=");

                                                var TsStart = eval(Startstr);
                                                var Tsend = eval(Endstr);

                                                if (TsStart && Tsend) {
                                                    NormName = cmmlists[i].NormName;
                                                    Result = cmmlists[i].Result;
                                                    Proposal = cmmlists[i].Proposal;

                                                }
                                            }
                                        }  //区分性别,不区分年龄
                                        else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                            if (cmmlists[i].NormSex == sexval) {
                                                if (item.ScoreType == 1) {
                                                    Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                    Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                } else {
                                                    Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                    Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                                }
                                                var Startstr = Startsorse.replace(/\≤/g, "<=");
                                                var Endstr = Endsorse.replace(/\≤/g, "<=");
                                                var TsStart = eval(Startstr);
                                                var Tsend = eval(Endstr);
                                                if (TsStart && Tsend) {
                                                    NormName = cmmlists[i].NormName;
                                                    Result = cmmlists[i].Result;
                                                    Proposal = cmmlists[i].Proposal;

                                                }
                                            }
                                        }//年龄和性别不区分
                                        else {

                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;
                                            }
                                        }
                                    }
                                
                            }
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            datas16 += "{name:'" + WDName + "',data:'" + Score + "'},"
                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";
                          
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB16Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Score + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Score + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            if (indexs == msgs.length && Lengths == TSLB16Index) {
                                chartjson(Slength, datas16);
                            }
                        });
                        TSLB16(Acode, sexval, Birthday);

                    }
                }
            });

        }


        var Slength7 = "";
        var datas7 = "";
        var TSLB7Index = 0;
        var Lengths = 0;
        function TSLB7(Acode, sexval, Birthday) {
            var A = "";
            var B = "";
            var C = "";
            var D = "";
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB7Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB7Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB7Index].AnswerID;
            var Ajson = AnswerRs[TSLB7Index].AnswerJson
            var AllScores = AnswerRs[TSLB7Index].score;
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB7Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB7Index;
                    } else {
                        Slength += "," + TSLB7Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval(msg);
                        $.each(eval(msg), function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            index++;
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                if (item.WD_Name.indexOf('PA') > -1) {
                                    A = Score;
                                } else if (item.WD_Name.indexOf('NA') > -1) {
                                    B = Score;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    C = Score;
                                } else if (item.WD_Name.indexOf('NE') > -1) {
                                    D = Score;
                                } else if (item.WD_Name.indexOf('总评') > -1) {
                                    A = parseInt(A);
                                    B = parseInt(B);
                                    C = parseInt(C);
                                    D = parseInt(D);
                                    Score = eval(A - B + C - D+24);
                                    item.Score = Score;
                                    item.ConversionFormula = Score;
                                }
                                scorejson += Score + ",";
                                var Forms = item.Formulas;
                                if (Forms != null && Forms != "") {
                                    MinScore = Forms.replace("Score", Mins);
                                    MaxScore = Forms.replace("Score", Maxs);
                                    MinScore = eval(MinScore).toFixed(2);
                                    MaxScore = eval(MaxScore).toFixed(2);
                                }
                            } else {
                                Score = item.Score.toFixed(2);
                                if (item.WD_Name.indexOf('PA') > -1) {
                                    A = Score;
                                } else if (item.WD_Name.indexOf('NA') > -1) {
                                    B = Score;
                                } else if (item.WD_Name.indexOf('PE') > -1) {
                                    C = Score;
                                } else if (item.WD_Name.indexOf('NE') > -1) {
                                    D = Score;
                                } else if (item.WD_Name.indexOf('总评') > -1) {
                                    A = parseInt(A);
                                    B = parseInt(B);
                                    C = parseInt(C);
                                    D = parseInt(D);
                                    Score = eval(A - B + C - D+24);

                                    item.Score = Score;
                                    //item.Score = parseInt(item.Score);
                                    item.ConversionFormula = Score;
                                }
                                scorejson += parseFloat(Score) + ",";
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var sageOrder = cmmlists.sort(
                function (a, b) {
                    return (a.CMstartScore - b.CMstartScore);
                });

                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            var CmHtmls = "";//颜色div拼接
                            var CMNumber = "";//数字div拼接
                            var CMLengthNew = "";

                            if (Score != null && Score != "") {
                                for (var i = 0; i < cmmlists.length; i++) {

                                    var StartAgeA = cmmlists[i].NormStartAge <= AgeVal;
                                    var EndAgeA = AgeVal <= cmmlists[i].NormEndAge;
                                    //区分性别和年龄
                                    if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (cmmlists[i].NormSex == sexval && (StartAgeA && EndAgeA)) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;
                                            }
                                        }
                                    } //不区分性别，区分年龄
                                    else if (cmmlists[i].NormSex == 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (StartAgeA && EndAgeA) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                              
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");

                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);

                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }  //区分性别,不区分年龄
                                    else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                        if (cmmlists[i].NormSex == sexval) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }//年龄和性别不区分
                                    else {

                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                        }
                                    }
                                }
                            }
                            datas7 += "{name:'" + WDName + "',data:'" + Score + "'},"
                            var cmmlists = item.CmmodelList;
                            var NormName = "";
                            if (Score != null && Score != "") {
                                for (var i = 0; i < cmmlists.length; i++) {

                                    var StartAgeA = cmmlists[i].NormStartAge <= AgeVal;
                                    var EndAgeA = AgeVal <= cmmlists[i].NormEndAge;
                                    //区分性别和年龄
                                    if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (cmmlists[i].NormSex == sexval && (StartAgeA && EndAgeA)) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;
                                            }
                                        }
                                    } //不区分性别，区分年龄
                                    else if (cmmlists[i].NormSex == 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {

                                        if (StartAgeA && EndAgeA) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");

                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);

                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }  //区分性别,不区分年龄
                                    else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                        if (cmmlists[i].NormSex == sexval) {
                                            if (item.ScoreType == 1) {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            } else {
                                                Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                                Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                            }
                                            var Startstr = Startsorse.replace(/\≤/g, "<=");
                                            var Endstr = Endsorse.replace(/\≤/g, "<=");
                                            var TsStart = eval(Startstr);
                                            var Tsend = eval(Endstr);
                                            if (TsStart && Tsend) {
                                                NormName = cmmlists[i].NormName;
                                                Result = cmmlists[i].Result;
                                                Proposal = cmmlists[i].Proposal;

                                            }
                                        }
                                    }//年龄和性别不区分
                                    else {

                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                        }
                                    }
                                }
                            }
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";


                            //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                            OperationList = item.Tz_List;
                            Allscore = item.Allscore;
                            var SectioName = "";
                            SectioName = "result" + SectionToChinese(index);
                            SectionValue = item.Result;
                            WdJsonName += "总评" + ",";

                            var PageHtml = "";
                            index++;
                            
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB7Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Score + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + WDName + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Score + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            if (indexs == msgs.length && Lengths == TSLB7Index) {
                                chartjson(Slength, datas7);
                            }
                        });
                        TSLB7(Acode, sexval, Birthday);

                    }
                }
            });

        }


        var Slength15 = "";
        var datas15 = "";
        var TSLB15Index = 0;
        var Lengths = 0;
        function TSLB15(Acode, sexval, Birthday) {
            var WDScoreA = "";
            var WDScoreB = "";
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB15Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB15Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB15Index].AnswerID;
            var Ajson = AnswerRs[TSLB15Index].AnswerJson
            var AllScores = AnswerRs[TSLB15Index].score;
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB15Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB15Index;
                    } else {
                        Slength += "," + TSLB15Index;
                    }
                    if (msg != "") {
                        var DataArry = [];
                        AR++;
                        var msgs = eval(msg);
                        $.each(eval(msg), function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }

                            index++;
                            if (item.ScoreType == 1) {
                                Score = parseFloat(eval(item.ConversionFormula).toFixed(2));

                                var Forms = item.Formulas;
                                if (Forms != null && Forms != "") {
                                    MinScore = Forms.replace("Score", Mins);
                                    MaxScore = Forms.replace("Score", Maxs);
                                    MinScore = eval(MinScore).toFixed(2);
                                    MaxScore = eval(MaxScore).toFixed(2);
                                }

                            } else {
                                Score = item.Score.toFixed(2);
                                scorejson += parseFloat(item.Score.toFixed(2)) + ",";
                            }
                          
                            var IndexMax = "";
                            var A = 0;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var DataArry = "";
                           
                            var ConverScoreA = "";
                            if (item.WD_Name.indexOf('男性') > -1) {
                                WDScoreA = Score;
                            }
                            else if (item.WD_Name.indexOf('女性') > -1) {
                                WDScoreB = Score;
                                ConverScoreA = eval((WDScoreA - WDScoreB) * 1.1 + 48.25);
                                ConverScoreA = ConverScoreA.toFixed(2);
                                if (ConverScoreA != null && ConverScoreA != "") {
                                    if (ConverScoreA < 50) {
                                        NormName = "女性化";
                                        Result += "  您的孩子在量表上的得分较低，表明孩子对自身性别的认识表现为女性化，可能表现为：喜欢娃娃方面的玩具，经常模仿妈妈会做的家务作为自己的游戏，并且扮演一些女性的身份；不喜欢攻击性的游戏，不喜欢冒险性的活动；喜欢干净整洁，爱漂亮等。";
                                        Proposal += "如果您的孩子是女孩，那从测试结果来看，孩子的行为举止符合她本身的性别特征，说明孩子对于自己的性别身份识别较好，建议家长能引导孩子继续保持这样的状态，让孩子形成良好的性别认同；如果您的孩子是男孩，那从测试结果来看，孩子的行为举止不太符合他本身的性别特征，说明孩子对于自己的性别身份识别不太到位，建议家长能够积极主动参与孩子的成长过程，多了解孩子在不同年龄身体和心理发展的特点，关注孩子内心的感受，为孩子提供积极健康的成长环境，多培养孩子男性化的意识和纠正其过于女性化的行为，可以通过阅读儿童发展方面的书籍，也可以通过参加一些亲子方面的活动进行了解、反思和改善，有意识地引导孩子关于男性性别身份的识别与认识。";
                                    } else if (ConverScoreA >= 50) {
                                        NormName = "男性化";
                                        Result = "您的孩子在量表上的得分较高，表明孩子对自身性别的认识表现为男性化，可能表现为：喜欢具有攻击性或是动手的玩具，喜欢体育运动；经常参与攻击性的游戏，或模仿男性的职业游戏；喜欢探索冒险，胆大好奇等。";
                                        Proposal += " 如果您的孩子是男孩，那从测试结果来看，孩子的行为举止符合他本身的性别特征，说明孩子对于自己的性别身份识别较好，建议家长能引导孩子继续保持这样的状态，让孩子形成良好的性别认同；如果您的孩子是女孩，那从测试结果来看，孩子的行为举止不太符合她本身的性别特征，说明孩子对于自己的性别身份识别不太到位，建议家长能够积极主动参与孩子的成长过程，多了解孩子在不同年龄身体和心理发展的特点，关注孩子内心的感受，为孩子提供积极健康的成长环境，多培养孩子女性化的意识和纠正其过于男性化的行为，可以通过阅读儿童发展方面的书籍，也可以通过参加一些亲子方面的活动进行了解、反思和改善，有意识地引导孩子关于女性性别身份的识别与认识。";
                                    }
                                }

                                datas15 += "{name:'" + "总评" + "',data:'" + ConverScoreA + "'},"

                                //循环遍历状态
                                //var CMScorce = item.Score.toFixed(2);
                                var Startsorse = "";
                                var Endsorse = "";


                                //CMNumber += "<div class=\"progress-barB \"style=\"width: " + CMLength * MaxScore + "%;text-align:right\">" + MaxScore + "</div>";
                                OperationList = item.Tz_List;
                                Allscore = item.Allscore;
                                var SectioName = "";
                                SectioName = "result" + SectionToChinese(index);
                                SectionValue = item.Result;
                                WdJsonName += "总评" + ",";

                                var PageHtml = "";
                                index++;
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\">" + TSLB15Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" >" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + ConverScoreA + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                                PageHtml += "</tr>";
                                $("#GetTableID tbody").append(PageHtml);
                            }
                            if (indexs == msgs.length && Lengths == TSLB15Index) {
                                chartjson(Slength, datas15);
                            };
                        });
                        TSLB15(Acode, sexval, Birthday);

                    }
                }
            });

        }




        var Slength18 = "";
        var datas18 = "";
        var TSLB18Index = 0;
        var Lengths = 0;      
        var MaxScore18 = 0;
        function TSLB18(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB18Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB18Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB18Index].AnswerID;
            var Ajson = AnswerRs[TSLB18Index].AnswerJson
            var scores = AnswerRs[TSLB18Index].score;
            TSLB18Index++;
            if (Slength == "") {
                Slength += TSLB18Index;
            } else {
                Slength += "," + TSLB18Index;
            }
            datas18 += "{name:'总评',data:'" + scores + "'},"
            var NormName = "";//状态           
            if (scores < 20) {
                NormName = "正常状态";             
            } else if (scores >= 20) {
                NormName = "异常状态";               
            }
            if (TSLB18Index == 1) {
                MaxScore18 = scores;
            } else {
                if (scores > MaxScore18)
                {
                    MaxScore18 = scores;
                }
            }
            var PageHtml = "";
            PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + TSLB18Index + "</td>";//之前是AR
            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + EndTime + "</td>";
            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
            PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + scores + "</td>";
            PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
            PageHtml += "</tr>";
            $("#GetTableID tbody").append(PageHtml);
            if (Lengths == TSLB18Index) {
                chartjson(Slength, datas18);
            }
            TSLB18(Acode, sexval, Birthday);
        }

        var Slength19 = "";
        var datas19 = "";
        var TSLB19Index = 0;
        var Lengths = 0;
        var MaxScore19 = 0;
        function TSLB19(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB19Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB19Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB19Index].AnswerID;
            var Ajson = AnswerRs[TSLB19Index].AnswerJson
            var scores = AnswerRs[TSLB19Index].score;         
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB19Index++;                  
                    var msg = a.responseText;
                    if (msg != "") {
                        var NormName = "";
                        AR++;
                        var msgs = eval(msg);
                        var sageOrder = msgs.sort(
           function (a, b) {
               return (b.Score - a.Score);
           });
                        var x1 = sageOrder[0].Score;
                        var x2 = sageOrder[1].Score;
                        var x3 = sageOrder[2].Score;
                        var x4 = sageOrder[3].Score;
                        if (eval(x1 - x2) >= 4) {
                            NormName = sageOrder[0].WD_Name;
                            //datas19 += "{name:'" + NormName + "',data:'" + x1 + "'}";
                            //Slength = x1;
                        } else if ((eval(x1 - x2 <= 3)) && (eval(x1 - x3 >= 4))) {
                           NormName = sageOrder[0].WD_Name + "-" + sageOrder[1].WD_Name
                           //datas19 += "{name:'" + NormName + "',data:'" + x1 + "'},{name:'" + NormName + "',data:'" + x2 + "'}";
                           //Slength = x1 + "," + x2;
                        } else if ((eval(x1 - x3 <= 3)) && eval(x1 - x4 >= 4)) {
                            NormName = sageOrder[0].WD_Name + "-" + sageOrder[1].WD_Name + "-" + sageOrder[2].WD_Name;
                            //datas19 += "{name:'" + NormName + "',data:'" + x1 + "'},{name:'" + NormName + "',data:'" + x2 + "'},{name:'" + NormName + "',data:'" + x3 + "'}";
                            //Slength = x1+"," + x2 +","+ x3;
                        }

                        else if (eval(x1 - x4 <= 3)) {
                            NormName = sageOrder[0].WD_Name + "-" + sageOrder[1].WD_Name + "-" + sageOrder[2].WD_Name + "-" + sageOrder[3].WD_Name;
                          
                        }
                        datas19 += "{name:'" + sageOrder[0].WD_Name + "',data:'" + x1 + "'},{name:'" + sageOrder[1].WD_Name + "',data:'" + x2 + "'},{name:'" + sageOrder[2].WD_Name + "',data:'" + x3 + "'},{name:'" + sageOrder[3].WD_Name + "',data:'" + x4 + "'},";
                        Slength = x1 + "," + x2 + "," + x3 + "," + x4;
                        var zt_Type = "";
                        zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;                      
                        var PageHtml = "";
                        PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + TSLB19Index + "</td>";//之前是AR
                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + EndTime + "</td>";
                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">--</td>";
                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                        PageHtml += "</tr>";
                        $("#GetTableID tbody").append(PageHtml);                     
                        if (Lengths == TSLB19Index) {
                            chartjson(Slength, datas19, -30, 30);
                        }
                        TSLB19(Acode, sexval, Birthday);
                    }

                }
            });
        }


        var Slength20 = "";
        var datas20= "";
        var TSLB20Index = 0;
        var Lengths = 0;
        var MaxScore20 = 0;
        function TSLB20(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB20Index >= AnswerRs.length) { 
                return;
            }
            var EndTime = AnswerRs[TSLB20Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB20Index].AnswerID;
            var Ajson = AnswerRs[TSLB20Index].AnswerJson
            var scores = AnswerRs[TSLB20Index].score;
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB20Index++;
                    var msg = a.responseText;
                    if (msg != "") {
                        var NormName = "";
                        AR++;
                        var msgs = eval(msg);                    
                        var x1 = msgs[0].Score;
                        var x2 = msgs[1].Score;                      
                        if ((x1 < 2 && x2 < 5) || (x1 >= 2 && x2 < 5)) {
                            NormName = "无强迫症状";                          
                        } else if (x1 >= 2 && x2 >= 5) {
                            NormName = "明显的强迫症状";                        
                        } else if (x1 < 2 && x2 >= 5) {
                            NormName = "无效";                       
                        }
                        datas20 += "{name:'" + msgs[0].WD_Name + "',data:'" + x1 + "'},{name:'" + msgs[1].WD_Name + "',data:'" + x2 + "'},";
                        Slength = x1 + "," + x2;
                        var zt_Type = "";
                        zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                        var PageHtml = "";
                        PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + TSLB20Index + "</td>";//之前是AR
                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan='1'>" + EndTime + "</td>";
                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">总评</td>";
                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">--</td>";
                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NormName + "</td>";
                        PageHtml += "</tr>";
                        $("#GetTableID tbody").append(PageHtml);
                        if (Lengths == TSLB20Index) {
                            chartjson(Slength, datas20, -30, 30);
                        }
                        TSLB20(Acode, sexval, Birthday);
                    }

                }
            });
        }

        //临床
        var Slength21 = "";
        var datas21 = "";
        var TSLB21Index = 0;
        var Lengths = 0;
        var MinScore = "";
        var MaxScore = "";
        function TSLB21(Acode, sexval, Birthday) {
            var AR = 0;
            var datas = "";
            Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB21Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB21Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB21Index].AnswerID;
            var Ajson = AnswerRs[TSLB21Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: Ajson,
                    types:21
                },
                complete: function (a, b) {
                    TSLB21Index++;

                    var msg = a.responseText;
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += TSLB21Index;
                    } else {
                        Slength += "," + TSLB21Index;
                    }
                    if (msg != "") {
                        AR++;
                        var msgs = eval(msg);
                        $.each(eval(msg), function (index, item) {
                            MinScore = item.MinScore;
                            MaxScore = item.MaxScore
                            var Seriesdata = "";
                            var Scores = "";
                            var standard = parseFloat(eval(item.ConversionFormula).toFixed(2));//标准分
                            var Originals = parseFloat(item.Score.toFixed(2));//原始分

                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + standard;
                                        }
                                    } else {
                                        Seriesdata += "," + standard;
                                    }
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                                var Forms = item.FormulaStr;
                                if (Forms != null && Forms != "") {
                                    MinScore = Forms.replace("Score", MinScore);
                                    MaxScore = Forms.replace("Score", MaxScore);
                                    MinScore = eval(MinScore).toFixed(2);
                                    MaxScore = eval(MaxScore).toFixed(2);
                                }
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += "," + Originals;
                                        }
                                    } else {
                                        Seriesdata += "," + Originals;
                                    }

                                } else {
                                    if (Acode == "LB_14810142054270") {
                                        if (item.WD_Name != "总评") {
                                            Seriesdata += Originals;
                                        }
                                    } else {
                                        Seriesdata += Originals;
                                    }
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            var WDName = "";
                            if (Acode == "LB_14810142054270") {
                                if (item.WD_Name != "总评") {
                                    WDName = item.WD_Name
                                }
                            } else {
                                WDName = item.WD_Name
                            }
                            datas21 += "{name:'" + WDName + "',data:'" + Seriesdata + "'},"

                            WdJsonName += "维度" + SectionToChinese(indexs);
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            for (var i = 0; i < cmmlists.length; i++) {

                                //区分性别和年龄
                                if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {
                                    if (cmmlists[i].NormSex == sexval && (cmmlists[i].NormStartAge < AgeVal < cmmlists[i].NormEndAge)) {
                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                            break;
                                        }
                                    }
                                } //不区分性别，区分年龄
                                else if (cmmlists[i].NormSex == 0 && (cmmlists[i].NormStartAge >= 0 && cmmlists[i].NormEndAge > 0)) {
                                    if (cmmlists[i].NormStartAge < AgeVal < cmmlists[i].NormEndAge) {
                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                            break;
                                        }
                                    }
                                }  //区分年龄,不区分性别
                                else if (cmmlists[i].NormSex > 0 && (cmmlists[i].NormStartAge == 0) && (cmmlists[i].NormEndAge == "0" || cmmlists[i].NormEndAge == "999")) {
                                    if (cmmlists[i].NormSex == sexval) {
                                        if (item.ScoreType == 1) {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                        }
                                        var Startstr = Startsorse.replace(/\≤/g, "<=");
                                        var Endstr = Endsorse.replace(/\≤/g, "<=");
                                        var TsStart = eval(Startstr);
                                        var Tsend = eval(Endstr);
                                        if (TsStart && Tsend) {
                                            NormName = cmmlists[i].NormName;
                                            Result = cmmlists[i].Result;
                                            Proposal = cmmlists[i].Proposal;
                                            break;
                                        }
                                    }
                                }//年龄和性别不区分
                                else {

                                    if (item.ScoreType == 1) {
                                        Startsorse = cmmlists[i].StartScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                        Endsorse = cmmlists[i].EndScore.replace("Scores", eval(item.ConversionFormula).toFixed(2));
                                    } else {
                                        Startsorse = cmmlists[i].StartScore.replace("Scores", item.Score.toFixed(2));
                                        Endsorse = cmmlists[i].EndScore.replace("Scores", item.Score.toFixed(2));
                                    }
                                    var Startstr = Startsorse.replace(/\≤/g, "<=");
                                    var Endstr = Endsorse.replace(/\≤/g, "<=");
                                    var TsStart = eval(Startstr);
                                    var Tsend = eval(Endstr);
                                    if (TsStart && Tsend) {
                                        NormName = cmmlists[i].NormName;
                                        Result = cmmlists[i].Result;
                                        Proposal = cmmlists[i].Proposal;
                                        break;
                                    }
                                }

                            }
                            //状态
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB21Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + EndTime + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + item.WD_Name + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                PageHtml += "</tr>";
                            } else {
                                PageHtml += " <tr>";
                                PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + item.WD_Name + "</td>";
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                PageHtml += "  </tr>";
                            }

                            $("#GetTableID tbody").append(PageHtml);
                            if (indexs == msgs.length && Lengths == TSLB21Index) {
                                chartjson(Slength, datas21, MinScore, MaxScore);
                            }
                        });
                        TSLB21(Acode, sexval, Birthday);

                    }
                }
            });

        }
        function DrawWD_Analysis(EndTime, AnswerJson, Sindexs, lengths, sexval, AgeVal) {
            var AR = 0;
            $.ajax({
                type: "POST",
                url: "Ajax/EvaluationFiles.ashx?type=GetAnswerR",
                data: {
                    Remark: "InitWDPages",
                    A_code: getUrlParam("Acode"),
                    An_json: AnswerJson
                },//要执行查询的数据参数
                success: function (msg) {


                }
            });

        }
        function chartjson(Slengths, datas) {
            Slengths = Slengths.split(',')
            var datass = datas;
            var titles = Title
            datas = eval('[' + datas + ']')
            var ED_List = "";
            var JsonList = "";
            JsonList += "";
            $.each(datas, function (index, obj) {
                if (ED_List != "") {
                    if (ED_List.indexOf(obj.name) < 0) {
                        ED_List += "," + obj.name;
                    }
                } else {
                    ED_List += obj.name;
                }
            });

            if (ED_List != "") {

                var ArrED = ED_List.split(',');
                if (ArrED != null && ArrED.length > 0) {

                    var JsonEntity = eval(datas);

                    for (var k = 0; k < ArrED.length; k++) {
                        var SexStr = "";
                        for (var j = 0; j < JsonEntity.length; j++) {

                            if (ArrED[k] == JsonEntity[j].name) {

                                if (SexStr == "" || SexStr == null) {
                                    SexStr += JsonEntity[j].data
                                } else {
                                    SexStr += "," + JsonEntity[j].data;
                                }

                            }

                        }

                        if (k != 0) {
                            JsonList += ",";
                        }
                        JsonList += "{name:\"" + ArrED[k] + "\",data\:[" + SexStr + "]}";
                    }
                }
            }
            JsonList = eval('[' + JsonList + ']')
            //alert(JsonList);
            $('#container').highcharts({
                title: {
                    text: Title,
                    x: -20 //center
                },

                xAxis: {
                    title: {
                        text: "作答次数"
                    },
                    categories: Slengths
                },
                yAxis: {
                    title: {
                        text: "状态"
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '分数'
                }, exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: JsonList
            });
        }
         
        //Highcharts
        function chartjsontype(Slengths, datas) {
            Slengths = Slengths.split(',')
            var datass = datas;
            var titles = Title
            datas = eval('[' + datas + ']')
            var ED_List = "";
            var JsonList = "";
            JsonList += "";
            var Numbers = 0;
            $.each(datas, function (index, obj) {
                if (ED_List != "") {
                    if (ED_List.indexOf(obj.name)<0) {
                        ED_List += "," + obj.name;
                    }
                    if (Numbers <= 0) {
                        if (obj.name == "成熟防御机制") {
                            Numbers++
                            ED_List += "," + obj.name;
                        }
                    }
                } 
                else {
                    ED_List += obj.name;
                }
            });

            if (ED_List != "") {

                var ArrED = ED_List.split(',');
                if (ArrED != null && ArrED.length > 0) {

                    var JsonEntity = eval(datas);

                    for (var k = 0; k < ArrED.length; k++) {
                        var SexStr = "";
                        for (var j = 0; j < JsonEntity.length; j++) {

                            if (ArrED[k] == JsonEntity[j].name) {

                                if (SexStr == "" || SexStr == null) {
                                    SexStr += JsonEntity[j].data
                                } else {
                                    SexStr += "," + JsonEntity[j].data;
                                }

                            }

                        }

                        if (k != 0) {
                            JsonList += ",";
                        }
                        JsonList += "{name:\"" + ArrED[k] + "\",data\:[" + SexStr + "]}";
                    }
                }
            }
            JsonList = eval('[' + JsonList + ']')
            //alert(JsonList);
            $('#container').highcharts({
                title: {
                    text: Title,
                    x: -20 //center
                },

                xAxis: {
                    title: {
                        text: "作答次数"
                    },
                    categories: Slengths
                },
                yAxis: {
                    title: {
                        text: "状态"
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '分数'
                }, exporting: { enabled: false },//隐藏导出图片  
                credits: { enabled: false },//隐藏highcharts的站点标志
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: JsonList
            });
        }
        //转换大写
        var chnNumChar = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
        var chnUnitSection = ["", "万", "亿", "万亿", "亿亿"];
        var chnUnitChar = ["", "十", "百", "千"];

        function SectionToChinese(section) {
            var strIns = '', chnStr = '';
            var unitPos = 0;
            var zero = true;
            while (section > 0) {
                var v = section % 10;
                if (v === 0) {
                    if (!zero) {
                        zero = true;
                        chnStr = chnNumChar[v] + chnStr;
                    }
                } else {
                    zero = false;
                    strIns = chnNumChar[v];
                    strIns += chnUnitChar[unitPos];
                    chnStr = strIns + chnStr;
                }

                unitPos++;
                section = Math.floor(section / 10);

            }
            if (chnStr.indexOf("一十") >= 0 && chnStr.length <= 3) {
                chnStr = chnStr.replace("一十", "十");
            }
            return chnStr;
        }
        function Export() {
            //var svgFirst;

            //chartFirst = $('#container').highcharts();
            //svgFirst = chartFirst.getSVG();
            //$.ajax({
            //    url: "Ajax/EvaluationFiles.ashx?type=SaveImage",
            //    type: "post",
            //    async: false,
            //    data: { svg: svgFirst },
            //    success: function (result) {
            //        var ImageSrc = "Ajax/image/" + result;

            //        var image = new Image();
            //        image.src = ImageSrc;
            //        image.onload = function () {
            //            var base64s = getBase64Image(image);
            //            $("#imagescr").attr("src", base64s);
            //            $("#container").hide();
            //            $("#ContainerImage").show();
            //            $("#pagecontent").wordExport(AmountName);
            //            $("#ContainerImage").hide();
            //            $("#container").show();
            //        }

            //        //WordExport();
            //    }
            //});
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
                $("#pagecontent").wordExport(AmountName);
                $("#ContainerImage").hide();
                $("#container").show();
                window.clearTimeout(timeout);
            }, 500)
        }
        //计算年月日天数
        function DateDiff(sDate1, sDate2) {  //sDate1和sDate2是yyyy-MM-dd格式

            var aDate, oDate1, oDate2, iDays;
            aDate = sDate1.split("-");
            oDate1 = new Date(sDate1.replace("-", "/").replace("-", "/"));  //转换为yyyy-MM-dd格式
            aDate = sDate2.split("-");
            oDate2 = new Date(sDate2.replace("-", "/").replace("-", "/"));
            var IDays = parseInt(Math.abs(oDate1 - oDate2));
            var results = getDifference(IDays);



            return results;

        }

        function getDifference(period) {
            var yearLevelValue = 365 * 24 * 60 * 60 * 1000;
            var monthLevelValue = 30 * 24 * 60 * 60 * 1000;
            var dayLevelValue = 24 * 60 * 60 * 1000;
            var hourLevelValue = 60 * 60 * 1000;
            var minuteLevelValue = 60 * 1000;
            var secondLevelValue = 1000;
            /*******计算出时间差中的年、月、日、天、时、分、秒*******/
            var year = parseInt(getYear(period));
            var month = parseInt(getMonth(period - year * yearLevelValue));
            var result = 0;
            if (year != 0) {
                result = year;
            }


            function getYear(period) {
                return parseInt(period) / yearLevelValue;
            }
            function getMonth(period) {
                return parseInt(period) / monthLevelValue;
            }
            return result;
        }

        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }
        function reti() {
            window.close();
        }
        function getBase64Image(img) {
            var canvas = document.createElement("canvas");
            canvas.width = img.width;
            canvas.height = img.height;
            var ctx = canvas.getContext("2d");
            ctx.drawImage(img, 0, 0, img.width, img.height);
            var ext = img.src.substring(img.src.lastIndexOf(".") + 1).toLowerCase();
            var dataURL = canvas.toDataURL("image/" + ext);
            return dataURL;
        }
       
    </script>
    <div class="col-md-12 col-sm-12" id="Print" style="padding-left: 0px;padding-right: 0px;">
        <div class="well" style="overflow-y: scroll">
            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;" id="pagecontent">
                <div class="col-md-12 col-sm-12  text-align: center;">
                    <h4 style="font-size: 22px; font-weight: 700; text-align: center;" id="ReportTitle"></h4>
                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        一、基本信息
                    </div>
                    <div class="col-md-12" style="margin-top: 15px;" id="UserTable">
                        <table class="MsoTableGrid" style="border-collapse: collapse; width: 100%; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt;">
                            <tbody>
                                <tr>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                </tr>
                                <tr>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                </tr>
                                <tr>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                    <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height: 30px;" valign="top" width="110"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        二、量表介绍
                    </div>
                    <div id="LB" style="margin-top: 15px; line-height: 30px; font-size: 12px;text-indent:2em;"></div>

                </div>


                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        三、历次作答记录
                    </div>
                    <div class="col-md-12">
                        <div id="GetTableID" style="margin-top: 15px;">

                            <table class="MsoTableGrid" style="border-collapse: collapse; mso-table-layout-alt: fixed; mso-padding-alt: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; width: 100%">
                                <tbody>
                                    <tr id="GetTR">
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">序号</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">时间</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">维度</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">得分</td>
                                        <td style="border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight: bold; line-height: 30px;" valign="top" width="110">状态</td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold; font-size: 20px;">
                        四、心理测评趋势图
                    </div>
                    <div id="container" style="margin-top: 15px;">
                        <div  style="float:right">
                            <span>作答次数</span>
                        </div>
                    </div>
                    <div class="row" style="text-align: center; width: 100%; display: none" id="ContainerImage">
                        <%--<img"/>--%>
                        <image id="imagescr" width="600px" height="400px"></image>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-bottom: 10px;">
            <div class="col-md-5 col-sm-5 col-xs-5  text-right">
                <button type="button" class="btn btn-sm" style="background-color: orange; color: white" id="export" onclick="Export()">
                    导出 
                </button>
            </div>
            <div class="col-md-3 col-sm-2 col-xs-5 text-center">
                <button type="button" class="btn btn-primary btn-sm"  data-dismiss="modal" onclick="reti()">
                    关闭
                </button>
            </div>
        </div>
    </div>
</asp:Content>
