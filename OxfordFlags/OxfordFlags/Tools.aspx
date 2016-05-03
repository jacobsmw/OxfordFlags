<%@ Page Title ="Tools" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Tools.aspx.vb" Inherits="OxfordFlags.Tools" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Button ID="SearchButton" runat="server" CssClass="btn btn-primary" Text="Search" PostBackUrl="~/Search.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="AddImageButton" runat="server" CssClass="btn btn-primary" Text="Add Image to Sleeve" PostBackUrl="~/AddPhoto.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="EditRouteColorButton" runat="server" CssClass="btn btn-primary" Text="Edit Route Color" PostBackUrl="~/EditRouteColor.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="EditRouteOrderButton" runat="server" CssClass="btn btn-primary" Text="Edit Route Order" PostBackUrl="~/EditRouteOrder.aspx" Width="150px"/>
    </p>
    <p>
        <asp:Button ID="AddPaymentButton" runat="server" CssClass="btn btn-primary" Text="Add New Payment" PostBackUrl="~/AddPayment.aspx" Width="150px"/>
    </p>
</asp:Content>
