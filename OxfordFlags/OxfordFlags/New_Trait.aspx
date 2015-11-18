<%@ Page Title="Add New Trait" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Trait.aspx.vb" Inherits="OxfordFlags.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Label ID="TraitDecriptionLabel" runat="server" Text="Trait Description"></asp:Label>
        &nbsp;<asp:TextBox ID="TraitDecription" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator id="TraitDecriptionEnteredValidator" runat="server"
            ControlToValidate="TraitDecription"
            ErrorMessage="Trait Decription is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="TraitDecriptionFormatValidator" runat="server"
            ControlToValidate="TraitDecription"
            ErrorMessage="You must enter a valid Trait Decription."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <input id="SubmitButton" type="submit" value="Submit" />
</asp:Content>
