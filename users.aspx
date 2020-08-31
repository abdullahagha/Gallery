<%@ Page Title="users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="test3.users" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:GridView ID="gvusers" runat="server" AutoGenerateColumns="False" OnRowUpdating="gvusers_RowUpdating" OnRowEditing="gvusers_RowEditing"
            OnRowCancelingEdit="gvusers_RowCancelingEdit" DataKeyNames="Person_ID" 
            BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="845px">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText=" Name"  ReadOnly="true" />
                <asp:BoundField DataField="Surname" HeaderText=" Surname" ReadOnly="true"  />
                <asp:BoundField DataField="Email" HeaderText=" Email" ReadOnly="true" />
                <asp:BoundField DataField="Phone_num" HeaderText=" Phone_Number" ReadOnly="true"  />
                <asp:BoundField DataField="Reigon" HeaderText=" Reigon" ReadOnly="true"  />
               

                <%--<asp:BoundField DataField="Task" HeaderText=" Task" />--%>

                 <asp:TemplateField HeaderText="Task">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("Task") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbtask" runat="server" Text='<%#Eval("Task") %>' />
                </EditItemTemplate>                
            </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect" runat="server" text="Select" CommandArgument='<%#Eval("ID") %>' OnClick="btnSelect_Click" />
                    </ItemTemplate>
                             <ItemTemplate>
                    <asp:Button Text="Edit" runat="server" CommandName="Edit" ToolTip="Edit"  />
                    
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button Text="Update" runat="server" CommandName="Update" ToolTip="Update"  />
                    <asp:Button Text="Cancel" runat="server" CommandName="Cancel" ToolTip="Cancel"  />
                </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#594B9C" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#33276A" />
        </asp:GridView>
         <asp:Label ID="lblsucces" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblerror" runat="server" ForeColor="red" />
    </div>
</asp:Content>