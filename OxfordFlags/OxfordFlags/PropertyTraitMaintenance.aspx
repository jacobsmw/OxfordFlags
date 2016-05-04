<%@ Page Title="Property Trait Maintenance" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PropertyTraitMaintenance.aspx.vb" Inherits="OxfordFlags.PropertyTraitMaintenance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

<hr />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PropertyTraitMaintenanceData" ForeColor="#333333" GridLines="None" Width="500px" DataKeyNames="TraitID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="TraitID" HeaderText="TraitID" SortExpression="TraitID" ControlStyle-Font-Size="Small" InsertVisible="False" ReadOnly="True" Visible="False" >
                <ControlStyle Font-Size="Small" />
                </asp:BoundField>
                <asp:BoundField DataField="TraitDescription" HeaderText="Trait Description" SortExpression="TraitDescription" />
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
        <asp:SqlDataSource ID="PropertyTraitMaintenanceData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Trait]" DeleteCommand="DELETE FROM [Trait] WHERE [TraitID] = @TraitID" InsertCommand="INSERT INTO [Trait] ([TraitDescription]) VALUES (@TraitDescription)" UpdateCommand="UPDATE [Trait] SET [TraitDescription] = @TraitDescription WHERE [TraitID] = @TraitID">
            <DeleteParameters>
                <asp:Parameter Name="TraitID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="TraitDescription" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="TraitDescription" Type="String" />
                <asp:Parameter Name="TraitID" Type="Int32" />
            </UpdateParameters>
    </asp:SqlDataSource>
    
<hr />

    <h3><%: "Add New Entry"%></h3>
    <p>
        <asp:Label ID="TraitDescriptionLabel" runat="server" CssClass="col-x2-2" Text="Trait Description"></asp:Label>
        &nbsp;<asp:TextBox ID="TraitDescription" runat="server" CssClass="form-control" placeholder="Dogs"></asp:TextBox>
    <asp:RequiredFieldValidator id="TraitDescriptionEnteredValidator" runat="server"
            ControlToValidate="TraitDescription"
            ErrorMessage="Trait Description is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="TraitDescriptionFormatValidator" runat="server"
            ControlToValidate="TraitDescription"
            ErrorMessage="You must enter a valid Trait Description."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
&nbsp;<asp:Button ID="NewEntryButton" runat="server" CssClass="btn btn-info" Text="Submit New Entry" />
</asp:Content>
