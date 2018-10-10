<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="HeartEvaluationCustomAdd.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.HeartEvaluationCustomAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/TreeTables/master.css" rel="stylesheet" type="text/css" />
    <link href="../../CSS/TreeTables/jquery.treeTable.css" rel="stylesheet" type="text/css" />
    <%--    <link href="../../assets/css/chosen.css" rel="stylesheet" />--%>
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-switch.css" rel="stylesheet" />

    <script src="../../JS/jquery.form.js"></script>
    <script src="../../JS/layer.js"></script>
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
            width: 180px;
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

        #Explain_Table th:nth-child(1) {
            width: 30%;
        }

        #Explain_Table th:nth-child(2) {
            width: 10%;
        }

        #Explain_Table th:nth-child(3) {
            width: 5%;
        }

        #Explain_Table th:nth-child(4) {
            width: 15%;
        }

        #Explain_Table th:nth-child(5) {
            width: 15%;
        }

        #Explain_Table th:nth-child(6) {
            width: 20%;
        }

        #Explain_Table td {
            text-align: left;
            word-wrap: break-word;
            word-break: break-all;
        }

            #Explain_Table td:nth-child(7) {
                text-align: center;
                vertical-align: middle;
            }

        #Warning_Table th:nth-child(1) {
            width: 30%;
        }

        #Warning_Table th:nth-child(2) {
            width: 15%;
        }

        #Warning_Table th:nth-child(3) {
            width: 10%;
        }

        #Warning_Table th:nth-child(4) {
            width: 15%;
        }

        #Warning_Table th:nth-child(5) {
            width: 25%;
        }

        #Warning_Table td {
            text-align: left;
            word-wrap: break-word;
            word-break: break-all;
        }

        #Explain_Table td:nth-child(6) {
            vertical-align: middle;
            text-align: center;
        }
    </style>

    <div class="row">
        <div class="col-md-12">

            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="HeartEvaluation.aspx" style="color: #666;">量表管理</a></li>
                <li><a href="#" style="color: #000;">自编量表添加</a></li>
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
                        <p>题目编辑</p>
                        <%--   <a href="#profile" id="BJ_A" onclick="InitSel_AmountType3();" data-toggle="tab">题目编辑</a>--%>
                    </li>
                    <li class="" id="HF">
                        <p>维度划分</p>
                    </li>
                    <li class="" id="SZ">
                        <p>评分设置</p>
                        <%-- <a href="#messages" id="SZ_A" data-toggle="tab">评分设置</a>--%>
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
                                            <input class="form-control" id="GaugeName" style="width: 100%" maxlength="40" name="GaugeName" />
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

                                        <div class="lb-panel-right pull-right  form-group" style="margin-right: 0px;">
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

                                <div class="col-md-6 col-sm-12 col-xs-12" style="display: none;">
                                    <div class="panel text-center bg-color-blue">
                                        <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                            报告图表：
                                        </div>

                                        <div class="lb-panel-right pull-right  form-group" style="margin-right: 0px;">

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
                            <div class="row" style="text-align: center; margin-top: 20px;">
                                <button type="submit" id="butt" style="background-color: orange; color: white" class="btn btn-sm" onclick="disableds()">保存</button>
                            </div>

                        </form>

                    </div>

                    <div class="tab-pane fade" id="profile">
                        <div class="col-md-12 col-sm-12" style="padding-top: 15px;">
                            <div class="row" id="ListQuestionPanel">

                                <div class="row" style="text-align: center;">
                                    <h4 id="AmountNameHtm">@@@@@@@@@@@@@@</h4>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <textarea class="form-control" id="textarea_Guidance" rows="3" placeholder="请填写指导语"></textarea>
                                    </div>
                                </div>


                            </div>
                            <div class="row" id="save_OK" style="text-align: center; margin-top: 20px;">
                                <a href="javascript:;" class="btn btn-sm" style="background-color: orange; color: white" onclick="return SaveSubjectSumit();">保存</a>
                            </div>
                        </div>

                    </div>

                    <div class="tab-pane fade" id="divide">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12" style="margin-top: 15px; text-align: right;">
                                <button class="btn btn-sm" id="sel_SWD" style="background-color: orange; color: white" onclick="ShowSelectSubject();">新增组合</button>
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
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 90px;">
                                                <span style="color: red">*</span> 维度名称：
                                            </div>

                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <%--    <select class="chosen-select" style="width: 100%;" onchange="InitNorm('');" id="Sel_Dimension">
                                            </select>--%>
                                            <select class="selectpicker form-control" onchange="InitNorm('');" data-done-button="true" data-live-search="true" data-placeholder="选择维度名称" style="width: 100%;" id="Sel_Dimension">
                                            </select>

                                        </div>

                                        <div class="col-md-2 col-sm-12 col-xs-4" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 90px;">
                                                计分方式：
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-sm-12 col-xs-8" style="margin-bottom: 15px;">
                                            <div class="make-switch" data-on="info" id="wlan_enable_div" data-off="success">
                                                <input type="checkbox" onclick="CK_Set(this)" onchange="CK_Set(this)" id="CK_F_Type" checked="checked" />
                                            </div>

                                        </div>

                                        <div class="col-md-2 col-sm-12 col-xs-12" id="JF_Title" style="margin-bottom: 15px; display: none;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 90px;">
                                                计分公式：
                                            </div>
                                        </div>
                                        <div class="col-md-10 col-sm-12 col-xs-12" id="JF_Content" style="margin-bottom: 15px; display: none;">
                                            <style>
                                                #gongshi {
                                                    color: red;
                                                    font-size: 10px;
                                                }
                                            </style>
                                            <textarea class="form-control" id="textarea_formula" onblur="gsblur()" rows="3" placeholder="计分公式(仅限输入英文单词Score、数字及运算符号（）+-*/。)"></textarea>
                                            <span id="gongshi" style="display: none">仅限输入英文单词Score数字及运算符号（）+-*/</span>
                                        </div>


                                        <div class="col-md-2 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: RGB(245,248,253); color: RGB(64,149,210); width: 90px;">
                                                &nbsp;&nbsp;选择常模：
                                            </div>
                                        </div>
                                        <div class="col-md-9 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <%-- <select class="chosen-select" onchange="InitNW();" style="width: 100%;" id="Sel_Norm">
                                            </select>--%>

                                            <select class="selectpicker form-control" onchange="InitNW();" data-done-button="true" data-live-search="true" data-placeholder="请选择常模" style="width: 170px;" id="Sel_Norm">
                                            </select>

                                        </div>
                                        <div class="col-md-1 col-sm-12 col-xs-12" style="margin-bottom: 15px;">
                                            <button class="btn btn-default-zblb" onclick="AddModel();" type="button" style="float: right; background-color: RGB(245,248,253);">常模<i class="fa fa-plus" style="color: green;" aria-hidden="true"></i></button>
                                        </div>



                                        <div class="col-md-12 col-sm-12 col-xs-12" id="Model_Message" style="margin-bottom: 15px; padding-left: 0px; padding-right: 0px; display: none;">

                                            <div class="groupbox" style="margin-top: 10px;">
                                                <%--<span class="grouptitle">
                                                    <input type="text" id="T_Norm_Title" name="ApplyPeoples" placeholder="请填写常模名称" class="form-control" /><i class="fa fa-times" style="color: red;" aria-hidden="true"></i></span>--%>
                                                <span class="grouptitle">
                                                    <div class="form-group input-group">
                                                        <input type="text" id="T_Norm_Title" maxlength="20" name="ApplyPeoples" placeholder="请填写常模名称" class="form-control" />
                                                        <span class="input-group-btn">
                                                            <button class="btn btn-default" onclick="DelCM();" style="height: 30px;" type="button">
                                                                <i class="fa fa-times" style="color: RGB(85,164,221);" aria-hidden="true"></i>
                                                            </button>
                                                        </span>
                                                    </div>
                                                </span>


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
                                                                            <th class="text-center">名称</th>
                                                                            <th class="text-center">年龄</th>
                                                                            <th class="text-center">性别</th>
                                                                            <th class="text-center">分值范围</th>
                                                                            <th class="text-center">分值说明</th>
                                                                            <th class="text-center">辅导建议</th>
                                                                            <th class="text-center">操作</th>
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
                                                                            <th class="text-center">名称</th>
                                                                            <th class="text-center">级别</th>
                                                                            <th class="text-center">性别</th>
                                                                            <th class="text-center">年龄</th>
                                                                            <th class="text-center">分值范围</th>
                                                                            <th class="text-center">操作</th>
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
                                                <span class="groupfoot" id="Btn_CM_Save" style="margin-top: -5px;">

                                                    <button style="background-color: #62c462; color: white" class="btn  btn-sm" onclick="SaveScore();">保存常模</button></span>
                                                <%-- <input type="text" id="T_Norm_foot" name="ApplyPeoples" placeholder="请填写常模名称" class="form-control" /></span>--%>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="text-align: center;" id="Btn_SaveDM">
                                    <a href="#" class="btn btn-sm" style="background-color: orange; color: white" onclick="SaveDimensionMessage();">保存</a>
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
                                    <span style="color: red; margin-right: 5px;">*</span>维度名称：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <input class="form-control" maxlength="40" onmouseout="gettexts()" id="DimensionName" onkeyup="GetWD_Code();" style="width: 100%" name="GaugeName" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12 col-xs-12" hidden="hidden">
                            <div class="panel text-center bg-color-blue">
                                <div class="lb-panel-left pull-left blue" style="font-weight: bold; background-color: #FFF; color: RGB(64,149,210)">
                                    维度编码：
                                </div>

                                <div class="lb-panel-right pull-right form-group" style="margin-right: 0px;">
                                    <input class="form-control" id="DimensionCode" style="width: 100%" name="DimensionCode" />
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12 col-xs-12" hidden="hidden">
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
                                    <input class="form-control" id="SubjectSum" style="width: 100%" name="SubjectSum" />
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
                                            <input type="checkbox" id="wd_aLL" onclick="SelectAll(this);" value="0" /></th>
                                        <th class="text-center" style="width: 20%">题号</th>
                                        <th class="text-center" style="width: 70%">题目</th>
                                    </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <%-- <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>--%>
                    <button onclick="Save_WDDivide();" type="button" class="btn btn-sm" style="background-color: orange; color: white">
                        保存
                    </button>
                    <button type="button" class="btn btn-sm" data-dismiss="modal" style="color: white">取消</button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
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
                                    <select style="width: 100%; height: 28px;" id="Sel_M_Sex">
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
                                                <option value="=">＝</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-2" style="line-height: 30px;">SCORE</div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <select style="width: 100%; height: 30px;" id="Norm_Second_Symbol">
                                                <option value="<=">≤</option>
                                                <option value="<">＜</option>
                                                <option value="=">＝</option>
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

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <p style="color: red; font-size: 10px;">注：分值范围和年龄范围的最大值如果为空的话则是正无穷，最小值为空的话则为负无穷</p>
                        </div>

                    </div>

                </div>
                <div class="modal-footer">
                    <%-- <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>--%>
                    <button onclick="SaveExplain();" type="button" class="btn btn-warning">
                        保存
                    </button>
                    <button type="button" class="btn btn-default"
                        data-dismiss="modal" onclick="Quxiao()">
                        取消
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
                                    <select style="width: 100%; height: 28px;" id="Sel_M_Sex_W">
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
                                                <option value="=">＝</option>
                                            </select>
                                        </div>
                                        <div class="col-md-2 col-sm-2 col-xs-2">SCORE</div>
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <select style="width: 100%; height: 30px;" id="Second_Symbol">
                                                <option value="<=">≤</option>
                                                <option value="<">＜</option>
                                                <option value="=">＝</option>
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
                    <button type="button" class="btn btn-default" onclick="quxuais()"
                        data-dismiss="modal">
                        取消
                    </button>
                    <button onclick="SaveWarning();" type="button" class="btn btn-warning">
                        保存
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>




    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-switch.min.js" charset="gb2312"></script>



    <script>
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

        function gsblur() {
            var text = $("#textarea_formula").val();
            // var reg = "^(Score|\d|[\(\)\+\-*\/.])$";
            var reg = /^(Score|\d|[\(\)%\+\-*\/.\^])+$/;
            //var re=RegExp(reg);
            if (reg.test(text) == false) {
                $("#gongshi").css('display', 'block');//隐藏

            }
            else {
                $("#gongshi").css('display', 'none');//显示

            }

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

            //AddModel
            var Dcode = $("#Sel_Dimension").val();

            if (Dcode == "0" || Dcode == null || Dcode == undefined) {
                layer.alert('请选择要添加的维度!', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0,
                })
                return;
            } else {
                var ExplainTable = $("#Explain_Table");
                $("#Explain_Table  tbody").empty("");
                var ExplainTable = $("#Warning_Table");
                $("#Warning_Table  tbody").empty("");
                $("#Model_Message").css('display', 'block');
            }



        }

        function Add_JS() {
            $('#Model_Pnale').modal('show');
        }

        function Add_W() {
            quxuais();
            $('#Model_Warning').modal('show');
        }
    </script>


    <script>
        var navName = '/FunctionModular/Heartevaluation/Heartevaluation.aspx';
        //var AmountCode = "LB_14803276793060";//操作的量表编码
        var AmountCode = "LB_14803157352730";//操作的量表编码
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

        DrawQuestion(1);//初始化题架结构
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
                    message: '请将必填项填写完整',
                    verbose: false,
                    validators: {
                        notEmpty: {
                            message: '请将必填项填写完整'
                        },
                        stringLength: {
                            min: 2,
                            max: 40,
                            message: '量表名长度必须介于2到40之间'
                        },
                        threshold: 3,
                    }
                },
            },
            AmountType: {
                message: '量表分类不能为空',
                verbose: false,
                validators: {
                    notEmpty: {
                        message: '量表分类不能为空'
                    },
                    callback: {
                        message: '量表分类不能为空',
                        callback: function (value, validator) {

                            return value != "量表分类不能为空";
                        }
                    }
                }
            },
        }).on('success.form.bv', function (e) {
            e.preventDefault();
            var Amount_Name = $("#GaugeName").val();


            if ($("#Sel_AmountType").val() == "0") {
                layer.alert('量表类型不能为空!', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0
                })
                return;
            }

            CheckAmountName(Amount_Name);


        });

        /*----量表名称验证-----*/
        function CheckAmountName(A_Name) {



            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "CheckAmountName",
                    Amount_Code: A_Name,

                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        var Source = eval(msg)[1];
                        var code = eval(msg)[0];
                        if (Source == 1) {
                            layer.confirm('该量表名称与系统量表名称重复，请修改', {
                                btn: ['是', '否'] //按钮
                            }, function () {
                                window.location.href = "HeartEvaluationUpdate.aspx";

                                UpdateEvaluation(msg);
                            })

                        }
                        if (Source == 3) {
                            layer.confirm('是否跳转修改界面进行修改？', {
                                btn: ['是', '否'] //按钮
                                //})
                            }
                        , function () {
                            window.location.href = "HeartEvaluationUpdate.aspx";

                            UpdateEvaluation(msg);

                        });
                        }

                    } else {

                        var Amount_Name = $("#GaugeName").val();
                        var Amount_DisplayName = "";
                        if ($("#DisplayName").val() == null || $("#DisplayName").val() == "") {
                            Amount_DisplayName = Amount_Name;
                        } else {
                            Amount_DisplayName = $("#DisplayName").val();
                        }
                        var Amount_TypeID = $("#Sel_AmountType").val();
                        var StartPeoples = "0";// $("#Sel_Start_Age").val();
                        var EndPeoples = "0"; //$("#Sel_End_Age").val();
                        var Amount_ApplyPeoples = $("#ApplyPeoples").val();//获取的是年龄范围
                        var Amount_Marks = $("#Marks").val();
                        var Amount_Guidance = "";
                        AmountName = Amount_Name;

                        if (AmountCode != "LB_14803157352730") {
                            layer.confirm('您是否要修改当前量表介绍？', {
                                btn: ['确定', '取消'] //按钮
                            }, function () {
                                window.location.href = "HeartEvaluationUpdate.aspx?spam=" + generateMixed(18) + "&id=" + AmountCode;
                                //$.ajax({
                                //    type: "POST",
                                //    url: "Ajax/HeartEvaluationUpdate.ashx",
                                //    data: {
                                //        Remark: "CustomUpdate",
                                //        T_Name: Amount_Name,
                                //        T_DisplayName: Amount_DisplayName,
                                //        T_TypeID: Amount_TypeID,
                                //        T_ApplyPeoples: Amount_ApplyPeoples,
                                //        T_Marks: Amount_Marks,
                                //        T_Guidance: Amount_Guidance,
                                //        T_StartPeoples: StartPeoples,
                                //        T_EndPeoples: EndPeoples,
                                //        Acode: AmountCode
                                //    },//要执行查询的数据参数
                                //    success: function (msg) {
                                //        if (msg != "") {
                                //            AmountCode = msg;
                                //            $("#AmountNameHtm").html(AmountName);
                                //            layer.alert('量表描述修改成功!', {
                                //                skin: 'layui-layer-lan',
                                //                closeBtn: 0
                                //            });
                                //        } else {
                                //            layer.alert('量表描述修改失败!', {
                                //                skin: 'layui-layer-lan',
                                //                closeBtn: 0
                                //            })
                                //        }
                                //    }
                                //});
                            });
                        } else {
                            $.ajax({
                                type: "POST",
                                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                                data: {
                                    Remark: "CustomAdd",
                                    T_Name: Amount_Name,
                                    T_DisplayName: Amount_DisplayName,
                                    T_TypeID: Amount_TypeID,
                                    T_ApplyPeoples: Amount_ApplyPeoples,
                                    T_Marks: Amount_Marks,
                                    T_Guidance: Amount_Guidance,
                                    T_StartPeoples: StartPeoples,
                                    T_EndPeoples: EndPeoples
                                },//要执行查询的数据参数
                                success: function (msg) {
                                    if (msg != "") {
                                        AmountCode = msg;

                                        $("#AmountNameHtm").html(AmountName);
                                        layer.msg("量表描述保存成功!", { icon: 6, time: 2000 })
                                        $("#BJ").html("<a href=\"#profile\" id=\"BJ_A\" onclick=\"InitSel_AmountType3();\" data-toggle=\"tab\">题目编辑</a>");
                                        //$('#BJ').trigger("click");
                                        $('#BJ_A').trigger("click");
                                    } else {
                                        layer.msg('量表描述保存失败!', { icon: 5, time: 2000 });
                                    }
                                }
                            });
                        }
                    }

                }
            });
        }


        /*---------------修改量表-----------*/
        function UpdateEvaluation(A_Code) {
            window.location.href = "HeartEvaluationUpdate.aspx?spam=" + generateMixed(18) + "&id=" + A_Code;
        }

        /*-------------------产生随机数-------------------*/
        var chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];

        function generateMixed(n) {
            var res = "";
            for (var i = 0; i < n ; i++) {
                var id = Math.ceil(Math.random() * 35);
                res += "_" + chars[id];
            }
            return res;
        }
        //alert(generateMixed(14));



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
                    //$("#" + Exhibition).chosen();
                    //$("#" + Exhibition).trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                }
            });
        }


        /*-----------------绘制题干框架结构--------------*/
        function DrawQuestion(FewQuestion) {
            /*
            P_Title 题干标题
            */
            var P_Title = "<div class=\"panel-heading\">"
            + "<h4 class=\"panel-title row\">"
            + "<div class='col-md-9 col-sm-12 col-xs-12' style='padding-right:0px;padding-bottom:10px;margin-top:10px;'>"
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\" style='word-break:break-all;'>第[<input class=\"\" name=\"\" id=\"TH_" + FewQuestion + "\" value=\"" + FewQuestion + "\" style=\"height: 20px; width:40px;\" placeholder=\"题号\" disabled=\"disabled\" />]题</a>"
            + "</div>"
            + "<div class='col-md-3 col-sm-12 col-xs-12' style='padding-left:0px;margin-top:10px;'>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return addQuestion();\">[添加新题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" style=\"color:#999\" disabled=\"disabled\">[复制本题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return Del_Operation('" + FewQuestion + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return Btn_Operation('" + FewQuestion + "');\">[确定]</a></label>"
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
            + "<a data-toggle=\"collapse\" data-parent=\"#accordion\" id=\"Question_" + FewQuestion + "\" href=\"#Content_" + FewQuestion + "\" aria-expanded=\"true\" aria-controls=\"collapseOne\" class=\"collapsed\">第[<input class=\"\" name=\"\" id=\"TH_" + FewQuestion + "\" value=\"" + FewQuestion + "\" style=\"height: 20px; width:40px;\" placeholder=\"题号\" />]题</a>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_addoperation_" + FewQuestion + "\" onclick=\"return addQuestion();\">[添加新题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_copyoperation_" + FewQuestion + "\" style=\"color:#999\" disabled=\"disabled\">[复制本题]</a></label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_deloperation_" + FewQuestion + "\" onclick=\"return Del_Operation('" + FewQuestion + "');\">[删除本题]</a></label>"
            //+ "<label style=\"float: right;\">[下移]</label>"
            //+ "<label style=\"float: right;\">[上移]</label>"
            + "<label style=\"float: right;\"><a href=\"javascript:;\" id=\"Btn_operation_" + FewQuestion + "\" value='" + FewQuestion + "' name=\"Btn_operation\"  onclick=\"return Btn_Operation('" + FewQuestion + "');\">[确定]</a></label>"
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

            var QP_Arr = $('div[name=QuestionPanel]');
            var questionCountK = QP_Arr.length;
            var index = parseInt(questionCountK) + 1;
            //alert("实际编码===》" + index);
            var T_Sort = "";
            for (var p = 0; p < questionCountK; p++) {
                if (T_Sort != "") {
                    T_Sort += "," + QP_Arr[p].id.split('_')[1];
                } else {
                    T_Sort += QP_Arr[p].id.split('_')[1];
                }

            }
            var QuestionCode = GetTT_S(index, T_Sort);

            CopyDrawQuestion(QuestionCode);//动态创建题目









            if (subjectListJson != "") {
                var TGCode = AmountCode + "_TG_" + QCode;
                if (subjectListJson.indexOf(TGCode) >= 0) {
                    var JsonList = eval("[" + subjectListJson + "]");

                    for (var i = 0; i < JsonList.length; i++) {
                        if (TGCode == JsonList[i].TG_Info.TG_Code) {
                            for (var k = 0; k < JsonList[i].TZ_List.length; k++) {
                                var O_code = JsonList[i].TZ_List[k].TZ_Code;
                                var O_con = JsonList[i].TZ_List[k].TZ_Con;
                                var O_Fra = JsonList[i].TZ_List[k].TZ_Val;
                                var O_Num = JsonList[i].TZ_List[k].TZ_Num;
                                var ProblemContent = "";
                                ProblemContent = GetProblemContent(QuestionCode, QuestionCode);//获取题支内容

                                $("#Body_" + QuestionCode).append(ProblemContent);
                                $("#Code_" + QuestionCode + "_" + k).val(O_Num);
                                $("#Con_" + QuestionCode + "_" + k).val(O_con);
                                $("#Fra_" + QuestionCode + "_" + k).val(O_Fra);

                            }
                            break;
                        }
                    }
                }
            }
            return false;
        }









        /*---------绘画题支内容------------------*/
        function GetProblemContent(T_Faw, T_Faw_Con) {
            var TZ_Con = $("input[name='Code_" + T_Faw + "']").length;
            var ProblemContent = ""
            + "<div class=\"row\" style=\"padding-top: 5px;\" id=\"row_" + T_Faw + "_" + TZ_Con + "\">"
            + "    <div class=\"col-md-1 col-xs-12 col-sm-1\" style=\"margin-bottom: 15px;\">"
            + "        <input class=\"form-control\" name=\"Code_" + T_Faw + "\" id=\"Code_" + T_Faw + "_" + TZ_Con + "\" style=\"height: 34px;\" placeholder=\"编号\" />"
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
            + "            <button class=\"btn btn-default-zblb\" type=\"button\" onclick=\"return addopt('" + T_Faw + "_" + TZ_Con + "');\"  style=\"float: right\">"
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
                        $("#QuestionPanel_" + T_Faw).attr("id", "Error_" + T_Faw);
                        //alert('000000000000000');

                        //$('input[name=Code_' + T_Faw + ']').attr("name", "Error");
                        //$('input[name=Con_' + T_Faw + ']').attr("name", "Error");
                        //$('input[name=Fra_' + T_Faw + ']').attr("name", "Error");
                        //$("#Btn_operation_" + T_Faw).html("Error");
                    }
                    //$("#row_" + objID).hide();





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
                layer.msg('是否删除当前题目？', {
                    time: 2000, //20s后自动关闭
                    btn: ['是']
                });
            }





        }




        ///*----------题干临时存储信息[确定]--------------*/
        function SaveQuestion(T_Faw) {
            var result = 0;
            var results = 0;
            var ProTitle = $("#Prot_" + T_Faw).val();//获取题干标题
            //TH_
            var ProSort = $("#TH_" + T_Faw).val();//获取题干标题//Code_1


            if (ProSort == "" || ProSort.length == 0) {
                layer.msg('题号不能为空！', {
                    time: 2000, //20s后自动关闭
                    btn: ['知道了']
                });
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
                        layer.alert('第' + T_Faw + '题的选项分值不能为空!', {
                            skin: 'layui-layer-lan',
                            closeBtn: 0,
                            yes: function () {
                                // alert($(this));
                                //$(this).focus();
                                console.info($(this))
                                console.info(layer.closeAll());

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
                $("#Question_" + T_Faw).text("第" + ProSort + "题   ==>" + ProTitle);
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
            $("#Question_" + T_Faw).empty();
            $("#Question_" + T_Faw).html("第[<input class=\"\" name=\"\" id=\"TH_" + T_Faw + "\" value=\"" + T_Faw + "\" style=\"height: 20px; width:40px;\" placeholder=\"题号\" />]题");
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
                            $("#TH_" + T_Faw).val(JsonList[k].TG_Info.TG_Sort);
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
        function addopt(objID) {
            var arr = objID.split('_');
            /*
                arr[0]  代表的是第几题
                arr[1]  代表的是第几题中的第几个选项
            */
            var nowF = parseInt(arr[1]);
            var ProblemContent = "";
            ProblemContent = GetProblemContent(arr[0], nowF);//获取题支内容
            $("#Body_" + arr[0]).append(ProblemContent);
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
                layer.msg('请至少保留一道题，本题不可被删除？', {
                    time: 2000, //20s后自动关闭
                    btn: ['确定']
                });
            }
            return false;
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




        /*动态添加题目*/
        function addQuestion() {
            //var questionCount = $('div[name=QuestionPanel]').length;


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

            DrawQuestion(index);//动态创建题目

            var quc = parseInt(questionCount) + 1;

            GetSubjectAllJson += quc + ",";

            return false;
        }

        /*题目编辑保存按钮事件*/
        function SaveSubjectSumit() {


            //GetSubjectAllJson = "1" + "," + GetSubjectAllJson;
            //var str = GetSubjectAllJson.substring(0, GetSubjectAllJson.length - 1).split(',');



            $("#save_OK").hide();


            var btnOK = $("a[name=Btn_operation]");


            ////$.each(btnOK, function (i, n) {

            ////    alert(n);
            ////});

            //// alert(btnOK);

            //return;
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
                $("#save_OK").show();
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
                layer.msg('请先把没有确定好的题干信息确定好再保存吧！', {
                    time: 2000, //20s后自动关闭
                    btn: ['知道了']
                });
                $("#save_OK").show();
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
                        //alert(msg);
                        if (msg == 1) {
                            layer.msg("题目编辑保存成功", { icon: 6, time: 2000 })


                            $("#HF").html("<a href=\"#divide\" id=\"HF_A\" onclick=\"InitCT();\" data-toggle=\"tab\">维度划分</a>");
                            $('#HF_A').trigger("click");
                        } else {
                            $("#save_OK").show();
                            layer.msg("题目编辑保存失败！", { icon: 5, time: 2000 })
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


        var SubjectListAdd;
        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var WDALL;
        /*-----加载页面量表对应的题干------*/
        function OnloadSubjectList() {

            /*列表展现部分 */

            /*
                   创建时间：2016-10-31
                   功能介绍：加载量表题目列表集合
           */

            WDALL = $("#wd_aLL");
            if (SubjectListAdd != undefined) {
                $("#SubjectList").DataTable().draw();
                WDALL.prop("checked", false);

                return;
            }

            SubjectListAdd = $('#SubjectList').dataTable({
                serverSide: true,//分页，取数据等等的都放到服务端去
                height: $(window).height() - 200,
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

                        if (d.start == 0) {
                            Endindex = d.length;
                            if (Endindex == 10) {
                                Starindex = 0;
                            }
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
                    $('td:eq(0)', row).html(" <input type=\"checkbox\" class='childCheck' name=\"SelTG\" onclick=\"SelSubjectClick(this);\" value=\"" + data[0] + "\" />");
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

            $(".childCheck").prop("checked", false);
            $("#sel_SWD").prop("checked", false);
            if (SubjectListAdd != undefined) {
                $("#SubjectList").DataTable().draw();
                $("#wd_aLL").prop("checked", false);

                $(".childCheck").prop("checked", false);
            } else {

            }
            SelNum = 0;
            $("#SubjectSum").val("0");
            $("#DimensionSort").val("0");
            $("#DimensionCode").val("");
            $("#DimensionName").val("");
            $('#SelectSubject').modal('show');
            $(".childCheck").prop("checked", false);
            OnloadSubjectList();
        }

        var SubjecCodeStr = "";
        var SelNum = 0;

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

            if (_WD_Name.replace(/\s/g, "") == "") {
                layer.alert('请输入维度名称！', {
                    skin: 'layui-layer-lan',
                    closeBtn: 0

                });
                $("#DimensionName").focus();
                return;
            }
            $.ajax({
                url: "Ajax/HeartEvaluationAdd.ashx",
                data: {
                    Remark: "repeat",
                    AmountCode: AmountCode,
                    DimensionName: _WD_Name
                },
                success: function (result) {

                    if (result == "True") {
                        /*----------保存操作事件---------*/
                        $.ajax({
                            type: "POST",
                            url: "Ajax/HeartEvaluationCustomAdd.ashx",
                            async: false,
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
                                    layer.msg('维度划分成功！', { icon: 6, time: 2000 });

                                    if (SubjectListAdd != undefined) {
                                        $("#SubjectList").DataTable().draw();
                                    }

                                    SubjecCodeStr = "";
                                    $("#wd_aLL").prop("checked", false);
                                    $("input[type=checkbox][name=SelTG]").prop("checked", false);
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
                                    $("#SZ").html("<a href=\"#messages\" id=\"SZ_A\" data-toggle=\"tab\">评分设置</a>");
                                    //$('#SZ_A').trigger("click");
                                } else {
                                    layer.msg('维度划分失败！', { icon: 5, time: 2000 });
                                }
                            }
                        });
                    }
                    else {
                        layer.msg('维度名称已存在！', { icon: 5, time: 2000 });
                    }
                }
            })

        }

        InitCT();//加载组合数据集列表
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
                                $("#SubjectTree  tbody").empty("");
                                var DimensionList = JsonEnty[0].D_EntityList;
                                var SubjectList = JsonEnty[0].TG_EntityList;


                                for (var i = 0; i < DimensionList.length; i++) {
                                    var tableHtmltd = "<td>" + DimensionList[i].DimensionName + "</td><td><button class=\"btn-default-zblb\"  onclick=\"UpdateWDAscription('" + DimensionList[i].DimensionCode + "');\" style=\"margin-right:15px;\" type=\"button\"  ><i class=\"fa fa-wrench\" aria-hidden=\"true\"></i></button><button class=\"btn-default-zblb\" type=\"button\"  onclick=\"DelDimension('" + DimensionList[i].DimensionCode + "');\" ><i class=\"fa fa-times\" aria-hidden=\"true\"></i></button></td>";
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
                                DrawOption();//绘制树形展示列表点击事件

                                //  $treeTable.refreshPoint(id);



                            }
                        }
                    }
                });
            }
        }

        /*---------------修改维度划分--------------*/
        function UpdateWDAscription(WDcode) {


            layer.msg('该功能暂时没有开放!!', {
                time: 2000, //20s后自动关闭
                btn: ['确定']
            });
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
                            InitAD();
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
                            InitAD();
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


            if (NCode != null && NCode != "0" && NCode != undefined) {




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

                            layer.msg("常模解释添加成功 ！", { icon: 6, time: 2000 })
                            $('#Model_Pnale').modal('hide');

                            InitNW();

                        } else {
                            layer.msg("常模解释添加失败 ！", { icon: 5, time: 2000 })

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
            $("#Sel_M_Sex").trigger("chosen:updated");
            $("#Start_Fraction").val("0");
            $("#End_Fraction").val("0");
            $("#Fraction_Explain").val("");
            $("#Coach_Text").val("");


            //$("#Sel_M_Sex_W option[value='0']").attr("selected", "selected");
            //$("#Sel_M_Sex_W").trigger("chosen:updated");
        }



        /*-----绘画解释说明列表-----*/
        function Draw_Explain_Table() {

            if (ExplainJson != "") {
                var ExplainTable = $("#Explain_Table");
                $("#Explain_Table  tbody").empty("");
                var ExplainJsonList = eval("[" + ExplainJson + "]");

                if (ExplainJsonList != null && ExplainJsonList.length > 0) {
                    for (var k = 0; k < ExplainJsonList.length; k++) {

                        var MaxAge = ExplainJsonList[k]["NormEndAge"] == "999" ? "无限制" : ExplainJsonList[k]["NormEndAge"];
                        var MaxFraction = ExplainJsonList[k]["EndFraction"] == "99999" ? "正无穷" : ExplainJsonList[k]["EndFraction"];


                        var MinAge = ExplainJsonList[k]["NormStartAge"] == "-999" ? "0" : ExplainJsonList[k]["NormStartAge"];
                        var MinFraction = ExplainJsonList[k]["StartFraction"] == "-99999" ? "负无穷" : ExplainJsonList[k]["StartFraction"];

                        var MSex = ExplainJsonList[k]["NormSex"];
                        var Tsex = "";
                        if (MSex == 0) {
                            Tsex = "全部";
                        } else if (MSex == 1) {
                            Tsex = "男";
                        } else {
                            Tsex = "女";
                        }
                        //修改人：田闯
                        //修改日期：2017/3/2  17：51
                        //判断计算符号是否为小于号，是则替换为&lt;
                        //在 HTML 中不能使用小于号（<）和大于号（>），这是因为浏览器会误认为它们是标签
                        var F_SY = ExplainJsonList[k]["First_Symbol"] == "<" ? "&lt;" : ExplainJsonList[k]["First_Symbol"];
                        var S_SY = ExplainJsonList[k]["Second_Symbol"] == "<" ? "&lt;" : ExplainJsonList[k]["Second_Symbol"];

                        var delBtn = "<i class=\"fa fa-times\" style=\"color: red;cursor:pointer;\"  onclick=\"Del_Draw_Explain('" + ExplainJsonList[k]["ExplainCode"] + "')\" aria-hidden=\"true\"></i>";
                        var tableHtmltd = "<td>" + ExplainJsonList[k]["ExplainName"] + "</td><td>" + MinAge + "-" + MaxAge + "</td><td>" + Tsex + "</td><td>" + MinFraction + F_SY + "SCORE" + S_SY + MaxFraction + "</td><td>" + ExplainJsonList[k]["NormExplain"] + "</td><td>" + ExplainJsonList[k]["NormProposal"] + "</td><td style=\"float:center;\">" + delBtn + "</td>";
                        var ss = "<td>" + MinFraction + F_SY + "SCORE" + S_SY + MaxFraction + "</td><td>" + ExplainJsonList[k]["NormExplain"] + "</td>"
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
                                ExplainJson += "{\"NormCode\":\"123\",\"ExplainCode\":\"" + ec_code + "\",\"ExplainName\":\"" + ExplainJsonList[k].ExplainName + "\",\"NormStartAge\":\"" + ExplainJsonList[k].NormStartAge + "\",\"NormEndAge\":\"" + ExplainJsonList[k].NormEndAge + "\",\"NormSex\":\"" + ExplainJsonList[k].NormSex + "\",\"StartFraction\":\"" + ExplainJsonList[k].StartFraction + "\",\"EndFraction\":\"" + ExplainJsonList[k].EndFraction + "\",\"NormExplain\":\"" + ExplainJsonList[k].NormExplain + "\",\"NormProposal\":\"" + ExplainJsonList[k].NormProposal + "\",\"First_Symbol\":\"" + ExplainJsonList[k].NormProposal + ExplainJsonList[k].First_Symbol + "\",\"Second_Symbol\":\"" + ExplainJsonList[k].NormProposal + ExplainJsonList[k].Second_Symbol + "\"}";
                            } else {
                                ExplainJson += ",{\"NormCode\":\"123\",\"ExplainCode\":\"" + ec_code + "\",\"ExplainName\":\"" + ExplainJsonList[k].ExplainName + "\",\"NormStartAge\":\"" + ExplainJsonList[k].NormStartAge + "\",\"NormEndAge\":\"" + ExplainJsonList[k].NormEndAge + "\",\"NormSex\":\"" + ExplainJsonList[k].NormSex + "\",\"StartFraction\":\"" + ExplainJsonList[k].StartFraction + "\",\"EndFraction\":\"" + ExplainJsonList[k].EndFraction + "\",\"NormExplain\":\"" + ExplainJsonList[k].NormExplain + "\",\"NormProposal\":\"" + ExplainJsonList[k].NormProposal + "\",\"First_Symbol\":\"" + ExplainJsonList[k].NormProposal + ExplainJsonList[k].First_Symbol + "\",\"Second_Symbol\":\"" + ExplainJsonList[k].NormProposal + ExplainJsonList[k].Second_Symbol + "\"}";
                            }
                        }
                    }
                }
                Draw_Explain_Table();//重新绘制解释列表
            });

        }






        /*---------初始化性别下拉类表样式---------*/
        //initSex();
        //function initSex() {
        //    $("#Sel_M_Sex").chosen();
        //    $("#Sel_M_Sex").trigger("chosen:updated");
        //}




        var WarningJson = "";
        /*-------预警设置保存操作-------*/
        function SaveWarning() {

            var NCode = $("#Sel_Norm").val();//常模编码

            var _Warning_Title = $("#Warning_Title").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Start_Warning_Fun = $("#Start_Warning_Fun").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _End_Warning_Fun = $("#End_Warning_Fun").val().replace(/\s/g, "").replace(/\"/g, "\"");

            if (_Start_Warning_Fun == "") {
                _Start_Warning_Fun = -99999;
            }

            if (_End_Warning_Fun == "") {
                _End_Warning_Fun = 99999;
            }
            var _StartAge_W = $("#StartAge_W").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _EndAge_W = $("#EndAge_W").val().replace(/\s/g, "").replace(/\"/g, "\"");



            if (_StartAge_W.length == 0) {
                _StartAge_W = "0";
            }

            if (_EndAge_W.length == 0) {
                _EndAge_W = "999";

            }



            var _Warning_Level = $("#Warning_Level").val().replace(/\s/g, "").replace(/\"/g, "\"");
            var _Sel_M_Sex_W = $("#Sel_M_Sex_W").val();
            var _First_Symbol = $("#First_Symbol").val();
            var _Second_Symbol = $("#Second_Symbol").val();



            if (NCode != null && NCode != "0" && NCode != undefined) {

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
                            layer.msg("常模预警添加成功 ！", { icon: 6, time: 2000 })

                            $('#Model_Warning').modal('hide');
                            InitNW();

                        } else {
                            layer.msg("常模预警添加失败 ！", { icon: 6, time: 2000 })

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

                //if (_StartAge_W.length == 0) {
                //    _StartAge_W = "0";
                //}

                //if (_EndAge_W.length == 0) {
                //    _EndAge_W = "999";

                //}

                if (WarningJson == "") {
                    WarningJson += "{\"NormCode\":\"" + NCode + "\",\"NormWarningCode\":\"NC_0\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\",\"StartAge_W\":\"" + _StartAge_W + "\",\"EndAge_W\":\"" + _EndAge_W + "\",\"Warning_Level\":\"" + _Warning_Level + "\",\"Sel_M_Sex_W\":\"" + _Sel_M_Sex_W + "\",\"First_Symbol\":\"" + _First_Symbol + "\",\"Second_Symbol\":\"" + _Second_Symbol + "\"}";
                } else {
                    var nwlist = eval("[" + WarningJson + "]");
                    var n_L = nwlist.length;
                    WarningJson += ",{\"NormCode\":\"" + NCode + "\",\"NormWarningCode\":\"NC_" + n_L + "\",\"NormWarningLevel\":\"" + _Warning_Title + "\",\"StartFraction\":\"" + _Start_Warning_Fun + "\",\"EndFraction\":\"" + _End_Warning_Fun + "\",\"StartAge_W\":\"" + _StartAge_W + "\",\"EndAge_W\":\"" + _EndAge_W + "\",\"Warning_Level\":\"" + _Warning_Level + "\",\"Sel_M_Sex_W\":\"" + _Sel_M_Sex_W + "\",\"First_Symbol\":\"" + _First_Symbol + "\",\"Second_Symbol\":\"" + _Second_Symbol + "\"}";
                }


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

                        var minFraction = WarningList[k]["StartFraction"] == "-99999" ? "负无穷" : WarningList[k]["StartFraction"];
                        var MaxFraction = WarningList[k]["EndFraction"] == "99999" ? "正无穷" : WarningList[k]["EndFraction"];
                        var delBtn = "<i class=\"fa fa-times\"  onclick=\"DelWarningMess('" + WarningList[k]["NormWarningCode"] + "');\" style=\"color: red;cursor:pointer;\" aria-hidden=\"true\"></i>";


                        var T_sex = WarningList[k]["Sel_M_Sex_W"];
                        if (T_sex == "1") {
                            T_sex = "男";
                        } else if (T_sex == "2") {
                            T_sex = "女";
                        } else {
                            T_sex = "全部";
                        }

                        var MaxAges = WarningList[k]["EndAge_W"] == 999 ? "无限制" : WarningList[k]["EndAge_W"];


                        var F_SY = WarningList[k]["First_Symbol"] == "<" ? "&lt;" : WarningList[k]["First_Symbol"];
                        var S_SY = WarningList[k]["Second_Symbol"] == "<" ? "&lt;" : WarningList[k]["Second_Symbol"];

                        var tableHtmltd = "<td>" + WarningList[k]["NormWarningLevel"] + "</td><td>" + WarningList[k]["Warning_Level"] + "</td><td>" + T_sex + "</td><td>" + WarningList[k]["StartAge_W"] + "-" + MaxAges + "</td><td>" + minFraction + F_SY + "SCORE" + S_SY + MaxFraction + "</td><td>" + delBtn + "</td>";
                        //var tableHtmltd = "<td>" + WarningList[k]["NormWarningLevel"] + "</td><td>" + minFraction + "-" + MaxFraction + "</td><td>" + delBtn + "</td>";
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


                                //WarningJson = "";
                                WarningJson += "{\"NormCode\":\"NormWarningCode\",\"NormWarningCode\":\"" + WarningJsonList[k].NormWarningCode + "\",\"NormWarningLevel\":\"" + WarningJsonList[k].NormWarningLevel + "\",\"StartFraction\":\"" + WarningJsonList[k].StartFraction + "\",\"EndFraction\":\"" + WarningJsonList[k].EndFraction + "\",\"StartAge_W\":\"" + WarningJsonList[k].StartAge_W + "\",\"EndAge_W\":\"" + WarningJsonList[k].EndAge_W + "\",\"Warning_Level\":\"" + WarningJsonList[k].Warning_Level + "\",\"Sel_M_Sex_W\":\"" + WarningJsonList[k].Sel_M_Sex_W + "\",\"First_Symbol\":\"" + WarningJsonList[k].First_Symbol + "\",\"Second_Symbol\":\"" + WarningJsonList[k].Second_Symbol + "\"}";



                                //WarningJson += "{\"NormCode\":\"\",\"NormWarningCode\":\"" + WarningJsonList[k].NormWarningCode + "\",\"NormWarningLevel\":\"" + WarningJsonList[k].NormWarningLevel + "\",\"StartFraction\":\"" + WarningJsonList[k].StartFraction + "\",\"EndFraction\":\"" + WarningJsonList[k].EndFraction + "\"}";
                            } else {
                                WarningJson += ",{\"NormCode\":\"NormWarningCode\",\"NormWarningCode\":\"" + WarningJsonList[k].NormWarningCode + "\",\"NormWarningLevel\":\"" + WarningJsonList[k].NormWarningLevel + "\",\"StartFraction\":\"" + WarningJsonList[k].StartFraction + "\",\"EndFraction\":\"" + WarningJsonList[k].EndFraction + "\",\"StartAge_W\":\"" + WarningJsonList[k].StartAge_W + "\",\"EndAge_W\":\"" + WarningJsonList[k].EndAge_W + "\",\"Warning_Level\":\"" + WarningJsonList[k].Warning_Level + "\",\"Sel_M_Sex_W\":\"" + WarningJsonList[k].Sel_M_Sex_W + "\",\"First_Symbol\":\"" + WarningJsonList[k].First_Symbol + "\",\"Second_Symbol\":\"" + WarningJsonList[k].Second_Symbol + "\"}";
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
                        $("#Sel_Dimension").append("<option value='0'>--请选择维度名称--</option>");
                        $.each(eval(msg), function (index, item) {
                            $("#Sel_Dimension").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                        });
                        //$("#Sel_Dimension").addClass("chosen-select");
                        //$("#Sel_Dimension").chosen();
                        //$("#Sel_Dimension").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                    } else {
                        $("#Sel_Dimension").append("<option value='0'>--请选择维度名称--</option>");
                    }
                    $("#Sel_Dimension").attr("multiple", false);
                    $("#Sel_Dimension").selectpicker('refresh');
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
                async: false,
                data: {
                    Remark: "InitNorm",
                    D_Code: _d_Code
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        $("#Sel_Norm").append("<option value='0' selected='selected'>请选择常模</option>");
                        $.each(eval(msg), function (index, item) {
                            if (SelValue != "") {
                                $("#Sel_Norm").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                            } else {
                                if (item.Use == 1) {
                                    $("#Sel_Norm").append("<option value='" + item.Value + "'>" + item.Text + "</option>");

                                } else {
                                    $("#Sel_Norm").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                                }
                                //$("#Sel_Norm").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                            }

                        });
                    } else {
                        $("#Sel_Norm").empty();
                        $("#Sel_Norm").append("<option value='0'>暂无常模可选，请添加</option>");

                    }

                    $("#Sel_Norm").attr("multiple", false);

                    $("#Sel_Norm").selectpicker('refresh');


                    //$("#Sel_Norm").chosen();
                    //$("#Sel_Norm").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                    //$("#Sel_Norm").addClass("chosen-select");
                }
            });

            InitNW();
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

                        if (JF_Type == 0) {
                            $("#JF_Title").css('display', 'none');
                            $("#JF_Content").css('display', 'none');
                        } else {
                            $("#JF_Title").css('display', 'block');
                            $("#JF_Content").css('display', 'block');
                        }

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
            //$("#Sel_Norm").chosen();
            //$("#Sel_Norm").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
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
                layer.alert('请输入常模名称!', {
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
            dataJson += "        \"FormulaCode\": \"\",";//公式编码
            dataJson += "        \"CalculationType\": \"" + JF_Type + "\"";//公式编码
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
                            layer.msg('维度[' + WD_Name + ']的[' + _NormTitle + ']常模保存成功！', { icon: 6, time: 2000 });
                            ExplainJson = "";
                            $("#Sel_Norm").find("option[value='0']").attr("selected", "selected");

                        } else {
                            layer.msg('维度常模保存失败！', { icon: 5, time: 2000 });

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


        InitSel_AmountType3();
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
                        //$("#Sel_AmountType3").chosen();
                        //$("#Sel_AmountType3").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
                    } else {
                        $("#Sel_AmountType3").append("<option value='0'>暂无维度可选</option>");
                    }


                    $("#Sel_AmountType3").attr("multiple", false);

                    $("#Sel_AmountType3").selectpicker('refresh');

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
            //$("#Sel_Start_Age").chosen();
            //$("#Sel_Start_Age").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来

        }

        function InitSel_End_Age() {

            for (var t = 0; t < 100; t++) {
                if (t == 0) {
                    $("#Sel_End_Age").append("<option value='" + t + "'>全部</option>");
                } else {
                    $("#Sel_End_Age").append("<option value='" + t + "'>" + t + "岁</option>");
                }

            }
            //$("#Sel_End_Age").chosen();
            //$("#Sel_End_Age").trigger("chosen:updated");//这句话很重要呀不加的话动态刷新不出来
        }


        /*-------------保存维度评分设置功能-------------*/
        function SaveDimensionMessage() {


            var _Dcode = $("#Sel_Dimension").val();//维度编码
            var _FormulaStr = $("#textarea_formula").val().replace(/\s/g, "").replace(/\"/g, "\"");//计分公式
            var NormCode = $("#Sel_Norm").val();//常模编码
            //NormCode
            var dataJson = "";
            dataJson += "    {";
            dataJson += "        \"DimensionCode\": \"" + _Dcode + "\",";//维度编号
            dataJson += "        \"FormulaStr\": \"" + _FormulaStr + "\",";//维度公式
            dataJson += "        \"FormulaCode\": \"000\",";//公式编码
            dataJson += "        \"CalculationType\": \"" + JF_Type + "\",";//公式编码
            dataJson += "        \"NormCode\": \"" + NormCode + "\"";//常模编码
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
                        // $("#Btn_SaveDM").css('display', 'none');
                        layer.msg('评分设置保存成功！', { icon: 6, time: 2000 });


                    } else {
                        // $("#Btn_SaveDM").css('display', 'block');
                        layer.msg('评分设置保存失败 ！', { icon: 5, time: 2000 });


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



        ///*------------导航栏操作---------------*/

        //// 禁用超链接-"变灰"
        //function disableHref() {
        //    var hrefDom = document.getElementById("testHref");
        //    hrefDom.className += " disableHref";
        //}
        //// 启用超链接-"正常"
        //function enableHref() {
        //    var hrefDom = document.getElementById("testHref");
        //    hrefDom.className = hrefDom.className.replace(" disableHref", "");
        //}
        //// 超链接点击事件
        //function hrefClick() {
        //    var target = event.target;
        //    if (target.className.indexOf("disableHref") > -1) {
        //        // 加入判断,有"变灰"时返回
        //        return false;
        //    }
        //    // do something u need
        //    // for example
        //    alert("jump previous");
        //}

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

        /*---------------------题目范围全选按钮-----------------------*/
        function SelectAll(obj) {
            //SelNum = 0;
            //SubjecCodeStr = "";
            if (obj.checked) {
                $("input[type=checkbox][name=SelTG]").prop("checked", true);
            } else {
                $("input[type=checkbox][name=SelTG]").prop("checked", false);
            }
            $("input[type=checkbox][name=SelTG]").each(function () {
                SelSubjectClick(this);
            });
        }


        function DelCM() {

            layer.confirm('您是否要删除该常模？', {
                btn: ['删除', '取消'] //按钮
            }, function () {
                var CMcode = $("#Sel_Norm").val();
                var DMcode = $("#Sel_Dimension").val();
                $.ajax({
                    type: "POST",
                    url: "Ajax/HeartEvaluationCustomAdd.ashx",
                    data: {
                        Remark: "DelDN",
                        D_Code: DMcode,
                        N_Code: CMcode
                    },//要执行查询的数据参数
                    success: function (msg) {
                        if (msg > 0) {
                            InitNorm(0);
                            layer.closeAll();
                        } else {
                            layer.msg('常模删除失败 ！', { icon: 5, time: 2000 });

                        }
                    }
                });
                //   alert(CMcode);

            });
        }


        /*----------加载常模解释和常模预警*/
        function InitNW() {
            var CMcode = $("#Sel_Norm").val();
            var str = $("#Sel_Norm option").map(function () { if ($(this).val() == CMcode) return $(this).text(); }).get().join(", ");//获取下拉列表文本
            if ($("#Sel_Norm").val() != "0") {
                $("#T_Norm_Title").val(str);
            }
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

                        // alert(msg)
                        Draw_EW(msg);
                    } else {
                        $("#Btn_CM_Save").css('display', 'block');
                        $("#Model_Message").css('display', 'none');
                    }

                    //if (msg != "") {
                    //    $("#Model_Message").css('display', 'block');
                    //    $("#Btn_CM_Save").css('display', 'none');
                    //    Draw_EW(msg);

                    //} else {
                    //    $("#Btn_CM_Save").css('display', 'block');
                    //    $("#Model_Message").css('display', 'none');

                    //}
                }
            });
        }
        $(document).on("click", "#Sel_Norm option", function () {
            var CMcode = $("#Sel_Norm").val();
            if (CMcode != "暂无常模可选，请添加") {
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

                            // alert(msg)
                            Draw_EW(msg);
                        } else {
                            $("#Btn_CM_Save").css('display', 'block');
                            $("#Model_Message").css('display', 'none');
                        }

                        //if (msg != "") {
                        //    $("#Model_Message").css('display', 'block');
                        //    $("#Btn_CM_Save").css('display', 'none');
                        //    Draw_EW(msg);

                        //} else {
                        //    $("#Btn_CM_Save").css('display', 'block');
                        //    $("#Model_Message").css('display', 'none');

                        //}
                    }
                });
            }
        })


        /*-----绘画解释说明列表-----*/
        function Draw_EW(InfoJson) {


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


                                var MinAge = Elist[t].MinAge == "-999" ? "0" : Elist[t].MinAge;
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
                                var tableHtmltd = "<td>" + Elist[t].ExplainName + "</td><td>" + MinAge + "-" + MaxAge + "</td><td>" + Tsex + "</td><td>" + MinFraction + Elist[t].First_Symbol + "SCORE" + Elist[t].Second_Symbol + MaxFraction + "</td><td>" + Elist[t].Explain + "</td><td>" + Elist[t].Proposal + "</td><td style=\"float:center;\">" + delBtn + "</td>";
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

                                var MaxAge = Wlist[f].MaxAge;
                                if (MaxAge == "999" || MaxAge == 999) {
                                    MaxAge = "无限制";
                                }




                                var tableHtmltd = "<td>" + Wlist[f].WarningLevel + "</td><td>" + Wlist[f].NormWarningLevel_Level + "</td><td>全部</td><td>" + Wlist[f].MinAge + "-" + MaxAge + "</td><td>" + minFraction + Wlist[f].First_Symbol + "SCORE" + Wlist[f].Second_Symbol + MaxFraction + "</td><td>" + delBtn + "</td>";
                                //var tableHtmltd = "<td>" + Wlist[f].WarningLevel + "</td><td>" + minFraction + "-" + MaxFraction + "</td><td>" + delBtn + "</td>";
                                var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                                WarningTable.append(TableHtml);

                            }
                        }
                    }
                }


                //if (ExplainJsonList != null && ExplainJsonList.length > 0) {
                //    for (var k = 0; k < ExplainJsonList.length; k++) {

                //        var MaxAge = ExplainJsonList[k]["NormEndAge"] == "99999" ? "正无穷" : ExplainJsonList[k]["NormEndAge"];
                //        var MaxFraction = ExplainJsonList[k]["EndFraction"] == "99999" ? "正无穷" : ExplainJsonList[k]["EndFraction"];


                //        var MinAge = ExplainJsonList[k]["NormStartAge"] == "-99999" ? "负无穷" : ExplainJsonList[k]["NormStartAge"];
                //        var MinFraction = ExplainJsonList[k]["StartFraction"] == "-99999" ? "负无穷" : ExplainJsonList[k]["StartFraction"];

                //        var MSex = ExplainJsonList[k]["NormSex"];
                //        var Tsex = "";
                //        if (MSex == 0) {
                //            Tsex = "全部";
                //        } else if (MSex == 1) {
                //            Tsex = "男";
                //        } else {
                //            Tsex = "女";
                //        }

                //        var delBtn = "<i class=\"fa fa-times\" style=\"color: red;cursor:pointer;\"  onclick=\"Del_Draw_Explain('" + ExplainJsonList[k]["ExplainCode"] + "')\" aria-hidden=\"true\"></i>";
                //        var tableHtmltd = "<td>" + ExplainJsonList[k]["ExplainName"] + "</td><td>" + MinAge + "-" + MaxAge + "</td><td>" + Tsex + "</td><td>" + MinFraction + "-" + MaxFraction + "</td><td>" + ExplainJsonList[k]["NormExplain"] + "</td><td>" + ExplainJsonList[k]["NormProposal"] + "</td><td style=\"float:center;\">" + delBtn + "</td>";
                //        var TableHtml = "<tr>" + tableHtmltd + "</tr>";
                //        ExplainTable.append(TableHtml);
                //    }
                //}





            } else {
                $("#Explain_Table  tbody").empty("");
            }
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
                            layer.msg('常模预警删除失败 ！', { icon: 5, time: 2000 });

                        }
                    }
                });
            });


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
                            layer.msg('常模解释删除失败 ！', { icon: 5, time: 2000 });
                        }
                    }
                });
            });

        }
        function Quxiao() {

            $("#Model_Pnale").find("input").val("");
            $("#Model_Pnale").find("textarea").val("");

            $("#Norm_First_Symbol").val("≤")
            $("#Norm_Second_Symbol").val("≤")
        }
        function quxuais() {
            $("#Model_Warning").find("input").val("");
            $("#Model_Warning").find("textarea").val("");
            $("#First_Symbol").val("<=");
            $("#Second_Symbol").val("<=");
            $("#Sel_M_Sex_W").val("0");
        }


        function disableds() {
            //$("#butt").attr('disabled', true);
            setInterval('can()', 2000);
        }
        function can() {
            $("#butt").attr('disabled', false);
        }


        //$("#Sel_AmountType").on("click", function () {

        //    //var bootstrapValidator = $("#AmountInfoAdd").data('bootstrapValidator');
        //    //bootstrapValidator.validate();
        //    //alert()
        //    $('#Sel_AmountType').data('bootstrapValidator')
        //          .updateStatus('AmountType', 'NOT_VALIDATED', null)
        //          .validateField('AmountType');

        //});

        //设置复选框的CheckboxID     获取class为    childCheck循环
        $(document).on("click", ".childCheck", function () {
            if (!$(this)[0].checked) {
                $("#wd_aLL")[0].checked = false;
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
                $("#wd_aLL")[0].checked = isSuccess;

            }

        });


    </script>

</asp:Content>
