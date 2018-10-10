<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GroupConsultationEdite.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.GroupConsultationEdite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="Style/IndividualConsultationEdit.css" rel="stylesheet" />
    <link href="lib/StarRating/CSS/star-rating.min.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="lib/StarRating/Script/star-rating.min.js"></script>
    <script src="ViewModel/GroupConsultationEditViewModle.js"></script>
      <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li><a href="IndividualConsultation.aspx">团体咨询</a></li>
                <li>编辑</li>
            </ol>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <ul id="myTab" class="nav nav-tabs-lyj">
                <li class="active"><a href="#file" data-toggle="tab" style="border-left: none;">基本信息</a></li>
                <li class="" id="liRecord">
                    <p>咨询记录</p>
                </li>
                <li class="" id="liSummary">
                    <p>结案总结</p>
                </li>
                <li style="float: right;">
                    <button class="btn btn-primary btn-sm" style="margin-top: 5px; margin-right: 3px;" id="btnBack">返回</button>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="file">
                    <form id="formFile" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 70px;">


                   

                        <div class="col-md-12">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">档案号：</label>
                                    <label class="control-label col-md-8" style="text-align: left;color:#666666; font-weight:lighter" id="lblNumber">档案号</label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4"><small style="color:#a94442">*</small> 主题：</label>
                                    <div class="col-md-8">
                                      <%--  <select id="selectThemType" class="form-control" name="selectThemType">
                                        </select>--%>
                                        <input class="form-control" id="selectThemType" name="selectThemType" style="color:#666666" maxlength="30"/>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-12">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">问题类型：</label>
                                    <div class="col-md-8">
                                        <select class="form-control" id="selectQuestionType" >
                                        </select>
                                    </div>
                                </div>
                            </div>
                             <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">团体介绍：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="GroupDescribe" maxlength="500" />
                                    </div>
                                </div>
                            </div>         
                        </div>
                    

                    <%--    <legend style="font-size: 16px; border-style: dashed">成员信息</legend>

                       <div class="col-md-10" style="padding-left:50px;">
                           <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid">
                    <thead>
                        <tr>
                         
                            <th class="text-center">序号</th>
                            <th class="text-center">登录名</th>
                            <th class="text-center">姓名</th>
                            <th class="text-center">性别</th>
                            <th class="text-center">年龄</th>
                            <th class="text-center">部门</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
                       </div>--%>
                       
                    </form>
                     <div class=" col-md-12" style="text-align: center; margin-top: 50px;">
                            <button type="button" style="background-color: orange; color: white; margin-right: 20px;" id="btnSaveFile" class="btn btn-sm">
                                保存
                            </button>

                        </div>
                </div>
                <div class="tab-pane fade" id="Record">

                    <form id="formRecord" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">
                        <div class="col-md-12" style="text-align: right;">
                            <button class="btn btn-sm " style="background-color: orange; color: white" id="btnRecordAdd" name="btnRecordAdd">+新建记录</button>
                        </div>
                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: hidden; height: 500px; border: 1px solid #ddd; padding-top: 10px; margin-top: 10px;" id="divRecirdMain">
                           
                        </div>

                        <div class=" col-md-8" style="text-align: center; margin-top: 20px;">
                            <button type="button" style="background-color: orange; color: white; margin-right: 20px;" id="btnSaveRecord" class="btn btn-sm">
                                保存
                            </button>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="Summary">

                    <form id="formSummary" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">
                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: hidden; height: 500px; border: 1px solid #ddd; padding-top: 10px; margin-top: 10px;" id="divSummaryMain">

                            <div class='row'>
                                <div class='col-md-5 col-ms-12 col-xs-12 form-group'>
                                    <label class='col-md-4' style='height: 45px; line-height: 45px; text-align: right;'>咨询效果评估：</label>
                                    <div class='col-md-8 col-ms-12 col-xs-12'>
                                        <input type='number' id="txtSummaryStar" name="txtSummaryStar" value='' /> 
                                    </div>
                                </div>
                            </div>
                            <div class="row" id="default">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <div class="col-md-2 col-ms-6 col-xs-6">
                                            <input type="text" class="form-control" style="text-align: right;" id="txtMainTitle"  value="结案总结" name="txtMainTitle" /> 
                                        </div>
                                        <div class="col-md-7 col-ms-10 col-xs-10">
                                            <textarea class="form-control" style="padding-top: 5px;" rows="4" id="txtMainSummary" name ="txtMainSummary"  ></textarea>
                                        </div>
                                        <div class="col-md-3 col-ms-2 col-xs-2">
                                           <button class='btn btn-default-zblb' type='button'  id="defaultbtn"><i class='fa fa-times' style='color: red;' aria-hidden='true'></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>

                        <div class=" col-md-8" style="text-align: center; margin-top: 20px;">
                            <button type="button" style="background-color: orange; color: white; margin-right: 20px;" id="btnSaveSummary" class="btn btn-sm">
                                保存
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
