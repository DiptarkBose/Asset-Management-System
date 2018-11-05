<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .floatLeft { float: left; }
    </style>
    <style type="text/css">
        .floatRight { float: right; }
    </style>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label1" runat="server" Text="Allocation Report" Font-Bold="true" Font-Size="40px"></asp:Label>
    <br /><br />
    <asp:Panel ID="Panel1" runat="server" CssClass="floatLeft" BorderStyle="Outset">
        <asp:Label ID="Label2" runat="server" Text="Product Report" Font-Bold="true" Font-Size="25px"></asp:Label>
        <br/><br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
            SelectCommand="SELECT distinct ProductName FROM Assets, UserStatus, Users, UserRequests WHERE Assets.AssetID=UserStatus.AssetID 
            AND UserStatus.UserID=Users.UserID AND UserRequests.Status='Accepted' AND UserRequests.AssetID=Assets.AssetID
            AND UserRequests.UserID=Users.UserID">
        </asp:SqlDataSource>

        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ProductName" 
            AutoPostBack="true"></asp:DropDownList>
        <br />

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
            SelectCommand="SELECT * FROM Assets, UserStatus, Users, UserRequests WHERE Assets.AssetID=UserStatus.AssetID 
            AND UserStatus.UserID=Users.UserID AND ProductName=@product AND UserRequests.Status='Accepted' AND 
            UserRequests.AssetID=Assets.AssetID AND UserRequests.UserID=Users.UserID" >
            <SelectParameters>
                <asp:ControlParameter PropertyName="SelectedValue" ControlID="DropDownList1" Name="product" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br/>
        <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateRows="False">
            <Fields>
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" />
                <asp:BoundField DataField="Total" HeaderText="Total" />
                <asp:BoundField DataField="Allocated" HeaderText="Allocated" />
                <asp:TemplateField HeaderText="Remaining">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Convert.ToInt32(Eval("Total")) - 
                                                   Convert.ToInt32(Eval("Allocated")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Fields>
        </asp:DetailsView>
           <br/>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="false">
            <Columns>            
                <asp:TemplateField HeaderText="Allocated">
                    <ItemTemplate>
                        <%#Eval("QuantityRequested") %>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UserName">
                    <ItemTemplate>
                        <b>Name</b> : <%#Eval("UserName") %>
                        <br />
                        <b>Issue Date</b> : <%#Eval("CurrentDate", "{0:dd/MM/yyyy}")%>
                        <br />
                        <b>Return Date</b> : <%#Eval("ReturnDate", "{0:dd/MM/yyyy}") %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>

    <asp:Panel ID="Panel2" runat="server" CssClass="floatRight" BorderStyle="Outset">
        <asp:Label ID="Label4" runat="server" Text="Customer Report" Font-Bold="true" Font-Size="25px"></asp:Label>
        <br/>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
            SelectCommand="SELECT distinct UserName FROM UserRequests, Assets, Users WHERE Status='Pending' AND 
            UserRequests.AssetID=Assets.AssetID AND Users.UserID=UserRequests.UserID">
        </asp:SqlDataSource>
        <br/>
        <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="UserName" 
            AutoPostBack="true"></asp:DropDownList>
        <br />

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
            SelectCommand="SELECT * FROM UserRequests, Assets, Users WHERE Status='Pending' AND 
            UserRequests.AssetID=Assets.AssetID AND Users.UserID=UserRequests.UserID AND UserName=@username" >
            <SelectParameters>
                <asp:ControlParameter PropertyName="SelectedValue" ControlID="DropDownList2" Name="username" />
            </SelectParameters>
        </asp:SqlDataSource>
    
        <asp:DetailsView ID="DetailsView2" runat="server" DataSourceID="SqlDataSource4" AutoGenerateRows="False">
            <Fields>
                <asp:BoundField DataField="UserName" HeaderText="Items Procured by" />
            </Fields>
        </asp:DetailsView>
        <br/>
        <asp:GridView ID="GridView2" runat="server" DataSourceID="SqlDataSource4" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ProductName" HeaderText="Product Name"/>
                <asp:BoundField DataField="QuantityRequested" HeaderText="Quantity Requested"/>
                <asp:TemplateField HeaderText="Remaining">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%#Convert.ToInt32(Eval("Total")) - 
                                                   Convert.ToInt32(Eval("Allocated")) %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </asp:Panel>
    <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
</asp:Content>

