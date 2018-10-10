<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HeartEvaluationUpdate.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.HeartEvaluationUpdate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/TreeTables/master.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />
    <link href="../../assets/css/chosen.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-switch.css" rel="stylesheet" />

    <script src="../../JS/jquery.form.js"></script>
    <%-- <script src="../../JS/layer.js"></script>--%>
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <%--    <script type="text/javascript" src="../../JS/TreeTables/jquery.js"></script>--%>
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
            border-radius: 5px;
        }

        .grouptitle {
            display: block;
            margin-top: -24px;
            margin-left: 20px;
            width: 150px;
            text-align: center;
            background-color: #428BCA;
            border-radius: 4px;
            color: #ffffff;
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

            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="HeartEvaluation.aspx" style="color: #666;">量表管理</a></li>
                <li><a href="#" style="color: #000;">量表修改</a></li>
            </ol>

        </div>
    </div>

    <!-- /. ROW  -->
    <div class="row">
        <div class="col-md-12 col-sm-12">


            <div class="panel-body">
                <ul class="nav nav-tabs-lyj">
                    <li class="active " id="JS"><a href="#home" data-toggle="tab">量表介绍</a>
                    </li>
                    <li class="" id="BJ">
                        <a href="#profile" id="BJ_A" onclick="InitSel_AmountType3();" data-toggle="tab">题目编辑</a>
                    </li>
                    <li class="" id="HF">
                        <a href="#divide" id="HF_A" onclick="InitCT();" data-toggle="tab">维度划分</a>
                    </li>
                    <li class="" id="SZ">
                        <a href="#messages" id="SZ_A" data-toggle="tab">评分设置</a>
                    </li>
                    <li style="float: right;">
                        <button class="btn btn-primary btn-sm" style="margin-top: 5px; margin-right: 3px;" onclick="jump()">返回</button>

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
                                            <input class="form-control" id="GaugeName" style="width: 100%" name="GaugeName" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6 col-sm-12 col-xs-12">
                                    <div class="panel text-center bg-color-blue">
                                        <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                            量表类型：
                                        </div>

                                        <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">

                                            <select class="form-control" id="Sel_AmountType" name="AmountType" style="width: 100%; line-height: 20px;">
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

                                        <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                            <input type="text" id="ApplyPeoples" name="ApplyPeoples" class="form-control" />
                                        </div>
                                    </div>
                                </div>








                                <div class="col-md-6 col-sm-12 col-xs-12">
                                    <div class="panel text-center bg-color-blue">
                                        <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                            量表介绍：
                                        </div>

                                        <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                            <textarea class="form-control" rows="2" id="Marks" name="Marks"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12 col-xs-12">
                                    <div class="panel text-center bg-color-blue">
                                        <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                            报告图表：
                                        </div>

                                        <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">

                                            <select class="form-control" id="Sel_BB" onchange="SetChart(this)" style="width: 100%; line-height: 30px;">
                                                <option value="column">纵柱柱状图</option>
                                                <option value="bar">横柱柱状图</option>
                                                <option value="line">横坐标折线剖面图</option>
                                                <option value="">纵坐标折线剖面图</option>
                                                <option value="KTR">卡特尔折线图</option>
                                                <option value="EPQ">十字坐标分布图</option>
                                                <option value="area">六边形分析图</option>

                                            </select>
                                        </div>
                                    </div>
                                </div>





                            </div>
                           <%-- <div class="row" style="margin-top: 20px;">


                                <div class="col-md-12 col-sm-12 col-xs-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            图表样式
                                        </div>
                                        <div class="panel-body">
                                            <div id="container">
                                            </div>
                                        </div>
                                    </div>
                                </div>





                            </div>--%>
                            <div class="row" style="text-align: center; margin-top: 20px;">
                                <button type="submit" class="btn btn-warning ">保存</button>
                            </div>

                        </form>

                    </div>

                    <div class="tab-pane fade" id="profile">
                        <div class="col-md-12 col-sm-12" style="padding-top: 15px;">
                            <div class="row" id="ListQuestionPanel">

                                <div class="row" style="text-align: center;">
                                    <div class="col-md-12">
                                        <h4 id="AmountNameHtm">XX自编量表</h4>
                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-md-12 text-right" style="margin: 5px 0px">
                                        <button type="button" id="Zdyu" style="background-color: orange; color: white;" class="btn-sm btn">修改指导语</button>
                                    </div>
                                    <div class="col-md-12">
                                        <textarea class="form-control" id="textarea_Guidance" rows="3" placeholder="请填写指导语"></textarea>
                                    </div>

                                </div>


                            </div>
                            <%--         <div class="row" id="save_OK" style="text-align: center; margin-top: 20px;">
                                <a href="javascript:;" class="btn btn-primary" onclick="return SaveSubjectSumit();">保存</a>
                            </div>--%>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="divide">

                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; text-align: right;">
                                <select class="chosen-select" style="width: 170px;" id="Sel_AmountType3">
                                </select>
                                <button class="btn btn-sm" style="background-color: orange; color: white" onclick="ShowSelectSubject();">新增组合</button>
                                <button class="btn btn-sm" style="background-color: orange; color: white" onclick="InitCT();">刷新</button>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 5px;">
                                <div class="table-responsive" id="showDimension">
                                    <table class="table table-striped table-bordered table-hover" id="SubjectTree">
                                        <thead>
                                            <tr>
                                                <th class="text-center" style="width: 80%">维度名称</th>
                                                <th class="text-center" style="width: 20%">操作</th>
                                            </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="messages">

                        <div class="row" style="margin-top: 15px;">
                            <div class="col-md-12">
                                <div class="panel panel-default">
                                    <div class="panel-body" style="background-color: RGB(245,248,253);">

                                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                维度名称：
                                            </div>

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <select class="chosen-select" style="width: 100%;" onchange="InitNorm('');" id="Sel_Dimension">
                                            </select>
                                        </div>

                                        <div class="col-md-2 col-sm-12 col-xs-4" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                计分方式：
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-8" style="margin-bottom: 15px;">
                                            <div class="make-switch" data-on="info" id="wlan_enable_div" data-off="success">
                                                <input type="checkbox" onclick="CK_Set(this)" onchange="CK_Set(this)" id="CK_F_Type" checked="checked" />
                                            </div>

                                        </div>

                                        <div class="col-md-2 col-sm-12 col-xs-12" id="JF_Title" style="margin-bottom: 15px; display: none;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                计分公式：
                                            </div>
                                        </div>
                                        <div class="col-md-10 col-sm-12 col-xs-12" id="JF_Content" style="margin-bottom: 15px; display: none;">
                                            <textarea class="form-control" id="textarea_formula" rows="3" placeholder="计分公式"></textarea>
                                        </div>


                                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 80px;">
                                                选择常模：
                                            </div>
                                        </div>
                                        <div class="col-md-9 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <select class="selectpicker form-control" onchange="InitNW();" data-done-button="true" data-live-search="true" data-placeholder="请选择常模" style="width: 100%;" id="Sel_Norm">
                                            </select>
                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <button class="btn btn-default-zblb" onclick="AddModel();" type="button" style="float: right; background-color: RGB(245,248,253);">常模<i class="fa fa-plus" style="color: green;" aria-hidden="true"></i></button>
                                        </div>



                                        <div class="col-md-12 col-sm-12 col-xs-12" id="Model_Message" style="margin-bottom: 15px; padding-left: 0px; padding-right: 0px; display: none;">

                                            <div class="groupbox" style="margin-top: 10px;">
                                                <span class="grouptitle">
                                                    <input type="text" id="T_Norm_Title" name="ApplyPeoples" placeholder="请填写常模名称" class="form-control" /></span>
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
                                                                            <th width="120px">名称</th>
                                                                            <th width="60px">年龄</th>
                                                                            <th width="60px">性别</th>
                                                                            <th width="120px">分值范围</th>
                                                                            <th>分值说明</th>
                                                                            <th>辅导建议</th>
                                                                            <th width="60px">操作</th>
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
                                                                            <th>名称</th>
                                                                            <th>级别</th>
                                                                            <th>性别</th>
                                                                            <th>年龄</th>
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
                                                <span class="groupfoot" id="Btn_CM_Save" style="margin-top: -5px;" id="">

                                                    <a href="#" class="btn btn-sm" style="background-color: #62c462; color: white" onclick="SaveScore();">保存常模</a></span>
                                                <%-- <input type="text" id="T_Norm_foot" name="ApplyPeoples" placeholder="请填写常模名称" class="form-control" /></span>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="text-align: center;">
                                    <a href="#" class="btn btn-warning" onclick="SaveDimensionMessage();">保存</a>
                                </div>
                            </div>

                        </div>
                        <!-- /. ROW  -->





                    </div>



                </div>
            </div>

        </div>

    </div>
    <!-- /. ROW  -->
    <div class="modal fade" id="SelectSubject" tabindex="-1" role="dialog" aria-labelledby="SelectSubject" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 5%; width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="">题目范围
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    维度名称：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <input class="form-control" maxlength="20" id="DimensionName" onkeyup="GetWD_Code();" style="width: 100%" name="AmountType" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12 col-xs-12" style="display: none">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    维度编码：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <input class="form-control" id="DimensionCode" style="width: 100%" name="DimensionCode" />
                                </div>
                            </div>
                        </div>
                        <%--</div>--%>
                        <%--   <div class="row">--%>
                        <div class="col-md-6 col-sm-12 col-xs-12" style="display: none">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    排序位置：
                                </div>

                                <div class="lb-panel-right pull-right">
                                    <input class="form-control" id="DimensionSort" style="width: 100%" name="DimensionSort" />

                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    所选题数：
                                </div>

                                <div class="lb-panel-right pull-right">
                                    <input class="form-control" id="SubjectSum" style="width: 100%" name="SubjectSum" disabled />

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover" id="SubjectList">
                                <thead>
                                    <tr>
                                        <th style="width: 10%; text-align: center;">
                                            <input type="checkbox" value="0" id="checkboxarr" onclick="chebox(this)" /></th>
                                        <th style="width: 20%">题号</th>
                                        <th style="width: 70%">题目</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                        <button type="button" class="btn btn-default"
                            data-dismiss="modal">
                            取消
                        </button>
                        <button onclick="Save_WDDivide();" type="button" class="btn btn-sm btn-warning">
                            保存
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>


    <!-- 常模-解释说明添加  -->
    <div class="modal fade" id="Model_Pnale" tabindex="-1" role="dialog" aria-labelledby="Model_Pnale" aria-hidden="false">
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
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210); width: 92px;">
                                    名称：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px; width: 83.3%;">
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
                                        <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="StartAge" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0px; padding-right: 0px;">-</div>
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="EndAge" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
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
                                    <select style="width: 100%; height: 30px;" id="Sel_M_Sex">
                                        <option value="0">全部</option>
                                        <option value="1">男</option>
                                        <option value="2">女</option>
                                    </select>
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


                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210); width: 92px;">
                                    分值范围：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px; width: 83.3%;">
                                    <div class="row">

                                        <div class="col-md-2 col-sm-2 col-xs-2">
                                            <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="Start_Fraction" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <select style="width: 100%; height: 30px;" id="Norm_First_Symbol">
                                                <option value="<=">≤</option>
                                                <option value="<">＜</option>
                                                <option value="==">＝</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-2" style="line-height: 30px;">SCORE</div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <select style="width: 100%; height: 30px;" id="Norm_Second_Symbol">
                                                <option value="<=">≤</option>
                                                <option value="<">＜</option>
                                                <option value="==">＝</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-2">
                                            <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="End_Fraction" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" />
                                        </div>
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
                    <button onclick="SaveExplain();" id="btn_SaveExplain" type="button" class="btn btn-sm btn-warning">
                        保存
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


    <!-- 常模-预警设置  -->
    <div class="modal fade" id="Model_Warning" tabindex="-1" role="dialog" aria-labelledby="Model_Warning" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 5%; width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
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
                                    预警级别：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <input class="form-control" id="Warning_Level" style="width: 100%" name="GaugeName" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    性别：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <select class="chosen-select" style="width: 100%;" id="Sel_M_Sex_W">
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
                                    年龄：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="StartAge_W" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
                                    </div>
                                    <div class="col-md-2 col-sm-2 col-xs-2" style="padding-left: 0px; padding-right: 0px;">-</div>
                                    <div class="col-md-5 col-sm-5 col-xs-5" style="padding-left: 0px; padding-right: 0px;">
                                        <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="EndAge_W" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" name="GaugeName" />
                                    </div>
                                </div>
                            </div>
                        </div>






                        <div class="col-md-12 col-sm-12 col-xs-12">




                            <div class="groupbox" style="margin-top: 10px;">
                                <span class="grouptitle">预警分值范围</span>
                                <div class="panel-body easypiechart-panel">



                                    <div class="row" style="margin-top: 15px;">

                                        <div class="col-md-2 col-sm-2 col-xs-2">
                                            <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="Start_Warning_Fun" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" />
                                        </div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <select style="width: 100%; height: 30px;" id="First_Symbol">
                                                <option value="<=">≤</option>
                                                <option value="<">＜</option>
                                                <option value="==">＝</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-2">SCORE</div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <select style="width: 100%; height: 30px;" id="Second_Symbol">
                                                <option value="<=">≤</option>
                                                <option value="<">＜</option>
                                                <option value="==">＝</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-2">
                                            <input onkeyup="onlyNumber(this)" onblur="onlyNumber(this)" class="form-control" id="End_Warning_Fun" style="width: 100%" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="0" />
                                        </div>


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
                    <button onclick="SaveWarning();" id="btn_BW" type="button" class="btn btn-warning">
                        保存
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>





    <!-- /. ROW  -->
    <div class="modal fade" id="UpdateWDZH" tabindex="-1" role="dialog" aria-labelledby="UpdateWDZH" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 5%; width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="">维度组合修改
                    </h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12" style="margin-bottom: 20px">
                            <div class="col-md-8 col-sm-12 col-xs-12" style="margin-bottom: 20px">
                                <input class="form-control" maxlength="20" id="UW_DimensionName" style="width: 100%" name="GaugeName" />
                            </div>
                            <div class="col-md-4 col-sm-12 col-xs-12" style="margin-bottom: 20px">
                                <button id="Btn_TopSave" type="button" class="btn btn-sm btn-warning">
                                    保存
                                </button>
                            </div>

                        </div>
                        <%-- <div class="col-md-6 col-sm-12 col-xs-12">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    所选题数：
                                </div>

                                <div class="lb-panel-right pull-right">
                                    <input class="form-control" id="UW_SubjectSum" style="width: 100%" name="SubjectSum" />

                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <div class="row">


                        <div class="groupbox" style="margin-top: 10px;">
                            <span class="grouptitle">可选题干</span>
                            <div class="panel-body easypiechart-panel">



                                <div class="table-responsive" style="text-align: left;">
                                    <table class="table table-striped table-bordered table-hover" id="Warning_Table">
                                        <thead>
                                            <tr>
                                                <th>题号</th>
                                                <th>题目</th>
                                                <th>操作</th>

                                            </tr>
                                        </thead>
                                        <tbody id="TB_LB_List">
                                        </tbody>
                                    </table>
                                </div>




                            </div>


                        </div>
                    </div>
                    <div class="row">

                        <div class="groupbox" style="margin-top: 10px;">
                            <span class="grouptitle">已选题干</span>
                            <div class="panel-body easypiechart-panel">



                                <div class="table-responsive" style="text-align: left;">
                                    <table class="table table-striped table-bordered table-hover" id="Warning_Table2">
                                        <thead>
                                            <tr>
                                                <th>题号</th>
                                                <th>题目</th>
                                                <th>操作</th>

                                            </tr>
                                        </thead>
                                        <tbody id="TB_WD_List">
                                        </tbody>
                                    </table>
                                </div>




                            </div>


                        </div>
                    </div>

                    <div class="modal-footer">
                        <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                        <button type="button" class="btn btn-primary btn-sm"
                            data-dismiss="modal">
                            取消
                        </button>
                        <button id="Btn_DownSave" type="button" class="btn  btn-sm  btn-warning">
                            保存
                        </button>
                    </div>
                </div>
                <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
        </div>
    </div>






    <%-- <script src="../../JS/bootstrap.min.js"></script>--%>
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/chosen.jquery.min.js" charset="gb2312"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-switch.min.js" charset="gb2312"></script>
    <script>
        var navName = '/FunctionModular/Heartevaluation/Heartevaluation.aspx';
        var tempAmountName;
        var tempAmountType;
        var tempDisplayName;
        var tempFitPeople;
        var tempAmountIntroduce;
        var tempAmountSource;
        function ClickFile() {
            $('#MageUpload').click();
        }
        function ClickFile2() {
            $('#MageUpload1').click();
        }
        function ClickFile3() {
            $('#MageUpload2').click();
        }

        function Add() {
            $("#dis").show();
            return;

        }

        function Del() {
            $("#dis").hide();
            return;
        }


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

        function AddModel() {
            $("#Model_Message").css('display', 'block');
        }

        function Add_JS() {


            $('#btn_SaveExplain').attr('onclick', 'SaveExplain()');
            EliminateMessage();//清空控件
            $("#Model_Pnale").modal("show");
        }

        function Add_W() {
            $('#btn_BW').attr('onclick', 'SaveWarning()');
            EliminateWarningMessage();
            $("#Model_Warning").modal("show");

            $("#First_Symbol").val("<=")
            $("#Second_Symbol").val("<=")
        }
    </script>


    <script>
        var AmountCode = GetQueryString("id");//操作的量表编码
        var AmountName = "";//操作的量表名称
        //var GuidanceStr = "";//操作的提示语
        var StemJson = "";//题干Json字符串
        var StemTotal = 0;//当前页面题干的总数
        var OperationTotal = 0;//本题干内的题支总数
        var subjectListJson = "";//题目集合Json字符串
        var GetSubjectAllJson = "";//批量保存获取

        ///*

        var switch_ON = "原始";//要想用复选开关的话，这两个变量必须有
        var switch_OFF = "标准";

        //DrawQuestion(1);//初始化题架结构
        initSelectInput("Remark=AmountType", "Sel_AmountType", "全部分类");//初始化量表类别


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
                            url: "Ajax/HeartEvaluationAdd.ashx?Remark=Exists&Acode=" + AmountCode + "&",
                            message: '量表名称重复。',
                            delay: 2000,
                            type: "GET",

                        }
                        // ,
                        //regexp: {
                        //    regexp: /^(?!.*?[\~\`\·\！\!@\#\￥\$%\……\^&\*\(\)\（\）\_\-\——\+\=\【\】\[\]\{\}\|\、\\\：\:\;\；\"\”\“\’\'\'\<\>\《\》\,\，\。\.\?\？\/]).*$/,
                        //    message: '角色名不能包含特殊字符。'
                        //}
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
                            max: 40,
                            message: '量表显示名长度必须介于2到40之间'
                        },
                        threshold: 3,
                    }
                },
               


            }
        }).on('success.form.bv', function (e) {
            e.preventDefault();
            var Amount_Name = $("#GaugeName").val();
            var Amount_DisplayName = $("#DisplayName").val();
            var Amount_TypeID = $("#Sel_AmountType").val();
            var StartPeoples = "0";// $("#Sel_Start_Age").val();
            var EndPeoples = "0"; //$("#Sel_End_Age").val();
            var Amount_ApplyPeoples = $("#ApplyPeoples").val();//获取的是年龄范围
            var Amount_Marks = $("#Marks").val();
            var Amount_Guidance = "";
            AmountName = Amount_Name;
              if ($("#Sel_AmountType").val() == "0") {
                layer.alert('量表类型不能为空!', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                })
                return;
            }


            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "CustomUpdate",
                    T_Name: Amount_Name,
                    AmountSource:tempAmountSource,
                    T_DisplayName: Amount_DisplayName,
                    T_TypeID: Amount_TypeID,
                    T_ApplyPeoples: Amount_ApplyPeoples,
                    T_Marks: Amount_Marks,
                    T_Guidance: Amount_Guidance,
                    T_StartPeoples: StartPeoples,
                    T_EndPeoples: EndPeoples,
                    Acode: GetQueryString("id")
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        AmountCode = msg;
                        $("#AmountNameHtm").html(AmountName);
                        layer.alert('量表描述修改成功!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                    } else {
                        layer.alert('量表描述修改失败!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        })
                    }
                }
            });
        });

        /*-----初始化下拉列表公共方法-----*/
        function initSelectInput(types, controlname, Exhibition) {
            $("#" + controlname).empty();
            if (Exhibition != "") {
                $("#" + controlname).append("<option value='0'>" + Exhibition + "</option>");
            }
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: types,//要执行查询的数据参数
                success: function (msg) {
                    $.each(eval(msg), function (index, item) {
                        $("#" + controlname).append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                    });
                    $("#" + Exhibition).chosen();
                    $("#" + Exhibition).trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                }
            });
        }


        /*-----------------绘制题干框架结构--------------*/
        function DrawQuestion(FewQuestion) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title\">"
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">第[" + FewQuestion + "]题</a>"
            + "<div class=\"row\" style=\"margin-top:10px;\">"
            + "<div class=\"col-xs-12\">"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return addQuestion();\">[添加新题]</a></label>"
            //+ "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" style=\"color:#999\" disabled=\"disabled\">[复制本题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return Del_Operation('" + FewQuestion + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return Btn_Operation('" + FewQuestion + "');\">[确定]</a></label>"
            + "</div>"
            + "</div>"
            + "</h4>"
            + "</div>";

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var P_Body = ""
            + "    <div id=\"Body_" + FewQuestion + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var P_Content = ""
            + "<div id=\"Content_" + FewQuestion + "\" class=\"panel-collapse in\" tyle=\"height: auto;\">"
            + P_Body
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var ShellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + FewQuestion + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + P_Title + P_Content + " </div></div></div>";
            $("#ListQuestionPanel").append(ShellHtml);
            var StemTitle = "";
            StemTitle = GetQuestionContent(FewQuestion);//给题目外壳的标题赋值
            $("#Body_" + FewQuestion).append(StemTitle);
            var ProblemContent = "";
            ProblemContent = GetProblemContent(FewQuestion, FewQuestion);//获取题支内容
            $("#Body_" + FewQuestion).append(ProblemContent);


            //$("#textarea_Guidance").val(ProblemContent);
            //textarea_Guidance


            // alert(FewQuestion);
        }

        /*----------绘画题干标题-------------------*/
        function GetQuestionContent(T_Faw) {
            var StemTitle = ""
            + "<div class=\"row\" id=\"Prot_F_" + T_Faw + "\"> "
            + "    <div class=\"col-md-12\">"
            + "        <div class=\"form-group input-group col-md-12 col-sm-12 col-xs-12\">"
            + "            <input type=\"text\" class=\"form-control\" id=\"Prot_" + T_Faw + "\" style=\"height: 34px;\" placeholder=\"请填写题目标题\" />"
            //+ "            <span class=\"input-group-btn\">"
            //+ "                <button class=\"btn btn-default\" type=\"button\">"
            //+ "                    <i class=\"fa fa-file-image-o\"></i>"
            //+ "                </button>"
            //+ "            </span>"
            + "        </div>"
            + "    </div>"
            + "</div>"
            return StemTitle;
        }


        function CopyQuestion() {


        }





        /*-----------------绘制题干框架结构--------------*/
        function CopyDrawQuestion(FewQuestion) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title\">"
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">第[" + FewQuestion + "]题</a>"
			+ "<div class=\"row\" style=\"margin-top:10px;\">"
            + "<div class=\"col-xs-12\">"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return addQuestion();\">[添加新题]</a></label>"
            //+ "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" style=\"color:#999\" disabled=\"disabled\">[复制本题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return Del_Operation('" + FewQuestion + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return Btn_Operation('" + FewQuestion + "');\">[确定]</a></label>"
			+ "</div>"
            + "</div>"
            + "</h4>"
            + "</div>";

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var P_Body = ""
            + "    <div id=\"Body_" + FewQuestion + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var P_Content = ""
            + "<div id=\"Content_" + FewQuestion + "\" class=\"panel-collapse in\" tyle=\"height: auto;\">"
            + P_Body
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var ShellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + FewQuestion + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + P_Title + P_Content + " </div></div></div>";
            $("#ListQuestionPanel").append(ShellHtml);
            var StemTitle = "";
            StemTitle = GetQuestionContent(FewQuestion);//给题目外壳的标题赋值
            $("#Body_" + FewQuestion).append(StemTitle);
        }







        /*动态添加题目*/
        function CopyAddQuestion(QCode) {
            //var questionCount = $('div[name=QuestionPanel]').length;
            //var QuestionCode = parseInt(questionCount) + 1;
            //CopyDrawQuestion(QuestionCode);//动态创建题目
            // Update_addQuestion();
            //New_UpdateDrawQuestion();


            //if (subjectListJson != "") {
            //    var TGCode = AmountCode + "_TG_" + QCode;
            //    if (subjectListJson.indexOf(TGCode) >= 0) {
            //        var JsonList = eval("[" + subjectListJson + "]");

            //        for (var i = 0; i < JsonList.length; i++) {
            //            if (TGCode == JsonList[i].TG_Info.TG_Code) {
            //                for (var k = 0; k < JsonList[i].TZ_List.length; k++) {
            //                    var O_code = JsonList[i].TZ_List[k].TZ_Code;
            //                    var O_con = JsonList[i].TZ_List[k].TZ_Con;
            //                    var O_Fra = JsonList[i].TZ_List[k].TZ_Val;
            //                    var O_Num = JsonList[i].TZ_List[k].TZ_Num;
            //                    var ProblemContent = "";
            //                    ProblemContent = GetProblemContent(QuestionCode, QuestionCode);//获取题支内容
            //                    $("#Body_" + QuestionCode).append(ProblemContent);
            //                    $("#Code_" + QuestionCode + "_" + k).val(O_Num);
            //                    $("#Con_" + QuestionCode + "_" + k).val(O_con);
            //                    $("#Fra_" + QuestionCode + "_" + k).val(O_Fra);
            //                }
            //                break;
            //            }
            //        }
            //    }
            //}
            return false;
        }









        /*---------绘画题支内容------------------*/
        function GetProblemContent(T_Faw, T_Faw_Con) {
            var TZ_Con = $("input[name='Code_" + T_Faw + "']").length;
            var ProblemContent = ""
            + "<div class=\"row\" style=\"padding-top: 5px;\" id=\"row_" + T_Faw + "_" + TZ_Con + "\">"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\" style=\"margin-bottom: 15px;\">"
            + "        <input class=\"form-control\" name=\"Code_" + T_Faw + "\" id=\"0000\" style=\"height: 34px;\" placeholder=\"编号\" />"
            + "    </div>"
            + "    <div class=\"col-md-9 col-xs-12 col-sm-9\">"
            + "        <div class=\"col-md-12 col-xs-12 col-sm-12\" style=\"padding-left: 0px;padding-right: 0px;\">"
            + "            <input type=\"text\" class=\"form-control\" name=\"Con_" + T_Faw + "\" id=\"Con_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"选项内容\" />"
            //+ "            <span class=\"input-group-btn\">"
            //+ "                <button class=\"btn btn-default\" type=\"button\">"
            //+ "                    <i class=\"fa fa-file-image-o\"></i>"
            //+ "                </button>"
            //+ "            </span>"
            + "        </div>"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <input onkeyup=\"onlyNumber(this)\"  onblur=\"onlyNumber(this)\" class=\"form-control\" name=\"Fra_" + T_Faw + "\" id=\"Fra_" + T_Faw + "_" + parseInt(TZ_Con) + "\" style=\"height: 34px;\" placeholder=\"分值\" />"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\" onclick=\"return addopt('" + T_Faw + "','" + TZ_Con + "');\"  style=\"float: right\">"
            + "                <i class=\"fa fa-plus\" style=\"color: green;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\"  onclick=\"return delopt('" + T_Faw + "_" + TZ_Con + "');\" style=\"float: right\">"
            + "                <i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }

        ///*根据json展现当前题干的题支部分[绘画题支内容]*/
        function ShowProblemContent(T_Faw, T_Faw_Con, num, option) {
            var ProblemContent = ""
            + "<div class=\"row\" >"
            + "    <div class=\"col-md-12 col-xs-12 col-sm-12\" >"
            + "            <div class=\"radio\">"
            + "                 <label>"
            + "                       <input type=\"radio\" name=\"options_" + T_Faw + "\" id=\"options_" + T_Faw + "_" + T_Faw_Con + "\" >" + num + "、 " + option
            + "                 </label>"
            + "           </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }

        /*--------删除题目-----------*/
        function Del_Operation(T_Faw) {
            var qpanelList = $('div[name=QuestionPanel]').length;
            if (qpanelList > 1) {
                layer.confirm('您是否要删除当前题支编辑内容？', {
                    btn: ['删除', '取消'] //按钮
                }, function () {

                    if ($("#QuestionPanel_" + T_Faw) != undefined) {
                        $("#QuestionPanel_" + T_Faw).empty();
                        $("#QuestionPanel_" + T_Faw).hide();
                        $("#QuestionPanel_" + T_Faw).attr("name", "Error");
                        //$("#QuestionPanel_" + T_Faw).attr("id", "Error" + T_Faw);
                        //$("#Content_" + T_Faw).attr("id", "ErrorCon" + T_Faw);
                    }











                    // $("#Code_" + T_Faw).attr("name", "Error");


                    if (subjectListJson != "") {
                        var TGCode = AmountCode + "_TG_" + T_Faw;
                        if (subjectListJson.indexOf(TGCode) >= 0) {
                            var JsonList = eval("[" + subjectListJson + "]");
                            if (JsonList != null && JsonList.length > 0) {
                                subjectListJson = "";
                                for (var t = 0; t < JsonList.length; t++) {//重新绘制Json结构

                                    if (TGCode != JsonList[t].TG_Info.TG_Code) {
                                        if (subjectListJson != "") {
                                            subjectListJson += ",";
                                        }
                                        subjectListJson += "    {";
                                        subjectListJson += "        \"TG_Info\": ";
                                        subjectListJson += "            {";
                                        subjectListJson += "                \"TG_Code\": \"" + JsonList[t].TG_Info.TG_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\",";
                                        subjectListJson += "                \"TG_Content\": \"" + JsonList[t].TG_Info.TG_Content.replace(/\s/g, "").replace(/\"/g, "\"") + "\",";
                                        subjectListJson += "                \"TG_Sort\": \"" + JsonList[t].TG_Info.TG_Sort.replace(/\s/g, "").replace(/\"/g, "\"") + "\",";
                                        subjectListJson += "                \"A_Code\": \"" + JsonList[t].TG_Info.A_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\"";
                                        subjectListJson += "            }";
                                        subjectListJson += "        ,";
                                        subjectListJson += "        \"TZ_List\": [";

                                        var TZ_ContentJson_2 = "";
                                        if (JsonList[t].TZ_List != null && JsonList[t].TZ_List.length > 0) {
                                            for (var i = 0; i < JsonList[t].TZ_List.length; i++) {
                                                if (TZ_ContentJson_2 != "") {
                                                    TZ_ContentJson_2 += ",{\"TZ_Code\":\"" + JsonList[t].TZ_List[i].TZ_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Num\": \"" + JsonList[t].TZ_List[i].TZ_Num.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + JsonList[t].TZ_List[i].TZ_Con.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + JsonList[t].TZ_List[i].TZ_Val.replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                                                } else {
                                                    TZ_ContentJson_2 += "{\"TZ_Code\":\"" + JsonList[t].TZ_List[i].TZ_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Num\": \"" + JsonList[t].TZ_List[i].TZ_Num.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + JsonList[t].TZ_List[i].TZ_Con.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + JsonList[t].TZ_List[i].TZ_Val.replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                                                }
                                            }

                                        }

                                        subjectListJson += TZ_ContentJson_2;
                                        subjectListJson += "        ]";
                                        subjectListJson += "    }";

                                    }

                                }

                            }
                        }
                    }
                    layer.msg('删除成功', { time: 3000, icon: 1 });
                });
            } else {
                layer.msg('做人要厚道，您好歹给我留个吧？', {
                    time: 2000, //20s后自动关闭
                    btn: ['厚道一把']
                });
            }





        }




        ///*----------题干临时存储信息[确定]--------------*/
        function SaveQuestion(T_Faw) {
            var result = 0;
            var results = 0;
            var ProTitle = $("#Prot_" + T_Faw).val();//获取题干标题
            //TH_
            var ProSort = $("#TH_" + T_Faw).val();//获取题干标题


            if (ProSort == "" || ProSort.length == 0) {

                layer.alert('题号不能为空!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }
            if (ProTitle == "" || ProTitle.length == 0) {

                layer.alert('第' + T_Faw + '题的题干标题不能为空!', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0,
                    yes: function () {
                        $("#Prot_" + T_Faw).focus();
                        layer.closeAll();
                    }
                });
                return;
            }


            var CT_Code = "";//题支编码
            var CT_Content = "";//题支内容
            var CT_Va = "";//题支分值
            var JsonStr = "";
            $('input[name=Code_' + T_Faw + ']').each(function (i) {

                if (CT_Code != "") {
                    if ($(this).val() == "" || $(this).val().length == 0) {
                        layer.alert('第' + T_Faw + '题的题支编号不能为空!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                //$(this).focus();
                                layer.closeAll();
                                CT_Code = "";

                            }
                        });
                        result++
                        return result;
                    } else {
                        CT_Code += "," + $(this).val();
                        results++;
                        return result;
                    }
                } else {

                    if ($(this).val() == "" || $(this).val().length == 0) {
                        layer.alert('第' + T_Faw + '题的题支编号不能为空!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                //$(this).focus();
                                layer.closeAll();
                                CT_Code = "";

                            }
                        });
                        result++;
                        return result;
                    } else {
                        CT_Code += $(this).val();
                        results++;
                        return result;
                    }
                }
            });

            $('input[name=Con_' + T_Faw + ']').each(function (i) {

                if (CT_Content != "") {

                    if ($(this).val() == "" || $(this).val().length == 0) {
                        layer.alert('第' + T_Faw + '题的选项内容不能为空!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                //$(this).focus();
                                layer.closeAll();
                                CT_Content = "";
                            }
                        });
                        result++;
                        return result;
                    } else {

                        CT_Content += "," + $(this).val();
                        results++;
                        return result;
                    }
                } else {

                    if ($(this).val() == "" || $(this).val().length == 0) {
                        layer.alert('第' + T_Faw + '题的选项内容不能为空!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                //$(this).focus();
                                layer.closeAll();
                                CT_Content = "";

                            }
                        });
                        result++;
                        return result;
                    } else {
                        CT_Content += $(this).val();
                        results++;
                        return result;
                    }
                }
            });

            $('input[name=Fra_' + T_Faw + ']').each(function (i) {

                if (CT_Va != "") {
                    if ($(this).val() == "" || $(this).val().length == 0) {
                        layer.alert('第' + T_Faw + '题的选项分值不能为空1!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                // $(this).focus();
                                layer.closeAll();
                                CT_Va = "";

                            }
                        });
                        result++;
                        return result;
                    } else {
                        CT_Va += "," + $(this).val();
                        results++;
                        return result;
                    }
                } else {

                    if ($(this).val() == "" || $(this).val().length == 0) {
                        layer.alert('第' + T_Faw + '题的选项分值不能为空2!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                //alert($(this));
                                //$(this).focus();
                                layer.closeAll();
                                CT_Va = "";

                            }
                        });
                        result++;
                        return result;
                    } else {
                        CT_Va += $(this).val();
                        results++;
                        return result;
                    }
                }
            });
            if ((results > 0 && result <= 0)) {

                $("#Question_" + T_Faw).text(ProTitle);
                if (CT_Code != "") {
                    var ForLength = 0;
                    var Code_Arr = CT_Code.split(',');//题支编码集合
                    var Con_Arr = CT_Content.split(',');//题支内容集合
                    var Va_Arr = CT_Va.split(',');//题支分值结集合
                    ForLength = Code_Arr.length;
                    var TZ_ContentJson = "";
                    var contentHtml = "";
                    //JsonStr += "{\"Pro_Message\" :";
                    //JsonStr += "[ ";


                    JsonStr += "    {";
                    JsonStr += "        \"TG_Info\": ";
                    JsonStr += "            {";
                    JsonStr += "                \"TG_Code\": \"" + AmountCode + "_TG_" + T_Faw + "\",";
                    JsonStr += "                \"TG_Content\": \"" + ProTitle + "\",";
                    JsonStr += "                \"TG_Sort\": \"" + ProSort + "\",";
                    JsonStr += "                \"A_Code\": \"" + AmountCode + "\"";
                    JsonStr += "            }";
                    JsonStr += "        ,";
                    JsonStr += "        \"TZ_List\": [";
                    for (var i = 0; i < ForLength; i++) {
                        if (TZ_ContentJson != "") {
                            TZ_ContentJson += ",{\"TZ_Code\":\"" + AmountCode + "_TG_" + T_Faw + "_TZ_" + Code_Arr[i] + "\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                        } else {
                            TZ_ContentJson += "{\"TZ_Code\":\"" + AmountCode + "_TG_" + T_Faw + "_TZ_" + Code_Arr[i] + "\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                        }

                        contentHtml += ShowProblemContent(T_Faw, i, Code_Arr[i], Con_Arr[i]);//绘制题目静态内容
                    }
                    JsonStr += TZ_ContentJson;
                    JsonStr += "        ]";
                    JsonStr += "    }";


                    //JsonStr += "]}";

                    if (subjectListJson != "") {
                        var TGCode = AmountCode + "_TG_" + T_Faw;
                        if (subjectListJson.indexOf(TGCode) >= 0) {
                            var JsonList = eval("[" + subjectListJson + "]");
                            if (JsonList != null && JsonList.length > 0) {
                                subjectListJson = "";
                                for (var t = 0; t < JsonList.length; t++) {//重新绘制Json结构

                                    if (TGCode != JsonList[t].TG_Info.TG_Code) {
                                        if (subjectListJson != "") {
                                            subjectListJson += ",";
                                        }
                                        subjectListJson += "    {";
                                        subjectListJson += "        \"TG_Info\": ";
                                        subjectListJson += "            {";
                                        subjectListJson += "                \"TG_Code\": \"" + JsonList[t].TG_Info.TG_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\",";
                                        subjectListJson += "                \"TG_Content\": \"" + JsonList[t].TG_Info.TG_Content.replace(/\s/g, "").replace(/\"/g, "\"") + "\",";
                                        subjectListJson += "                \"TG_Sort\": \"" + JsonList[t].TG_Info.TG_Sort.replace(/\s/g, "").replace(/\"/g, "\"") + "\",";
                                        subjectListJson += "                \"A_Code\": \"" + JsonList[t].TG_Info.A_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\"";
                                        subjectListJson += "            }";
                                        subjectListJson += "        ,";
                                        subjectListJson += "        \"TZ_List\": [";

                                        var TZ_ContentJson_2 = "";
                                        if (JsonList[t].TZ_List != null && JsonList[t].TZ_List.length > 0) {
                                            for (var i = 0; i < JsonList[t].TZ_List.length; i++) {
                                                if (TZ_ContentJson_2 != "") {
                                                    TZ_ContentJson_2 += ",{\"TZ_Code\":\"" + JsonList[t].TZ_List[i].TZ_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Num\": \"" + JsonList[t].TZ_List[i].TZ_Num.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + JsonList[t].TZ_List[i].TZ_Con.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + JsonList[t].TZ_List[i].TZ_Val.replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                                                } else {
                                                    TZ_ContentJson_2 += "{\"TZ_Code\":\"" + JsonList[t].TZ_List[i].TZ_Code.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Num\": \"" + JsonList[t].TZ_List[i].TZ_Num.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + JsonList[t].TZ_List[i].TZ_Con.replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + JsonList[t].TZ_List[i].TZ_Val.replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                                                }
                                            }

                                        }

                                        subjectListJson += TZ_ContentJson_2;
                                        subjectListJson += "        ]";
                                        subjectListJson += "    }";

                                    } else {
                                        if (subjectListJson != "") {
                                            subjectListJson += "," + JsonStr;
                                        } else {
                                            subjectListJson += JsonStr;
                                        }

                                    }

                                }

                            }
                        } else { subjectListJson += "," + JsonStr; }
                    } else {
                        subjectListJson += JsonStr;
                    }



                    //$("#textarea_Guidance").val(subjectListJson);
                    $("#Body_" + T_Faw).html(contentHtml);
                    $("#Btn_operation_" + T_Faw).html("[修改]");
                }
                return null;
            } else {
                return false;
            }
        }


        /*----------修改题干临时存储信息[修改]--------*/
        function UpdateQuestion(T_Faw) {
            /*---------------点击修改按钮重新绘制题目格式--------------*/

            var StemTitle = "";
            StemTitle = GetQuestionContent(T_Faw);//给题目外壳的标题赋值
            $("#Body_" + T_Faw).empty();
            $("#Body_" + T_Faw).append(StemTitle);


            var TGCode = AmountCode + "_TG_" + T_Faw;

            var _Code = "";//题支编码
            var _Con_ = "";//题支内容
            var _Fra_ = "";//题支分值
            if (subjectListJson != "" && subjectListJson.length > 0) {
                var JsonList = eval("[" + subjectListJson + "]");
                if (JsonList != null && JsonList.length > 0) {
                    for (var k = 0; k < JsonList.length; k++) {



                        if (TGCode == JsonList[k].TG_Info.TG_Code) {
                            $("#Prot_" + T_Faw).val(JsonList[k].TG_Info.TG_Content);
                            for (var t = 0; t < JsonList[k].TZ_List.length; t++) {

                                _Code = JsonList[k].TZ_List[t].TZ_Num;
                                _Con_ = JsonList[k].TZ_List[t].TZ_Con;
                                _Fra_ = JsonList[k].TZ_List[t].TZ_Val;
                                var ProblemContent = GetProblemContent(T_Faw, t);//获取题支内容
                                $("#Body_" + T_Faw).append(ProblemContent);
                                $("#Code_" + T_Faw + "_" + t).val(_Code);
                                $("#Con_" + T_Faw + "_" + t).val(_Con_);
                                $("#Fra_" + T_Faw + "_" + t).val(_Fra_);
                            }
                        }
                    }
                }
                $("#Btn_operation_" + T_Faw).html("[确定]");
            }
        }



        /*-----根据按钮状态来区分具体调用哪个方法-----*/
        function Btn_Operation(T_Faw) {

            var btnT = $("#Btn_operation_" + T_Faw).html();
            if (btnT == "[确定]") {
                SaveQuestion(T_Faw);//确定题目
                $("#Btn_copyoperation_" + T_Faw).attr("onclick", "CopyAddQuestion('" + T_Faw + "');");
                $("#Btn_copyoperation_" + T_Faw).removeAttr("style");
                $("#Btn_copyoperation_" + T_Faw).removeAttr("disabled");


            } else {
                UpdateQuestion(T_Faw);//修改题目
            }

            //$("#textarea_Guidance").val(subjectListJson);
            // alert(subjectListJson);
        }




        /*新增题支*/
        function addopt(objID, Tcon) {
            //var arr = objID.split('_');
            /*
                arr[0]  代表的是第几题
                arr[1]  代表的是第几题中的第几个选项
            */
            //var nowF = parseInt(arr[1]);
            var ProblemContent = "";
            ProblemContent = GetProblemContent(objID, Tcon);//获取题支内容
            $("#Body_" + Tcon).append(ProblemContent);
            return false;
        }

        /*删除题支*/
        function delopt(objID) {
            //alert(objID);
            var ArrObj = objID.split('_');
            var _codeList = $("[name='Code_" + ArrObj[0] + "']");//   $("#Code_" + ArrObj[0]);
            if (_codeList.length > 1) {
                //询问框
                layer.confirm('您是否要删除当前题支编辑内容？', {
                    btn: ['删除', '取消'] //按钮
                }, function () {
                    $("#Code_" + objID).attr("name", "Error");
                    $("#Con_" + objID).attr("name", "Error");
                    $("#Fra_" + objID).attr("name", "Error");
                    $("#row_" + objID).hide();
                    layer.msg('删除成功', { time: 3000, icon: 1 });
                }, function () {
                    //layer.msg('也可以这样', {
                    //    time: 2000, //20s后自动关闭
                    //    btn: ['明白了', '知道了']
                    //});
                });
            } else {
                layer.msg('做人要厚道，您好歹给我留个吧？', {
                    time: 2000, //20s后自动关闭
                    btn: ['厚道一把']
                });
            }
            return false;
        }

        /*动态添加题目*/
        function addQuestion() {
            var questionCount = $('div[name=QuestionPanel]').length;
            DrawQuestion(parseInt(questionCount) + 1);//动态创建题目

            var quc = parseInt(questionCount) + 1;

            GetSubjectAllJson += quc + ",";

            return false;
        }

        /*题目编辑保存按钮事件*/
        function SaveSubjectSumit() {
            $("#save_OK").hide();


            var btnOK = $("a[name=Btn_operation]");

            var _Guidance = $("#textarea_Guidance").val();
            if (_Guidance.length == 0 || _Guidance == "") {
                layer.alert('指导语不能为空!', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0,
                    yes: function () {
                        $("#textarea_Guidance").focus();
                        layer.closeAll();
                    }
                });

                return false;
            }


            var HaveOK = 0;
            for (var i = 0; i < btnOK.length; i++) {
                var opk = btnOK[i];
                if (opk.innerText == "[确定]") {
                    HaveOK = 1;
                }
            }

            if (HaveOK > 0) {
                layer.msg('当前内容尚未保存！', {
                    time: 2000, //20s后自动关闭
                    btn: ['返回保存']
                });
                return false;
            } else {
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "SaveSubject",
                        Json: subjectListJson,
                        Guidance: $("#textarea_Guidance").val()
                    },//要执行查询的数据参数
                    success: function (msg) {
                        if (msg == 1) {
                            layer.alert('题目编辑保存成功！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });

                            //$("#HF").html("<a href=\"#divide\" id=\"HF_A\" onclick=\"InitCT();\" data-toggle=\"tab\">维度划分</a>");
                            //$('#HF_A').trigger("click");
                        } else {
                            $("#save_OK").show();
                            layer.alert('题目编辑保存失败！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });
                        }
                    }
                });
            }
            return false;
        }



        /*------------初始化页面中的树形结构公共方法---------------------*/

        function DrawOption() {

            var $treeTable = $("#SubjectTree");
            var option = {
                theme: 'vsStyle',
                expandLevel: 1,
                beforeExpand: function ($treeTable, id) {
                    if ($('.' + id, $treeTable).length) { return; }
                }
                ,
                onSelect: function ($treeTable, id) {
                    window.console && console.log('onSelect:' + id);
                }

            };
            $treeTable.treeTable(option);

        }


        var SubjectListUpdate;
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var WDALL;

        /*-----加载页面量表对应的题干------*/
        function OnloadSubjectList() {

            /*列表展现部分 */

            /*
                   创建时间：2016-10-31
                   创建人：刘玉京
                   功能介绍：加载量表题目列表集合
           */


            WDALL = $("#wd_aLL");
            if (SubjectListUpdate != undefined) {
                $("#SubjectList").DataTable().draw();
                WDALL.prop("checked", false);

                return;
            }

            SubjectListUpdate = $('#SubjectList').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                searching: false,
                bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
                pageLength: 10,//首次加载的数据条数
                ordering: false,//排序操作在服务端进行，所以可以关了。
                processing: true,//载入数据的时候是否显示“载入中”
                //aoColumnDefs: [
                //    { //隐藏列
                //        bVisible: false,
                //        aTargets: [0]
                //    },
                //],
                ajax: {
                    method: 'get',
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
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
                        WDALL.prop("checked", false);
                        return 'Remark=LoadSubject&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + "&A_Code=" + AmountCode;
                    }
                },

                createdRow: function (row, data, dataIndex) {

                    //$("#TG_SUM").html(SubjectListCount);//设置题干显示的总数
                    $('td:eq(0)', row).css("text-align", "center");
                    $('td:eq(0)', row).html(" <input type=\"checkbox\" class='childCheck' name='checkbox' onclick=\"SelSubjectClick(this);\" value=\"" + data[0] + "\" />");
                },

                "oLanguage": {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "_MENU_ 记录/页",
                    "sZeroRecords": "没有匹配的记录",
                    "sInfo": "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项记录，共 0 项",
                    "sInfoFiltered": "",
                    "sInfoPostFix": "",
                    "sSearch": "过滤:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    }
                },
                initComplete: function (setting, json) {
                }
            });



            /*-----列表展现部分END-----*/
        }

        /*展现选择题干模块*/
        function ShowSelectSubject() {

            if (SubjectListUpdate != undefined) {
                $("#SubjectList").DataTable().draw();
            } else {
                OnloadSubjectList();
            }
            SelNum = 0;
            $("#SubjectSum").val("0");
            $("#DimensionSort").val("0");
            $("#DimensionCode").val("");
            $("#DimensionName").val("");
            $('#SelectSubject').modal('show');
            //$("#checkboxarr").checked = false;
            $("#checkboxarr")[0].checked = false;

        }

        var SubjecCodeStr = "";
        var SelNum = 0;

        ///*-------------题目单击选择事件-----------*/
        //function SelSubjectClick(obj) {
        //    if (obj.checked) {
        //        if (SubjecCodeStr == "") {
        //            SubjecCodeStr += obj.value;
        //            SelNum++;
        //        } else {
        //            SubjecCodeStr += "," + obj.value;
        //            SelNum++;
        //        }
        //    } else {
        //        SelNum--;
        //        if (SubjecCodeStr != "") {
        //            var codeArr = SubjecCodeStr.split(',');
        //            SubjecCodeStr = "";
        //            for (var t = 0; t < codeArr.length; t++) {
        //                if (codeArr[t] != obj.value) {
        //                    SubjecCodeStr += codeArr[t];
        //                }
        //            }
        //        }
        //    }
        //    $("#SubjectSum").val(SelNum);
        //}


        /*-------------题目单击选择事件-----------*/
        function SelSubjectClick(obj) {
            if (obj.checked) {
                if (SubjecCodeStr == "") {
                    SubjecCodeStr += obj.value;
                    SelNum++;
                } else {
                    if (SubjecCodeStr.indexOf(obj.value) < 0) {
                        SubjecCodeStr += "," + obj.value;
                    }
                    SelNum++;
                }
            } else {

                if (SubjecCodeStr != "") {
                    var codeArr = SubjecCodeStr.split(',');
                    SubjecCodeStr = "";
                    for (var t = 0; t < codeArr.length; t++) {
                        if (codeArr[t] != obj.value) {

                            if (SubjecCodeStr == "") {
                                SubjecCodeStr += codeArr[t];
                            } else {
                                SubjecCodeStr += "," + codeArr[t];
                            }

                        } else {
                            if (SelNum > 0) {
                                SelNum--;
                            }
                        }
                    }
                }
            }
            $("#SubjectSum").val(SelNum);
        }

        /*根据维度名字获取维度编码*/
        function GetWD_Code() {
            var WD_Name = $("#DimensionName").val();
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "GetCode",
                    Chinese: WD_Name
                },//要执行查询的数据参数
                success: function (msg) {
                    $("#DimensionCode").val(msg);
                }
            });
        }

        /*----维度划分保存------*/
        function Save_WDDivide() {
            if (SubjecCodeStr == "" || SubjecCodeStr.length == 0) {
                layer.alert('请选择要划分的题目！', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0

                });
                return;
            }

            var _WD_Name = $("#DimensionName").val();
            var _WD_Code = $("#DimensionCode").val();
            var _Sort = $("#DimensionSort").val();
            var _ProSUM = $("#SubjectSum").val();

            /*----------保存操作事件---------*/
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "SaveCombination",
                    _AmountCode: AmountCode,
                    SC_Str: SubjecCodeStr,
                    WD_Name: _WD_Name,
                    WD_Code: _WD_Code,
                    Sort: _Sort,
                    ProSUM: _ProSUM
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {
                        InitSel_AmountType3();//初始化维度组合下拉列表
                        layer.alert('维度划分成功！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0

                        });
                        $("#showDimension").find("table").remove();
                        var tempTable = "<table class='table table-striped table-bordered table-hover' id='SubjectTree'>" +
                                                "<thead>" +
                                                    "<tr>" +
                                                        "<th style='width: 80%'>维度名称</th>" +
                                                        "<th style='width: 20%'>操作</th>" +
                                                    "</tr>" +
                                                "</thead>" +
                                                "<tbody></tbody>" +
                                            "</table>";
                        $("#showDimension").append(tempTable)
                        InitCT();//加载组合数据集列表
                        InitAD();//初始化评分设置里面的维度下拉列表
                        SubjecCodeStr = "";//清空维度JSon
                        $('#SelectSubject').modal('hide');
                        $("#DimensionName").val("");
                        $("#DimensionSort").val("");

                        //$("#SZ").html("<a href=\"#messages\" id=\"SZ_A\" data-toggle=\"tab\">评分设置</a>");
                        //$('#SZ_A').trigger("click");
                    } else {
                        layer.alert('维度划分失败！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0

                        });
                    }
                }
            });
        }

        //InitCT();//加载组合数据集列表
        //var $treeTable;
        /*--------初始化组合列表-------*/
        function InitCT() {
            $("#showDimension").find("table").remove();
            var tempTable = "<table class='table table-striped table-bordered table-hover' id='SubjectTree'>" +
                                    "<thead>" +
                                        "<tr>" +
                                            "<th style='width: 80%'>维度名称</th>" +
                                            "<th style='width: 20%'>操作</th>" +
                                        "</tr>" +
                                    "</thead>" +
                                    "<tbody></tbody>" +
                                "</table>";
            $("#showDimension").append(tempTable);
            if (AmountCode != "") {
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    async: false,
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
                                //$("#SubjectTree  tbody").empty("");
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


        /*---------------删除维度集合--------*/
        function DelDimension(D_code) {

            //询问框
            layer.confirm('您是否要删除该维度？如果维度删除下面对应的题干也相应删除.', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "DelMessByWD",
                        D_Code: D_code,
                        A_Code: AmountCode
                    },//要执行查询的数据参数
                    success: function (msg) {
                        //$("#DimensionCode").val(msg);
                        if (msg > 0) {
                            InitCT();//加载组合数据集列表
                            layer.msg('维度删除成功', { time: 3000, icon: 1 });
                        } else {
                            layer.msg('删除失败', { time: 3000, icon: 1 });
                        }
                    }
                });



            }, function () {
                //layer.msg('也可以这样', {
                //    time: 2000, //20s后自动关闭
                //    btn: ['明白了', '知道了']
                //});
            });
        }


        /*---------删除题干------------*/
        function DelSMessBySD(_DCode, _SCode) {

            //询问框
            layer.confirm('您是否要删除该题干？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "DelSMessBySD",
                        D_Code: _DCode,
                        S_Code: _SCode
                    },//要执行查询的数据参数
                    success: function (msg) {
                        //$("#DimensionCode").val(msg);
                        if (msg > 0) {
                            InitCT();//加载组合数据集列表
                            layer.msg('题干删除成功', { time: 3000, icon: 1 });
                        } else {
                            layer.msg('删除失败', { time: 3000, icon: 1 });
                        }
                    }
                });



            }, function () {
                //layer.msg('也可以这样', {
                //    time: 2000, //20s后自动关闭
                //    btn: ['明白了', '知道了']
                //});
            });
        }









        var ExplainJson = "";//常模解释
        /*----保存常模解释说明----*/
        function SaveExplain() {



            var NCode = $("#Sel_Norm").val();//常模编码
            //Norm_Title  名称
            //StartAge  最小年龄
            //EndAge  结束年龄
            //Sel_M_Sex  性别
            //Start_Fraction  最小分数
            //End_Fraction  最大分数
            //Fraction_Explain  分值说明
            //Coach_Text  辅导建议

            var _Norm_Title = $("#Norm_Title").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _StartAge = $("#StartAge").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _EndAge = $("#EndAge").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Sel_M_Sex = $("#Sel_M_Sex").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Start_Fraction = $("#Start_Fraction").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _End_Fraction = $("#End_Fraction").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Fraction_Explain = $("#Fraction_Explain").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Coach_Text = $("#Coach_Text").val().replace(/\s/g, "").replace(/\"/g, "\"");

            var _Norm_First_Symbol = $("#Norm_First_Symbol").val();
            var _Norm_Second_Symbol = $("#Norm_Second_Symbol").val();




            if (_StartAge.length == 0) {
                _StartAge = "0";
            }

            if (_EndAge.length == 0) {
                _EndAge = "999";
            }



            if (_Start_Fraction.length == 0) {
                _Start_Fraction = "-99999";
            }

            if (_End_Fraction.length == 0) {
                _End_Fraction = "99999";
            }



            if (parseInt(_Start_Fraction) > parseInt(_End_Fraction)) {

                //layer.msg('最小分值不能大于最大分值！', {
                //    time: 2000, //20s后自动关闭
                //    btn: ['知道了']
                //});
                layer.msg("最小分值不能大于或等于最大分值", { time: 2000, icon: 6 }, function () {

                });
                return;
            }


            if (parseInt(_StartAge) > parseInt(_EndAge)) {

                layer.alert('开始年龄不能大于结束年龄', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })

                return;

            }

            // if (parseInt(_StartAge))



            if (NCode != null && NCode != "0" && NCode != undefined) {
                ExplainJson = "";
                //alert('有值');
                ExplainJson += "{\"NormCode\":\"" + NCode + "\",\"ExplainCode\":\"EC_0\",\"ExplainName\":\"" + _Norm_Title + "\",\"NormStartAge\":\"" + _StartAge + "\",\"NormEndAge\":\"" + _EndAge + "\",\"NormSex\":\"" + _Sel_M_Sex + "\",\"StartFraction\":\"" + _Start_Fraction + "\",\"EndFraction\":\"" + _End_Fraction + "\",\"NormExplain\":\"" + _Fraction_Explain + "\",\"NormProposal\":\"" + _Coach_Text + "\",\"First_Symbol\":\"" + _Norm_First_Symbol + "\",\"Second_Symbol\":\"" + _Norm_Second_Symbol + "\"}";


                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "Add_NE",
                        NE_Json: ExplainJson
                    },//要执行查询的数据参数
                    success: function (msg) {
                        if (msg > 0) {


                            layer.alert('常模解释添加成功 ！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });
                            $('#Model_Pnale').modal('hide');
                            InitNW();

                        } else {
                            layer.alert('常模解释添加失败 ！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });
                        }
                    }
                });



            } else {

                if (_Norm_Title == "") {
                    layer.msg('解释名称不能为空哦？', {
                        time: 2000, //20s后自动关闭
                        btn: ['确定']
                    });
                    return;
                }
                if (_StartAge == "") {
                    _StartAge = "0";
                }

                if (_EndAge == "") {
                    _EndAge = "999";
                }

                if (parseInt(_StartAge) > parseInt(_EndAge)) {
                    layer.msg('开始年龄不能大于出生年龄！', {
                        time: 2000, //20s后自动关闭
                        btn: ['确定']
                    });
                    return;
                }

                if (_Start_Fraction == "") {
                    _Start_Fraction = "-99999";
                }

                if (_End_Fraction == "") {
                    _End_Fraction = "99999";
                }
                if (parseInt(_Start_Fraction) > parseInt(_End_Fraction)) {
                    layer.msg('开始分值不能大于结束分值！', {
                        time: 2000, //20s后自动关闭
                        btn: ['确定']
                    });
                    return;
                }

                if (ExplainJson == "") {
                    ExplainJson += "{\"NormCode\":\"123\",\"ExplainCode\":\"EC_0\",\"ExplainName\":\"" + _Norm_Title + "\",\"NormStartAge\":\"" + _StartAge + "\",\"NormEndAge\":\"" + _EndAge + "\",\"NormSex\":\"" + _Sel_M_Sex + "\",\"StartFraction\":\"" + _Start_Fraction + "\",\"EndFraction\":\"" + _End_Fraction + "\",\"NormExplain\":\"" + _Fraction_Explain + "\",\"NormProposal\":\"" + _Coach_Text + "\",\"First_Symbol\":\"" + _Norm_First_Symbol + "\",\"Second_Symbol\":\"" + _Norm_Second_Symbol + "\"}";
                } else {
                    var j_list = eval("[" + ExplainJson + "]");
                    var E_L = j_list.length;
                    ExplainJson += ",{\"NormCode\":\"123\",\"ExplainCode\":\"EC_" + E_L + "\",\"ExplainName\":\"" + _Norm_Title + "\",\"NormStartAge\":\"" + _StartAge + "\",\"NormEndAge\":\"" + _EndAge + "\",\"NormSex\":\"" + _Sel_M_Sex + "\",\"StartFraction\":\"" + _Start_Fraction + "\",\"EndFraction\":\"" + _End_Fraction + "\",\"NormExplain\":\"" + _Fraction_Explain + "\",\"NormProposal\":\"" + _Coach_Text + "\",\"First_Symbol\":\"" + _Norm_First_Symbol + "\",\"Second_Symbol\":\"" + _Norm_Second_Symbol + "\"}";
                }

                Draw_Explain_Table();
                EliminateMessage();
                $('#Model_Pnale').modal('hide');//常模信息保存以后模态窗口关闭
            }
        }

        function EliminateMessage() {
            $("#Norm_Title").val("");
            $("#StartAge").val("0");
            $("#EndAge").val("0");
            $("#Sel_M_Sex option[value='0']").attr("selected", "selected");
            // $("#Sel_M_Sex").trigger("chosen:updated");
            $("#Start_Fraction").val("0");
            $("#End_Fraction").val("0");
            $("#Fraction_Explain").val("");
            $("#Coach_Text").val("");
            $("#Norm_First_Symbol").val("<=")
            $("#Norm_Second_Symbol").val("<=")
        }



        /*-----绘画解释说明列表-----*/
        function Draw_Explain_Table() {

            if (ExplainJson != "") {
                var ExplainTable = $("#Explain_Table");
                $("#Explain_Table  tbody").empty("");
                var ExplainJsonList = eval("[" + ExplainJson + "]");

                if (ExplainJsonList != null && ExplainJsonList.length > 0) {
                    for (var k = 0; k < ExplainJsonList.length; k++) {
                        var delBtn = "<i class=\"fa fa-times\" style=\"color: red;cursor:pointer;\"  onclick=\"Del_Draw_Explain('" + ExplainJsonList[k]["ExplainCode"] + "')\" aria-hidden=\"true\"></i>";

                        var UpdateBtn = "<i class=\"fa fa fa-cog\" style=\"color: #0F0;cursor:pointer;\"  onclick=\"Update_Draw_Explain('" + ExplainJsonList[k]["ExplainCode"] + "')\" aria-hidden=\"true\"></i>";


                        var F_sy = ExplainJsonList[k]["First_Symbol"] == "<" ? "&lt;" : ExplainJsonList[k]["First_Symbol"];
                        var S_sy = ExplainJsonList[k]["Second_Symbol"] == "<" ? "&lt;" : ExplainJsonList[k]["Second_Symbol"];

                        var M_Age = ExplainJsonList[k]["NormEndAge"] == "999" ? "无限制" : ExplainJsonList[k]["NormEndAge"];

                        var tableHtmltd = "<td>" + ExplainJsonList[k]["ExplainName"] + "</td><td>" + ExplainJsonList[k]["NormStartAge"] + "-" + M_Age + "</td><td>" + ExplainJsonList[k]["NormSex"] + "</td><td>" + ExplainJsonList[k]["StartFraction"] + F_sy + "SCORE" + S_sy + ExplainJsonList[k]["EndFraction"] + "</td><td>" + ExplainJsonList[k]["NormExplain"] + "</td><td>" + ExplainJsonList[k]["NormProposal"] + "</td><td style=\"float:center;\">" + UpdateBtn + "&nbsp;" + delBtn + "</td>";
                        var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                        ExplainTable.append(TableHtml);
                    }
                }
            } else {
                $("#Explain_Table  tbody").empty("");
            }
        }

        /*----------删除常模解释说明------------*/
        function Del_Draw_Explain(obj) {

            //layer.msg('删除失败', { time: 3000, icon: 1 });

            //询问框
            layer.confirm('您是否要删除该常模解释？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                layer.closeAll();
                if (ExplainJson != "") {
                    var ExplainJsonList = eval("[" + ExplainJson + "]");
                    ExplainJson = ""
                    for (var k = 0; k < ExplainJsonList.length; k++) {

                        var ec_code = ExplainJsonList[k].ExplainCode;
                        if (obj != ec_code) {

                            if (ExplainJson == "") {
                                ExplainJson += "{\"NormCode\":\"123\",\"ExplainCode\":\"" + ec_code + "\",\"ExplainName\":\"" + ExplainJsonList[k].ExplainName + "\",\"NormStartAge\":\"" + ExplainJsonList[k].NormStartAge + "\",\"NormEndAge\":\"" + ExplainJsonList[k].NormEndAge + "\",\"NormSex\":\"" + ExplainJsonList[k].NormSex + "\",\"StartFraction\":\"" + ExplainJsonList[k].StartFraction + "\",\"EndFraction\":\"" + ExplainJsonList[k].EndFraction + "\",\"NormExplain\":\"" + ExplainJsonList[k].NormExplain + "\",\"NormProposal\":\"" + ExplainJsonList[k].NormProposal + "\",\"First_Symbol\":\"" + ExplainJsonList[k].First_Symbol + "\",\"Second_Symbol\":\"" + ExplainJsonList[k].Second_Symbol + "\"}";
                            } else {
                                ExplainJson += ",{\"NormCode\":\"123\",\"ExplainCode\":\"" + ec_code + "\",\"ExplainName\":\"" + ExplainJsonList[k].ExplainName + "\",\"NormStartAge\":\"" + ExplainJsonList[k].NormStartAge + "\",\"NormEndAge\":\"" + ExplainJsonList[k].NormEndAge + "\",\"NormSex\":\"" + ExplainJsonList[k].NormSex + "\",\"StartFraction\":\"" + ExplainJsonList[k].StartFraction + "\",\"EndFraction\":\"" + ExplainJsonList[k].EndFraction + "\",\"NormExplain\":\"" + ExplainJsonList[k].NormExplain + "\",\"NormProposal\":\"" + ExplainJsonList[k].NormProposal + "\",\"First_Symbol\":\"" + ExplainJsonList[k].First_Symbol + "\",\"Second_Symbol\":\"" + ExplainJsonList[k].Second_Symbol + "\"}";
                            }
                        }
                    }
                }
                Draw_Explain_Table();//重新绘制解释列表
            });

        }






        /*---------初始化性别下拉类表样式---------*/
        initSex();
        function initSex() {
            //$("#Sel_M_Sex").chosen();
            //$("#Sel_M_Sex").trigger("chosen:updated");

            $("#Sel_M_Sex_W").chosen();
            $("#Sel_M_Sex_W").trigger("chosen:updated");
        }




        var WarningJson = "";
        /*-------预警设置保存操作-------*/
        function SaveWarning() {



            //Warning_Title --预警名称
            //Start_Warning_Fun --开始分数
            //End_Warning_Fun --结束分数


            //StartAge_W --开始年龄
            //EndAge_W --结束年龄
            //Warning_Level --预警级别
            //Sel_M_Sex_W --性别
            //First_Symbol --第一运算符
            //Second_Symbol --第二运算符





            var NCode = $("#Sel_Norm").val();//常模编码

            var _Warning_Title = $("#Warning_Title").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Start_Warning_Fun = $("#Start_Warning_Fun").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _End_Warning_Fun = $("#End_Warning_Fun").val().replace(/\s/g, "").replace(/\"/g, "\"");


            var _StartAge_W = $("#StartAge_W").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _EndAge_W = $("#EndAge_W").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Warning_Level = $("#Warning_Level").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Sel_M_Sex_W = $("#Sel_M_Sex_W").val();
            var _First_Symbol = $("#First_Symbol").val();
            var _Second_Symbol = $("#Second_Symbol").val();




            if (_StartAge_W.length == 0) {
                _StartAge_W = "0";
            }

            if (_EndAge_W.length == 0) {
                _EndAge_W = "999";
            }

            if (parseInt(_StartAge_W) > parseInt(_EndAge_W)) {

                layer.alert('开始年龄不能大于结束年龄！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;

            }


            if (_Start_Warning_Fun.length == 0) {
                _Start_Warning_Fun = "-99999";
            }

            if (_End_Warning_Fun.length == 0) {
                _End_Warning_Fun = "99999";
            }

            if (parseInt(_Start_Warning_Fun) > parseInt(_End_Warning_Fun)) {

                layer.alert('开始分值不能大于结束分值 ！', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                });
                return;
            }


            if (NCode != null && NCode != "0" && NCode != undefined) {

                WarningJson = "";
                WarningJson += "{\"NormCode\":\"" + NCode + "\",\"NormWarningCode\":\"NC_0\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\",\"StartAge_W\":\"" + _StartAge_W + "\",\"EndAge_W\":\"" + _EndAge_W + "\",\"Warning_Level\":\"" + _Warning_Level + "\",\"Sel_M_Sex_W\":\"" + _Sel_M_Sex_W + "\",\"First_Symbol\":\"" + _First_Symbol + "\",\"Second_Symbol\":\"" + _Second_Symbol + "\"}";

                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "Add_NW",
                        NW_Json: WarningJson
                    },//要执行查询的数据参数
                    success: function (msg) {
                        if (msg > 0) {
                            layer.alert('常模预警添加成功 ！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });
                            $('#Model_Warning').modal('hide');
                            InitNW();

                        } else {
                            layer.alert('常模预警添加失败 ！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });
                        }
                    }
                });






                //Add_NW

            } else {
                if (_Start_Warning_Fun == "") {
                    _Start_Warning_Fun = "-99999";

                }

                if (_End_Warning_Fun == "") {
                    _End_Warning_Fun = "99999";
                }

                if (parseInt(_Start_Warning_Fun) > parseInt(_End_Warning_Fun)) {
                    layer.msg('开始预警分值不能大于结束预警分值！', {
                        time: 2000, //20s后自动关闭
                        btn: ['确定']
                    });
                    return;
                }


                if (WarningJson == "") {
                    WarningJson += "{\"NormCode\":\"" + NCode + "\",\"NormWarningCode\":\"NC_0\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\",\"StartAge_W\":\"" + _StartAge_W + "\",\"EndAge_W\":\"" + _EndAge_W + "\",\"Warning_Level\":\"" + _Warning_Level + "\",\"Sel_M_Sex_W\":\"" + _Sel_M_Sex_W + "\",\"First_Symbol\":\"" + _First_Symbol + "\",\"Second_Symbol\":\"" + _Second_Symbol + "\"}";
                } else {
                    var nwlist = eval("[" + WarningJson + "]");
                    var n_L = nwlist.length;
                    WarningJson += ",{\"NormCode\":\"" + NCode + "\",\"NormWarningCode\":\"NC_0\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\",\"StartAge_W\":\"" + _StartAge_W + "\",\"EndAge_W\":\"" + _EndAge_W + "\",\"Warning_Level\":\"" + _Warning_Level + "\",\"Sel_M_Sex_W\":\"" + _Sel_M_Sex_W + "\",\"First_Symbol\":\"" + _First_Symbol + "\",\"Second_Symbol\":\"" + _Second_Symbol + "\"}";
                }



                //if (WarningJson == "") {
                //    WarningJson += "{\"NormCode\":\"\",\"NormWarningCode\":\"NC_0\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\"}";
                //} else {
                //    var nwlist = eval("[" + WarningJson + "]");
                //    var n_L = nwlist.length;
                //    WarningJson += ",{\"NormCode\":\"\",\"NormWarningCode\":\"NC_" + n_L + "\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\"}";
                //}

                DrawWarningTable();//绘制预警表结构          

                $('#Model_Warning').modal('hide');//预警信息保存以后模态窗口关闭
            }



        }


        /*------绘制预警表结构------*/
        function DrawWarningTable() {

            if (WarningJson != "") {
                var ExplainTable = $("#Warning_Table");
                $("#Warning_Table  tbody").empty("");

                var WarningList = eval("[" + WarningJson + "]");

                if (WarningList != null && WarningList.length > 0) {
                    for (var k = 0; k < WarningList.length; k++) {
                        var delBtn = "<i class=\"fa fa-times\"  onclick=\"DelWarningMess('" + WarningList[k]["NormWarningCode"] + "');\" style=\"color: red;cursor:pointer;\" aria-hidden=\"true\"></i>";

                        var UpdateBtn = "<i class=\"fa fa-cog\" style=\"color: #0F0;cursor:pointer;\"  onclick=\"Update_WarningMess('" + WarningList[k]["NormWarningCode"] + "')\" aria-hidden=\"true\"></i>";
                        var tableHtmltd = "<td>" + WarningList[k]["NormWarningLevel"] + "</td><td>" + WarningList[k]["Warning_Level"] + "</td><td>" + WarningList[k]["Sel_M_Sex_W"] + "</td><td>" + WarningList[k]["StartAge_W"] + "-" + WarningList[k]["EndAge_W"] + "</td><td>" + WarningList[k]["StartFraction"] + WarningList[k]["First_Symbol"] + "SCORE" + WarningList[k]["Second_Symbol"] + WarningList[k]["EndFraction"] + "</td><td>" + UpdateBtn + "&nbsp;&nbsp;&nbsp;" + delBtn + "</td>";
                        //var tableHtmltd = "<td>" + WarningList[k]["NormWarningLevel"] + "</td><td>" + WarningList[k]["StartFraction"] + "-" + WarningList[k]["EndFraction"] + "</td><td>" + delBtn + "</td>";
                        var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                        ExplainTable.append(TableHtml);
                    }
                }
            } else {
                $("#Warning_Table  tbody").empty("");
            }

            EliminateWarningMessage();

        }


        function DelWarningMess(obj) {
            layer.confirm('您是否要删除该常模预警？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                layer.closeAll();
                if (WarningJson != "") {
                    var WarningJsonList = eval("[" + WarningJson + "]");
                    WarningJson = ""
                    for (var k = 0; k < WarningJsonList.length; k++) {

                        var nw_code = WarningJsonList[k].NormWarningCode;
                        if (obj != nw_code) {

                            if (WarningJson == "") {
                                WarningJson += "{\"NormCode\":\"\",\"NormWarningCode\":\"" + WarningJsonList[k].NormWarningCode + "\",\"NormWarningLevel\":\"" + WarningJsonList[k].NormWarningLevel + "\",\"StartFraction\":\"" + WarningJsonList[k].StartFraction + "\",\"EndFraction\":\"" + WarningJsonList[k].EndFraction + "\"}";
                            } else {
                                WarningJson += ",{\"NormCode\":\"\",\"NormWarningCode\":\"" + WarningJsonList[k].NormWarningCode + "\",\"NormWarningLevel\":\"" + WarningJsonList[k].NormWarningLevel + "\",\"StartFraction\":\"" + WarningJsonList[k].StartFraction + "\",\"EndFraction\":\"" + WarningJsonList[k].EndFraction + "\"}";
                            }
                        }
                    }
                }
                DrawWarningTable();//重新绘制解释列表
            });

        }



        /*---清除预警信息*/
        function EliminateWarningMessage() {
            $("#Warning_Title").val("");
            $("#Start_Warning_Fun").val("0");
            $("#End_Warning_Fun").val("0");
            $("#Sel_M_Sex_W").val("0");
            $("#StartAge_W").val("0");
            $("#EndAge_W").val("0");
            $("#Warning_Level").val("");

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
                        $("#Sel_Dimension").chosen();
                        $("#Sel_Dimension").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                    } else {
                        $("#Sel_Dimension").append("<option value='0'>暂无维度可选</option>");
                    }



                }
            });
        }

        /*-------初始化自编量表常模下拉列表-------*/
        //InitNorm();//加载常模
        function InitNorm(SelValue) {
            $("#Sel_Norm").empty();
            var _d_Code = $("#Sel_Dimension").val();
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "InitNorm",
                    D_Code: _d_Code
                },//要执行查询的数据参数
                success: function (msg) {
                    //alert(msg);
                    if (msg != "") {
                        $("#Sel_Norm").append("<option value='0'>请选择常模</option>");
                        $.each(eval(msg), function (index, item) {
                            if (SelValue != "") {
                                $("#Sel_Norm").append("<option value='" + item.Value + "' selected='selected'>" + item.Text + "</option>");
                            } else {
                                if (item.Use == 1) {
                                    $("#Sel_Norm").append("<option value='" + item.Value + "' selected='selected'>" + item.Text + "</option>");

                                } else {
                                    $("#Sel_Norm").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                                }
                            }

                        });
                    } else {
                        $("#Sel_Norm").append("<option value='0'>暂无常模可选，请添加</option>");

                    }

                    $("#Sel_Norm").chosen();
                    $("#Sel_Norm").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                    InitNW();
                }
            });
            GetFormula();

        }




        function GetFormula() {
            var _d_Code = $("#Sel_Dimension").val();
            var f_type = $("#CK_F_Type");

            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "GetFormula",
                    d_code: _d_Code
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        var objentity = eval("[" + msg + "]");
                        JF_Type = objentity[0][1];

                        if (objentity[0][1] == 1) {

                            //alert('11111111111111111');
                            $("CK_F_Type").prop("checked", false);
                            $('#wlan_enable_div').bootstrapSwitch('toggleState');
                            $('#wlan_enable_div').bootstrapSwitch('setState', false);
                            $("#textarea_formula").val(objentity[0][0]);

                        } else {

                            $("CK_F_Type").prop("checked", true);
                            $('#wlan_enable_div').bootstrapSwitch('toggleState');
                            $('#wlan_enable_div').bootstrapSwitch('setState', true);
                            $("#textarea_formula").val('');
                        }

                    } else {
                        JF_Type = 0;

                        if (JF_Type == 0) {
                            $("#JF_Title").css('display', 'none');
                            $("#JF_Content").css('display', 'none');
                        } else {
                            $("#JF_Title").css('display', 'block');
                            $("#JF_Content").css('display', 'block');
                        }
                        $("CK_F_Type").prop("checked", true);
                        $('#wlan_enable_div').bootstrapSwitch('toggleState');
                        $('#wlan_enable_div').bootstrapSwitch('setState', true);
                        $("#textarea_formula").val('');
                    }
                }
            });
        }






        /*------------第一次加载常模--------*/
        FirstLoadMorm();
        function FirstLoadMorm() {
            $("#Sel_Norm").empty();
            $("#Sel_Norm").append("<option value='0'>暂无常模可选，请添加</option>");
            $("#Sel_Norm").chosen();
            $("#Sel_Norm").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
        }




        /*----保存自编量表的评分设置----*/
        function SaveScore() {
            var CM_NameList = 0;
            //JF_Type  计分方式 0 是原始分  1  是转化分
            //D_Code Sel_Dimension
            var _Dcode = $("#Sel_Dimension").val();//维度编码
            var _NormTitle = $("#T_Norm_Title").val().replace(/\s/g, "").replace(/\"/g, "\"");//常模名称
            var _FormulaStr = $("#textarea_formula").val().replace(/\s/g, "").replace(/\"/g, "\"");//计分公式


            var count = $("#Sel_Norm option").length;
            for (var i = 0; i < count; i++) {
                if ($("#Sel_Norm").get(0).options[i].text == _NormTitle) {
                    CM_NameList = 1;
                    break;
                }
            }

            if (CM_NameList == 1) {

                layer.alert('该常模已经存在!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }


            if (_Dcode == 0) {
                layer.alert('请选择要保存的维度名称!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }


            if (_NormTitle == "") {
                layer.alert('请输入常模名称！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })

                return;

            }


            // Sel_Norm



            //if (CM_NameList == "") {
            //    CM_NameList += _NormTitle;
            //} else {
            //    _NormTitle += "," + _NormTitle;
            //}
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
            //Explain_Table

            //Warning_Table

            //T_Norm_Title






        }



        /*--------------------表格绘制-----------------*/

        var datascore = [22, 15, 18, 36, 27, 29, 14];//分数数据集合
        var WDList = ["维度一", "维度二", "维度三", "维度四", "维度五", "维度六", "维度七"];
        var ctype = "column";//图表展示类型 【bar：横柱展示  ； column：纵柱展示 ； area：六边形展示； line：折线图展示】
        var linew = 1;//是否展示外边框
        var polartype = false;
        var tname = "";//图表标题

        function DrawChart(obj, objName) {

            ctype = obj;
            tname = objName;
            if (ctype == "area") {
                polartype = true;
                linew = 0;

            } else {
                polartype = false;
                linew = 1;
            }

            /*---------------普通类型的----------------*/

            var serieslist = [{
                name: "维度",
                data: datascore
            }];



            if (obj == "EPQ") {
                datascore = [73.14, 52.64, 45.27, 43.66];
                $('#container').highcharts({
                    title: {
                        text: objName,
                        x: -20 //center
                    },
                    chart: {
                        type: 'scatter',
                        zoomType: 'xy'
                    },
                    tooltip: {
                        headerFormat: '<b>{series.name}</b><br>',
                        pointFormat: '{point.x}, {point.y}'
                    },
                    xAxis: {
                        offset: -205,
                        opposite: false,
                        showEmpty: false,
                        lineWidth: 1,
                        tickWidth: 1,
                        tickPositions: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95],
                        min: 5,
                        max: 95,
                        minTickInterval: 2,
                        title: {//纵轴标题  
                            text: 'E维度（内外倾向性）',
                            x: 170,
                            floating: true
                        },
                        plotLines: [{
                            color: '#e6e6e6',            //线的颜色，定义为红色
                            dashStyle: 'longdashdot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                            value: 38.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                            width: 2              //标示线的宽度，2px
                        }, {
                            color: '#e6e6e6',            //线的颜色，定义为红色
                            dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                            value: 43.3,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                            width: 2            //标示线的宽度，2px
                        }, {
                            color: '#e6e6e6',            //线的颜色，定义为红色
                            dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                            value: 56.7,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                            width: 2             //标示线的宽度，2px
                        }, {
                            color: '#e6e6e6',            //线的颜色，定义为红色
                            dashStyle: 'longdashdot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                            value: 61.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                            width: 2             //标示线的宽度，2px
                        }]
                    },
                    labels: {//在报表上显示的一些文本  
                        items: [{
                            html: '内向、不稳定抑郁质',
                            style: { left: '30px', top: '80px' }
                        }, {
                            html: '外向、不稳定胆汁质',
                            style: { left: '300px', top: '80px' }
                        }, {
                            html: '内向、稳定粘液质',
                            style: { left: '30px', top: '300px' }
                        }, {
                            html: '外向、稳定多血质',
                            style: { left: '300px', top: '300px' }
                        }]
                    },
                    yAxis: {
                        offset: -220,
                        gridLineWidth: 0,
                        title: null,
                        tickWidth: 1,
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }],
                        lineWidth: 1,
                        tickWidth: 1,
                        tickPositions: [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95],
                        title: {//纵轴标题  
                            text: 'N维度（情绪稳定性）',
                            x: 30,
                            y: 210,
                            rotation: -360
                        },
                        plotLines: [{
                            color: '#e6e6e6',            //线的颜色，定义为红色
                            dashStyle: 'longdashdot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                            value: 38.5,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                            width: 2                //标示线的宽度，2px
                        }, {
                            color: '#e6e6e6',            //线的颜色，定义为红色
                            dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                            value: 43.3,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                            width: 2             //标示线的宽度，2px
                        },
                        {
                            color: '#e6e6e6',            //线的颜色，定义为红色
                            dashStyle: 'solid',//标示线的样式，默认是solid（实线），这里定义为长虚线
                            value: 56.7,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                            width: 2            //标示线的宽度，2px
                        },
                    {
                        color: '#e6e6e6',            //线的颜色，定义为红色
                        dashStyle: 'longdashdot',//标示线的样式，默认是solid（实线），这里定义为长虚线
                        value: 56.7,                //定义在那个值上显示标示线，这里是在x轴上刻度为3的值处垂直化一条线
                        width: 2            //标示线的宽度，2px
                    }]
                    },
                    series: [{
                        name: '分数',
                        data: [datascore]
                    }]
           , legend: {
               layout: 'vertical',
               align: 'right',
               verticalAlign: 'middle',
               borderWidth: 0,
               enabled: false
           },
                });
            } else if (obj == "KTR") {


                var w = 650;
                var h = 750;
                //左右空隙，用来放高分低分特征说明文字
                var margin = 100;
                if (w == null || w.length < 1) { w = "100%"; } else { w = w[1] + "px"; } //宽度，默认100%
                //x轴上标签的宽度
                var x_label_w = 75;
                //创建剖析图容器
                $('#container').highcharts({

                    title: {
                        text: tname,
                        x: -20 //center
                    },
                    chart: {
                        style: { fontFamily: "'微软雅黑', Verdana, '宋体'" }, //字体
                        type: 'line', //平滑曲线
                        inverted: true, //xy轴反转
                        marginLeft: margin + x_label_w + 5,
                        marginRight: margin + 5
                    },
                    xAxis: {
                        categories: WDList,
                        gridLineWidth: 1, //x轴上网格线（默认没有）
                        offset: margin + 5
                    },
                    yAxis: {
                        title: null,
                        max: 10,
                        min: 1,
                        tickInterval: 1, //刻度间隔
                        plotLines: [{ //竖直中线
                            label: { text: '中线' },
                            color: 'red',
                            value: 5.5,
                            width: 1
                        }]
                    },

                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0,
                        enabled: false
                    },
                    series: [{
                        name: '人格因素',
                        data: datascore,
                        dataLabels: {
                            enabled: true, //显示数据标签
                            align: 'left', //数据标签左对齐，控制xy坐标位置
                            x: 5,
                            y: 10
                        }
                    }, {
                        name: '次级人格因素',
                        data: [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 10, 7.5, 12.7, 16.4],
                        dataLabels: {
                            enabled: true, //显示数据标签
                            align: 'left', //数据标签左对齐，控制xy坐标位置
                            x: 5,
                            y: 10
                        }
                    }]
                }, function (chart) { // 画图完成后写两边的文字
                    var low = "沉默孤独|迟钝、学识浅薄|迟钝、情绪激动|谦逊顺从|严肃谨慎|权宜敷衍|畏怯退缩|理智、注重实际|信赖随和|现实、合乎常规|坦白直率、天真|安详沉着、有自信心|保守、附庸传统|依赖、随群附众|矛盾冲突、不明大体|心平气和|适应|内向|冲动|怯懦".split("|");
                    var high = "乐群外向|聪慧、富有才识|情绪稳定|好强固执|轻松兴奋|有恒负责|冒险敢为|敏感、感情用事|怀疑刚愎|幻想、狂荡不羁|精明能干、世故|忧虑抑郁、烦恼多端|自由、批评激进|自立、当机立断|知己知彼、自律谨严|紧张困扰|焦虑|外向|安详|果断".split("|");

                    //为字符串对象增加一个右边截取方法
                    String.prototype.rightStr = function (n) { return this.substring(this.length - n, this.length); };

                    for (var i = 0; i < low.length; i++) {
                        chart.renderer.text(("　　　　　　　" + low[i]).rightStr(9), x_label_w, i * (h - 100) / 20 + 80).css({ fontSize: "11px" }).add();
                        chart.renderer.text(high[i], $('#container1').width() - margin, i * (h - 100) / 20 + 80).css({ fontSize: "11px" }).add();
                    }
                });

            } else {
                $('#container').highcharts({
                    chart: {
                        polar: polartype,
                        type: ctype
                    },
                    title: {
                        text: tname,
                        x: -20 //center
                    },
                    xAxis: {
                        categories: WDList,
                        tickmarkPlacement: 'on',
                        lineWidth: linew,
                        labels: {
                            style: {
                                'fontSize': '14px'
                            }
                        },
                    },
                    yAxis: {
                        gridLineInterpolation: 'polygon',
                        lineWidth: linew,

                        title: {
                            text: '分数 (分)'
                        },
                        labels: {
                            style: {
                                'fontSize': '14px'
                            }
                        },
                    },
                    tooltip: {
                        valueSuffix: '分'
                    },
                    plotOptions: {
                        series: {
                            pointWidth: 30 //柱子的宽度值 单位为px
                        }
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0,
                        enabled: false,
                    },
                    series: serieslist,
                });
            }
        }

        DrawChart("column", "纵柱柱状图");
        /*-------动态加载展示图表----------*/
        function SetChart(obj) {
            var T_Name = $("#Sel_BB").find("option:selected").text();
            DrawChart(obj.value, T_Name);
        }


        /*----------*/


        //InitSel_AmountType3();
        /*-----加载维度划分模块下的下拉列表-----*/
        function InitSel_AmountType3() {
            $("#Sel_AmountType3").empty();
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "InitAD",
                    ACode: AmountCode
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        $("#Sel_AmountType3").append("<option value='0'>--请选择维度名称--</option>");
                        $.each(eval(msg), function (index, item) {

                            $("#Sel_AmountType3").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                        });
                        $("#Sel_AmountType3").chosen();
                        $("#Sel_AmountType3").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                    } else {
                        $("#Sel_AmountType3").append("<option value='0'>--请选择维度名称--</option>");
                    }
                }
            });
        }



        /*--------初始化量表人群范围下拉列表------------*/
        InitSel_Start_Age();//开始年龄
        InitSel_End_Age();//结束年龄


        function InitSel_Start_Age() {
            for (var t = 0; t < 100; t++) {

                if (t == 0) {
                    $("#Sel_Start_Age").append("<option value='" + t + "'>全部</option>");
                } else {
                    $("#Sel_Start_Age").append("<option value='" + t + "'>" + t + "岁</option>");
                }

            }
            $("#Sel_Start_Age").chosen();
            $("#Sel_Start_Age").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
            9
        }

        function InitSel_End_Age() {

            for (var t = 0; t < 100; t++) {
                if (t == 0) {
                    $("#Sel_End_Age").append("<option value='" + t + "'>全部</option>");
                } else {
                    $("#Sel_End_Age").append("<option value='" + t + "'>" + t + "岁</option>");
                }

            }
            $("#Sel_End_Age").chosen();
            $("#Sel_End_Age").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
        }


        /*-------------保存维度评分设置功能-------------*/
        function SaveDimensionMessage() {


            var _Dcode = $("#Sel_Dimension").val();//维度编码
            var _Ncode = $("#Sel_Norm").val();//常模编码
            //var _NormTitle = $("#T_Norm_Title").val();//常模名称
            var _FormulaStr = $("#textarea_formula").val();//计分公式
            var dataJson = "";
            dataJson += "    {";
            dataJson += "        \"DimensionCode\": \"" + _Dcode + "\",";//维度编号
            dataJson += "        \"FormulaStr\": \"" + _FormulaStr + "\",";//维度公式
            dataJson += "        \"FormulaCode\": \"000\",";//公式编码
            dataJson += "        \"NormCode\": \"" + _Ncode + "\",";//常模编码
            dataJson += "        \"CalculationType\": \"" + JF_Type + "\"";//公式编码
            dataJson += "    }";
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "UpdateNorm",
                    SourceJson: dataJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {
                        layer.alert('评分设置修改成功！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                    } else {
                        layer.alert('评分设置修改失败 ！', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0
                        });
                    }

                }
            });
        }

        function jump() {
            layer.confirm('当前界面尚未保存，确定要离开吗？', {
                btn: ['是', '否'] //按钮
            }, function () {
                window.location = "heartevaluation.aspx"
            })

        }

        //function jump() {
        //    if (tempAmountName != $("#GaugeName").val().trim()) {
        //        layer.confirm("量表名称已发生改变，是否保存后返回?", {
        //            btn: ["确定", "取消"]
        //        }, function () {
        //            var bootstrapValidator = $("#AmountInfoAdd").data('bootstrapValidator');
        //            bootstrapValidator.validate();
        //            if (bootstrapValidator.isValid()) {
        //                $("#AmountInfoAdd").submit();
        //                window.location = "heartevaluation.aspx"
        //            }
        //            else {
        //                return;
        //            }
        //        }, function () {
        //            window.location = "heartevaluation.aspx"
        //        })
        //    }

        //    else if (tempAmountType != $("#Sel_AmountType").find("option:selected").val().trim()) {
        //        layer.confirm("量表类型已发生改变，是否保存后返回?", {
        //            btn: ["确定", "取消"]
        //        }, function () {
        //            var bootstrapValidator = $("#AmountInfoAdd").data('bootstrapValidator');
        //            bootstrapValidator.validate();
        //            if (bootstrapValidator.isValid()) {
        //                $("#AmountInfoAdd").submit();
        //                window.location = "heartevaluation.aspx"
        //            }
        //            else {
        //                return;
        //            }
        //        }, function () {
        //            window.location = "heartevaluation.aspx"
        //        })
        //    }
        //    else if (tempDisplayName != $("#DisplayName").val().trim()) {
        //        layer.confirm("量表显示名称已发生改变，是否保存后返回?", {
        //            btn: ["确定", "取消"]
        //        }, function () {
        //            var bootstrapValidator = $("#AmountInfoAdd").data('bootstrapValidator');
        //            bootstrapValidator.validate();
        //            if (bootstrapValidator.isValid()) {
        //                $("#AmountInfoAdd").submit();
        //                window.location = "heartevaluation.aspx"
        //            }
        //            else {
        //                return;
        //            }
        //        }, function () {
        //            window.location = "heartevaluation.aspx"
        //        })
        //    }

        //    else if (tempFitPeople != $("#ApplyPeoples").val().trim()) {
        //        layer.confirm("适用人群已发生改变，是否保存后返回?", {
        //            btn: ["确定", "取消"]
        //        }, function () {
        //            var bootstrapValidator = $("#AmountInfoAdd").data('bootstrapValidator');
        //            bootstrapValidator.validate();
        //            if (bootstrapValidator.isValid()) {
        //                $("#AmountInfoAdd").submit();
        //                window.location = "heartevaluation.aspx"
        //            }
        //            else {
        //                return;
        //            }
        //        }, function () {
        //            window.location = "heartevaluation.aspx"
        //        })
        //    }

        //    else if (tempAmountIntroduce != $("#Marks").val().trim()) {
        //        layer.confirm("量表介绍已发生改变，是否保存后返回?", {
        //            btn: ["确定", "取消"]
        //        }, function () {
        //            var bootstrapValidator = $("#AmountInfoAdd").data('bootstrapValidator');
        //            bootstrapValidator.validate();
        //            if (bootstrapValidator.isValid()) {
        //                $("#AmountInfoAdd").submit();
        //                window.location = "heartevaluation.aspx"
        //            }
        //            else {
        //                return;
        //            }
        //        }, function () {
        //            window.location = "heartevaluation.aspx"
        //        })
        //    }
        //    else {
        //        window.location = "heartevaluation.aspx";
        //    }
        //}



        ///*------------只能输入数字的验证---------------*/
        function onlyNumber(obj) {
            //得到第一个字符是否为负号  
            var t = obj.value.charAt(0);
            //先把非数字的都替换掉，除了数字和.   
            obj.value = obj.value.replace(/[^\d\.]/g, '');
            //必须保证第一个为数字而不是.     
            obj.value = obj.value.replace(/^\./g, '');
            //保证只有出现一个.而没有多个.     
            obj.value = obj.value.replace(/\.{2,}/g, '.');
            //保证.只出现一次，而不能出现两次以上     
            obj.value = obj.value.replace('.', '$#$').replace(/\./g, '').replace('$#$', '.');
            //如果第一位是负号，则允许添加  
            if (t == '-') {
                obj.value = '-' + obj.value;
            }

        }

        /*---------------------------------------新方法 目的是为了修改 --------------------------------------------------------*/

        /*--------获取URL中的参数-------*/
        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }


        OnloadAmount();//加载量表信息
        function OnloadAmount() {
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "InitAmount",
                    a_id: GetQueryString("id")
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        var objEntity = eval(msg);
                        if (objEntity != null) {
                            tempAmountName = objEntity[0].AmountName
                            tempDisplayName = objEntity[0].AmountDisName
                            tempFitPeople = objEntity[0].Peoples;
                            tempAmountIntroduce = objEntity[0].AmountMarks;
                            tempAmountType = objEntity[0].AmountTypeID;
                            tempAmountSource = objEntity[0].AmountSource;
                            $("#GaugeName").val(objEntity[0].AmountName);
                            $("#DisplayName").val(objEntity[0].AmountDisName);
                            $("#Marks").val(objEntity[0].AmountMarks);
                            $("#ApplyPeoples").val(objEntity[0].Peoples);
                            $("#Sel_AmountType").val(objEntity[0].AmountTypeID);
                            $("#textarea_Guidance").val(objEntity[0].AmountGuidance);
                            $("#AmountNameHtm").html(objEntity[0].AmountDisName);
                        }
                        var WD_str = "";
                        for (var k = 0; k < objEntity.length; k++) {
                            if (WD_str == "") {
                                WD_str += "'" + objEntity[k].DimensionCode + "'";
                            } else {
                                WD_str += ",'" + objEntity[k].DimensionCode + "'";
                            }
                        }

                        OnloadSubjectInfo(WD_str);//加载题干 题支信息
                    }
                }
            });
        }

        /*------加载题干信息----------*/
        function OnloadSubjectInfo(WD_str) {
            var wcode = WD_str.replace(/\s/g, "").replace(/\'/g, "");
            //if (wcode != "" && wcode.length != 0) {
            //    $.ajax({
            //        type: "POST",
            //        url: "Ajax/HeartEvaluationUpdate.ashx",
            //        data: {
            //            Remark: "GetSubjectMessage",
            //            WD_Str: WD_str
            //        },//要执行查询的数据参数
            //        success: function (msg) {
            //            //  alert(msg);
            //            subjectListJson = msg;

            //            if (subjectListJson != "") {

            //                var jsonListArr = eval("[" + subjectListJson + "]");
            //                if (jsonListArr != null && jsonListArr.length > 0) {

            //                    for (var i = 0; i < jsonListArr.length; i++) {

            //                        UpdateDrawQuestion(i + 1, jsonListArr[i].TG_Info.TG_Content, jsonListArr[i].TZ_List, jsonListArr[i].TG_Info.TG_Code);
            //                    }
            //                }
            //            }


            //            //$("#textarea_Guidance").val(msg);
            //        }
            //    });
            //} else {
            //Update_Sub
            // alert(wcode);
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "Update_Sub",
                    lb_code: GetQueryString("id")
                },//要执行查询的数据参数
                success: function (msg) {
                    //  alert(msg);

                    if (msg != "") {
                        subjectListJson = msg;
                        if (subjectListJson != "") {

                            var jsonListArr = eval("[" + subjectListJson + "]");
                            if (jsonListArr != null && jsonListArr.length > 0) {

                                for (var i = 0; i < jsonListArr.length; i++) {

                                    UpdateDrawQuestion(jsonListArr[i].TG_Info.TG_Sort, jsonListArr[i].TG_Info.TG_Content, jsonListArr[i].TZ_List, jsonListArr[i].TG_Info.TG_Code);
                                }
                            }
                        }
                    } else {
                        New_UpdateDrawQuestion(1);
                    }
                }
            });

            //}
        }

        /*-----------------绘制题干框架结构--------------*/
        function UpdateDrawQuestion(FewQuestion, TG_T, tzlist, TGCode) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title\">"
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">第[" + FewQuestion + "]题&nbsp;&nbsp;&nbsp;&nbsp;[" + TG_T + "]</a>"
			+ "<div class=\"row\" style=\"margin-top:10px;\">"
            + "<div class=\"col-xs-12\">"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return Update_addQuestion();\">[添加新题]</a></label>"
           // + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" onclick=\"CopyAddQuestion('" + FewQuestion + "');\"  >[复制本题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return UpDel_Operation('" + FewQuestion + "','" + TGCode + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return Update_Btn_Operation('" + FewQuestion + "','" + TGCode + "');\">[修改]</a></label>"
			+ "</div>"
            + "</div>"
            + "</h4>"
            + "</div>";

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var P_Body = ""
            + "    <div id=\"Body_" + FewQuestion + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var P_Content = ""
            + "<div id=\"Content_" + FewQuestion + "\" class=\"panel-collapse in\" tyle=\"height: auto;\">"
            + P_Body
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var ShellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + FewQuestion + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + P_Title + P_Content + " </div></div></div>";
            $("#ListQuestionPanel").append(ShellHtml);
            //var StemTitle = "";
            //StemTitle = UpdateQuestionContent(FewQuestion, TG_T);//给题目外壳的标题赋值
            //$("#Body_" + FewQuestion).append(StemTitle);

            //alert(tzlist.length);

            if (tzlist != null && tzlist.length > 0) {

                for (var p = 0; p < tzlist.length ; p++) {

                    var ProblemContent = "";
                    ProblemContent = UpdateShowProblemContent(FewQuestion, p, tzlist[p].TZ_Num, tzlist[p].TZ_Con, tzlist[p].TZ_Val);
                    //ProblemContent = GetUpdateProblemContent(p, tzlist[p].TZ_Num, tzlist[p].TZ_Con, tzlist[p].TZ_Val);//获取题支内容
                    $("#Body_" + FewQuestion).append(ProblemContent);
                }
            }






        }

        /*----------修改方法的绘画题干标题-------------------*/
        function UpdateQuestionContent(T_Faw) {
            var StemTitle = ""
            + "<div class=\"row\" id=\"Prot_F_" + T_Faw + "\"> "
            + "    <div class=\"col-md-12\">"
            + "        <div class=\"form-group input-group col-md-12 col-sm-12 col-xs-12\">"
            + "            <input type=\"text\" class=\"form-control\" id=\"Prot_" + T_Faw + "\"  style=\"height: 34px;\" placeholder=\"请填写题目标题\" />"
            //+ "            <span class=\"input-group-btn\">"
            //+ "                <button class=\"btn btn-default\" type=\"button\">"
            //+ "                    <i class=\"fa fa-file-image-o\"></i>"
            //+ "                </button>"
            //+ "            </span>"
            + "        </div>"
            + "    </div>"
            + "</div>"
            return StemTitle;
        }
        /*000000000000000000000000000000000000000000000000000000000000000000000*/
        /*---------修改方法的绘画题支内容------------------*/
        //function GetUpdateProblemContent(T_Faw, _Code, _Con, _Fra) {
        //    var TZ_Con = $("input[name='Code_" + T_Faw + "']").length;
        //    var ProblemContent = ""
        //    + "<div class=\"row\" style=\"padding-top: 5px;\" id=\"row_" + T_Faw + "_" + TZ_Con + "\">"
        //    + "    <div class=\"col-md-1 col-xs-12 col-sm-1\" style=\"margin-bottom: 15px;\">"
        //    + "        <input class=\"form-control\" name=\"Code_" + T_Faw + "\"  value=\"" + _Code + "\"  id=\"Code_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"编号\" />"
        //    + "    </div>"
        //    + "    <div class=\"col-md-9 col-xs-12 col-sm-9\">"
        //    + "        <div class=\"form-group input-group\">"
        //    + "            <input type=\"text\" class=\"form-control\" name=\"Con_" + T_Faw + "\"   value=\"" + _Con + "\"  id=\"Con_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"选项内容\" />"
        //    + "            <span class=\"input-group-btn\">"
        //    + "                <button class=\"btn btn-default\" type=\"button\">"
        //    + "                    <i class=\"fa fa-file-image-o\"></i>"
        //    + "                </button>"
        //    + "            </span>"
        //    + "        </div>"
        //    + "    </div>"
        //    + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
        //    + "        <input onkeyup=\"onlyNumber(this)\"  onblur=\"onlyNumber(this)\"   value=\"" + _Fra + "\" class=\"form-control\" name=\"Fra_" + T_Faw + "\" id=\"Fra_" + T_Faw + "_" + parseInt(TZ_Con) + "\" style=\"height: 34px;\" placeholder=\"分值\" />"
        //    + "    </div>"
        //    + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
        //    + "        <div class=\"col-md-6\">"
        //    + "            <button class=\"btn btn-default-zblb\" type=\"button\" onclick=\"return addopt('" + T_Faw + "_" + TZ_Con + "');\"  style=\"float: right\">"
        //    + "                <i class=\"fa fa-plus\" style=\"color: green;\" aria-hidden=\"true\"></i>"
        //    + "            </button>"
        //    + "        </div>"
        //    + "        <div class=\"col-md-6\">"
        //    + "            <button class=\"btn btn-default-zblb\" type=\"button\"  onclick=\"return delopt('" + T_Faw + "_" + TZ_Con + "');\" style=\"float: right\">"
        //    + "                <i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>"
        //    + "            </button>"
        //    + "        </div>"
        //    + "    </div>"
        //    + "</div>";
        //    return ProblemContent;
        //}



        /////*根据json展现当前题干的题支部分[绘画题支内容]*/
        //function UpdateShowProblemContent(T_Faw, T_Faw_Con, num, option) {
        //    var ProblemContent = ""
        //    + "<div class=\"row\" >"
        //    + "    <div class=\"col-md-12 col-xs-12 col-sm-12\" >"
        //    + "            <div class=\"radio\">"
        //    + "                 <label>"
        //    + "                       <input type=\"radio\" name=\"options_" + T_Faw + "\" id=\"options_" + T_Faw + "_" + T_Faw_Con + "\" >" + num + "、 " + option
        //    + "                 </label>"
        //    + "           </div>"
        //    + "    </div>"
        //    + "</div>";
        //    return ProblemContent;
        //}



        /*----------修改题干临时存储信息[修改]--------*/
        function UP_UpdateQuestion(T_Faw, TGCode) {
            /*---------------点击修改按钮重新绘制题目格式--------------*/

            var StemTitle = "";
            StemTitle = UpdateQuestionContent(TGCode);//UpdateSaveQuestion(T_Faw, TGCode);//给题目外壳的标题赋值

            $("#Question_" + T_Faw).empty();
            //$("#Question_" + T_Faw).html("第[<input class=\"\" name=\"\" id=\"TH_" + T_Faw + "\" value=\"" + T_Faw + "\" style=\"height: 20px; width:40px;\" placeholder=\"题号\" />]题");
            $("#Question_" + T_Faw).html("第<label data-value=" + T_Faw + " id='TH_" + T_Faw + "'></label>[" + T_Faw + "]题");
            /*-------------------修改题目序号-------------------*/


            $("#Body_" + T_Faw).empty();
            $("#Body_" + T_Faw).append(StemTitle);
            var TGCode = TGCode;
            //alert(subjectListJson);
            var _Code = "";//题支编码
            var _Con_ = "";//题支内容
            var _Fra_ = "";//题支分值
            if (subjectListJson != "" && subjectListJson.length > 0) {
                var JsonList = eval("[" + subjectListJson + "]");
                if (JsonList != null && JsonList.length > 0) {
                    for (var k = 0; k < JsonList.length; k++) {



                        if (TGCode == JsonList[k].TG_Info.TG_Code) {
                            $("#Prot_" + TGCode).val(JsonList[k].TG_Info.TG_Content);
                            for (var t = 0; t < JsonList[k].TZ_List.length; t++) {

                                _Code = JsonList[k].TZ_List[t].TZ_Num;
                                _Con_ = JsonList[k].TZ_List[t].TZ_Con;
                                _Fra_ = JsonList[k].TZ_List[t].TZ_Val;
                                var ProblemContent = UpdateGetProblemContent(TGCode, JsonList[k].TZ_List[t].TZ_Code, T_Faw);//GetProblemContent(T_Faw, t);//获取题支内容
                                $("#Body_" + T_Faw).append(ProblemContent);
                                $("#Code_" + TGCode + "_" + JsonList[k].TZ_List[t].TZ_Code).val(_Code);
                                $("#Con_" + TGCode + "_" + JsonList[k].TZ_List[t].TZ_Code).val(_Con_);
                                $("#Fra_" + TGCode + "_" + JsonList[k].TZ_List[t].TZ_Code).val(_Fra_);
                            }
                            break;
                        }
                    }
                }
                $("#Btn_operation_" + T_Faw).html("[保存]");
            }
        }




        /*-----根据按钮状态来区分具体调用哪个方法-----*/
        function Update_Btn_Operation(T_Faw, TGCode) {

            var btnT = $("#Btn_operation_" + T_Faw).html();
            if (btnT == "[保存]") {
                // UpdateSaveQuestion(T_Faw, TGCode);//确定题目
                UpdateSaveTG(T_Faw, TGCode);
                $("#Btn_copyoperation_" + T_Faw).attr("onclick", "CopyAddQuestion('" + T_Faw + "');");
                $("#Btn_copyoperation_" + T_Faw).removeAttr("style");
                $("#Btn_copyoperation_" + T_Faw).removeAttr("disabled");


            } else {
                UP_UpdateQuestion(T_Faw, TGCode);//修改题目
            }

            //$("#textarea_Guidance").val(subjectListJson);
            // alert(subjectListJson);
        }


        /*----------------------修改题干-----------------------*/
        function UpdateSaveTG(T_Faw, TGCode) {



            var UpdateSubJson = "";
            var UpdateTZJson = "";

            var ProTitle = $("#Prot_" + TGCode).val();//获取题干标题
            var ProSort = $("#TH_" + T_Faw).attr("data-value");//获取题干标题

            if (ProSort == "" || ProSort.length == 0) {

                layer.alert('请输入题号！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }



            if (ProTitle == "" || ProTitle.length == 0) {

                layer.alert('请输入题干内容！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }

            var CT_Number = "";
            var CT_Code = "";//题支编码
            var CT_Content = "";//题支内容
            var CT_Va = "";//题支分值
            var JsonStr = "";


            var ck_code = 0;
            $('input[name=Code_' + TGCode + ']').each(function (i) {
                var t = 0;
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_code++;
                    return;
                }

                if (CT_Code != "") {
                    CT_Code += "," + $(this).val();
                    CT_Number += "," + $(this).attr('id').replace("Code_" + TGCode + "_", "");
                } else {
                    CT_Number += $(this).attr('id').replace("Code_" + TGCode + "_", "");
                    CT_Code += $(this).val();
                }
            });
            if (ck_code > 0) {

                layer.alert('请输入题支编号！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                CT_Code = "";
                return;
            }

            var ck_con = 0;
            $('input[name=Con_' + TGCode + ']').each(function (i) {
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_con++;
                    return;
                }

                if (CT_Content != "") {
                    CT_Content += "," + $(this).val();
                } else {
                    CT_Content += $(this).val();
                }
            });

            if (ck_con > 0) {
                layer.alert("题支类容不能为空！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                CT_Content = "";
                return;
            }

            var ck_fra = 0;
            $('input[name=Fra_' + TGCode + ']').each(function (i) {
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_fra++;
                    return;
                }
                if (CT_Va != "") {
                    CT_Va += "," + $(this).val();
                } else {
                    CT_Va += $(this).val();
                }
            });

            if (ck_fra > 0) {

                layer.alert('请输入分值！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                CT_Va = "";
                return;
            }

            var contentHtml = "";

            if (CT_Code != "") {

                var ForLength = 0;
                var Code_Arr = CT_Code.split(',');//题支编码集合
                var Con_Arr = CT_Content.split(',');//题支内容集合
                var Va_Arr = CT_Va.split(',');//题支分值结集合
                var Number_Arr = CT_Number.split(',');
                ForLength = Code_Arr.length;

                UpdateSubJson += "    {";
                UpdateSubJson += "        \"TG_Info\": ";
                UpdateSubJson += "            {";
                UpdateSubJson += "                \"TG_Code\": \"" + TGCode + "\",";
                UpdateSubJson += "                \"TG_Content\": \"" + ProTitle + "\",";
                UpdateSubJson += "                \"TG_Sort\": \"" + ProSort + "\",";
                UpdateSubJson += "                \"A_Code\": \"" + GetQueryString("id") + "\"";
                UpdateSubJson += "            }";
                UpdateSubJson += "        ,";
                UpdateSubJson += "        \"TZ_List\": [";
                for (var i = 0; i < ForLength; i++) {
                    if (UpdateTZJson != "") {
                        UpdateTZJson += ",{\"TZ_Code\":\"" + Number_Arr[i] + "\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                    } else {
                        UpdateTZJson += "{\"TZ_Code\":\"" + Number_Arr[i] + "\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                    }

                    contentHtml += UpdateShowProblemContent(TGCode, i, Code_Arr[i], Con_Arr[i], Va_Arr[i]);//绘制题目静态内容
                }
                UpdateSubJson += UpdateTZJson;
                UpdateSubJson += "        ]";
                UpdateSubJson += "    }";
            }

            $("#Body_" + T_Faw).html(contentHtml);

            // $("#textarea_Guidance").val(UpdateSubJson);
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "UpdateSubject",
                    Jsonstr: UpdateSubJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {
                        $("#Question_" + T_Faw).html("第[" + ProSort + "]题&nbsp;&nbsp;&nbsp;&nbsp;[" + ProTitle + "]");
                        $("#Btn_operation_" + T_Faw).html("[修改]");

                        //---------更新题干JSON数据集合-------------


                        if (subjectListJson != "") {
                            if (subjectListJson.indexOf(TGCode) >= 0) {
                                var JsonList = eval("[" + subjectListJson + "]");
                                if (JsonList != null && JsonList.length > 0) {
                                    subjectListJson = "";
                                    for (var t = 0; t < JsonList.length; t++) {//重新绘制Json结构

                                        if (TGCode != JsonList[t].TG_Info.TG_Code) {
                                            if (subjectListJson != "") {
                                                subjectListJson += ",";
                                            }
                                            subjectListJson += "    {";
                                            subjectListJson += "        \"TG_Info\": ";
                                            subjectListJson += "            {";
                                            subjectListJson += "                \"TG_Code\": \"" + JsonList[t].TG_Info.TG_Code + "\",";
                                            subjectListJson += "                \"TG_Content\": \"" + JsonList[t].TG_Info.TG_Content + "\",";
                                            subjectListJson += "                \"TG_Sort\": \"" + JsonList[t].TG_Info.TG_Sort + "\",";
                                            subjectListJson += "                \"A_Code\": \"" + JsonList[t].TG_Info.A_Code + "\"";
                                            subjectListJson += "            }";
                                            subjectListJson += "        ,";
                                            subjectListJson += "        \"TZ_List\": [";

                                            var TZ_ContentJson_2 = "";
                                            if (JsonList[t].TZ_List != null && JsonList[t].TZ_List.length > 0) {
                                                for (var i = 0; i < JsonList[t].TZ_List.length; i++) {
                                                    if (TZ_ContentJson_2 != "") {
                                                        TZ_ContentJson_2 += ",{\"TZ_Code\":\"" + JsonList[t].TZ_List[i].TZ_Code + "\",\"TZ_Num\": \"" + JsonList[t].TZ_List[i].TZ_Num + "\",\"TZ_Con\": \"" + JsonList[t].TZ_List[i].TZ_Con + "\",\"TZ_Val\": \"" + JsonList[t].TZ_List[i].TZ_Val + "\"}";
                                                    } else {
                                                        TZ_ContentJson_2 += "{\"TZ_Code\":\"" + JsonList[t].TZ_List[i].TZ_Code + "\",\"TZ_Num\": \"" + JsonList[t].TZ_List[i].TZ_Num + "\",\"TZ_Con\": \"" + JsonList[t].TZ_List[i].TZ_Con + "\",\"TZ_Val\": \"" + JsonList[t].TZ_List[i].TZ_Val + "\"}";
                                                    }
                                                }

                                            }

                                            subjectListJson += TZ_ContentJson_2;
                                            subjectListJson += "        ]";
                                            subjectListJson += "    }";

                                        } else {
                                            // alert(UpdateSubJson);
                                            if (subjectListJson != "") {
                                                subjectListJson += ",";
                                            }
                                            subjectListJson += UpdateSubJson;
                                        }

                                    }

                                }
                            }
                        }


                        //-------------结束----------------

                        layer.msg('修改成功啦！', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });

                    } else {

                        layer.msg('糟糕，修改失败！', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });
                    }
                }
            });




        }

        /*---------绘画题支内容------------------*/
        function UpdateGetProblemContent(T_Faw, tzCode, mark) {
            var TZ_Con = $("input[name='Code_" + T_Faw + "']").length;
            var ProblemContent = ""
            + "<div class=\"row\" style=\"padding-top: 5px;\" id=\"row_" + T_Faw + "_" + tzCode + "\">"
            //+ "<input type=\"hidden\" id=\"\" value=\"\" />";
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\" style=\"margin-bottom: 15px;\">"
            + "        <input class=\"form-control\" name=\"Code_" + T_Faw + "\" id=\"Code_" + T_Faw + "_" + tzCode + "\" style=\"height: 34px;\" placeholder=\"编号\" />"
            + "    </div>"
            + "    <div class=\"col-md-9 col-xs-12 col-sm-9\">"
            + "        <div class=\"col-md-12 col-xs-12 col-sm-12\" style=\"padding-left:0px;padding-right:0px;\">"
            + "            <input type=\"text\" class=\"form-control\" name=\"Con_" + T_Faw + "\" id=\"Con_" + T_Faw + "_" + tzCode + "\" style=\"height: 34px;\" placeholder=\"选项内容\" />"
            //+ "            <span class=\"input-group-btn\">"
            //+ "                <button class=\"btn btn-default\" type=\"button\">"
            //+ "                    <i class=\"fa fa-file-image-o\"></i>"
            //+ "                </button>"
            //+ "            </span>"
            + "        </div>"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <input onkeyup=\"onlyNumber(this)\"  onblur=\"onlyNumber(this)\" class=\"form-control\" name=\"Fra_" + T_Faw + "\" id=\"Fra_" + T_Faw + "_" + tzCode + "\" style=\"height: 34px;\" placeholder=\"分值\" />"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\" onclick=\"return Updateaddopt('" + T_Faw + "','" + mark + "');\"  style=\"float: right\">"
            + "                <i class=\"fa fa-plus\" style=\"color: green;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\"  onclick=\"return Updelopt('" + T_Faw + "<>" + tzCode + "');\" style=\"float: right\">"
            + "                <i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }




        /*修改---新增题支*/
        function Updateaddopt(objID, Tcon) {
            //var arr = objID.split('_');
            /*
                arr[0]  代表的是第几题
                arr[1]  代表的是第几题中的第几个选项
            */
            //var nowF = parseInt(arr[1]);
            var ProblemContent = "";
            ProblemContent = UpdateGetProblemContent(objID, '0000', Tcon);//获取题支内容
            $("#Body_" + Tcon).append(ProblemContent);
            return false;
        }


        ///*根据json展现当前题干的题支部分[绘画题支内容]*/
        function UpdateShowProblemContent(T_Faw, T_Faw_Con, num, option, C_val) {
            var ProblemContent = ""
            + "<div class=\"row\" >"
            + "    <div class=\"col-md-12 col-xs-12 col-sm-12\" >"
            + "            <div class=\"radio\">"
            + "                 <label>"
            + "                       <input type=\"radio\" name=\"options_" + T_Faw + "\" id=\"options_" + T_Faw + "_" + T_Faw_Con + "\" >" + num + "、 <label style=\"color:#0F6\">[计分:" + C_val + "]</label>&nbsp;&nbsp;&nbsp;&nbsp;<label style=\"color:red\">" + option + "</label>"
            + "                 </label>"
            + "           </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }


        /*--------删除题目-----------*/
        function UpDel_Operation(T_Faw, TG_code) {
            var qpanelList = $('div[name=QuestionPanel]').length;
            if (qpanelList > 1) {
                layer.confirm('您是否要删除当前该题干？', {
                    btn: ['删除', '取消'] //按钮
                }, function () {

                    if ($("#QuestionPanel_" + T_Faw) != undefined) {
                        $("#QuestionPanel_" + T_Faw).empty();
                        $("#QuestionPanel_" + T_Faw).hide();
                        $("#QuestionPanel_" + T_Faw).attr("name", "Error");
                        //$("#QuestionPanel_" + T_Faw).attr("id", "Error" + T_Faw);
                    }


                    $.ajax({
                        type: "POST",
                        url: "Ajax/HeartEvaluationUpdate.ashx",
                        data: {
                            Remark: "DelSubject",
                            tg_code: TG_code
                        },//要执行查询的数据参数
                        success: function (msg) {
                            if (msg > 0) {
                                layer.msg('题干删除成功啦！', {
                                    time: 2000, //20s后自动关闭
                                    btn: ['知道了']
                                });

                            } else {

                                layer.msg('糟糕，题干删除失败！', {
                                    time: 2000, //20s后自动关闭
                                    btn: ['知道了']
                                });
                            }
                        }
                    });

                });
            } else {
                layer.msg('做人要厚道，您好歹给我留个吧？', {
                    time: 2000, //20s后自动关闭
                    btn: ['厚道一把']
                });
            }
        }


        /*修改删除题支*/
        function Updelopt(objID) {
            var ArrObj = objID.split('<>');

            var tg_Code = ArrObj[0];
            var tz_code = ArrObj[1];


            var _codeList = $("[name='Code_" + ArrObj[0] + "']");
            if (_codeList.length > 1) {
                //询问框
                layer.confirm('您是否要删除当前题支编辑内容？', {
                    btn: ['删除', '取消'] //按钮
                }, function () {
                    $("#Code_" + tg_Code).attr("name", "Error");
                    $("#Con_" + tg_Code).attr("name", "Error");
                    $("#Fra_" + tg_Code).attr("name", "Error");
                    $("#row_" + tg_Code + "_" + tz_code).hide();


                    $.ajax({
                        type: "POST",
                        url: "Ajax/HeartEvaluationUpdate.ashx",
                        data: {
                            Remark: "DelOption",
                            g_code: tg_Code,
                            z_code: tz_code
                        },//要执行查询的数据参数
                        success: function (msg) {
                            if (msg > 0) {
                                layer.msg('题支删除成功啦！', {
                                    time: 2000, //20s后自动关闭
                                    btn: ['知道了']
                                });

                            } else {

                                layer.msg('糟糕，题支删除失败！', {
                                    time: 2000, //20s后自动关闭
                                    btn: ['知道了']
                                });
                            }
                        }
                    });

                }, function () {
                    //layer.msg('也可以这样', {
                    //    time: 2000, //20s后自动关闭
                    //    btn: ['明白了', '知道了']
                    //});
                });
            } else {
                layer.msg('做人要厚道，您好歹给我留个吧？', {
                    time: 2000, //20s后自动关闭
                    btn: ['厚道一把']
                });
            }
            return false;
        }





        /*----------加载常模解释和常模预警*/
        function InitNW() {

            var CMcode = $("#Sel_Norm").val();
            var str = $("#Sel_Norm option").map(function () { if ($(this).val() == CMcode) return $(this).text(); }).get().join(", ");//获取下拉列表文本
            $("#T_Norm_Title").val(str);
            var DMcode = $("#Sel_Dimension").val();

            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "InitNW",
                    D_Code: DMcode,
                    N_Code: CMcode
                },//要执行查询的数据参数
                success: function (msg) {

                    if (CMcode != null && CMcode != 0) {
                        $("#Model_Message").css('display', 'block');
                        $("#Btn_CM_Save").css('display', 'none');
                        Draw_EW(msg);
                    } else {
                        $("#Btn_CM_Save").css('display', 'block');
                        $("#Model_Message").css('display', 'none');
                    }

                }
            });
        }


        var SetJson = "";//修改评分设置的JSON
        /*-----绘画解释说明列表-----*/
        function Draw_EW(InfoJson) {
            SetJson = InfoJson;
            if (InfoJson != "") {
                var ExplainTable = $("#Explain_Table");
                $("#Explain_Table  tbody").empty("");


                var ExplainJsonList = eval("[" + InfoJson + "]");

                if (ExplainJsonList != null && ExplainJsonList.length > 0) {
                    for (var k = 0; k < ExplainJsonList.length; k++) {
                        var Elist = ExplainJsonList[k].ExplainList;


                        if (Elist != null && Elist.length > 0) {

                            for (var t = 0; t < Elist.length; t++) {

                                var MaxAge = Elist[t].MaxAge == "999" ? "无限制" : Elist[t].MaxAge;
                                var MaxFraction = Elist[t].MaxMark == "99999" ? "正无穷" : Elist[t].MaxMark;


                                var MinAge = Elist[t].MinAge == "-99999" ? "负无穷" : Elist[t].MinAge;
                                var MinFraction = Elist[t].MinMark == "-99999" ? "负无穷" : Elist[t].MinMark;

                                var MSex = Elist[t].Sex;
                                var Tsex = "";
                                if (MSex == 0) {
                                    Tsex = "全部";
                                } else if (MSex == 1) {
                                    Tsex = "男";
                                } else {
                                    Tsex = "女";
                                }

                                var delBtn = "<i class=\"fa fa-times\" style=\"color: red;cursor:pointer;\"  onclick=\"DelExplainByCode('" + Elist[t].ExplainCode + "')\" aria-hidden=\"true\"></i>";
                                var UpdateBtn = "<i class=\"fa fa-cog\" style=\"color: #0F0;cursor:pointer;\"  onclick=\"Update_Draw_Explain('" + Elist[t].ExplainCode + "')\" aria-hidden=\"true\"></i>";
                                var F_sy = Elist[t].First_Symbol == "<" ? "&lt;" : Elist[t].First_Symbol;
                                var S_sy = Elist[t].Second_Symbol == "<" ? "&lt;" : Elist[t].Second_Symbol;

                                var tableHtmltd = "<td>" + Elist[t].ExplainName + "</td><td>" + MinAge + "-" + MaxAge + "</td><td>" + Tsex + "</td><td>" + MinFraction + F_sy + "SCORE" + S_sy + MaxFraction + "</td><td>" + Elist[t].Explain + "</td><td>" + Elist[t].Proposal + "</td><td style=\"float:center;\">" + UpdateBtn + "&nbsp;&nbsp;&nbsp;" + delBtn + "</td>";
                                var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                                ExplainTable.append(TableHtml);
                            }
                        }


                        var Wlist = ExplainJsonList[k].WarningList;


                        var WarningTable = $("#Warning_Table");
                        $("#Warning_Table  tbody").empty("");



                        if (Wlist != null && Wlist.length > 0) {


                            for (var f = 0; f < Wlist.length; f++) {
                                var minFraction = Wlist[f].MinMark == "-99999" ? "负无穷" : Wlist[f].MinMark;
                                var MaxFraction = Wlist[f].MaxMark == "99999" ? "正无穷" : Wlist[f].MaxMark;
                                var delBtn = "<i class=\"fa fa-times\"  onclick=\"DelNW('" + Wlist[f].WarningCode + "');\" style=\"color: red;cursor:pointer;\" aria-hidden=\"true\"></i>";

                                var UpdateBtn = "<i class=\"fa fa-cog\" style=\"color: #0F0;cursor:pointer;\"  onclick=\"Update_WarningMess('" + Wlist[f].WarningCode + "')\" aria-hidden=\"true\"></i>";


                                var MaxAges = Wlist[f].MaxAge == "999" ? "无限制" : Wlist[f].MaxAge;
                                var F_SY = Wlist[f].First_Symbol == "<" ? "&lt;" : Wlist[f].First_Symbol;
                                var S_SY = Wlist[f].Second_Symbol == "<" ? "&lt;" : Wlist[f].Second_Symbol;

                                var W_Sex = Wlist[f].Sex;
                                var Wsex = "";
                                if (W_Sex == 0) {
                                    Wsex = "全部";
                                } else if (W_Sex == 1) {
                                    Wsex = "男";
                                } else {
                                    Wsex = "女";
                                }
                                var tableHtmltd = "<td>" + Wlist[f].WarningLevel + "</td><td>" + Wlist[f].NormWarningLevel_Level + "</td><td>" + Wsex + "</td><td>" + Wlist[f].MinAge + "-" + MaxAges + "</td><td>" + minFraction + F_SY + "SCORE" + S_SY + MaxFraction + "</td><td>" + UpdateBtn + "&nbsp;&nbsp;&nbsp;" + delBtn + "</td>";

                                // var tableHtmltd = "<td>" + Wlist[f].WarningLevel + "</td><td>" + minFraction + "-" + MaxFraction + "</td><td>" + delBtn + "</td>";
                                var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                                WarningTable.append(TableHtml);

                            }
                        }
                    }
                }

            } else {
                $("#Explain_Table  tbody").empty("");
            }
        }


        function DelExplainByCode(ECode) {

            //Del_NER
            layer.confirm('您是否要删除该常模解释？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                var CMcode = $("#Sel_Norm").val();
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "Del_NER",
                        ExplainCode: ECode,
                        NormCode: CMcode
                    },//要执行查询的数据参数
                    success: function (msg) {
                        if (msg > 0) {
                            InitNW();
                            layer.closeAll();
                        } else {
                            layer.alert('常模解释删除失败 ！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });
                        }
                    }
                });
            });

        }


        /*------删除预警信息-----*/
        function DelNW(WCode) {

            layer.confirm('您是否要删除该常模预警？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                var CMcode = $("#Sel_Norm").val();
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "DelNWR",
                        WarningCode: WCode,
                        NormCode: CMcode
                    },//要执行查询的数据参数
                    success: function (msg) {
                        if (msg > 0) {
                            InitNW();
                            layer.closeAll();
                        } else {
                            layer.alert('常模预警删除失败 ！', {
                                skin: 'layui-layer-lan',
                                closeBtn: 0
                            });
                        }
                    }
                });
            });

        }

        function GetTT_S(indexObj, SortStrList) {
            if (SortStrList.indexOf(indexObj) < 0) {
                for (var t = 0; t < indexObj ; t++) {

                    if (t > 0 && SortStrList.indexOf(t) < 0) {
                        return t;

                    }

                }
                return indexObj;
            } else {
                var SL_List = SortStrList.split(',');
                if (SL_List != null && SL_List.length > 0) {
                    for (var k = 0; k < SL_List.length; k++) {
                        if (k > 0 && SortStrList.indexOf(k) < 0) {
                            return k;
                        }
                    }
                    return GetTT_S(parseInt(indexObj + 1), SortStrList);
                }

            }
        }


        /*修改---动态添加题目*/
        function Update_addQuestion() {
            var QP_Arr = $('div[name=QuestionPanel]');
            var questionCount = QP_Arr.length;
            var index = parseInt(questionCount) + 1;
            //alert("实际编码===》" + index);
            var T_Sort = "";
            for (var p = 0; p < questionCount; p++) {
                if (T_Sort != "") {
                    T_Sort += "," + QP_Arr[p].id.split('_')[1];
                } else {
                    T_Sort += QP_Arr[p].id.split('_')[1];
                }

            }
            index = GetTT_S(index, T_Sort);

            //alert(index);

            //return;

            New_UpdateDrawQuestion(index);//动态创建题目
            //UpdateDrawQuestion(FewQuestion, TG_T, tzlist, TGCode)
            var quc = parseInt(questionCount) + 1;

            GetSubjectAllJson += quc + ",";

            return false;
        }


        /*-----------------绘制题干框架结构--------------*/
        function New_UpdateDrawQuestion(FewQuestion) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title\">"
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">第[<input class=\"\" name=\"\"   id=\"TH_" + FewQuestion + "\" style=\"height: 20px; width:40px;\" value=\"" + FewQuestion + "\" placeholder=\"题号\" disabled=\"disabled\" />]题</a>"
			+ "<div class=\"row\" style=\"margin-top:10px;\">"
            + "<div class=\"col-xs-12\">"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return Update_addQuestion();\">[添加新题]</a></label>"
            //+ "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" style=\"color:#999\" disabled=\"disabled\">[复制本题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return Del_Operation('" + FewQuestion + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return New_Btn_Operation('" + FewQuestion + "');\">[确定]</a></label>"
			+ "</div>"
            + "</div>"
            + "</h4>"
            + "</div>";

            /*P_Body 题干内容体身体，最终的题干题支内容是要写到这里面的*/
            var P_Body = ""
            + "    <div id=\"Body_" + FewQuestion + "\" class=\"panel-body\">"
            + "    </div>";

            /*P_Content 题干模块内容体*/
            var P_Content = ""
            + "<div id=\"Content_" + FewQuestion + "\" class=\"panel-collapse in\" tyle=\"height: auto;\">"
            + P_Body
            + "</div>";

            /*定义题目的外壳么，就是区域边框层*/
            var ShellHtml = "<div class=\"row\" name=\"QuestionPanel\" id=\"QuestionPanel_" + FewQuestion + "\" style=\"margin-top:15px;\" ><div class=\"col-md-12\"><div class=\"panel panel-default\">" + P_Title + P_Content + " </div></div></div>";
            $("#ListQuestionPanel").append(ShellHtml);
            var StemTitle = "";
            StemTitle = GetQuestionContent(FewQuestion);//给题目外壳的标题赋值
            $("#Body_" + FewQuestion + "").empty();
            $("#Body_" + FewQuestion + "").append(StemTitle);
            //alert($("#Body_" + FewQuestion + "").id);
            //$("#Body_" + FewQuestion + "").append("000000000");
            var ProblemContent = "";
            ProblemContent = NewAddUpdateGetProblemContent(FewQuestion);//GetProblemContent(FewQuestion, FewQuestion);//获取题支内容



            $("#Body_" + FewQuestion + "").append(ProblemContent);
            //$("#Body_" + FewQuestion + "").append("11111111111");


            //$("#textarea_Guidance").val(ProblemContent);
            //textarea_Guidance


            // alert(FewQuestion);
        }




        /*----------------------修改功能中，添加新的题干 保存操作----------------------*/
        function UpdateNewAddSaveTG(T_Faw, TGCode) {
            var UpdateSubJson = "";
            var UpdateTZJson = "";
            //TH_
            var ProSort = $("#TH_" + T_Faw).attr("data-value");//获取题干标题


            if (ProSort == "" || ProSort.length == 0) {

                layer.alert('请输入题号！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                });
                return;
            }

            var ProTitle = $("#Prot_" + TGCode).val();//获取题干标题

            if (ProTitle == "" || ProTitle.length == 0) {

                layer.alert('请输入题干内容！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                });
                return;
            }

            var CT_Number = "";
            var CT_Code = "";//题支编码
            var CT_Content = "";//题支内容
            var CT_Va = "";//题支分值
            var JsonStr = "";


            var ck_code = 0;
            $('input[name=Code_' + TGCode + ']').each(function (i) {
                var t = 0;
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_code++;
                    return;
                }

                if (CT_Code != "") {
                    CT_Code += "," + $(this).val();
                    CT_Number += "," + $(this).attr('id').replace("Code_" + TGCode + "_", "");
                } else {
                    CT_Number += $(this).attr('id').replace("Code_" + TGCode + "_", "");
                    CT_Code += $(this).val();
                }
            });
            if (ck_code > 0) {

                layer.alert('请输入题支选项内容！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                CT_Code = "";
                return;
            }

            var ck_con = 0;
            $('input[name=Con_' + TGCode + ']').each(function (i) {
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_con++;
                    return;
                }

                if (CT_Content != "") {
                    CT_Content += "," + $(this).val();
                } else {
                    CT_Content += $(this).val();
                }
            });

            if (ck_con > 0) {

                layer.alert('请输入题支选项内容！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                CT_Content = "";
                return;
            }

            var ck_fra = 0;
            $('input[name=Fra_' + TGCode + ']').each(function (i) {
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_fra++;
                    return;
                }
                if (CT_Va != "") {
                    CT_Va += "," + $(this).val();
                } else {
                    CT_Va += $(this).val();
                }
            });

            if (ck_fra > 0) {

                layer.alert('请输入分值！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                });
                CT_Va = "";
                return;
            }

            var contentHtml = "";

            if (CT_Code != "") {

                var ForLength = 0;
                var Code_Arr = CT_Code.split(',');//题支编码集合
                var Con_Arr = CT_Content.split(',');//题支内容集合
                var Va_Arr = CT_Va.split(',');//题支分值结集合
                var Number_Arr = CT_Number.split(',');
                ForLength = Code_Arr.length;

                UpdateSubJson += "    {";
                UpdateSubJson += "        \"TG_Info\": ";
                UpdateSubJson += "            {";
                UpdateSubJson += "                \"TG_Code\": \"" + TGCode + "\",";
                UpdateSubJson += "                \"TG_Content\": \"" + ProTitle + "\",";
                UpdateSubJson += "                \"TG_Sort\": \"" + ProSort + "\",";
                UpdateSubJson += "                \"A_Code\": \"" + GetQueryString("id") + "\"";
                UpdateSubJson += "            }";
                UpdateSubJson += "        ,";
                UpdateSubJson += "        \"TZ_List\": [";
                for (var i = 0; i < ForLength; i++) {
                    if (UpdateTZJson != "") {
                        UpdateTZJson += ",{\"TZ_Code\":\"" + Number_Arr[i] + "\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                    } else {
                        UpdateTZJson += "{\"TZ_Code\":\"" + Number_Arr[i] + "\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                    }

                    contentHtml += UpdateShowProblemContent(TGCode, i, Code_Arr[i], Con_Arr[i], Va_Arr[i]);//绘制题目静态内容
                }
                UpdateSubJson += UpdateTZJson;
                UpdateSubJson += "        ]";
                UpdateSubJson += "    }";
            }

            $("#Body_" + T_Faw).html(contentHtml);

            // $("#textarea_Guidance").val(UpdateSubJson);
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "UpdateSubject",
                    Jsonstr: UpdateSubJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {
                        $("#Question_" + T_Faw).text(ProTitle);
                        $("#Btn_operation_" + T_Faw).html("[修改]");
                        layer.msg('修改成功啦！', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });

                    } else {

                        layer.msg('糟糕，修改失败！', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });
                    }
                }
            });




        }





        /*---------绘画题支内容------------------*/
        function NewAddUpdateGetProblemContent(T_Faw) {
            var TZ_Con = $("input[name='Code_" + T_Faw + "']").length;
            var ProblemContent = ""
            + "<div class=\"row\" style=\"padding-top: 5px;\" id=\"row_" + T_Faw + "_" + TZ_Con + "\">"
            //+ "<input type=\"hidden\" id=\"\" value=\"\" />";
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\" style=\"margin-bottom: 15px;\">"
            + "        <input class=\"form-control\" name=\"Code_" + T_Faw + "\" id=\"Code_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"编号\" />"
            + "    </div>"
            + "    <div class=\"col-md-9 col-xs-12 col-sm-9\">"
            + "        <div class=\"col-md-12 col-xs-12 col-sm-12\" style=\"padding-left:0px;padding-right:0px;\">"
            + "            <input type=\"text\" class=\"form-control\" name=\"Con_" + T_Faw + "\" id=\"Con_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"选项内容\" />"
            //+ "            <span class=\"input-group-btn\">"
            //+ "                <button class=\"btn btn-default\" type=\"button\">"
            //+ "                    <i class=\"fa fa-file-image-o\"></i>"
            //+ "                </button>"
            //+ "            </span>"
            + "        </div>"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <input onkeyup=\"onlyNumber(this)\"  onblur=\"onlyNumber(this)\" class=\"form-control\" name=\"Fra_" + T_Faw + "\" id=\"Fra_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"分值\" />"
            + "    </div>"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\">"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\" onclick=\"return Newaddopt('" + T_Faw + "','" + TZ_Con + "');\"  style=\"float: right\">"
            + "                <i class=\"fa fa-plus\" style=\"color: green;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "        <div class=\"col-md-6\">"
            + "            <button class=\"btn btn-default-zblb\" type=\"button\"  onclick=\"return delopt('" + T_Faw + "_" + TZ_Con + "');\" style=\"float: right\">"
            + "                <i class=\"fa fa-times\" style=\"color: red;\" aria-hidden=\"true\"></i>"
            + "            </button>"
            + "        </div>"
            + "    </div>"
            + "</div>";
            return ProblemContent;
        }



        /*新增题支*/
        function Newaddopt(objID, Tcon) {
            //var arr = objID.split('_');
            /*
                arr[0]  代表的是第几题
                arr[1]  代表的是第几题中的第几个选项
            */
            //var nowF = parseInt(arr[1]);
            var ProblemContent = "";
            ProblemContent = NewAddUpdateGetProblemContent(objID);//获取题支内容
            $("#Body_" + objID).append(ProblemContent);
            return false;
        }



        /*-----根据按钮状态来区分具体调用哪个方法-----*/
        function New_Btn_Operation(T_Faw) {

            var UpdateSubJson = "";
            var UpdateTZJson = "";

            var ProTitle = $("#Prot_" + T_Faw).val();//获取题干标题
            var ProSort = $("#TH_" + T_Faw).val();//获取题干标题


            if (ProSort == "" || ProSort.length == 0) {

                layer.alert('请输入题号！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                });

                return;
            }

            if (ProTitle == "" || ProTitle.length == 0) {

                layer.alert('请输入题干内容！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                });

                return;
            }
            $("#Question_" + T_Faw).text("第" + ProSort + "题   ==>" + ProTitle);
            var CT_Number = "";
            var CT_Code = "";//题支编码
            var CT_Content = "";//题支内容
            var CT_Va = "";//题支分值
            // var JsonStr = "";


            var ck_code = 0;
            $('input[name=Code_' + T_Faw + ']').each(function (i) {
                var t = 0;
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_code++;
                    return;
                }

                if (CT_Code != "") {
                    CT_Code += "," + $(this).val();
                    //CT_Number += "," + $(this).attr('id').replace("Code_" + TGCode + "_", "");
                } else {
                    //CT_Number += $(this).attr('id').replace("Code_" + TGCode + "_", "");
                    CT_Code += $(this).val();
                }
            });
            if (ck_code > 0) {
                layer.alert("题支编号不能为空！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                CT_Code = "";
                return;
            }

            var ck_con = 0;
            $('input[name=Con_' + T_Faw + ']').each(function (i) {
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_con++;
                    return;
                }

                if (CT_Content != "") {
                    CT_Content += "," + $(this).val();
                } else {
                    CT_Content += $(this).val();
                }
            });

            if (ck_con > 0) {

                layer.alert('请输入题支选项内容！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })

                CT_Content = "";
                return;
            }

            var ck_fra = 0;
            $('input[name=Fra_' + T_Faw + ']').each(function (i) {
                if ($(this).val() == "" || $(this).val().length == 0) {
                    ck_fra++;
                    return;
                }
                if (CT_Va != "") {
                    CT_Va += "," + $(this).val();
                } else {
                    CT_Va += $(this).val();
                }
            });

            if (ck_fra > 0) {

                layer.alert('请输入分值！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })

                CT_Va = "";
                return;
            }


            var contentHtml = "";

            if (CT_Code != "") {

                var ForLength = 0;
                var Code_Arr = CT_Code.split(',');//题支编码集合
                var Con_Arr = CT_Content.split(',');//题支内容集合
                var Va_Arr = CT_Va.split(',');//题支分值结集合
                var Number_Arr = CT_Number.split(',');
                ForLength = Code_Arr.length;

                UpdateSubJson += "    {";
                UpdateSubJson += "        \"TG_Info\": ";
                UpdateSubJson += "            {";
                UpdateSubJson += "                \"TG_Code\": \"0000\",";
                UpdateSubJson += "                \"TG_Content\": \"" + ProTitle + "\",";
                UpdateSubJson += "                \"TG_Sort\": \"" + ProSort + "\",";
                UpdateSubJson += "                \"A_Code\": \"" + GetQueryString("id") + "\"";
                UpdateSubJson += "            }";
                UpdateSubJson += "        ,";
                UpdateSubJson += "        \"TZ_List\": [";
                for (var i = 0; i < ForLength; i++) {
                    if (UpdateTZJson != "") {
                        UpdateTZJson += ",{\"TZ_Code\":\"0000\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                    } else {
                        UpdateTZJson += "{\"TZ_Code\":\"0000\",\"TZ_Num\": \"" + Code_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Con\": \"" + Con_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\",\"TZ_Val\": \"" + Va_Arr[i].replace(/\s/g, "").replace(/\"/g, "\"") + "\"}";
                    }

                    contentHtml += UpdateShowProblemContent(T_Faw, i, Code_Arr[i], Con_Arr[i], Va_Arr[i]);//绘制题目静态内容
                }
                UpdateSubJson += UpdateTZJson;
                UpdateSubJson += "        ]";
                UpdateSubJson += "    }";
            }



            //$("#textarea_Guidance").val(UpdateSubJson);
            //alert(UpdateSubJson);

            //return;

            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "NewAddSubject",
                    AddSubJson: UpdateSubJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {
                        $("#Question_" + T_Faw).text("第[" + ProSort + "]题       " + ProTitle);
                        $("#Btn_operation_" + T_Faw).html("[修改]");
                        $("#Body_" + T_Faw).html(contentHtml);
                        layer.msg('添加成功啦！', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });

                    } else {

                        layer.msg('糟糕，添加失败！', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });
                    }
                }
            });
        }



        function Update_Draw_Explain(expCode) {
            EliminateMessage();//清空控件
            $("#Model_Pnale").modal("show");
            //btn_SaveExplain
            $('#btn_SaveExplain').attr('onclick', 'UpSaveExp(\'' + expCode + '\')');

            var ExplainJsonList = eval("[" + SetJson + "]");

            if (ExplainJsonList != null && ExplainJsonList.length > 0) {
                for (var k = 0; k < ExplainJsonList.length; k++) {
                    var Elist = ExplainJsonList[k].ExplainList;


                    if (Elist != null && Elist.length > 0) {

                        for (var t = 0; t < Elist.length; t++) {


                            if (Elist[t].ExplainCode == expCode) {

                                $("#Norm_Title").val(Elist[t].ExplainName);
                                var MaxAge = Elist[t].MaxAge == "999" ? "" : Elist[t].MaxAge;
                                $("#StartAge").val(Elist[t].MinAge);
                                $("#EndAge").val(MaxAge);
                                $("#Sel_M_Sex").val(Elist[t].Sex);

                                $("#Fraction_Explain").val(Elist[t].Explain);
                                $("#Coach_Text").val(Elist[t].Proposal);
                                var MinFraction = Elist[t].MinMark == "-99999" ? "" : Elist[t].MinMark;
                                $("#Start_Fraction").val(MinFraction);

                                var MaxFraction = Elist[t].MaxMark == "99999" ? "" : Elist[t].MaxMark;
                                $("#End_Fraction").val(MaxFraction);

                                //var F_sy = Elist[t].First_Symbol == "<" ? "&lt;" : Elist[t].First_Symbol;
                                //var S_sy = Elist[t].Second_Symbol == "<" ? "&lt;" : Elist[t].Second_Symbol;

                                var f_sy = Elist[t].First_Symbol == "≤" ? "<=" : Elist[t].First_Symbol;

                                $("#Norm_First_Symbol").val(f_sy);
                                var s_sy = Elist[t].Second_Symbol == "≤" ? "<=" : Elist[t].Second_Symbol;
                                $("#Norm_Second_Symbol").val(s_sy);


                                break;
                            }
                        }
                    }
                }
            }





        }


        function UpSaveExp(expCode) {

            //Norm_Title  名称
            //StartAge  最小年龄
            //EndAge  结束年龄
            //Sel_M_Sex  性别
            //Start_Fraction  最小分数
            //End_Fraction  最大分数
            //Fraction_Explain  分值说明
            //Coach_Text  辅导建议
            var _Norm_Title = $("#Norm_Title").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _StartAge = $("#StartAge").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _EndAge = $("#EndAge").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Sel_M_Sex = $("#Sel_M_Sex").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Start_Fraction = $("#Start_Fraction").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _End_Fraction = $("#End_Fraction").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Fraction_Explain = $("#Fraction_Explain").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Coach_Text = $("#Coach_Text").val().replace(/\s/g, "").replace(/\"/g, "\"");

            var _Norm_First_Symbol = $("#Norm_First_Symbol").val();
            var _Norm_Second_Symbol = $("#Norm_Second_Symbol").val();




            if (_StartAge.length == 0) {
                _StartAge = "0";
            }

            if (_EndAge.length == 0) {
                _EndAge = "999";
            }



            if (_Start_Fraction.length == 0) {
                _Start_Fraction = "-99999";
            }

            if (_End_Fraction.length == 0) {
                _End_Fraction = "99999";
            }



            if (parseInt(_Start_Fraction) > parseInt(_End_Fraction)) {

                layer.alert('最小分值不能大于或等于最大分值！！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }

            if (parseInt(_StartAge) > parseInt(_EndAge)) {

                layer.alert('开始年龄不能大于结束年龄！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            }



            ExplainJson = "";
            ExplainJson += "{\"ExplainCode\":\"" + expCode + "\",\"ExplainName\":\"" + _Norm_Title + "\",\"NormStartAge\":\"" + _StartAge + "\",\"NormEndAge\":\"" + _EndAge + "\",\"NormSex\":\"" + _Sel_M_Sex + "\",\"StartFraction\":\"" + _Start_Fraction + "\",\"EndFraction\":\"" + _End_Fraction + "\",\"NormExplain\":\"" + _Fraction_Explain + "\",\"NormProposal\":\"" + _Coach_Text + "\",\"First_Symbol\":\"" + _Norm_First_Symbol + "\",\"Second_Symbol\":\"" + _Norm_Second_Symbol + "\"}";

            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "Update_NExp",
                    NE_Json: ExplainJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {

                        layer.msg('[' + _Norm_Title + ']修改成功啦 (*∩_∩*)′', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });
                        $('#Model_Pnale').modal('hide');
                        InitNW();

                    } else {

                        layer.msg('常模解释修改失败::>_<:: ', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });
                    }
                }
            });
        }


        function Update_WarningMess(wcode) {
            $("#Model_Warning").modal("show");
            $('#btn_BW').attr('onclick', 'UpdateNWsave(\'' + wcode + '\')');


            var ExplainJsonList = eval("[" + SetJson + "]");

            if (ExplainJsonList != null && ExplainJsonList.length > 0) {
                for (var k = 0; k < ExplainJsonList.length; k++) {
                    var Wlist = ExplainJsonList[k].WarningList;

                    if (Wlist != null && Wlist.length > 0) {


                        for (var f = 0; f < Wlist.length; f++) {

                            if (Wlist[f].WarningCode == wcode) {

                                $("#Warning_Title").val(Wlist[f].WarningLevel);
                                $("#Warning_Level").val(Wlist[f].NormWarningLevel_Level);
                                $("#Sel_M_Sex_W").val(Wlist[f].Sex);
                                $("#StartAge_W").val(Wlist[f].MinAge);
                                var MaxAges = Wlist[f].MaxAge == "999" ? "" : Wlist[f].MaxAge;
                                $("#EndAge_W").val(MaxAges);
                                var minFraction = Wlist[f].MinMark == "-99999" ? "" : Wlist[f].MinMark;
                                var MaxFraction = Wlist[f].MaxMark == "99999" ? "" : Wlist[f].MaxMark;

                                $("#Start_Warning_Fun").val(minFraction);
                                $("#End_Warning_Fun").val(MaxFraction);
                                $("#First_Symbol").val(Wlist[f].First_Symbol);
                                $("#Second_Symbol").val(Wlist[f].Second_Symbol);
                                break;
                            }
                        }
                    }
                }
            }
        }



        function UpdateNWsave(wcode) {



            var NCode = $("#Sel_Norm").val();//常模编码
            var _Warning_Title = $("#Warning_Title").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Start_Warning_Fun = $("#Start_Warning_Fun").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _End_Warning_Fun = $("#End_Warning_Fun").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _StartAge_W = $("#StartAge_W").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _EndAge_W = $("#EndAge_W").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Warning_Level = $("#Warning_Level").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Sel_M_Sex_W = $("#Sel_M_Sex_W").val();
            var _First_Symbol = $("#First_Symbol").val();
            var _Second_Symbol = $("#Second_Symbol").val();

            if (_StartAge_W.length == 0) {
                _StartAge_W = "0";
            }

            if (_EndAge_W.length == 0) {
                _EndAge_W = "999";
            }

            if (parseInt(_StartAge_W) > parseInt(_EndAge_W)) {
                layer.alert('开始年龄不能大于或等于结束年龄！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;

            }


            if (_Start_Warning_Fun.length == 0) {
                _Start_Warning_Fun = "-99999";
            }

            if (_End_Warning_Fun.length == 0) {
                _End_Warning_Fun = "99999";
            }

            if (parseInt(_Start_Warning_Fun) > parseInt(_End_Warning_Fun)) {

                layer.alert("最小分值不能大于最大分值！", {
                    skin: "layui-layer-lan",
                    closeBtn: 0
                })
                return;
            }


            var UP_WarningJson = "";
            UP_WarningJson += "{\"NormWarningCode\":\"" + wcode + "\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\",\"StartAge_W\":\"" + _StartAge_W + "\",\"EndAge_W\":\"" + _EndAge_W + "\",\"Warning_Level\":\"" + _Warning_Level + "\",\"Sel_M_Sex_W\":\"" + _Sel_M_Sex_W + "\",\"First_Symbol\":\"" + _First_Symbol + "\",\"Second_Symbol\":\"" + _Second_Symbol + "\"}";

            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "update_NW",
                    NW_Json: UP_WarningJson
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg > 0) {
                        layer.msg('[' + _Warning_Title + ']修改成功啦 (*∩_∩*)′', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });
                        $('#Model_Warning').modal('hide');
                        InitNW();

                    } else {
                        layer.msg('常模预警修改失败::>_<:: ', {
                            time: 2000, //20s后自动关闭
                            btn: ['知道了']
                        });
                    }
                }
            });



        }


        function UpdaWDZH(WD_code, wd_name) {

            ResUpdate(WD_code);
            $("#UW_DimensionName").val(wd_name);

            $('#Btn_DownSave').attr('onclick', 'Save_UpdateWD(\'' + WD_code + '\')');
            $('#Btn_TopSave').attr('onclick', 'Save_UpdateWD(\'' + WD_code + '\')');


            $("#UpdateWDZH").modal("show");
        }

        function ResUpdate(WD_code) {

            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "SUZ",
                    LB_Code: GetQueryString("id"),
                    WD_Code: WD_code
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {

                        var showJson = eval("[" + msg + "]");

                        if (showJson != null && showJson.length > 0) {
                            $("#TB_LB_List").empty();
                            $("#TB_WD_List").empty();
                            var lblist = showJson[0].LB_SubJectEntity;
                            var wdlist = showJson[0].WD_SubJectEntity;
                            if (lblist != null && lblist.length > 0) {

                                for (var t = 0; t < lblist.length; t++) {
                                    var lb_tr = "";
                                    lb_tr += "<tr>";
                                    lb_tr += "<td>" + lblist[t].Sort + "</td><td>" + lblist[t].SubjectContent + "</td><td><a  style=\"cursor:pointer\"  onclick=\"addWd_Tg('" + WD_code + "','" + lblist[t].SubjectCode + "')\">[添加]</a></td>";
                                    lb_tr += "</tr>";
                                    $("#TB_LB_List").append(lb_tr);
                                }

                            }


                            if (wdlist != null && wdlist.length > 0) {

                                for (var w = 0; w < wdlist.length; w++) {
                                    var wd_tr = "";
                                    wd_tr += "<tr>";
                                    wd_tr += "<td>" + wdlist[w].Sort + "</td><td>" + wdlist[w].SubjectContent + "</td><td><button class=\"btn-default-zblb\" onclick=\"UPdate_DelSMessBySD('" + WD_code + "','" + wdlist[w].SubjectCode + "');\"   style=\"margin-right:15px;\" type=\"button\" ><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button></td>";

                                    wd_tr += "</tr>";
                                    $("#TB_WD_List").append(wd_tr);
                                }

                            }
                        }


                    } else {
                        layer.alert('数据加载失败！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0,
                        })
                    }
                }
            });
        }


        /*---------删除题干------------*/
        function UPdate_DelSMessBySD(_DCode, _SCode) {
            //询问框
            layer.confirm('您是否要删除该题干？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "DelSMessBySD",
                        D_Code: _DCode,
                        S_Code: _SCode
                    },//要执行查询的数据参数
                    success: function (msg) {
                        //$("#DimensionCode").val(msg);
                        if (msg > 0) {
                            InitCT();//加载组合数据集列表
                            layer.msg('题干删除成功', { time: 3000, icon: 1 });
                            ResUpdate(_DCode);
                        } else {
                            layer.msg('删除失败', { time: 3000, icon: 1 });
                        }
                    }
                });



            }, function () {
                //layer.msg('也可以这样', {
                //    time: 2000, //20s后自动关闭
                //    btn: ['明白了', '知道了']
                //});
            });
        }

        function Save_UpdateWD(wdcode) {
            var Wd_name = $("#UW_DimensionName").val();
            var wd_code = wdcode;
            var s_total = $("#TB_WD_List tr").length;
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: {
                    Remark: "UpdateWD",
                    D_Code: wd_code,
                    W_Name: Wd_name,
                    S_Total: s_total
                },//要执行查询的数据参数
                success: function (msg) {
                    //$("#DimensionCode").val(msg);
                    if (msg > 0) {
                        InitCT();//加载组合数据集列表
                        layer.msg('维度修改成功啦', { time: 3000, icon: 1 });
                        $("#UpdateWDZH").modal("hide");
                        ResUpdate(wd_code);

                    } else {
                        layer.msg('维度修改失败', { time: 3000, icon: 1 });
                    }
                }
            });
        }


        function addWd_Tg(wdcode, tgcode) {

            //询问框
            layer.confirm('您是否要添加该题干到维度？', {
                btn: ['添加', '取消'] //按钮
            }, function () {
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationUpdate.ashx",
                    data: {
                        Remark: "addWd_Tg",
                        D_Code: wdcode,
                        S_Code: tgcode
                    },//要执行查询的数据参数
                    success: function (msg) {
                        //$("#DimensionCode").val(msg);
                        if (msg > 0) {
                            layer.closeAll();
                            ResUpdate(wdcode);
                        } else {
                            layer.msg('添加失败', { time: 3000, icon: 1 });
                        }
                    }
                });



            }, function () {
                //layer.msg('也可以这样', {
                //    time: 2000, //20s后自动关闭
                //    btn: ['明白了', '知道了']
                //});
            });
        }


        //全选
        function chebox(obj) {
            var checkbox = document.getElementById("checkboxarr").checked;//得到主要 checkbox id 的状态
            var items = document.getElementsByName("checkbox"); //得到 name=chec的控件
            for (var i = 0; i < items.length; i++) {//然后循环
                //当前checkbox 的状态 = 所有的控件状态
                items[i].checked = checkbox;
            }
            $("input[type=checkbox][name=checkbox]").each(function () {
                SelSubjectClick(this);
            });
        }

        //设置复选框的CheckboxID     获取class为    childCheck循环
        $(document).on("click", ".childCheck", function () {
            if (!$(this)[0].checked) {
                $("#checkboxarr")[0].checked = false;
            }
            else {
                //  获取class为    childCheck循环
                var arrayCheck = $(".childCheck");
                var isSuccess = true;
                for (var i = 0; i < arrayCheck.length; i++) {
                    if (arrayCheck[i].checked == false) {
                        isSuccess = false;
                        break;
                    }
                }
                $("#checkboxarr")[0].checked = isSuccess;

            }

        });

        $(document).on("click", "#Zdyu", function () {
            var codes = AmountCode;
            var textareas = $("#textarea_Guidance").val().replace(/\s/g, "").replace(/\"/g, "\"");

            if (textareas == "") {
                layer.alert('指导语不能为空！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
                return;
            };


            $.ajax({
                url: "Ajax/HeartEvaluationUpdate.ashx",
                data: { AmountCode: codes, textareas: textareas, Remark: "zdy" },
                success: function (result) {
                    if (result) {
                        layer.msg('修改成功！', { icon: 1 });
                    }
                    else {
                        layer.msg('修改失败！', { icon: 2 });
                    }
                }
            })

        })

    </script>

</asp:Content>
