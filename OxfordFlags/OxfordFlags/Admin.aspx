<%@ Page Title="Admin Controls" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.vb" Inherits="OxfordFlags.Admin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" />
    </h2>
    <p>
        <asp:Button ID="AddNewUserButton" runat="server" Text="Add New User" PostBackUrl="~/Account/Register.aspx" Width="175px" />
    </p>
    <p>
        <asp:Button ID="ViewUsersButton" runat="server" Text="View Users" Width="175px" />
    </p>
    <p>
        <asp:Button ID="AddNewOccasionButton" runat="server" Text="Add New Occasion" PostBackUrl="~/New_Occasion.aspx" Width="175px" />
    </p>
    <p>
        <asp:Button ID="AddNewTraitButton" runat="server" Text="Add New Trait" PostBackUrl="~/New_Trait.aspx" Width="175px" />
    </p>
    <p>
        <asp:Button ID="AddNewSourceButton" runat="server" Text="Add New Source" PostBackUrl="~/New_Source.aspx" Width="175px" />
    </p>
    <p>
        <asp:Button ID="AddNewDiscountButton" runat="server" Text="Add New Discount" PostBackUrl="~/New_Discount.aspx" Width="175px" />
    </p>
    <p>
        <asp:Button ID="EditActiveDiscountsButton" runat="server" Text="Edit Active Discounts" PostBackUrl="~/Edit_Discounts.aspx" Width="175px" />
    </p>
</asp:Content>