
//initSelectInput("Remark=1", "Sel_RoleType", "全部分类");//初始化量表类别


/*列表展现部分 */

/*
       创建时间：2016-09-21
       创建人：刘亚娟
       功能介绍：加载量表列表集合
*/
var Starindexs = 0;//开始条数索引
var Endindexs = 10;//结束条数索引


var Titles = "";
var dtDetails;
var dtDetaild;
var DraftTitle = "";
var DraftTitle = "";
SenderTable();
//发件箱
function SenderTable() {
   
    Titles = $("#SenderTitle").val();
    if (dtDetails != undefined) {
        
        $("#dataTables-Sender").DataTable().draw();
        return;
    }
    dtDetails = $('#dataTables-Sender').dataTable({
        serverSide: true,//分页，取数据等等的都放到服务端去
        searching: false,
        pageLength: 10,//首次加载的数据条数
        ordering: false,//排序操作在服务端进行，所以可以关了。
        processing: true,//载入数据的时候是否显示“载入中”
        bLengthChange: false,//是否显示分页条数（就是那个显示页面条数的下拉按钮）
        aoColumnDefs: [
            { //隐藏列
                bVisible: true,
                aTargets: [0]
            },
        ],
        ajax: {
            method: 'get',
            url: "Ajax/Letter.ashx",
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
                return 'type=7&StarPageIndexs=' + Starindex + '&EndPageIndexs=' + Endindex + '&Titles=' + Titles;
            }
        },

        createdRow: function (row, data, dataIndex) {

            $('td:eq(0)', row).html(" <input name=checkbox type=\"checkbox\" value=\"" + data[0] + "\" />");

            var operation = "";

            operation = " <button class=\"btn btn-link\" onclick=\"looksender(" + data[0] + ")\">查看</button>"
           + " <button class=\"btn btn-link\" onclick='updatedelete01(" + data[0] + ")'>删除</button>";

            $('td:eq(5)', row).html(operation);
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
}


//根据id获取查看内容
function looksender(U_ID) {
    $.ajax({
        url: "Ajax/Letter.ashx?type=14",
        data: { uid: U_ID },
        type: 'get',
        success: function (result) {
            if (result != null && result != "") {
                var parsedJson = jQuery.parseJSON(result);
                //$("#NewTitle").val(parsedJson._ul_title);
                $("#NewContent01").val(parsedJson._ul_note);
                $('#chankan01').modal();
            }
            else {
                layer.msg('删除失败！', { icon: 1 });
            }
        }

    })
}


$(document).on("click", "#go_searchSender", function () {

   
    Titles = $("#SenderTitle").val();
    if (dtDetails != undefined) {
        $("#dataTables-Sender").DataTable().draw();
        return;
    }
});
//发件箱单个删除
function updatedelete01(U_ID) {
    layer.confirm('您确定要删除吗？', {
        btn: ['删除', '取消'] //按钮
    }, function () {

        $.ajax({
            url: "Ajax/Letter.ashx?type=9",
            data: { deleteuid: U_ID },
            type: 'get',
            success: function (result) {
                if (result == "True") {
                    layer.msg('删除成功！', { icon: 1 });                 
                    $('#dataTables-Sender').DataTable().draw();
                }
                else {
                    layer.msg('删除失败！', { icon: 1 });

                }
            }

        })

    });
}
//发件箱批量删除
function updatedeletes01() {
    var checkbox = document.getElementsByName("checkbox");
    var chenum = "";
    var deleteuids = "";//注意
    for (var i = 0; i < checkbox.length; i++) {
        if (checkbox[i].checked) {
            deleteuids += checkbox[i].value + ",";

        }
    }
    if (deleteuids == "" || deleteuids == null) {
        layer.msg('请选择要删除的条目！', { icon: 1 });
        return false;
    }
    layer.confirm('您确定要删除吗？', {
        btn: ['删除', '取消'] //按钮
    }, function () {

        $.ajax({
            url: "Ajax/Letter.ashx?type=10",
            data: { deleteuids: deleteuids },
            type: 'get',
            success: function (result) {
                if (result == "True") {
                    layer.msg('删除成功！', { icon: 1 });
                    $("#selectAllSender").prop("checked", false);
                    $('#dataTables-Sender').DataTable().draw();
                }
                else {
                    layer.msg('删除失败！', { icon: 1 });

                }
            }

        })

    });
}

/*-----列表展现部分END-----*/

//草稿箱分页
function DraftTable() {
    var Starindexs = 0;//开始条数索引
    var Endindexs = 10;//结束条数索引


   
    
    DraftTitle = $("#DraftTitle").val();
    if (dtDetaild != undefined) {
        $("#dataTables-Draft").DataTable().draw();
        return;
    }
    dtDetaild = $('#dataTables-Draft').dataTable({
        serverSide: true,//分页，取数据等等的都放到服务端去
        searching: false,
        pageLength: 10,//首次加载的数据条数
        ordering: false,//排序操作在服务端进行，所以可以关了。
        processing: true,//载入数据的时候是否显示“载入中”
        aoColumnDefs: [
            { //隐藏列
                bVisible: true,
                aTargets: [0]
            },
        ],
        ajax: {
            method: 'get',
            url: "Ajax/Letter.ashx",
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
                return 'type=8&StarPageIndexs=' + Starindex + '&EndPageIndexs=' + Endindex + '&Titles=' + DraftTitle;
            }
        },

        createdRow: function (row, data, dataIndex) {

            $('td:eq(0)', row).html(" <input name=checkbox type=\"checkbox\" value=\"" + data[0] + "\" />");

            var operation = "";

            operation = " <button class=\"btn btn-primary  btn-sm\"onclick=\"seupdate(" + data[0] + "," + data[8] + ")\" value=\"" + data[8] + "\" id=\"SeupdateID\"><i class=\"fa fa-edit \"></i> 编辑</button>"
           + " <button class=\"btn btn-danger  btn-sm\" onclick='updatedeleteC(" + data[0] + ")'><i class=\"glyphicon glyphicon-trash\"></i> 删除</button>";

            $('td:eq(5)', row).html(operation);
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
}
//草稿箱
$(document).on("click", "#go_searchDraft", function () {


    DraftTitle = $("#DraftTitle").val();
    if (dtDetaild != undefined) {
        $("#dataTables-Draft").DataTable().draw();
        return;
    }
});
//草稿箱单个删除
function updatedeleteC(U_ID) {
    layer.confirm('您确定要删除吗？', {
        btn: ['删除', '取消'] //按钮
    }, function () {

        $.ajax({
            url: "Ajax/Letter.ashx?type=9",
            data: { deleteuid: U_ID },
            type: 'get',
            success: function (result) {
                if (result == "True") {
                    layer.msg('删除成功！', { icon: 1 });
                    $('#dataTables-Draft').DataTable().draw();
                }
                else {
                    layer.msg('删除失败！', { icon: 1 });

                }
            }

        })

    });
}
//草稿箱批量删除
function updatedeletesC() {
    var checkbox = document.getElementsByName("checkbox");
    var chenum = "";
    var deleteuids = "";//注意
    for (var i = 0; i < checkbox.length; i++) {
        if (checkbox[i].checked) {
            deleteuids += checkbox[i].value + ",";

        }
    }
    layer.confirm('您确定要删除吗？', {
        btn: ['删除', '取消'] //按钮
    }, function () {

        $.ajax({
            url: "Ajax/Letter.ashx?type=10",
            data: { deleteuids: deleteuids },
            type: 'get',
            success: function (result) {
                if (result == "True") {
                    layer.msg('删除成功！', { icon: 1 });
                    $('#dataTables-Draft').DataTable().draw();
                }
                else {
                    layer.msg('删除失败！', { icon: 1 });

                }
            }

        })

    });
}

