<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="AppointmentManagement1.aspx.cs" Inherits="CrisisInterfere.FunctionModular.AppointmentConsult.AppointmentManagement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPages" runat="server">
    <link href="../../CSS/x_yuyueguanli.css" rel="stylesheet" />
  <div class="row">
                        <div class="form-group  text-right" style="margin-top: 20px">
                            <label class="col-sm-3  col-xs-4 control-label">*时间段:</label>
                            <div class="col-sm-6 col-xs-6">
                                <select id="startHour" class="col-md-4">
                                    <option>00</option>
                                    <option>01</option>                                    
                                </select>
                                <span class="col-md-1">&nbsp;</span>
                               <select id="aa" class="col-md-4">
                                    <option>00</option>
                                    <option>01</option>                                    
                                </select>
                            </div>
                             <div class="col-sm-6 col-xs-6">
                                <select id="endHour" class="col-md-4">
                                    <option>00</option>
                                    <option>01</option>                                    
                                </select>
                                <span class="col-md-1">&nbsp;</span>
                               <select id="bb" class="col-md-4">
                                    <option>00</option>
                                    <option>01</option>                                    
                                </select>
                            </div>
                        </div>
                    </div>
  
</asp:Content>
