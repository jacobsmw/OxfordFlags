<%@ Page Title="Reports" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.vb" Inherits="OxfordFlags.Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    
    <p>
        <%--Customer by street address--%>
        <asp:Button ID="CustomerReportButton" runat="server" Text="Customer Report" PostBackUrl="~/CustomerReportInput.aspx" />
    </p>
    <p>
        <%--Payment Detial by customer by calander year--%>
        <asp:Button ID="PaymentReportButton" runat="server" Text="Payment Report" PostBackUrl="~/PaymentReportInput.aspx" />
    </p>
    <p>
        <%-- finances for particular year--%>
        <asp:Button ID="FinanceReportButton" runat="server" Text="Finance Report" PostBackUrl="~/FinanceReportInput.aspx" />
    </p>
    <p>
        <%--communicate with subscribers for a year--%>
        <asp:Button ID="SubcriberCommunicationButton" runat="server" Text="Subscriber Communication" PostBackUrl="~/SubscriberCommunicationInput.aspx" />
    </p>

    <p>
        <%--communicate with non subscribers--%>
        <asp:Button ID="NonSubscriberCommunicationButton" runat="server" Text="Non-Subscriber Communication" PostBackUrl="~/NonSubscriberCommunicationInput.aspx" />
    </p>
    <p>
        <%--route output--%>
        <asp:Button ID="RouteReportButton" runat="server" Text="Route Report" PostBackUrl="~/RouteReportInput.aspx" />
    </p>
    <hr />
    <p>
        <asp:Button ID="SleeveReportButton" runat="server" Text="Sleeve Report" />
    </p>
    <p>
        <asp:Button ID="GPSDataButton" runat="server" Text="GPS Data" PostBackUrl="~/GPSReport.aspx" />
    </p>
    <p>
        <asp:Button ID="EmailListDataButton" runat="server" Text="Email List" />
    </p>
    <p>
        <asp:Button ID="MailingListButton" runat="server" Text="Mailing List" />
    </p>


    </asp:Content>
