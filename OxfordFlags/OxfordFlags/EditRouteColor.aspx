<%@ Page Title="EditRouteColor" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditRouteColor.aspx.vb" Inherits="OxfordFlags.EditRouteColor" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <br />
            <asp:Label ID="SearchLabel" runat="server" Text="Search: "></asp:Label>
            <asp:TextBox ID="SearchInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-primary" />
            <br />
            <br />
            <br />
            <asp:GridView ID="PropertyOwnerGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PropertyOwnerDataSource">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="PropertyOwnerID" HeaderText="PropertyOwnerID" InsertVisible="False" ReadOnly="True" SortExpression="PropertyOwnerID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
                    <asp:BoundField DataField="RouteColor" HeaderText="RouteColor" ReadOnly="True" SortExpression="RouteColor" />
                </Columns>
                <SelectedRowStyle BackColor="#0099FF" BorderColor="Red" />
            </asp:GridView>
            <asp:SqlDataSource ID="PropertyOwnerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectPropertyOwnerRouteColorBySearch" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SearchInput" Name="SEARCH" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <hr />
            Route Color: <asp:TextBox ID="RouteColorInput" runat="server"></asp:TextBox><br />
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
