<%@ Page Title="Order Source Maintenance" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OrderSourceMaintenance.aspx.vb" Inherits="OxfordFlags.OrderSourceMaintenance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    
<hr />

    <br />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="OrderSourceMaintenanceData" ForeColor="#333333" GridLines="None" DataKeyNames="SourceID">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="SourceID" HeaderText="SourceID" SortExpression="SourceID" ControlStyle-Font-Size="Small" InsertVisible="False" ReadOnly="True" Visible="False" >
<ControlStyle Font-Size="Small"></ControlStyle>
            </asp:BoundField>
            <asp:BoundField DataField="SourceName" HeaderText="Source Name" SortExpression="SourceName" />
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
    <asp:SqlDataSource ID="OrderSourceMaintenanceData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Source]" DeleteCommand="DELETE FROM [Source] WHERE [SourceID] = @SourceID" InsertCommand="INSERT INTO [Source] ([SourceName]) VALUES (@SourceName)" UpdateCommand="UPDATE [Source] SET [SourceName] = @SourceName WHERE [SourceID] = @SourceID">
        <DeleteParameters>
            <asp:Parameter Name="SourceID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SourceName" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="SourceName" Type="String" />
            <asp:Parameter Name="SourceID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

<hr />

    <h3><%: "Add New Entry"%></h3>
    <p>
        <asp:Label ID="SourceNameLabel" runat="server" Text="Source Name"  CssClass="col-x2-2"></asp:Label>
        &nbsp;<asp:TextBox ID="SourceName" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
        <asp:RequiredFieldValidator id="SourceNameEnteredValidator" runat="server"
            ControlToValidate="SourceName"
            ErrorMessage="Source Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="SourceNameFormatValidator" runat="server"
            ControlToValidate="SourceName"
            ErrorMessage="You must enter a valid Source Name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <asp:Button ID="NewEntryButton" runat="server" CssClass="btn btn-default" Text="Submit New Entry" />
</asp:Content>
