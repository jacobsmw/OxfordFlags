<%@ Page Title="Add New Source" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Source.aspx.vb" Inherits="OxfordFlags.New_Source" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Label ID="SourceNameLabel" runat="server" Text="Source Name"></asp:Label>
        &nbsp;<asp:TextBox ID="SourceName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="SourceNameEnteredValidator" runat="server"
            ControlToValidate="SourceName"
            ErrorMessage="Source Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="SourceNameFormatValidator" runat="server"
            ControlToValidate="SourceName"
            ErrorMessage="You must enter a valid Source Name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
&nbsp;<asp:Button ID="SubmitButton" runat="server" Text="Submit" />
</asp:Content>
