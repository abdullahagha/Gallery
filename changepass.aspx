<%@ Page Title="changepass" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="changepass.aspx.cs" Inherits="test3.changepass" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <div> 
        <asp:Label ID="Label1" runat="server" Text="Current password" Width="120px" 
            Font-Bold="True" ForeColor="#996633"></asp:Label>
        <asp:TextBox ID="txt_cpassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txt_cpassword" 
            ErrorMessage="Please enter Current password"></asp:RequiredFieldValidator>
        <br />
         <asp:Label ID="Label2" runat="server" Text="New password" Width="120px" 
            Font-Bold="True" ForeColor="#996633"></asp:Label>
        <asp:TextBox ID="txt_npassword" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txt_npassword" ErrorMessage="Please enter New password"></asp:RequiredFieldValidator>
        <br />
        
         <asp:Label ID="Label3" runat="server" Text="Confirm password" Width="120px" 
            Font-Bold="True" ForeColor="#996633"></asp:Label>

        <asp:TextBox ID="txt_ccpassword" runat="server" TextMode="Password"></asp:TextBox>   

        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="txt_ccpassword" 
            ErrorMessage="Please enter Confirm  password"></asp:RequiredFieldValidator>

        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="txt_npassword" ControlToValidate="txt_ccpassword" 
            ErrorMessage="Password Mismatch"></asp:CompareValidator>    
    </div>
    <asp:Button ID="btn_update" runat="server" Font-Bold="True" BackColor="#CCFF99"  OnClick="btn_update_Click" Text="Update" />
    <asp:Label ID="lbl_msg" Font-Bold="True" BackColor="#FFFF66" ForeColor="#FF3300" runat="server" Text=""></asp:Label><br />
 



    </asp:Content>