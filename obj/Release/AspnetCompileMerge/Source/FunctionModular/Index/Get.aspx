<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Get.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Index.Get" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>
        <script src="../../JS/jquery-1.10.2.js"></script>
        <%-- <script src="../../JS/bootstrap.min.js"></script>
    <link href="../../CSS/bootstrap.css" rel="stylesheet" />--%>
        <link href="../../CSS/GETindex.css" rel="stylesheet" />
        <script>
            $(function () {
                setInterval(data, 1000);
            })
            function data() {
                var d = new Date();
                var s = d.getFullYear()
                   + "/" + (d.getMonth() + 1)
                   + "/" + d.getDate()
                   + "/" + d.getHours()
                   + "/" + d.getMinutes()
                   + ":" + d.getSeconds()
                   + "星期:" + d.getDay();
                document.getElementById('dataclass').innerHTML = s;
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="jumbotron">
                        <h4 class="weitxt">您现在的位置：<span class="spans">桌面</span>
                        </h4>
                        <div class="userxx">
                            <p>
                                <a href="#" class="pull-left">
                                    <img class="img" src="../../assets/images/gallery/userimg.jpg" />
                                </a>
                            </p>
                            <div class="media-body tetujs">管理员，晚上好！</div>
                            <h4 class="welcome">欢迎您登陆京师博仁心理测评档案管理系统</h4>
                            <h4 class="userjs">角色：<span class="js">管理员</span></h4>
                            <h4 class="txtdata">当前时间：<span id="dataclass"></span>
                            </h4>
                        </div>
                        <div class="container">
                            <div class="row clearfix">
                                <div class="col-md-12 column">
                                    <h3>常用功能:</h3>
                                    <div class="dinclass">
                                        <a class="btn" href="#"></a>
                                        <div class="gnimg"></div>
                                        <h4>添加人员
                                        </h4>
                                    </div>
                                    <div class="dinclass">
                                        <a class="btn" href="#"></a>
                                        <div class="gnimg"></div>
                                        <h4>添加人员
                                        </h4>
                                    </div>
                                    <div class="dinclass">
                                        <a class="btn" href="#"></a>
                                        <div class="gnimg"></div>
                                        <h4>添加人员
                                        </h4>
                                    </div>
                                    <div class="dinclass" data-toggle="modal" data-target="#myModal">
                                        <a class="btn" href="#"></a>
                                        <div class="gnimg"></div>
                                        <h4>添加更多
                                        </h4>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4 class="modal-title" id="myModalLabel">请选择您常用的功能：
                        </h4>
                    </div>
                    <div class="modal-body">
                       <div id="menu">
                           <ul class="list-unstyled ultype">
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                               <li><input type="checkbox" id="Addry" /><label for="Addry">添加人员</label> </li>
                           </ul>
                       </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            关闭
                        </button>
                        <button type="button" class="btn btn-primary">
                            提交更改
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </body>
    </html>
</asp:Content>
