<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AddTemplate.aspx.cs" Inherits="CrisisInterfere.FunctionModular.PersonalReport.AddTemplate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">  
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
   <%-- <script src="../../JS/jquery-2.0.3.min.js"></script>--%>
      <div class="row"><div class="col-md-12 col-xs-5 "><div id="useradds"   > </div></div></div>
                <div style="margin-top:20px;text-align:center"><button class="btn btn-primary btn-sm" id="Save" onclick="Save()">保存</button></div>    
    <script type="text/javascript">
        var navName = '/FunctionModular/PersonalReport/PersonalReport.aspx';
        LoadUserInfo();
        function LoadUserInfo() {
            $.ajax({
                url: "Ajax/AddTemplate.ashx?operationType=LoadTemplate",
                dataType: "json",
                async: false,
                success: function (data) {
                 
                    if (data != null && data != "" && data != undefined) {
                        var json = JSON.parse(data["_addfiletemplate"]);
                        $.each(json, function (name, item) {
                            var tr = "";
                           
                            if (item["Value"] == true || item["Value"]=="True") {
                                tr += "<div class='col-sm-2 UserID'  style='margin-top:20px;' ><span><input type='checkbox'  data-name='value' checked='checked' /></span>";
                            } else {
                                tr += "<div class='col-sm-2 UserID'  style='margin-top:20px;' ><input type='checkbox' data-name='value' />";
                            }
                            tr += "<span data-name='field'>" + item["Field"] +"</span>";
                            //tr += "</div>";
                            $("#useradds").append(tr);
                        });
                    }
                }

            })
        }
        //保存
        function Save()
        {
            var strJson = [];
            /*获取用户自定义信息json串 */
            var fields = $("[data-name=field]");
            var value = $("[data-name=value]");
            var U_Consult = $("#U_Consult").val();
            var GoodField = $("#GoodField").val();
            var strJson = [];
            if (fields.length > 0) {
                for (var i = 0; i < fields.length; i++) {
                   
                    var values = false;
                  
                    if ($(value[i]).is(':checked'))
                    {
                        values = true;
                    }
                    if ($(fields[i]).val() == "" && $(fields[i]).text() != "") {
                        var field = $(fields[i]).text().replace(":", "");
                       
                        var str = { 'Field': field, 'Value': values };
                    }
                    if ($(fields[i]).val() != "") {
                        var field = $(fields[i]).val().replace(":", "");
                        var str = { 'Field': field, 'Value': values };
                    }
                    strJson.push(str);
                }
            }
            $.ajax({
                url: "Ajax/AddTemplate.ashx?operationType=Save",
                dataType: "json",
                data:{ strJson: JSON.stringify(strJson),},
                async: false,
                success: function (data) {
                    layer.msg('保存成功！', { icon: 1 });
                    setTimeout(function () {
                        window.location.href = "PersonalReport.aspx";
                    }, 2000);
                 
                  
                }
            });
        
        }
    </script>
</asp:Content>
