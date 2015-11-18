<%@ Page Title="Search" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.vb" Inherits="OxfordFlags.Search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Label ID="SearchNameLabel" runat="server" Text="Name"></asp:Label>
        &nbsp;<asp:TextBox ID="SearchName" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="SearchAddressLabel" runat="server" Text="Address"></asp:Label>
        &nbsp<asp:TextBox ID="SearchAddress" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="SearchOUPSTicketLabel" runat="server" Text="OUPS Ticket"></asp:Label>
        &nbsp<asp:TextBox ID="SearchOUPSTicket" runat="server"></asp:TextBox>
    </p>
    <input id="Submit1" type="submit" value="Submit" />
</asp:Content>