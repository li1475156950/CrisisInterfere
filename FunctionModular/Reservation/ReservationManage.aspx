<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ReservationManage.aspx.cs" Inherits="CrisisInterfere.FunctionModular.ReservationManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script src="../../JS/jquery-1.10.2.js"></script>
    <script src="../../JS/bootstrap.min.js"></script>
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <script src="../../JS/Reservation.js"></script>
  
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="JS/My97DatePicker/WdatePicker.js"></script>
    <style type="text/css">
        .target_box {
            width: 320px;
            padding: 10px;
            border: 1px solid #aaa;
            background-color: #FFEC8B;
            line-height: 30px;
            font-size:12px;
        }
        .tuanti {
            margin-left:13px;
            background-color:#FFEC8B;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>

    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">预约咨询 <small>预约管理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">预约咨询</a></li>
                <li><a href="#">预约管理</a></li>

            </ol>
        </div>
    </div>


    <!-- /. ROW  -->

    <div class="row">
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    预约方式：
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>全部分类</option>
                        <option>家庭婚姻测验</option>
                        <option>精神障碍评定</option>
                        <option>情绪评定</option>
                        <option>人格测验</option>
                        <option>其他</option>
                    </select>

                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    预约状态：
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>不限</option>
                        <option>系统量表</option>
                        <option>组合量表</option>
                        <option>自编量表</option>
                    </select>

                </div>
            </div>
        </div>

        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    选择日期：
                </div>

                <div class="lb-panel-right pull-right">
                    <input class="form-control" type="date" />

                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="pull-left ">

                <button type="button" class="btn btn-info btn-sm ">
                    <span>←</span>

                </button>
                <button type="button" class="btn btn-info btn-sm ">

                    <span>→</span>
                </button>
                <button type="button" class="btn btn-warning btn-sm " style="margin-left: 75px;" data-toggle="modal" data-target="#paiban06">
                    排版管理
                </button>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    预约管理
                </div>
                <div class="panel-body">
                    <div class="table-responsive" id="createtable">
                        <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">
                            <thead>
                                <tr id="Datetitle">
                                     <th>排版表</th>
                                    <th style="width: 120px">8月29日 星期一</th>
                                    <th>8月30日 星期二</th>
                                    <th>8月31日 星期三</th>
                                    <th>9月1日 星期四</th>
                                    <th>9月2日 星期五</th>
                                    <th>9月3日 星期五</th>
                                    <th>9月4日 星期六</th>
                                    <th>9月4日 星期六</th>
                                </tr>
                            </thead>
                            <tbody>
                             


                            </tbody>
                        </table>

                    </div>
                    <div class="row">
                        <div class="col-sm-6">

                            <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">1到10条 共57条</div>

                        </div>
                        <div class="col-sm-6">
                            <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                <ul class="pagination" style="margin: 0px 0;">
                                    <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="#">首页</a></li>
                                    <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="#">1</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">2</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">3</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">4</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">5</a></li>
                                    <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="#">6</a></li>
                                    <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="#">下一页</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--End Advanced Tables -->
        </div>
    </div>
    <!-- /. ROW  -->




    <!-- 按钮触发模态框 -->
    <!--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="Mymodel1">-->

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel" style="text-align: center">选择操作
                        <br>
                        <small>(2016/04/02 10:00-11:00 张老师)</small>


                    </h4>
                </div>
                <div class="modal-body">
                    <div id="xiao1" style="float: left; margin-left: 150px;" data-dismiss="modal">主动预约</div>
                    <div id="xiao2" style="float: left; margin-left: 50px;" data-dismiss="modal">修改咨询方式</div>

                </div>
                <!-- /.modal-content -->
                <div style="height: 50px"></div>
            </div>
            <!-- /.modal -->
        </div>
    </div>
    <!--主动预约-->
    <div class="modal fade" id="secondmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">主动预约
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="checkbox-inline">
                                <input type="radio" name="user" id="optionsRadios3" value="0" class="user01" />
                                已存在用户
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="user" id="optionsRadios4" value="1" class="user01" />
                                未注册用户
                            </label>

                        </div>
                        <div id="Nouser">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-lg-3">
                                    <input class="form-control" id="focusedInput" type="text" value="登录名..." />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">性别</label>
                                <div class="col-lg-3">
                                    <select class="form-control">
                                        <option>--请选择问题类型</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div id="user">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">登录名</label>
                                <div class="col-sm-10">
                                    <input class="form-control" id="focusedInput" type="text" value="登录名...">
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-2 control-label">问题类型</label>
                            <div class="col-sm-10">
                                <select class="form-control">
                                    <option>--请选择问题类型</option>
                                </select>
                            </div>
                        </div>
                        <fieldset disabled>
                            <div class="form-group">
                                <label for="disabledSelect" class="col-sm-2 control-label">
                                    咨询方式
                                </label>
                                <div class="col-sm-10">
                                    <select id="disabledSelect" class="form-control">
                                        <option>面谈</option>
                                    </select>
                                </div>
                            </div>
                        </fieldset>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="focusedInput" type="text" value="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">咨询类型</label>
                            <div class="col-sm-10">
                                <input class="form-control" id="focusedInput" type="text" value="">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        取消预约
                    </button>
                    <button type="button" class="btn btn-primary">
                        确定
                    </button>
                </div>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
    <!--修改预约方式-->
    <div class="modal fade" id="three03" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改预约方式
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">预约状态</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="yyfs">
                                    <option value="0">--开启--</option>
                                    <option value="1" selected="selected">--关闭--</option>
                                </select>
                            </div>
                        </div>
                        <div id="yyfszs">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">咨询方式</label>
                                <div class="col-sm-10">
                                    <select class="form-control">
                                        <option>--面谈--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">咨询地点</label>
                                <div class="col-sm-10">
                                    <select class="form-control">
                                        <option>--咨询室--</option>
                                    </select>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            关闭
                        </button>
                        <button type="button" class="btn btn-primary" id="method" data-dismiss="modal">
                            确定
                        </button>
                    </div>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!--团体咨询模拟框-->
    <div class="modal fade" id="tuanti04" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
         <form id="NewThem" method="post" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel01">团体咨询
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group" style="margin-left: 20%">
                            <label class="checkbox-inline">
                                <input type="radio" name="zhuti" value="0" class="Newzhuti" />新的主题
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="zhuti" value="1" class="Newzhuti" />已有主题
                            </label>
                        </div>
                        <div id="nothem">
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">主题</label>
                                <div class="col-sm-10">
                                    <input class="form-control input-sm" type="text" id="Them"  name="Them"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">内容</label>
                                <div class="col-sm-10">
                                    <input class="form-control input-lg" id="content" name="content" type="text" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">报名条件</label>
                                <div class="col-sm-10">
                                    <input class="form-control input-lg" id="EntryCondition" name="EntryCondition" type="text" />
                                </div>
                            </div>
                              
                             
                        </div>
                      
                        <div id="them">
                           
                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择主题</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="Changethem">
                                        <option value="2">--面谈--</option>
                                        <option value="3">--12--</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">咨询方式</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="CType" name="CType">
                                        <option value="2">--面谈--</option>
                                        <option value="3">5566</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group" id="textarea">
                                <label class="col-sm-2 control-label"></label>
                                <div class="col-sm-10 tuanti">
                                    <ul>
                                        <li></li>
                                        <li></li>
                                        <li></li>                                     
                                    </ul>                                   
                                </div>
                            </div>
                                  
                        </div>                            
                       </div>
                    </div>
                  <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            关闭
                        </button>
                        <button  type="submit" class="btn btn-primary" >
                            提交更改
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
             </form>
        </div>
    

    <!--已经预约的弹框-->
    <div class="modal fade" id="chakan05" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">查看
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal ">

                        <div class="form-group ">
                            <label class="col-sm-2 control-label">登录名：</label>
                            <div class="col-sm-10">
                                李芳芳
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名:</label>
                            <div class="col-sm-10">
                                李芳芳
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别:</label>
                            <div class="col-sm-10">
                                李芳芳
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">问题类型:</label>
                            <div class="col-sm-10">
                                李芳芳
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">咨询方式:</label>
                            <div class="col-sm-10">
                                李芳芳
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">联系方式:</label>
                            <div class="col-sm-10">
                                李芳芳
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">问题详情:</label>
                            <div class="col-sm-10">
                                李芳芳
                            </div>
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
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>
    <!--排班管理-->
    <div class="modal fade" id="paiban06" tabindex="-1" role="dialog" aria-labelledby="myModalLabel06" aria-hidden="true">
         <form class="form-horizontal" id="PaibanAdd" role="form">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel06">新增排班
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><span class="text-danger">*</span>咨询师</label>
                            <div class="col-sm-10">
                                <select class="form-control" id="Consultant" name="Consultant">
                                    <option value="1"> --张三--</option>
                                    <option value="2">--12--</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><span class="text-danger">*</span>咨询日期</label>
                            <div class="col-sm-4">
                                <input class="form-control input-sm" type="text" id="BDate" name="BDate"  placeholder="开始日期" onfocus="WdatePicker({minDate:'%y-%M-{%d}'})"   onclick="WdatePicker();" onblur="validTime()"  />
                            </div>

                            <div class="col-sm-4">
                                <input class="form-control input-sm" type="text" id="EDate" name="EDate" placeholder="结束日期"  onclick="WdatePicker();" onblur="validTime()"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"></label>
                            <div class="col-sm-10">
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox1" name="week" value="1" />
                                    星期一
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox2" name="week" value="2" />
                                    星期二
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" id="inlineCheckbox3" name="week" value="3" />
                                    星期三
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox"name="week" value="4" />
                                    星期四
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox"name="week" value="5" />
                                    星期五
                                </label>
                                  <label class="checkbox-inline">
                                    <input type="checkbox" name="week" value="6" />
                                    星期六
                                </label>
                                  <label class="checkbox-inline">
                                    <input type="checkbox" name="week" value="7" />
                                    星期日
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label"><span class="text-danger">*</span>咨询时间</label>
                            <div class="col-sm-4">
                                <input class="form-control input-sm" type="text" id="BTime" name="BTime" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'H:mm:ss'})"onblur="validTime1()" placeholder="开始时间"/>
                            </div>

                            <div class="col-sm-4">
                                <input class="form-control input-sm" type="text" id="EndTime" name="EndTime" onfocus="WdatePicker({skin:'whyGreen',dateFmt:'H:mm:ss'})"onblur="validTime1()" placeholder="结束时间"/>
                            </div>
                        </div>
                        <div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">咨询方式</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="ConselingType" name="ConselingType">
                                        <option value="0">--面谈--</option>
                                        <option value="1">--电话--</option>
                                         <option value="2">--在线--</option>
                                        <option value="3">面谈团</option>
                                         <option value="4">在线团</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">咨询地点</label>
                                <div class="col-sm-10">
                                    <select class="form-control" id="ConselingAddress" name="ConselingAddress">
                                        <option value="0">咨询室一</option>
                                         <option value="1">咨询室二</option>
                                         <option value="2">咨询室三</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">
                                提交更改
                            </button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">
                                关闭
                            </button>
                        </div>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
       </form>
    </div>
   <%-- 未预约--%>
    <div id="myTooltip" class="shadow target_box dn">
        <div class="form-group">
            <div class="col-sm-4 control-label">预约状态:</div>
            <div class="col-sm-8">
                未预约
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">咨询方式:</div>
            <div class="col-sm-8">
                面谈(团)
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">主题:</div>
            <div class="col-sm-8">
                面谈(团)
            </div>
            <div class="form-group">
                <div class="col-sm-4 control-label">内容:</div>
                <div class="col-sm-8">
                    面谈(团)
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">报名条件:</div>
            <div class="col-sm-8">
                未预约
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">咨询地点:</div>
            <div class="col-sm-4">
                未预约
            </div>
            <div class="col-sm-4" id="xiugai03">
                <a href="#">修改</a>
            </div>
        </div>

    </div>
    <%--已预约--%>
    <div id="myTooltip01" class="shadow target_box dn">
        <div class="form-group">
            <div class="col-sm-4 control-label">预约状态:</div>
            <div class="col-sm-8">
                未预约
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">咨询方式:</div>
            <div class="col-sm-8">
                面谈(团)
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">主题:</div>
            <div class="col-sm-8">
                面谈(团)
            </div>
            <div class="form-group">
                <div class="col-sm-4 control-label">内容:</div>
                <div class="col-sm-8">
                    面谈(团)
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">报名条件:</div>
            <div class="col-sm-8">
                未预约
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-4 control-label">咨询地点:</div>
            <div class="col-sm-4">
                未预约
            </div>
            <div class="col-sm-4" id="xiugai03">
                <a href="#">修改</a>
            </div>
        </div>
        <input type="hidden"  id="YYtimehid"/>
    </div>
    <div id="aaa">aaaaaa</div>
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../JS/bootstrap-select.min.js"></script>
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/defaults-zh_CN.js"></script>
    <script src="JS/ReservationManage.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
      <link href="../../CSS/common.css" rel="stylesheet" />
    <link href="../../CSS/powerFloat.css" rel="stylesheet" />
   
     <script src="../../JS/jquery-powerFloat-min.js"></script>
    <script>
        OnloadTitle();
        getModuleInfo();
        /*列表展现部分 */

        /*
               创建时间：2016-09-07
               创建人：刘玉京
               功能介绍：加载量表列表集合
       */
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引

        var LoginName = "";
        var RoleName = "";
        var departmentname = "";
        var sex = "";
        var dtDetail;
        //InitTable();
        function InitTable() {


            LoginName = $("#LoginName").val();
            RoleName = $("#RoleName").val();
            departmentname = $("#txt_search_departmentname").val();
            sex = $("#sex").val();
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
            dtDetail = $('#DataTables-Gauge').dataTable({
                serverSide: false,//分页，取数据等等的都放到服务端去
                searching: false,
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                aoColumnDefs: [
                    { //隐藏列
                        bVisible: true,
                        aTargets: [0]
                    },
                ],
                ajax: {
                    method: 'get',
                    url: "Ajax/Reservation.ashx",
                    dataSrc: "data",
                    data: function (d) {

                        //d.start;//开始的序号
                        //d.length;//要取的数据的
                        Endindex = 0;
                        Starindex = 0;
                        if (d.start == 0) {
                            Endindex = d.length;
                        } else {
                            Starindex = d.start + 1;
                            Endindex = d.start + d.length;
                        }
                        return 'type=6&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    $('td:eq(0)', row).html(" <input name=checkbox type=\"checkbox\" value=\"" + data[0] + "\" />");
                    var operation = "";
                    var Begin = data[12];
                    var end = data[13]
                    if (Begin != 0 && Begin != "" && end != "") {
                        var Timea = 3;//相差天数
                        var mydate = new Date();
                        var NowData = mydate.toLocaleDateString();
                        for (var i = 0; i < Timea; i++) {
                            var getdata = getBeforeDate(i);//算今天的日期
                            if (getdata == NowData) {
                                if (data[9] == 1) {

                                    if (data[10] == 0) {
                                        operation = " <button class=\"btn btn-success btn-sm\"id=\"MyTar\" onclick=\"editInfo(" + data[0] + ")\">" + data[11] + "</button>";
                                    }
                                    else if (data[10] == 1) {
                                        //btn btn-warning
                                        operation = " <button class=\"btn btn-danger  btn-sm\"id=\"MyTar\" onclick=\"editInfo(" + data[0] + ")\">" + data[11] + "</button>";
                                    }
                                    else if (data[9] == 0) {
                                        operation = " <button class=\"btn btn-success btn-sm\"id=\"MyTar\" onclick=\"editInfo(" + data[0] + ")\">" + data[11] + "</button>";
                                    }
                                    var a = 0
                                    a += 1;
                                }
                            }
                            $("td:eq(" + a + 1 + ")", row).html(operation);
                        }
                    } else {
                        operation = " <button class=\"btn btn-success btn-sm\"id=\"MyTar\" onclick=\"editInfo(" + data[0] + ")\">" + data[11] + "</button>";
                    }

                   
                   
                },

                //"oLanguage": {
                //    "sProcessing": "处理中...",
                //    "sLengthMenu": "_MENU_ 记录/页",
                //    "sZeroRecords": "没有匹配的记录",
                //    "sInfo": "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
                //    "sInfoEmpty": "显示第 0 至 0 项记录，共 0 项",
                //    "sInfoFiltered": "",
                //    "sInfoPostFix": "",
                //    "sSearch": "过滤:",
                //    "sUrl": "",
                //    "oPaginate": {
                //        "sFirst": "首页",
                //        "sPrevious": "上页",
                //        "sNext": "下页",
                //        "sLast": "末页"
                //    }
                //},
                initComplete: function (setting, json) {
                }
            });
        }

        getModuleInfo();
        $(document).on("click", "#go_search", function () {

            Title = $("#Title").val();
            if (dtDetail != undefined) {
                $("#dataTables-Inbox").DataTable().draw();
                return;
            }
        });



     
        function DatePicker(beginSelector, endSelector) {
            // 仅选择日期  
            $(beginSelector).datepicker(
            {
                language: "zh-CN",
                autoclose: true,
                startView: 0,
                format: "yyyy-mm-dd",
                clearBtn: true,
                todayBtn: false,
                endDate: new Date()
            }).on('changeDate', function (ev) {
                if (ev.date) {
                    $(endSelector).datepicker('setStartDate', new Date(ev.date.valueOf()))
                } else {
                    $(endSelector).datepicker('setStartDate', null);
                }
            })

            $(endSelector).datepicker(
            {
                language: "zh-CN",
                autoclose: true,
                startView: 0,
                format: "yyyy-mm-dd",
                clearBtn: true,
                todayBtn: false,
                endDate: new Date()
            }).on('changeDate', function (ev) {
                if (ev.date) {
                    $(beginSelector).datepicker('setEndDate', new Date(ev.date.valueOf()))
                } else {
                    $(beginSelector).datepicker('setEndDate', new Date());
                }

            })
        }
       
        //获取发布模块类型  
        function getModuleInfo() {
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "Ajax/Reservation.ashx?type=7",
                //data: { id: id, name: name },  
                success: function (json) {
                    var tbBody = "";
                    var typeData = json[0];
                    for (var i= 0; i < json.length; i++)
                    {
                    
                        tbBody = $("<tr><td>" + json[i].Name + "," + i + "</td><td>" + json[i].Week1 + "," + i + "</td><td>" + json[i].Week2 + "," + i + "</td><td>" + json[i].Week3 + "," + i + "</td><td>" + json[i].Week4 + "," + i + "</td><td>" + json[i].Week5 + "," + i + "</td><td>" + json[i].Week6 + "," + i + "</td><td>" + json[i].Week7 + "," + i + "</td><td>" + json[i].Week7 + "," + i + "</td><tr>");
                        $("#DataTables-Gauge").append(tbBody);
                   
                      
                    }
                  
                    },
                error: function (json) {
                    alert("加载失败");
                }
            });
        }
        //CreateTable(5, 8);
        //创建表格
        function CreateTable(rowCount, cellCount) {
            var table = $("<table class=\"table table-striped table-bordered table-hover\" id=\"DataTables-Gauges\">");
            table.appendTo($("#createtable"));

            for (var i = 0; i < rowCount; i++) {
                var tr = $("<tr></tr>");
                tr.appendTo(table);               
                for (var j = 0; j < cellCount; j++) {
                    
                    if (i == 0) {
                        var getdata = getBeforeDate(-j);
                        var th = $("<th>" + getdata + getweek(getdata) + "</th>");
                        th.appendTo(tr);
                    }
                    //else {
                    //    if (j == 0) {
                    //        var td = $("<td>" + getBeforeDate(0) + "," + j + "</td>");
                    //        td.appendTo(tr);
                    //    } else {
                    //    }
                    //}
                    
                }
            }
            trend.appendTo(table);
            $("#createtable").append("</table>");
        }
        //获取后几天的日期
        function getBeforeDate(n) {
            var n = n;
            var d = new Date();
            var year = d.getFullYear();
            var mon = d.getMonth() + 1;
            var day = d.getDate();
            if (day <= n) {
                if (mon > 1) {
                    mon = mon - 1;
                }
                else {
                    year = year - 1;
                    mon = 12;
                }
            }
            d.setDate(d.getDate() - n);
            year = d.getFullYear();
            mon = d.getMonth() + 1;
            day = d.getDate();
            s = year + "-" + (mon < 10 ? ('0' + mon) : mon) + "-" + (day < 10 ? ('0' + day) : day);
            return s;
        }
        //根据日期算星期
        function getweek(data) {
            var day = new Date(Date.parse(data));   //需要正则转换的则 此处为 ： var day = new Date(Date.parse(date.replace(/-/g, '/')));  
            var today = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
            var week = today[day.getDay()];
            return week;
        }

       
        function OnloadTitle() {

            var obj = 9;           
            $("#Datetitle").empty();        
            //var th = $("<th>" + getdata + getweek(getdata) + "</th>");
            for (var i = 0; i < obj; i++) {
                var pt = "";

                if (i == 0) {
                    pt = "<th>排版表</th>";
                }
                else {

                    var getdata = getBeforeDate(1 - i);

                    pt = "<th>" + getdata + getweek(getdata) + "</th>";

                }

                $("#Datetitle").append(pt);
            }
        }

        
    </script>
    <script>
        //target参数为选择器
        $("#MyTar").powerFloat({
            target: ".target_box"
        });
    </script>
</asp:Content>
