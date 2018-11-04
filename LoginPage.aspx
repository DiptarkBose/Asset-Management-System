<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LoginPage.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="UserID"></asp:Label>
        <asp:TextBox ID="UserID" runat="server"></asp:TextBox>

        <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>

        <asp:Label ID="Error" runat="server" Text=""></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Mandatory Field" Display="None" ControlToValidate="UserID" ValidationGroup="Div1"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Mandatory Field" Display="None" ControlToValidate="Password" ValidationGroup="Div1"></asp:RequiredFieldValidator>
        <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click" CausesValidation="true" ValidationGroup="Div1"/>
        
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="Div1"/>
    </asp:Panel>
    <br /><br />
    <asp:Panel ID="Panel2" runat="server">
        ADMIN:
        AdminID: <asp:TextBox ID="AdminID" runat="server"></asp:TextBox><br />
        Admin Password: <asp:TextBox ID="AdminPass" runat="server" TextMode="Password"></asp:TextBox><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Mandatory Field" Display="None" ControlToValidate="AdminID" ValidationGroup="Div2"></asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Mandatory Field" Display="None" ControlToValidate="AdminPass" ValidationGroup="Div2"></asp:RequiredFieldValidator>
        <asp:Button ID="Button2" runat="server" Text="Button" OnClick="Button2_Click" CausesValidation="true" ValidationGroup="Div2"/>
        <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
        
        <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="Div2"/>
        
    </asp:Panel>

</asp:Content>

