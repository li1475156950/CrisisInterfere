<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="FunctionList.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.FunctionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../assets/skin/layer.css" rel="stylesheet" />
    <script src="../../JS/layer.js"></script>
    <style type="text/css">
        .Strong {
            width: 136px;
        }

        .headstyle {
            margin-bottom: 0px;
            padding: 10px;
            background-color: #f5f5f5;
            border: 0;
            color: #438eb9;
        }


        .profile-info-name {
            background-color: #f5f5f5;
            color: #438eb9;
            border-top: 1px solid;
            border-color: #ddd;
        }
    </style>
    <div>
        <div class="row">
            <div class="col-md-12">

                <%--          <h1 class="page-header">维度量表添加<small>量表管理</small>
            </h1>--%>
                <ol class="breadcrumb">
                    <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">基础设置</a></li>
                    <li><a href="rolemanagement.aspx">角色管理</a></li>
                    <li><a href="#">编辑权限</a></li>
                </ol>
            </div>
        </div>
        <div class="row" style="margin-bottom: 5px;">
            <div class="col-md-12 col-xs-12">
                <div class="col-md-3 col-xs-6">
                    <input data-id="0" type="checkbox" class="col-md-offset-1" id="AllID" />全选
                </div>


            </div>
        </div>

        <div class="row" id="allCheck">
            <div class="col-md-12">
                <div id="funPanel" class="panel-group">

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default" id="Boday">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--   /www--%>
    </div>
    <%--</div>
        </div>--%>
    <div class="row">
        <div class="col-md-12" style="text-align: center">
            <button class="btn btn-sm" onclick="AddRoleFun()" style="border: 1px solid orange; color: orange;">保&nbsp;存</button>&nbsp;&nbsp;
            <button class="btn btn-sm" onclick="BackBefore()" style="color: white"><i class="fa fa-cancel"></i>取&nbsp;消</button>
        </div>
    </div>

    <script>
        var navName = '/FunctionModular/BasicSetting/RoleManagement.aspx';
        var Sts = '';
        var Ends = '';
        var bools = '';
        var current = '';
        var Roletype = '';
        huoqu();
        LoadFirstFun();
        LoadFun();
        var IScheck = 0;
        var ISchecks = 0;
        function LoadFirstFun() {
            var IsSecondFun = 0;
            $.ajax({
                url: "Ajax/ShowRights.ashx?operationType=LoadFirstFun",
                async: false,
                dataType: "json",
                success: function (data) {
                    $.each(data, function (index, val) {

                        var Fun_Name = val["Fun_Name"];
                        var Fun_ID = val["Fun_ID"];
                        if (Roletype == 3) {
                            if (Fun_Name == "心理测评" || Fun_Name == "回收站" || Fun_Name == "预约咨询" || Fun_Name == "危机解决方案") {
                                IsSecondFun = 1;
                                FirstHtml(index, Fun_ID, Fun_Name);
                            }
                        }
                        else {
                            IsSecondFun = 1;
                            FirstHtml(index, Fun_ID, Fun_Name);
                        }
                    });
                    if (IsSecondFun == 1) {
                        LoadSecondFun();
                    }
                }
            })
        }
        function FirstHtml(indexs, Fun_ID, Fun_Name) {
            var firstFuns =
                              "<div class='first' id='"+Fun_ID+"'>" +
                                  "<div   class='panel-heading profile-info-name' role='tab' id='headingOne" + indexs + "'>" +
                                      "<h4 class='panel-title'>" +
                                          "<a data-toggle='collapse' data-parent='#accordion' href='#" + Fun_ID + "' aria-expanded='true' aria-controls='collapseOne'>" +
                                             Fun_Name +
                      "</a>" +
                      "<input data-id=" + Fun_ID + " type='checkbox' class='allCheck col-md-offset-1'/>" +
                  "</h4>" +
              "</div>" +
              "<div id=" + Fun_ID + " class='panel-collapse collapse in 'role='tabpanel' aria-labelledby='headingOne'>" +
                  "<div data-append-id=" + Fun_ID + " class='panel-body' style='font-size:12px;'>" +
                  "<div class='col-md-12'>" +

                  "</div>" +
                  "</div>" +
              "</div>" +
          "</div>";
            $("#Boday").append(firstFuns);
        }



        function LoadSecondFun() {
            var IsThridFun = 0;
            $.ajax({
                url: "Ajax/ShowRights.ashx?operationType=LoadSecondFun",
                dataType: "json",
                async: false,
                success: function (data) {
                    $.each(data, function (index, val) {
                        var Fun_Name = val["Fun_Name"];
                        var Fun_ID = val["Fun_ID"];
                        var Fun_ParentID = val["Fun_ParentID"];
                        if (Roletype == 1) {
                            if (val["Fun_Name"] != "个体咨询档案" || val["Fun_Name"] != "团体咨询档案") {
                                IsThridFun = 1;
                                SeconFunhtml(Fun_ID, Fun_Name, Fun_ParentID, 'Noname');

                            }
                        } else if (Roletype == 2) {
                            if (val["Fun_Name"] == "部门管理" || val["Fun_Name"] == "角色管理" || Fun_Name == '我的预约') {
                                IsThridFun = 0;

                            } else {
                                IsThridFun = 1;
                                if (Fun_Name == '预约管理') {
                                    SeconFunhtml(Fun_ID, Fun_Name, Fun_ParentID, 'yyname');
                                } else if (Fun_Name == "个体咨询档案" || Fun_Name == "团体咨询档案" || Fun_Name == "咨询统计" || Fun_Name == "参数设置" || Fun_Name == "案例分析") {
                                    SeconFunhtml(Fun_ID, Fun_Name, Fun_ParentID, 'yyname1');
                                }
                                else {
                                    SeconFunhtml(Fun_ID, Fun_Name, Fun_ParentID, 'Noname');
                                }
                            }
                        } else if (Roletype == 3) {
                            if (val["Fun_Name"] == "我的测验" || val["Fun_Name"] == "查看结果" ||  val["Fun_Name"] == "我的预约" || val["Fun_Name"] == "回收站"||val["Fun_Name"] == "危机解决方案") {
                                IsThridFun = 1;
                                SeconFunhtml(Fun_ID, Fun_Name, Fun_ParentID, 'Noname');

                            }
                        }
                    });
                }
            })
        }

        function SeconFunhtml(Fun_ID, Fun_Name, Fun_ParentID, ParentName) {
            var secondFun = "<div class='col-md-12 col-xs-5' style='width:123px;' data-append-id=" + Fun_ID + " >" +
                            " <div class='col-md-12 col-xs-12 Strong '>" +
                            "<input data-parentID = '"+Fun_ParentID+"' class='SecondCheck " + ParentName + "' data-id=" + Fun_ID + " type='checkbox' data-name='"
                            + ParentName + "'/> <strong>" + Fun_Name + "</strong></div>" + "</div>";
            $("[data-append-id=" + Fun_ParentID + "]").append(secondFun);
        }
        var roleID;
        $(document).on("click", "#AllID", function () {
            if (this.checked) {

                $("input:checkbox").prop('checked', true)

            } else {

                $("input:checkbox").prop('checked', false)
            }

        });
        $(document).on("click", ".allCheck", function () {
            var arrayCheck = $("#" + $(this).attr("data-id")).parent().find(".allCheck")
            var secondArrayCheck = $("#" + $(this).attr("data-id")).find(".SecondCheck");
            var secondCheckedStatus = $("#" + $(this).attr("data-id")).find(".allCheck")[0].checked;
            var allCheckStatus = true;
            for (var i = 0; i < arrayCheck.length; i++) {
                if (!arrayCheck[i].checked) {
                    allCheckStatus = false;
                    break;
                }
            }
            
            for (var i = 0; i < secondArrayCheck.length; i++) {
                $(secondArrayCheck[i])[0].checked = secondCheckedStatus;
            }
            $("#AllID")[0].checked = allCheckStatus;


        });
        $(document).on("click", ".SecondCheck", function () {

            var secondArrayCheck = $("#"+$(this).attr("data-parentID")).find(".SecondCheck");
            var secondCheckStatus = true;
            for (var i = 0; i < secondArrayCheck.length; i++) {
                if (!secondArrayCheck[i].checked) {
                    secondCheckStatus = false;
                }
            }
            $("#" + $(this).attr("data-parentID")).find(".allCheck")[0].checked = secondCheckStatus;
            var firstArrayCheck = $("#" + $(this).attr("data-parentID")).parent().find(".allCheck");
            var firstArrayStatus = true;
            for (var i = 0; i < firstArrayCheck.length; i++) {
                if (!firstArrayCheck[i].checked) {
                    firstArrayStatus = false;
                }
            }

            $("#AllID")[0].checked = firstArrayStatus;


        });
        IsAllCheck();
        //界面加载时，如果权限都被勾选，则选中全选按钮
        function IsAllCheck() {
            var arrayCheck = $('#AllID').parent().parent().parent().parent().find("input");
            var allCheckStatus = true;
            for (var i = 0; i < arrayCheck.length; i++) {
                var id = arrayCheck[i].getAttribute('id');
                if (!arrayCheck[i].checked && id != "AllID") {
                    allCheckStatus = false;
                    break;
                }
            }
            $("#AllID")[0].checked = allCheckStatus;
        }

        function GetQueryStrings(name) {

            var urlarr = window.location.href;
            var urlar = urlarr.split('?');
            var urla = urlar[1].split('/');
            var url = urla[0].split("=");

            var rs = url[1];
            return rs;
            //var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            //var r = window.location.search.substr(1).match(reg);
            //if (rs != null) return unescape(r[2]); return null;
        }
        function AddRoleFun() {
            var Isyy = 0;
            var arrayCheck = $('.SecondCheck');
            var arrayRoleID = [];
            for (var i = 0; i < arrayCheck.length; i++) {
                if ($(arrayCheck[i])[0].checked) {
                    var data = $(arrayCheck[i]).attr("data-id");
                    arrayRoleID.push(data);
                }
            }
            $.ajax({
                url: "Ajax/BasicSetting_Role.ashx?operationType=AddRoleFun",
                type: "GET",
                dataType: "text",
                data: { arrayRoleID: JSON.stringify(arrayRoleID), roleID: GetQueryStrings("roleID") },
                success: function (data) {
                    if (data) {
                        layer.msg('保存成功！', { time: 2000, icon: 6 }, function () {
                            window.location.href = "/FunctionModular/BasicSetting/RoleManagement.aspx"
                        });
                    }
                    else {
                        layer.alert('保存失败！', {
                            skin: 'layui-layer-lan', //样式类名
                            closeBtn: 0
                        }
            );
                    }
                }
            })
        }

        function LoadFun() {
            roleID = GetQueryStrings("roleID");
            $.ajax({
                url: "Ajax/BasicSetting_Role.ashx?operationType=LoadRoleFun",
                type: "GET",
                dataType: "json",
                async: false,
                data: { roleID: roleID },
                success: function (data) {
                    $.each(data, function (index, item) {
                        $("input:checkbox[data-id=" + item + "]").attr('checked', true);
                    });
                    var firstCheckArray = $(".first");
                    var isAllCheck = true;
                    for (var i = 0; i < firstCheckArray.length; i++) {
                        var isCheck = true;
                        var secondCheckArray = $(firstCheckArray[i]).find(".SecondCheck");
                        for (var j = 0; j < secondCheckArray.length; j++) {
                            if (!$(secondCheckArray[j])[0].checked) {
                                isCheck = false;
                            }
                        }
                        $(firstCheckArray[i]).find(".allCheck").attr('checked', isCheck);
                    }
                    for (var j = 0; j < firstCheckArray.length; j++) {
                        if (!$(firstCheckArray[j]).find(".allCheck").checked) {
                            isAllCheck = false;
                        }
                    }
                    $("#AllID").attr("checked", isAllCheck)
                }
            })
        }


        function huoqu() {
            var urlarr = window.location.href;
            var urlar = urlarr.split('?');
            var urla = urlar[1].split('/');
            var url = urla[1].split("=");
            var urlb = urla[2].split("=");
            var urlc = urla[3].split("=");
            var urld = urla[4].split("=");
            var urle = urla[5].split("=");

            var Startindexchu = url[1];
            var Endindexwei = urlb[1];
            var boolcs = urlc[1];
            var curr = urld[1]
            Roletype = urle[1];
            Sts = Startindexchu;
            Ends = Endindexwei;
            bools = boolcs;
            current = curr
        }


        function BackBefore() {
            window.location.href = "RoleManagement.aspx?Startindex=" + Sts + "/Endindex=" + Ends + "/bools=" + bools + "/current=" + current;
        }
    </script>
</asp:Content>
