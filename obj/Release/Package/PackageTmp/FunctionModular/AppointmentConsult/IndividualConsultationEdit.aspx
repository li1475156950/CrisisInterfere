<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="IndividualConsultationEdit.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.IndividualConsultationEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">


    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
    <link href="Style/IndividualConsultationEdit.css" rel="stylesheet" />
    <link href="lib/StarRating/CSS/star-rating.min.css" rel="stylesheet" />
    <%--<link href="../../CSS/x_yuyueguanli.css" rel="stylesheet" />--%>
    <link href="../../CSS/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
    <script src="lib/StarRating/Script/star-rating.min.js"></script>
    <script src="../../JS/bootstrap-datepicker.js"></script>
    <script src="ViewModel/IndividualConsultationEditViewModel.js"></script>

    <div class="row x_gtzxda x_tanchuang1 x_gtzxda_tab">
        <div class="col-md-12">
            <ul id="myTab" class="nav nav-tabs-lyj">
                <li class="active"><a href="#file" data-toggle="tab" style="border-left: none;">基本信息</a></li>
                <li class="" id="liRecord">
                    <p>咨询记录</p>
                </li>
                <li class="" id="liSummary">
                    <p>结案总结</p>
                </li>
                <li style="float: right;border:0">
                    <button class="btn btn-sm x_button1" style="margin-top: 5px; margin-right: 3px;" id="btnBack">返回</button>
                </li>
            </ul>
            <div id="myTabContent" class="tab-content">
                <div class="tab-pane fade in active" id="file">
                    <form id="formFile" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">



                        <div class="col-md-10">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">个案号：</label>
                                    <label class="control-label col-md-8" style="text-align: left;" id="lblNumber"></label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">*问题类型：</label>
                                    <div class="col-md-8">
                                        <select id="selectQuestionType" class="form-control" name="selectQuestionType">
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-10">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">*登录名：</label>
                                    <div class="col-md-8">

                                        <select id="selectUserdisabled" class="form-control" name="selectUserdisabled" style="display: none;">
                                        </select>

                                        <select class="selectpicker" data-done-button="true" data-live-search="true" id="selectUser" name="selectUser">
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">出生日期：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtAge" disabled />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-10">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">姓名：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtName" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">部门：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtDepartment" disabled />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-10">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">性别：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtSex" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">婚姻状况：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtMaritalStatus" name="txtMaritalStatus" maxlength="30"/>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-md-10">

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">文化程度：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtCulture" name="txtCulture" maxlength="30"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="control-label col-md-4">联系方式：</label>
                                    <div class="col-md-8">
                                        <input class="form-control" id="txtPhone" name="txtPhone" maxlength="30" />
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class=" col-md-10" style="text-align: center; margin-top: 10px;">
                            <button type="button" id="btnSaveFile" class="btn btn-sm x_btn f14">
                                保存
                            </button>

                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="Record">

                    <form id="formRecord" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">
                        <div class="col-md-6 pull-right" style="text-align: right;position: absolute;right: 25px;top: 43px; z-index: 9999;">
                            <button class="btn btn-sm x_button" id="btnRecordAdd" name="btnRecordAdd">+ 新建访谈记录</button>
                        </div>
                        <div class="col-md-12 x_scrool" style="overflow-y: scroll; overflow-x: hidden; height: 500px; border: 1px solid #ddd; padding-top: 10px; margin-top: 10px;" id="divRecirdMain">
                        </div>

                        <div class=" col-md-12" style="text-align: center; margin-top: 20px;">
                            <button type="button" id="btnSaveRecord" class="btn btn-sm x_btn f14">
                                保存
                            </button>
                        </div>
                    </form>
                </div>
                <div class="tab-pane fade" id="Summary">

                    <form id="formSummary" role="form" class=" form-horizontal col-md-12" style="border: 1px solid #ddd; border-top: none; padding-top: 20px; padding-bottom: 20px;">
                        <div class="col-md-12" style="overflow-y: scroll; overflow-x: hidden; height: 500px; border: 1px solid #ddd; padding-top: 10px; margin-top: 10px;" id="divSummaryMain">

                            <div class='row'>
                                <div class='col-md-12 col-ms-12 col-xs-12 form-group'>
                                    <label class='col-md-2' style='height: 45px; line-height: 45px; text-align: right; padding-left: 5px;'>咨询效果评估：</label>
                                    <div class='col-md-7 col-ms-12 col-xs-12'>
                                        <input type='number' id="txtSummaryStar" name="txtSummaryStar" value='' />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div>
                                        <div class="col-md-2 col-ms-6 col-xs-6 form-group" style="margin-right: 0px;">
                                            <input type="text" class="form-control" style="text-align: right;" id="txtMainTitle" name="txtMainTitle" value="结案总结" />
                                        </div>
                                        <div class="col-md-7 col-ms-10 col-xs-10 form-group" style="margin-left: 0px;">
                                            <textarea class="form-control" style="padding-top: 5px;" rows="4" id="txtMainSummary" name="txtMainSummary"></textarea>
                                        </div>
                                        <div class="col-md-3 col-ms-2 col-xs-2">
                                            &nbsp;
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class=" col-md-12" style="text-align: center; margin-top: 20px;">
                            <button type="button" id="btnSaveSummary" class="btn btn-sm x_btn f14">
                                保存
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

     <script>
         var navName = '/FunctionModular/AppointmentConsult/IndividualConsultation.aspx';
    </script>
</asp:Content>
