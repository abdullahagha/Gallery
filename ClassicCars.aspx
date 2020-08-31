<%@ Page Title="ClassicCars" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassicCars.aspx.cs" Inherits="test3.ClassicCars" %>

<%@ Register assembly="DevExpress.Web.v18.1, Version=18.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="ID" ShowHeaderWhenEmpty="True"

        CellPadding="2" ForeColor="Black" GridLines="None" Width="456px" Height="16px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        <Columns>
      
             <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("pro_Name") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbname" runat="server" Text='<%#Eval("pro_Name") %>' />
                </EditItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("pro_Desc") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbdesc" runat="server" Text='<%#Eval("pro_Desc") %>' />
                </EditItemTemplate>

            </asp:TemplateField>
            <asp:TemplateField HeaderText="Price">
                <ItemTemplate>
                    <asp:Label Text='<%#Eval("pro_Price") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox id="tbprice" runat="server" Text='<%#Eval("pro_Price") %>' />
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Image">
                <ItemTemplate>
                    <asp:Image ID="image" runat="server" Height="100" Width="100px" 
                        ImageUrl='<%#Eval("pro_image") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                        <asp:LinkButton ID="lnkSelect" runat="server" text="Order it" CommandArgument='<%#Eval("ID") %>' OnClick="btnSelect_Click" />
                    </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>