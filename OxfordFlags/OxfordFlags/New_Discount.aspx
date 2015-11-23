<%@ Page Title="Add New Discount" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="false" CodeBehind="New_Discount.aspx.vb" Inherits="OxfordFlags.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Label ID="DiscountDescriptionLabel" runat="server" Text="Discount Description"></asp:Label>
        &nbsp;<asp:TextBox ID="DiscountDescription" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="DiscountDescriptionEnteredValidator" runat="server"
            ControlToValidate="DiscountDescription"
            ErrorMessage="Discount Description is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="DiscountDescriptionFormatValidator" runat="server"
            ControlToValidate="DiscountDescription"
            ErrorMessage="You must enter a valid Discount Description."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="DiscountAmountLabel" runat="server" Text="Discount Ammount"></asp:Label>
        &nbsp;<asp:TextBox ID="DiscountAmount" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="DiscountAmountEnteredValidator" runat="server"
            ControlToValidate="DiscountAmount"
            ErrorMessage="Discount Amount is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="DiscountAmountFormatValidator" runat="server"  
            ControlToValidate="DiscountAmount" 
            ErrorMessage="You must enter a valid price."
            ForeColor="Red"
            ValidationExpression="^\d+(\.\d\d)?$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:CheckBox ID="DiscountActive" runat="server" TextAlign="Left" Text="Discount Active" />
    </p>
    <input id="SubmitButton" type="submit" value="Submit" />
</asp:Content>
