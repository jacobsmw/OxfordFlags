<%@ Page Title="Route Report Input" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RouteReportInput.aspx.vb" Inherits="OxfordFlags.RouteReportInput" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:Label ID="SubscriptionYearLabel" runat="server" Text="Subscription Year"></asp:Label>
        &nbsp;  
       
    <p>
        <asp:Button ID="PaymentReportInputSearchButton" runat="server" Text="Search" />
    </p>

</asp:Content>
