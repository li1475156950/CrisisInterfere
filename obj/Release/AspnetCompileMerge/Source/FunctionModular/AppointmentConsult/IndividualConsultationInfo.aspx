<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="IndividualConsultationInfo.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.IndividualConsultationInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="Style/IndividualConsultationInfo.css" rel="stylesheet" />
    <link href="Style/IndividualConsultationEdit.css" rel="stylesheet" />
    <script src="../../JS/word/FileSaver.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="ViewModel/IndividualConsultationInfoViewModel.js"></script>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li><a href="IndividualConsultation.aspx">个体咨询</a></li>
                <li>查看</li>
            </ol>
        </div>
    </div>
    <div class="row infoMain" style="margin-left: 9px; border: 1px #E3E3E3 solid">
        <div class="col-md-12">
            <div class="caption" style="font-size: 24px; font-weight: bold; text-align: center; padding-top: 10px; padding-bottom: 20px;">
                个人成长 - 个体咨询档案 -
                <label id='labelCaption'></label>
            </div>
        </div>
        <div class="col-md-12 colCaption" style="border-top: 1px #E3E3E3 solid; border-bottom: 1px #E3E3E3 solid; background-color: #D8E6F3; font-size: 14px; font-weight: bold; padding: 10px;">
            基本信息
        </div>
        <div class="col-md-12">
            <legend class="legendRecord" style="border-style: dashed; font-size: 14px; color: #333333; margin-top: 10px; margin-bottom: 5px;">个案信息：</legend>
        </div>
        <div class="col-md-10" style="text-align: center; overflow-x: auto;padding-left:90px;">
            <table id='tableInfo' style="border-spacing: 0px; border-collapse: collapse; width: 96%; margin: 0 auto; font-size: 12px; margin-bottom: 20px;">
                <tr>
                    <td colspan="3" style="background-color: #FFF; border: none; text-align: left; padding: 10px;">个案号：<span id='labelNumber'></span>
                    </td>
                    <td colspan="3" style="background-color: #FFF; border: none; text-align: right; padding: 10px;">咨询师姓名：<span id="labelConsultantName"></span>
                    </td>
                </tr>
                <tr>
                    <th>登录名
                    </th>
                    <td>
                        <span id="labelLoginName"></span>
                    </td>
                    <th>来访者姓名
                    </th>
                    <td>
                        <span id="labelUserName"></span>
                    </td>
                    <th>性别
                    </th>
                    <td>
                        <span id="labelUserSex"></span>
                    </td>
                </tr>
                <tr>
                    <th>出生日期
                    </th>
                    <td>
                        <span id="labelUserAge"></span>
                    </td>
                    <th>所属部门
                    </th>
                    <td>
                        <span id="labelUserDepartment"></span>
                    </td>
                    <th>问题类型
                    </th>
                    <td>
                        <span id="labelQuestionType"></span>
                    </td>
                </tr>
                <tr>
                    <th>婚姻状况
                    </th>
                    <td>
                        <span id="labelMaritalStatus"></span>
                    </td>
                    <th>文化程度
                    </th>
                    <td>
                        <span id="labelCulture"></span>
                    </td>
                    <th>联系方式
                    </th>
                    <td>
                        <span id="labelPhone"></span>
                    </td>
                </tr>
            </table>
        </div>
        <br />

        <div class="col-md-12 " id="divRecordCaption" style="border-top: 1px #E3E3E3 solid; border-bottom: 1px #E3E3E3 solid; background-color: #D8E6F3; font-size: 14px; font-weight: bold; padding: 10px;">
            咨询记录
        </div>
        <div class="col-md-12 " id="divRecordMain" style="font-size: 12px; padding-bottom: 20px;">
        </div>

        <div class="col-md-12 " id="divSummaryCaption" style="border-top: 1px #E3E3E3 solid; border-bottom: 1px #E3E3E3 solid; background-color: #D8E6F3; font-size: 14px; font-weight: bold; padding: 10px; display: none;">
            结案总结
        </div>
        <div class="col-md-12 " id="divSummaryMain" style="font-size: 12px; padding-bottom: 20px; display: none;">
        </div>

    </div>

    <div class="row">
        <div class=" col-md-12" style="text-align: center; margin-top: 20px;">
            <button type="button" style="border-color: orange; color: white; margin-right: 20px;" id="btnExport" class="btn btn-sm">
                导出
            </button>
            <button class="btn btn-primary btn-sm" id="btnBack">返回</button>
        </div>
    </div>
      <script>
          var navName = '/FunctionModular/AppointmentConsult/IndividualConsultation.aspx';
    </script>
</asp:Content>
