<%@ Page Title="Mange_orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Mange_orders.aspx.cs" Inherits="test3.Mange_orders" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server"> 

    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" Height="153px" Width="612px">
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
        <Columns>
            <asp:TemplateField>

               <ItemTemplate>
                    <asp:Label Text='<%#Eval("Person_ID") %>' runat="server" />
                </ItemTemplate>
                
               <ItemTemplate>
                    <asp:Label Text='<%#Eval("Name") %>' runat="server" />
                </ItemTemplate>
                
            
               <ItemTemplate>
                    <asp:Label Text='<%#Eval("Surname") %>' runat="server" />
                </ItemTemplate>
                
               <ItemTemplate>
                    <asp:Label Text='<%#Eval("Pro_ID") %>' runat="server" />
                </ItemTemplate>
         
               <ItemTemplate>
                    <asp:Label Text='<%#Eval("pro_name") %>' runat="server" />
                </ItemTemplate>
                
            </asp:TemplateField>


        </Columns>
    </asp:GridView>

</asp:Content>

