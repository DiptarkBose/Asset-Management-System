<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminRegistration.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="Username" runat="server"></asp:TextBox>
    <asp:TextBox ID="Password" runat="server"></asp:TextBox>
    <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click"/>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/LoginPage.aspx">Go to Login Page</asp:HyperLink>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Name" ControlToValidate="Username" Display="None"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter a Password" ControlToValidate="Password" Display="None"></asp:RequiredFieldValidator>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
</asp:Content>

