<%@ Page Title="Reports" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.vb" Inherits="OxfordFlags.Reports" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:Button ID="DeliveryReportButton" runat="server" Text="Delivery Report" />
    </p>
    <p>
        <asp:Button ID="CustomerReportButton" runat="server" Text="Customer Report" />
    </p>
    <p>
        <asp:Button ID="PaymentReportButton" runat="server" Text="Payment Report" PostBackUrl="~/PaymentReport.aspx" />
    </p>
    <p>
        <asp:Button ID="SleeveReportButton" runat="server" Text="Sleeve Report" />
    </p>
    <hr />
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
