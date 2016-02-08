<%@ Page Title="Search" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.vb" Inherits="OxfordFlags.Search" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <hr />

    <p>
        <asp:Label ID="SearchNameLabel" runat="server" Text="Name"></asp:Label>
        &nbsp;<asp:TextBox ID="SearchName" runat="server"></asp:TextBox>
    </p>
   <%-- <p>
        <asp:Label ID="SearchAddressLabel" runat="server" Text="Address"></asp:Label>
        &nbsp<asp:TextBox ID="SearchAddress" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="SearchOUPSTicketLabel" runat="server" Text="OUPS Ticket"></asp:Label>
        &nbsp<asp:TextBox ID="SearchOUPSTicket" runat="server"></asp:TextBox>
    </p>--%>
    <asp:Button ID="SearchButton" runat="server" Text="Search"  />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    
    <br />
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            LastName:
            <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
            <br />
            FirstName:
            <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
            <br />
            StreetAddress:
            <asp:Label ID="StreetAddressLabel" runat="server" Text='<%# Eval("StreetAddress") %>' />
            <br />
            <asp:HyperLink ID="EditLink" runat="server" NavigateUrl="~/Edit_Entry.aspx">Edit</asp:HyperLink>
            <asp:HyperLink ID="ViewLink" runat="server">View</asp:HyperLink>
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [LastName], [FirstName], [StreetAddress] FROM [Buyer]"></asp:SqlDataSource>
    <br />
</asp:Content>