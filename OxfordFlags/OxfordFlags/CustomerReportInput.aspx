<%@ Page Title="Customer Report Input" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerReportInput.aspx.vb" Inherits="OxfordFlags.CustomerReportInput" %>

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
        <asp:Button ID="CustomerReportInputSearchButton" runat="server" Text="Search" />
        <br />
        <asp:Label ID="lblCustomerReport" runat="server"></asp:Label>
    </p>

</asp:Content>
