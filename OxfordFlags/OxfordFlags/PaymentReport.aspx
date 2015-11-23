<%@ Page Title="Search by Year" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentReport.aspx.vb" Inherits="OxfordFlags.PaymentReport" %>

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
        <asp:Button ID="SearchButton" runat="server" Text="Search" />
    </p>
    <p>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </p>

</asp:Content>
