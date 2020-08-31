<%@ Page Title="allusers" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="allusers.aspx.cs" Inherits="test3.allusers" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <asp:GridView ID="gvallusers" runat="server" AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="ID" ShowHeaderWhenEmpty="true"
         OnRowCommand="gvallusers_RowCommand" OnRowEditing="gvallusers_RowEditing" OnRowCancelingEdit="gvallusers_RowCancelingEdit"
         OnRowUpdating="gvallusers_RowUpdating" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Width="976px" Height="195px">
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
                <FooterTemplate>
                    <asp:TextBox ID="tbnameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Surname">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Surname") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbsurname" runat="server" Text='<%#Eval("Surname") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbsurnameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Email") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbemail" runat="server" Text='<%#Eval("Email") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbemailFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phone_Number">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Phone_num") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbphonenum" runat="server" Text='<%#Eval("Phone_num") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbphonenumFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Reigon">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Reigon") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbreigon" runat="server" Text='<%#Eval("Reigon") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbreigonFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

           <%--  <asp:TemplateField HeaderText="Task">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Task") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbtask" runat="server" Text='<%#Eval("Task") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbtaskFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Place">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("place") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbplace" runat="server" Text='<%#Eval("place") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbplaceFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>--%>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button Text="Edit" runat="server" CommandName="Edit" ToolTip="Edit"  />
                    <%--<asp:Button Text="Delete" runat="server" CommandName="Delete" ToolTip="Delete" BackColor="Red" />--%>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button Text="Update" runat="server" CommandName="Update" ToolTip="Update"  />
                    <asp:Button Text="Cancel" runat="server" CommandName="Cancel" ToolTip="Cancel"  />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button Text="AddNew" runat="server" CommandName="AddNew" ToolTip="Add New" BackColor="Yellow" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
        <br />
        <asp:Label ID="lblsucces" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblerror" runat="server" ForeColor="red" />
</div>
</asp:content>

