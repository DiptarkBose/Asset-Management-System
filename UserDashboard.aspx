<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserDashboard.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .floatLeft { float: left; }
    </style>
    <style type="text/css">
        .floatRight { float: right; }
    </style>
    
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/RequestAsset.aspx">Request an Asset</asp:HyperLink>
    <br />
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" CssClass="floatLeft" BorderStyle="None" Width="550px">
        <asp:Image ID="Image1" runat="server" ImageUrl="new_req.png" Height="60px" Width="60px"/>
        &nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Your Request Status" Font-Size="40px" Font-Bold="true"></asp:Label> 
        <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString= "<%$ ConnectionStrings:AssetManagerConnectionString %>" 
                SelectCommand="SELECT * FROM [UserRequests], Assets WHERE UserID=@UserID AND UserRequests.AssetID=Assets.AssetID AND Status='Pending'">
                <SelectParameters>
                    <asp:SessionParameter SessionField="UserID" Name="UserID"/>
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="UserID,AssetID">
                <Columns>
                    <asp:BoundField DataField="AssetID" HeaderText="AssetID" ReadOnly="True" SortExpression="AssetID"/>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
                    <asp:BoundField DataField="QuantityRequested" HeaderText="Quantity Requested" SortExpression="QuantityRequested"/>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            <br />
            <br />
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" CssClass="floatRight" BorderStyle="None" Width="550px">
        <asp:Image ID="Image2" runat="server" ImageUrl="allocated.svg" Height="60px" Width="60px"/>
        &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Your Allocation Status" Font-Size="40px" Font-Bold="true"></asp:Label><br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString= "<%$ ConnectionStrings:AssetManagerConnectionString %>" 
                    ProviderName="System.Data.SqlClient" 
                    SelectCommand= "SELECT * FROM [UserStatus], Assets WHERE UserID=@UserID AND UserStatus.AssetID=Assets.AssetID">
                     <SelectParameters>
                        <asp:SessionParameter SessionField="UserID" Name="UserID"/>
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="AssetID" HeaderText="Asset ID"/>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
                        <asp:BoundField DataField="CurrentDate" HeaderText="Issue Date" DataFormatString="{0:dd/MM/yyyy}"/>
                        <asp:BoundField DataField="ReturnDate" HeaderText="Return Date" DataFormatString="{0:dd/MM/yyyy}"/>
                    </Columns>
                </asp:GridView>
    </asp:Panel>
</asp:Content>

