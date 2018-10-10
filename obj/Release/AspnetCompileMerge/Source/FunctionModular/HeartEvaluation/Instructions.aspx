<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Instructions.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.Instructions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
        
    <div class="demo">
	<div id='quiz-container'>
         <div class="row">
        <div class="col-md-12">

            <%--          <h1 class="page-header">维度量表添加<small>量表管理</small>
            </h1>--%>
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">心理测验</a></li>
                <li><a href="#" style="color: #666;">我的测验</a></li>
                <li><a href="#" style="color: #000;">指导语</a></li>
            </ol>
        </div>
        </div>
          <div class="row">
        <div class="col-md-12 col-sm-12">
            <div style="text-align:center">标题</div>
            </div>             
    </div>
        <div class="row" style="margin-top:20px;margin-left:80px;">
             <div class="col-md-2 col-sm-12" >
            指导语：
            </div>  
              <div class="col-md-10 col-sm-12"id="Guidance">
               内容内容
            </div>   
            </div>
        <div class="row" style="margin-top:50px;margin-left:80px;">
             <div class="col-md-2 col-sm-12">
                 温馨提示：
                 </div>
            <div class="col-md-10 col-sm-12">
               内容始终为“为保证结果的准确性，答题时以第一感觉作答，过程中尽量不要返回作答。”
            </div>
            </div>
	</div>
        <div class="nav-start" id="Answer" onclick="Answer()">
            <a href="#">开始答题</a>
        </div>
</div>

    
        <script>
          
            //获取url中的参数
            function getUrlParam(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
                var r = window.location.search.substr(1).match(reg);  //匹配目标参数
                if (r != null) return unescape(r[2]); return null; //返回参数值
            }
            function Load()
            {
                var  Acode= getUrlParam("ACode");
                $.ajax({
                    type: "POST",
                    url: "Ajax/MyTest.ashx?ACode=" + getUrlParam("ACode") + "",
                    data: {ACode:Acode,type:2},//要执行查询的数据参数
                    success: function (msg) {
                        $("#Guidance").html(msg);

                    }
                });
            }         
            Load();
            function Answer()
            {
                window.location.href = "StartAnswerTest.aspx?item=" + getUrlParam("ACode") + "&DID=" + getUrlParam("DID");
            }
        </script>
</asp:Content>
