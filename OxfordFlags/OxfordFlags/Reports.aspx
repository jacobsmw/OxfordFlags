<%@ Page Title="Reports" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.vb" Inherits="OxfordFlags.Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%--communicate with non subscribers--%></h2>
    
    <p>
        <%--route output--%>
        <asp:Button ID="CustomerReportButton" runat="server" Text="Customer Report" PostBackUrl="~/CustomerReportInput.aspx" CssClass="btn btn-primary" Width="300px" />
    </p>
    <p>
        <%-- finances for particular year--%>
        <asp:Button ID="CustomerByAddressReportButton" runat="server" Text="Customers By Address" PostBackUrl="~/CustomerByAddress.aspx" CssClass="btn btn-primary" Width="300px" />
    </p>
    <p>
        <%--communicate with non subscribers--%>
        <asp:Button ID="NonSubscriberCommunicationButton" runat="server" Text="Non-Subscriber Communication" PostBackUrl="~/NonSubscriberCommunicationInput.aspx" CssClass="btn btn-primary" Width="300px" />
    </p>
    <p>
        <%--route output--%>
        <asp:Button ID="RouteReportButton" runat="server" Text="Route Report" PostBackUrl="~/RouteReportInput.aspx" CssClass="btn btn-primary" Width="300px" />
    </p>
    <p>
        <asp:Button ID="SleeveReportButton" runat="server" Text="Sleeve Report" CssClass="btn btn-primary" Width="300px" PostBackUrl="~/SleeveDataSheets.aspx" />
    </p>
    <p>
        <asp:Button ID="GPSDataButton" runat="server" Text="GPS Data" CssClass="btn btn-primary" Width="300px" PostBackUrl="~/GPSOutput.aspx" />
    </p>
    <p>
        <asp:Button ID="PaymentTypeReportButton0" runat="server" Text="PaymentType" PostBackUrl="~/PaymentReportInput.aspx" CssClass="btn btn-primary" Width="300px" />
    </p>
<p>
        <asp:Button ID="PaymentTypeReportButton1" runat="server" Text="Cheques in Date Range" PostBackUrl="~/ChequeReportByDates.aspx" CssClass="btn btn-primary" Width="300px" />
    </p>

    </asp:Content>
