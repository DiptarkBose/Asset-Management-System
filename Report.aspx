<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
        SelectCommand="SELECT distinct ProductName FROM Assets, UserStatus, Users WHERE Assets.AssetID=UserStatus.AssetID AND UserStatus.UserID=Users.UserID">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" OnRowDataBound="GridView1_DataBound">
        <Columns>
            <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
<%--                    <b>Total</b> : <%#Eval("Total") %>
                    <br />
                    <b>Allocated</b> : <%#Eval("Allocated") %>
                    <br />
                    <b>Remaining</b> : <asp:Label ID="Label3" runat="server" Text='<%#Convert.ToInt32(Eval("Total")) - Convert.ToInt32(Eval("Allocated")) %>'></asp:Label>
                    <br />
                    <br />
                    <br />--%>
                    <asp:Label ID="StatusLabel" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="UserName">
                <ItemTemplate>
<%--                    <b>Name</b> : <%#Eval("UserName") %>
                    <br />
                    <b>Issue Date</b> : <%#Eval("CurrentDate", "{0:dd/MM/yyyy}")%>
                    <br />
                    <b>Return Date</b> : <%#Eval("ReturnDate", "{0:dd/MM/yyyy}") %>
                    <br />
                    <br />
                    <br />--%>
                    <asp:Label ID="UserStatus" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView><br /><br />
    
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
        SelectCommand="SELECT distinct UserName FROM UserRequests, Assets, Users WHERE Status='Pending' AND UserRequests.AssetID=Assets.AssetID AND Users.UserID=UserRequests.UserID">
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="false" OnRowDataBound="GridView2_DataBound">
        <Columns>
            <asp:BoundField DataField="Username" HeaderText="User Name"/>
            
            <asp:TemplateField HeaderText="Pending Requests">
                <ItemTemplate>
                    <asp:Label ID="QuantityLabel" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

<%--            <asp:TemplateField HeaderText="Remaining">
                <ItemTemplate>
                    <asp:Label ID="UserStatus" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
    </asp:GridView>
</asp:Content>

