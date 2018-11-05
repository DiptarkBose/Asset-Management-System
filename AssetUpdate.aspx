<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AssetUpdate.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:Label ID="Label1" runat="server" Text="Current Inventory" Font-Bold="true" Font-Size="40px"></asp:Label>
     <br />
     <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>"
        SelectCommand="SELECT * FROM [Assets]"
        DeleteCommand="DELETE FROM Assets where AssetID=@AssetID"
        UpdateCommand="UPDATE Assets SET ProductName=@ProductName, Total=@Total WHERE AssetID=@AssetID">
    </asp:SqlDataSource>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AssetID" 
        DataSourceID="SqlDataSource1">
        <Columns>
           <asp:BoundField DataField="ProductName" HeaderText="Product Name" ReadOnly="true"/>
           <asp:BoundField DataField="Total" HeaderText="Total Quantity"/>
            <asp:TemplateField HeaderText="Allocated">
                <ItemTemplate>
                    <%#Eval("Allocated") %>
                </ItemTemplate>
            </asp:TemplateField>
           
           <asp:CommandField ShowEditButton="true" ShowDeleteButton="true"/>
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>

