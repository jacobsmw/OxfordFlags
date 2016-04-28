<%@ Page Title="AddPayment" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPayment.aspx.vb" Inherits="OxfordFlags.AddPayment" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="SearchLabel" runat="server" Text="Search: "></asp:Label>
            <asp:TextBox ID="SearchInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search" />
            <br />
            <br />
            Orders:<br />
            <asp:ListBox ID="OrdersListBox" runat="server" DataSourceID="OrdersDataSource" DataTextField="OrderID" DataValueField="OrderID" AutoPostBack="True"></asp:ListBox>
            <asp:SqlDataSource ID="OrdersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectOrderCrossTable" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="SearchInput" Name="SEARCH" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <div id="Tabs" role="tabpanel">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="active"><a role="tab" data-toggle="tab" href="#OrderInfo">Order Overview</a></li>
                    <li><a role="tab" data-toggle="tab" href="#PaymentInfo">Payment History</a></li>
                </ul>
                <div class="tab-content">
                    <div id="OrderInfo" role="tabpanel" class="tab-pane fade in active">
                        <asp:Label ID="BuyersLabel" runat="server" Text="Buyers: "></asp:Label><br />
                        <asp:Label ID="PropertyOwnerLabel" runat="server" Text="Property Owner: "></asp:Label><br />
                        <asp:Label ID="PropertyOwnerAddressLabel" runat="server" Text="Address: "></asp:Label><br />
                        <asp:Label ID="AmountDueLabel" runat="server" Text="Amount Due: "></asp:Label><br />
                        <asp:Label ID="AmountPaidLabel" runat="server" Text="Amount Paid: "></asp:Label><br />
                    </div>
                    <div id="PaymentInfo" role="tabpanel" class="tab-pane fade in">
                        <asp:GridView ID="PaymentHistoryGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PaymentHistoryDataSource">
                            <Columns>
                                <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" />
                                <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" />
                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                <asp:BoundField DataField="Memo" HeaderText="Memo" SortExpression="Memo" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="PaymentHistoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectPaymentHistoryByOrderID" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="OrdersListBox" Name="ORDERID" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
            </div>
            <hr />
            Payment: <asp:TextBox ID="PaymentInput" runat="server"></asp:TextBox><br />
            Payment Date: <asp:TextBox ID="PaymentDateInput" runat="server"></asp:TextBox><br />
            Payment Type: <br />
            <asp:DropDownList ID="PaymentSourceDropDownList" runat="server" DataSourceID="PaymentSourceDataSource" DataTextField="Type" DataValueField="Id">
            </asp:DropDownList>
            <asp:SqlDataSource ID="PaymentSourceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PaymentSource]"></asp:SqlDataSource><br />
            Check # / Paypal ID: <asp:TextBox ID="PaymentMemoInput" runat="server"></asp:TextBox><br />
            <asp:Button ID="NewPaymentButton" runat="server" Text="New Payment" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
