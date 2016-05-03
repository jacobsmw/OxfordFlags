<%@ Page Title="AddPayment" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPayment.aspx.vb" Inherits="OxfordFlags.AddPayment" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="SearchLabel" runat="server" Text="Search: "></asp:Label>
            <asp:TextBox ID="SearchInput" runat="server"></asp:TextBox>
            <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-default" />
            <br />
            <br />
            Orders:<br />
            <asp:ListBox ID="OrdersListBox" runat="server" DataSourceID="OrdersDataSource" DataTextField="OrderID" DataValueField="OrderID" AutoPostBack="True" Height="75px" Width="100px" ></asp:ListBox>
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
                        <asp:Table ID="OrderInfoTable" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>Buyers</asp:TableCell>
                                <asp:TableCell ID="BuyersCell"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Property Owner</asp:TableCell>
                                <asp:TableCell ID="PropertyOwnerCell"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Address</asp:TableCell>
                                <asp:TableCell ID="PropertyOwnerAddressCell"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Total Amount Owed</asp:TableCell>
                                <asp:TableCell ID="TotalAmountOwedCell"></asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>Total Amount Paid</asp:TableCell>
                                <asp:TableCell ID="TotalAmountPaidCell"></asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                    <div id="PaymentInfo" role="tabpanel" class="tab-pane fade in">
                        <asp:GridView ID="PaymentHistoryGridView" runat="server" AutoGenerateColumns="False" DataSourceID="PaymentHistoryDataSource">
                            <Columns>
                                <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" />
                                <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" />
                                <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                <asp:BoundField DataField="CheckPaypalNumber" HeaderText="CheckPaypalNumber" SortExpression="CheckPaypalNumber" />
                                <asp:BoundField DataField="PaypalTransaction" HeaderText="PaypalTransaction" SortExpression="PaypalTransaction" />
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
            <div class="form-group">
                Payment: <asp:TextBox ID="PaymentInput" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                Payment Date: <asp:TextBox ID="PaymentDateInput" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                Payment Type: <br />
                <asp:DropDownList ID="PaymentSourceDropDownList" runat="server" DataSourceID="PaymentSourceDataSource" DataTextField="Type" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="PaymentSourceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PaymentSource]"></asp:SqlDataSource><br />
            </div>
            <div class="form-group">
                Check # / Paypal ID: <asp:TextBox ID="PaymentCheckPaypalNumberInput" runat="server"></asp:TextBox><br />
            </div>
            <div class="form-group">
                Paypal Transaction: <asp:TextBox ID="PaymentPaypalTransactionInput" runat="server"></asp:TextBox><br />
            </div>
            <asp:Button ID="NewPaymentButton" runat="server" Text="New Payment" CssClass="btn btn-default" />
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
