<%@ Page Title="Admin Controls" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.vb" Inherits="OxfordFlags.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" />
    </h2>
    <p>
        <asp:Button ID="AddNewUserButton" runat="server" Text="Add New User" PostBackUrl="~/Account/Register.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="ViewUsersButton" runat="server" Text="View Users" Width="200px" />
    </p>
    <p>
        <asp:Button ID="OccasionMaintenanceButton" runat="server" Text="Occasion Maintenance" PostBackUrl="~/OccasionMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="PropertyTraitMaintenanceButton" runat="server" Text="Property Trait Maintenance" PostBackUrl="~/PropertyTraitMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="OrderSourceMaintenanceButton" runat="server" Text="Order Source Maintenance" PostBackUrl="~/OrderSourceMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="DiscountMaintenanceButton" runat="server" Text="Discount Maintenance" PostBackUrl="~/DiscountMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="PaymentSourceMaintenanceButton" runat="server" Text="Payment Source Maintenance" PostBackUrl="~/PaymentSourceMaintenance.aspx" Width="200px" />
    </p>
</asp:Content>