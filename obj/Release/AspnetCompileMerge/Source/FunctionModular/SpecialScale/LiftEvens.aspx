<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="LiftEvens.aspx.cs" Inherits="CrisisInterfere.FunctionModular.SpecialScale.LiftEvens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <div class="row" style="text-align:center;">生活事件</div>
    <div class="row" id="tableid">
        <ul id="tasks" class="item-list">
                        <li class="clearfix">
                            <div class="row">
                                <dt>指 导 语：</dt>
                                &nbsp;&nbsp;&nbsp;&nbsp;<span id="S_Remark">下面是每个人都有可能遇到的一些日常生活事件，究竟是好事还是坏事，可根据个人情况自行判断。这些事件可能对一个人有精神上的影响(体验为紧张、压力、兴奋或苦恼等)，影响的轻重程度是各不相同的，影响持续的时间也不一样。请您根据自己的情况，实事求是地回答下列问题，并在最适合的答案上打钩。</span>
                            </div>
                        </li>
                        <li class="clearfix">
                            <div id="goods_lst" style="background-color:#f2f2f2" class="pro_tab fix relafloat">
                                <table border="1" cellpadding="1" cellspacing="1" style="width: 100%; line-height: 1.5">
                                    <tbody><tr align="center">
                                        <td rowspan="2" style="width: 40%">
                                            <dt>生活事件名称</dt>
                                        </td>
                                        <td colspan="4" style="width: 15%">
                                            <dt>事件发生时间</dt>
                                        </td>
                                        <td colspan="2" style="width: 15%">
                                            <dt>性质</dt>
                                        </td>
                                        <td colspan="5" style="width: 15%">
                                            <dt>精神影响程度</dt>
                                        </td>
                                        <td colspan="4" style="width: 15%">
                                            <dt>影响持续时间</dt>
                                        </td>
                                    </tr>
                                    <tr align="center">
                                        <td>
                                            <dt>未发生</dt>
                                        </td>
                                        <td>
                                            <dt>一年前</dt>
                                        </td>
                                        <td>
                                            <dt>一年内</dt>
                                        </td>
                                        <td>
                                            <dt>长期性</dt>
                                        </td>
                                        <td>
                                            <dt>好事</dt>
                                        </td>
                                        <td>
                                            <dt>坏事</dt>
                                        </td>
                                        <td>
                                            <dt>无影响</dt>
                                        </td>
                                        <td>
                                            <dt>轻度</dt>
                                        </td>
                                        <td>
                                            <dt>中度</dt>
                                        </td>
                                        <td>
                                            <dt>重度</dt>
                                        </td>
                                        <td>
                                            <dt>极重</dt>
                                        </td>
                                        <td>
                                            <dt>三月内</dt>
                                        </td>
                                        <td>
                                            <dt>半年内</dt>
                                        </td>
                                        <td>
                                            <dt>一年内</dt>
                                        </td>
                                        <td>
                                            <dt>一年外</dt>
                                        </td>
                                    </tr>
                                </tbody></table>
                            </div>
                            <script type="text/javascript">
                                var goods_lst_top;
                                if ($('#goods_lst')[0]) {
                                    goods_lst_top = $('#goods_lst').offset().top;
                                }
                                if (goods_lst_top) {
                                    $("#d_wjtg").scroll(function () {
                                        var scrollHeight = $("#d_wjtg").scrollTop();
                                        if (scrollHeight > goods_lst_top) {
                                            $('#goods_lst').removeClass('relafloat');
                                            $('#goods_lst').addClass('fixedfloat');
                                        } else {
                                            $('#goods_lst').removeClass('fixedfloat');
                                            $('#goods_lst').addClass('relafloat');
                                        }
                                    });
                                }
                            </script>
                            <table border="1" cellpadding="1" cellspacing="1" style="width: 100%; line-heightl: 1.5">
                                
                                        <tbody><tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    1.
                                                    恋爱或者订婚</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    2.
                                                    恋爱失败、破裂</dt>
                                            </td>
                                            
                                                   <td style="width:3.75%"><input name="SJFSName02" type="checkbox" id="SJFS2_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName02" type="checkbox" id="SJFS2_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName02" type="checkbox" id="SJFS2_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName02" type="checkbox" id="SJFS2_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName02" type="checkbox" id="XZ2_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName02" type="checkbox" id="XZ2_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName02" type="checkbox" id="JSYXCD2_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName02" type="checkbox" id="JSYXCD2_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName02" type="checkbox" id="JSYXCD2_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName02" type="checkbox" id="JSYXCD2_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName02" type="checkbox" id="JSYXCD2_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName02" type="checkbox" id="TXCXSJ2_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName02" type="checkbox" id="TXCXSJ2_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName02" type="checkbox" id="TXCXSJ2_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName02" type="checkbox" id="TXCXSJ2_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    3.
                                                    结婚</dt>
                                            </td>
                                            
                                                     <td style="width:3.75%"><input name="SJFSName03" type="checkbox" id="SJFS3_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName03" type="checkbox" id="SJFS3_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName03" type="checkbox" id="SJFS3_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName03" type="checkbox" id="SJFS3_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName03" type="checkbox" id="XZ3_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName03" type="checkbox" id="XZ3_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName03" type="checkbox" id="JSYXCD3_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName03" type="checkbox" id="JSYXCD3_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName03" type="checkbox" id="JSYXCD3_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName03" type="checkbox" id="JSYXCD3_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName03" type="checkbox" id="JSYXCD3_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName03" type="checkbox" id="TXCXSJ3_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName03" type="checkbox" id="TXCXSJ3_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName03" type="checkbox" id="TXCXSJ3_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName03" type="checkbox" id="TXCXSJ3_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    4.
                                                    自己(爱人)怀孕</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName04" type="checkbox" id="SJFS4_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName04" type="checkbox" id="SJFS4_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName04" type="checkbox" id="SJFS4_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName04" type="checkbox" id="SJFS4_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName04" type="checkbox" id="XZ4_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName04" type="checkbox" id="XZ4_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName04" type="checkbox" id="JSYXCD4_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName04" type="checkbox" id="JSYXCD4_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName04" type="checkbox" id="JSYXCD4_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName04" type="checkbox" id="JSYXCD4_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName04" type="checkbox" id="JSYXCD4_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName04" type="checkbox" id="TXCXSJ4_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName04" type="checkbox" id="TXCXSJ4_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName04" type="checkbox" id="TXCXSJ4_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName04" type="checkbox" id="TXCXSJ4_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    5.
                                                    自己(爱人)流产</dt>
                                            </td>
                                            
                                                     <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    6.
                                                    家庭增添新成员</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    7.
                                                    与爱人父母不和</dt>
                                            </td>
                                            
                                                   <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    8.
                                                    夫妻感情不好</dt>
                                            </td>
                                            
                                                   <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    9.
                                                    夫妻分居(因不和)</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    10.
                                                    夫妻两地分居(工作需要)</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    11.
                                                    性生活不满意或独身</dt>
                                            </td>
                                            
                                                 <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    12.
                                                    配偶一方有外遇</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    13.
                                                    夫妻重归于好</dt>
                                            </td>
                                            
                                                  
                                                
                                                   <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    14.
                                                    超指标生育</dt>
                                            </td>
                                            
                                                 
                                                 <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    15.
                                                    本人(爱人)做绝育手术</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    16.
                                                    配偶死亡</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    17.
                                                    离婚</dt>
                                            </td>
                                            
                                                   <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    18.
                                                    子女升学(就业)失败</dt>
                                            </td>
                                            
                                                   
                                                
                                                     <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    19.
                                                    子女管教困难</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ001', 'SHSJLB_TG001_1')" value="18836"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ002', 'SHSJLB_TG001_1')" value="18837"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ003', 'SHSJLB_TG001_1')" value="18838"></td>
                                                
                                                    <td style="width:3.75%"><input name="SJFSName01" type="checkbox" id="SJFS1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ004', 'SHSJLB_TG001_1')" value="18839"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ005', 'SHSJLB_TG001_2')" value="18840"></td>
                                                
                                                    <td style="width:7.5%"><input name="XZName01" type="checkbox" id="XZ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ006', 'SHSJLB_TG001_2')" value="18841"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ007', 'SHSJLB_TG001_4')" value="18842"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ008', 'SHSJLB_TG001_4')" value="18843"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ009', 'SHSJLB_TG001_4')" value="18844"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ010', 'SHSJLB_TG001_4')" value="18845"></td>
                                                
                                                    <td style="width:3%"><input name="JSYXCDName01" type="checkbox" id="JSYXCD1_05" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ011', 'SHSJLB_TG001_4')" value="18846"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_01" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ012', 'SHSJLB_TG001_5')" value="18847"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_02" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ013', 'SHSJLB_TG001_5')" value="18848"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_03" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ014', 'SHSJLB_TG001_5')" value="18849"></td>
                                                
                                                    <td style="width:3.75%"><input name="TXCXSJName01" type="checkbox" id="TXCXSJ1_04" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG001', 'SHSJLB_TZ015', 'SHSJLB_TG001_5')" value="18850"></td>
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    20.
                                                    子女长期离家</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_1" type="checkbox" id="SHSJLB_TZ286" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ286', 'SHSJLB_TG020_1')" value="19121"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_1" type="checkbox" id="SHSJLB_TZ287" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ287', 'SHSJLB_TG020_1')" value="19122"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_1" type="checkbox" id="SHSJLB_TZ288" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ288', 'SHSJLB_TG020_1')" value="19123"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_1" type="checkbox" id="SHSJLB_TZ289" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ289', 'SHSJLB_TG020_1')" value="19124"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG020_2" type="checkbox" id="SHSJLB_TZ290" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ290', 'SHSJLB_TG020_2')" value="19125"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG020_2" type="checkbox" id="SHSJLB_TZ291" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ291', 'SHSJLB_TG020_2')" value="19126"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG020_4" type="checkbox" id="SHSJLB_TZ292" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ292', 'SHSJLB_TG020_4')" value="19127"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG020_4" type="checkbox" id="SHSJLB_TZ293" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ293', 'SHSJLB_TG020_4')" value="19128"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG020_4" type="checkbox" id="SHSJLB_TZ294" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ294', 'SHSJLB_TG020_4')" value="19129"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG020_4" type="checkbox" id="SHSJLB_TZ295" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ295', 'SHSJLB_TG020_4')" value="19130"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG020_4" type="checkbox" id="SHSJLB_TZ296" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ296', 'SHSJLB_TG020_4')" value="19131"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_5" type="checkbox" id="SHSJLB_TZ297" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ297', 'SHSJLB_TG020_5')" value="19132"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_5" type="checkbox" id="SHSJLB_TZ298" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ298', 'SHSJLB_TG020_5')" value="19133"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_5" type="checkbox" id="SHSJLB_TZ299" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ299', 'SHSJLB_TG020_5')" value="19134"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG020_5" type="checkbox" id="SHSJLB_TZ300" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG020', 'SHSJLB_TZ300', 'SHSJLB_TG020_5')" value="19135"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    21.
                                                    父母不和</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_1" type="checkbox" id="SHSJLB_TZ301" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ301', 'SHSJLB_TG021_1')" value="19136"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_1" type="checkbox" id="SHSJLB_TZ302" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ302', 'SHSJLB_TG021_1')" value="19137"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_1" type="checkbox" id="SHSJLB_TZ303" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ303', 'SHSJLB_TG021_1')" value="19138"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_1" type="checkbox" id="SHSJLB_TZ304" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ304', 'SHSJLB_TG021_1')" value="19139"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG021_2" type="checkbox" id="SHSJLB_TZ305" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ305', 'SHSJLB_TG021_2')" value="19140"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG021_2" type="checkbox" id="SHSJLB_TZ306" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ306', 'SHSJLB_TG021_2')" value="19141"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG021_4" type="checkbox" id="SHSJLB_TZ307" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ307', 'SHSJLB_TG021_4')" value="19142"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG021_4" type="checkbox" id="SHSJLB_TZ308" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ308', 'SHSJLB_TG021_4')" value="19143"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG021_4" type="checkbox" id="SHSJLB_TZ309" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ309', 'SHSJLB_TG021_4')" value="19144"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG021_4" type="checkbox" id="SHSJLB_TZ310" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ310', 'SHSJLB_TG021_4')" value="19145"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG021_4" type="checkbox" id="SHSJLB_TZ311" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ311', 'SHSJLB_TG021_4')" value="19146"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_5" type="checkbox" id="SHSJLB_TZ312" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ312', 'SHSJLB_TG021_5')" value="19147"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_5" type="checkbox" id="SHSJLB_TZ313" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ313', 'SHSJLB_TG021_5')" value="19148"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_5" type="checkbox" id="SHSJLB_TZ314" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ314', 'SHSJLB_TG021_5')" value="19149"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG021_5" type="checkbox" id="SHSJLB_TZ315" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG021', 'SHSJLB_TZ315', 'SHSJLB_TG021_5')" value="19150"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    22.
                                                    家庭经济困难</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_1" type="checkbox" id="SHSJLB_TZ316" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ316', 'SHSJLB_TG022_1')" value="19151"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_1" type="checkbox" id="SHSJLB_TZ317" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ317', 'SHSJLB_TG022_1')" value="19152"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_1" type="checkbox" id="SHSJLB_TZ318" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ318', 'SHSJLB_TG022_1')" value="19153"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_1" type="checkbox" id="SHSJLB_TZ319" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ319', 'SHSJLB_TG022_1')" value="19154"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG022_2" type="checkbox" id="SHSJLB_TZ320" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ320', 'SHSJLB_TG022_2')" value="19155"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG022_2" type="checkbox" id="SHSJLB_TZ321" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ321', 'SHSJLB_TG022_2')" value="19156"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG022_4" type="checkbox" id="SHSJLB_TZ322" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ322', 'SHSJLB_TG022_4')" value="19157"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG022_4" type="checkbox" id="SHSJLB_TZ323" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ323', 'SHSJLB_TG022_4')" value="19158"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG022_4" type="checkbox" id="SHSJLB_TZ324" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ324', 'SHSJLB_TG022_4')" value="19159"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG022_4" type="checkbox" id="SHSJLB_TZ325" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ325', 'SHSJLB_TG022_4')" value="19160"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG022_4" type="checkbox" id="SHSJLB_TZ326" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ326', 'SHSJLB_TG022_4')" value="19161"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_5" type="checkbox" id="SHSJLB_TZ327" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ327', 'SHSJLB_TG022_5')" value="19162"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_5" type="checkbox" id="SHSJLB_TZ328" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ328', 'SHSJLB_TG022_5')" value="19163"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_5" type="checkbox" id="SHSJLB_TZ329" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ329', 'SHSJLB_TG022_5')" value="19164"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG022_5" type="checkbox" id="SHSJLB_TZ330" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG022', 'SHSJLB_TZ330', 'SHSJLB_TG022_5')" value="19165"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    23.
                                                    欠债</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_1" type="checkbox" id="SHSJLB_TZ331" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ331', 'SHSJLB_TG023_1')" value="19166"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_1" type="checkbox" id="SHSJLB_TZ332" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ332', 'SHSJLB_TG023_1')" value="19167"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_1" type="checkbox" id="SHSJLB_TZ333" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ333', 'SHSJLB_TG023_1')" value="19168"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_1" type="checkbox" id="SHSJLB_TZ334" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ334', 'SHSJLB_TG023_1')" value="19169"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG023_2" type="checkbox" id="SHSJLB_TZ335" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ335', 'SHSJLB_TG023_2')" value="19170"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG023_2" type="checkbox" id="SHSJLB_TZ336" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ336', 'SHSJLB_TG023_2')" value="19171"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG023_4" type="checkbox" id="SHSJLB_TZ337" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ337', 'SHSJLB_TG023_4')" value="19172"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG023_4" type="checkbox" id="SHSJLB_TZ338" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ338', 'SHSJLB_TG023_4')" value="19173"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG023_4" type="checkbox" id="SHSJLB_TZ339" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ339', 'SHSJLB_TG023_4')" value="19174"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG023_4" type="checkbox" id="SHSJLB_TZ340" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ340', 'SHSJLB_TG023_4')" value="19175"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG023_4" type="checkbox" id="SHSJLB_TZ341" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ341', 'SHSJLB_TG023_4')" value="19176"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_5" type="checkbox" id="SHSJLB_TZ342" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ342', 'SHSJLB_TG023_5')" value="19177"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_5" type="checkbox" id="SHSJLB_TZ343" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ343', 'SHSJLB_TG023_5')" value="19178"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_5" type="checkbox" id="SHSJLB_TZ344" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ344', 'SHSJLB_TG023_5')" value="19179"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG023_5" type="checkbox" id="SHSJLB_TZ345" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG023', 'SHSJLB_TZ345', 'SHSJLB_TG023_5')" value="19180"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    24.
                                                    经济情况显著改善</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_1" type="checkbox" id="SHSJLB_TZ346" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ346', 'SHSJLB_TG024_1')" value="19181"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_1" type="checkbox" id="SHSJLB_TZ347" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ347', 'SHSJLB_TG024_1')" value="19182"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_1" type="checkbox" id="SHSJLB_TZ348" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ348', 'SHSJLB_TG024_1')" value="19183"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_1" type="checkbox" id="SHSJLB_TZ349" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ349', 'SHSJLB_TG024_1')" value="19184"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG024_2" type="checkbox" id="SHSJLB_TZ350" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ350', 'SHSJLB_TG024_2')" value="19185"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG024_2" type="checkbox" id="SHSJLB_TZ351" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ351', 'SHSJLB_TG024_2')" value="19186"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG024_4" type="checkbox" id="SHSJLB_TZ352" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ352', 'SHSJLB_TG024_4')" value="19187"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG024_4" type="checkbox" id="SHSJLB_TZ353" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ353', 'SHSJLB_TG024_4')" value="19188"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG024_4" type="checkbox" id="SHSJLB_TZ354" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ354', 'SHSJLB_TG024_4')" value="19189"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG024_4" type="checkbox" id="SHSJLB_TZ355" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ355', 'SHSJLB_TG024_4')" value="19190"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG024_4" type="checkbox" id="SHSJLB_TZ356" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ356', 'SHSJLB_TG024_4')" value="19191"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_5" type="checkbox" id="SHSJLB_TZ357" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ357', 'SHSJLB_TG024_5')" value="19192"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_5" type="checkbox" id="SHSJLB_TZ358" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ358', 'SHSJLB_TG024_5')" value="19193"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_5" type="checkbox" id="SHSJLB_TZ359" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ359', 'SHSJLB_TG024_5')" value="19194"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG024_5" type="checkbox" id="SHSJLB_TZ360" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG024', 'SHSJLB_TZ360', 'SHSJLB_TG024_5')" value="19195"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    25.
                                                    家庭成员重病、重伤</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_1" type="checkbox" id="SHSJLB_TZ361" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ361', 'SHSJLB_TG025_1')" value="19196"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_1" type="checkbox" id="SHSJLB_TZ362" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ362', 'SHSJLB_TG025_1')" value="19197"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_1" type="checkbox" id="SHSJLB_TZ363" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ363', 'SHSJLB_TG025_1')" value="19198"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_1" type="checkbox" id="SHSJLB_TZ364" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ364', 'SHSJLB_TG025_1')" value="19199"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG025_2" type="checkbox" id="SHSJLB_TZ365" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ365', 'SHSJLB_TG025_2')" value="19200"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG025_2" type="checkbox" id="SHSJLB_TZ366" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ366', 'SHSJLB_TG025_2')" value="19201"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG025_4" type="checkbox" id="SHSJLB_TZ367" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ367', 'SHSJLB_TG025_4')" value="19202"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG025_4" type="checkbox" id="SHSJLB_TZ368" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ368', 'SHSJLB_TG025_4')" value="19203"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG025_4" type="checkbox" id="SHSJLB_TZ369" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ369', 'SHSJLB_TG025_4')" value="19204"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG025_4" type="checkbox" id="SHSJLB_TZ370" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ370', 'SHSJLB_TG025_4')" value="19205"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG025_4" type="checkbox" id="SHSJLB_TZ371" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ371', 'SHSJLB_TG025_4')" value="19206"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_5" type="checkbox" id="SHSJLB_TZ372" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ372', 'SHSJLB_TG025_5')" value="19207"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_5" type="checkbox" id="SHSJLB_TZ373" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ373', 'SHSJLB_TG025_5')" value="19208"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_5" type="checkbox" id="SHSJLB_TZ374" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ374', 'SHSJLB_TG025_5')" value="19209"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG025_5" type="checkbox" id="SHSJLB_TZ375" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG025', 'SHSJLB_TZ375', 'SHSJLB_TG025_5')" value="19210"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    26.
                                                    家庭成员死亡</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_1" type="checkbox" id="SHSJLB_TZ376" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ376', 'SHSJLB_TG026_1')" value="19211"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_1" type="checkbox" id="SHSJLB_TZ377" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ377', 'SHSJLB_TG026_1')" value="19212"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_1" type="checkbox" id="SHSJLB_TZ378" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ378', 'SHSJLB_TG026_1')" value="19213"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_1" type="checkbox" id="SHSJLB_TZ379" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ379', 'SHSJLB_TG026_1')" value="19214"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG026_2" type="checkbox" id="SHSJLB_TZ380" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ380', 'SHSJLB_TG026_2')" value="19215"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG026_2" type="checkbox" id="SHSJLB_TZ381" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ381', 'SHSJLB_TG026_2')" value="19216"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG026_4" type="checkbox" id="SHSJLB_TZ382" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ382', 'SHSJLB_TG026_4')" value="19217"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG026_4" type="checkbox" id="SHSJLB_TZ383" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ383', 'SHSJLB_TG026_4')" value="19218"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG026_4" type="checkbox" id="SHSJLB_TZ384" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ384', 'SHSJLB_TG026_4')" value="19219"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG026_4" type="checkbox" id="SHSJLB_TZ385" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ385', 'SHSJLB_TG026_4')" value="19220"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG026_4" type="checkbox" id="SHSJLB_TZ386" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ386', 'SHSJLB_TG026_4')" value="19221"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_5" type="checkbox" id="SHSJLB_TZ387" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ387', 'SHSJLB_TG026_5')" value="19222"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_5" type="checkbox" id="SHSJLB_TZ388" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ388', 'SHSJLB_TG026_5')" value="19223"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_5" type="checkbox" id="SHSJLB_TZ389" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ389', 'SHSJLB_TG026_5')" value="19224"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG026_5" type="checkbox" id="SHSJLB_TZ390" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG026', 'SHSJLB_TZ390', 'SHSJLB_TG026_5')" value="19225"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    27.
                                                    本人重病或重伤</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_1" type="checkbox" id="SHSJLB_TZ391" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ391', 'SHSJLB_TG027_1')" value="19226"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_1" type="checkbox" id="SHSJLB_TZ392" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ392', 'SHSJLB_TG027_1')" value="19227"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_1" type="checkbox" id="SHSJLB_TZ393" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ393', 'SHSJLB_TG027_1')" value="19228"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_1" type="checkbox" id="SHSJLB_TZ394" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ394', 'SHSJLB_TG027_1')" value="19229"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG027_2" type="checkbox" id="SHSJLB_TZ395" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ395', 'SHSJLB_TG027_2')" value="19230"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG027_2" type="checkbox" id="SHSJLB_TZ396" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ396', 'SHSJLB_TG027_2')" value="19231"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG027_4" type="checkbox" id="SHSJLB_TZ397" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ397', 'SHSJLB_TG027_4')" value="19232"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG027_4" type="checkbox" id="SHSJLB_TZ398" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ398', 'SHSJLB_TG027_4')" value="19233"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG027_4" type="checkbox" id="SHSJLB_TZ399" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ399', 'SHSJLB_TG027_4')" value="19234"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG027_4" type="checkbox" id="SHSJLB_TZ400" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ400', 'SHSJLB_TG027_4')" value="19235"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG027_4" type="checkbox" id="SHSJLB_TZ401" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ401', 'SHSJLB_TG027_4')" value="19236"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_5" type="checkbox" id="SHSJLB_TZ402" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ402', 'SHSJLB_TG027_5')" value="19237"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_5" type="checkbox" id="SHSJLB_TZ403" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ403', 'SHSJLB_TG027_5')" value="19238"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_5" type="checkbox" id="SHSJLB_TZ404" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ404', 'SHSJLB_TG027_5')" value="19239"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG027_5" type="checkbox" id="SHSJLB_TZ405" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG027', 'SHSJLB_TZ405', 'SHSJLB_TG027_5')" value="19240"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    28.
                                                    住房紧张</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_1" type="checkbox" id="SHSJLB_TZ406" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ406', 'SHSJLB_TG028_1')" value="19241"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_1" type="checkbox" id="SHSJLB_TZ407" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ407', 'SHSJLB_TG028_1')" value="19242"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_1" type="checkbox" id="SHSJLB_TZ408" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ408', 'SHSJLB_TG028_1')" value="19243"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_1" type="checkbox" id="SHSJLB_TZ409" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ409', 'SHSJLB_TG028_1')" value="19244"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG028_2" type="checkbox" id="SHSJLB_TZ410" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ410', 'SHSJLB_TG028_2')" value="19245"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG028_2" type="checkbox" id="SHSJLB_TZ411" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ411', 'SHSJLB_TG028_2')" value="19246"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG028_4" type="checkbox" id="SHSJLB_TZ412" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ412', 'SHSJLB_TG028_4')" value="19247"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG028_4" type="checkbox" id="SHSJLB_TZ413" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ413', 'SHSJLB_TG028_4')" value="19248"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG028_4" type="checkbox" id="SHSJLB_TZ414" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ414', 'SHSJLB_TG028_4')" value="19249"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG028_4" type="checkbox" id="SHSJLB_TZ415" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ415', 'SHSJLB_TG028_4')" value="19250"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG028_4" type="checkbox" id="SHSJLB_TZ416" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ416', 'SHSJLB_TG028_4')" value="19251"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_5" type="checkbox" id="SHSJLB_TZ417" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ417', 'SHSJLB_TG028_5')" value="19252"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_5" type="checkbox" id="SHSJLB_TZ418" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ418', 'SHSJLB_TG028_5')" value="19253"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_5" type="checkbox" id="SHSJLB_TZ419" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ419', 'SHSJLB_TG028_5')" value="19254"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG028_5" type="checkbox" id="SHSJLB_TZ420" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG028', 'SHSJLB_TZ420', 'SHSJLB_TG028_5')" value="19255"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    29.
                                                    待业、无业</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_1" type="checkbox" id="SHSJLB_TZ421" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ421', 'SHSJLB_TG029_1')" value="19256"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_1" type="checkbox" id="SHSJLB_TZ422" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ422', 'SHSJLB_TG029_1')" value="19257"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_1" type="checkbox" id="SHSJLB_TZ423" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ423', 'SHSJLB_TG029_1')" value="19258"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_1" type="checkbox" id="SHSJLB_TZ424" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ424', 'SHSJLB_TG029_1')" value="19259"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG029_2" type="checkbox" id="SHSJLB_TZ425" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ425', 'SHSJLB_TG029_2')" value="19260"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG029_2" type="checkbox" id="SHSJLB_TZ426" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ426', 'SHSJLB_TG029_2')" value="19261"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG029_4" type="checkbox" id="SHSJLB_TZ427" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ427', 'SHSJLB_TG029_4')" value="19262"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG029_4" type="checkbox" id="SHSJLB_TZ428" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ428', 'SHSJLB_TG029_4')" value="19263"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG029_4" type="checkbox" id="SHSJLB_TZ429" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ429', 'SHSJLB_TG029_4')" value="19264"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG029_4" type="checkbox" id="SHSJLB_TZ430" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ430', 'SHSJLB_TG029_4')" value="19265"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG029_4" type="checkbox" id="SHSJLB_TZ431" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ431', 'SHSJLB_TG029_4')" value="19266"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_5" type="checkbox" id="SHSJLB_TZ432" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ432', 'SHSJLB_TG029_5')" value="19267"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_5" type="checkbox" id="SHSJLB_TZ433" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ433', 'SHSJLB_TG029_5')" value="19268"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_5" type="checkbox" id="SHSJLB_TZ434" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ434', 'SHSJLB_TG029_5')" value="19269"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG029_5" type="checkbox" id="SHSJLB_TZ435" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG029', 'SHSJLB_TZ435', 'SHSJLB_TG029_5')" value="19270"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    30.
                                                    开始就业</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_1" type="checkbox" id="SHSJLB_TZ436" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ436', 'SHSJLB_TG030_1')" value="19271"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_1" type="checkbox" id="SHSJLB_TZ437" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ437', 'SHSJLB_TG030_1')" value="19272"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_1" type="checkbox" id="SHSJLB_TZ438" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ438', 'SHSJLB_TG030_1')" value="19273"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_1" type="checkbox" id="SHSJLB_TZ439" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ439', 'SHSJLB_TG030_1')" value="19274"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG030_2" type="checkbox" id="SHSJLB_TZ440" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ440', 'SHSJLB_TG030_2')" value="19275"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG030_2" type="checkbox" id="SHSJLB_TZ441" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ441', 'SHSJLB_TG030_2')" value="19276"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG030_4" type="checkbox" id="SHSJLB_TZ442" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ442', 'SHSJLB_TG030_4')" value="19277"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG030_4" type="checkbox" id="SHSJLB_TZ443" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ443', 'SHSJLB_TG030_4')" value="19278"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG030_4" type="checkbox" id="SHSJLB_TZ444" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ444', 'SHSJLB_TG030_4')" value="19279"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG030_4" type="checkbox" id="SHSJLB_TZ445" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ445', 'SHSJLB_TG030_4')" value="19280"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG030_4" type="checkbox" id="SHSJLB_TZ446" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ446', 'SHSJLB_TG030_4')" value="19281"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_5" type="checkbox" id="SHSJLB_TZ447" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ447', 'SHSJLB_TG030_5')" value="19282"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_5" type="checkbox" id="SHSJLB_TZ448" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ448', 'SHSJLB_TG030_5')" value="19283"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_5" type="checkbox" id="SHSJLB_TZ449" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ449', 'SHSJLB_TG030_5')" value="19284"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG030_5" type="checkbox" id="SHSJLB_TZ450" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG030', 'SHSJLB_TZ450', 'SHSJLB_TG030_5')" value="19285"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    31.
                                                    高考失败</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_1" type="checkbox" id="SHSJLB_TZ451" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ451', 'SHSJLB_TG031_1')" value="19286"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_1" type="checkbox" id="SHSJLB_TZ452" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ452', 'SHSJLB_TG031_1')" value="19287"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_1" type="checkbox" id="SHSJLB_TZ453" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ453', 'SHSJLB_TG031_1')" value="19288"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_1" type="checkbox" id="SHSJLB_TZ454" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ454', 'SHSJLB_TG031_1')" value="19289"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG031_2" type="checkbox" id="SHSJLB_TZ455" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ455', 'SHSJLB_TG031_2')" value="19290"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG031_2" type="checkbox" id="SHSJLB_TZ456" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ456', 'SHSJLB_TG031_2')" value="19291"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG031_4" type="checkbox" id="SHSJLB_TZ457" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ457', 'SHSJLB_TG031_4')" value="19292"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG031_4" type="checkbox" id="SHSJLB_TZ458" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ458', 'SHSJLB_TG031_4')" value="19293"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG031_4" type="checkbox" id="SHSJLB_TZ459" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ459', 'SHSJLB_TG031_4')" value="19294"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG031_4" type="checkbox" id="SHSJLB_TZ460" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ460', 'SHSJLB_TG031_4')" value="19295"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG031_4" type="checkbox" id="SHSJLB_TZ461" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ461', 'SHSJLB_TG031_4')" value="19296"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_5" type="checkbox" id="SHSJLB_TZ462" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ462', 'SHSJLB_TG031_5')" value="19297"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_5" type="checkbox" id="SHSJLB_TZ463" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ463', 'SHSJLB_TG031_5')" value="19298"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_5" type="checkbox" id="SHSJLB_TZ464" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ464', 'SHSJLB_TG031_5')" value="19299"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG031_5" type="checkbox" id="SHSJLB_TZ465" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG031', 'SHSJLB_TZ465', 'SHSJLB_TG031_5')" value="19300"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    32.
                                                    扣发奖金或罚款</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_1" type="checkbox" id="SHSJLB_TZ466" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ466', 'SHSJLB_TG032_1')" value="19301"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_1" type="checkbox" id="SHSJLB_TZ467" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ467', 'SHSJLB_TG032_1')" value="19302"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_1" type="checkbox" id="SHSJLB_TZ468" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ468', 'SHSJLB_TG032_1')" value="19303"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_1" type="checkbox" id="SHSJLB_TZ469" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ469', 'SHSJLB_TG032_1')" value="19304"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG032_2" type="checkbox" id="SHSJLB_TZ470" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ470', 'SHSJLB_TG032_2')" value="19305"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG032_2" type="checkbox" id="SHSJLB_TZ471" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ471', 'SHSJLB_TG032_2')" value="19306"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG032_4" type="checkbox" id="SHSJLB_TZ472" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ472', 'SHSJLB_TG032_4')" value="19307"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG032_4" type="checkbox" id="SHSJLB_TZ473" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ473', 'SHSJLB_TG032_4')" value="19308"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG032_4" type="checkbox" id="SHSJLB_TZ474" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ474', 'SHSJLB_TG032_4')" value="19309"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG032_4" type="checkbox" id="SHSJLB_TZ475" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ475', 'SHSJLB_TG032_4')" value="19310"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG032_4" type="checkbox" id="SHSJLB_TZ476" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ476', 'SHSJLB_TG032_4')" value="19311"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_5" type="checkbox" id="SHSJLB_TZ477" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ477', 'SHSJLB_TG032_5')" value="19312"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_5" type="checkbox" id="SHSJLB_TZ478" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ478', 'SHSJLB_TG032_5')" value="19313"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_5" type="checkbox" id="SHSJLB_TZ479" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ479', 'SHSJLB_TG032_5')" value="19314"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG032_5" type="checkbox" id="SHSJLB_TZ480" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG032', 'SHSJLB_TZ480', 'SHSJLB_TG032_5')" value="19315"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    33.
                                                    突出的个人成就</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_1" type="checkbox" id="SHSJLB_TZ481" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ481', 'SHSJLB_TG033_1')" value="19316"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_1" type="checkbox" id="SHSJLB_TZ482" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ482', 'SHSJLB_TG033_1')" value="19317"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_1" type="checkbox" id="SHSJLB_TZ483" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ483', 'SHSJLB_TG033_1')" value="19318"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_1" type="checkbox" id="SHSJLB_TZ484" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ484', 'SHSJLB_TG033_1')" value="19319"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG033_2" type="checkbox" id="SHSJLB_TZ485" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ485', 'SHSJLB_TG033_2')" value="19320"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG033_2" type="checkbox" id="SHSJLB_TZ486" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ486', 'SHSJLB_TG033_2')" value="19321"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG033_4" type="checkbox" id="SHSJLB_TZ487" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ487', 'SHSJLB_TG033_4')" value="19322"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG033_4" type="checkbox" id="SHSJLB_TZ488" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ488', 'SHSJLB_TG033_4')" value="19323"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG033_4" type="checkbox" id="SHSJLB_TZ489" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ489', 'SHSJLB_TG033_4')" value="19324"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG033_4" type="checkbox" id="SHSJLB_TZ490" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ490', 'SHSJLB_TG033_4')" value="19325"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG033_4" type="checkbox" id="SHSJLB_TZ491" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ491', 'SHSJLB_TG033_4')" value="19326"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_5" type="checkbox" id="SHSJLB_TZ492" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ492', 'SHSJLB_TG033_5')" value="19327"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_5" type="checkbox" id="SHSJLB_TZ493" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ493', 'SHSJLB_TG033_5')" value="19328"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_5" type="checkbox" id="SHSJLB_TZ494" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ494', 'SHSJLB_TG033_5')" value="19329"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG033_5" type="checkbox" id="SHSJLB_TZ495" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG033', 'SHSJLB_TZ495', 'SHSJLB_TG033_5')" value="19330"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    34.
                                                    晋升、提级</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_1" type="checkbox" id="SHSJLB_TZ496" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ496', 'SHSJLB_TG034_1')" value="19331"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_1" type="checkbox" id="SHSJLB_TZ497" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ497', 'SHSJLB_TG034_1')" value="19332"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_1" type="checkbox" id="SHSJLB_TZ498" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ498', 'SHSJLB_TG034_1')" value="19333"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_1" type="checkbox" id="SHSJLB_TZ499" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ499', 'SHSJLB_TG034_1')" value="19334"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG034_2" type="checkbox" id="SHSJLB_TZ500" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ500', 'SHSJLB_TG034_2')" value="19335"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG034_2" type="checkbox" id="SHSJLB_TZ501" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ501', 'SHSJLB_TG034_2')" value="19336"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG034_4" type="checkbox" id="SHSJLB_TZ502" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ502', 'SHSJLB_TG034_4')" value="19337"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG034_4" type="checkbox" id="SHSJLB_TZ503" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ503', 'SHSJLB_TG034_4')" value="19338"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG034_4" type="checkbox" id="SHSJLB_TZ504" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ504', 'SHSJLB_TG034_4')" value="19339"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG034_4" type="checkbox" id="SHSJLB_TZ505" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ505', 'SHSJLB_TG034_4')" value="19340"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG034_4" type="checkbox" id="SHSJLB_TZ506" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ506', 'SHSJLB_TG034_4')" value="19341"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_5" type="checkbox" id="SHSJLB_TZ507" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ507', 'SHSJLB_TG034_5')" value="19342"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_5" type="checkbox" id="SHSJLB_TZ508" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ508', 'SHSJLB_TG034_5')" value="19343"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_5" type="checkbox" id="SHSJLB_TZ509" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ509', 'SHSJLB_TG034_5')" value="19344"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG034_5" type="checkbox" id="SHSJLB_TZ510" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG034', 'SHSJLB_TZ510', 'SHSJLB_TG034_5')" value="19345"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    35.
                                                    对现职工作不满意</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_1" type="checkbox" id="SHSJLB_TZ511" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ511', 'SHSJLB_TG035_1')" value="19346"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_1" type="checkbox" id="SHSJLB_TZ512" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ512', 'SHSJLB_TG035_1')" value="19347"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_1" type="checkbox" id="SHSJLB_TZ513" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ513', 'SHSJLB_TG035_1')" value="19348"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_1" type="checkbox" id="SHSJLB_TZ514" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ514', 'SHSJLB_TG035_1')" value="19349"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG035_2" type="checkbox" id="SHSJLB_TZ515" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ515', 'SHSJLB_TG035_2')" value="19350"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG035_2" type="checkbox" id="SHSJLB_TZ516" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ516', 'SHSJLB_TG035_2')" value="19351"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG035_4" type="checkbox" id="SHSJLB_TZ517" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ517', 'SHSJLB_TG035_4')" value="19352"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG035_4" type="checkbox" id="SHSJLB_TZ518" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ518', 'SHSJLB_TG035_4')" value="19353"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG035_4" type="checkbox" id="SHSJLB_TZ519" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ519', 'SHSJLB_TG035_4')" value="19354"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG035_4" type="checkbox" id="SHSJLB_TZ520" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ520', 'SHSJLB_TG035_4')" value="19355"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG035_4" type="checkbox" id="SHSJLB_TZ521" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ521', 'SHSJLB_TG035_4')" value="19356"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_5" type="checkbox" id="SHSJLB_TZ522" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ522', 'SHSJLB_TG035_5')" value="19357"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_5" type="checkbox" id="SHSJLB_TZ523" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ523', 'SHSJLB_TG035_5')" value="19358"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_5" type="checkbox" id="SHSJLB_TZ524" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ524', 'SHSJLB_TG035_5')" value="19359"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG035_5" type="checkbox" id="SHSJLB_TZ525" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG035', 'SHSJLB_TZ525', 'SHSJLB_TG035_5')" value="19360"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    36.
                                                    工作生活中压力大(如成绩不好)</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_1" type="checkbox" id="SHSJLB_TZ526" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ526', 'SHSJLB_TG036_1')" value="19361"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_1" type="checkbox" id="SHSJLB_TZ527" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ527', 'SHSJLB_TG036_1')" value="19362"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_1" type="checkbox" id="SHSJLB_TZ528" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ528', 'SHSJLB_TG036_1')" value="19363"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_1" type="checkbox" id="SHSJLB_TZ529" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ529', 'SHSJLB_TG036_1')" value="19364"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG036_2" type="checkbox" id="SHSJLB_TZ530" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ530', 'SHSJLB_TG036_2')" value="19365"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG036_2" type="checkbox" id="SHSJLB_TZ531" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ531', 'SHSJLB_TG036_2')" value="19366"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG036_4" type="checkbox" id="SHSJLB_TZ532" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ532', 'SHSJLB_TG036_4')" value="19367"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG036_4" type="checkbox" id="SHSJLB_TZ533" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ533', 'SHSJLB_TG036_4')" value="19368"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG036_4" type="checkbox" id="SHSJLB_TZ534" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ534', 'SHSJLB_TG036_4')" value="19369"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG036_4" type="checkbox" id="SHSJLB_TZ535" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ535', 'SHSJLB_TG036_4')" value="19370"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG036_4" type="checkbox" id="SHSJLB_TZ536" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ536', 'SHSJLB_TG036_4')" value="19371"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_5" type="checkbox" id="SHSJLB_TZ537" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ537', 'SHSJLB_TG036_5')" value="19372"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_5" type="checkbox" id="SHSJLB_TZ538" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ538', 'SHSJLB_TG036_5')" value="19373"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_5" type="checkbox" id="SHSJLB_TZ539" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ539', 'SHSJLB_TG036_5')" value="19374"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG036_5" type="checkbox" id="SHSJLB_TZ540" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG036', 'SHSJLB_TZ540', 'SHSJLB_TG036_5')" value="19375"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    37.
                                                    与上级关系紧张</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_1" type="checkbox" id="SHSJLB_TZ541" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ541', 'SHSJLB_TG037_1')" value="19376"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_1" type="checkbox" id="SHSJLB_TZ542" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ542', 'SHSJLB_TG037_1')" value="19377"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_1" type="checkbox" id="SHSJLB_TZ543" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ543', 'SHSJLB_TG037_1')" value="19378"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_1" type="checkbox" id="SHSJLB_TZ544" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ544', 'SHSJLB_TG037_1')" value="19379"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG037_2" type="checkbox" id="SHSJLB_TZ545" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ545', 'SHSJLB_TG037_2')" value="19380"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG037_2" type="checkbox" id="SHSJLB_TZ546" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ546', 'SHSJLB_TG037_2')" value="19381"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG037_4" type="checkbox" id="SHSJLB_TZ547" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ547', 'SHSJLB_TG037_4')" value="19382"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG037_4" type="checkbox" id="SHSJLB_TZ548" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ548', 'SHSJLB_TG037_4')" value="19383"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG037_4" type="checkbox" id="SHSJLB_TZ549" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ549', 'SHSJLB_TG037_4')" value="19384"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG037_4" type="checkbox" id="SHSJLB_TZ550" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ550', 'SHSJLB_TG037_4')" value="19385"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG037_4" type="checkbox" id="SHSJLB_TZ551" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ551', 'SHSJLB_TG037_4')" value="19386"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_5" type="checkbox" id="SHSJLB_TZ552" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ552', 'SHSJLB_TG037_5')" value="19387"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_5" type="checkbox" id="SHSJLB_TZ553" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ553', 'SHSJLB_TG037_5')" value="19388"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_5" type="checkbox" id="SHSJLB_TZ554" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ554', 'SHSJLB_TG037_5')" value="19389"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG037_5" type="checkbox" id="SHSJLB_TZ555" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG037', 'SHSJLB_TZ555', 'SHSJLB_TG037_5')" value="19390"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    38.
                                                    与同事邻居不和</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_1" type="checkbox" id="SHSJLB_TZ556" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ556', 'SHSJLB_TG038_1')" value="19391"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_1" type="checkbox" id="SHSJLB_TZ557" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ557', 'SHSJLB_TG038_1')" value="19392"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_1" type="checkbox" id="SHSJLB_TZ558" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ558', 'SHSJLB_TG038_1')" value="19393"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_1" type="checkbox" id="SHSJLB_TZ559" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ559', 'SHSJLB_TG038_1')" value="19394"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG038_2" type="checkbox" id="SHSJLB_TZ560" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ560', 'SHSJLB_TG038_2')" value="19395"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG038_2" type="checkbox" id="SHSJLB_TZ561" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ561', 'SHSJLB_TG038_2')" value="19396"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG038_4" type="checkbox" id="SHSJLB_TZ562" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ562', 'SHSJLB_TG038_4')" value="19397"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG038_4" type="checkbox" id="SHSJLB_TZ563" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ563', 'SHSJLB_TG038_4')" value="19398"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG038_4" type="checkbox" id="SHSJLB_TZ564" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ564', 'SHSJLB_TG038_4')" value="19399"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG038_4" type="checkbox" id="SHSJLB_TZ565" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ565', 'SHSJLB_TG038_4')" value="19400"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG038_4" type="checkbox" id="SHSJLB_TZ566" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ566', 'SHSJLB_TG038_4')" value="19401"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_5" type="checkbox" id="SHSJLB_TZ567" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ567', 'SHSJLB_TG038_5')" value="19402"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_5" type="checkbox" id="SHSJLB_TZ568" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ568', 'SHSJLB_TG038_5')" value="19403"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_5" type="checkbox" id="SHSJLB_TZ569" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ569', 'SHSJLB_TG038_5')" value="19404"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG038_5" type="checkbox" id="SHSJLB_TZ570" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG038', 'SHSJLB_TZ570', 'SHSJLB_TG038_5')" value="19405"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    39.
                                                    第一次远走他乡异国</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_1" type="checkbox" id="SHSJLB_TZ571" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ571', 'SHSJLB_TG039_1')" value="19406"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_1" type="checkbox" id="SHSJLB_TZ572" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ572', 'SHSJLB_TG039_1')" value="19407"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_1" type="checkbox" id="SHSJLB_TZ573" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ573', 'SHSJLB_TG039_1')" value="19408"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_1" type="checkbox" id="SHSJLB_TZ574" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ574', 'SHSJLB_TG039_1')" value="19409"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG039_2" type="checkbox" id="SHSJLB_TZ575" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ575', 'SHSJLB_TG039_2')" value="19410"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG039_2" type="checkbox" id="SHSJLB_TZ576" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ576', 'SHSJLB_TG039_2')" value="19411"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG039_4" type="checkbox" id="SHSJLB_TZ577" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ577', 'SHSJLB_TG039_4')" value="19412"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG039_4" type="checkbox" id="SHSJLB_TZ578" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ578', 'SHSJLB_TG039_4')" value="19413"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG039_4" type="checkbox" id="SHSJLB_TZ579" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ579', 'SHSJLB_TG039_4')" value="19414"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG039_4" type="checkbox" id="SHSJLB_TZ580" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ580', 'SHSJLB_TG039_4')" value="19415"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG039_4" type="checkbox" id="SHSJLB_TZ581" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ581', 'SHSJLB_TG039_4')" value="19416"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_5" type="checkbox" id="SHSJLB_TZ582" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ582', 'SHSJLB_TG039_5')" value="19417"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_5" type="checkbox" id="SHSJLB_TZ583" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ583', 'SHSJLB_TG039_5')" value="19418"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_5" type="checkbox" id="SHSJLB_TZ584" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ584', 'SHSJLB_TG039_5')" value="19419"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG039_5" type="checkbox" id="SHSJLB_TZ585" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG039', 'SHSJLB_TZ585', 'SHSJLB_TG039_5')" value="19420"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    40.
                                                    生活规律重大变动(饮食睡眠规律改变)</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_1" type="checkbox" id="SHSJLB_TZ586" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ586', 'SHSJLB_TG040_1')" value="19421"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_1" type="checkbox" id="SHSJLB_TZ587" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ587', 'SHSJLB_TG040_1')" value="19422"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_1" type="checkbox" id="SHSJLB_TZ588" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ588', 'SHSJLB_TG040_1')" value="19423"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_1" type="checkbox" id="SHSJLB_TZ589" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ589', 'SHSJLB_TG040_1')" value="19424"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG040_2" type="checkbox" id="SHSJLB_TZ590" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ590', 'SHSJLB_TG040_2')" value="19425"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG040_2" type="checkbox" id="SHSJLB_TZ591" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ591', 'SHSJLB_TG040_2')" value="19426"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG040_4" type="checkbox" id="SHSJLB_TZ592" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ592', 'SHSJLB_TG040_4')" value="19427"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG040_4" type="checkbox" id="SHSJLB_TZ593" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ593', 'SHSJLB_TG040_4')" value="19428"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG040_4" type="checkbox" id="SHSJLB_TZ594" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ594', 'SHSJLB_TG040_4')" value="19429"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG040_4" type="checkbox" id="SHSJLB_TZ595" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ595', 'SHSJLB_TG040_4')" value="19430"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG040_4" type="checkbox" id="SHSJLB_TZ596" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ596', 'SHSJLB_TG040_4')" value="19431"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_5" type="checkbox" id="SHSJLB_TZ597" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ597', 'SHSJLB_TG040_5')" value="19432"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_5" type="checkbox" id="SHSJLB_TZ598" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ598', 'SHSJLB_TG040_5')" value="19433"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_5" type="checkbox" id="SHSJLB_TZ599" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ599', 'SHSJLB_TG040_5')" value="19434"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG040_5" type="checkbox" id="SHSJLB_TZ600" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG040', 'SHSJLB_TZ600', 'SHSJLB_TG040_5')" value="19435"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    41.
                                                    本人退休离休或未安排具体工作</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_1" type="checkbox" id="SHSJLB_TZ601" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ601', 'SHSJLB_TG041_1')" value="19436"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_1" type="checkbox" id="SHSJLB_TZ602" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ602', 'SHSJLB_TG041_1')" value="19437"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_1" type="checkbox" id="SHSJLB_TZ603" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ603', 'SHSJLB_TG041_1')" value="19438"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_1" type="checkbox" id="SHSJLB_TZ604" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ604', 'SHSJLB_TG041_1')" value="19439"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG041_2" type="checkbox" id="SHSJLB_TZ605" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ605', 'SHSJLB_TG041_2')" value="19440"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG041_2" type="checkbox" id="SHSJLB_TZ606" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ606', 'SHSJLB_TG041_2')" value="19441"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG041_4" type="checkbox" id="SHSJLB_TZ607" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ607', 'SHSJLB_TG041_4')" value="19442"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG041_4" type="checkbox" id="SHSJLB_TZ608" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ608', 'SHSJLB_TG041_4')" value="19443"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG041_4" type="checkbox" id="SHSJLB_TZ609" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ609', 'SHSJLB_TG041_4')" value="19444"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG041_4" type="checkbox" id="SHSJLB_TZ610" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ610', 'SHSJLB_TG041_4')" value="19445"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG041_4" type="checkbox" id="SHSJLB_TZ611" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ611', 'SHSJLB_TG041_4')" value="19446"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_5" type="checkbox" id="SHSJLB_TZ612" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ612', 'SHSJLB_TG041_5')" value="19447"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_5" type="checkbox" id="SHSJLB_TZ613" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ613', 'SHSJLB_TG041_5')" value="19448"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_5" type="checkbox" id="SHSJLB_TZ614" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ614', 'SHSJLB_TG041_5')" value="19449"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG041_5" type="checkbox" id="SHSJLB_TZ615" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG041', 'SHSJLB_TZ615', 'SHSJLB_TG041_5')" value="19450"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    42.
                                                    好友重病或重伤</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_1" type="checkbox" id="SHSJLB_TZ616" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ616', 'SHSJLB_TG042_1')" value="19451"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_1" type="checkbox" id="SHSJLB_TZ617" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ617', 'SHSJLB_TG042_1')" value="19452"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_1" type="checkbox" id="SHSJLB_TZ618" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ618', 'SHSJLB_TG042_1')" value="19453"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_1" type="checkbox" id="SHSJLB_TZ619" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ619', 'SHSJLB_TG042_1')" value="19454"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG042_2" type="checkbox" id="SHSJLB_TZ620" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ620', 'SHSJLB_TG042_2')" value="19455"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG042_2" type="checkbox" id="SHSJLB_TZ621" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ621', 'SHSJLB_TG042_2')" value="19456"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG042_4" type="checkbox" id="SHSJLB_TZ622" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ622', 'SHSJLB_TG042_4')" value="19457"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG042_4" type="checkbox" id="SHSJLB_TZ623" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ623', 'SHSJLB_TG042_4')" value="19458"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG042_4" type="checkbox" id="SHSJLB_TZ624" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ624', 'SHSJLB_TG042_4')" value="19459"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG042_4" type="checkbox" id="SHSJLB_TZ625" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ625', 'SHSJLB_TG042_4')" value="19460"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG042_4" type="checkbox" id="SHSJLB_TZ626" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ626', 'SHSJLB_TG042_4')" value="19461"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_5" type="checkbox" id="SHSJLB_TZ627" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ627', 'SHSJLB_TG042_5')" value="19462"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_5" type="checkbox" id="SHSJLB_TZ628" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ628', 'SHSJLB_TG042_5')" value="19463"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_5" type="checkbox" id="SHSJLB_TZ629" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ629', 'SHSJLB_TG042_5')" value="19464"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG042_5" type="checkbox" id="SHSJLB_TZ630" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG042', 'SHSJLB_TZ630', 'SHSJLB_TG042_5')" value="19465"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    43.
                                                    好友死亡</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_1" type="checkbox" id="SHSJLB_TZ631" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ631', 'SHSJLB_TG043_1')" value="19466"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_1" type="checkbox" id="SHSJLB_TZ632" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ632', 'SHSJLB_TG043_1')" value="19467"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_1" type="checkbox" id="SHSJLB_TZ633" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ633', 'SHSJLB_TG043_1')" value="19468"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_1" type="checkbox" id="SHSJLB_TZ634" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ634', 'SHSJLB_TG043_1')" value="19469"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG043_2" type="checkbox" id="SHSJLB_TZ635" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ635', 'SHSJLB_TG043_2')" value="19470"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG043_2" type="checkbox" id="SHSJLB_TZ636" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ636', 'SHSJLB_TG043_2')" value="19471"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG043_4" type="checkbox" id="SHSJLB_TZ637" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ637', 'SHSJLB_TG043_4')" value="19472"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG043_4" type="checkbox" id="SHSJLB_TZ638" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ638', 'SHSJLB_TG043_4')" value="19473"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG043_4" type="checkbox" id="SHSJLB_TZ639" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ639', 'SHSJLB_TG043_4')" value="19474"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG043_4" type="checkbox" id="SHSJLB_TZ640" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ640', 'SHSJLB_TG043_4')" value="19475"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG043_4" type="checkbox" id="SHSJLB_TZ641" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ641', 'SHSJLB_TG043_4')" value="19476"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_5" type="checkbox" id="SHSJLB_TZ642" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ642', 'SHSJLB_TG043_5')" value="19477"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_5" type="checkbox" id="SHSJLB_TZ643" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ643', 'SHSJLB_TG043_5')" value="19478"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_5" type="checkbox" id="SHSJLB_TZ644" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ644', 'SHSJLB_TG043_5')" value="19479"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG043_5" type="checkbox" id="SHSJLB_TZ645" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG043', 'SHSJLB_TZ645', 'SHSJLB_TG043_5')" value="19480"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    44.
                                                    被人误会、错怪、诬告、议论</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_1" type="checkbox" id="SHSJLB_TZ646" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ646', 'SHSJLB_TG044_1')" value="19481"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_1" type="checkbox" id="SHSJLB_TZ647" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ647', 'SHSJLB_TG044_1')" value="19482"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_1" type="checkbox" id="SHSJLB_TZ648" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ648', 'SHSJLB_TG044_1')" value="19483"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_1" type="checkbox" id="SHSJLB_TZ649" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ649', 'SHSJLB_TG044_1')" value="19484"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG044_2" type="checkbox" id="SHSJLB_TZ650" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ650', 'SHSJLB_TG044_2')" value="19485"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG044_2" type="checkbox" id="SHSJLB_TZ651" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ651', 'SHSJLB_TG044_2')" value="19486"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG044_4" type="checkbox" id="SHSJLB_TZ652" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ652', 'SHSJLB_TG044_4')" value="19487"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG044_4" type="checkbox" id="SHSJLB_TZ653" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ653', 'SHSJLB_TG044_4')" value="19488"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG044_4" type="checkbox" id="SHSJLB_TZ654" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ654', 'SHSJLB_TG044_4')" value="19489"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG044_4" type="checkbox" id="SHSJLB_TZ655" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ655', 'SHSJLB_TG044_4')" value="19490"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG044_4" type="checkbox" id="SHSJLB_TZ656" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ656', 'SHSJLB_TG044_4')" value="19491"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_5" type="checkbox" id="SHSJLB_TZ657" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ657', 'SHSJLB_TG044_5')" value="19492"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_5" type="checkbox" id="SHSJLB_TZ658" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ658', 'SHSJLB_TG044_5')" value="19493"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_5" type="checkbox" id="SHSJLB_TZ659" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ659', 'SHSJLB_TG044_5')" value="19494"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG044_5" type="checkbox" id="SHSJLB_TZ660" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG044', 'SHSJLB_TZ660', 'SHSJLB_TG044_5')" value="19495"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    45.
                                                    介入民事法律纠纷</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_1" type="checkbox" id="SHSJLB_TZ661" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ661', 'SHSJLB_TG045_1')" value="19496"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_1" type="checkbox" id="SHSJLB_TZ662" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ662', 'SHSJLB_TG045_1')" value="19497"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_1" type="checkbox" id="SHSJLB_TZ663" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ663', 'SHSJLB_TG045_1')" value="19498"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_1" type="checkbox" id="SHSJLB_TZ664" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ664', 'SHSJLB_TG045_1')" value="19499"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG045_2" type="checkbox" id="SHSJLB_TZ665" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ665', 'SHSJLB_TG045_2')" value="19500"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG045_2" type="checkbox" id="SHSJLB_TZ666" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ666', 'SHSJLB_TG045_2')" value="19501"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG045_4" type="checkbox" id="SHSJLB_TZ667" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ667', 'SHSJLB_TG045_4')" value="19502"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG045_4" type="checkbox" id="SHSJLB_TZ668" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ668', 'SHSJLB_TG045_4')" value="19503"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG045_4" type="checkbox" id="SHSJLB_TZ669" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ669', 'SHSJLB_TG045_4')" value="19504"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG045_4" type="checkbox" id="SHSJLB_TZ670" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ670', 'SHSJLB_TG045_4')" value="19505"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG045_4" type="checkbox" id="SHSJLB_TZ671" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ671', 'SHSJLB_TG045_4')" value="19506"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_5" type="checkbox" id="SHSJLB_TZ672" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ672', 'SHSJLB_TG045_5')" value="19507"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_5" type="checkbox" id="SHSJLB_TZ673" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ673', 'SHSJLB_TG045_5')" value="19508"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_5" type="checkbox" id="SHSJLB_TZ674" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ674', 'SHSJLB_TG045_5')" value="19509"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG045_5" type="checkbox" id="SHSJLB_TZ675" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG045', 'SHSJLB_TZ675', 'SHSJLB_TG045_5')" value="19510"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    46.
                                                    被拘留、受审</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_1" type="checkbox" id="SHSJLB_TZ676" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ676', 'SHSJLB_TG046_1')" value="19511"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_1" type="checkbox" id="SHSJLB_TZ677" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ677', 'SHSJLB_TG046_1')" value="19512"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_1" type="checkbox" id="SHSJLB_TZ678" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ678', 'SHSJLB_TG046_1')" value="19513"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_1" type="checkbox" id="SHSJLB_TZ679" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ679', 'SHSJLB_TG046_1')" value="19514"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG046_2" type="checkbox" id="SHSJLB_TZ680" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ680', 'SHSJLB_TG046_2')" value="19515"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG046_2" type="checkbox" id="SHSJLB_TZ681" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ681', 'SHSJLB_TG046_2')" value="19516"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG046_4" type="checkbox" id="SHSJLB_TZ682" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ682', 'SHSJLB_TG046_4')" value="19517"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG046_4" type="checkbox" id="SHSJLB_TZ683" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ683', 'SHSJLB_TG046_4')" value="19518"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG046_4" type="checkbox" id="SHSJLB_TZ684" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ684', 'SHSJLB_TG046_4')" value="19519"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG046_4" type="checkbox" id="SHSJLB_TZ685" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ685', 'SHSJLB_TG046_4')" value="19520"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG046_4" type="checkbox" id="SHSJLB_TZ686" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ686', 'SHSJLB_TG046_4')" value="19521"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_5" type="checkbox" id="SHSJLB_TZ687" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ687', 'SHSJLB_TG046_5')" value="19522"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_5" type="checkbox" id="SHSJLB_TZ688" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ688', 'SHSJLB_TG046_5')" value="19523"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_5" type="checkbox" id="SHSJLB_TZ689" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ689', 'SHSJLB_TG046_5')" value="19524"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG046_5" type="checkbox" id="SHSJLB_TZ690" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG046', 'SHSJLB_TZ690', 'SHSJLB_TG046_5')" value="19525"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    47.
                                                    失窃、财产损失</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_1" type="checkbox" id="SHSJLB_TZ691" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ691', 'SHSJLB_TG047_1')" value="19526"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_1" type="checkbox" id="SHSJLB_TZ692" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ692', 'SHSJLB_TG047_1')" value="19527"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_1" type="checkbox" id="SHSJLB_TZ693" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ693', 'SHSJLB_TG047_1')" value="19528"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_1" type="checkbox" id="SHSJLB_TZ694" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ694', 'SHSJLB_TG047_1')" value="19529"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG047_2" type="checkbox" id="SHSJLB_TZ695" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ695', 'SHSJLB_TG047_2')" value="19530"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG047_2" type="checkbox" id="SHSJLB_TZ696" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ696', 'SHSJLB_TG047_2')" value="19531"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG047_4" type="checkbox" id="SHSJLB_TZ697" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ697', 'SHSJLB_TG047_4')" value="19532"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG047_4" type="checkbox" id="SHSJLB_TZ698" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ698', 'SHSJLB_TG047_4')" value="19533"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG047_4" type="checkbox" id="SHSJLB_TZ699" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ699', 'SHSJLB_TG047_4')" value="19534"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG047_4" type="checkbox" id="SHSJLB_TZ700" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ700', 'SHSJLB_TG047_4')" value="19535"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG047_4" type="checkbox" id="SHSJLB_TZ701" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ701', 'SHSJLB_TG047_4')" value="19536"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_5" type="checkbox" id="SHSJLB_TZ702" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ702', 'SHSJLB_TG047_5')" value="19537"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_5" type="checkbox" id="SHSJLB_TZ703" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ703', 'SHSJLB_TG047_5')" value="19538"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_5" type="checkbox" id="SHSJLB_TZ704" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ704', 'SHSJLB_TG047_5')" value="19539"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG047_5" type="checkbox" id="SHSJLB_TZ705" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG047', 'SHSJLB_TZ705', 'SHSJLB_TG047_5')" value="19540"></td>
                                                
                                        </tr>
                                    
                                        <tr align="center" style="height: 40px;">
                                            <td align="left" style="width: 40%">
                                                <dt>
                                                    48.
                                                    意外惊吓、发生事故、自然灾害</dt>
                                            </td>
                                            
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_1" type="checkbox" id="SHSJLB_TZ706" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ706', 'SHSJLB_TG048_1')" value="19541"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_1" type="checkbox" id="SHSJLB_TZ707" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ707', 'SHSJLB_TG048_1')" value="19542"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_1" type="checkbox" id="SHSJLB_TZ708" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ708', 'SHSJLB_TG048_1')" value="19543"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_1" type="checkbox" id="SHSJLB_TZ709" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ709', 'SHSJLB_TG048_1')" value="19544"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG048_2" type="checkbox" id="SHSJLB_TZ710" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ710', 'SHSJLB_TG048_2')" value="19545"></td>
                                                
                                                    <td style="width:7.5%"><input name="SHSJLB_TG048_2" type="checkbox" id="SHSJLB_TZ711" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ711', 'SHSJLB_TG048_2')" value="19546"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG048_4" type="checkbox" id="SHSJLB_TZ712" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ712', 'SHSJLB_TG048_4')" value="19547"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG048_4" type="checkbox" id="SHSJLB_TZ713" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ713', 'SHSJLB_TG048_4')" value="19548"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG048_4" type="checkbox" id="SHSJLB_TZ714" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ714', 'SHSJLB_TG048_4')" value="19549"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG048_4" type="checkbox" id="SHSJLB_TZ715" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ715', 'SHSJLB_TG048_4')" value="19550"></td>
                                                
                                                    <td style="width:3%"><input name="SHSJLB_TG048_4" type="checkbox" id="SHSJLB_TZ716" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ716', 'SHSJLB_TG048_4')" value="19551"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_5" type="checkbox" id="SHSJLB_TZ717" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ717', 'SHSJLB_TG048_5')" value="19552"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_5" type="checkbox" id="SHSJLB_TZ718" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ718', 'SHSJLB_TG048_5')" value="19553"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_5" type="checkbox" id="SHSJLB_TZ719" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ719', 'SHSJLB_TG048_5')" value="19554"></td>
                                                
                                                    <td style="width:3.75%"><input name="SHSJLB_TG048_5" type="checkbox" id="SHSJLB_TZ720" onclick="AjaxOnCheckRedio('SHSJLB', 'SHSJLB_TG048', 'SHSJLB_TZ720', 'SHSJLB_TG048_5')" value="19555"></td>
                                                
                                        </tr>
                                    
                            </tbody></table>
                        </li>
                    </ul>
    </div>
    <script src="../../JS/jquery-1.10.2.js"></script>
    <script>
        $('#tableid input[type="checkbox"]').on('click', function () {
            var that = this;
            //$(this).closest('table').find('tr > td:first-child input:checkbox').each(function () {
            //    this.checked = that.checked;
            //    $(this).closest('tr').toggleClass('selected');
            //});
            if ($(this).attr("checked") == true) {
               $("#tableid input[type='checkbox']").attr("checked", false);
               $(this).attr("checked", true);
            }

        });
        function AjaxOnCheckRedio(sid, tdid, tbid, did) {
            //alert(sid);
            //alert("sid:"+sid+",tdid:"+tdid+",tbid:"+tbid);
            var objs = document.getElementsByName(did);
            //for (var i = 0; i < objs.length; i++) {
            //    var item = objs[i];
            //    if (item.id != tbid) {
            //        item.checked = false;
            //    }
            //}
            //var rid = document.getElementById("R_ID").value;

        }
    </script>
</asp:Content>
