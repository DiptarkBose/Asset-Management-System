<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserDashboard.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    The Request status is <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString= "<%$ ConnectionStrings:AssetManagerConnectionString %>" 
                SelectCommand="SELECT * FROM [UserRequests], Assets WHERE UserID=@UserID AND UserRequests.AssetID=Assets.AssetID AND Status='Pending'">
                <SelectParameters>
                    <asp:SessionParameter SessionField="UserID" Name="UserID"/>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="UserID,AssetID">
                <Columns>
                    <asp:BoundField DataField="AssetID" HeaderText="AssetID" ReadOnly="True" SortExpression="AssetID"/>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
                    <asp:BoundField DataField="QuantityRequested" HeaderText="Quantity Requested" SortExpression="QuantityRequested"/>
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            
            <br />
            The Allocated status is <br />
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
</asp:Content>

