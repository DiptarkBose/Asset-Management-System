<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RequestAsset.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    Available Resources: <br/><br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="AssetID" >
        <Columns>
            <asp:BoundField DataField="AssetID" HeaderText="AssetID" InsertVisible="False" ReadOnly="True" SortExpression="AssetID" />
            <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
            <asp:BoundField DataField="Allocated" HeaderText="Allocated" SortExpression="Allocated" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" SelectCommand="SELECT * FROM [Assets]"></asp:SqlDataSource>
    <br/><br />
    <asp:DropDownList ID="DropDownList2" runat="server">
    </asp:DropDownList>

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

    <asp:Button ID="Button1" runat="server" Text="Request" OnClick="Button1_Click" />
    
    <br />
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
    
</asp:Content>