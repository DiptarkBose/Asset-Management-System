﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PendingRequests.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Pending Requests:<br/><br />

<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false" CellPadding="5" CellSpacing="5" BorderColor="Black" BorderWidth="3">
    <Columns>
        <asp:BoundField DataField="UserID" HeaderText="User ID"/>
        <asp:BoundField DataField="AssetID" HeaderText="Asset ID"/>
        <asp:BoundField DataField="QuantityRequested" HeaderText="Quantity Requested"/>
        <asp:TemplateField HeaderText="Accept/Reject">
            <ItemTemplate>
                <asp:Button id="Accept" runat="server" Text="Accept" OnClick="Accept_Click"/>
                <asp:Button id="Reject" runat="server" Text="Reject" OnClick="Reject_Click"/>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AssetManagerConnectionString %>" 
    SelectCommand="SELECT * FROM [UserRequests] WHERE Status='Pending'"></asp:SqlDataSource>
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>
