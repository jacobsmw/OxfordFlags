<%@ Page Title="Payment Source Maintenance" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentSourceMaintenance.aspx.vb" Inherits="OxfordFlags.PaymentSourceMaintenance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PaymentSourceMaintenanceData" ForeColor="#333333" GridLines="None" DataKeyNames="Id">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Payment Source" SortExpression="Type" ControlStyle-Font-Size="Small" >
            </asp:BoundField>
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
        <asp:SqlDataSource ID="PaymentSourceMaintenanceData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PaymentSource]" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [PaymentSource] WHERE [Id] = @original_Id AND [Type] = @original_Type" InsertCommand="INSERT INTO [PaymentSource] ([Type]) VALUES (@Type)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [PaymentSource] SET [Type] = @Type WHERE [Id] = @original_Id AND [Type] = @original_Type">
            <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
                <asp:Parameter Name="original_Type" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
            <asp:Parameter Name="original_Type" Type="String" />
        </UpdateParameters>
        </asp:SqlDataSource>
    
<hr />

    <h3><%: "Add New Entry"%></h3>
    <p>
        <asp:Label ID="SourceNameLabel" runat="server" Text="Source Name"  CssClass="col-x2-2"></asp:Label>
        &nbsp;<asp:TextBox ID="SourceName" runat="server" CssClass="form-control" placeholder="PayPal"></asp:TextBox>
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