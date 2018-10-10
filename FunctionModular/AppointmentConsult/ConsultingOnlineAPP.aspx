<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ConsultingOnlineAPP.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.ConsultingOnlineAPP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
     <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="Style/ConsultingOnline.css" rel="stylesheet" />

   <%-- <link rel="stylesheet" href="layui/css/layui.css" media="all">--%>
    <link href="layui/css/modules/layim/layui.mobile.css" rel="stylesheet"  media="all"/>
    <script src="../../JS/word/FileSaver.js"></script>

    <script src="layui/layui.js" charset="utf-8"></script>
    <script src="../../JS/layer.js"></script>
   <%-- <script src="ViewModel/ConsultingOnlineViewModel.js"></script>--%>
    <script>
        layim.panel({
            title: '界面标题'
  , tpl: '<div style="padding: 10px;">自定义模版，{{d.data.test}}</div>'
  , data: { //数据
      test: '么么哒'
  }
        });
    </script>
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" data-backdrop="static" aria-labelledby="myModalLabel" aria-hidden="true" style="z-index: 99999999;">
        <div class="modal-dialog" style="width: 300px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">结束提示
                    </h4>
                </div>
                <div class="modal-body">
                    您好，距离当前咨询结束时间仅剩5min，系统将按时关闭聊天室。
                </div>
                <div class="modal-footer">
                    <div class="btn-group">
                        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                            延时 
		<span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu" style="min-width: 100%;">
                            <li><a href="#" data-val="10">10min</a></li>
                            <li><a href="#" data-val="20">20min</a></li>
                            <li><a href="#" data-val="30">30min</a></li>
                            <li><a href="#" data-val="40">40min</a></li>
                            <li><a href="#" data-val="50">50min</a></li>
                            <li><a href="#" data-val="60">60min</a></li>
                        </ul>
                    </div>
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        确定
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal -->
    </div>
    <script>
        var navName = '/FunctionModular/AppointmentConsult/ConsultingOnline.aspx';
    </script>
</asp:Content>
