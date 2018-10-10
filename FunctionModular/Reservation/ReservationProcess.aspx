<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ReservationProcess.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Reservation.ReservationProcess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script src="../../JS/jquery-1.10.2.js"></script>
    <script src="../../JS/Reservation.js"></script>
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">预约咨询 <small>预约处理</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">预约处理</a></li>

            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 btn-info"  style="height:70%;">
                    <div class="col-xs-3" style="text-align:center" >主题:减肥小分队</div>
                    <div class="col-xs-3" style="text-align:center">时间:2014/8/30</div>
                    <div class="col-xs-2" style="text-align:center">咨询师:着医生</div>
                    <div class="col-xs-2" style="text-align:center" >咨询方式:面团</div>
                    <div class="col-xs-2" style="text-align:center" >咨询地点:面团</div>
                </div>
    </div>
    <div class="row" style="margin-bottom:10px;">
       
        <div class="col-md-12 col-sm-12 col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
                    <div class="widget-main slim-scroll content " data-height="60" style="margin-bottom:30px;margin-top:20px">
                        <button type="button" class="btn btn-warning btn-xs" style="float:right; margin-left:20px">关闭预约</button>
                        <button type="button" class="btn btn-info btn-xs" style="float:right" id="xiao1">主动预约</button>
                        

                    </div>
        </div>

     
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    预约处理
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                   <th>序号</th>
                                <th style="width:120px">登录名</th>
                                <th >姓名</th>
                                <th >部门</th>
                                <th >问题类型</th>
                                <th >详情</th>
                                <th >操作</th>                                  
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> <a href="#">查看</a></td>
                                    <td>接受</td>
                                   
                                </tr>
                                <tr class="even gradeC">
                                    <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                </tr>
                                <tr class="odd gradeA">
                                   <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                </tr>
                                <tr class="even gradeA">
                                     <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                       
                                </tr>
                                <tr class="odd gradeA">
                                    <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                        
                                </tr>
                                <tr class="even gradeA">
                                    <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                        
                                </tr>
                                <tr class="gradeA">
                                   <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                        
                                </tr>
                                <tr class="gradeA">
                                   <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                       
                                </tr>
                                <tr class="gradeA">
                                    <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                </tr>
                                <tr class="gradeA">
                                   <td>
                                        1
                                    </td>
                                    <td> 李芳芳 </td>
                                    <td>李芳芳</td>
                                    <td class="center">部门</td>
                                    <td class="center">问题类型</td>                                 
                                    <td data-toggle="modal" data-target="#chakan05"> 查看</td>
                                    <td>接受</td>
                                       
                                </tr>
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
   
    <!--主动预约-->
    <div class="modal fade" id="secondmodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        主动预约
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="form-horizontal">
                        <div class="form-group" style="margin-left:10px;">
                            <label class="checkbox-inline">
                                <input type="radio" name="user" id="optionsRadios3" value="0" class="user01"> 已存在用户
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="user" id="optionsRadios4" value="1" class="user01"> 未注册用户
                            </label>

                        </div>
                        <div id="Nouser">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">姓名</label>
                                <div class="col-lg-3">
                                    <input class="form-control" id="focusedInput" type="text" value="登录名...">
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
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->     
    <!--已经预约的弹框-->
    <div class="modal fade" id="chakan05" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        查看
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

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div>
    </div>
    

    <!-- 注销-->
    
</asp:Content>
