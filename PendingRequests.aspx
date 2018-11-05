<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PendingRequests.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label2" runat="server" Text="Pending Requests" Font-Bold="true" Font-Size="40px"></asp:Label>
     <br />
     <br />

<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CellPadding="3" CellSpacing="2" BorderColor="#DEBA84" BorderWidth="1px" BackColor="#DEBA84" BorderStyle="None">
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
   
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
    SelectCommand="SELECT * FROM [UserRequests], Assets, Users WHERE Status='Pending' AND UserRequests.UserID=Users.UserID AND UserRequests.AssetID=Assets.AssetID"></asp:SqlDataSource>
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>

<br />
<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminDashboard.aspx">Go Back to Home</asp:HyperLink>
</asp:Content>

