<%@ Page Title="Payment Source Maintenance" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PaymentSourceMaintenance.aspx.vb" Inherits="OxfordFlags.PaymentSourceMaintenance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="PaymentSourceMaintenanceData" ForeColor="#333333" GridLines="None" DataKeyNames="PaymentSourceId">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="PaymentSourceName" HeaderText="PaymentSourceName" SortExpression="PaymentSourceName" />
            <asp:BoundField DataField="PaymentSourceId" HeaderText="PaymentSourceId" SortExpression="PaymentSourceId" ControlStyle-Font-Size="Small" ReadOnly="True" InsertVisible="False" Visible="False" >
<ControlStyle Font-Size="Small"></ControlStyle>
            </asp:BoundField>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="PaymentSourceMaintenanceData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PaymentSource]">
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
    </h2>
    
<hr />
</asp:Content>