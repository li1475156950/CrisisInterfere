<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="CrisisInterfere.FunctionModular.HeartEvaluation.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <!-- PAGE LEVEL STYLES -->

    <%--    <link href="../../CSS/bootstrap-switch.css" rel="stylesheet" />--%>
    <link href="../../assets/css/chosen.css" rel="stylesheet" />


    <div class="col-lg-8">
        <div class="make-switch" data-on="primary" data-off="info">
            <input type="checkbox" checked="checked" />
        </div>

        <div class="make-switch" data-on="info" data-off="success">
            <input type="checkbox" checked="checked" />
        </div>

        <div class="make-switch" data-on="success" data-off="warning">
            <input type="checkbox" checked="checked" />
        </div>

        <div class="make-switch" data-on="warning" data-off="danger">
            <input type="checkbox" checked="checked" />
        </div>

        <div class="make-switch" data-on="danger" data-off="default">
            <input type="checkbox" checked="checked" />
        </div>

        <div class="make-switch" data-on="default" data-off="primary">
            <input type="checkbox" checked="checked" />
        </div>

        <select class="chosen-select" style="width: 170px;" id="Sel_AmountType3">
        </select>






        <thead>
            <tr>
                <th style="width: 80%">维度名称</th>
                <th style="width: 20%">操作</th>
            </tr>
        </thead>
        <tbody>
            <tr id="WD_14786817054316" pid="">
                <td>维度一</td>
                <td></td>
            </tr>
            <tr id="TG_14784890275520^WD_14786817054316" pid="WD_14786817054316">
                <td>我的胃口很好。</td>
                <td>&nbsp;</td>
            </tr>
            <tr id="WD_14786817146653" pid="">
                <td>维度二</td>
                <td></td>
            </tr>
            <tr id="TG_14784890278801^WD_14786817146653" pid="WD_14786817146653">
                <td>我早上起来的时候，多半觉得睡眠充足，头脑清醒。</td>
                <td>&nbsp;</td>
            </tr>
            <tr id="WD_14786817335074" pid="">
                <td>维度三</td>
                <td></td>
            </tr>
            <tr id="TG_14784890282072^WD_14786817335074" pid="WD_14786817335074">
                <td>我的手脚经常是很暖和的。</td>
                <td>&nbsp;</td>
            </tr>
            <tr id="WD_14786817614014" pid="">
                <td>维度四</td>
                <td></td>
            </tr>
            <tr id="TG_14784890275520^WD_14786817614014" pid="WD_14786817614014">
                <td>我的胃口很好。</td>
                <td>&nbsp;</td>
            </tr>
            <tr id="WD_14786817810504" pid="">
                <td>维度五</td>
                <td></td>
            </tr>
            <tr id="TG_14784890291905^WD_14786817810504" pid="WD_14786817810504">
                <td>恶心和呕吐的毛病使我苦恼。</td>
                <td>&nbsp;</td>
            </tr>
            <tr id="TG_14784890295196^WD_14786817810504" pid="WD_14786817810504">
                <td>我有胃酸过多的毛病，一星期要犯好几次。</td>
                <td>&nbsp;</td>
            </tr>
        </tbody>



    </div>


    <!-- END GLOBAL SCRIPTS -->

    <%--    <script src="../../JS/bootstrap-switch.min.js"></script>--%>
    <script src="../../JS/chosen.jquery.min.js" charset="gb2312"></script>
    <script>

        InitSel_AmountType3();
        /*-----加载维度划分模块下的下拉列表-----*/
        function InitSel_AmountType3() {
            $("#Sel_AmountType3").empty();
            $.ajax({
                type: "POST",
                url: "Ajax/HeartEvaluationCustomAdd.ashx",
                data: {
                    Remark: "InitAD",
                    ACode: "LB_14784883686920"
                },//要执行查询的数据参数
                success: function (msg) {
                    if (msg != "") {
                        $("#Sel_AmountType3").append("<option value='0'>请选择维度</option>");
                        $.each(eval(msg), function (index, item) {

                            $("#Sel_AmountType3").append("<option value='" + item.Value + "'>" + item.Text + "</option>");
                        });

                        $(".chosen-select").chosen();
                    } else {
                        $("#Sel_AmountType3").append("<option value='0'>暂无维度可选</option>");
                    }
                }
            });
        }
    </script>

</asp:Content>
