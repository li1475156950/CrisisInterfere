<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="TypingResultOfAssess.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.TypingResultOfAssess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <style>
        .cancelPoint li{
            list-style:none;
            height:80px;
        }
        #hideQT {
            list-style:none;
            display:none;
        }
    </style>
    <script>
        function ShowQT()
        {
            $("#showQT").show();
            $("#hideQT").hide();
        }
        function HideQT()
        {
            $("#showQT").hide();
            $("#hideQT").show();
        }
    </script>
        <div class="col-xs-12">     
                <div class="row">
                    <div class="col-md-3">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                        <div class="lb-panel-left pull-left blue">
                            请选择量表:
                        </div>
                        <div class="lb-panel-right pull-right">
                            <select class="form-control" id="form-field-select-1">
                    <option style="background-color:#ccc8c8" value=""></option>
                    <option style="background-color: #ccc8c8" value="AL">量表一</option>
                    <option value="AK">Alaska</option>
                    <option style="background-color: #ccc8c8" value="AZ">量表二</option>
                    <option value="AR">Arkansas</option>
                    <option style="background-color: #ccc8c8" value="CA">量表三</option>
                </select>
                        </div>
                    </div>
                    </div>
                </div>
            
            <div class="row">
                <ul class="nav nav-tabs padding-12 tab-color-blue background-blue">
                <li><a class="dropdown-toggle" data-toggle="tab" href="#tab1">批量导入</a> </li>
                <li><a class="dropdown-toggle" data-toggle="tab" href="#tab2">逐题录入</a> </li>
                <li><a class="dropdown-toggle" data-toggle="tab" href="#tab3">答题卡录入</a> </li>
            </ul>
            <div class="tab-content">
                <div id="tab1" class="tab-pane fade in active col-xs-12">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="panel panel-default text-center no-boder">
                                <div class="lb-panel-left pull-left blue">
                                    上传文件
                                </div>
                                <div class="lb-panel-right pull-right background-white">
                                    <input class="form-control" type="file" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-1">
                            <div class="panel panel-default text-center no-boder">
                                <div>
                                    <button class="btn btn-info"><i class="glyphicon glyphicon-upload"></i>上&nbsp;传</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <div class="panel panel-default text-center no-boder">
                               <button class="btn btn-info"><i class="glyphicon glyphicon-saved"></i>确&nbsp;定</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="tab2" class="tab-pane fade">
                    <div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="panel panel-default text-center no-boder">
                                    <div class="lb-panel-left pull-left blue">
                                        显示方式:
                                    </div>
                                    <div class="lb-panel-right pull-right">
                                        <input type="radio" name="IsShowTopic" onclick="ShowQT()"/>显示题目&nbsp;&nbsp;&nbsp;<input type="radio" name="IsShowTopic" onclick="    HideQT()"/>隐藏题目
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <div class="panel panel-default text-center no-boder">
                                    <div class="lb-panel-left pull-left blue">
                                        登录名:
                                    </div>
                                    <div class="lb-panel-right pull-right">
                                        <input type="text" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <div class="panel panel-default">
                                    <textarea class="form-control"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="panel panel-default">
                                    <div id="showQT" class="list-group">
                                        <a class="list-group-item">Q1.我最喜欢看机械方面的杂志</a>
                                        <a class="list-group-item"><input type="radio"/>是</a>
                                        <a class="list-group-item"><input type="radio"/>否</a>
                                        <a class="list-group-item">Q1.我最喜欢看机械方面的杂志</a>
                                        <a class="list-group-item"><input type="radio"/>是</a>
                                        <a class="list-group-item"><input type="radio"/>否</a>
                                    </div>
                                    <div id="hideQT"class="list-group">
                                        <a class="list-group-item">Q1.<input class="col-md-offset-1" type="radio"/>是<input class="col-md-offset-1" type="radio"/>否</a>
                                        <a class="list-group-item">Q1.<input class="col-md-offset-1" type="radio"/>是<input class="col-md-offset-1" type="radio"/>否</a>
                                        <a class="list-group-item">Q1.<input class="col-md-offset-1" type="radio"/>是<input class="col-md-offset-1" type="radio"/>否</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <button class="btn btn-primary col-md-offset-1"><i class="glyphicon glyphicon-save"></i>确定</button>&nbsp;&nbsp;&nbsp<button class="btn btn-warning col-md-offset-1"><i class="glyphicon glyphicon-cog"></i>重置</button>
                        </div>
                    </div>
                </div>
                <div id="tab3" class="tab-pane fade">


                </div>
                
            </div>
            </div>
        </div>
</asp:Content>
