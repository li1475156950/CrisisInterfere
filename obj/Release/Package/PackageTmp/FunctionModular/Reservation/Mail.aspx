<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Mail.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Reservation.Mail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    
   <%-- <div class="row">
        <div class="col-md-12">

            <h1 class="page-header">站内信<small>站内信</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">站内信</a></li>
            </ol>
        </div>
    </div>
    <!-- /. ROW  -->
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                   站内信
                </div>
                <div class="panel-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">收件箱</a>
                        </li>
                        <li class=""><a href="#profile" data-toggle="tab">发件箱</a>
                        </li>
                        <li class=""><a href="#messages" data-toggle="tab">草稿箱</a>
                        </li>

                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="home">

                            <div class="row" style="margin-top:15px;">
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    收件箱：
                </div>

                <div class="lb-panel-right pull-right">
                     <input   class="form-control"/>

                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                    <button class="btn btn-search"><i class="fa fa-search "></i>查询</button>
                </div>               
            </div>
        </div>
 <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                   <h3>收件箱</h3>
                </div>               
            </div>
        </div>

    </div>

                           <div class="row">
       <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                    <th>选框</th>
                                    <th>序号</th>
                                    <th>内容</th>
                                    <th>来源</th>
                                    <th>时间</th>
                                    
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
                                  
                                    <td>
                                           <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                      
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
                                   
                                    <td>
                                      
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>3</td>
                                    <td>心理测评量表3</td>
                                    <td class="center">评量表3</td>
                                    <td class="center">表类别A</td>
                                   
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                      
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>4</td>
                                    <td>心理测评量表4</td>
                                    <td class="center">评量表4</td>
                                    <td class="center">表类别A</td>
                                   
                                    <td>
                                     
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>5</td>
                                    <td>心理测评量表5</td>
                                    <td class="center">评量表5</td>
                                    <td class="center">表类别A</td>
                                   
                                    <td>
                                       
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>6</td>
                                    <td>心理测评量表6</td>
                                    <td class="center">评量表6</td>
                                    <td class="center">表类别A</td>                           
                                    <td>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>7</td>
                                    <td>心理测评量表7</td>
                                    <td class="center">评量表7</td>
                                    <td class="center">表类别A</td>
                                   
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>8</td>
                                    <td>心理测评量表8</td>
                                    <td class="center">评量表8</td>
                                    <td class="center">表类别A</td>
                                   
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>9</td>
                                    <td>心理测评量表9</td>
                                    <td class="center">评量表9</td>
                                    <td class="center">表类别A</td>
                                   
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>10</td>
                                    <td>心理测评量表10</td>
                                    <td class="center">评量表10</td>
                                    <td class="center">表类别A</td>
                                   
                                    <td>
                                         <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                            </tbody>
                        </table>

                    </div>
                    <div class="row">
                        <div class="col-sm-6">

                            <div class="dataTables_info" id="dataTables-example_info" role="alert" aria-live="polite" aria-relevant="all">
                              <input type="checkbox"   value="全选"/>全选
                                 <button class="btn btn-danger btn-sm" style="margin-left:20px;"><i class="fa fa-pencil"></i>删除</button></div>

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
                        <div class="tab-pane fade" id="profile">
                                 <div class="row" style="margin-top:15px;">
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                   发件箱：
                </div>

                <div class="lb-panel-right pull-right">
                     <input   class="form-control"/>

                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                    <button class="btn btn-search"><i class="fa fa-search "></i>查询</button>
                </div>               
            </div>
        </div>
 <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                   <h3>发件箱</h3>
                </div>               
            </div>
        </div>

    </div>
                            <div class="row">
                                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                   <th>选框</th>
                                    <th>序号</th>
                                    <th>内容</th>
                                    <th>来源</th>
                                    <th>时间</th>
                                    
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
                                    <td>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button>
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
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>3</td>
                                    <td>心理测评量表3</td>
                                    <td class="center">评量表3</td>
                                    <td class="center">表类别A</td>                                 
                                    <td>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>4</td>
                                    <td>心理测评量表4</td>
                                    <td class="center">评量表4</td>
                                    <td class="center">表类别A</td>                                 
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>5</td>
                                    <td>心理测评量表5</td>
                                    <td class="center">评量表5</td>
                                    <td class="center">表类别A</td>                                 
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>6</td>
                                    <td>心理测评量表6</td>
                                    <td class="center">评量表6</td>
                                    <td class="center">表类别A</td>                                
                                    <td>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>7</td>
                                    <td>心理测评量表7</td>
                                    <td class="center">评量表7</td>
                                    <td class="center">表类别A</td>                                
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>8</td>
                                    <td>心理测评量表8</td>
                                    <td class="center">评量表8</td>
                                    <td class="center">表类别A</td>                                 
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>9</td>
                                    <td>心理测评量表9</td>
                                    <td class="center">评量表9</td>
                                    <td class="center">表类别A</td>                                  
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>10</td>
                                    <td>心理测评量表10</td>
                                    <td class="center">评量表10</td>
                                    <td class="center">表类别A</td>                                
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
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
                        <div class="tab-pane fade" id="messages">

                                  <div class="row" style="margin-top:15px;">
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel panel-primary text-center no-boder bg-color-blue">
                <div class="lb-panel-left pull-left blue">
                    草稿箱：
                </div>

                <div class="lb-panel-right pull-right">
                     <input   class="form-control"/>

                </div>
            </div>
        </div>
        <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                    <button class="btn btn-search"><i class="fa fa-search "></i>查询</button>
                </div>               
            </div>
        </div>
 <div class="col-md-3 col-sm-12 col-xs-12">
            <div class="panel-primary text-center  ">
                <div class="pull-left ">
                   <h3>草稿箱</h3>
                </div>               
            </div>
        </div>

    </div>
                            <!-- /. ROW  -->
                            <div class="row">
                                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                                <tr>
                                  <th>选框</th>
                                    <th>序号</th>
                                    <th>内容</th>
                                    <th>来源</th>
                                    <th>时间</th>
                                    
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
                                   
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button>
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
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>3</td>
                                    <td>心理测评量表3</td>
                                    <td class="center">评量表3</td>
                                    <td class="center">表类别A</td>                                
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>4</td>
                                    <td>心理测评量表4</td>
                                    <td class="center">评量表4</td>
                                    <td class="center">表类别A</td>                                
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="odd gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>5</td>
                                    <td>心理测评量表5</td>
                                    <td class="center">评量表5</td>
                                    <td class="center">表类别A</td>                               
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="even gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>6</td>
                                    <td>心理测评量表6</td>
                                    <td class="center">评量表6</td>
                                    <td class="center">表类别A</td>                              
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>7</td>
                                    <td>心理测评量表7</td>
                                    <td class="center">评量表7</td>
                                    <td class="center">表类别A</td>                         
                                    <td>
                                       <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>8</td>
                                    <td>心理测评量表8</td>
                                    <td class="center">评量表8</td>
                                    <td class="center">表类别A</td>                         
                                    <td>
                                      <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>9</td>
                                    <td>心理测评量表9</td>
                                    <td class="center">评量表9</td>
                                    <td class="center">表类别A</td>
                                    <td>
                                      <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
                                </tr>
                                <tr class="gradeA">
                                    <td>

                                        <input type="checkbox" value="" />

                                    </td>
                                    <td>10</td>
                                    <td>心理测评量表10</td>
                                    <td class="center">评量表10</td>
                                    <td class="center">表类别A</td>
                                    <td>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>跳转至</button>
                                        <button class="btn btn-search btn-sm"><i class="fa fa-search "></i>回复</button>
                                        <button class="btn btn-primary btn-sm"><i class="fa fa-edit "></i>查看</button>
                                        <button class="btn btn-danger btn-sm"><i class="fa fa-pencil"></i>删除</button></td>
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
                </div>
            </div>
        </div>

    </div>--%>
    <!-- /. ROW  -->
</asp:Content>
