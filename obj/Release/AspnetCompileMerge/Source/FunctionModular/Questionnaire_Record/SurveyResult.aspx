<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SurveyResult.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.SurveyResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../JS/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../JS/bootstrap-table.min.js"></script>
    <link href="../../assets/css/chosen.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />
    <style>
        #DataTables-Gauge .dropdown ul li {
            float: left;
            width: 50px;
        }
    </style>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="#">调查结果</a></li>

            </ol>
        </div>
    </div>
    <div class="row" style="padding-bottom: 20px">

        <div class="col-md-12">
            <div class="col-md-2 col-sm-8 col-xs-9" style="padding-left:0px;padding-right:0px;">
                <input id="GaugeName" placeholder="--问卷名称--" class="form-control" />
            </div>
            <div class="col-md-3 col-sm-3 col-xs-2">
                <div class="panel-primary text-center">
                    <div class="pull-left ">
                        <button class="btn btn-sm" id="go_search" name="QX_SelectMyTest" style="color: white"><i class="fa fa-search "></i>查询</button>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Advanced Tables -->

            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover" id="DataTables-Gauge">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 2%">序号</th>
                            <th class="text-center" style="width: 10%">问卷名称</th>
                            <th class="text-center" style="width: 5%">作答人数</th>
                            <th class="text-center" style="width: 10%; text-align: center;">操作</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>

            </div>
        </div>
    </div>

    <script type="text/javascript" src="../../JS/datatables/media/js/jquery.dataTables.min.js"></script>

    <script src="../../JS/chosen.jquery.min.js"></script>
    <script>
        var navName = '/FunctionModular/Questionnaire_Record/SurveyResult.aspx';

        /*列表展现部分 */

        var Starindex = 0;//开始条数索引
        var Endindex = 10;//结束条数索引
        var GaugeName = "";
        var dtDetail;
        dtDetail = $('#DataTables-Gauge').dataTable({
            serverSide: true,//分页，取数据等等的都放到服务端去
            searching: false,
            bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
            pageLength: 10,//首次加载的数据条数
            ordering: false,//排序操作在服务端进行，所以可以关了。
            processing: true,//载入数据的时候是否显示“载入中”
            aoColumnDefs: [
                { //隐藏列
                    bVisible: false
                    //aTargets: [0]
                }
            ],
            ajax: {
                method: 'get',
                url: "Ajax/MyQuestionnaire.ashx",
                dataSrc: "data",
                data: function (d) {

                    //d.start;//开始的序号
                    //d.length;//要取的数据的
                    Endindex = 0;
                    Starindex = 0;
                    if (d.start == 0) {
                        Endindex = d.length;
                    } else {
                        Starindex = d.start + 1;
                        Endindex = d.start + d.length;
                    }
                    return 'type=InitSurveyResult&StartPage=' + Starindex + '&EndPage=' + Endindex + '&Name=' + GaugeName;
                }
            },

            createdRow: function (row, data) {
                var operation = "";
                $('td:eq(0)', row).html(data[0]);
                $('td:eq(1)', row).html(data[1]);
                $('td:eq(2)', row).html(data[2]);

                operation += " <button  class=\"btn btn-link\" data-code=\"" + data[3] + "\" name='QX_Collect'>答卷收集</button>";
                operation += " <button  class=\"btn btn-link\" data-code=\"" + data[3] + "\" data-score=\""+data[4]+"\" name='QX_Analyze'>统计分析</button>";

                $('td:eq(0)', row).css("text-align", "center");
                $('td:eq(1)', row).css("text-align", "center");
                $('td:eq(2)', row).css("text-align", "center");
                $('td:eq(3)', row).css("text-align", "center");
                $('td:eq(3)', row).html(operation);
            },

            "oLanguage": {
                "sProcessing": "处理中...",
                "sLengthMenu": "_MENU_ 记录/页",
                "sZeroRecords": "没有匹配的记录",
                "sInfo": "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项记录，共 0 项",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "过滤:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                }
            },
            initComplete: function (setting, json) {
            }
        });
        /*-----列表展现部分END-----*/
        //答卷收集按钮
        $(document).on("click", "[name=QX_Collect]", function () {
            var qCode = $(this).attr("data-code");
            window.location.href = "/FunctionModular/Questionnaire_Record/AnswerGather.aspx?Q_Code=" + qCode;
        });
        //统计分析
        $(document).on("click", "[name=QX_Analyze]", function () {
            var qCode = $(this).attr("data-code");
            var score = $(this).attr("data-score");
            var name = $(this)[0].parentNode.parentNode.childNodes[1].innerHTML;
            var num = $(this)[0].parentNode.parentNode.childNodes[2].innerHTML;//问卷的作答数量
            window.location.href = "/FunctionModular/Questionnaire_Record/StatisticsAnalyze.aspx?Q_Code=" + qCode + "&num=" + num + "&score=" + score
            +"&name="+name;
        });
        //查询
        $(document).on("click", "#go_search", function () {
            GaugeName = $("#GaugeName").val();
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
        });
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
    </script>
</asp:Content>
