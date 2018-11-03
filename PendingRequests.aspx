<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PendingRequests.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Pending Requests:<br/><br />

<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="3" CellSpacing="1" BorderColor="White" BorderWidth="2px" BackColor="White" BorderStyle="Ridge" GridLines="None">
    <Columns>
        <asp:BoundField DataField="UserID" HeaderText="User ID"/>
        <asp:BoundField DataField="UserName" HeaderText="User Name"/>
        <asp:BoundField DataField="AssetID" HeaderText="Asset ID"/>
        <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
        <asp:BoundField DataField="QuantityRequested" HeaderText="Quantity Requested"/>
        <asp:TemplateField HeaderText="Accept/Reject">
            <ItemTemplate>
                <asp:Button id="Accept" runat="server" Text="Accept" OnClick="Accept_Click"/>
                <asp:Button id="Reject" runat="server" Text="Reject" OnClick="Reject_Click"/>
            </ItemTemplate>
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
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
    SelectCommand="SELECT * FROM [UserRequests], Assets, Users WHERE Status='Pending' AND UserRequests.UserID=Users.UserID AND UserRequests.AssetID=Assets.AssetID"></asp:SqlDataSource>
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>

