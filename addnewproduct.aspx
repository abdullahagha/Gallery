<%@ Page Title="addnewproduct" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addnewproduct.aspx.cs" Inherits="test3.addnewproduct" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <td>
                <h1>Add product page</h1>
            </td>
        </tr>
       
        <tr>
            <td>Product Name</td>
            <%--<td><dx:ASPxTextBox ID="tbproname" runat="server"></dx:ASPxTextBox> </td>--%>
            <td>
                <asp:TextBox ID="tbproname" runat="server" EnableViewState="true"></asp:TextBox>
            </td>
        </tr>
     

        <tr>
            <td>Product Description</td>
            <%--    <td><dx:ASPxTextBox ID="tbprodesc" runat="server"></dx:ASPxTextBox> </td>--%>
            <td>
                <asp:TextBox ID="tbprodesc" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Product Price</td>
            <%--  <td><dx:ASPxTextBox ID="tbproprice" runat="server"></dx:ASPxTextBox> </td>--%>
            <td>
                <asp:TextBox ID="tbproprice" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Product Image</td>
            <td>

                <asp:FileUpload ID="fuproimage" runat="server"/>
            </td>
        </tr>


        <tr>
            <td colspan="2" align="center">
                <%--    <dx:aspxbutton ID="btnupload" runat="server" text="upload" />--%>
                <asp:Button ID="btnupload" runat="server" Text="upload"  OnClick="btnupload_click" />
            </td>
        </tr>

         <tr>
            <td>
                
                <asp:Label ID="Label4" runat="server" />
            </td>
        </tr>
      

    </table>

    </asp:content>
