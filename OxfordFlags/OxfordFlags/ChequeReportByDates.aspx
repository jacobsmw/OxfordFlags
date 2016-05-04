<%@ Page Title="Cheque By Dates Report" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChequeReportByDates.aspx.vb" Inherits="OxfordFlags.ChequeReportByDates" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:Label ID="StartDateLabel" runat="server" Text="Start Date"></asp:Label>
        &nbsp;  
        <asp:TextBox ID="StartDate" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="StartDateLabel0" runat="server" Text="End Date"></asp:Label>
        &nbsp;  
        <asp:TextBox ID="EndDate" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="ChequeByDatesSearchButton" runat="server" Text="Search" />
        <br />
        <asp:Label ID="OutputLabel" runat="server"></asp:Label>
    </p>

</asp:Content>
