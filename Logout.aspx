<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="test3.Logout" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    


 <tr>
            <td style="width: 50px">
                <dx:ASPxLabel ID="lbllogout" runat="server" Text=""></dx:ASPxLabel>
            </td>
           <td>
                <dx:ASPxButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" Text="Log out" Width="75px" Height="30px" />
           </td>
        </tr>

</asp:Content>