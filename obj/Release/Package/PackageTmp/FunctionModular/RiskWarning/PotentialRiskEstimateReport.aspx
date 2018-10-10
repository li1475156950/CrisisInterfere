<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.Master" CodeBehind="PotentialRiskEstimateReport.aspx.cs" Inherits="CrisisInterfere.FunctionModular.RiskWarning.PotentialRiskEstimateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link rel="shortcut icon" id="icons" href="" />
    <!-- Bootstrap Styles-->
    <link href="/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <!-- Custom Styles-->
    <link href="/css/custom-styles.css" rel="stylesheet" />
    <link href="/css/custom-styles_1.css" rel="stylesheet" />
    <link href="/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/css/base.css" rel="stylesheet" />
    <link href="/css/rysz.css" rel="stylesheet" />
    <link href="/css/wjyj.css" rel="stylesheet" />
    <link href="/css/font-awesome.min_1.css" rel="stylesheet" />
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <style>
        td {
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>
    <div class="row">
        <div class="col-md-1 pull-right">
            <button class="btn btn-sm" id="potentialRiskEstimateReportExport">报告导出</button>
        </div>
    </div>
    <div class="content" id="potentialRiskContent">
        <!-- main -->
        <div class="x_reports">
            <h3 class="fb tc mt5 mb30">《潜在风险评估》报告</h3>
            <div class="part">
                <div class="tc title">
                    <span class="f16 white">基本信息</span>
                </div>
                <div class="main main1 mt20">
                    <table class="table table-bordered mt30">
                        <tbody>
                            <tr>
                               <%-- <td>登&nbsp; 录&nbsp;名：<span>{{reportInfo.LoginName}}</span></td>
                                <td>姓<strong class="pl30 fn">名</strong>：<span>{{reportInfo.UserName}}</span></td>
                                <td>年<strong class="pl30 fn">龄</strong>：<span>{{reportInfo.Age}}</span></td>
                                <td>性<strong class="pl30 fn">别</strong>：<span>{{reportInfo.Sex}}</span></td>--%>
                                <td style="width: 173.6500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: 31.8750pt none rgb(255,255,255); mso-border-left-alt: 31.8750pt none rgb(255,255,255); border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="231">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">登&nbsp; 录&nbsp;名：{{reportInfo.LoginName}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
            <td style="width: 210.0500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: none; ; mso-border-left-alt: none;; border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="280">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">姓</span><span class="15" style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">名</span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">：{{reportInfo.UserName}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
            <td style="width: 221.1500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: none; ; mso-border-left-alt: none;; border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="294">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">年</span><span class="15" style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">龄</span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">：{{reportInfo.Age}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
            <td style="width: 145.0500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: none; ; mso-border-left-alt: none;; border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: 31.8750pt none rgb(255,255,255); mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="193">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">性</span><span class="15" style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">别</span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">：>{{reportInfo.Sex}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
                            </tr>
                            <tr>
                               <%-- <td>部<strong class="pl30 fn">门</strong>：<span>{{reportInfo.Department}}</span></td>
                                <td style="word-wrap: break-word; word-break: break-all;">手&nbsp; 机&nbsp;号：<span>{{reportInfo.CellPhone}}</span></td>
                                <td>邮<strong class="pl30 fn">箱</strong>：<span>{{reportInfo.Email}}</span></td>
                                <td id="warningTd">预警级别：<span class="red1">{{reportInfo.WarningState}}</span></td>--%>
                                <td style="width: 173.6500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: 31.8750pt none rgb(255,255,255); mso-border-left-alt: 31.8750pt none rgb(255,255,255); border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: none; ; mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="231">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">部</span><span class="15" style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">门</span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">：{{reportInfo.Department}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
            <td style="width: 210.0500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: none; ; mso-border-left-alt: none;; border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: none; ; mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="280">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">手&nbsp; 机&nbsp;号：{{reportInfo.CellPhone}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
            <td style="width: 221.1500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: none; ; mso-border-left-alt: none;; border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: none; ; mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="294">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">邮</span><span class="15" style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">箱</span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">：{{reportInfo.Email}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
            <td style="width: 145.0500pt; padding: 11.2500pt 18.7500pt 11.2500pt 18.7500pt; border-left: none; ; mso-border-left-alt: none;; border-right: 31.8750pt none rgb(255,255,255); mso-border-right-alt: 31.8750pt none rgb(255,255,255); border-top: none; ; mso-border-top-alt: 31.8750pt none rgb(255,255,255); border-bottom: 31.8750pt none rgb(255,255,255); mso-border-bottom-alt: 31.8750pt none rgb(255,255,255); background: rgb(255,255,255);" valign="top" width="193">
                <p class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;text-indent:0.0000pt;word-break:break-all;mso-pagination:widow-orphan;text-align:left;vertical-align:top;mso-line-height-alt:12pt;">
                    <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">预警级别：</span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(255,0,0);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">{{reportInfo.WarningState}}</span><span style="font-family:微软雅黑;color:rgb(51,51,51);letter-spacing:0.0000pt;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
                            </tr>
                            <tr>
                                <td>测试类型：<span>{{reportInfo.TestType}}</span></td>
                                <td colspan="3">测试时间：<span>{{reportInfo.TestDate}}</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="part mt50">
                <div class="tc title">
                    <span class="f16 white">测试结果</span>
                </div>
                <div class="main main2 mt20">
                    <table class="table table-bordered">
                        <thead>
                            <tr role="row">
                                <td style="width: 187.5000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; border-left: 1.0000pt solid rgb(204,204,204); mso-border-left-alt: 0.7500pt solid rgb(204,204,204); border-right: 1.0000pt solid rgb(204,204,204); mso-border-right-alt: 0.7500pt solid rgb(204,204,204); border-top: 1.0000pt solid rgb(204,204,204); mso-border-top-alt: 0.7500pt solid rgb(204,204,204); border-bottom: 1.0000pt solid rgb(204,204,204); mso-border-bottom-alt: 0.7500pt solid rgb(204,204,204); background: rgb(224,224,224);" valign="top" width="250">
                <p align="center" class="MsoNormal">
                    <span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">
                    <br />
                    </span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"></span><span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
                                <td style="width: 187.5000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; border-left: 1.0000pt solid rgb(204,204,204); mso-border-left-alt: 0.7500pt solid rgb(204,204,204); border-right: 1.0000pt solid rgb(204,204,204); mso-border-right-alt: 0.7500pt solid rgb(204,204,204); border-top: 1.0000pt solid rgb(204,204,204); mso-border-top-alt: 0.7500pt solid rgb(204,204,204); border-bottom: 1.0000pt solid rgb(204,204,204); mso-border-bottom-alt: 0.7500pt solid rgb(204,204,204); background: rgb(224,224,224);" valign="top" width="250">
                <p align="center" class="MsoNormal">
                    <span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">
                    <br />
                    </span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">症状自评</span><span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
                                <td style="width: 187.5000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; border-left: 1.0000pt solid rgb(204,204,204); mso-border-left-alt: 0.7500pt solid rgb(204,204,204); border-right: 1.0000pt solid rgb(204,204,204); mso-border-right-alt: 0.7500pt solid rgb(204,204,204); border-top: 1.0000pt solid rgb(204,204,204); mso-border-top-alt: 0.7500pt solid rgb(204,204,204); border-bottom: 1.0000pt solid rgb(204,204,204); mso-border-bottom-alt: 0.7500pt solid rgb(204,204,204); background: rgb(224,224,224);" valign="top" width="250">
                <p align="center" class="MsoNormal">
                    <span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">
                    <br />
                    </span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">自尊</span><span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
                                <td style="width: 187.5000pt; padding: 7.5000pt 7.5000pt 7.5000pt 7.5000pt; border-left: 1.0000pt solid rgb(204,204,204); mso-border-left-alt: 0.7500pt solid rgb(204,204,204); border-right: 1.0000pt solid rgb(204,204,204); mso-border-right-alt: 0.7500pt solid rgb(204,204,204); border-top: 1.0000pt solid rgb(204,204,204); mso-border-top-alt: 0.7500pt solid rgb(204,204,204); border-bottom: 1.0000pt solid rgb(204,204,204); mso-border-bottom-alt: 0.7500pt solid rgb(204,204,204); background: rgb(224,224,224);" valign="top" width="250">
                <p align="center" class="MsoNormal">
                    <span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">
                    <br />
                    </span><span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">社会支持</span><span style="font-family:微软雅黑;color:rgb(102,102,102);letter-spacing:0.0000pt;font-weight:normal;text-transform:none;font-style:normal;font-size:12.0000pt;mso-font-kerning:1.0000pt;"><o:p></o:p></span></p>
            </td>
                               <%-- <th class="text-center" rowspan="1" colspan="1" style="width: 20%"></th>
                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">症状自评</th>
                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">自尊</th>
                                <th class="text-center" rowspan="1" colspan="1" style="width: 20%;">社会支持</th>--%>
                            </tr>
                        </thead>
                        <tbody>
                            <tr role="row">
                               <%-- <th class="nf" scope="row">得分</th>
                                <td v-for="value in resultTable">{{value}}
                                </td>--%>
                                 <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">得分</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                 <td  v-for="value in resultTable" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">{{value}}</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                            </tr>
                            <tr role="row">
                                <%--<th class="nb" scope="row">状态</th>
                                <td v-for="(value,key) in resultTable">{{key}}
                                </td>--%>
                                 <td style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">状态</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                                 <td v-for="(value,key) in resultTable" style="width:186.9000pt;padding:7.5000pt 7.5000pt 7.5000pt 7.5000pt ;border-left:1.0000pt solid rgb(204,204,204);mso-border-left-alt:0.7500pt solid rgb(204,204,204);border-right:1.0000pt solid rgb(204,204,204);mso-border-right-alt:0.7500pt solid rgb(204,204,204);border-top:none;;mso-border-top-alt:0.7500pt solid rgb(204,204,204);border-bottom:1.0000pt solid rgb(204,204,204);mso-border-bottom-alt:0.7500pt solid rgb(204,204,204);" valign="top" width="249">
                    <p align="center" class="MsoNormal" style="margin-top:0.0000pt;margin-right:0.0000pt;margin-bottom:0.0000pt;margin-left:0.0000pt;mso-pagination:widow-orphan;text-align:center;vertical-align:top;mso-line-height-alt:12pt;">
                        <span style="mso-spacerun:'yes';font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;">{{key}}</span><span style="font-family:微软雅黑;color:rgb(102,102,102);font-weight:normal;font-size:12.0000pt;mso-font-kerning:0.0000pt;"><o:p></o:p></span></p>
                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="part mt50">
                <div class="tc title">
                    <span class="f16 white">结果描述</span>
                </div>
                <div class="main main3 mt20">
                    <dl class="f16" v-for="(value,key) in dimensionExplain">
                        <dt class="c333 pb10 mt30">
                            {{key}}</dt>
                        <dd class="c666">{{value}}</dd>
                    </dl>
                </div>
            </div>
            <div class="part m50" id="suggestionDiv" style="margin-top: 50px;">
                <div class="tc title">
                    <span class="f16 white">处理建议</span>
                </div>
                <div class="main main4 mt20" v-show="suggestion!=''">
                    <p class="c666" style="word-wrap: break-word;word-break: break-all;">{{suggestion}}</p>
                </div>
                 <div id="Divsuggestion" style="display:none"></div>
                <div class="main main4 mt20 text-center words" v-show="suggestion==''" id="suggestionHide">
                   
                    <textarea id="suggestion" rows="10" cols="100" maxlength="999" onkeyup="txtNameCheck(this,999)" onblur="txtNameCheck(this,999)"></textarea>
                </div>
            </div>
            <div class="row mt50 mb50 text-center" id="btnGroup">
                <div class="col-sm-6  col-xs-6 text-right" v-show="disposalState=='未处理'">
                    <button type="button" class="btn btn-sm x_btn f14 addSuggestion">确定</button>
                </div>
                <div class="col-sm-6  col-xs-6 text-left" id="cancelDiv">
                    <button type="button" class="btn btn-sm x_btn1 f14" onclick="goBack()">取消</button>
                </div>
            </div>
        </div>
        <!-- main结束 -->
    </div>
    <script src="/js/bootstrap-datepicker.js"></script>
    <script src="/js/bootstrap-datepicker.zh-CN.js"></script>
    <script src="../../JS/vue.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/word/FileSaver.js"></script>
        <script src="../../JS/zip/jquery.wordexportBatch.js"></script>
        <script src="../../JS/zip/ZipArchive.js"></script>
    <script type="text/javascript">
        var userRoleType = 0;
        var userID = 0;//当前系统用户ID
        var getUserRoleTypeParameter = {
            type: "get",
            dataType: "json",
            async: false,
            url: "/FunctionModular/AppointmentConsult/Ajax/AppointmentManagement.ashx?operationType=GetUserRoleTypeAndUserID",
            callBack: function (result) {
                userRoleType = result.UserRoleType;
                userID = result.UserID;
            }
        }
        //得到用户角色类型
        window.NewAJAX(getUserRoleTypeParameter);
        $(function () {
            if (userRoleType == 3) {
                $("#warningTd").hide();
                $("#suggestionHide").hide();
            }
        })
        var navName = '/FunctionModular/RiskWarning/PotentialRiskEstimate.aspx';
        var pageMark = sessionStorage.getItem("PageMark");
        if (pageMark == "查看结果") {
            navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
        }
        if (pageMark == "个体报告") {
            navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        }
        $("#page-wrapper").addClass("x_wjgy");
        $("#page-wrapper").addClass("x_dagl");
        var belongToCode = sessionStorage.getItem("BelongToCode");
        var reportInfo = JSON.parse(sessionStorage.getItem("ReportInfo"));
        if (reportInfo == undefined) {
            $.ajax({
                url: "Ajax/PotentialRiskEstimate.ashx",
                type: "post",
                data: { operationType: "GetPotentialRiskEstimateReportInfoByBelongToCode", belongToCode: belongToCode },
                async: false,
                dataType: "json",
                success: function (data) {
                    reportInfo = data;
                }
            })
        }
        var resultTable;
        var dimensionExplain;
        GetResultTable();
        GetDimensionExplain();
        changeClass();
        function GetResultTable() {
            $.ajax({
                url: "Ajax/PotentialRiskEstimate.ashx?operationType=GetResultTable",
                type: "post",
                async: false,
                dataType: "json",
                data: { belongToCode: belongToCode },
                success: function (data) {
                    resultTable = data;
                }
            })
        }
        function GetDimensionExplain() {
            $.ajax({
                url: "Ajax/PotentialRiskEstimate.ashx?operationType=GetDimensionExplain",
                type: "post",
                async: false,
                dataType: "json",
                success: function (data) {
                    dimensionExplain = data;
                }
            })
        }
        function GetSuggestion() {
            var suggestion;
            $.ajax({
                url: "Ajax/PotentialRiskEstimate.ashx?operationType=GetSuggestion",
                type: "post",
                dataType: "text",
                data: { belongToCode: belongToCode },
                async: false,
                success: function (data) {
                    suggestion = data;
                }
            })
            return suggestion;
        }
        function changeClass() {
            if (reportInfo.DisposalState != '未处理') {
                $('#cancelDiv').removeClass('col-sm-6  col-xs-6 text-left')
                $('#cancelDiv').addClass('col-sm-12  col-xs-12 text-center')
            }
        }
        var pr
        pr = new Vue({
            el: ".content",
            data: {
                reportInfo: reportInfo,
                resultTable: resultTable,
                dimensionExplain: dimensionExplain,
                suggestion: GetSuggestion(),
                disposalState: reportInfo.DisposalState
            }
        })
        $(document).on("click", ".addSuggestion", function () {
            if ($("#suggestion").val() == "" && userRoleType == 3) {
                //layer.alert("请输入建议");
                window.location.href = "/FunctionModular/HeartEvaluation/ViewResult.aspx";
                return;
            }
            if ($("#suggestion").val() == "") {
                if (pageMark == "查看结果") {
                    navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
                }
                if (pageMark == "个体报告") {
                    navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
                }
                window.location.href = navName;
                return;
            }
            $.ajax({
                url: "Ajax/PotentialRiskEstimate.ashx?operationType=AddSuggestion",
                type: "post",
                data: { suggestion: $("#suggestion").val(), belongToCode: belongToCode },
                dataType: "json",
                success: function (data) {
                    if (data.State) {
                        layer.msg("添加建议成功", { icon: 6, time: 2000 }, function () {
                            window.location.href = "PotentialRiskEstimate.aspx";
                        });
                    } else {
                        layer.msg(data.Data, { icon: 5, time: 2000 })
                    }
                }
            })
        })
        //返回
        function goBack() {
            if (pageMark == "查看结果") {
                navName = '/FunctionModular/HeartEvaluation/ViewResult.aspx';
            }
            if (pageMark == "个体报告") {
                navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
            }
            window.location.href = navName;
        }
        //判断名称格式与长度
        function txtNameCheck(data, length) {
            var txt = $("#suggestion").val();
            var le = parseInt(length);
            if (txt.length > le) {
                txt = txt.substring(0, le);
                $("#suggestion").val(txt);
            }
        }
        $(document).on("click", "#potentialRiskEstimateReportExport", function () {
            $("#Divsuggestion").show();
            var suval = $("#suggestion").val();
            if (suval == null || suval == "")
            {
                suval = "无";
            }
            $("#Divsuggestion").text(suval);
            
            $("#suggestion").remove();
           
            $("#suggestionHide").hide();
            $("#btnGroup").hide();
            $("#potentialRiskContent").wordExport("潜在风险评估报告");
            $("#suggestionHide").show();
            $("#btnGroup").show();
            $("#Divsuggestion").hide();
            var html=" <textarea id=\"suggestion\" rows=\"10\" cols=\"100\" maxlength=\"999\" onkeyup=\"txtNameCheck(this,999)\" onblur=\"txtNameCheck(this,999)\"></textarea>";
            $("#suggestionHide").append(html);
            
        })
    </script>
</asp:Content>
