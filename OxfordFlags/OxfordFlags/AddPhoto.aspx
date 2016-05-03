<%@ Page Title="AddPhoto" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPhoto.aspx.vb" Inherits="OxfordFlags.AddPhoto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <p>
        <br />
        <asp:ListBox ID="SleevesListBox" runat="server" DataSourceID="SleevesDataSource" DataTextField="SleeveID" DataValueField="SleeveID"></asp:ListBox>
        <asp:SqlDataSource ID="SleevesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SleeveID] FROM [Sleeve]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:FileUpload ID="SleevePhotoFileUpload" runat="server" AllowMultiple="True" />
    </p>
    <p>
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" />
    </p>

</asp:Content>
