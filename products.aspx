<%@ Page Title="products" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="products.aspx.cs" Inherits="test3.products" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server"> 
    <div style="width: 1460px">
    <asp:GridView ID="gvproducts" runat="server" AutoGenerateColumns="false"  DataKeyNames="ID" ShowHeaderWhenEmpty="true"
          OnRowEditing="gvproducts_RowEditing" OnRowCancelingEdit="gvproducts_RowCancelingEdit" OnRowUpdating="gvproducts_RowUpdating"
         OnRowDeleting="gvproducts_RowDeleting"
        CellPadding="4" ForeColor="#333333" GridLines="None" Height="212px" Width="707px">
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
            <asp:TemplateField HeaderText="Product_Name">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("pro_Name") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbproname" runat="server" Text='<%#Eval("pro_Name") %>' />
                </EditItemTemplate>
              
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product_Description">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("pro_Desc") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbprodesc" runat="server" Text='<%#Eval("pro_Desc") %>' />
                </EditItemTemplate>
              
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product_Price">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("pro_Price") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbproprice" runat="server" Text='<%#Eval("pro_Price") %>' />
                </EditItemTemplate>
            
            </asp:TemplateField>

             <%--  <asp:TemplateField HeaderText="picture Name">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("pictureName") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbpicturename" runat="server" Text='<%#Eval("pictureName") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbpicturenameFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="is_Preview">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("is_Preview") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbispreview" runat="server" Text='<%#Eval("is_Preview") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tbispreviewFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>

               <asp:TemplateField HeaderText="URL">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("URL") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tburl" runat="server" Text='<%#Eval("URL") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="tburlFooter" runat="server" />
                </FooterTemplate>
            </asp:TemplateField>--%>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button Text="Edit" runat="server" CommandName="Edit" ToolTip="Edit"  />
                    <asp:Button Text="Delete" runat="server" CommandName="Delete" ToolTip="Delete" BackColor="Red" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button Text="Update" runat="server" CommandName="Update" ToolTip="Update"  />
                    <asp:Button Text="Cancel" runat="server" CommandName="Cancel" ToolTip="Cancel"  />
                </EditItemTemplate>
                
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
            <br />
        <asp:Label ID="lblsucces" runat="server" ForeColor="Green" />
        <br />
        <asp:Label ID="lblerror" runat="server" ForeColor="red" />
    </div>
    </asp:Content>