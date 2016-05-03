<%@ Page Title ="Main Menu" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Main_Menu.aspx.vb" Inherits="OxfordFlags.Main_Menu" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />
    
    <p>
        <asp:Button ID="NewOrderButton" runat="server" CssClass="btn btn-primary" Text="New Order" PostBackUrl="~/New_Order.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="SearchButton" runat="server" CssClass="btn btn-primary" Text="Search" PostBackUrl="~/Search.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="ReportsButton" runat="server" CssClass="btn btn-primary" Text="Reports" PostBackUrl="~/Reports.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="AdminButton" runat="server" CssClass="btn btn-primary" Text="Admin" PostBackUrl="~/Admin.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="EditRouteButton" runat="server" CssClass="btn btn-primary" Text="Edit Route Order" PostBackUrl="~/EditRouteOrder.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="AddPaymentButton" runat="server" CssClass="btn btn-primary" Text="Add New Payment" PostBackUrl="~/AddPayment.aspx" Width="150px"/>
    </p>
</asp:Content>
