<%@ Page Title="Forget" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Forget.aspx.cs" Inherits="test3.Forget" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div >
        <table style="position: center; margin: 0px auto;">
            <tr>
                <td style="width: 150px">
                    <dx:ASPxLabel ID="lblEmail" runat="server" Text="Enter your Email address"></dx:ASPxLabel>

                </td>
                <td>
                    <dx:ASPxTextBox ID="tbEmail" runat="server" Text='<%# Bind("Username") %>' ErrorDisplayMode="Text">
                        <ValidationSettings SetFocusOnError="true" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                            <RequiredField IsRequired="true" ErrorText="required" />
                               <RegularExpression ErrorText="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        </ValidationSettings>
                        </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 30px">
                    <dx:ASPxButton ID="btnContinue" OnClick="btnContinue_Click" Text="Continue" runat="server"  Width="70px" Height="50px" ValidationGroup="EditForm" ValidateRequestMode="Enabled" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>