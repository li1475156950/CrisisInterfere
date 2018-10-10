<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="GroupConsultationInfo.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.GroupConsultationInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="Style/IndividualConsultationInfo.css" rel="stylesheet" />
    <link href="Style/IndividualConsultationEdit.css" rel="stylesheet" />

    <script src="../../JS/word/FileSaver.js"></script>
   <%-- <script src="../../JS/word/jquery.wordexport.js"></script>--%>
     <script src="../../JS/zip/zip.js"></script>
    <script src="../../JS/zip/mime-types.js"></script>
    <script src="../../JS/zip/deflate.js"></script>
    <script src="../../JS/zip/ZipArchive.js"></script>
    <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
    <script src="../../JS/layer.js"></script>
   <%-- <script src="ViewModel/IndividualConsultationInfoViewModel.js"></script>--%>
    <script src="ViewModel/GroupConsultationInfo.js"></script>
   <%-- <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li><a href="IndividualConsultation.aspx">团体咨询</a></li>
                <li>查看</li>
            </ol>
        </div>
    </div>--%>

    <div class="row infoMain" style="margin-left: 9px; margin-top:20px; border: 1px #E3E3E3 solid">

        <div class="col-md-12">
            <div class="caption" style="font-size: 24px; font-weight: bold; text-align: center; padding-top: 10px; padding-bottom: 20px;" id="GroupTitle">团体咨询档案
                <label id='labelCaption'></label>
            </div>
        </div>

      
        <div class="col-md-12">
            <legend class="legendRecord" style="border-style: dashed; font-size: 14px; color: #333333; margin-top: 10px; margin-bottom: 5px;">档案信息：</legend>
        </div>
        <div class="col-md-10" style="text-align: center; overflow-x: auto;padding-left:90px;">
            <table id='tableInfo' style="border-spacing: 0px; border-collapse: collapse; width:96%; margin: 0 auto; font-size: 12px; margin-bottom: 20px; ">
                <tr>
                    <td colspan="3" style="background-color: #FFF; border: none; text-align: left; padding: 10px;">档案号：<span id='labelNumber'></span>
                    </td>
                    <td  style="background-color: #FFF; border: none; text-align: right; padding: 10px;"><span id="labelConsultantName"></span>
                    </td>
                </tr>
                <tr>
                    <th>咨询主题
                    </th>
                    <td>
                        <span id="labelThemName"></span>
                    </td>
                    <th>问题类型
                    </th>
                    <td>
                        <span id="labelQuestionType"></span>
                    </td>
                  
                </tr>                        
                
            </table>
           
        </div>
       <br />
       <div class="col-md-12 colCaption" style="border-top: 1px #E3E3E3 solid; border-bottom: 1px #E3E3E3 solid; background-color: #D8E6F3; font-size: 16px; font-weight: bold; padding: 10px;">
            基本信息
        </div>
         <div class="col-md-12" style="margin-top:20px;margin-bottom:50px;font-size:12px;" >
            <%-- <span >团体介绍：</span>
             <span id="GroupDescribe"></span>--%>
             <table style='border-spacing: 0px; border-collapse: collapse; width:100%;margin-top:20px;'>
                 <tr>
                     <th style="width: 150px;text-align:right;font-weight: bold;padding: 5px 5px 5px 0px;font-size:12px;">团体介绍：</th>
                     <td id="GroupDescribe" style="text-align:left;padding: 5px 5px 5px 5px;font-size:12px;"></td>
                 </tr>
             </table>
             </div>
        <br />

        <div class="col-md-12 " id="divRecordCaption" style="border-top: 1px #E3E3E3 solid; border-bottom: 1px #E3E3E3 solid; background-color: #D8E6F3; font-size: 16px; font-weight: bold; padding: 10px;">
            咨询记录
        </div>
        <div class="col-md-12 " id="divRecordMain" style="font-size: 12px; padding-bottom: 20px;">
        </div>

        <div class="col-md-12 " id="divSummaryCaption" style="border-top: 1px #E3E3E3 solid; border-bottom: 1px #E3E3E3 solid; background-color: #D8E6F3; font-size: 16px; font-weight: bold; padding: 10px; display: none;">
            结案总结
        </div>
        <div class="col-md-12 " id="divSummaryMain" style="font-size: 12px; padding-bottom: 20px; display: none;">
        </div>

    </div>

    <div class="row">
        <div class=" col-md-12" style="text-align: center; margin-top: 20px;">
            <button type="button" style="background-color: orange; color: white; margin-right: 20px;" id="btnExport" class="btn btn-sm">
                导出
            </button>
            <button class="btn btn-primary btn-sm" id="btnBack" >返回</button>
        </div>
    </div>
</asp:Content>
