<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ShowRights.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.ShowRights" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <div>
        <div class="row">
            <div class="col-md-12 col-xs-6">
                <button class="btn btn-info pull-right" onclick="BackBefore()"><i class="fa fa-arrow-left"></i>返&nbsp;回</button>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div id="funPanel" class="panel-group">

                    
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-offset-5"><button class="btn btn-info" onclick="AddRoleFun()"><i class="fa fa-save"></i>保&nbsp;存</button>&nbsp;&nbsp;<button class="btn btn-info"><i class="fa fa-cancel"></i>取&nbsp;消</button></div>
        </div>
    </div>
    <script>
        LoadFirstFun();
        function LoadFirstFun() {
            $.ajax({
                url: "Ajax/ShowRights.ashx?operationType=LoadFirstFun",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (index, val) {
                        var firstFuns = "<div class='row'>" +
                            "<div class='col-md-12'>" +
                                "<div class='panel panel-default'>" +
                                    "<div class='panel-heading' role='tab' id='headingOne'>" +
                                        "<h4 class='panel-title'>" +
                                            "<a data-toggle='collapse' data-parent='#accordion' href='#" + val["Fun_ID"] + "' aria-expanded='true' aria-controls='collapseOne'>" +
                                                val["Fun_Name"] +
                        "</a>" +
                        "<input data-id=" + val["Fun_ID"] + " type='checkbox' class='allCheck col-md-offset-1'/>" +
                    "</h4>" +
                "</div>" +
                "<div id=" + val["Fun_ID"] + " class='panel-collapse collapse in 'role='tabpanel' aria-labelledby='headingOne'>" +
                    "<div data-append-id=" + val["Fun_ID"] + " class='panel-body'>" +

                    "</div>" +
                "</div>" +
            "</div>" +
        "</div>" +
    "</div>";
                        $("#funPanel").append(firstFuns);
                    });
                    LoadSecondFun();
                }
            })
        }
        function LoadSecondFun() {
            $.ajax({
                url: "Ajax/ShowRights.ashx?operationType=LoadSecondFun",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (index, val) {
                        var secondFun = "<div class='row'>" +
                                                "<div class='col-md-12'>" +
                                                    "<div data-append-id=" + val["Fun_ID"] + " class='panel panel-default'>" +
                                                        "<div class= 'pull-left col-md-1 text-right'>" +
                        val["Fun_Name"] + ":"
                        "</div>" +

                   " </div>" +
                "</div>" +
            "</div>";
                        $("[data-append-id=" + val["Fun_ParentID"] + "]").append(secondFun);
                    })
                    LoadThridFun();
                }
            })
        }
        function LoadThridFun() {
            $.ajax({
                url: "Ajax/ShowRights.ashx?operationType=LoadThirdFun",
                dataType: "json",
                success: function (data) {
                    $.each(data, function (index, val) {
                        var thirdFun = "<div class= 'pull- right col-md-1 col-xs-5'>" +
                                                            "<input class='cancelAllCheck' data-id=" + val["Fun_ID"] + " type='checkbox' />" + val["Fun_Name"] + "" +
                                                        "</div>";
                        $("[data-append-id=" + val["Fun_ParentID"] + "]").append(thirdFun);
                    })
                }
            })
        }
        LoadFun();

        var roleID;
        $(document).on("click", ".allCheck", function () {
            var arryCheck = $(this).parent().parent().parent().find("input:gt(0)");
            for (var i = 0; i < arryCheck.length; i++) {
                arryCheck[i].checked = $(this)[0].checked;
            }
        })
        $(document).on("click", ".cancelAllCheck", function () {
            var arrCheck = $(this).parent().parent().parent().parent().parent().parent().parent().find("input:gt(0)"); 
            var len = arrCheck.length;
            var isAllCheck = true;
            if(len==1)
            {
                return;
            }
            else if (len == 2) {
                var alCheck = $(this).parent().parent().parent().parent().parent().parent().parent().find("input:eq(0)");
                alCheck.checked = $(this)[0].checked;
                return;
            }
            else
            {
                for (var i = 0; i < arrCheck.length; i++) {
                    if(arrCheck[i].checked==false)
                    {
                        isAllCheck = false;
                        break;
                    }
                    continue;
                }
                var alCheck = $(this).parent().parent().parent().parent().parent().parent().parent().find("input:eq(0)")
                alCheck[0].checked = isAllCheck;
            }
        })

        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]); return null;
        }
        function AddRoleFun()
        {
            var arrayCheck = $('input:checkbox[class=cancelAllCheck]:checked');
            var arrayRoleID = [];
            for (var i = 0; i < arrayCheck.length; i++) {
                var data = $(arrayCheck[i]).attr("data-id");
                alert(data);
                arrayRoleID.push(data);
            }
            $.ajax({
                url: "Ajax/BasicSetting_Role.ashx?operationType=AddRoleFun",
                type: "GET",
                dataType: "text",
                data: { arrayRoleID: JSON.stringify(arrayRoleID),roleID: roleID},
                success: function (data) {
                    if (data) {
                        layer.alert('修改成功!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        }
            );
                    }
                    else
                    {
                        layer.alert('修改失败!', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        }
            );
                    }
                }
            })
        }
        function LoadFun()
        {
            roleID = GetQueryString("roleID");
            $.ajax({
                url: "Ajax/BasicSetting_Role.ashx?operationType=LoadRoleFun",
                type: "GET",
                dataType: "json",
                data: { roleID: roleID },
                success: function (data) {
                    $.each(data, function (index, item) {
                        
                        $("[data-id=" + item + "]")[0].checked = true;
                    })
                }
            })
        }
        function BackBefore()
        {
            window.location.href="RoleManagement.aspx"
        }
    </script>
</asp:Content>
