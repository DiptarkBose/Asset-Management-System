<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AssetInsert.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" Text="Current Inventory" Font-Bold="true" Font-Size="40px"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>"
        SelectCommand="SELECT * FROM [Assets]"
        InsertCommand="INSERT INTO Assets(ProductName, Total, Allocated, Description) values (@ProductName, @Total, 0, @Description)">
        <InsertParameters>
            <asp:ControlParameter ControlID="ProductName" PropertyName="Text" Name="ProductName" />
            <asp:ControlParameter ControlID="Total" PropertyName="Text" Name="Total" />
            <asp:ControlParameter ControlID="Description" PropertyName="Text" Name="Description" />
        </InsertParameters>
    </asp:SqlDataSource>

    <br />

    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AssetID" 
        DataSourceID="SqlDataSource1">
        <Columns>
           <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
           <asp:BoundField DataField="Total" HeaderText="Total Quantity"/>
           <asp:BoundField DataField="Allocated" HeaderText="Allocated Quantity"/>
        </Columns>
    </asp:GridView>
    <br />
    <br />
    <br />

     <div>
        <asp:Label ID="Label2" runat="server" Text="Enter details for new Asset" Font-Bold="true" Font-Size="25px"></asp:Label>
         <br />
         <br />
        <asp:Label ID="Label3" runat="server" Text="Name" Font-Bold="true"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Product Name" ControlToValidate="ProductName" Display="None" Text="*"></asp:RequiredFieldValidator>
         <br />
         <br />
        <asp:Label ID="Label4" runat="server" Text="Total Quantity" Font-Bold="true"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="Total" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter a Quantity" ControlToValidate="Total"  Display="None" Text="*"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Enter a valid Number" ControlToValidate="Total" MinimumValue="1" MaximumValue="20000" Type="Integer"  Display="None" Text="*"></asp:RangeValidator>
         <br />
         <br />
        <asp:Label ID="Label5" runat="server" Text="Short Description" Font-Bold="true"></asp:Label>
        &nbsp;&nbsp;
        <asp:TextBox ID="Description" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a short description" ControlToValidate="Description" Display="None" Text="*"></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
         <br />
         <br />
        <asp:Button ID="Button1" runat="server" Text="Insert New" OnClick="Button1_Click"/>
         <br />
         <br />
        <asp:Label ID="Error" runat="server" Text="" Visible="false"></asp:Label>

         <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminDashboard.aspx">Go Back to Home</asp:HyperLink>
    </div>
    
</asp:Content>

