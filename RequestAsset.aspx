<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RequestAsset.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:Label ID="Label1" runat="server" Text="Company Inventory" Font-Size="40px" Font-Bold="true"></asp:Label>
     <br/><br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="AssetID" >
        <Columns>
            <asp:BoundField DataField="AssetID" HeaderText="AssetID" InsertVisible="False" ReadOnly="True" SortExpression="AssetID" />
            <asp:HyperLinkField DataTextField="ProductName" DataNavigateUrlFields="AssetID" DataNavigateUrlFormatString="~/ProductDetails.aspx?AssetID={0}" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="Allocated" HeaderText="Allocated" SortExpression="Allocated" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" SelectCommand="SELECT * FROM [Assets]"></asp:SqlDataSource>
    <br/>
    <br />
    <br />
    <asp:Label ID="Label5" runat="server" Text="Enter Request Details:" Font-Bold="true" Font-Size="25px"></asp:Label>
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Select a Resource " Font-Bold="true"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList>
    <br />
    <br />
    <asp:Label ID="Label4" runat="server" Text="Select Quantity Required " Font-Bold="true"></asp:Label>
    &nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Submit Request" OnClick="Button1_Click" />
    
    <br />
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    
</asp:Content>