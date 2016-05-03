<%@ Page Title="Admin Controls" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.vb" Inherits="OxfordFlags.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" />
    </h2>
    <p>
        <asp:Button ID="AddNewUserButton" runat="server" CssClass="btn btn-info" Text="Add New User" PostBackUrl="~/Account/Register.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="ViewUsersButton" runat="server" CssClass="btn btn-info" Text="View Users" Width="200px" />
    </p>
    <p>
        <asp:Button ID="OccasionMaintenanceButton" runat="server" CssClass="btn btn-info" Text="Occasion Maintenance" PostBackUrl="~/OccasionMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="PropertyTraitMaintenanceButton" runat="server" CssClass="btn btn-info" Text="Property Trait Maintenance" PostBackUrl="~/PropertyTraitMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="OrderSourceMaintenanceButton" runat="server" CssClass="btn btn-info" Text="Order Source Maintenance" PostBackUrl="~/OrderSourceMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="DiscountMaintenanceButton" runat="server" CssClass="btn btn-info" Text="Discount Maintenance" PostBackUrl="~/DiscountMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="PaymentSourceMaintenanceButton" runat="server" CssClass="btn btn-info" Text="Payment Source Maintenance" PostBackUrl="~/PaymentSourceMaintenance.aspx" Width="200px" />
    </p>
    <p>
        <asp:Button ID="MarkAllRoutesUnchangedButton" runat="server" CssClass="btn btn-info" Text="Mark All Routes Unchanged" PostBackUrl="~/MarkRoutesUnchanged.aspx" Width="200px" />
    </p>
</asp:Content>