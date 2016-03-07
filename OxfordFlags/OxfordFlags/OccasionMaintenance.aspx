<%@ Page Title="Occasion Maintenance" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OccasionMaintenance.aspx.vb" Inherits="OxfordFlags.OccasionMaintenance" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <h2><%: Title %></h2>

<hr />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="OccasionMaintenanceData" Width="400px" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="OccasionID">
        <AlternatingRowStyle BackColor="White" />
        
        <Columns>
            <asp:BoundField DataField="OccasionID" HeaderText="OccasionID" SortExpression="OccasionID" ControlStyle-Font-Size="Small" InsertVisible="False" ReadOnly="True" Visible="False" >
            </asp:BoundField>
            <asp:BoundField DataField="OccasionName" HeaderText="OccasionName" SortExpression="OccasionName" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:SqlDataSource ID="OccasionMaintenanceData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Occasion]" DeleteCommand="DELETE FROM [Occasion] WHERE [OccasionID] = @OccasionID" InsertCommand="INSERT INTO [Occasion] ([OccasionName]) VALUES (@OccasionName)" UpdateCommand="UPDATE [Occasion] SET [OccasionName] = @OccasionName WHERE [OccasionID] = @OccasionID">
        <DeleteParameters>
            <asp:Parameter Name="OccasionID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OccasionName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="OccasionName" Type="String" />
            <asp:Parameter Name="OccasionID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

<hr />

    <h3><%: "Add New Entry"%></h3>
    <p>
        <asp:Label ID="OccasionNameLabel" runat="server" Text="Occasion Name"></asp:Label>
        &nbsp;<asp:TextBox ID="OccasionName" runat="server"></asp:TextBox>
        <%--<asp:RequiredFieldValidator id="OccasionNameEnteredValidator" runat="server"
            ControlToValidate="OccasionName"
            ErrorMessage="Ocassion Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="OccasionNameFormatValidator" runat="server"
            ControlToValidate="OccasionName"
            ErrorMessage="You must enter a valid Occasion Name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>--%>
    </p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    &nbsp;<asp:Button ID="NewEntryButton" runat="server" Text="Submit New Entry" />

</asp:Content>