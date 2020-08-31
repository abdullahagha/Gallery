<%@ Page Title="Accountinformation" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Accountinformation.aspx.cs" Inherits="test3.Accountinformation" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">




<div style="width: 1695px; height: 138px">
      <asp:GridView ID="gvallusers" runat="server" AutoGenerateColumns="false" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
         OnRowEditing="gvallusers_RowEditing" OnRowCancelingEdit="gvallusers_RowCancelingEdit"
         OnRowUpdating="gvallusers_RowUpdating" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1216px" Height="62px" style="margin-bottom: 0px">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

        <Columns>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Name") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbname" runat="server" Text='<%#Eval("Name") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Surname">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Surname") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbsurname" runat="server" Text='<%#Eval("Surname") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Email") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbemail" runat="server" Text='<%#Eval("Email") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone_Number">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Phone_num") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbphonenum" runat="server" Text='<%#Eval("Phone_num") %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reigon">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Reigon") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbreigon" runat="server" Text='<%#Eval("Reigon") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

      <%--      <asp:TemplateField HeaderText="user_name">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("user_name") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbusername" runat="server" Text='<%#Eval("user_name") %>' />
                </EditItemTemplate>
            </asp:TemplateField>--%>

          
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button Text="Edit" runat="server" CommandName="Edit" ToolTip="Edit"  />  
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button Text="Update" runat="server" CommandName="Update" ToolTip="Update"  />
                    <asp:Button Text="Cancel" runat="server" CommandName="Cancel" ToolTip="Cancel"  />
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
          </asp:GridView>
    <asp:Label ID="lblsucces" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblerror" runat="server" ForeColor="red" />
</div>




    <asp:LinkButton ID="lnk_changepassword" runat="server" 
         OnClick="btnchangepassword_Click">Change Password</asp:LinkButton>









    </asp:Content>