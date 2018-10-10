<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewArchives.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Archives.ViewArchives" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <li><a href="#">首页</a></li>
                <li><a href="#">量表管理</a></li>
                <li><a href="#">量表添加</a></li>
                <li><a href="#">维度组合添加</a></li>

            </ol>
        </div>
    </div>
    <!-- ROW  -->
    <div class="row">
        <div class="col-md-12 col-sm-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    量表信息
                </div>
                <div class="panel-body">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#home" data-toggle="tab">档案管理</a>
                        </li>
                        <li class=""><a href="#profile" data-toggle="tab">题目编辑</a>
                        </li>
                        <li class=""><a href="#messages" data-toggle="tab">评分设置</a>
                        </li>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade active in" id="home">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">基本信息</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row" style="margin: 15px 0px 0px 0px;">
                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                <div class="lb-panel-left pull-left blue">
                                                    个案号：
                                                </div>

                                                <div class="lb-panel-right pull-right">
                                                    <input class="form-control" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue">
                                                        重点关注：
                                                    </div>

                                                    <div class="lb-panel-right pull-right">
                                                        <div class="col-md-6 col-sm-12 col-xs-6" style="margin-top: 5px;">
                                                            <input type="checkbox" name="checkbox" id="" value="option1" checked="" />重点关注
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="margin-left: 14px; width: 30%;">
                                                        是否用户已存在：
                                                    </div>

                                                    <div class="lb-panel-right pull-right">
                                                        <div class="col-md-6 col-sm-12 col-xs-6" style="margin-top: 5px;">
                                                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">已存在用户
                                                        </div>
                                                        <div class="col-md-6 col-sm-12 col-xs-6" style="margin-top: 5px;">
                                                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">未注册用户
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-sm-12 col-xs-12">
                                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                <div class="lb-panel-left pull-left blue">
                                                    登录名：
                                                </div>

                                                <div class="lb-panel-right pull-right">
                                                    <input class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>



                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                                            <div class="lb-panel-left pull-left blue">
                                                个案来源：
                                            </div>

                                            <div class="lb-panel-right pull-right">
                                                <input class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                                            <div class="lb-panel-left pull-left blue">
                                                干预措施：
                                            </div>

                                            <div class="lb-panel-right pull-right">
                                                <input class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-sm-12 col-xs-12">
                                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                                            <div class="lb-panel-left pull-left blue">
                                                咨询师：
                                            </div>

                                            <div class="lb-panel-right pull-right">
                                                <input class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">访谈记录</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row" style="margin: 15px 0px 0px 0px;">
                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                <div class="lb-panel-left pull-left blue">
                                                    个案来源：
                                                </div>

                                                <div class="lb-panel-right pull-right">
                                                    <input type="date" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                <div class="lb-panel-left pull-left blue">
                                                    干预措施：
                                                </div>

                                                <div class="lb-panel-right pull-right">
                                                    <input class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3 col-sm-12 col-xs-12">
                                            <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                <div class="lb-panel-left pull-left blue">
                                                    咨询师：
                                                </div>

                                                <div class="lb-panel-right pull-right">
                                                    <input class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin: 15px 0px 0px 0px;">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="width: 10%;">
                                                        咨询缘由：
                                                    </div>

                                                    <div class="lb-panel-right pull-right" style="width: 85%;">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin: 15px 0px 0px 0px;">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="width: 10%;">
                                                        来访者自诉：
                                                    </div>

                                                    <div class="lb-panel-right pull-right" style="width: 85%;">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin: 15px 0px 0px 0px;">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="width: 10%;">
                                                        访谈过程：
                                                    </div>

                                                    <div class="lb-panel-right pull-right" style="width: 85%;">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin: 15px 0px 0px 0px;">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="width: 10%;">
                                                        诊断建议：
                                                    </div>

                                                    <div class="lb-panel-right pull-right" style="width: 85%;">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">结案总结</h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row" style="margin: 15px 0px 0px 0px;">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="width: 10%;">
                                                        来访者自诉：
                                                    </div>

                                                    <div class="lb-panel-right pull-right" style="width: 85%;">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin: 15px 0px 0px 0px;">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="width: 10%;">
                                                        访谈过程：
                                                    </div>

                                                    <div class="lb-panel-right pull-right" style="width: 85%;">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row" style="margin: 15px 0px 0px 0px;">
                                            <div class="col-md-12 col-sm-12 col-xs-12">
                                                <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                    <div class="lb-panel-left pull-left blue" style="width: 10%;">
                                                        诊断建议：
                                                    </div>

                                                    <div class="lb-panel-right pull-right" style="width: 85%;">
                                                        <textarea class="form-control" rows="2"></textarea>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade" id="profile">
                            <div class="row" style="margin-top: 15px;">
                                <div class="col-md-6 col-sm-12">
                                    <div class="panel panel-info">
                                        <div class="panel-heading">
                                            量表维度选择
                                        </div>
                                        <div class="panel-body">

                                            <div class="row">
                                                <div class="col-md-5 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 2px;">
                                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                        <div class="lb-panel-left pull-left blue">
                                                            量表分类：
                                                        </div>

                                                        <div class="lb-panel-right pull-right">

                                                            <select name="DropDownList2" id="DropDownList2" class="chosen-select" style="width: 100%; display: none;" data-placeholder="请选择量表">
                                                                <option value="-1" style="background-color: #e5e5e5;">==请选择分类==</option>

                                                            </select>


                                                            <div class="chosen-container chosen-container-single" style="width: 100%;" title="" id="DropDownList2_chosen">
                                                                <a class="chosen-single" tabindex="-1" style="border-radius: 0px; height: 35px; line-height: 35px; background-color: rgb(255, 255, 255);"><span>==请选择分类==</span><div><b></b></div>
                                                                </a>
                                                                <div class="chosen-drop">
                                                                    <div class="chosen-search">
                                                                        <input type="text" autocomplete="off">
                                                                    </div>
                                                                    <ul class="chosen-results">
                                                                        <li class="active-result result-selected" style="background-color: rgb(229, 229, 229);" data-option-array-index="0">==请选择分类==</li>
                                                                    </ul>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-5 col-sm-12 col-xs-12" style="padding-left: 0px; padding-right: 2px;">
                                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                        <div class="lb-panel-left pull-left blue">
                                                            量表名称：
                                                        </div>

                                                        <div class="lb-panel-right pull-right">
                                                            <select name="DropDownList2" id="DropDownList2" class="chosen-select" style="width: 100%; display: none;" data-placeholder="请选择量表">
                                                                <option value="-1" style="background-color: #e5e5e5;">==请选择量表==</option>

                                                            </select>


                                                            <div class="chosen-container chosen-container-single" style="width: 100%;" title="" id="DropDownList2_chosen">
                                                                <a class="chosen-single" tabindex="-1" style="border-radius: 0px; height: 35px; line-height: 35px; background-color: rgb(255, 255, 255);"><span>==请选择量表==</span><div><b></b></div>
                                                                </a>
                                                                <div class="chosen-drop">
                                                                    <div class="chosen-search">
                                                                        <input type="text" autocomplete="off">
                                                                    </div>
                                                                    <ul class="chosen-results">
                                                                        <li class="active-result result-selected" style="background-color: rgb(229, 229, 229);" data-option-array-index="0">==请选择量表==</li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="col-md-2 col-sm-12 col-xs-12">
                                                    <div class="panel-primary text-center  ">
                                                        <div class="pull-left ">
                                                            <button class="btn btn-search"><i class="fa fa-search "></i>查看</button>
                                                        </div>


                                                    </div>
                                                </div>


                                            </div>


                                            <div class="row">

                                                <div class="col-md-12 col-sm-12">
                                                    <div class="well well-lg">
                                                        <table cellpadding="0" cellspacing="0" style="border-width: 0;">
                                                            <tbody>
                                                                <tr>
                                                                    <td><a id="tvlbn0">
                                                                        <img src="/" alt="展开 " style="border-width: 0;"></a></td>
                                                                    <td style="white-space: nowrap;">
                                                                        <input type="checkbox" name="tvlbn0CheckBox" id="tvlbn0CheckBox"><a class="tvlb_0" href="javascript:__doPostBack('tvlb','s0')" onclick="TreeView_SelectNode(tvlb_Data, this,'tvlbt0');" id="tvlbt0"><span style="font-size: 14px">婚姻家庭测验</span></a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <table cellpadding="0" cellspacing="0" style="border-width: 0;">
                                                            <tbody>
                                                                <tr>
                                                                    <td><a id="tvlbn0">
                                                                        <img src="" alt="展开 " style="border-width: 0;"></a></td>
                                                                    <td style="white-space: nowrap;">
                                                                        <input type="checkbox" name="tvlbn0CheckBox" id="tvlbn0CheckBox"><a class="tvlb_0" href="javascript:__doPostBack('tvlb','s0')" onclick="TreeView_SelectNode(tvlb_Data, this,'tvlbt0');" id="tvlbt0"><span style="font-size: 14px">婚姻家庭测验</span></a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <table cellpadding="0" cellspacing="0" style="border-width: 0;">
                                                            <tbody>
                                                                <tr>
                                                                    <td><a id="tvlbn0">
                                                                        <img src="/WebResource.axd?d=UMlxyQahlokbkXmKffolQgo7tcujllCrtjAyBO5uMcaEl28MxCDrxQbbvxvWyjh4QAGq6j48y-q174OSE3ioHzgmD3OQAJONJ40Nhkuvf5CxOwRfNnWQnzthbKkhsWYL0&amp;t=635145356180000000" alt="展开 " style="border-width: 0;"></a></td>
                                                                    <td style="white-space: nowrap;">
                                                                        <input type="checkbox" name="tvlbn0CheckBox" id="tvlbn0CheckBox"><a class="tvlb_0" href="javascript:__doPostBack('tvlb','s0')" onclick="TreeView_SelectNode(tvlb_Data, this,'tvlbt0');" id="tvlbt0"><span style="font-size: 14px">婚姻家庭测验</span></a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <table cellpadding="0" cellspacing="0" style="border-width: 0;">
                                                            <tbody>
                                                                <tr>
                                                                    <td><a id="tvlbn0">
                                                                        <img src="/WebResource.axd?d=UMlxyQahlokbkXmKffolQgo7tcujllCrtjAyBO5uMcaEl28MxCDrxQbbvxvWyjh4QAGq6j48y-q174OSE3ioHzgmD3OQAJONJ40Nhkuvf5CxOwRfNnWQnzthbKkhsWYL0&amp;t=635145356180000000" alt="展开 " style="border-width: 0;"></a></td>
                                                                    <td style="white-space: nowrap;">
                                                                        <input type="checkbox" name="tvlbn0CheckBox" id="tvlbn0CheckBox"><a class="tvlb_0" href="javascript:__doPostBack('tvlb','s0')" onclick="TreeView_SelectNode(tvlb_Data, this,'tvlbt0');" id="tvlbt0"><span style="font-size: 14px">婚姻家庭测验</span></a></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>

                                            </div>


                                        </div>
                                        <div class="panel-footer" style="text-align: center;">
                                            <button class="btn btn-primary"><i class="fa fa-edit "></i>添加</button>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                    <div class="panel panel-warning">
                                        <div class="panel-heading">
                                            组合维度展示
                                        </div>
                                        <div class="panel-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>序号</th>
                                                            <th>量表名称</th>
                                                            <th>量表类别</th>
                                                            <th>维度名称</th>
                                                            <th>题目数量</th>
                                                            <th>操作</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr class="odd gradeX">

                                                            <td>1</td>
                                                            <td>心理测评量表1</td>
                                                            <td class="center">表类别X</td>
                                                            <td>人群1</td>
                                                            <td>24</td>


                                                            <td>
                                                                <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button>
                                                            </td>
                                                        </tr>
                                                        <tr class="even gradeC">

                                                            <td>2</td>
                                                            <td>心理测评量表2</td>
                                                            <td class="center">表类别C</td>
                                                            <td>人群2</td>
                                                            <td>25</td>


                                                            <td>
                                                                <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                                        </tr>
                                                        <tr class="odd gradeA">

                                                            <td>3</td>
                                                            <td>心理测评量表3</td>
                                                            <td class="center">表类别A</td>
                                                            <td>人群3</td>
                                                            <td>22</td>


                                                            <td>
                                                                <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                                        </tr>
                                                        <tr class="even gradeA">

                                                            <td>4</td>
                                                            <td>心理测评量表4</td>
                                                            <td class="center">表类别A</td>
                                                            <td>人群4</td>
                                                            <td>50</td>


                                                            <td>
                                                                <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                                        </tr>
                                                        <tr class="odd gradeA">

                                                            <td>5</td>
                                                            <td>心理测评量表5</td>
                                                            <td class="center">表类别A</td>
                                                            <td>人群5</td>
                                                            <td>47</td>

                                                            <td>
                                                                <button class="btn btn-danger"><i class="fa fa-pencil"></i>删除</button></td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                        <div class="panel-footer" style="text-align: center;">
                                            <button class="btn btn-warning"><i class="fa fa-pencil"></i>保存</button>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>
                        <div class="tab-pane fade" id="messages">

                            <div class="row" style="margin-top: 15px;">

                                <div class="col-md-4">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            维度列表
                                        </div>

                                        <div class="panel-body">
                                            <div class="alert alert-danger">
                                                <strong style="margin-right: 10px;">维度1</strong>未保存
                                            </div>
                                            <div class="alert alert-info">
                                                <strong style="margin-right: 10px;">维度2</strong>已保存
                                            </div>
                                            <div class="alert alert-danger">
                                                <strong style="margin-right: 10px;">维度3</strong>未保存
                                            </div>
                                            <div class="alert alert-info">
                                                <strong style="margin-right: 10px;">维度4</strong>已保存
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-md-8">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            维度设置--维度1
                                        </div>

                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                        <div class="lb-panel-left pull-left blue">
                                                            计分方式：
                                                        </div>

                                                        <div class="lb-panel-right pull-right">
                                                            <div class="col-md-6 col-sm-12 col-xs-6" style="margin-top: 5px;">
                                                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">原始分数
                                                            </div>
                                                            <div class="col-md-6 col-sm-12 col-xs-6" style="margin-top: 5px;">
                                                                <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">转化分数
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                        <div class="lb-panel-left pull-left blue">
                                                            转化公式：
                                                        </div>

                                                        <div class="lb-panel-right pull-right">
                                                            <textarea class="form-control" rows="2"></textarea>
                                                        </div>
                                                    </div>

                                                </div>

                                            </div>


                                            <div class="row">
                                                <div class="col-md-12 col-sm-12 col-xs-12">
                                                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                                                        <div class="lb-panel-left pull-left blue">
                                                            选择常模：
                                                        </div>

                                                        <div class="lb-panel-right pull-right">
                                                            <div class="col-md-8 col-sm-8 col-xs-8" style="padding-left: 0px; padding-right: 0px;">
                                                                <select class="form-control">
                                                                    <option>默认常模</option>
                                                                    <option>自定义1</option>
                                                                    <option>自定义1</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4 col-sm-4 col-xs-4" style="padding-right: 0px; padding-left: 0px;">
                                                                <button class="btn btn-primary"><i class="fa fa-edit "></i>添加</button>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12 col-sm-12">

                                                    <!--   Kitchen Sink -->
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            评分说明
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-striped table-bordered table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>名称</th>
                                                                            <th>分之范围</th>
                                                                            <th>分值说明</th>
                                                                            <th>辅导建议</th>
                                                                            <th>操作</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>
                                                                            <td>
                                                                                <input class="form-control" style="width: 80px;">
                                                                            </td>
                                                                            <td>
                                                                                <input class="form-control" style="width: 120px;">
                                                                            </td>
                                                                            <td>
                                                                                <input class="form-control" style="width: 120px;">
                                                                            </td>
                                                                            <td>
                                                                                <input class="form-control" style="width: 120px;">
                                                                            </td>
                                                                            <td><a href="#" class="btn btn-primary btn-sm">+</a>
                                                                                <a href="#" class="btn btn-danger btn-sm">-</a>

</td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- End  Kitchen Sink -->

                                                </div>
                                            </div>


                                            <div class="row">
                                                <div class="col-md-12 col-sm-12">

                                                    <!--   Kitchen Sink -->
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            预警设置
                                                        </div>
                                                        <div class="panel-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-striped table-bordered table-hover">
                                                                    <thead>
                                                                        <tr>
                                                                            <th>级别</th>
                                                                            <th>分值范围</th>
                                                                            <th>操作</th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <tr>

                                                                            <td>
                                                                                <input class="form-control" style="width: 150px;">
                                                                            </td>
                                                                            <td>
                                                                                <input class="form-control" style="width: 150px;">
                                                                            </td>

                                                                            <td><a href="#" class="btn btn-primary btn-sm">+</a>
                                                                                <a href="#" class="btn btn-danger btn-sm">-</a>

</td>
                                                                        </tr>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- End  Kitchen Sink -->

                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                    <div class="row" style="text-align: center;">
                                        <a href="#" class="btn btn-primary">保存</a>
                                    </div>
                                </div>

                            </div>
                            <!-- /. ROW  -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
