<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewFilesA.aspx.cs" Inherits="CrisisInterfere.FunctionModular.EvaluationFiles.ViewFiles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
      <%--<script src="../../JS/Highcharts/highcharts.js"></script>
    <script src="../../JS/Highcharts/highcharts-more.js"></script>--%>
    <script src="../../JS/Highcharts/highcharts5.0.6.js"></script>
    <script src="../../JS/Highcharts/exporting.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/word/jquery.wordexport.js"></script>
    <script>    
        var Title = "";
        var categoriedata = [];
        var datas = "";
      
        $(function () {
         
            //动态获取图表
            GetViewFiles();        
          
            function GetViewFiles() {
                var Sindexs = 0;
                $.ajax({
                    url: "Ajax/EvaluationFiles.ashx?type=GetView",
                    data: { Acode: getUrlParam("Acode") },
                    success: function (msg) {                      
                        
                       
                        var obj = eval('(' + msg + ')');
                        var sexval = 0;
                        if (obj.UserInfo.Sex == "男") {
                            sexval = 1;
                        } else if (obj.UserInfo.Sex == "女") {
                            sexval = 2;
                        }
                        var ageval = obj.UserInfo.Ages;
                        var findtable = $("#pagecontent").find("table");
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(0)").text("登录名:" + obj.UserInfo.LoginName);
                        findtable.eq(0).find("tbody>tr:eq(0)>td:eq(1)").text("姓名:" + obj.UserInfo.Name);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(0)").text("性别:" + sexval);
                        findtable.eq(0).find("tbody>tr:eq(1)>td:eq(1)").text("部门:" + obj.UserInfo.D_name);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(0)").text("出生日期:" + obj.UserInfo.U_Birthday);
                        findtable.eq(0).find("tbody>tr:eq(2)>td:eq(1)").text("完成次数:" + obj.UserInfo.AllCount);
                        $("#LB").html(obj.UserInfo.Amount_Guidance);
                        for (var i = 0; i < obj.AnswerInfo.length; i++) {                     
                          
                            categoriedata[i] = obj.AnswerInfo[i].Answer_CreateTime
                            var AnswerR = obj.AnswerInfo[i].AnswerJson;
                            Sindexs++;
                            DrawWD_Analysis(categoriedata[i], AnswerR, Sindexs, obj.AnswerInfo.length, sexval, ageval);
                            
                        }
                       
                        Title = obj.UserInfo.Amount_Name;
                        
                    }

                })
               
            }
           
            });
        //导出
        function WordExport()
        {
            $("#container").hide();
            $("#ContainerImage").show();
            $("#pagecontent").wordExport();
            $("#ContainerImage").hide();
            $("#container").show();
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

        /*--------------维度解释解析-----------*/
        var OperationList;
       
        var Slength = "";
       
        var WdJsonName = "";
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
                    var indexs = 0;
                    if (Slength == "") {
                        Slength += Sindexs;
                    } else {
                        Slength += ","+Sindexs;
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
                                    Seriesdata += "," + standard;
                                } else {
                                    Seriesdata +=  standard;
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
                            datas += "{name:'" + "维度" + SectionToChinese(indexs) + "',data:'" + Seriesdata + "'},"
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
                          
                            if (indexs == 1) {
                                PageHtml += "  <tr><td rowspan=" + msgs.length + ">" + indexs + "</td>";//之前是AR
                                PageHtml += " <td rowspan=" + msgs.length + ">" + EndTime + "</td>";
                                PageHtml += " <td >" + item.WD_Name + "</td>";
                                PageHtml += " <td >" + Scores + "</td>";
                                PageHtml += " <td >" + zt_Type + "</td>";
                                PageHtml += "</tr>";
                            } else {                                                          
                                PageHtml += " <tr>";
                                PageHtml += " <td >" + item.WD_Name + "</td>";
                                PageHtml += " <td >" + Scores + "</td>";
                                PageHtml += " <td >" + zt_Type + "</td>";
                                PageHtml += "  </tr>";                          
                            }
                           
                            currentRow.after(PageHtml);
                            if (indexs == msgs.length && lengths == Sindexs) {
                                chartjson();
                            }
                        });
                       
                    }
                    
                }
            });
           
        }
      
        function chartjson() {
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
                },
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
        function Export()
        {
            var svgFirst;

            chartFirst = $('#container').highcharts();
            svgFirst = chartFirst.getSVG();
            $.ajax({
                url: "Ajax/EvaluationFiles.ashx?type=SaveImage",
                type: "post",
                async: false,
                data: { svg: svgFirst },
                success: function (result) {
                    var ImageSrc = "Ajax/image/" + result;
                    var image = new Image();
                    image.src = ImageSrc;
                    image.onload = function () {
                        var base64s = getBase64Image(image);
                        $("#imagescr").attr("src", base64s);
                        $("#container").hide();
                        $("#ContainerImage").show();
                        $("#pagecontent").wordExport(AmountName);
                        $("#ContainerImage").hide();
                        $("#container").show();
                    }
                    //$("#imagescr").attr("src", ImageSrc);
                    //WordExport();
                }
            })

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
       <div class="row">
        <div class="col-md-12">          
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">档案管理</a></li>
                <li><a href="#" style="color: #666;">测评档案</a></li> 
                 <li><a href="#" style="color: #666;">查看档案</a></li>                
            </ol>
        </div>
          
    </div>
     <div class="row" id="WordExport">
      <div  style="float:right"> <button type="button" class="btn btn-info" onclick="Export()">导出</button></div>
     <div style="float:right" ><button type="button" class="btn btn-info" onclick="OcExit()">关闭</button></div>
        
     </div>
    <!-- /. ROW  -->
    <div class="row" style="margin-left:280px;margin-right:0px"; id="pagecontent">
        <div class="row" style="margin-bottom:10px;font-weight:bold;margin-left:5px;">
           一、基本信息
        </div>
        <div class="col-md-8" id="UserTable">
     <table class="table table-bordered" style="width:100%" border="1">                    
                      <tbody>
                        <tr>
                           <td> </td>
                          <td></td>                         
                        </tr>
                        <tr>
                           <td></td>
                          <td></td>                       
                        </tr>
                        <tr>
                          <td></td>
                          <td></td>                        
                        </tr>
                      </tbody>
                    </table>
            </div>
        <div class="row" style="margin-bottom:10px;font-weight:bold;margin-top:10px;">
          <div class="col-md-5" style="font-weight:bold">
           二、量表介绍
        </div>
            </div>
        <div class="col-md-8" id="LB" style="margin-bottom:10px;line-height:30px;">
              量表介绍
            </div>
        <div class="row" style="margin-bottom:10px;font-weight:bold">
         <div class="col-md-5" style="margin-top:10px;font-weight:bold">
           三、历次作答记录
        </div>
         </div>
        <div class="col-md-8" id="GetTableID">
     <table class="table table-bordered" border="1" style="width:100%">                    
                      <tbody>
                       <tr id="GetTR">
                 <td style="height: 20px;background-color:#B0B0B0">序号</td>
                 <td style="height: 20px;background-color:#B0B0B0">时间</td>
                 <td style="height: 20px;background-color:#B0B0B0">维度</td>
                 <td style="height: 20px;background-color:#B0B0B0">得分</td>
                 <td style="height: 20px;background-color:#B0B0B0">状态</td>
             </tr>
            
                      </tbody>
                    </table>
            </div>
             <div class="row" style="margin-bottom:10px;font-weight:bold">
         <div class="col-md-5" style="margin-top:10px;font-weight:bold">
           四、心理测评趋势图
        </div>
                 </div>
        <div class="col-md-8" id="container">
            
            </div>
        <div  class="row" style="text-align:center;width:100%;display:none" id="ContainerImage">
                      <%--<img"/>--%>
                            <image  id ="imagescr" width="600px" height="400px" ></image>
                   </div>
    </div>
</asp:Content>
