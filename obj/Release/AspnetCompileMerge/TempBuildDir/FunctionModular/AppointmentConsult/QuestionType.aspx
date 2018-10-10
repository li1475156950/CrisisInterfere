<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="QuestionType.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.QuestionType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">

    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <link href="../../CSS/bootstrapValidator.min.css" rel="stylesheet" />
    <link href="../../CSS/x_yuyueguanli.css" rel="stylesheet" />
    <script src="../../JS/bootstrapValidator.min.js"></script>
    <script src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../../JS/layer.js"></script>
    <script src="../../JS/ExtendJS.js"></script>
    <script src="ViewModel/QuestionTypeViewModel.js"></script>

    <%--    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li>预约咨询</li>
                <li>参数设置</li>
            </ol>
        </div>
    </div>--%>

    <!-- /. ROW  -->
    <style>
        html {
            background:#f1f1f1
        }
        #tableGrid > tbody > tr > td{
            word-wrap:break-word;
            word-break:break-all;
        }
    </style>
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: right;">
            <button class="btn btn-sm pull-right" style="background-color:white;margin-bottom:15px;" id="btnAdd" name="btnAdd">+ 新建问题类型</button>
        </div>
    </div>

    <div class="row x_table_all">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="tableGrid" width="100%">
                    <thead>
                        <tr>
                            <th class="text-center" style="width:30%;">问题类型名称</th>
                            <th class="text-center" style="width:50%">问题描述</th>
                            <th class="text-center" style="width:20%">操作</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade x_tanchuang" id="editModal" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 35%;">

                <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="margin-left: -2%; margin: 0px 5px;">
                    ×
                </button>
                <h4 class="modal-title text-center xia_title" id="hTitle">新增部门
                </h4>

                <div class="modal-body">
                    <form role="form" id="formInfo" method="post" class="form-horizontal ">
                        <div class="form-group form_control_bottom mt30">
                            <label class="col-sm-3  col-xs-4 control-label text-right"><span class="juse">*</span>问题名称：</label>
                            <div class="col-sm-7  col-xs-8">
                                <input type="text" maxlength="30" class="form-control" name="txtName" id="txtName" onkeyup="checkLength(this,30)" onblur="checkLength(this,30)"/>
                            </div>
                        </div>
                        <div class="form-group form_control_bottom">
                            <label class="col-sm-3  col-xs-4 control-label text-right">问题描述：</label>
                            <div class="col-sm-7  col-xs-8">
                                <textarea id="txtDescribe" name="txtDescribe" class="form-control" maxlength="500"
                                     style="width: 100%; margin-top: 0px; margin-bottom: 0px; height: 200px;"></textarea>
                            </div>
                        </div>

                        <div class="form-group" style="text-align: center;">
                            <button type="button" id="btSubmit" class="btn btn-sm x_btn">
                                保存
                            </button>
                            <button type="button" class="btn btn-sm x_btn1" id="cancel">
                                取消
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        //判断名称格式与长度
        function checkLength(data, length) {
            var obj = data.getAttribute('name');
            var txt = $("[name=" + obj + "]").val();
            var le = parseInt(length);
            if (txt.length > le) {
                var a = $(this).find("[data-bv-for=" + obj + "]");
                txt = txt.substring(0, le);
                $("[name=" + obj + "]").val(txt);
                $("small[data-bv-for=" + obj + "]").css('display', 'none');
                $("[name=" + obj + "]").css("border-color", "#2b542c");
                $('[data-bv-icon-for=' + obj + ']i').css('display', 'none');
            }
        }
    </script>
</asp:Content>
