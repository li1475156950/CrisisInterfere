<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="AddCrisisInterfereSolution.aspx.cs" Inherits="CrisisInterfere.FunctionModular.CrisisInterfereSolution.AddCrisisInterfereSolution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="/Js/UEditor/third-party/webuploader/webuploader.css" rel="stylesheet" />
<link href="/Js/plugins/layer/skin/layer.css" rel="stylesheet" />
    <div style="overflow-x:hidden">
    <form class="form-horizontal m-t" id="signupForm">

        <div class="form-group">
            <label class="col-md-2 control-label" style="text-align:right">方案标题:</label>

            <div class="col-md-6" style="text-align:left">
                <input type="text" id="solutionTitle" name="sTName" placeholder="请输入解决方案标题" maxlength="30" class="form-control">
                <span style="color:red" id="spaname"></span>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label" style="text-align:right">方案分类:</label>

            <div class="col-sm-6" style="text-align:left">
                <select id="solutionType" class="form-control">
                    <option value="1">成长教育</option>
                    <option value="2">挫折教育</option>
                    <option value="3">就业指导教育</option>
                    <option value="4">理想信念教育</option>
                    <option value="5">情感教育</option>
                    <option value="6">全人教育</option>
                    <option value="7">生涯辅导教育</option>
                    <option value="8">心理健康教育</option>
                    <option value="9">择业观教育</option>
                    <option value="10">其他</option>
                </select>
                <span style="color:red" id="spasel"></span>
            </div>
        </div>
        <div class="form-group">
        <div class="row" style="margin:0px auto;margin-top:15px">
            <label class="col-md-2 control-label" style="text-align:right">方案简介:</label>
            <div class="col-md-8">
                <textarea id="editor" class="col-md-12" style="height:300px;padding-left:0"></textarea>
            </div>

        </div>
        <div class="form-group">
            <div style="text-align:center;margin-top:15px;" class="col-md-6 col-sm-offset-3">
                <button class="btn btn-sm x_btn f14" id="addCIS" type="button">保存</button>
                <button class="btn btn-sm x_btn f15 cancelAdd" type="button" style="margin-left:20px">取消</button>
            </div>
        </div>
    </form>
</div>
    <script src="../../JS/validate/jquery.validate.min.js"></script>
    <script src="../../JS/validate/messages_zh.min.js"></script>
    <script src="/Js/UEditor/ueditor.config.js"></script>
<script src="/Js/UEditor/ueditor.all.min.js"></script>
<script src="/Js/UEditor/lang/zh-cn/zh-cn.js"></script>
<script src="/Js/layer.js"></script>
<script>
    var navName = '/FunctionModular/CrisisInterfereSolution/CrisisInterfereSolution.aspx';
    var isSave = 0;
    var CrisisInterfereSolutionEntity = {};
    UE.getEditor('editor');
    $.validator.setDefaults({
        highlight: function (element) {
            $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
        },
        success: function (element) {
            element.closest('.form-group').removeClass('has-error').addClass('has-success');
        },
        errorElement: "span",
        errorPlacement: function (error, element) {
            if (element.is(":radio") || element.is(":checkbox")) {
                error.appendTo(element.parent().parent().parent());
            } else {
                error.appendTo(element.parent());
            }
        },
        errorClass: "help-block m-b-none",
        validClass: "help-block m-b-none"
    });
    var icon = "<i class='fa fa-times-circle'></i> ";
    $("#signupForm").validate({
        rules: {
            sTName: {
                required: true,
                maxlength: 30
            }

        },
        message: {
            sTName: {
                required: icon + "方案名称",
                maxlength: icon + "最多输入30个字符"
            }
        },
        submitHandler: function (form) {
            isSave += 1;
            if (isSave > 1) {
                return;
            }
            if (UE.getEditor('editor').getContent() == "") {
                layer.alert("请输入方案简介", {
                });
                isSave = 0;
                return;
            }
            CrisisInterfereSolutionEntity.CISTitle = $("#solutionTitle").val().trim();
            CrisisInterfereSolutionEntity.CISContent = UE.getEditor('editor').getContent();
            CrisisInterfereSolutionEntity.STID = $("#solutionType").find("option:selected").val();
            $.ajax({
                url: "Ajax/CrisisInterfereSolution.ashx",
                type: "post",
                data: { operationType: "AddCrisisInterfereSolution", entityStr: JSON.stringify(CrisisInterfereSolutionEntity) },
                dataType: "json",
                async: false,
                success: function (data) {
                    if (data.State) {
                        layer.msg("保存成功!", { time: 2000, icon: 6 }, function () {
                            window.location.href = "CrisisInterfereSolution.aspx";
                        });
                    } else {
                        isSave = 0;
                    }
                }
            })
        }
    })
    $(document).on("click", "#addCIS", function () {
        if ($("#signupForm").valid()) {
            $("#signupForm").submit();
        }
    })
    $(document).on("click", ".cancelAdd", function () {
        window.location.href = "CrisisInterfereSolution.aspx";
    })
</script>
</asp:Content>
