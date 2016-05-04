<%@ Page Title="Sleeve Data Sheets" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SleeveDataSheets.aspx.vb" Inherits="OxfordFlags.SleeveDataSheets" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <p>
        &nbsp;  
        </p>
    <p>
        <asp:Button ID="SleeveDataSheetsButton" runat="server" Text="Search" />
        <br />
        <asp:Label ID="OutputLabel" runat="server"></asp:Label>
    </p>

</asp:Content>
