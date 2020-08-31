<%@ Page Title="SignUP" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SignUP.aspx.cs" Inherits="test3.SignUP" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">



    <h2>Creat account </h2>

    <table style="position: center; margin: 0px auto;">
        <tr>
            <td style="width: 50px">
                <dx:ASPxLabel ID="lblyourname" runat="server" Text="Name"></dx:ASPxLabel>
            </td>
            <%--  <td style="width: 15px">:</td>--%>
            <td>
                <dx:ASPxTextBox ID="tbyourname" runat="server" Text='<%# Bind("Username") %>' ErrorDisplayMode="Text">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
         <tr>
            <td style="width: 50px">
                <dx:ASPxLabel ID="lblsurname" runat="server" Text="Surname"></dx:ASPxLabel>
            </td>
            <%--  <td style="width: 15px">:</td>--%>
            <td>
                <dx:ASPxTextBox ID="tbsurname" runat="server" Text='<%# Bind("Surname") %>' ErrorDisplayMode="Text">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
         <tr>
                        <td style="width: 30px">

                            <dx:ASPxLabel ID="lblusername" runat="server" Text="Username"></dx:ASPxLabel>

                        </td>
                       
                        <td>

                            <dx:ASPxTextBox ID="tbusername" runat="server" Text='<%# Bind("Username") %>' ErrorDisplayMode="Text">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Required" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>

                    </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblEmail" runat="server" Text="Email"></dx:ASPxLabel>
            </td>


            <%--     <td style="width: 15px">:</td>--%>


            <td>
                <dx:ASPxTextBox ID="tbEmail" runat="server" Text='<%# Bind("Email") %>' ErrorDisplayMode="Text">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Required" />
                        <RegularExpression ErrorText="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>

        </tr>
        <tr>
            <td style="width: 45px">
                <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <%--<td style="width: 15px">:</td>--%>

            <td>

                <dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="100%" ID="tbPassword" EncodeHtml="false"
                    ClientInstanceName="Name" OnValidation="NameTextBox_Validation" Password="True">
                    <ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least <br /> two characters long" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="required" />
                    </ValidationSettings>
                    <ClientSideEvents Validation="onNameValidation" />

                </dx:ASPxTextBox>
            </td>

        </tr>
        <tr>
            <td style="width: 45px">
                <dx:ASPxLabel ID="lblrepassword" runat="server" Text="repassword"></dx:ASPxLabel>
            </td>
            <%--<td style="width: 15px">:</td>--%>
            <td>
                <dx:ASPxTextBox ID="tbrepassword" runat="server" Text='<%# Bind("repassword") %>' ErrorDisplayMode="Text">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblReigon" runat="server" Text="Reigon"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbReigon" DropDownStyle="DropDown" runat="server" NullText="Select your country">
                    <ClearButton DisplayMode="OnHover" />
                    <ValidationSettings ValidationGroup="Validation" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="True">
                        <RequiredField IsRequired="true" ErrorText="selecet country" />
                    </ValidationSettings>
                    <Items>
                        <dx:ListEditItem Value="IRAQ" />
                        <dx:ListEditItem Value="TURKEY" />
                        <dx:ListEditItem Value="FRANCE" />
                        <dx:ListEditItem Value="TILAND" />
                        <dx:ListEditItem Value="RUSSIA" />
                        <dx:ListEditItem Value="MALISIA" />
                        <dx:ListEditItem Value="NORWAY" />
                        <dx:ListEditItem Value="SWEEDEN" />
                        <dx:ListEditItem Value="POLANDA" />
                        <dx:ListEditItem Value="LEBNAN" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
      <tr>
            <td style="width: 45px">
                <asp:Label ID="lblphone" runat="server" Text="Phone"></asp:Label>
            </td>
            <%--<td style="width: 15px">:</td>--%>

            <td>

      
                <dx:ASPxTextBox ID="tbphone" runat="server" Text='<%# Bind("phone") %>' ErrorDisplayMode="Text">
                    <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Required" />
                    </ValidationSettings>
                </dx:ASPxTextBox>
            </td>

        </tr>
        <tr>
            <td>
                <dx:ASPxButton ID="btnEnter" runat="server" OnClick="btnEnter_Click" Text="Login" Width="75px" Height="30px" BackColor="Red" />
            </td>
            <td>
                <dx:ASPxButton ID="btnSignUP" runat="server" OnClick="btnSignUP_Click" Text="SignUP" Width="75px" Height="30px" ValidationGroup="EditForm" ValidateRequestMode="Enabled" />
            </td>
        </tr>

    </table>


    <dx:ASPxTextBox ID="tbid" runat="server" Visible="false" Text=""></dx:ASPxTextBox>


</asp:Content>


