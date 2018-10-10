<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="MyQuestionnaire.aspx.cs" Inherits="CrisisInterfere.FunctionModular.Questionnaire_Record.MyQuestionnaire" %>

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

        @media screen and (min-width:250px) and (max-width:320px) {
            .open > .dropdown-menu {
                display: block;
                margin-left: -110px;
            }
        }

        @media screen and (min-width:320px) and (max-width:960px) {
            .open > .dropdown-menu {
                display: block;
                margin-left: -110px;
            }
        }

        @media screen and (min-width:960px) and (max-width:1300px) {
            .open > .dropdown-menu {
                display: block;
                margin-left: -75px;
            }
        }

        @media screen and (min-width:1300px) and (max-width:1920px) {
            .open > .dropdown-menu {
                display: block;
            }
            /*只会在火狐浏览器下执行*/
            /*@-moz-document url-prefix() {
                .open > .dropdown-menu {
                    display: block;
                    margin-left: -70px;
                }
            }*/
        }
    </style>
    <div class="row">
        <div class="col-md-12">
            <ol class="breadcrumb">
                <i class="fa fa-map-marker" aria-hidden="true" style="color: #4CB1CF; font-size: 20px; padding-right: 10px;"></i>当前位置：
                <li><a href="#">问卷调查</a></li>
                <li><a href="#">我的问卷</a></li>

            </ol>
        </div>
    </div>
    <div class="row" style="padding-bottom: 20px">

        <div class="col-md-12">
            <div class="col-md-2 col-sm-8 col-xs-9" style="padding-left: 0px; padding-right: 0px;">
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
                            <th class="text-center">序号</th>
                            <th class="text-center">问卷名称</th>
                            <th class="text-center">题目数量</th>
                            <th class="text-center">分配时间</th>
                            <th class="text-center">操作</th>
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
        var navName = '/FunctionModular/Questionnaire_Record/MyQuestionnaire.aspx';

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
                    bVisible: false,
                    aTargets: [0]
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
                    return 'type=Load&StarPageIndex=' + Starindex + '&EndPageIndex=' + Endindex + '&GaugeName=' + GaugeName;
                }
            },

            createdRow: function (row, data, dataIndex) {
                var operation = "";
                var obj1 = "Questionnaire_Answer.aspx?QD_Code=" + data[12] + "&Q_Code=" + data[8] + "&IsAnonymity=" + data[9] + "&AnswerType=0";
                if (data[15] == "作答") {
                    operation = "<button class=\"btn btn-link\" name='QX_Answer' data-Anonymity=\"" + data[9] + "\" onclick=\"Answer('" + obj1 + "')\" >作答</button>";
                }
                else if (data[15] == "已作答")//
                {
                    // obj1 = "Questionnaire_Answer.aspx?QD_Code=" + data[12] + "&Q_Code=" + data[8] + "&IsAnonymity=" + data[9] + "&AnswerType=0";
                    operation = " 已作答";
                    // + " <button class=\"btn btn-link\" btn-sm\"  style='color:##fff' name='QX_AgainAnswer'   onclick=\"Answer('" + obj1 + "')\">再次作答</button>";
                }
                else if (data[15] == "继续作答") {

                    var obj3 = "Questionnaire_Answer.aspx?AnserID=" + data[14] + "&QD_Code=" + data[12] + "&" + "&Q_Code=" + data[8] + "&IsAnonymity=" + data[9] + "&AnswerType=1";//重新开始
                    var obj4 = "Questionnaire_Answer.aspx?AnserID=" + data[14] + "&QD_Code=" + data[12] + "&Q_Code=" + data[8] + "&IsAnonymity=" + data[9] + "&AnswerType=2";//继续作答

                    operation = "<div class='dropdown'><button class=\"btn btn-link\" data-toggle='dropdown' name='QX_Answer'>作答</button>"
                    + "<ul class='dropdown-menu' role='menu' aria-labelledby='dropdownMenu1' style='width:200px;color:white'>"
                    + "<li role='presentation' style='margin-left:10px'><button class='btn' style='background-color:rgb(111,179,224)' name='QX_Again' onclick=\"AnswerR('" + obj3 + "')\">重新开始</button> </li>"
                    + "<li role='presentation' id='ContinueAnswer' style='margin-left:40px'><button class='btn' style='background-color:rgb(111,179,224)'onclick=\"AnswerR('" + obj4 + "')\">继续作答</button> </li></ul></div>";
                    //如果之前作答过：1是作答了-没有做完保存，2是断电的情况下-需要弹出框
                    //未作答则直接跳转到答题链接
                }
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

        //查询
        $(document).on("click", "#go_search", function () {
            GaugeName = $("#GaugeName").val();
            if (dtDetail != undefined) {
                $("#DataTables-Gauge").DataTable().draw();
                return;
            }
        });
        function Answer(Strurl) {
            var arr = Strurl.toString().split('&');

            var end_date = new Date(arr[5]);
            var curr_time = new Date();
            if (arr.length > 4) {
                var pr = arr[4].split('=');
            }
            else {
                window.location.href = Strurl;
                return;
            }
            var num = (curr_time - end_date) / (1000 * 3600 * 24);
            if (pr[1] == 0 || pr[1] == "") {
                window.location.href = Strurl;
                return;
            }
            if (num > pr[1]) {
                window.location.href = Strurl;
                return;
            }
            else {
                layer.alert('距离再次测验还有' + pr[1] + '天，请稍等！', {
                    skin: 'layui-layer-lan', //样式类名
                    closeBtn: 0
                });
                return;
            }
        }
        //查询按钮绑定回车键
        $(document).keydown(function (event) {
            if (event.keyCode == 13) {
                $("#go_search").click();
            }
        });
        function AnswerR(Strurl) {
            window.location.href = Strurl;
        }
    </script>
</asp:Content>
