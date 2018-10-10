<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AArchives.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Archives.AArchives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">您当前位置：</a></li>
                <li><a href="#">个人档案</a></li>
            </ol>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3 col-sm-12 col-xs-12">
             <div class="panel ">
        <h1 style="margin-top: -3px;">小李的测评档案</h1>
             </div>
            </div>
        <div class="col-md-3 col-sm-12 col-xs-12">

            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    量表名称：
                </div>

                <div class="lb-panel-right pull-right">
                    <select class="form-control">
                        <option>不限</option>
                        <option>一量表</option>
                        <option>二量表</option>
                    </select>

                </div>
            </div>
        </div>

        <div class="col-md-2 col-sm-12 col-xs-12">
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
                    量表展示  
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>选择</th>
                                    <th>序号</th>
                                    <th>个案号</th>
                                    <th>登录名</th>
                                    <th>姓名</th>
                                    <th>接案时间</th>
                                    <th>进度</th>
                                    <th>量表来源</th>
                                    <th>操作</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="odd gradeX">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>1</td>
                                    <td>心理测评量表1</td>
                                    <td class="center">评量表1</td>
                                    <td class="center">表类别X</td>
                                    <td>24</td>
                                    <td>人群1</td>
                                    <td>系统量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button>
                                    </td>
                                </tr>
                                <tr class="even gradeC">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>2</td>
                                    <td>心理测评量表2</td>
                                    <td class="center">评量表2</td>
                                    <td class="center">表类别C</td>
                                    <td>25</td>
                                    <td>人群2</td>
                                    <td>组合量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>3</td>
                                    <td>心理测评量表3</td>
                                    <td class="center">评量表3</td>
                                    <td class="center">表类别A</td>
                                    <td>22</td>
                                    <td>人群3</td>
                                    <td>系统量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>4</td>
                                    <td>心理测评量表4</td>
                                    <td class="center">评量表4</td>
                                    <td class="center">表类别A</td>
                                    <td>50</td>
                                    <td>人群4</td>
                                    <td>组合量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>5</td>
                                    <td>心理测评量表5</td>
                                    <td class="center">评量表5</td>
                                    <td class="center">表类别A</td>
                                    <td>47</td>
                                    <td>人群5</td>
                                    <td>系统量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>6</td>
                                    <td>心理测评量表6</td>
                                    <td class="center">评量表6</td>
                                    <td class="center">表类别A</td>
                                    <td>12</td>
                                    <td>人群6</td>
                                    <td>组合量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>7</td>
                                    <td>心理测评量表7</td>
                                    <td class="center">评量表7</td>
                                    <td class="center">表类别A</td>
                                    <td>47</td>
                                    <td>人群7</td>
                                    <td>组合量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>8</td>
                                    <td>心理测评量表8</td>
                                    <td class="center">评量表8</td>
                                    <td class="center">表类别A</td>
                                    <td>32</td>
                                    <td>人群8</td>
                                    <td>自编量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>9</td>
                                    <td>心理测评量表9</td>
                                    <td class="center">评量表9</td>
                                    <td class="center">表类别A</td>
                                    <td>20</td>
                                    <td>人群9</td>
                                    <td>组合量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>10</td>
                                    <td>心理测评量表10</td>
                                    <td class="center">评量表10</td>
                                    <td class="center">表类别A</td>
                                    <td>20</td>
                                    <td>人群10</td>
                                    <td>自编量表</td>
                                    <td>
                                        <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                        <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
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
        </div>
    </div>

</asp:Content>
