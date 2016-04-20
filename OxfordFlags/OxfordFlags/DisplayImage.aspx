<%@ Page Title="DisplayImage" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayImage.aspx.vb" Inherits="OxfordFlags.DisplayImage" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            Sleeves: <br />
            <asp:ListBox ID="SleevesListBox" runat="server" DataSourceID="SleevesDataSource" DataTextField="SleeveID" DataValueField="SleeveID" AutoPostBack="True"></asp:ListBox>
            <asp:SqlDataSource ID="SleevesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SleeveID] FROM [Sleeve]"></asp:SqlDataSource>
            <br />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
