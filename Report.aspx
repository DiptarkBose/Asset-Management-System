<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
        SelectCommand="SELECT * FROM Assets, UserStatus, Users WHERE Assets.AssetID=UserStatus.AssetID AND UserStatus.UserID=Users.UserID"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <b>Total</b> : <%#Eval("Total") %>
                    <br />
                    <b>Allocated</b> : <%#Eval("Allocated") %>
                    <br />
                    <b>Reamining</b> : <asp:Label ID="Label3" runat="server" Text='<%#Convert.ToInt32(Eval("Total")) - Convert.ToInt32(Eval("Allocated")) %>'></asp:Label>
                    <br />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="UserName">
                <ItemTemplate>
                    <b>Name</b> : <%#Eval("UserName") %>
                    <br />
                    <b>Issue Date</b> : <%#Eval("CurrentDate", "{0:dd/MM/yyyy}")%>
                    <br />
                    <b>Return Date</b> : <%#Eval("ReturnDate", "{0:dd/MM/yyyy}") %>
                    <br />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView><br /><br />
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
        SelectCommand="SELECT * FROM UserRequests, Assets, Users WHERE Status='Pending' AND UserRequests.AssetID=Assets.AssetID AND Users.UserID=UserRequests.UserID">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2"></asp:GridView>
</asp:Content>

