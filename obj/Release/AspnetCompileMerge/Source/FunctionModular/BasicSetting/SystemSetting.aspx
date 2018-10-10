<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SystemSetting.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.SystemSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script src="../../JS/jquery-1.10.2.js"></script>
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/jquery.form.js"></script>
    <script src="../../JS/layer.js"></script>
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>

    <style>
        .box {
            padding-top: 100px;
            /*margin-left: -50px;*/
        }

        .font {
            color: #0094ff;
        }

        .labelfont {
            font-size: 12px;
            color: #797979;
        }
    </style>
    <div class="row">
        <div class="col-md-12">

        <%--    <h1 class="page-header">添加成员<small>成员管理</small>
            </h1> --%>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">基础设置</a></li>
                <li><a href="#">系统设置</a></li>
            </ol>

        </div>
        <div class="clearfix">
            <div class="col-md-12 column  box">
                <form class="form-horizontal" role="form">
                    <div class="row">
                        <div class="form-group">
                            <label for="inputEmail3" class="col-sm-2 control-label font">IP地址/域名：</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="IP" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label font"></label>
                            <div class="col-sm-9">
                                <label class="labelfont">此功能主要用于单机版、局域网版、互联网版、之间的访问转换，单机版直接输入（http://127.0.0.1）；局域网请输入（http://安装测评主机的IP地址）、互联网请输入（http://您的域名）作为访问地址使用（注有单独的服务器）</label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <label for="inputPassword3" class="col-sm-2 control-label font">绑定邮箱类型：</label>
                            <div class="col-sm-2">
                                <select class="form-control" id="Emailtype">
                                    <option value="qq邮箱">qq邮箱</option>
                                    <option value="qq邮箱">qq邮箱</option>
                                    <option value="网易邮箱">网易邮箱</option>
                                    <option value="百度邮箱">百度邮箱</option>
                                </select>
                            </div>
                            <label for="inputPassword3" class="col-md-1 control-label font">邮箱账号：</label>
                            <div class="col-md-2">
                                <input type="text" class="form-control" id="Emailname" />
                            </div>
                            <label for="inputPassword3" class="col-md-1 control-label font">邮箱密码：</label>
                            <div class="col-md-3">
                                <input type="password" class="form-control" id="EmaliPwd" />
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-10 col-sm-4">
                            </div>
                            <div class="col-md-2 col-sm-4">
                                <button type="button" class="btn btn-default" onclick="insert()">保存</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script>
        function insert() {
            var IP = $("#IP").val();
            var Emailtype = $("#Emailtype").val();
            var Emailname = $("#Emailname").val();
            var EmaliPwd = $("#EmaliPwd").val();
            if (IP == "" || Emailtype == "" || Emailname == "" || EmaliPwd == "")
            {
                return false;
            }
          
            $.ajax({
                url: "ajax/SystemSetting.ashx",
                data: { IP: IP, Emailtype: Emailtype, Emailname: Emailname, EmaliPwd: EmaliPwd },
                type: "post",
                success: function (result) {
                    if (result) { alert("保存成功!") }
                    else {alert("保存失败！") }
                }
            })
        }
    </script>
</asp:Content>
