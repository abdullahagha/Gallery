<%@ Page Title="add_productt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="add_productt.aspx.cs" Inherits="test3.add_productt" %>





<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <td>
                <h1>Add product page</h1>
            </td>
        </tr>

        <tr>
            <td>Product ID</td>
            <td>
                <asp:TextBox ID="tbID" runat="server" ReadOnly="true"></asp:TextBox></td>

        </tr>

        <tr>
            <td>Product Name</td>
            <td>
                <asp:TextBox ID="tbproname" runat="server"></asp:TextBox>
            </td>
        </tr>


        <tr>
            <td>Product Description</td>
            <td>
                <asp:TextBox ID="tbprodesc" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td>Product Price</td>
            <td>
                <asp:TextBox ID="tbproprice" runat="server"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_click" />
            </td>
        </tr>

        <tr>
            <td>

                <asp:Label ID="Label3" runat="server" />
            </td>
        </tr>


    </table>

    <asp:Panel ID="Panel" runat="server"  >
        <table>

            <tr>
                <td>Picture Name</td>
                <td>
                    <asp:TextBox ID="tbpicname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>isPreview</td>
                <td>
                    <asp:CheckBox ID="cbpreview" runat="server" /></td>
            </tr>

            <tr>
                <td>Product Image</td>
                <td>

                    <asp:FileUpload ID="fuproimage" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnupload" runat="server" Text="Upload" OnClick="btnupload_click"   /></td>
            </tr>
            <tr>
                <td>

                    <asp:Label ID="Label4" runat="server" />
                </td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>
