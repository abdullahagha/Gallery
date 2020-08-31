<%@ Page Title="Admin"  Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="test3.Admin" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table>


    <h1>Welcome Admin</h1>
        <tr>
            <td><dx:ASPxButton ID="btnpro" runat="server" text="Add Product" OnClick="btnpro_click"></dx:ASPxButton></td>
            <td><dx:ASPxButton ID="btnuser" runat="server" Text="Edit users" OnClick="btnuser_click"></dx:ASPxButton></td>
            <td><dx:ASPxButton ID="btnadmin" runat="server" text="Add Admin" OnClick="btnadmin_click"></dx:ASPxButton></td>
        </tr>
        <tr>
           <td><dx:ASPxButton ID="btnproduct" runat="server" text="Product" OnClick="btnproduct_Click"></dx:ASPxButton></td>
            <td><dx:ASPxButton ID="btnorders" runat="server" text="Orders" OnClick="btnorders_click" /></td>
        </tr>
    
    </table>
</asp:Content>