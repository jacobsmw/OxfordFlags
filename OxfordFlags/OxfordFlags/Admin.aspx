<%@ Page Title="Admin Controls" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.vb" Inherits="OxfordFlags.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %><asp:Image ID="Image1" runat="server" />
    </h2>
    <p>

        <asp:Button ID="AddNewUserButton" runat="server" CssClass="btn btn-primary" Text="Add New User" PostBackUrl="~/Account/Register.aspx" Width="250px" />
    </p>
    <p>
        <asp:Button ID="OccasionMaintenanceButton" runat="server" CssClass="btn btn-primary" Text="Occasion Maintenance" PostBackUrl="~/OccasionMaintenance.aspx" Width="250px" />
    </p>
    <p>
        <asp:Button ID="PropertyTraitMaintenanceButton" runat="server" CssClass="btn btn-primary" Text="Property Trait Maintenance" PostBackUrl="~/PropertyTraitMaintenance.aspx" Width="250px" />
    </p>
    <p>
        <asp:Button ID="OrderSourceMaintenanceButton" runat="server" CssClass="btn btn-primary" Text="Order Source Maintenance" PostBackUrl="~/OrderSourceMaintenance.aspx" Width="250px" />
    </p>
    <p>
        <asp:Button ID="DiscountMaintenanceButton" runat="server" CssClass="btn btn-primary" Text="Discount Maintenance" PostBackUrl="~/DiscountMaintenance.aspx" Width="250px" />
    </p>
    <p>
        <asp:Button ID="PaymentSourceMaintenanceButton" runat="server" CssClass="btn btn-primary" Text="Payment Source Maintenance" PostBackUrl="~/PaymentSourceMaintenance.aspx" Width="250px" />
    </p>
    <p>
        <asp:Button ID="MarkAllRoutesUnchangedButton" runat="server" CssClass="btn btn-primary" Text="Mark All Routes Unchanged" PostBackUrl="~/MarkRoutesUnchanged.aspx" Width="250px" />
    </p>
</asp:Content>