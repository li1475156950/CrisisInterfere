<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TreeTest.aspx.cs" Inherits="CrisisInterfere.FunctionModular.BasicSetting.TreeTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="../../CSS/zTreeStyle.css" rel="stylesheet" />
    <script src="../../JS/jquery-1.10.2.js"></script>
     
    <script src="../../JS/jquery.ztree.core.min.js"></script>
   <%-- <link href="../../CSS/ligerFrom/ligerui-form.css" rel="stylesheet" />
    <link href="../../CSS/ligerFrom/ligerui-tree.css" rel="stylesheet" />
    <script src="../../JS/ligerComboBox/ligerForm.js"></script>
    <script src="../../JS/ligerComboBox/ligerComboBox.js"></script>
    <script src="../../JS/ligerComboBox/ligerTree.js"></script>--%>
    <style>  
             .combo-arrow {  
           width: 18px;  
           height: 20px;  
           overflow: hidden;  
           display: inline-block;  
                 vertical-align: top;  
                 cursor: pointer;  
                 opacity: 0.6;  
                 filter: alpha(opacity = 60);  
                 background: url('img/combo_arrow.png') no-repeat center center;  
                 background-color: #E0ECFF;  
             }  
  
       .combo {  
           border-color: #95B8E7;  
           background-color: #ffffff;  
           display: inline-block;  
           white-space: nowrap;  
           margin: 0;  
           padding: 0;  
           border-width: 1px;  
           border-style: solid;  
           overflow: hidden;  
           vertical-align: middle;  
       }  
  
       .combo-text {  
           font-size: 12px;  
           border: 0px;  
           line-height: 20px;  
           height: 20px;  
           margin: 0;  
           padding: 0px 2px;  
       }  
  
       .ztree {  
           margin-top: 0px;  
           border: 1px solid #617775;  
           background: #f0f6e4;  
           height: 260px;  
           overflow-y: auto;  
           min-width: 132px;  
       }  
  
       </style>
   
    <script type="text/javascript">
        alert(1);
        $("#proxyserial").css("height","40px");
        var zTreeObj,
            
         setting = {
             view: {
                 dblClickExpand: false
             },
             async: {
                 enable: true,
                 url: "Ajax/MemberManagement.ashx?type=8",
                 autoParam: ["id"]
             },
             data: {
                 simpleData: {
                     enable: true
                 }
             },
             callback: {
                 onClick: onClick
             },
             view: {
                 selectedMulti: false,
                 showIcon: false
             }
         };

        $(document).ready(function () {
            //$("#proxyserial").attr({
            //    value: id
            //});
            zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, null);
        });
        /** 
       * 隱藏樹形下拉框 
       */
        function hideMenu() {
            $("#menuContent").fadeOut("fast");
            $("body").unbind("mousedown", onBodyDown);
        }

        /** 
         * 点击树的时候给文本框赋值 
         */
        function onClick(e, treeId, treeNode) {
            $("#proxyserial").attr({
                value: treeNode.name
            });
            hideMenu();
        }

        /** 
         * 打开树形结构 
         */
        function showMenu() {
            var cityObj1 = $("#proxyserial");
            var cityOffset1 = $("#proxyserial").offset();
            $("#menuContent").css({
                left: cityOffset1.left + "px",
                top: cityOffset1.top + cityObj1.outerHeight() + "px"
            }).slideDown("fast");
            $("body").bind("mousedown", onBodyDown);
        }

        /** 
         * 点击树形结构以外时，关闭树形下拉框 
         * 
         * @param event 
         */
        function onBodyDown(event) {
            if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents

("#menuContent").length > 0)) {
                hideMenu();
            }
        }
    </script>
    <script>

       
    </script>

</head>
<body>
    <form id="sss">
       <%-- <input type="text" id="T_parent" name="T_parent" />--%>

        <span class="combo">  
            <input type="text" class="combo-text" style="height: 20px;" id="proxyserial"   onclick="showMenu()" />  
            <span class="combo-arrow" style="height: 20px;"  onclick="showMenu();" >&nbsp;</span> </span>  
  
        <div id="menuContent" class="menuContent" style="display: none; position: absolute;">  
            <ul id="treeDemo" class="ztree"></ul>  
        </div>  
    </form>
</body>

</html>
