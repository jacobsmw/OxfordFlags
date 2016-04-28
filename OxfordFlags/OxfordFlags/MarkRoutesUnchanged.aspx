<%@ Page Title="MarkRoutesUnchanged" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MarkRoutesUnchanged.aspx.vb" Inherits="OxfordFlags.MarkRoutesUnchanged" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    Are you sure you wish to mark all routes as unchanged?<br />
    <asp:Button ID="YesButton" runat="server" Text="Yes" />
    <asp:Button ID="NoButton" runat="server" Text="No" PostBackUrl="~/Admin.aspx" />

</asp:Content>
