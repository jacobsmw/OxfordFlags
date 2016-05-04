<%@ Page Title="EditRouteColor" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditRouteColor.aspx.vb" Inherits="OxfordFlags.EditRouteColor" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <br />
            <asp:Label ID="SearchLabel" runat="server" Text="Search: " CssClass="col-x2-2"></asp:Label>
            <asp:TextBox ID="SearchInput" runat="server" CssClass="form-control" placeholder="Search Property Owner or Address"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-default" />
            <br />
            <br />
            <br />
            <asp:GridView ID="PropertyOwnerGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PropertyOwnerDataSource" CellPadding="4" ForeColor="#333333" GridLines="None" Width="750px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="PropertyOwnerID" HeaderText="Property Owner ID" InsertVisible="False" ReadOnly="True" SortExpression="PropertyOwnerID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                    <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress" />
                    <asp:BoundField DataField="RouteColor" HeaderText="Route Color" ReadOnly="True" SortExpression="RouteColor" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" BorderColor="Red" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="PropertyOwnerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectPropertyOwnerRouteColorBySearch" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SearchInput" Name="SEARCH" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <hr />
            Route Color: <asp:TextBox ID="RouteColorInput" runat="server" CssClass="form-control" placeholder="Route Color"></asp:TextBox><br />
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-info" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
