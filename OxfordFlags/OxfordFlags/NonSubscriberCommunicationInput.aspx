<%@ Page Title="Non-Subscriber Communication Input" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NonSubscriberCommunicationInput.aspx.vb" Inherits="OxfordFlags.NonSubscriberCommunicationInput" %>

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
        <br />
        base Price&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <asp:TextBox ID="basePrice" runat="server"></asp:TextBox>
        <br />
        Early Discount&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
        <asp:TextBox ID="EarlyDiscount" runat="server"></asp:TextBox>
        <br />
        Multiple Discount&nbsp;&nbsp;&nbsp;  
        <asp:TextBox ID="multiDiscount" runat="server"></asp:TextBox>
        <br />
    </p>
    <p>
        <asp:Button ID="NonSubscriberCommunicationInputSearchButton" runat="server" Text="Search" />
        <br />
        <asp:Label ID="OutputLabel" runat="server"></asp:Label>
    </p>

</asp:Content>
