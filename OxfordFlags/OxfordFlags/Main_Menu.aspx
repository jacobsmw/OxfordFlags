<%@ Page Title ="Main Menu" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main_Menu.aspx.vb" Inherits="OxfordFlags.Main_Menu" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    
    <p>
        <asp:Button ID="NewEntryButton" runat="server" CssClass="btn btn-primary" Text="New Entry" PostBackUrl="~/New_Entry.aspx" />
    </p>
    <p>
        <asp:Button ID="SearchButton" runat="server" CssClass="btn btn-primary" Text="Search" PostBackUrl="~/Search.aspx" />
    </p>
    <p>
        <asp:Button ID="ReportsButton" runat="server" CssClass="btn btn-primary" Text="Reports" PostBackUrl="~/Reports.aspx" />
    </p>
    <p>
        <asp:Button ID="AdminButton" runat="server" CssClass="btn btn-primary" Text="Admin" PostBackUrl="~/Admin.aspx" />
    </p>
</asp:Content>
