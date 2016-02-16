<%@ Page Title="Discount Maintenance" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DiscountMaintenance.aspx.vb" Inherits="OxfordFlags.DiscountMaintenance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    
<hr />

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DiscountMaintenanceData" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="DiscountReason" HeaderText="Discount Reason" SortExpression="DiscountReason" ControlStyle-Font-Size="Small" >
<ControlStyle Font-Size="Small"></ControlStyle>
            </asp:BoundField>
            <asp:BoundField DataField="DiscountAmount" HeaderText="Discount Amount" SortExpression="DiscountAmount" ControlStyle-Font-Size="Small" >
<ControlStyle Font-Size="Small"></ControlStyle>
            </asp:BoundField>
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" ControlStyle-Font-Size="Small" >
<ControlStyle Font-Size="Small"></ControlStyle>
            </asp:CheckBoxField>
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
    <asp:SqlDataSource ID="DiscountMaintenanceData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DiscountReason], [DiscountAmount], [Active] FROM [Discount]"></asp:SqlDataSource>
    
<hr />

    <h3><%: "Add New Entry"%></h3>
    <p>
        <asp:Label ID="DiscountDescriptionLabel" runat="server" Text="Discount Description"></asp:Label>
        &nbsp;<asp:TextBox ID="DiscountDescription" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="DiscountDescriptionEnteredValidator" runat="server"
            ControlToValidate="DiscountDescription"
            ErrorMessage="Discount Description is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="DiscountDescriptionFormatValidator" runat="server"
            ControlToValidate="DiscountDescription"
            ErrorMessage="You must enter a valid Discount Description."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="DiscountAmountLabel" runat="server" Text="Discount Amount"></asp:Label>
        &nbsp;<asp:TextBox ID="DiscountAmount" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="DiscountAmountEnteredValidator" runat="server"
            ControlToValidate="DiscountAmount"
            ErrorMessage="Discount Amount is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="DiscountAmountFormatValidator" runat="server"  
            ControlToValidate="DiscountAmount" 
            ErrorMessage="You must enter a valid price."
            ForeColor="Red"
            ValidationExpression="^\d+(\.\d\d)?$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:CheckBox ID="DiscountActive" runat="server" TextAlign="Left" Text="Discount Active" />
    </p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
&nbsp;<asp:Button ID="NewEntryButton" runat="server" Text="Submit New Entry" />
</asp:Content>
