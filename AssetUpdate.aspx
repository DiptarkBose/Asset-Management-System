<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AssetUpdate.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>"
        SelectCommand="SELECT * FROM [Assets]"
        DeleteCommand="DELETE FROM Assets where AssetID=@AssetID"
        UpdateCommand="UPDATE Assets SET ProductName=@ProductName, Total=@Total WHERE AssetID=@AssetID"
        InsertCommand="INSERT into Assets(ProductName, Total) values (@ProductName, @Total)">
        <InsertParameters>
            <asp:ControlParameter ControlID="ProductName" PropertyName="Text" Name="ProductName" />
            <asp:ControlParameter ControlID="Total" PropertyName="Text" Name="Total" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AssetID" 
        DataSourceID="SqlDataSource1">
        <Columns>
           <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
           <asp:BoundField DataField="Total" HeaderText="Total Quantity"/>
           <asp:BoundField DataField="Allocated" HeaderText="Allocated Quantity"/>
           <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"/>
        </Columns>
    </asp:GridView>
    <br />
    <div>
        <asp:Button ID="Button1" runat="server" Text="Insert New" OnClick="Button1_Click"/>
        <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
        <asp:TextBox ID="Total" runat="server"></asp:TextBox>
    </div>
</asp:Content>

