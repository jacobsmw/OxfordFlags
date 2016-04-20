<%@ Page Title="EditRouteOrder" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditRouteOrder.aspx.vb" Inherits="OxfordFlags.EditRouteOrder" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            
            <br />
            Route Color:
            <asp:DropDownList ID="RouteColorsDropDownList" runat="server" AutoPostBack="True" DataSourceID="ColorsDataSource" DataTextField="RouteColor" DataValueField="RouteColor">
            </asp:DropDownList>
            <asp:SqlDataSource ID="ColorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [Route].RouteColor
FROM [Route]"></asp:SqlDataSource>
            <br />
            <asp:ListBox ID="PropertyOwnersListBox" runat="server" AutoPostBack="True" DataSourceID="PropertyOwnersDataSource" DataTextField="StreetAddress" DataValueField="PropertyOwnerID" Height="200px" Width="200px"></asp:ListBox>
            <asp:SqlDataSource ID="PropertyOwnersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectPropertyOwnersByRouteColor" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="RouteColorsDropDownList" Name="ROUTECOLOR" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <br />
            <asp:Button ID="UpButton" runat="server" Text="▲" />
            &nbsp;<asp:Button ID="DownButton" runat="server" Text="▼" />
            <br />
            <br />
            <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
            
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
