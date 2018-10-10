<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Maintain.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BaseTableMaintain.Maintain" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <script src="../../JS/jquery.form.js"></script>
    <script src="../../JS/layer.js"></script>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#" style="color: #666;">统计分析基础数据表维护</a></li>
            </ol>

        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <a class="btn btn-bm btn-sm" data-toggle="modal" data-target="#addRole" style="width: 100%">查询</a>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <a class="btn btn-bm btn-sm" data-toggle="modal" data-target="#addRole" style="width: 100%">模板</a>
        </div>
        <div class="col-md-4 col-sm-12 col-xs-12" style="margin-top: 10px;">
            <a class="btn btn-bm btn-sm" data-toggle="modal" data-target="#addRole" onclick="ImportClick();" style="width: 100%">导入</a>
        </div>
    </div>
    <div class="row" style="margin-top: 20px;">

        <div class="table-responsive" style="overflow: auto;" id="JT_Source">
        </div>

    </div>





    <!-- 常模-解释说明添加  -->
    <div class="modal fade" id="ImportModal" tabindex="-1" role="dialog" aria-labelledby="ImportModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="margin-top: 5%; width: 100%">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">
                        ×
                    </button>
                    <h4 class="modal-title" id="">选择模板
                    </h4>
                </div>
                <div class="modal-body">
                    <form id="form1" class="form-horizontal" role="form" method="post" enctype="multipart/form-data">
                        <div class="row">

                            <div class="col-md-8">
                                <input id="fileUpload" name="fileUpload" type="file" style="display: none" />

                                <input id="fileText" type="text" disabled="disabled" class="form-control" />
                            </div>
                            <div class="col-md-4">
                                <div class="col-md-6">
                                    <button type="button" class=" btn btn-greens" onclick="$('#fileUpload').click()">浏览</button>
                                </div>
                                <div class="col-md-6">
                                    <button type="button" class=" btn btn-bm" id="upload" name="upload" onclick="uploadimg();">导入</button>
                                </div>
                            </div>


                        </div>

                    </form>
                </div>
                <div class="modal-footer">
                    <label style="color: #ccc8c8">(按 ESC 键 退 出)</label>
                    <button type="button" class="btn btn-default"
                        data-dismiss="modal" onclick="Quxiao()">
                        关闭
                    </button>

                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

    <script>
        var navName = '/FunctionModular/BaseTableMaintain/Maintain.aspx';
        function ImportClick() {

            $("#ImportModal").modal('show');
        }

        /*----------文件上传----------*/
        $("#fileUpload").change(function () {
            var Nurl = getPath(this);
            $("#fileText").val(Nurl);
        });

        function uploadimg() {
            var filename = $("#fileText").val();
            if (filename == null || filename == "") {
                layer.msg('请选择文件进行上传！', {
                    time: 2000, //20s后自动关闭
                    btn: ['确定']
                });
                $("#ImportModal").modal('hide');
                return;
            } else {
                $("#form1").ajaxSubmit({
                    type: "get",
                    url: "Ajax/Import.ashx", /* 注意后面的名字对应CS的方法名称 */
                    data: { filename: filename, rnd: Math.random(), mark: 'import' }, /* 注意参数的格式和名称 */
                    contentType: "application/json; charset=utf-8",
                    dataType: "text",
                    success: function (result) {
                        if (result != "") {
                            layer.msg("数据导入成功！", { time: 2000, icon: 1 });
                            $("#JT_Source").html(result);
                        } else {


                        }
                    }
                });
            }

        }


        function DrawJsonTable(JsonObj) {

            var JsonList = eval(JsonObj);

            var TitleHtml = "";

            var BodyHtml = "<tr>";

            var TabWidth = 0;
            if (JsonList != null && JsonList.length > 0) {
                var FirstV = "";
                var SecontV = "";

                var B_FirstV = "";
                var B_SecontV = "";
                for (var h = 0; h < JsonList.length; h++) {
                    if (h != 0) {
                        FirstV = JsonList[h - 1].HZB;
                    } else {
                        FirstV = "0";

                    }
                    SecontV = JsonList[h].HZB;
                    if (parseInt(SecontV) < parseInt(FirstV)) {
                        break;
                    } else {

                        if (h == 0) {
                            TitleHtml += "          <th>&nbsp;&nbsp;</th>";
                            TitleHtml += "          <th>" + JsonList[h].HZB + "</th>";
                        } else {
                            TitleHtml += "          <th>" + JsonList[h].HZB + "</th>";
                        }


                        for (var z = 0; z < JsonList.length; z++) {

                            if (JsonList[z].HZB == JsonList[h].HZB) {

                                BodyHtml += "          <td>" + JsonList[z].Valie + "</td>";
                            }
                        }







                        TabWidth = TabWidth + 40;
                    }

                }

            }
            var TableStr = "";

            TableStr += " <table class=\"table table-striped table-bordered table-hover\"  style=\"width:" + TabWidth + "px;\" id=\"JsonTable\">";
            TableStr += "  <thead>";
            TableStr += "      <tr>";




            TableStr += TitleHtml;
            TableStr += "      </tr>";
            TableStr += "  </thead>";
            TableStr += "  <tbody>";
            TableStr += BodyHtml;

            TableStr += "  </tbody>";
            TableStr += " </table>";


            $("#JT_Source").html(TableStr);








        }


        function getPath(obj) {
            if (obj) {

                if (window.navigator.userAgent.indexOf("MSIE") >= 1) {

                    obj.select();
                    return document.selection.createRange().text;
                }
                else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
                    if (obj.files) {
                        return obj.files.item(0).getAsDataURL();
                    }
                    return obj.value;
                }
                return obj.value;
            }
        }
    </script>

</asp:Content>
