<%@ Page Title="Add New Trait" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Trait.aspx.vb" Inherits="OxfordFlags.New_Trait" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Label ID="TraitDescriptionLabel" runat="server" Text="Trait Description"></asp:Label>
        &nbsp;<asp:TextBox ID="TraitDescription" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator id="TraitDescriptionEnteredValidator" runat="server"
            ControlToValidate="TraitDescription"
            ErrorMessage="Trait Description is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="TraitDescriptionFormatValidator" runat="server"
            ControlToValidate="TraitDescription"
            ErrorMessage="You must enter a valid Trait Description."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
&nbsp;<asp:Button ID="SubmitButton" runat="server" Text="Submit" />
</asp:Content>
