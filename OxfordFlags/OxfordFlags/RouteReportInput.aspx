<%@ Page Title="Route Report Input" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RouteReportInput.aspx.vb" Inherits="OxfordFlags.RouteReportInput" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:Label ID="SubscriptionYearLabel" runat="server" Text="Select Holiday"></asp:Label>
        <p>
        &nbsp;  
       
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="RouteReportInputData" DataTextField="OccasionName" DataValueField="OccasionName">
            </asp:DropDownList>
            <asp:SqlDataSource ID="RouteReportInputData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OccasionName] FROM [Occasion]"></asp:SqlDataSource>
       
    <p>
        <asp:Button ID="PaymentReportInputSearchButton" runat="server" Text="Search" />
    </p>

</asp:Content>
