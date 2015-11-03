<%@ Page Title="Admin Controls" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.vb" Inherits="OxfordFlags.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" />
    </h2>
    <p>
        <asp:Button ID="Button1" runat="server" Text="New Entry" />
    </p>
    <p>
        <asp:Button ID="Button2" runat="server" Text="Search" />
    </p>
</asp:Content>