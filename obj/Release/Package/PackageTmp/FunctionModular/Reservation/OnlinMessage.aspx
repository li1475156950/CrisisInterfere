<%@ Page Title="在线留言" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="OnlinMessage.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Reservation.OnlinMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

			 <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">预约咨询 <small>在线留言</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">在线留言</a></li>

            </ol>
        </div>
    </div>
                 <!-- /. ROW  -->

<div class="row">
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    预约状态：
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
                    输入关键字：
                </div>

                <div class="lb-panel-right pull-right">
                    <input class="form-control" />
                </div>
            </div>
        </div>      
        <div class="col-md-4 col-sm-12 col-xs-12" >
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                    <button class="btn btn-search"><i class="fa fa-search "></i>查询</button>
                </div>

               
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->
            <div class="panel panel-default">
                <div class="panel-heading">
                    在线留言
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>选择</th>
                                    <th>序号</th>
                                    <th>留言者</th>
                                    <th>咨询师</th>
                                    <th>内容</th>
                                    <th>最后咨询时间</th>                                                             
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                 
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="even gradeC">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                   
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                    
                                  
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="even gradeA">
                                   <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                    
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="odd gradeA">
                                   <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                   
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="even gradeA">
                                     <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                  
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                   
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                   
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="gradeA">
                                  <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
                                  
                                  
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>小明</td>
                                    <td class="center">王老师</td>
                                    <td class="center">内容</td>
                                    <td>最后咨询时间</td>
             
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>查看</button>
                                      
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="row">
                        <div class="col-sm-6">

                            <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all"> <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value=""/>全选
                                                </label>
                                                    <a href="#" class="btn btn-danger btn-sm">删除</a>
                                                    <a href="#" class="btn btn-primary btn-sm">导出</a>
                                                    
                                            </div></div>

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
               
       
</asp:Content>
