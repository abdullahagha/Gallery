<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="test3.Login" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            form {
                border: 3px solid #f1f1f1;
            }

            input[type=text], input[type=password] {
                width: 100%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            button {
                background-color: #4CAF50;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

                button:hover {
                    opacity: 0.8;
                }

            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            .imgcontainer {
                text-align: center;
                margin: 24px 0 12px 0;
            }

            img.avatar {
                width: 40%;
                border-radius: 50%;
            }

            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                    display: block;
                    float: none;
                }

                .cancelbtn {
                    width: 100%;
                }
            }
        </style>
    </head>
    <body>

        <h2>Login Form</h2>
        
        <form action="/action_page.php">
            <div class="imgcontainer">
                <img src="http://boshkids.co.uk/static/img/login-avatar.png" alt="Avatar" class="avatar">
            </div>

            <div class="container">
                <table style="position: center; margin: 0px auto;">
                    <tr>
                        <td style="width: 30px">

                            <dx:ASPxLabel ID="lblusername" runat="server" Text="Username"></dx:ASPxLabel>

                        </td>
                        <td style="width: 15px">:</td>
                        <td>
                            <%--         <dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="100%" ID="tbusername" EncodeHtml="false"
                    ClientInstanceName="Name" OnValidation="NameTextBox_Validation">
                    <ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least <br /> two characters long" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="required" />
                    </ValidationSettings>
                    <ClientSideEvents Validation="onNameValidation" />
                    
                </dx:ASPxTextBox>--%>

                            <dx:ASPxTextBox ID="tbusername" runat="server" Text='<%# Bind("Username") %>' ErrorDisplayMode="Text">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Required" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>

                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxLabel ID="lblpassword" runat="server" Text="Password"></dx:ASPxLabel>
                        </td>
                        <td style="width: 15px">:</td>
                        <td>
                            <dx:ASPxTextBox ID="tbpassword" runat="server" Text='<%# Bind("Password") %>' ErrorDisplayMode="Text">
                                <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Required" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 120px">
                            <span class="psw">Forgot <a href="Forget">password?</a></span>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 30px">
                            <dx:ASPxButton ID="btncancel" OnClick="btncancel_Click" Text="Exit" runat="server" Width="70px" Height="50px" BackColor="Red" />
                        </td>
                        <td></td>
                        <td>
                            <dx:ASPxButton ID="btnEnter" OnClick="btnEnter_Click" Text="Login" runat="server" Width="70px" Height="50px" BackColor="Green" ValidationGroup="EditForm" ValidateRequestMode="Enabled" />
                        </td>
                    </tr>
                </table>
            </div>

        </form>

    </body>
    </html>

</asp:Content>
