

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="DiscriminateEstimateReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.DiscriminateEstimateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
            <link rel="shortcut icon" id="icons" href="" />
            <!-- Bootstrap Styles-->
            <!-- FontAwesome Styles-->
            <!-- Custom Styles-->
            <link href="/css/custom-styles.css" rel="stylesheet" />
            <link href="/css/custom-styles_1.css" rel="stylesheet" />
            <link href="/css/font-awesome.min.css" rel="stylesheet" />
            <link href="/css/base.css" rel="stylesheet" />
            <link href="/css/rysz.css" rel="stylesheet" />
            <link href="/css/wjyj.css" rel="stylesheet" />
            <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../CSS/bootstrap-select.min.css" rel="stylesheet" />
            <div class="content pr">
                <button class="x_xiugai btn updateDiscriminateEstiamte" name="update">
                    修改</button>
                <!-- main -->
                <form action="">
                    <div class="x_reports x_reports_show" id="MainDiv">
                        <h3 class="fb tc mt5 mb30">鉴别评估报告</h3>
                        <div class="part">
                            <div class="tc title">
                                <span class="f16 white">基本信息</span>
                            </div>
                            <div class="main main1 mt40">
                                <table class="table table-bordered mt30 h150">
                                    <tbody>
                                        <tr>
                                            <td>登&nbsp; 录&nbsp;名：<span>{{personalInfo.LoginName}}</span></td>
                                            <td>姓<strong class="pl30 fn">名</strong>：<span>{{personalInfo.UserName}}</span></td>
                                            <td>年<strong class="pl30 fn">龄</strong>：<span>{{personalInfo.Age}}</span></td>
                                            <td>性<strong class="pl30 fn">别</strong>：<span>{{personalInfo.Sex}}</span></td>
                                        </tr>
                                        <tr>
                                            <td>部<strong class="pl30 fn">门</strong>：<span>{{personalInfo.Department}}</span></td>
                                            <td>手&nbsp; 机&nbsp;号：<span>{{personalInfo.CellPhone}}</span></td>
                                            <td>邮<strong class="pl30 fn">箱</strong>：<span>{{personalInfo.Email}}</span></td>
                                            <td>预警级别：<span class="red1">{{personalInfo.WarningState}}</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="part mt50">
                            <div class="tc title">
                                <span class="f16 white">评估内容</span>
                            </div>
                            <div class="main main2 mt20" >
                                <p class="c666" v-show="isShowInputDom==0" id="showContent" style="word-wrap: break-word;word-break: break-all;">
                                    {{reportInfo.DiscernEstimateReport}}
                                </p>
                                <div id="ReportModel">
                                <textarea class="form-control p10" rows="30" maxlength="15000" placeholder="请输入内容..." v-show="isShowInputDom==1"
                                     onkeyup="txtNameCheck(this,15000)" v-model="discernEstimateReportModel.DiscernEstimateReport" onblur="txtNameCheck(this,15000)" id="suggestion"></textarea>
                                    </div>
                            </div>
                        </div>
                        <div class="part mt50">
                            <div class="tc title">
                               <%-- <span><img src="../../Img/bg_bg.png" /></span>--%>
                               <span class="f16 white" >评估结果</span>
                            </div>
                            <div class="main main3 mt40 c666" >
                                <div class="box_result"  v-show="isShowInputDom==0">
                                    <p>危险等级：{{reportInfo.WarningState}}</p>
                                    <p>处理方案：{{reportInfo.DisposalSuggestion}}</p>
                                    <p>问题类型：{{reportInfo.QuestionType}}</p>
                                    <p>评估时间：{{reportInfo.DiscernDate}}</p>
                                    <p>评估人：{{reportInfo.CounselorName}}</p>
                                </div>
                                
                                    <div class="box_result words" id="hideSelect" v-show="isShowInputDom==1">
                                    <p class="mb20">                                      
                                        <span>危险等级：</span>                                        
                                        <select autocomplete="off" v-model="discernEstimateReportModel.WarningLevel"  class="form-control selectleve">
                                             <option selected="selected" value="0">请选择危险等级</option>
                                            <option  value="1">暂无</option>
                                            <option value="2">较低</option>
                                            <option value="3">中等</option>
                                            <option value="4">较高</option>
                                            <option value="5">极高</option>
                                        </select>                                          
                                    </p>
                                    <p class="mb20">
                                        <span>处理方案：</span>
                                        <select autocomplete="off" v-model="discernEstimateReportModel.DisposalSuggestion" data-done-button="true" multiple  data-live-search="true" class="form-control selectpicker selectleve" >
                                            <option selected="selected" value="0">请选择处理方案</option>
                                            <option  value="1">1.立即就医</option>
                                            <option value="2">2.24小时监护</option>
                                            <option value="3">3.通知相关管理员</option>
                                            <option value="4">4.进行心理咨询</option>
                                            <option value="5">5.暂时无需干预</option>
                                        </select>

                                    </p>
                                    <p class="mb20">
                                        <span>问题类型：</span>
                                      
                                        <select autocomplete="off" v-model="discernEstimateReportModel.QuestionType" class="form-control selectleve">
                                           <option selected="selected" value="0">请选择问题类型</option>
                                            <option v-for="(item,index) in questionType" :value="item.Value">
                                                {{item.Text}}
                                            </option>
                                        </select>
                                            
                                    </p>
                                       <p class="mb20">
                                        <span>评估时间：</span>
                                      <span id="showEstimateDate"></span>
                                    </p>
                                       <p class="mb20">
                                        <span>评估人：</span>
                                      <span id="showEstimatePerson"></span>
                                    </p>
                                </div>
                                <div class="overflow">
                                    <div v-for="(prModel,index) in potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskEstimateResultList">
                                        <div class="overflow f14 pt10 mb10">
                                        <div class="fl">潜在风险评估结果 </div>
                                        <div class="fr">完成时间:{{potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskCreateTime[index]}}</div>
                                    </div>
                                    <table class="table table-bordered" >
                                        <thead>
                                            <tr role="row">
                                                 <td style="width: 186.9000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; background: rgb(224,224,224); " valign="top" width="249">
                    <p align="center" class="MsoNormal" style="text-align:center;">
                        <span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span>
                    </p>
                </td>
                                                 <td style="width: 187.6500pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; border-left: none; ; mso-border-left-alt: none;   border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255);   background: rgb(224,224,224);" valign="top" width="250">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">症状自评</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                                 <td style="width: 187.6500pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; border-left: none; ; mso-border-left-alt: none;  border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255);   background: rgb(224,224,224);" valign="top" width="250">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">自尊</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                                <td style="width: 187.6500pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; border-left: none; ; mso-border-left-alt: none;; border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255);   background: rgb(224,224,224);" valign="top" width="250">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">社会支持</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                               <%-- <th class="text-center" rowspan="1" colspan="1" style="width: 20%"></th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">症状自评</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">自尊</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">社会支持</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr role="row">
                                                 <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">得分</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                                   <td v-for="value in prModel" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span v-for="(item,key) in value" style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><span v-for="(item,key) in value">{{item}}</span></span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                                <%--<th class="fn" scope="row">得分</th>
                                                <td v-for="value in prModel">
                                                    <span v-for="(item,key) in value">{{item}}</span>
                                                </td>--%>
                                            </tr>
                                            <tr role="row">
                                                 <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">状态</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                                   <td v-for="(value,key) in prModel" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span v-for="(item,key) in value" style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><span v-for="(item,key) in value">{{key}}</span></span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                                <%--<th class="fn" scope="row">维度</th>
                                                <td v-for="(value,key) in prModel">
                                                    <span v-for="(item,key) in value">{{key}}</span>
                                                </td>--%>
                                            </tr>
                                            <tr role="row">
                                                  <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">预警级别</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                                   <td colspan="3" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span  style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">{{potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskWarningState[index]}}</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                               <%-- <th class="fn" scope="row">预警级别</th>
                                                <td colspan="4">{{potentialRiskEstimateAndIdioctoniaEstimateResult.PotentialRiskWarningState[index]}}</td>--%>
                                            </tr>

                                        </tbody>
                                    </table>
                                    </div>
                                    <div v-for="(prModel,index) in potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaEstimateResultList">
                                        <div class="overflow f14 pt10 mb10">
                                        <div class="fl">自杀评估结果 </div>
                                        <div class="fr">完成时间:{{potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaCreateTime[index]}}</div>
                                    </div>
                                        <table class="table table-bordered" >
                                        <thead>
                                            <tr role="row">
                                                <td style="width: 186.9000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt;  border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255);   background: rgb(224,224,224);" valign="top" width="249">
                                                 <p align="center" class="MsoNormal" style="text-align:center;">
                                                  <span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span>
                                                 </p>
                                              </td>
                                                <td style="width: 186.9000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt;    border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255);   background: rgb(224,224,224);" valign="top" width="249">
                                                   <p align="center" class="MsoNormal" style="text-align:center;">
                                                    <span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>总评</span>
                                                      </p>
                                                 </td>
                                              <td style="width: 186.9000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt;    border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255);   background: rgb(224,224,224);" valign="top" width="249">
                                                <p align="center" class="MsoNormal" style="text-align:center;">
                                                <span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>绝望</span>
                                                 </p>
                                               </td>
                                                <td style="width: 186.9000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt;  border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255);   background: rgb(224,224,224);" valign="top" width="249">
                                                  <p align="center" class="MsoNormal" style="text-align:center;">
                                                     <span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>自杀意念</span>
                                                  </p>
                                                 </td>
                                              <td style="width: 186.9000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt;  border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 1.0000pt solid rgb(204,204,204); background: rgb(224,224,224);" valign="top" width="249">
                                               <p align="center" class="MsoNormal" style="text-align:center;">
                                               <span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>负性自我评价</span>
                                                 </p>
                                                </td>

                                              <td style="width: 186.9000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt;  border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 1.0000pt solid rgb(204,204,204);background: rgb(224,224,224);" valign="top" width="249">
                                               <p align="center" class="MsoNormal" style="text-align:center;">
                                            <span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p>敌意</span>
                                                </p>
                                             </td>

                                               <%-- <th class="text-center" rowspan="1" colspan="1" style="width: 10%"></th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">总评</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 15%;">绝望</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">自杀意念</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">负性自我评价</th>
                                                <th class="text-center" rowspan="1" colspan="1" style="width: 25%;">敌意</th>--%>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr role="row">
                                                <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                                                  <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                                                  <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">得分</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                                                   </td>
                                                 <td v-for="value in prModel" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                                                  <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                                                  <span v-for="(item,key) in value" style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">{{item}}</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                                                   </td>
                                              <%--  <th class="fn" scope="row">得分</th>
                                                <td v-for="value in prModel">
                                                    <span v-for="(item,key) in value">{{item}}</span>
                                                </td>--%>
                                            </tr>
                                            <tr role="row">
                                                 <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                                                  <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                                                  <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">状态</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                                                   </td>
                                                 <td v-for="value in prModel" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                                                  <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                                                  <span v-for="(item,key) in value" style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">{{key}}</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                                                   </td>
                                               <%-- <th class="fn" scope="row">维度</th>
                                                <td v-for="value in prModel">
                                                    <span v-for="(item,key) in value">{{key}}</span>
                                                </td>--%>
                                            </tr>
                                            <tr role="row">
                                                 <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                                                  <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                                                  <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">预警级别</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                                                   </td>
                                                 <td colspan="5" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                                                  <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                                                  <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">{{potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaWarningState[index]}}</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                                                   </td>
                                              <%--  <th class="fn" scope="row">预警级别</th>
                                                <td colspan="5">{{potentialRiskEstimateAndIdioctoniaEstimateResult.IdioctoniaWarningState[index]}}</td>--%>
                                            </tr>

                                        </tbody>
                                    </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt50 mb50" id="Font">
                            <div class="col-sm-6  col-xs-6 text-right"  >
                                <button type="button" class="btn btn-sm x_btn f14" id="addDiscriminateEstimateReport">确定</button>
                            </div>
                            <div class="col-sm-2  col-xs-3  text-right">
                                <button type="button" class="btn btn-sm x_btn1 f14" onclick="back()">取消</button>
                            </div>
                        </div>
                         <div class="row mt50 mb50" id="FontExport" style="display:none">
                            <div class="col-sm-6  col-xs-6 text-right">
                                <button type="button" class="btn btn-sm x_btn f14" id="addDiscriminateEstimateExport" onclick="MemberArchivesExport()">导出</button>
                            </div>
                            <div class="col-sm-2  col-xs-3  text-right">
                                <button type="button" class="btn btn-sm x_btn1 f14" onclick="back()">取消</button>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- main结束 -->
            </div>
        <!-- JS Scripts-->
        <!-- 左侧下拉框 Js -->
        <script src="../../JS/vue.js"></script>
        <script src="../../JS/ExtendJS.js"></script>
        <script src="/js/bootstrap-datepicker.js"></script>
        <script src="/js/bootstrap-datepicker.zh-CN.js"></script>
    <script src="../../JS/bootstrap-select.min.js"></script>
        <script src="../../JS/layer.js"></script>
        <script src="../../JS/word/FileSaver.js"></script>
        <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
        <script src="../../JS/zip/ZipArchive.js"></script>
        <script type="text/javascript">
            $(function () {
                var tempEle = document.getElementById("addDiscriminateEstimateReport");
                tempEle.addEventListener("click", AddDiscernEstimate);
                $("#showEstimateDate").text(window.GetNowTime());
                $("#showEstimatePerson").text(window.GetCurrentLoginName());
            })
            var navName = '/FunctionModular/RiskWarning/DiscriminateEstimate.aspx';
            $("#page-wrapper").addClass("x_wjgy");
            $("#page-wrapper").addClass("x_wjgy_jbpgbg");
            var reportVue;
            var isShowInputDom = 1;
            var reportInfo = sessionStorage.getItem("reportInfo");
            isHideUp();
            function isHideUp() {
                var temp = sessionStorage.getItem("source");
                if (temp != undefined && temp != "undefined")
                    $('[name=update]').css('display', 'none');
                else {
                    $('.addDiscriminateEstimateReport').text('导出');
                    $('[name=update]').css('display', 'inline');
                }
            }
            function AddDiscernEstimate() {
                if (reportVue.$data.discernEstimateReportModel.WarningLevel == 0) {
                    layer.alert("请选择危机等级");
                    return;
                }
                if (reportVue.$data.discernEstimateReportModel.DisposalSuggestion.length <= 1 && reportVue.$data.discernEstimateReportModel.DisposalSuggestion[0]==0) {
                    layer.alert("请选择处理方案");
                    return;
                }
                if (reportVue.$data.discernEstimateReportModel.QuestionType == 0) {
                    layer.alert("请选择问题类型");
                    return;
                }
                var text = $(this).text();
                reportVue.$data.discernEstimateReportModel.DiscernEstimateReport = $("#suggestion").val();
                reportVue.$data.discernEstimateReportModel.DEID = 0;
                reportVue.$data.discernEstimateReportModel.DisposalSuggestion.remove('0');
                reportVue.$data.discernEstimateReportModel.DisposalSuggestion = reportVue.$data.discernEstimateReportModel.DisposalSuggestion.join(',');
                $.ajax({
                    url: "Ajax/DiscriminateEstimate.ashx",
                    type: "post",
                    data: { operationType: "AddDiscriminateEstimateReport", discernEstimateReportModel: JSON.stringify(reportVue.$data.discernEstimateReportModel) },
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.State) {
                            layer.msg("评估成功，将跳转列表页", { icon: 6, time: 2000 }, function () {
                                window.location.href = "DiscriminateEstimate.aspx";
                            });
                        }
                    }
                });

                //导出
            }
            var personalInfo = sessionStorage.getItem("personalInfo") == 'undefined' ? undefined : JSON.parse(sessionStorage.getItem("personalInfo"));
            if (personalInfo == undefined) {
                $.ajax({
                    url: "Ajax/DiscriminateEstimate.ashx?operationType=GetPersonalInfo",
                    data: { userID: sessionStorage.getItem("userID") },
                    async: false,
                    dataType: "json",
                    type: "post",
                    success: function (data) {
                        personalInfo = data;
                    }
                })
            }
            var discernEstimateReportModel = {
                DEID:'',
                WarningLevel: 0,
                DisposalSuggestion: [0],
                QuestionType: 0,
                DiscernEstimateDate: "",
                DiscernEstimateReport: '',
                UserID: sessionStorage.getItem("userID")
            };
            if (reportInfo != undefined && reportInfo != 'undefined' && reportInfo != "") {
             
                isShowInputDom = 0;
               
                $("#FontExport").show();
                $("#Font").hide();
                var tempEle = document.getElementById("addDiscriminateEstimateReport");
                tempEle.removeEventListener("click", AddDiscernEstimate);
            }
            function back() {
                window.location.href = "DiscriminateEstimate.aspx";
            }
            function GetQuestionType() {
                var questionType;
                $.ajax({
                    url: "Ajax/DiscriminateEstimate.ashx",
                    type: "post",
                    data: { operationType: "GetQuestionType" },
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        questionType = data;
                    }
                })
                return questionType;
            }
            function InitialPotentialRiskEstimateAndIdioctoniaEstimateResult() {
                var potentialRiskEstimateAndIdioctoniaEstimateResult;
                $.ajax({
                    url: "Ajax/DiscriminateEstimate.ashx",
                    type: "post",
                    dataType: "json",
                    data: { operationType: "InitialPotentialRiskEstimateAndIdioctoniaEstimateResult", userID: personalInfo.UserID },
                    async: false,
                    success: function (data) {
                        potentialRiskEstimateAndIdioctoniaEstimateResult = data;
                    }
                })
                return potentialRiskEstimateAndIdioctoniaEstimateResult;
            }
            reportVue = new Vue({
                el: ".content",
                data: {
                    isShowInputDom: isShowInputDom,
                    questionType: GetQuestionType(),
                    discernEstimateReportModel: discernEstimateReportModel,
                    potentialRiskEstimateAndIdioctoniaEstimateResult: eval(InitialPotentialRiskEstimateAndIdioctoniaEstimateResult()),
                    personalInfo: personalInfo,
                    reportInfo: reportInfo != undefined && reportInfo != 'undefined' && reportInfo != "" ? JSON.parse(reportInfo) : "",
                }
            })
             
            //判断名称格式与长度
            function txtNameCheck(data, length) {
                var txt = $("#suggestion").val();
                var le = parseInt(length);
                if (txt.length > le) {
                    txt = txt.substring(0, le);
                    $("#suggestion").val(txt);
                }
            }
            $(document).on("click", ".updateDiscriminateEstiamte", function () {
                reportVue.$data.isShowInputDom = 0;
                reportVue.$data.discernEstimateReportModel.DiscernEstimateReport = reportVue.$data.reportInfo.DiscernEstimateReport;
                $(".addDiscriminateEstimateReport").text("确定");
                var tempEle = document.getElementById("addDiscriminateEstimateReport");
                tempEle.removeEventListener("click", AddDiscernEstimate);
                tempEle.addEventListener("click", UpdateDiscernEstimate);
                $("#suggestion").show();
                $("#FontExport").hide();
                $("#Font").show();
                $("#showContent").hide();
            })
            function UpdateDiscernEstimate() {
                reportVue.$data.discernEstimateReportModel.DEID = reportVue.$data.reportInfo.DEID;
                reportVue.$data.discernEstimateReportModel.UserID = reportVue.$data.personalInfo.UserID;
                reportVue.$data.discernEstimateReportModel.DiscernEstimateReport = $("#suggestion").val();
                reportVue.$data.discernEstimateReportModel.DisposalSuggestion = reportVue.$data.discernEstimateReportModel.DisposalSuggestion.join(',');
                $.ajax({
                    url: "Ajax/DiscriminateEstimate.ashx",
                    type: "post",
                    data: { operationType: "UpdateDiscriminateEstimate", discernEstimateReportModel: JSON.stringify(reportVue.$data.discernEstimateReportModel) },
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        if (data.State) {
                            layer.msg("更新成功，将跳转列表页", { icon: 6, time: 2000 }, function () {
                                window.location.href = "DiscriminateEstimate.aspx";
                            });
                        }
                    }
                });
            }
            function MemberArchivesExport() {
                $("div").remove(".words");
                $("#FontExport").hide();
                $("#ReportModel").find("textarea").remove();
                $("#editInput").hide();
                $("#MainDiv").wordExport("鉴别评估");
                $("#FontExport").show();
                $("#editInput").show();
                $("#ReportModel").append('<textarea class="form-control p10" rows="30" maxlength="15000" placeholder="请输入内容..." style="display:none"  v-show="isShowInputDom==1"'+
                'onkeyup="txtNameCheck(this,15000)" v-model="discernEstimateReportModel.DiscernEstimateReport" onblur="txtNameCheck(this,15000)" id="suggestion"></textarea>');

            }
        </script>
</asp:Content>
