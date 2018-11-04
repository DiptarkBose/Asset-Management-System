<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AssetInsert.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

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

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AssetID" 
        DataSourceID="SqlDataSource1">
        <Columns>
           <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
           <asp:BoundField DataField="Total" HeaderText="Total Quantity"/>
           <asp:BoundField DataField="Allocated" HeaderText="Allocated Quantity"/>
        </Columns>
    </asp:GridView>
    <%--<asp:TextBox ID="TextBox1" runat="server" BackColor="Red"></asp:TextBox>--%>
    <br />

     <div>
        <asp:Button ID="Button1" runat="server" Text="Insert New" OnClick="Button1_Click"/>
        <asp:TextBox ID="ProductName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter a Product Name" ControlToValidate="ProductName" Display="None" Text="*"></asp:RequiredFieldValidator>
        <asp:TextBox ID="Total" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter a Quantity" ControlToValidate="Total"  Display="None" Text="*"></asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Enter a valid Number" ControlToValidate="Total" MinimumValue="1" MaximumValue="20000" Type="Integer"  Display="None" Text="*"></asp:RangeValidator>
        <asp:TextBox ID="Description" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please enter a short description" ControlToValidate="Description" Display="None" Text="*"></asp:RequiredFieldValidator>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
         <asp:Label ID="Error" runat="server" Text="" Visible="false"></asp:Label>
    </div>
    
</asp:Content>

