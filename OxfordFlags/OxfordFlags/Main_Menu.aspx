<%@ Page Title ="Main Menu" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main_Menu.aspx.vb" Inherits="OxfordFlags.Main_Menu" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" />
    </h2>
    <p>
        <asp:Button ID="Button1" runat="server" Text="New Entry" PostBackUrl="~/New_Entry.aspx" />
    </p>
    <p>
        <asp:Button ID="Button2" runat="server" Text="Search" PostBackUrl="~/Search.aspx" />
    </p>
    <p>
        <asp:Button ID="Button3" runat="server" Text="Reports" PostBackUrl="~/Reports.aspx" />
    </p>
    <p>
        <asp:Button ID="Button4" runat="server" Text="Admin" PostBackUrl="~/Admin.aspx" />
    </p>
</asp:Content>
