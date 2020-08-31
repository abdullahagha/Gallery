<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="test3.Contact" %>
<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function onNameValidation(s, e) {
            var name = e.value;
            if (name == null)
                return;
            if (name.length < 2)
                e.isValid = false;
        }
        function onAgeValidation(s, e) {
            var age = e.value;
            if (age == null || age == "")
                return;
            var digits = "0123456789";
            for (var i = 0; i < age.length; i++) {
                if (digits.indexOf(age.charAt(i)) == -1) {
                    e.isValid = false;
                    break;
                }
            }
            if (e.isValid && age.charAt(0) == '0') {
                age = age.replace(/^0+/, "");
                if (age.length == 0)
                    age = "0";
                e.value = age;
            }
            if (age < 18)
                e.isValid = false;
        }
        function onArrivalDateValidation(s, e) {
            var selectedDate = s.date;
            if (selectedDate == null || selectedDate == false)
                return;
            var currentDate = new Date();
            if (currentDate.getFullYear() != selectedDate.getFullYear() || currentDate.getMonth() != selectedDate.getMonth())
                e.isValid = false;
        }
        function clearEditors(s, e) {
            var container = document.getElementsByClassName("clientContainer")[0];
            ASPxClientEdit.ClearEditorsInContainer(container);
        }
    </script>

    <table style="position: center; margin: 50px auto;">
        <tr>
            <td>
                <dx:ASPxLabel ID="lblName" runat="server" Text="Name*" maxlength="60" Style="width: 250px;"></dx:ASPxLabel>
            </td>
            <td>
                <%--<dx:ASPxTextBox ID="tbName" runat="server" Text ='<%# Bind("Name") %>' ValidationSettings-ErrorDisplayMode="Text">
                  
                 <ValidationSettings SetFocusOnError="True" ValidationGroup="EditForm" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Required" />
                    </ValidationSettings>
                     </dx:ASPxTextBox>--%>

                <dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="100%" ID="tbName" EncodeHtml="false"
                    ClientInstanceName="Name" OnValidation="NameTextBox_Validation">
                    <ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least <br /> two characters long" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="required" />
                    </ValidationSettings>
                    <ClientSideEvents Validation="onNameValidation" />

                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblPhonenumber" runat="server" Text="Phone number" maxlength="43" Style="width: 250px;"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="tbPhonenumber" runat="server" Text='<%# Bind("Phonenumber") %>' ValidationSettings-ErrorDisplayMode="Text">
                   
                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblEmail" runat="server" Text="Email*"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="100%" ID="tbEmail"
                    ClientInstanceName="Email">
                    <ValidationSettings SetFocusOnError="True" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RegularExpression ErrorText="Invalid e-mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                        <RequiredField IsRequired="True" ErrorText="required" />
                    </ValidationSettings>

                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblComments" runat="server" Text="Comments*"></dx:ASPxLabel>
            </td>
            <td>


                <dx:ASPxTextBox runat="server" EnableClientSideAPI="True" Width="100%" ID="tbComments" EncodeHtml="false"
                    ClientInstanceName="Name" OnValidation="NameTextBox_Validation">
                    <ValidationSettings SetFocusOnError="True" ErrorText="Name must be at least <br /> two characters long" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="required" />
                    </ValidationSettings>
                    <ClientSideEvents Validation="onNameValidation" />

                </dx:ASPxTextBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="lblrequired" runat="server" Text="*required"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxButton ID="btnSubmit" runat="server" OnClick="btnSubmit_click" Text="Submit" Width="75px" Height="30px" />
            </td>

        </tr>
    </table>



</asp:Content> 
