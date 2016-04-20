<%@ Page Title="Finance Report Input" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FinanceReportInput.aspx.vb" Inherits="OxfordFlags.FinanceReportInput" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        <asp:Label ID="SubscriptionYearLabel" runat="server" Text="Subscription Year"></asp:Label>
        &nbsp;  
        <asp:TextBox ID="SubscriptionYear" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="SubscriptionYearEnteredValidator" runat="server"
            ControlToValidate="SubscriptionYear"
            ErrorMessage="Subscription year is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="SubscriptionYearFormatValidator" runat="server"
            ControlToValidate="SubscriptionYear"
            ErrorMessage="You must enter a valid year."
            ForeColor="Red"
            ValidationExpression="^[0-9]{4}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Button ID="FinanceReportInputSearchButton" runat="server" Text="Search" />
        <asp:Label ID="lblFinancialReport" runat="server"></asp:Label>
    </p>

</asp:Content>
