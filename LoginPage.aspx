<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="UserID"></asp:Label>
    <asp:TextBox ID="UserID" runat="server"></asp:TextBox>

    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
    <asp:TextBox ID="Password" runat="server"></asp:TextBox>

    <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click"/>
    <asp:Label ID="Error" runat="server" Text=""></asp:Label>

    ADMIN:
    AdminID: <asp:TextBox ID="AdminID" runat="server"></asp:TextBox><br />
    Admin Password: <asp:TextBox ID="AdminPass" runat="server"></asp:TextBox><br />
    <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click"/>

</asp:Content>

