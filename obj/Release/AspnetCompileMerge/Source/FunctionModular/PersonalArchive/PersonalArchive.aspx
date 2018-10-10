<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="PersonalArchive.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalArchive.PersonalArchive" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script>
        function ShowRights() {
            //iframe层
            layer.open({
                type: 2,
                title: '新建档案',
                area: ['100%', '90%'],
                fix: false,
                maxmin: true,
                content: '/FunctionModular/BasicSetting/ShowRights.html' //iframe的url
            });
        }
    </script>
    <div class="content">
        <div class="row">
            <div class="col-md-2 col-sm-12 col-xs-12">
            <input type="text" class="form-control" placeholder="个案号/登录名/姓名"/>
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12">
            <select class="form-control">
                <option selected="selected">--请选择进度--</option>
                <option>已完成</option>
                <option>未完成</option>
            </select>
        </div>            
            <div class="col-md-1">
                <button class="btn btn-search"><i class="fa fa-search">查&nbsp;询</i></button>
             </div>
            <div class="col-md-7">
                <button class="btn btn-info pull-right"><i class="fa fa-plus"></i>新档案</button>
            </div>
        </div>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">

                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>选择
                                        </th>
                                    <th>序号</th>
                                    <th>个案号</th>
                                    <th>登录名</th>
                                    <th>姓名</th>
                                    <th>接案时间</th>
                                    <th>进度</th>
                                    <th>咨询师</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>HZ101</td>
                                    <td class="center">liming</td>
                                    <td>李明</td>
                                    <td>2016-1-1</td>
                                    <td>已完成</td>
                                    <td>觉清大师</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>删除</button>
                                    </td>
                                </tr>
                                <tr class="even gradeC">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>2</td>
                                    <td>HZ102</td>
                                    <td class="center">xiaohong</td>
                                    <td>小红</td>
                                    <td>2016-1-2</td>
                                    <td>已完成</td>
                                    <td>觉清大师</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>删除</button>
                                    </td>
                                </tr>
                                                          
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="widget-header widget-hea1der-small">
                    <div class=" widget-header-flat" style="margin-top: 3px">
                        <div class="row">
                            <div class="col-md-1">
                                <input type="checkbox" class="ace" id="qx_w" /> 全选
                            </div>
                            <div class="btn-group">
                                
                                <button class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i>删&nbsp;除</button>
                                <button class="btn btn-info"><i class="glyphicon glyphicon-export bigger-125"></i>&nbsp;导&nbsp;出</button>
                                <button class="btn btn-info"><i class="fa fa-print bigger-125"></i>打印</button>
                            </div>
                        
                        </div>
                    </div>
                </div>
                <div class="widget-header widget-hea1der-small ">
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
</asp:Content>
