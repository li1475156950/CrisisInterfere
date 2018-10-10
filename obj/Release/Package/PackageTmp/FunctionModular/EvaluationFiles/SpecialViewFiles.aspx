<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SpecialViewFiles.aspx.cs" Inherits="CrisisInterfere.FunctionModular.EvaluationFiles.SpecialViewFiles" %>
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
      .progress-bar-success{
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
        //$("#XLID").show();
        var navName = '/FunctionModular/EvaluationFiles/EvaluationFiles.aspx';
        var Title = "";
        var categoriedata = [];
       
        var Anwers = 0;
        var AnswerR = "";
        var AnswerRs = "";
        var AmountName = "";
        $(function () {

            //动态获取图表
            GetViewFiles();

            function GetViewFiles() {
                var Sindexs = 0;
                var Acode = getUrlParam("Acode");
                var UserName = getUrlVars('names');
                var UserName = decodeURI(UserName.names);
                var UID = getUrlParam("UIDs");
                $.ajax({
                    url: "Ajax/SpecialViewFiles.ashx?type=GetView",
                    data: { Acode: Acode, UserName: UserName ,UIDs: UID },
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
                        var Birthday = obj.UserInfo.U_Birthday;
                        var findtable = $("#pagecontent").find("table");
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(0)").text("登录名：" + obj.UserInfo.LoginName);
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(1)").text("姓名：" + obj.UserInfo.Name);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(0)").text("性别：" + obj.UserInfo.Sex);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(1)").text("部门：" + obj.UserInfo.D_name);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(0)").text("出生日期：" + obj.UserInfo.U_Birthday);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(1)").text("完成次数：" + obj.UserInfo.AllCount);
                        $("#LB").html(obj.UserInfo.Amount_Guidance);
                        Anwers = obj.AnswerInfo;
                        //for (var i = 0; i < obj.AnswerInfo.length; i++) {
                        //    categoriedata[i] = obj.AnswerInfo[i].Answer_CreateTime
                        //    Sindexs++;
                        //    AnswerR = obj.AnswerInfo[i].AnswerJson;
                           
                           
                        //}
                        AnswerRs = obj.AnswerInfo;                     
                        var GetType = getUrlParam("types");
                        var AmountCode = getUrlParam("Acode");                  
                       
                        Title = obj.UserInfo.Amount_Name;
                        if (GetType==1) {
                            TSLB1(AmountCode, sexval, GetType, Birthday);//加载维度总评
                        }
                       else if (GetType == 3) {
                            $("#XLCP").show();
                            TSLB3(AmountCode, sexval, GetType, Birthday);//加载维度总评
                            
                        } if (GetType == 4) {
                            $("#XLCP").show();
                            TSLB4(AmountCode, sexval, GetType, Birthday);//加载维度总评
                            
                        }
                        else if (GetType == 6)
                        {
                            $("#XLCP").show();
                            TSLB6(AmountCode, sexval, GetType, Birthday);//加载维度总评
                           
                        } else if (GetType == 8)
                        {
                            $("#XLCP").hide();
                            TSLB8(AmountCode, sexval, GetType, Birthday);//加载维度总评
                           
                        } else if (GetType == 9)
                        {
                            $("#XLCP").show();
                            TSLB9(AmountCode, sexval, GetType, Birthday);
                            
                        } else if (GetType == 901)
                        {
                            $("#XLCP").show();
                            TSLB901(AmountCode, sexval, GetType, Birthday);
                            
                        } else if (GetType == 11)
                        {
                            $("#XLCP").show();
                            TSLB11(AmountCode, sexval, GetType, Birthday);
                            
                        } else if (GetType == 12)
                        {
                            TSLB12(AmountCode, sexval, GetType, Birthday);
                        }
                    }

                })

            }

        });


        //导出
        function WordExport() {
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
            //$("#container").hide();
            //$("#ContainerImage").show();
            //$("#pagecontent").wordExport(AmountName);
            //$("#ContainerImage").hide();
            //$("#container").show();
        }
        //获取url中的参数
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
            var r = window.location.search.substr(1).match(reg);  //匹配目标参数
            if (r != null) return unescape(r[2]); return null; //返回参数值
        }
        function OcExit() {

            window.location.href = "EvaluationFiles.aspx"

        }
        //获取作答记录表
        var ConverScore = "";
        
        /*--------------维度解释解析-----------*/
        var TypesS = "";
        var OperationList;
        function TSLB1_RW(Acode, HZBScore, sexval, AgeVal, GetType) {
            var ConverScores = 0;
            $.ajax({
                type: "POST",
                async: false,
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "TSLBJson",
                    TSLBType: "TSLBRW"
                },
                success: function (msg) {
                    TJFZ_Json = msg;
                    if (TJFZ_Json != "") {
                        HZBScore = eval(HZBScore);
                        var TJFZ_List = eval(TJFZ_Json);
                        for (var t = 0; t < TJFZ_List.length; t++) {

                            var HZBShScore = eval(TJFZ_List[t].Valie);
                            if (AgeVal < 17) {
                                if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == AgeVal) {
                                    ConverScore = TJFZ_List[t].HZB;//从数据库取的相应年龄段的分数
                                    ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                    Types = 2;
                                    break;
                                } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                    ConverScores = TJFZ_List[t].HZB;
                                    Types = 1;
                                    break;
                                }
                            } else {
                                if (17 <= AgeVal && AgeVal < 20) {
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 17) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        Types = 2;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                } else if (20 <= AgeVal && AgeVal < 30) {
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 20) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                } else if (30 <= AgeVal && AgeVal < 40) {
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 30) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                } else if (40 <= AgeVal && AgeVal < 50) {
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 40) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                } else if (50 <= AgeVal && AgeVal < 60) {
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 50) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                } else if (60 <= AgeVal && AgeVal < 70) {
                                    if (HZBScore < HZBShScore && TJFZ_List[t].ZZB == 60) {
                                        ConverScore = TJFZ_List[t].HZB;
                                        ConverScores = eval(ConverScore - 0.5);//根据原始分数得到转换分数
                                        Types = 2;
                                        break;
                                    } else if (HZBShScore == HZBScore && TJFZ_List[t].ZZB == AgeVal) {
                                        ConverScores = TJFZ_List[t].HZB;
                                        Types = 1;
                                        break;
                                    }
                                }
                            }

                        }


                    }
                }
            });
            return ConverScores;
        }
        var Slength1 = "";
        var datas1 = "";
        var WdJsonName = "";
        var TSLB1Index = 0;//退出递归的条件变量
        var ConverScoresA = "";
        var HZBScore = "";
        function TSLB1(Acode, sexval, GetType, Birthday) {

            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB1Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB1Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB1Index].AnswerID;
            HZBScore = AnswerRs[TSLB1Index].score;
            var Ajson = AnswerRs[TSLB6Index].AnswerJson
         ConverScoresA= TSLB1_RW(Acode, HZBScore, sexval, AgeVal, GetType)
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,
                    types: GetType,
                    An_json: Ajson
                },
                complete: function (a, b) {

                    var indexs = 0;
                    TSLB1Index++;
                    if (Slength1 == "") {
                        Slength1 += TSLB1Index;
                    } else {
                        Slength1 += "," + TSLB1Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        $.each(msgs.datas, function (index, item) {

                            indexs++;
                            var Seriesdata = "";
                            var Scores = "";
                            var Score = HZBScore;
                            if (ConverScoresA != null && ConverScoresA != "") {
                                Scores = ConverScoresA;
                                if (Seriesdata != null && Seriesdata != "") {
                                    Seriesdata += "," + ConverScoresA;
                                } else {
                                    Seriesdata += ConverScoresA;
                                }
                            } else {
                                Scores = Score;
                                if (Seriesdata != null && Seriesdata != "") {
                                    Seriesdata += "," + Score;
                                } else {
                                    Seriesdata += Score;
                                }
                            }
                                                    
                            datas6 += "{name:'" + "总评" + "',data:'" + Seriesdata + "'},"
                            //alert(datas);
                            var currentRow = $('#GetTableID>table>tbody tr:eq(' + index + ')');
                            //indexs
                           var cmmlists = item.CmmodelList;
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                            if (cmmlists.length > 0) {
                                for (var i = 0; i < cmmlists.length; i++) {
                                    Startsorse = cmmlists[i].StartScore.replace("Scores", ConverScoresA);
                                    Endsorse = cmmlists[i].EndScore.replace("Scores", ConverScoresA);
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
                            var ConverscorsB = "";
                            if (TypesS == 1) {
                                ConverscorsB =ConverScoresA;
                            } else if (TypesS == 2) {
                                ConverscorsB = "--";
                            }
                            scorejson += parseFloat(HZBScore) + ",";
                            WdJsonName += "总评" + ",";
                            //状态
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + TSLB1Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + EndTime + "</td>";
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
                            if (indexs == msgs.datas.length && Lengths == TSLB1Index) {
                                chartjson(Slength1, datas6);
                            }
                        });
                        TSLB1(Acode, sexval, GetType, Birthday);
                    }
                }
            });

        }
     
        var Slength3 = "";
        var datas3 = "";
        var WdJsonName = "";
        var TSLB3Index = 0;//退出递归的条件变量
        function TSLB3(Acode, sexval, GetType, Birthday) {          
           
            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB3Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            } 
            var EndTime=AnswerRs[TSLB3Index].Answer_CreateTime;
           var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB3Index].AnswerID;          
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,                
                    types: GetType,
                },
                complete: function (a, b) {

                    var indexs = 0;
                    TSLB3Index++;
                    if (Slength3 == "") {
                        Slength3 += TSLB3Index;
                    } else {
                        Slength3 += "," + TSLB3Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        $.each(msgs.datas, function (index, item) {
                           
                            indexs++;
                            var Seriesdata = "";
                            var Scores = "";
                            var Score = item.Score.toFixed(2);
                            if (Seriesdata != null && Seriesdata != "") {
                                Seriesdata += "," + Score;
                            } else {
                                Seriesdata += Score;
                            }
                            Scores = Score;
                            datas6 += "{name:'" + "总评" + "',data:'" + Seriesdata + "'},"
                            //alert(datas);
                            var currentRow = $('#GetTableID>table>tbody tr:eq(' + index + ')');
                            //indexs
                         
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";                        
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                            scorejson += parseFloat(item.Score.toFixed(2)) + ",";                                                   
                            WdJsonName += "总评" + ",";                         
                            //状态
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB3Index + "</td>";//之前是AR
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
                            if (indexs == msgs.datas.length && Lengths == TSLB3Index) {
                                chartjson(Slength3,datas6);
                            }
                        });
                        TSLB3(Acode, sexval, GetType, Birthday);
                    }
                }
            });

        }
        //特殊量表4
        var TSLB4Index = 0;//退出递归的条件变量
        function TSLB4(Acode, sexval, GetType, Birthday) {
            var Slength = "";
            var datas = "";
            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB4Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB4Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB4Index].AnswerID;
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,
                    types: GetType,
                },
                complete: function (a, b) {

                    var indexs = 0;
                    TSLB4Index++;
                    if (Slength == "") {
                        Slength += TSLB4Index;
                    } else {
                        Slength += "," + TSLB4Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        $.each(msgs.datas, function (index, item) {

                            indexs++;
                            var Seriesdata = "";
                            var Scores = "";
                            var Score = item.Score.toFixed(2);
                            if (Seriesdata != null && Seriesdata != "") {
                                Seriesdata += "," + Score;
                            } else {
                                Seriesdata += Score;
                            }
                            Scores = Score;
                            datas += "{name:'" + "总评" + "',data:'" + Seriesdata + "'},"
                            //alert(datas);
                            var currentRow = $('#GetTableID>table>tbody tr:eq(' + index + ')');
                            //indexs

                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";

                            NormName = item.NormName;
                            Result = item.Result;
                            Proposal = item.Proposal;
                            scorejson += parseFloat(item.Score.toFixed(2)) + ",";
                            WdJsonName += "总评" + ",";
                            //状态
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
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

                            currentRow.after(PageHtml);
                            if (indexs == msgs.datas.length && Lengths == TSLB4Index) {
                                chartjson(Slength, datas);
                            }
                        });
                        TSLB4();
                    }
                }
            });

        }
        //特殊量表6
        var Slength6 = "";
        var datas6 = "";     
        var TSLB6Index = 0;
        function TSLB6(Acode, sexval, GetType, Birthday) {
            var Slength = "";
            var datas = "";
            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB6Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB6Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB6Index].AnswerID;
            var Ajson = AnswerRs[TSLB6Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,
                    types: GetType,
                    An_json: Ajson
                },
                complete: function (a, b) {
                    TSLB6Index++;
                    var indexs = 0;
                  
                    if (Slength6 == "") {
                        Slength6 += TSLB6Index;
                    } else {
                        Slength6 += "," + TSLB6Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                        $.each(msgs.datas, function (index, item) {

                            var Seriesdata = "";
                            var Scores = "";
                            var standard = Math.floor(eval(item.ConversionFormula));//标准分
                            var Originals = Math.floor(item.Score);//原始分
                            if (item.ScoreType == 1) {
                                if (Seriesdata != null && Seriesdata != "") {
                                    Seriesdata += "," + standard;
                                } else {
                                    Seriesdata += standard;
                                }
                                Scores = standard;
                            } else {
                                if (Seriesdata != null && Seriesdata != "") {
                                    Seriesdata += "," + Originals;
                                } else {
                                    Seriesdata += Originals;
                                }
                                Scores = Originals;

                            }
                            indexs++;
                            datas6 += "{name:'" + "维度" + SectionToChinese(indexs) + "',data:'" + Seriesdata + "'},"
                            //alert(datas);
                            var currentRow = $('#GetTableID>table>tbody tr:eq(' + index + ')');
                            //indexs
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
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        } else {
                                            Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                            Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                                        Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                        Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(eval(item.ConversionFormula)));
                                    } else {
                                        Startsorse = cmmlists[i].StartScore.replace("Scores", Math.floor(item.Score));
                                        Endsorse = cmmlists[i].EndScore.replace("Scores", Math.floor(item.Score));
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
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.length + ">" + TSLB6Index + "</td>";//之前是AR
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
                            if (indexs == msgs.datas.length && Lengths == TSLB6Index) {
                                chartjson(Slength6, datas6);
                            }
                        });
                        TSLB6(Acode, sexval, GetType, Birthday);
                    }
                }
            });

        }
        var Slength8 = "";
        var datas8 = "";
        var WdJsonName = "";
        var TSLB8Index = 0;//退出递归的条件变量
        function TSLB8(Acode, sexval, GetType, Birthday) {

            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB8Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB8Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB8Index].AnswerID;
            var Ajson = AnswerRs[TSLB6Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,
                    types: GetType,
                    An_json: Ajson,

                },
                complete: function (a, b) {

                    var indexs = 0;
                    TSLB8Index++;
                    if (Slength8 == "") {
                        Slength8 += TSLB8Index;
                    } else {
                        Slength8 += "," + TSLB8Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                     var   MaxminScor = msgs.MaxminScore;
                        var sageOrder = MaxminScor.sort(
               function (a, b) {
                   return (b.HLDvalues - a.HLDvalues);

                   return 0;
               });

                        var scores01 = 0;
                        var scores02 = 0;
                        var scores03 = 0;
                        var ZHCode = ""; //组合代码：比如4              
                        var NameZH = "";//组合名称
                        var ZHCodeA = "";//组合代码A
                        var ZHCodeB = "";
                        var ZHCodeC = "";
                        var ALlCodeA = "";//最终组合代码
                        var NameA = "";
                        var NameB = "";
                        var NameC = "";
                        var AllLengthA = msgs.datas.length;
                        $.each(MaxminScor, function (i, item) {
                            if (i < 3) {

                                if (i == 0) {
                                    NameA = item.HLDCode;;//是否包含R,I代码
                                    NameZH += item.HLDname;
                                    ALlCodeA += item.HLDCode;
                                    ZHCodeA = item.HLDCode;
                                    scores01 = item.HLDvalues;
                                    AllLengthA = AllLengthA + 1;
                                } else if (i == 1) {

                                    NameZH += item.HLDname;

                                    scores02 = item.HLDvalues;
                                    if (scores01 == scores02) {

                                        NameB = item.HLDCode;
                                        ZHCodeB = item.HLDCode;
                                        ALlCodeA += item.HLDCode;
                                        AllLengthA = AllLengthA + 1;

                                    } else {
                                        ALlCodeA += item.HLDCode;
                                    }
                                } else if (i == 2) {
                                    NameZH += item.HLDname;
                                    scores03 = item.HLDvalues;
                                    if (scores01 == scores03)//主代码重复的
                                    {
                                        NameC = item.HLDCode;
                                        AllLengthA = AllLengthA + 1;
                                    }
                                    if (scores01 == scores02 && scores01 == scores03 && scores02 == scores03) {
                                        ZHCodeC = item.HLDCode;
                                        ALlCodeA += ZHCodeA + ZHCodeB + ZHCodeC + ",";
                                        ALlCodeA += ZHCodeA + ZHCodeC + ZHCodeB + ",";
                                        ALlCodeA += ZHCodeB + ZHCodeA + ZHCodeC + ",";
                                        ALlCodeA += ZHCodeB + ZHCodeC + ZHCodeA + ",";
                                        ALlCodeA += ZHCodeC + ZHCodeA + ZHCodeB + ",";
                                        ALlCodeA += ZHCodeC + ZHCodeB + ZHCodeA + ",";
                                    }
                                    else if (scores01 == scores02) {
                                        ZHCodeC = item.HLDCode;
                                        ZHCode = ZHCodeA + ZHCodeB + ZHCodeC;
                                        ALlCodeA = ZHCode + "," + ZHCodeB + ZHCodeA + ZHCodeC;
                                    } else if (scores02 == scores03) {
                                        ZHCodeC = item.HLDCode;
                                        ZHCode = ZHCodeA + ZHCodeB + ZHCodeC;
                                        ALlCodeA = ZHCode + "," + ZHCodeA + ZHCodeC + ZHCodeB;
                                    }
                                    else {
                                        ALlCodeA += item.HLDCode;
                                    }
                                }
                            }
                        });
                        ALlCodeA = ALlCodeA.split(',');
                        AllLengthA = AllLengthA + ALlCodeA.length;
                        $.each(msgs.datas, function (index, item) {

                            
                            var Seriesdata = "";
                            var Scores = "";
                            var Score = item.Score.toFixed(2);
                            if (Seriesdata != null && Seriesdata != "") {
                                Seriesdata += "," + Score;
                            } else {
                                Seriesdata += Score;
                            }
                            Scores = Score;
                            var cmmlists = item.CmmodelList;
                            //循环遍历状态
                            //var CMScorce = item.Score.toFixed(2);
                            var Startsorse = "";
                            var Endsorse = "";
                           
                            //状态
                            if (cmmlists.length > 0) {
                                NormName = cmmlists[0].NormName;
                                Result = cmmlists[0].Result;
                                Proposal = cmmlists[0].Proposal;
                                var zt_Type = "";
                                if (cmmlists[0].NormName.indexOf(NameA) >-1) {
                                    var AllName = "";
                                    if (cmmlists[0].NormName.indexOf(NameA) > 0)
                                    {
                                        AllName = NameA;
                                    } else if (cmmlists[0].NormName.indexOf(NameB) > 0) {
                                        AllName = NameB;
                                    } else if (cmmlists[0].NormName.indexOf(NameC) > 0) {
                                        AllName = NameC;
                                    }
                                    indexs++;
                                    scorejson += parseFloat(Math.floor(item.Score)) + ",";
                                    zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                                    var PageHtml = "";
                                    index++;
                                    if (indexs == 1) {
                                        PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + AllLengthA + ">" + TSLB3Index + "</td>";//之前是AR
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + AllLengthA + ">" + EndTime + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + AllName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                        PageHtml += "</tr>";
                                    } else {
                                        PageHtml += " <tr>";
                                        PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + AllName + "</td>";
                                        PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                        PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + zt_Type + "</td>";
                                        PageHtml += "  </tr>";
                                    }

                                    $("#GetTableID tbody").append(PageHtml);

                                }
                            }
                            });
                        if (ALlCodeA != null) {
                          
                          
                            $.each(ALlCodeA, function (index, value) {
                             
                                indexs++;                                                              
                                Scores = eval(scores01 + scores02 + scores03);
                                var PageHtml = "";
                                if (indexs == 1) {
                                  
                                    PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + AllLengthA + ">" + TSLB8Index + "</td>";//之前是AR
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + AllLengthA + ">" + EndTime + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + value + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                    PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NameZH + "</td>";
                                    PageHtml += "</tr>";
                                } else {
                                    PageHtml += " <tr>";
                                    PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + value + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + Scores + "</td>";
                                    PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NameZH + "</td>";
                                    PageHtml += "  </tr>";
                                }

                                $("#GetTableID tbody").append(PageHtml);
                            });

                            }
                        TSLB8(Acode, sexval, GetType, Birthday);
                    }
                }
            });

        }
        //特殊量表9
        var Slength9 = "";
        var datas9= "";
        var WdJsonName = "";
        var TSLB9Index = 0;//退出递归的条件变量
        function TSLB9(Acode, sexval, GetType, Birthday)
        {
            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB9Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB9Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB9Index].AnswerID;
            var Ajson = AnswerRs[TSLB9Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,
                    types: GetType,
                    An_json: Ajson
                },
                complete: function (a, b) {

                    var indexs = 0;
                    TSLB9Index++;
                    if (Slength9 == "") {
                        Slength9 += TSLB9Index;
                    } else {
                        Slength9 += "," + TSLB9Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
                       
                        $.each(msgs.datas, function (index, item) {

                           
                            var scorejson = "";
                            var Scores = "";
                            var Startsorse = "";
                            var Endsorse = "";
                            var Score = item.Score.toFixed(2);
                            if (index == 1) {
                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 10.93) / 4.15) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.93) / 4.15) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.93) / 4.15) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 11.39) / 4.78) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.93) / 4.78) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.93) / 4.78) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 11.43) / 4.47) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.93) / 4.47) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.93) / 4.47) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 10.15) / 4.25) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.15) / 4.25) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.15) / 4.25) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 9.69) / 3.97) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.69) / 3.97) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.69) / 3.97) * 10) + 50).toFixed(2);
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 11.36) / 3.85) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.36) / 3.85) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.36) / 3.85) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 9.65) / 4.04) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.65) / 4.04) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.65) / 4.04) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 11.43) / 4.47) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.43) / 4.47) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.43) / 4.47) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 9.72) / 3.92) * 10) + 50).toFixed(2));
                                            MinScore = eval((((MinScore - 9.72) / 3.92) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((MaxScore - 9.72) / 3.92) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 6.89) / 2.42) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 6.89) / 2.42) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 6.89) / 2.42) * 10) + 50).toFixed(2);
                                        }
                                    }
                                    if (scorejson == null || scorejson == "") {
                                        scorejson += Score;
                                    } else {
                                        scorejson += ","+ Score;
                                    }
                                }
                            } else if (index == 2) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 11.59) / 5.25) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.59) / 5.25) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.59) / 5.25) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((Score - 11.49) / 4.80) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Score - 11.49) / 4.80) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Score - 11.49) / 4.80) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 9.58) / 4.76) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.58) / 4.76) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.58) / 4.76) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 11.69) / 5.15) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.69) / 5.15) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.69) / 5.15) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 10.31) / 4.07) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.31) / 4.07) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.31) / 4.07) * 10) + 50).toFixed(2);
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 12.28) / 5.27) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 12.28) / 5.27) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 12.28) / 5.27) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 12.73) / 4.81) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 12.73) / 4.81) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 12.73) / 4.81) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 11.00) / 4.54) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.00) / 4.54) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.00) / 4.54) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 10.03) / 4.38) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.03) / 4.38) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.03) / 4.38) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 11.67) / 4.71) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.67) / 4.71) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.67) / 4.71) * 10) + 50).toFixed(2);
                                        }//25
                                    }
                                    if (scorejson == null || scorejson == "") {
                                        scorejson += Score;
                                    } else {
                                        scorejson += "," + Score;
                                    }

                                } else {
                                    Score = Math.floor(item.Score);
                                    if (scorejson == null || scorejson == "") {
                                        scorejson += Score;
                                    } else {
                                        scorejson += "," + Score;
                                    }

                                }

                            } else if (index == 3) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 7.09) / 3.01) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.09) / 3.01) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.09) / 3.01) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 8.36) / 3.65) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.36) / 3.65) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.36) / 3.65) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 8.25) / 4.19) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.25) / 4.19) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.25) / 4.19) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 7.03) / 4.12) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.03) / 4.12) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.03) / 4.12) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 6.88) / 4.09) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 6.88) / 4.09) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 6.88) / 4.09) * 10) + 50).toFixed(2);
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 7.16) / 3.14) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.16) / 3.14) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.16) / 3.14) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 7.90) / 8.25) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 7.90) / 8.25) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 7.90) / 8.25) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 8.07) / 9.74) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.07) / 9.74) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.07) / 9.74) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 5.88) / 3.90) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 5.88) / 3.90) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 5.88) / 3.90) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 8.00) / 4.23) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 8.00) / 4.23) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 8.00) / 4.23) * 10) + 50).toFixed(2);
                                        }
                                    }
                                    if (scorejson == null || scorejson == "") {
                                        scorejson += Score;
                                    } else {
                                        scorejson += "," + Score;
                                    }


                                } else {
                                    Score = Math.floor(item.Score);
                                    if (scorejson == null || scorejson == "") {
                                        scorejson += Score;
                                    } else {
                                        scorejson += "," + Score;
                                    }


                                }
                            } else if (index == 4) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 9.69) / 3.88) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 9.69) / 3.88) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 9.69) / 3.88) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 11.26) / 4.16) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.26) / 4.16) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.26) / 4.16) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 10.97) / 4.33) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 10.97) / 4.33) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 10.97) / 4.33) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 13.71) / 3.65) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.71) / 3.65) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.71) / 3.65) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 13.06) / 1.92) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.06) / 1.92) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.06) / 1.92) * 10) + 50).toFixed(2);
                                        }

                                    } else if (sexval == 2) {
                                        if (eval(16 <= AgeVal && AgeVal <= 19)) {
                                            Score = parseFloat(eval((((item.Score - 11.12) / 3.05) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 11.12) / 3.05) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 11.12) / 3.05) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(20 <= AgeVal && AgeVal <= 29)) {
                                            Score = parseFloat(eval((((item.Score - 13.42) / 3.82) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.42) / 3.82) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.42) / 3.82) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(30 <= AgeVal && AgeVal <= 39)) {
                                            Score = parseFloat(eval((((item.Score - 13.78) / 3.95) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.78) / 3.95) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.78) / 3.95) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(40 <= AgeVal && AgeVal <= 49)) {
                                            Score = parseFloat(eval((((item.Score - 16.12) / 4.08) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 16.12) / 4.08) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 16.12) / 4.08) * 10) + 50).toFixed(2);
                                        }
                                        else if (eval(50 <= AgeVal && AgeVal <= 69)) {
                                            Score = parseFloat(eval((((item.Score - 13.67) / 4.42) * 10) + 50).toFixed(2));
                                            MinScore = eval((((Mins - 13.67) / 4.42) * 10) + 50).toFixed(2);
                                            MaxScore = eval((((Maxs - 13.67) / 4.42) * 10) + 50).toFixed(2);
                                        }
                                    }
                                    if (scorejson == null || scorejson == "") {
                                        scorejson += Score;
                                    } else {
                                        scorejson += "," + Score;
                                    }


                                } else {
                                    Score = Math.floor(item.Score);
                                    if (scorejson == null || scorejson == "") {
                                        scorejson += Score;
                                    } else {
                                        scorejson += "," + Score;
                                    }
                                }
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                            if (Score != "" && Score != null) {
                                for (var i = 0; i < cmmlists.length; i++) {
                                    Startsorse = cmmlists[i].StartScore.replace("Scores", Score);
                                    Endsorse = cmmlists[i].EndScore.replace("Scores", Score)
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
                            indexs++;
                            Scores = Score;
                            datas9 += "{name:'" + item.WD_Name + "',data:'" + scorejson + "'},"                                                 
                            WdJsonName += "总评" + ",";
                            //状态
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" +4 + ">" + TSLB9Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + 4 + ">" + EndTime + "</td>";
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
                            if (indexs == msgs.datas.length && Lengths == TSLB9Index) {
                                chartjson(Slength9, datas9);
                            }
                        });
                        TSLB9(Acode, sexval, GetType, Birthday);
                    }
                }
            });
        }


        //特殊量表901
        var Slength901= "";
        var datas901= "";
        var WdJsonName = "";
        var TSLB901Index = 0;//退出递归的条件变量
        function TSLB901(Acode, sexval, GetType, Birthday) {
            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB901Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB901Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB901Index].AnswerID;
            var Ajson = AnswerRs[TSLB901Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,
                    types: GetType,
                    An_json: Ajson
                },
                complete: function (a, b) {

                    var indexs = 0;
                    TSLB901Index++;
                    if (Slength901 == "") {
                        Slength901 += TSLB901Index;
                    } else {
                        Slength901 += "," + TSLB901Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;

                        $.each(msgs.datas, function (index, item) {
                            var scorejson = "";
                            var Scores = "";
                            var Startsorse = "";
                            var Endsorse = "";
                            var Score = item.Score.toFixed(2);
                            if (index == 1) {
                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        Score = parseFloat(eval((((Score - 13.49) / 3.02) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 13.49) / 3.02) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 13.49) / 3.02) * 10) + 50).toFixed(2);

                                    } else if (sexval == 2) {
                                        Score = parseFloat(eval((((Score - 12.43) / 3.45) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 12.43) / 3.45) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 12.43) / 3.45) * 10) + 50).toFixed(2);
                                    }
                                    scorejson += Score + ",";


                                }
                            } else if (index == 2) {

                                if (item.ScoreType == 1) {
                                    if (sexval == 1) {
                                        Score = parseFloat(eval((((Score - 5.98) / 3.51) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 5.98) / 3.51) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 5.98) / 3.51) * 10) + 50).toFixed(2);

                                    } else if (sexval == 2) {
                                        Score = parseFloat(eval((((Score - 6.08) / 3.80) * 10) + 50).toFixed(2));
                                        MinScore = eval((((Score - 6.08) / 3.80) * 10) + 50).toFixed(2);
                                        MaxScore = eval((((Score - 6.08) / 3.80) * 10) + 50).toFixed(2);
                                    }
                                    scorejson += Score + ",";


                                } else {
                                    Score = Math.floor(item.Score);
                                    scorejson += parseFloat(item.Score.toFixed(2)) + ",";

                                }

                            } else if (index == 3) {
                                if (sexval == 1) {
                                    Score = parseFloat(eval((((Score - 4.02) / 2.75) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 4.02) / 2.75) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 4.02) / 2.75) * 10) + 50).toFixed(2);

                                } else if (sexval == 2) {
                                    Score = parseFloat(eval((((Score - 3.08) / 2.27) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 3.08) / 2.27) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 3.08) / 2.27) * 10) + 50).toFixed(2);
                                }
                                scorejson += Score + ",";
                            } else if (index == 4) {

                                if (sexval == 1) {
                                    Score = parseFloat(eval((((Score - 12.48) / 3.35) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 12.48) / 3.35) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 12.48) / 3.35) * 10) + 50).toFixed(2);

                                } else if (sexval == 2) {
                                    Score = parseFloat(eval((((Score - 13.52) / 3.32) * 10) + 50).toFixed(2));
                                    MinScore = eval((((Score - 13.52) / 3.32) * 10) + 50).toFixed(2);
                                    MaxScore = eval((((Score - 13.52) / 3.32) * 10) + 50).toFixed(2);
                                }
                                scorejson += Score + ",";

                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                            for (var i = 0; i < cmmlists.length; i++) {
                                Startsorse = cmmlists[i].StartScore.replace("Scores", Score);
                                Endsorse = cmmlists[i].EndScore.replace("Scores", Score)
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
                            indexs++;
                            Scores = Score;
                            datas901 += "{name:'" + item.WD_Name + "',data:'" + scorejson + "'},"
                            WdJsonName += "总评" + ",";
                            //状态
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + 4 + ">" + TSLB901Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + 4+ ">" + EndTime + "</td>";
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
                            if (indexs == msgs.datas.length && Lengths == TSLB901Index) {
                                chartjson(Slength901, datas901);
                            }
                        });
                        TSLB901(Acode, sexval, GetType, Birthday);
                    }
                }
            });
        }

        //特殊量表9
        var Slength11 = "";
        var datas11 = "";
        var WdJsonName = "";
        var TSLB11Index = 0;//退出递归的条件变量
        function TSLB11(Acode, sexval, GetType, Birthday) {
            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB11Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB11Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB11Index].AnswerID;
            var Ajson = AnswerRs[TSLB11Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "Ajax/SpecialViewFiles.ashx",
                data: {
                    type: "GetAnswerR",
                    A_code: Acode,
                    answer_id: answer_id,
                    types: GetType,
                    An_json: Ajson
                },
                complete: function (a, b) {
                    var A = 0;
                    var B = 0;
                    var C = 0;
                    var E = 0;
                    var F = 0;
                    var G = 0;
                    var H = 0;
                    var I = 0;
                    var L = 0;
                    var M = 0;
                    var N = 0;
                    var O = 0;
                    var Q1 = 0;
                    var Q2 = 0;
                    var Q3 = 0;
                    var Q4 = 0;
                    var indexs = 0;
                    TSLB11Index++;
                    if (Slength11 == "") {
                        Slength11 += TSLB11Index;
                    } else {
                        Slength11 += "," + TSLB11Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "") {
                        var msgs = eval("(" + msg + ")");
                        strjson = msgs.OldJson;
                        NewJson = msgs.Newjson;
                        var Mins = msgs.Minjson;
                        var Maxs = msgs.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;

                        $.each(msgs.datas, function (index, item) {
                            var scorejson = "";
                            var Scores = "";
                            var Startsorse = "";
                            var Endsorse = "";
                            var Score = item.Score.toFixed(2);
                            if (index <= 16) {

                                if (item.ScoreType == 1) {
                                    Score = parseFloat(eval(item.ConversionFormula).toFixed(2));
                                    Scores = Score;
                                    var Forms = item.Formulas;
                                    MinScore = Forms.replace("Score", Mins);
                                    MaxScore = Forms.replace("Score", Maxs);
                                    MinScore = eval(MinScore).toFixed(2);
                                    MaxScore = eval(MaxScore).toFixed(2);
                                    var WDName = item.WD_Name;
                                    if (WDName.indexOf("A") > -1) {
                                        A = Score;
                                    }
                                    else if (WDName.indexOf("B") > -1) {
                                        B = Score
                                    } else if (WDName.indexOf("C") > -1) {
                                        C = Score
                                    } else if (WDName.indexOf("E") > -1) {
                                        E = Score
                                    } else if (WDName.indexOf("F") > -1) {
                                        F = Score
                                    } else if (WDName.indexOf("G") > -1) {
                                        G = Score
                                    } else if (WDName.indexOf("H") > -1) {
                                        H = Score
                                    } else if (WDName.indexOf("I") > -1) {
                                        I = Score
                                    } else if (WDName.indexOf("L") > -1) {
                                        L = Score
                                    } else if (WDName.indexOf("M") > -1) {
                                        M = Score
                                    } else if (WDName.indexOf("N") > -1) {
                                        N = Score
                                    } else if (WDName.indexOf("O") > -1) {
                                        O = Score
                                    } else if (WDName.indexOf("Q1") > -1) {
                                        Q1 = Score
                                    } else if (WDName.indexOf("Q2") > -1) {
                                        Q2 = Score
                                    } else if (WDName.indexOf("Q3") > -1) {
                                        Q3 = Score
                                    } else if (WDName.indexOf("Q4") > -1) {
                                        Q4 = Score
                                    }
                                    if (scorejson != null && scorejson != "") {
                                        scorejson += "," + Score;
                                    } else {
                                        scorejson += Score;
                                    }
                                }
                                else {
                                    Score = item.Score.toFixed(2);
                                    if (scorejson != null && scorejson != "") {
                                        scorejson += "," + scorejson;
                                    } else {
                                        scorejson += scorejson;
                                    }
                                    Scores = Score;
                                }


                            } else {
                              
                                var ConvertResult = 0;
                                if (index == 17) {
                                    ConvertResult = item.ConversionFormula.replace("L", L).replace("O", O).replace("Q4", Q4).replace("H", H).replace("Q2", Q2).replace("C", C);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 18) {
                                    ConvertResult = item.ConversionFormula.replace("A", A).replace("E", E).replace("F", F).replace("H", H).replace("Q2", Q2);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 19) {
                                    ConvertResult = item.ConversionFormula.replace("C", C).replace("E", E).replace("F", F).replace("N", N).replace("A", A).replace("M", M);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 20) {
                                    ConvertResult = item.ConversionFormula.replace("E", E).replace("M", M).replace("Q1", Q1).replace("Q2", Q2).replace("A", A).replace("G", G);
                                    ConvertResult = eval(ConvertResult);
                                    if (ConvertResult < 1) {
                                        item.ConversionFormula = 1;
                                    } else if (ConvertResult > 10) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 21) {
                                    item.ConversionFormula = item.ConversionFormula.replace("C", C).replace("F", F).replace("O", O).replace("Q4", Q4);
                                }
                                if (index == 22) {
                                    item.ConversionFormula = item.ConversionFormula.replace("Q3", Q3).replace("G", G).replace("C", C).replace("E", E).replace("N", N).replace("Q2", Q2).replace("Q1", Q1);
                                }
                                if (index == 23) {
                                    ConvertResult = item.ConversionFormula.replace("A", A).replace("B", B).replace("E", E).replace("F", F).replace("H", H).replace("I", I).replace("M", M).replace("N", N).replace("Q1", Q1).replace("Q2", Q2);
                                    ConvertResult = eval(ConvertResult);
                                    if (15 <= ConvertResult || ConvertResult <= 62) {
                                        item.ConversionFormula = 1;
                                    } else if (63 <= ConvertResult || ConvertResult <= 67) {
                                        item.ConversionFormula = 2;
                                    } else if (68 <= ConvertResult || ConvertResult <= 72) {
                                        item.ConversionFormula = 3;
                                    } else if (73 <= ConvertResult || ConvertResult <= 77) {
                                        item.ConversionFormula = 4;
                                    } else if (78 <= ConvertResult || ConvertResult <= 82) {
                                        item.ConversionFormula = 5;
                                    } else if (83 <= ConvertResult || ConvertResult <= 87) {
                                        item.ConversionFormula = 6;
                                    } else if (88 <= ConvertResult || ConvertResult <= 92) {
                                        item.ConversionFormula = 7;
                                    } else if (93 <= ConvertResult || ConvertResult <= 97) {
                                        item.ConversionFormula = 8;
                                    } else if (98 <= ConvertResult || ConvertResult <= 102) {
                                        item.ConversionFormula = 9;
                                    } else if (103 <= ConvertResult || ConvertResult <= 105) {
                                        item.ConversionFormula = 10;
                                    } else {
                                        item.ConversionFormula = ConvertResult;
                                    }
                                }
                                if (index == 24) {
                                    ConvertResult = item.ConversionFormula.replace("B", B).replace("G", G).replace("Q3", Q3).replace("F", F);
                                }
                                //后八个维度的计算
                            }
                            var NormName = "";//状态
                            var Result = "";//结果
                            var Proposal = "";
                            var cmmlists = item.CmmodelList;
                            var Startsorse = "";
                            var Endsorse = "";
                            for (var i = 0; i < cmmlists.length; i++) {
                                Startsorse = cmmlists[i].StartScore.replace("Scores", Score);
                                Endsorse = cmmlists[i].EndScore.replace("Scores", Score)
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

                            indexs++;
                            Scores = Score;
                            datas11 += "{name:'" + item.WD_Name + "',data:'" + scorejson + "'},"
                            WdJsonName += "总评" + ",";
                            //状态
                            var zt_Type = "";
                            zt_Type = NormName == "" || NormName.length == 0 ? "无" : NormName;
                            var PageHtml = "";
                            index++;
                            if (indexs == 1) {
                                PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + TSLB11Index + "</td>";//之前是AR
                                PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + msgs.datas.length + ">" + EndTime + "</td>";
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
                            if (indexs == msgs.datas.length && Lengths == TSLB11Index) {
                                chartjson(Slength11, datas11);
                            }
                        });
                        TSLB11(Acode, sexval, GetType, Birthday);
                    }
                }
            });
        }

        var Slength12 = "";
        var datas12 = "";
        var TSLB12Index = 0;
        function TSLB12(Acode, sexval, GetType, Birthday) {
            //$("#XLID").hide();
            var Slength = "";
            var datas = "";
            var Lengths = AnswerRs.length;
            var scorejson = "";
            if (TSLB12Index >= AnswerRs.length) { //infos是存放主机名称的数组
                return;
            }
            var EndTime = AnswerRs[TSLB12Index].Answer_CreateTime;
            var AgeVal = DateDiff(EndTime, Birthday);
            var answer_id = AnswerRs[TSLB12Index].AnswerID;
            var Ajson = AnswerRs[TSLB12Index].AnswerJson
            $.ajax({
                type: "POST",
                url: "../PersonalReport/Ajax/MMPI_Report.ashx",
                data: {                                    
                    Remark: "GetResult",
                    A_ID: answer_id
                },
                complete: function (a, b) {
                    TSLB12Index++;
                    var indexs = 0;

                    if (Slength12 == "") {
                        Slength12 += TSLB12Index;
                    } else {
                        Slength12 += "," + TSLB12Index;
                    }
                    var msg = a.responseText;
                    var MinScore = 0;
                    var MaxScore = 0;
                    if (msg != "NOTHING") {
                        var WD_NameList = "";
                      
                        var MMPI = eval("(" + msg + ")");
                        strjson = MMPI.OldJson;
                        NewJson = MMPI.Newjson;
                        var Mins = MMPI.Minjson;
                        var Maxs = MMPI.Maxjson;
                        MinScore = Mins;
                        MaxScore = Maxs;
  
                        for (var index = 0; index < MMPI.length; index++) {
                            var WD_ValueList = "";
                            var resuHTML = "";
                            resuHTML += "";

                            //var k = new change("" + parseInt(index + 1) + "");
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
                            if (index > 3) {
                                datas12 += "{name:'" + "维度" + MMPI[index].WD_Name + "',data:'" + WD_ValueList + "'},"
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
                            //index++;
                            indexs++;
                            var PageHtml = "";
                                if (indexs == 1) {
                                    PageHtml += "  <tr><td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);;line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + MMPI.length + ">" + TSLB12Index + "</td>";//之前是AR
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\" rowspan=" + MMPI.length + ">" + EndTime + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px; \" valign=\"top\" width=\"110\">" + MMPI[index].WD_Name + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NF + "</td>";
                                    PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;\" valign=\"top\" width=\"110\">" + NState + "</td>";
                                    PageHtml += "</tr>";
                                } else {
                                    PageHtml += " <tr>";
                                    PageHtml += " <td style=\"border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + MMPI[index].WD_Name + "</td>";
                                    PageHtml += " <td style=\" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NF + "</td>";
                                    PageHtml += " <td style=\"  border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); \" valign=\"top\" width=\"110\">" + NState + "</td>";
                                    PageHtml += "  </tr>";
                                }

                                $("#GetTableID tbody").append(PageHtml);
                                if (indexs == MMPI.length && Lengths == TSLB12Index) {
                                    chartjson(Slength12, datas12);
                                }
                        }

                        TSLB12(Acode, sexval, GetType, Birthday);
                    }
                }
            });

        }

        function chartjson(Slength, datas) {
            Slength = Slength.split(',')
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
                    categories: Slength
                },
                yAxis: {
                    title: {
                        text: "分数"
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
        function reti() {
            window.close();
        }
    </script>
    <div class="col-md-12 col-sm-12" id="Print" style="padding-left: 0px;padding-right: 0px;">
        <div class="well" style="overflow-y: scroll">    
            <div class="row" style="margin-left: auto; margin-right: auto; margin-top: 15px; background-color: #FFF; width: 70%; min-width: 320px;" id="pagecontent">
                <div class="col-md-12 col-sm-12  text-align: center;">
                    <h4 style="font-size: 22px; font-weight: 700; text-align: center;" id="ReportTitle"></h4>
                </div>
                 <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;font-size:20px;">
                       一、基本信息
                    </div>
                    <div  class="col-md-12" style="margin-top: 15px;" id="UserTable">
                        <table class="MsoTableGrid" style="border-collapse:collapse;width:100%;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;">                    
                      <tbody>
                        <tr>
                           <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height:30px;" valign="top" width="110"> </td>
                          <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0);line-height:30px;" valign="top" width="110"></td>                         
                        </tr>
                        <tr>
                           <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height:30px;" valign="top" width="110"></td>
                          <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height:30px;" valign="top" width="110"></td>                       
                        </tr>
                        <tr>
                          <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height:30px;" valign="top" width="110"></td>
                          <td style="width: 82.9500pt; padding: 0.0000pt 5.4000pt 0.0000pt 5.4000pt; border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); line-height:30px;" valign="top" width="110"></td>                        
                        </tr>
                      </tbody>
                    </table>
                    </div>

                </div>
                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;font-size:20px;">
                       二、量表介绍
                    </div>
                    <div id="LB" style="margin-top: 15px;line-height:30px;font-size:12px;text-indent:2em;"></div>

                </div>
            

                <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;">
                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;font-size:20px;">
                       三、历次作答记录
                    </div>
                    <div class="col-md-12">
                    <div id="GetTableID" style="margin-top: 15px;">
                        
                     <table class="MsoTableGrid" style="border-collapse:collapse;mso-table-layout-alt:fixed;mso-padding-alt:0.0000pt 5.4000pt 0.0000pt 5.4000pt ;width:100%">                    
                      <tbody>
                       <tr id="GetTR">
                 <td style=" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216); font-weight:bold;line-height:30px;" valign="top" width="110">序号</td>
                 <td style=" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216);font-weight:bold;line-height:30px;" valign="top" width="110">时间</td>
                 <td style=" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216);font-weight:bold;line-height:30px;" valign="top" width="110">维度</td>
                 <td style=" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216);font-weight:bold;line-height:30px;" valign="top" width="110">得分</td>
                 <td style=" border-left: 1.0000pt solid rgb(0,0,0); mso-border-left-alt: 0.5000pt solid rgb(0,0,0); border-right: 1.0000pt solid rgb(0,0,0); mso-border-right-alt: 0.5000pt solid rgb(0,0,0); border-top: 1.0000pt solid rgb(0,0,0); mso-border-top-alt: 0.5000pt solid rgb(0,0,0); border-bottom: 1.0000pt solid rgb(0,0,0); mso-border-bottom-alt: 0.5000pt solid rgb(0,0,0); background: rgb(216,216,216);font-weight:bold;line-height:30px;" valign="top" width="110">状态</td>
             </tr>
            
                      </tbody>
                    </table>
                      </div>     
                    </div>                 
                </div>
                  <div class="row" style="margin-top: 15px; margin-left: 7%; margin-right: 7%; min-width: 310px;" id="XLCP">

                    <div style="color: #000; background-color: #FFFFFF; border-color: #ddd; font-weight: bold;font-size:20px;" id="XLID">
                      四、心理测评趋势图
                    </div>
                    <div id="container" style="margin-top: 15px;"></div>
                       <div  class="row" style="text-align:center;width:100%;display:none" id="ContainerImage">
                      <%--<img"/>--%>
                            <image  id ="imagescr" width="600px" height="400px" ></image>
                   </div>
                </div>
            </div>
        </div>
  
         <div class="row" style="text-align: center; margin-bottom: 10px;">
            <button type="button" class="btn btn-sm" style="background-color:orange;color:white" id="export" onclick="Export()" >
                导出
            </button>    
               <button type="button" class="btn btn-sm" style="color: white" data-dismiss="modal" onclick="reti()">
               关闭
            </button>       
        </div>
    </div>
</asp:Content>
