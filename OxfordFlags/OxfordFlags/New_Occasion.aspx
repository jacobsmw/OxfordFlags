<%@ Page Title="Add New Occasion" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Occasion.aspx.vb" Inherits="OxfordFlags.New_Occasion" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Label ID="OccasionNameLabel" runat="server" Text="Occasion Name"></asp:Label>
        &nbsp;<asp:TextBox ID="OccasionName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="OccasionNameEnteredValidator" runat="server"
            ControlToValidate="OccasionName"
            ErrorMessage="Ocassion Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="OccasionNameFormatValidator" runat="server"
            ControlToValidate="OccasionName"
            ErrorMessage="You must enter a valid Occasion Name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    &nbsp;<asp:Button ID="SubmitButton" runat="server" Text="Submit" />

</asp:Content>