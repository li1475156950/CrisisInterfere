<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HeartEvaluationAdd.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.HeartEvaluationAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/TreeTables/master.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/bootstrap-switch.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <script src="../../JS/jquery.form.js"></script>
    <script src="../../JS/layer.js"></script>
    <script type="text/javascript" src="../../JS/TreeTables/jquery.js"></script>
    <script type="text/javascript" src="../../JS/TreeTables/jquery.treeTable.js"></script>


    <script src="../../JS/Highcharts/highcharts.js"></script>
    <script src="../../JS/Highcharts/highcharts-more.js"></script>

    <style>
        /* "变灰"效果*/
        .disableHref {
            cursor: default;
            color: #E5E0E0;
            text-decoration: none;
            margin: 10px 10px 0px 10px;
        }


        /* active style goes here */
        input[type=checkbox]:checked + span {
            background-color: red;
        }

        .groupbox {
            margin: 15px;
            border: thin solid #09C;
            padding: 10px;
        }

        .grouptitle {
            display: block;
            margin-top: -24px;
            margin-left: 20px;
            width: 150px;
            text-align: center;
            background-color: #09C;
        }

        .groupfoot {
            display: block;
            margin-bottom: -24px;
            float: right;
            margin-right: 20px;
            width: 80px;
            text-align: center;
            background-color: RGB(245,248,253);
        }
    </style>
    <div class="row">
        <div class="col-md-12">

            <%--          <h1 class="page-header">维度量表添加<small>量表管理</small>
                </h1>--%>
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">量表管理</a></li>
                <li><a href="#" style="color: #666;">量表添加</a></li>
                <li><a href="#" style="color: #000;">维度组合添加</a></li>
            </ol>
        </div>
    </div>
    <!-- /. ROW  -->


    <div class="row">
        <div class="col-md-12 col-sm-12">

            <ul class="nav nav-tabs-lyj">
                <li class="active"><a href="#home" id="l_home" data-toggle="tab">量表介绍</a>
                </li>
                <li class="" id="BJ">
                    <p>题目编辑</p>

                </li>
                <li class="" id="SZ">
                    <p>评分设置</p>
                </li>
                <li style="float: right;">
                    <button class="btn btn-bm btn-sm" style="margin-top: 5px; margin-right: 3px;" onclick="jump()">返回</button>

                </li>
            </ul>

            <div class="tab-content" style="margin-top: 60px;">

                <div class="tab-pane fade active in" id="home">


                    <form id="AmountInfoAdd" class="form-horizontal" role="form">
                        <div class="row" style="margin: 15px 0px 0px 0px;">

                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="panel text-center bg-color-blue">
                                    <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                        量表名称：
                                    </div>

                                    <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                        <input class="form-control" id="GaugeName" maxlength="30" style="width: 100%" name="GaugeName" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="panel text-center bg-color-blue">
                                    <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                        量表类型：
                                    </div>

                                    <div class="lb-panel-right pull-right" style="background-color: white">
                                        <select name="AmountType" class="selectpicker" data-done-button="true" data-live-search="true" data-placeholder="请选择量表类型..." id="Sel_AmountType" style="width: 100%; line-height: 30px;">
                                        </select>


                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="panel text-center bg-color-blue">
                                    <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                        显示名称：
                                    </div>

                                    <div class="lb-panel-right pull-right  form-group" style="margin-right: 0px;">
                                        <input type="text" id="DisplayName" name="DisplayName" class="form-control" />
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="panel text-center bg-color-blue">
                                    <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                        适用人群：
                                    </div>

                                    <div class="lb-panel-right pull-right">
                                        <input type="text" id="ApplyPeoples" name="ApplyPeoples" class="form-control" />
                                    </div>
                                </div>
                            </div>


                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="panel text-center bg-color-blue">
                                    <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                        量表介绍：
                                    </div>

                                    <div class="lb-panel-right pull-right">
                                        <textarea class="form-control" rows="2" id="Marks" name="Marks"></textarea>
                                    </div>
                                </div>
                            </div>



                            <div class="col-md-6 col-sm-12 col-xs-12">
                                <div class="panel text-center bg-color-blue">
                                    <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                        指导语：
                                    </div>

                                    <div class="lb-panel-right pull-right">
                                        <textarea class="form-control" rows="2" id="Guidance" name="Guidance"></textarea>
                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="row" style="text-align: center; margin-top: 20px;">
                            <button type="submit" class="btn btn-sm btn-info">保存</button>
                        </div>
                    </form>
                </div>


                <div class="tab-pane fade" id="profile">
                    <%--      <select class="chosen-select" style="width: 170px;" id="Sel_AmountType2">
                </select>--%>

                    <div class="row">

                        <div class="groupbox" style="margin-top: 10px;">
                            <span class="grouptitle">量表维度选择</span>
                            <div class="panel-body easypiechart-panel">

                                <div class="row" style="margin-top: 15px;">
                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                        <div class="panel text-center bg-color-blue">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                                量表名称：
                                            </div>
                                            <div class="lb-panel-right pull-right" style="background-color: white">
                                                <select class="selectpicker" data-done-button="true" data-live-search="true" data-placeholder="请选择成员..." style="width: 100%;" id="Sel_AmountName2">
                                                </select>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                        <div class="panel text-center bg-color-blue">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                                量表类型：
                                            </div>
                                            <div class="lb-panel-right pull-right" style="background-color: white">
                                                <select class="selectpicker" data-done-button="true" data-live-search="true" data-placeholder="请选择成员..." style="width: 100%;" id="Sel_AmountType2">
                                                </select>
                                            </div>

                                        </div>
                                    </div>

                                    <div class="col-md-4 col-sm-12 col-xs-12">
                                        <div class="panel-primary text-center  ">
                                            <%--<button class="btn btn-search"><i class="fa fa-search "></i>查看</button>--%>
                                            <button class="btn btn-search" onclick="OnloadAmountDimension();"><i class="fa fa-search "></i>查看</button>
                                        </div>
                                    </div>


                                </div>


                                <div class="row" style="margin-top: 5px;">

                                    <div class="col-md-12 col-sm-12">
                                        <div class="table-responsive" style="text-align: left; height: 150px; overflow: auto;">
                                            <table class="table table-striped table-bordered table-hover" id="AmountDimension_Table">
                                                <thead>
                                                    <tr>
                                                        <th>名称</th>
                                                        <th>描述</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>


                            </div>
                        </div>
                    </div>


                    <div class="row" style="margin-top: 15px;">
                        <div class="groupbox">
                            <span class="grouptitle">组合展示</span>
                            <div class="panel-body easypiechart-panel">
                                <div class="table-responsive" style="margin-top: 20px;">
                                    <table class="table table-striped table-bordered table-hover" id="SourceDimensionTable">
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
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="text-align: center; margin-top: 20px;">
                        <button type="submit" class="btn btn-sm btn-info" onclick="SaveDimensionFun();">保存</button>
                    </div>

                </div>






                <div class="tab-pane fade" id="messages">

                    <div class="row" style="margin-top: 15px;">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body" style="background-color: RGB(245,248,253);">


                                    <div class="row">
                                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                维度名称：
                                            </div>

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-bottom: 15px;">

                                            <select name="AmountType" class="selectpicker" data-done-button="true" onchange="InitNorm('');" data-live-search="true" data-placeholder="请选择成员..." id="Sel_Dimension" style="width: 100%; line-height: 30px;">
                                            </select>

                                        </div>

                                        <div class="col-md-2 col-sm-12 col-xs-4" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                计分方式：
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-8" style="margin-bottom: 15px;">
                                            <div class="make-switch" data-on="info" data-off="success">
                                                <input type="checkbox" onclick="CK_Set(this)" onchange="CK_Set(this)" id="CK_F_Type" checked="checked" />
                                            </div>

                                        </div>
                                    </div>




                                    <div class="row" id="JF_Title" style="display: none;">
                                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                计分公式：
                                            </div>
                                        </div>
                                        <div class="col-md-10 col-sm-12 col-xs-12" id="JF_Content" style="margin-bottom: 15px; display: none;">
                                            <textarea class="form-control" id="textarea_formula" rows="3" placeholder="计分公式"></textarea>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 100%;">
                                                选择常模：
                                            </div>
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9" style="margin-bottom: 15px;">
                                            <select style="width: 100%;" id="Sel_Norm">
                                            </select>
                                        </div>
                                        <div class="col-md-1 col-sm-1 col-xs-1" style="margin-bottom: 15px;">
                                            <button class="btn btn-default-zblb" onclick="AddModel();" type="button" style="float: right; background-color: RGB(245,248,253);"><i class="fa fa-plus" style="color: green;" aria-hidden="true"></i></button>
                                        </div>
                                    </div>


                                    <div class="col-md-12 col-sm-12 col-xs-12" id="Model_Message" style="margin-bottom: 15px; padding-left: 0px; padding-right: 0px; display: none;">

                                        <div class="groupbox" style="margin-top: 10px;">
                                            <span class="grouptitle">
                                                <input type="text" id="T_Norm_Title" maxlength="20" name="ApplyPeoples" placeholder="请填写常模名称" class="form-control" /></span>
                                            <div class="panel-body easypiechart-panel">

                                                <div class="row" style="margin-top: 5px;">
                                                    <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px; margin-top: 15px;">
                                                        <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                            解释说明：
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 5px;">

                                                    <div class="col-md-12 col-sm-12  col-xs-12 ">
                                                        <div class="table-responsive" style="text-align: left;">
                                                            <table class="table table-striped table-bordered table-hover" id="Explain_Table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>名称</th>
                                                                        <th>年龄</th>
                                                                        <th>性别</th>
                                                                        <th>分值范围</th>
                                                                        <th>分值说明</th>
                                                                        <th>辅导建议</th>
                                                                        <th>操作</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12  col-xs-12 ">
                                                        <button class="btn btn-default-zblb" onclick="Add_JS();" type="button" style="float: right; background-color: RGB(245,248,253);"><i class="fa fa-plus" style="color: green;" aria-hidden="true"></i></button>
                                                    </div>

                                                </div>


                                                <div class="row" style="margin-top: 5px;">
                                                    <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px; margin-top: 15px;">
                                                        <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                            预警设置：
                                                        </div>

                                                    </div>
                                                </div>



                                                <div class="row" style="margin-top: 5px;">

                                                    <div class="col-md-12 col-sm-12  col-xs-12 ">
                                                        <div class="table-responsive" style="text-align: left;">
                                                            <table class="table table-striped table-bordered table-hover" id="Warning_Table">
                                                                <thead>
                                                                    <tr>
                                                                        <th>预警名称</th>
                                                                        <th>分值范围</th>
                                                                        <th>操作</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 col-sm-12  col-xs-12 ">
                                                        <button class="btn btn-default-zblb" onclick="Add_W();" type="button" style="float: right; background-color: RGB(245,248,253);"><i class="fa fa-plus" style="color: green;" aria-hidden="true"></i></button>
                                                    </div>
                                                </div>
                                            </div>
                                            <span class="groupfoot" style="margin-top: -5px;">

                                                <a href="#" class="btn btn-danger btn-sm" onclick="SaveScore();">保存常模</a></span>
                                            <%-- <input type="text" id="T_Norm_foot" name="ApplyPeoples" placeholder="请填写常模名称" class="form-control" /></span>--%>
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



    <!-- 常模-解释说明添加  -->
    <div class="modal fade" id="Model_Pnale" tabindex="-1" role="dialog" aria-labelledby="Model_Pnale" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 5%; width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="">解释说明
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    名称：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <input class="form-control" id="Norm_Title" style="width: 100%" name="GaugeName" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    年龄：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input class="form-control" id="StartAge" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0px; padding-right: 0px;">-</div>
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input class="form-control" id="EndAge" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    性别：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <select class="selectpicker" data-done-button="true" data-live-search="true" data-placeholder="请选择成员..." style="width: 100%;" id="Sel_M_Sex">
                                        <option value="0">全部</option>
                                        <option value="1">男</option>
                                        <option value="2">女</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    分值范围：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">

                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input class="form-control" id="Start_Fraction" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" style="width: 100%" name="GaugeName" />
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0px; padding-right: 0px;">-</div>
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input class="form-control" id="End_Fraction" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" style="width: 100%" name="GaugeName" />
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    分值说明：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <textarea class="form-control" id="Fraction_Explain" rows="3" placeholder="分值说明"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    辅导建议：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <textarea class="form-control" id="Coach_Text" rows="3" placeholder="辅导建议"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                    <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                        取消
                    </button>
                    <button onclick="SaveExplain();" type="button" class="btn btn-primary">
                        保存
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 常模-预警设置  -->
    <div class="modal fade" id="Model_Warning" tabindex="-1" role="dialog" aria-labelledby="Model_Warning" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 5%; width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="">预警设置
                    </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    预警名称：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <input class="form-control" id="Warning_Title" style="width: 100%" name="GaugeName" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    分值范围：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input class="form-control" id="Start_Warning_Fun" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0px; padding-right: 0px;">-</div>
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input class="form-control" id="End_Warning_Fun" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                    <button type="button" class="btn btn-default"
                        data-dismiss="modal">
                        取消
                    </button>
                    <button onclick="SaveWarning();" type="button" class="btn btn-primary">
                        保存
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>




    <%--    <script src="../../JS/bootstrap.min.js"></script>此js和bootstrap-select.min.js冲突--%>
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-switch.min.js" charset="gb2312"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <%--  <script src="../../JS/bootstrap.min.js"></script>--%>
    <script>



        /*页面公共参数定义*/
        var CombinationJson = "";//量表维度点选记录
        var AmountCode = "";//操作的量表编码
        /*页面公共参数定义End*/

        initSelectInput("Remark=AmountType", "Sel_AmountType2", "全部分类");//初始化量表类别
        initSelectInput("Remark=AmountType", "Sel_AmountType", "全部分类");//初始化量表类别
        initSelectInput("Remark=InitNameSelect", "Sel_AmountName2", "全部量表");//初始化量表名称
        /*------------添加量表描述操作----------------*/


        $('#AmountInfoAdd').bootstrapValidator({
            message: '表单验证失败.',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                GaugeName: {
                    message: '量表名称验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '量表名称不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 30,
                            message: '量表名长度必须介于2到30之间'
                        },
                        threshold: 3,
                        remote: {
                            url: "Ajax/HeartEvaluationAdd.ashx?Remark=Exists",
                            message: '量表名称重复。',
                            delay: 2000,
                            type: "GET",

                        },
                        regexp: {
                            regexp: /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/,
                            message: '角色名不能包含特殊字符。'
                        }
                    }
                },
                AmountType: {
                    validators: {
                        callback: {
                            message: '请选择量表类型',
                            callback: function (value, validator) {
                                // Determine the numbers which are generated in captchaOperation
                                return value != 0;
                            }
                        }
                    }
                },
                DisplayName: {
                    message: '量表显示名称验证失败',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '量表显示名称不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 30,
                            message: '量表显示名长度必须介于2到30之间'
                        },
                        threshold: 3,

                    }
                }
            }

        }).on('success.form.bv', function (e) {
            e.preventDefault();
            var Amount_Name = $("#GaugeName").val();
            var Amount_DisplayName = $("#DisplayName").val();
            var Amount_TypeID = $("#Sel_AmountType").val();
            var Amount_ApplyPeoples = $("#ApplyPeoples").val();
            var Amount_Marks = $("#Marks").val();
            var Amount_Guidance = $("#Guidance").val();


            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationAdd.ashx",
                data: {
                    Remark: "AddAmount",
                    T_Name: Amount_Name,
                    T_DisplayName: Amount_DisplayName,
                    T_TypeID: Amount_TypeID,
                    T_ApplyPeoples: Amount_ApplyPeoples,
                    T_Marks: Amount_Marks,
                    T_Guidance: Amount_Guidance
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        AmountCode = msg;
                        layer.alert('量表描述保存成功!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                        $("#BJ").html("<a href=\"#profile\" id=\"l_profile\" data-toggle=\"tab\">题目编辑</a>");
                    } else {
                        layer.alert('量表描述保存失败!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        })
                    }
                }
            });
        });

        /*-----------The End--------------*/



        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationAdd.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                    });
                    $("#" + controlname).attr("multiple", false);

                    $("#" + controlname).selectpicker('refresh');
                }
            });
        }



    </script>



    <script>
        /*------量表维度列表加载------*/
        function OnloadAmountDimension() {

            var AmountName = $("#Sel_AmountName2").val();//量表名称
            var AmountType = $("#Sel_AmountType2").val();//量表类型
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationAdd.ashx",
                data: "AmountName=" + AmountName + "&AmountType=" + AmountType + "&Remark=LoadAmountDimension",
                success: function (msg) {
                    if (msg != "") {
                        var obj = eval('[' + msg + ']');
                        var $treeTable = $("#AmountDimension_Table");
                        $("#AmountDimension_Table  tbody").empty("");
                        if (obj != null) {
                            var Amountlist = obj[0].AmountEntityList;
                            var DimensionList = obj[0].DimensionEntityList;
                            for (var i = 0; i < Amountlist.length; i++) {
                                var tableHtmltd = "<td> <input  type=\"checkbox\" onclick=\"AmountCheckAll('" + Amountlist[i].AmountCode + "')\"/>" + Amountlist[i].AmountName + "</td><td>" + Amountlist[i].AmountRemark + "</td>";
                                var TableHtml = "<tr id=\"" + Amountlist[i].AmountCode + "\" pId=\"\">" + tableHtmltd + "</tr>";
                                $treeTable.append(TableHtml);
                                for (var k = 0; k < DimensionList.length; k++) {

                                    if (DimensionList[k].AmountCode == Amountlist[i].AmountCode) {
                                        var tableHtmltd2 = "<td><input name='SubDimension' id=\"Sel_" + DimensionList[k].DimensionCode + "\"  type=\"checkbox\" value='{\"DC\":\"" + DimensionList[k].DimensionCode + "\",\"AC\":\"" + DimensionList[k].AmountCode + "\",\"DT\":\"" + DimensionList[k].AmountTypeName + "\",\"DN\":\"" + DimensionList[k].DimensionName + "\",\"AN\":\"" + DimensionList[k].AmountName + "\",\"AT\":\"" + DimensionList[k].AmountTypeName + "\",\"SN\":\"" + DimensionList[k].SubjectNum + "\"}' onclick=\"AmountCheck()\"/>" + DimensionList[k].DimensionName + "</td><td>&nbsp;</td>";
                                        var TableHtml2 = "<tr id=\"" + DimensionList[i].DimensionCode + "\" pId=\"" + Amountlist[i].AmountCode + "\">" + tableHtmltd2 + "</tr>";
                                        $treeTable.append(TableHtml2);
                                    }
                                }
                            }
                            DrawOption();//绘制树形展示列表点击事件
                        }
                    }
                }
            });
        }

        /*----------------绘制树形展示列表-----------------*/
        function DrawOption() {
            var $treeTable = $("#AmountDimension_Table");
            var option = {
                theme: 'vsStyle',
                expandLevel: 2,
                beforeExpand: function ($treeTable, id) {
                    if ($('.' + id, $treeTable).length) { return; }
                },
                onSelect: function ($treeTable, id) {
                    window.console && console.log('onSelect:' + id);
                }
            };
            $treeTable.treeTable(option);
        }


        /*维度列表展示量表点选框事件*/
        function AmountCheckAll(AmounCode) {
            alert(AmounCode);
        }

        /*维度列表展示维度点选框事件*/
        /*
         *DC:维度编码
         *DN:维度名称
         *AN:量表名称
         *AT:量表类型
         *SN:维度题数
         */
        function AmountCheck() {
            CombinationJson = "";
            $('input:checkbox[name=SubDimension]:checked').each(function (i) {

                if (CombinationJson != "") {
                    CombinationJson += "," + $(this).val();
                } else {
                    CombinationJson += $(this).val();
                }
            });
            //alert(CombinationJson);
            OnloadSourceDimensionTable(CombinationJson);//初始化数据表
        }
        /*-----量表维度列表End-----*/



        /*---------------加载选中数据的列表框-----------*/
        function OnloadSourceDimensionTable() {
            if (CombinationJson != "") {
                $("#SourceDimensionTable  tbody").empty("");
                var objJson = eval('[' + CombinationJson + ']');
                var $sourceTable = $("#SourceDimensionTable");
                for (var i = 0; i < objJson.length; i++) {
                    var tableHtmltd = "<td>" + (i + 1) + "</td><td>" + objJson[i].AN + "</td><td>" + objJson[i].DT + "</td><td>" + objJson[i].DN + "</td><td>" + objJson[i].SN + "</td><td><a style=\"cursor:pointer\"  onclick=\"DelSelDimensionTable('" + objJson[i].DC + "')\">[删除]</a></td>";
                    var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                    $sourceTable.append(TableHtml);
                }
            } else {
                $("#SourceDimensionTable  tbody").empty("");
            }
        }

        /*----取消选中的维度------*/
        function DelSelDimensionTable(obj) {
            $("#Sel_" + obj).prop("checked", false);//取消选中状态
            AmountCheck();//重新获取选中的值
            OnloadSourceDimensionTable();//绘画表结构
        }

        /*-----保存组合维度-----*/
        function SaveDimensionFun() {

            //AmountCode  --操作的量表Code
            //CombinationJson  --选择中的维度Json

            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationAdd.ashx",
                data: {
                    Remark: "SaveAD",
                    AD_AmountCode: AmountCode,
                    AD_DimensionJson: CombinationJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (parseInt(msg) > 0) {
                        layer.msg("保存成功", { time: 2000, icon: 6 });
                        $("#SZ").html("<a href=\"#messages\" id=\"l_messages\" data-toggle=\"tab\">评分设置</a>");
                    }
                    else {
                        alery.msg("保存失败", { time: 2000, icon: 6 });
                    }
                }
            });
        }



    </script>

    <script>
        /*-----------评分设置---------*/
        var switch_ON = "标准";//要想用复选开关的话，这两个变量必须有
        var switch_OFF = "转化";
        var JF_Type = 0;//JF_Type=0  是原始分  JF_Type=1 是转化分
        /*------计分方式按钮选择事件*/
        function CK_Set(obj) {
            if (obj.checked) {
                $("#JF_Title").css('display', 'none');
                $("#JF_Content").css('display', 'none');
                JF_Type = 0;
            } else {
                $("#JF_Title").css('display', 'block');
                $("#JF_Content").css('display', 'block');
                JF_Type = 1;
            }
        }

        /*---------添加常模Model---------*/
        function AddModel() {
            $("#Model_Message").css('display', 'block');
        }

        /*--------添加常模解释---------*/
        function Add_JS() {
            $('#Model_Pnale').modal('show');
        }

        /*--------添加常模预警--------*/
        function Add_W() {
            $('#Model_Warning').modal('show');
        }


        var ExplainJson = "";//常模解释数据Json
        /*----保存常模解释说明----*/
        function SaveExplain() {

            //Norm_Title  名称
            //StartAge  最小年龄
            //EndAge  结束年龄
            //Sel_M_Sex  性别
            //Start_Fraction  最小分数
            //End_Fraction  最大分数
            //Fraction_Explain  分值说明
            //Coach_Text  辅导建议

            var _Norm_Title = $("#Norm_Title").val();
            var _StartAge = $("#StartAge").val();
            var _EndAge = $("#EndAge").val();
            var _Sel_M_Sex = $("#Sel_M_Sex").val();
            var _Start_Fraction = $("#Start_Fraction").val();
            var _End_Fraction = $("#End_Fraction").val();
            var _Fraction_Explain = $("#Fraction_Explain").val();
            var _Coach_Text = $("#Coach_Text").val();

            if (ExplainJson == "") {
                ExplainJson += "{\"NormCode\":\"123\",\"ExplainCode\":\"123\",\"ExplainName\":\"" + _Norm_Title + "\",\"NormStartAge\":\"" + _StartAge + "\",\"NormEndAge\":\"" + _EndAge + "\",\"NormSex\":\"" + _Sel_M_Sex + "\",\"StartFraction\":\"" + _Start_Fraction + "\",\"EndFraction\":\"" + _End_Fraction + "\",\"NormExplain\":\"" + _Fraction_Explain + "\",\"NormProposal\":\"" + _Coach_Text + "\"}";
            } else {
                ExplainJson += ",{\"NormCode\":\"123\",\"ExplainCode\":\"123\",\"ExplainName\":\"" + _Norm_Title + "\",\"NormStartAge\":\"" + _StartAge + "\",\"NormEndAge\":\"" + _EndAge + "\",\"NormSex\":\"" + _Sel_M_Sex + "\",\"StartFraction\":\"" + _Start_Fraction + "\",\"EndFraction\":\"" + _End_Fraction + "\",\"NormExplain\":\"" + _Fraction_Explain + "\",\"NormProposal\":\"" + _Coach_Text + "\"}";
            }

            Draw_Explain_Table();
            EliminateMessage();
            $('#Model_Pnale').modal('hide');//常模信息保存以后模态窗口关闭
        }


        /*-----绘画解释说明列表-----*/
        function Draw_Explain_Table() {

            if (ExplainJson != "") {
                var ExplainTable = $("#Explain_Table");
                $("#Explain_Table  tbody").empty("");
                var ExplainJsonList = eval("[" + ExplainJson + "]");
                var delBtn = "<i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>";
                if (ExplainJsonList != null && ExplainJsonList.length > 0) {
                    for (var k = 0; k < ExplainJsonList.length; k++) {
                        var tableHtmltd = "<td>" + ExplainJsonList[k]["ExplainName"] + "</td><td>" + ExplainJsonList[k]["NormStartAge"] + "-" + ExplainJsonList[k]["NormEndAge"] + "</td><td>" + ExplainJsonList[k]["NormSex"] + "</td><td>" + ExplainJsonList[k]["StartFraction"] + "-" + ExplainJsonList[k]["EndFraction"] + "</td><td>" + ExplainJsonList[k]["NormExplain"] + "</td><td>" + ExplainJsonList[k]["NormProposal"] + "</td><td style=\"float:center;\">" + delBtn + "</td>";
                        var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                        ExplainTable.append(TableHtml);
                    }
                }
            }
        }

        /*----------清空常模解释内容信息---------------*/
        function EliminateMessage() {
            $("#Norm_Title").val("");
            $("#StartAge").val("0");
            $("#EndAge").val("0");
            $("#Sel_M_Sex option[value='0']").attr("selected", "selected");
            $("#Sel_M_Sex").trigger("chosen:updated");
            $("#Start_Fraction").val("0");
            $("#End_Fraction").val("0");
            $("#Fraction_Explain").val("");
            $("#Coach_Text").val("");
           
        }


        /*---------初始化性别下拉类表样式---------*/
        initSex();
        function initSex() {
            $("#Sel_M_Sex").attr("multiple", false);

            $("#Sel_M_Sex").selectpicker('refresh');

        }




        var WarningJson = "";
        /*-------预警设置保存操作-------*/
        function SaveWarning() {
            var _Warning_Title = $("#Warning_Title").val();
            var _Start_Warning_Fun = $("#Start_Warning_Fun").val();
            var _End_Warning_Fun = $("#End_Warning_Fun").val();

            if (WarningJson == "") {
                WarningJson += "{\"NormCode\":\"\",\"NormWarningCode\":\"\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\"}";
            } else {
                WarningJson += ",{\"NormCode\":\"\",\"NormWarningCode\":\"\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\"}";
            }

            DrawWarningTable();//绘制预警表结构          

            $('#Model_Warning').modal('hide');//预警信息保存以后模态窗口关闭
        }

        /*------绘制预警表结构------*/
        function DrawWarningTable() {

            if (WarningJson != "") {
                var ExplainTable = $("#Warning_Table");
                $("#Warning_Table  tbody").empty("");
                var WarningList = eval("[" + WarningJson + "]");
                var delBtn = "<i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>";
                if (WarningList != null && WarningList.length > 0) {
                    for (var k = 0; k < WarningList.length; k++) {
                        var tableHtmltd = "<td>" + WarningList[k]["NormWarningLevel"] + "</td><td>" + WarningList[k]["StartFraction"] + "</td><td>" + WarningList[k]["EndFraction"] + "</td>";
                        var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                        ExplainTable.append(TableHtml);
                    }
                }
            }

            EliminateWarningMessage();

        }

        /*---清除预警信息*/
        function EliminateWarningMessage() {
            $("#Warning_Title").val("");
            $("#Start_Warning_Fun").val("0");
            $("#End_Warning_Fun").val("0");

        }
        InitAD();
        /*----初始化评分设置中的维度下拉列表----*/
        function InitAD() {

            $("#Sel_Dimension").empty();
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "InitAD",
                    ACode: AmountCode
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        $("#Sel_Dimension").append("<option value='0'>请选择维度</option>");
                        $.each(eval(msg), function (index, item) {
                            $("#Sel_Dimension").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                        });
                        //$("#Sel_Dimension").addClass("chosen-select");

                    } else {
                        $("#Sel_Dimension").append("<option value='0'>暂无维度可选</option>");
                    }
                    $("#Sel_Dimension").attr("multiple", false);

                    $("#Sel_Dimension").selectpicker('refresh');//这句话很重要呀不加的话动态刷新不出来
                }
            });

        }

        /*-------初始化自编量表常模下拉列表-------*/
        //InitNorm();//加载常模
        function InitNorm(SelValue) {
            //  $("#Sel_Norm").empty();
            var _d_Code = $("#Sel_Dimension").val();
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "InitNorm",
                    D_Code: _d_Code
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        $("#Sel_Norm").append("<option value='0'>请选择常模</option>");
                        $.each(eval(msg), function (index, item) {
                            if (SelValue != "") {
                                $("#Sel_Norm").append("<option value='" + item.Value + "' selected='selected'>" + item.Text + "</option>");
                            } else {
                                $("#Sel_Norm").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                            }

                        });
                    } else {
                        $("#Sel_Norm").append("<option value='0'>暂无常模可选，请添加</option>");

                    }

                    //$("#Sel_Norm").attr("multiple", false);

                    //$("#Sel_Norm").selectpicker('refresh');//这句话很重要呀不加的话动态刷新不出来
                    //$("#Sel_Norm").addClass("chosen-select");
                }
            });
        }


        /*------------第一次加载常模--------*/
        FirstLoadMorm();
        function FirstLoadMorm() {
            $("#Sel_Norm").empty();
            $("#Sel_Norm").append("<option value='0'>暂无常模可选，请添加</option>");
            //$("#Sel_Norm").attr("multiple", false);

            //$("#Sel_Norm").selectpicker('refresh');//这句话很重要呀不加的话动态刷新不出来
        }

        /*----保存自编量表的评分设置----*/
        function SaveScore() {
            //JF_Type  计分方式 0 是原始分  1  是转化分
            //D_Code Sel_Dimension
            var _Dcode = $("#Sel_Dimension").val();//维度编码
            var _NormTitle = $("#T_Norm_Title").val();//常模名称
            var _FormulaStr = $("#textarea_formula").val();//计分公式

            /*---------------ScoreJson数据结构----------------*/
            var dataJson = "";
            dataJson += "{";
            dataJson += "    \"Score_Formula\": {";
            dataJson += "        \"DimensionCode\": \"" + _Dcode + "\",";
            dataJson += "        \"FormulaStr\": \"" + _FormulaStr + "\",";
            dataJson += "        \"FormulaCode\": \"\"";//公式编码
            dataJson += "    },";
            dataJson += "    \"Score_Norm\": {";
            dataJson += "        \"DimensionCode\": \"" + _Dcode + "\",";
            dataJson += "        \"NormCode\": \"\",";//常模编码
            dataJson += "        \"NormTitle\": \"" + _NormTitle + "\"";
            dataJson += "    },";
            dataJson += "    \"ExplainList\": [";
            dataJson += "" + ExplainJson + "";
            dataJson += "    ],";
            dataJson += "    \"WarningList\": [";
            dataJson += "" + WarningJson + "";
            dataJson += "    ]";
            dataJson += "}";



            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "SaveScore",
                    JsonData: dataJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {

                        var WD_Name = $("#Sel_Dimension option:selected").text();
                        if (msg != "ERROR") {
                            InitNorm(msg);
                            EmptyNorm();

                            //$("#Sel_Norm option[value='" + msg + "']").attr("selected", "selected");
                            //$("#Sel_Norm").chosen();

                            layer.alert('维度[' + WD_Name + ']的[' + _NormTitle + ']常模保存成功！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0

                            });
                        } else {
                            layer.alert('维度常模保存失败！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0

                            });
                        }


                    }
                }
            });
        }



        function EmptyNorm() {
            // $("#Model_Message").css('display', 'none');

            $("#Explain_Table  tbody").empty();
            $("#Warning_Table  tbody").empty();
            $("#T_Norm_Title").val('');
            ExplainJson = "";
            WarningJson = "";
        }



        /*-------------保存维度评分设置功能-------------*/
        function SaveDimensionMessage() {


            var _Dcode = $("#Sel_Dimension").val();//维度编码
            //var _NormTitle = $("#T_Norm_Title").val();//常模名称
            var _FormulaStr = $("#textarea_formula").val();//计分公式
            alert(JF_Type);
            var dataJson = "";
            dataJson += "    {";
            dataJson += "        \"DimensionCode\": \"" + _Dcode + "\",";//维度编号
            dataJson += "        \"FormulaStr\": \"" + _FormulaStr + "\",";//维度公式
            dataJson += "        \"FormulaCode\": \"000\"，";//公式编码
            dataJson += "        \"CalculationType\": \"" + JF_Type + "\"，";//公式编码
            dataJson += "    }";
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "SaveSet",
                    SourceJson: dataJson
                },//要执行查询的数据参数
                success: function (msg) {

                    if (msg == 1) {
                        layer.alert('评分设置保存成功！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                    } else {
                        layer.alert('评分设置保存失败 ！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                    }

                }
            });
        }
        function jump() {
            window.location = "heartevaluation.aspx"
        }

        /*--------初始化组合列表-------*/
        function InitCT() {
            if (AmountCode != "") {
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "InitCT",
                        A_Code: AmountCode
                    },//要执行查询的数据参数
                    success: function (msg) {

                        // alert(msg);

                        if (msg != "") {
                            var JsonEnty = eval("[" + msg + "]");
                            if (JsonEnty != null && JsonEnty.length > 0) {
                                var $treeTable = $("#SubjectTree");
                                //var OTK = $("#SubjectTree  tbody").length;
                                //alert(OTK);
                                $("#SubjectTree  tbody").empty("");
                                //if ($treeTable != undefined) {
                                //    $treeTable = new $('#SubjectTree');
                                //    $("#SubjectTree  tbody").empty("");
                                //} else {
                                //    $treeTable = $("#SubjectTree");
                                //}

                                var DimensionList = JsonEnty[0].D_EntityList;
                                var SubjectList = JsonEnty[0].TG_EntityList;


                                for (var i = 0; i < DimensionList.length; i++) {
                                    var tableHtmltd = "<td>" + DimensionList[i].DimensionName + "</td><td><button class=\"btn-default-zblb\"  onclick=\"UpdaWDZH('" + DimensionList[i].DimensionCode + "','" + DimensionList[i].DimensionName + "');\"  style=\"margin-right:15px;\" type=\"button\"  ><i class=\"fa fa-wrench\"   aria-hidden=\"true\"></i></button><button class=\"btn-default-zblb\" type=\"button\"  onclick=\"DelDimension('" + DimensionList[i].DimensionCode + "');\" ><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button></td>";
                                    //var tableHtmltd = "<td>" + DimensionList[i].DimensionName + "</td><td><button class=\"btn-default-zblb\" type=\"button\"  onclick=\"DelDimension('" + DimensionList[i].DimensionCode + "');\" ><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button></td>";
                                    var TableHtml = "<tr id=\"" + DimensionList[i].DimensionCode + "\" pId=\"\">" + tableHtmltd + "</tr>";
                                    $treeTable.append(TableHtml);
                                    for (var k = 0; k < SubjectList.length; k++) {
                                        if (SubjectList[k].DimensionCode == DimensionList[i].DimensionCode) {
                                            var tableHtmltd2 = "<td>" + SubjectList[k].SubjectSort + "、" + SubjectList[k].SubjectContent + "</td><td><button class=\"btn-default-zblb\" onclick=\"DelSMessBySD('" + DimensionList[i].DimensionCode + "','" + SubjectList[k].SubjectCode + "');\"   style=\"margin-right:15px;\" type=\"button\" ><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button></td>";
                                            var TableHtml2 = "<tr id=\"" + SubjectList[k].SubjectCode + "-00-" + DimensionList[i].DimensionCode + "\" pId=\"" + DimensionList[i].DimensionCode + "\">" + tableHtmltd2 + "</tr>";
                                            $treeTable.append(TableHtml2);
                                        }
                                    }
                                }
                                //$("#textarea_Guidance").val($treeTable.html());      
                                //if (OPT == 0) {
                                DrawOption();//绘制树形展示列表点击事件
                                //}
                                //  $treeTable.refreshPoint(id);



                            }
                        }
                    }
                });
            }
        }

    </script>


</asp:Content>
