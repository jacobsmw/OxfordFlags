<%@ Page Title="Search" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.vb" Inherits="OxfordFlags.Search" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"
type = "text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
type = "text/javascript"></script>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
rel = "Stylesheet" type="text/css" />


<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=PersonSearchBox.ClientID%>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/SearchByBuyer")%>',
                    data: "{ 'name': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("#<%=hfPersonID.ClientID%>").val(i.item.val);
            },
            minLength: 1
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function () {
        $("#<%=AddressSearchBox.ClientID%>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/SearchByAddress")%>',
                    data: "{ 'address': '" + request.term + "'}",
                    dataType: "json",
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    success: function (data) {
                        response($.map(data.d, function (item) {
                            return {
                                label: item.split('-')[0],
                                val: item.split('-')[1]
                            }
                        }))
                    },
                    error: function (response) {
                        alert(response.responseText);
                    },
                    failure: function (response) {
                        alert(response.responseText);
                    }
                });
            },
            select: function (e, i) {
                $("#<%=hfPropertyOwnerID.ClientID%>").val(i.item.val);
            },
            minLength: 1
        });
    });
</script>


    <hr />

    <asp:DropDownList ID="SelectSearchType" runat="server" OnSelectedIndexChanged="SelectSearchType_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Value="0">Please Select Search Criteria</asp:ListItem>
        <asp:ListItem Value="1">Buyer</asp:ListItem>
        <asp:ListItem Value="2">Address</asp:ListItem>
    </asp:DropDownList>
    
    <br />
    
    <asp:TextBox ID="PersonSearchBox" runat="server" CssClass="form-control" placeholder="Buyer Name"></asp:TextBox>
    <asp:Button ID="PersonSearchButton" runat="server" CssClass="btn btn-default" Text="Search" OnClick = "PersonSearch" />

    <asp:TextBox ID="AddressSearchBox" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
    <asp:Button ID="AddressSearchButton" runat="server" CssClass="btn btn-default" Text="Search" OnClick = "AddressSearch" />

    <br />
    <br />
    
    <asp:DetailsView ID="BuyerDetails" runat="server" AutoGenerateRows="False" DataSourceID="PersonSearchResultsData" Height="50px" HorizontalAlign="Justify" DataKeyNames="BuyerID" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" HeaderText="Buyer" ForeColor="Black">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="BuyerID" HeaderText="Buyer ID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
            <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="BillType" HeaderText="BillType" SortExpression="Bill Type" />
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="Rotary Member" SortExpression="RotaryMember" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    
    <asp:DetailsView ID="PropertyDetails" runat="server" AutoGenerateColumns="False" DataSourceID="AddressSearchResultsData" HorizontalAlign="Justify" AutoGenerateRows="False" DataKeyNames="PropertyOwnerID,TraitID,Expr1,Expr2" HeaderText="Property" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <Fields>
           <%-- <asp:BoundField DataField="TraitDescription" HeaderText="Trait Description" SortExpression="TraitDescription"/>--%>
            <asp:BoundField DataField="PropertyOwnerID" HeaderText="PropertyOwnerID" InsertVisible="False" ReadOnly="True" SortExpression="PropertyOwnerID" Visible="False" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="Rotary Member" SortExpression="RotaryMember"/>
            <asp:BoundField DataField="TraitDescription" HeaderText="Property Traits" SortExpression="TraitDescription" />
            <asp:BoundField DataField="TraitID" HeaderText="TraitID" InsertVisible="False" ReadOnly="True" SortExpression="TraitID" Visible="False" />
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" ReadOnly="True" SortExpression="Expr1" Visible="False" />
            <asp:BoundField DataField="Expr2" HeaderText="Expr2" ReadOnly="True" SortExpression="Expr2" Visible="False" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
    </asp:DetailsView>
    <br />
    <asp:Label ID="OrderDetailsLabel" runat="server" Text="Select an order to see payments made."></asp:Label>
    <asp:GridView ID="OrderDetails" runat="server" AutoGenerateColumns="False" DataSourceID="OrderResultsData" HorizontalAlign="Justify" DataKeyNames="OrderID,Expr1,BuyerID,Expr2,Expr3,OccasionID" HeaderText="Orders" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" InsertVisible="False" ReadOnly="True" Visible="False"/>
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate"/>
            <asp:BoundField DataField="SourceID" HeaderText="SourceID" SortExpression="SourceID" Visible="False"/>
            <asp:BoundField DataField="SubYear" HeaderText="Subscription Year" SortExpression="SubYear"/>
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="DiscountID" HeaderText="DiscountID" SortExpression="DiscountID" Visible="False"/>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type"/>
            <asp:BoundField DataField="ConfirmationDate" HeaderText="Confirmation Date" SortExpression="ConfirmationDate"/>
            <asp:BoundField DataField="FirstOccasionID" HeaderText="FirstOccasionID" SortExpression="FirstOccasionID" Visible="False"/>
            <asp:BoundField DataField="Expr1" HeaderText="Expr1" SortExpression="Expr1" ReadOnly="True" Visible="False"/>
            <asp:BoundField DataField="DiscountReason" HeaderText="Discount" SortExpression="DiscountReason" />
            <asp:BoundField DataField="SourceName" HeaderText="Source Name" SortExpression="SourceName" />
            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" SortExpression="BuyerID" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="Expr2" HeaderText="Expr2" InsertVisible="False" ReadOnly="True" SortExpression="Expr2" Visible="False" />
            <asp:BoundField DataField="Expr3" HeaderText="Expr3" InsertVisible="False" ReadOnly="True" SortExpression="Expr3" Visible="False" />
            <asp:BoundField DataField="OccasionName" HeaderText="First Occasion" SortExpression="OccasionName" />
            <asp:BoundField DataField="OccasionID" HeaderText="OccasionID" InsertVisible="False" ReadOnly="True" SortExpression="OccasionID" Visible="False" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:Label ID="OupsDetailsLabel" runat="server" Text="Select a sleeve to see OUPS details."></asp:Label>
    <asp:GridView ID="SleeveDetails" runat="server" AutoGenerateColumns="False" DataSourceID="SleeveOupsResultsData" HorizontalAlign="Justify" DataKeyNames="SleeveID" HeaderText="Sleeves" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName" Visible="False"/>
            <asp:BoundField DataField="SleeveID" HeaderText="SleeveID" InsertVisible="False" ReadOnly="True" SortExpression="SleeveID" Visible="False"/>
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
            <asp:BoundField DataField="PropertyOwnerID" HeaderText="PropertyOwnerID" SortExpression="PropertyOwnerID" Visible="False"/>
            <asp:BoundField DataField="LocationDescription" HeaderText="Location Description" SortExpression="LocationDescription" />
            <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"/>
            <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"/>
            <asp:BoundField DataField="OupsID" HeaderText="OupsID" SortExpression="OupsID" Visible="False"/>
            <asp:BoundField DataField="InstalledDate" HeaderText="Installed Date" SortExpression="InstalledDate"/>
            <asp:BoundField DataField="ChangeDate" HeaderText="Change Date" SortExpression="ChangeDate"/>
            <asp:CheckBoxField DataField="Public" HeaderText="Public" SortExpression="Public" />
            <asp:CheckBoxField DataField="Deliver" HeaderText="Deliver" SortExpression="Deliver" />
            <asp:BoundField DataField="ExpiredDate" HeaderText="Expired Date" SortExpression="ExpiredDate"/>
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>

    <br />
            
    <asp:GridView ID="PaymentSleeveDetails" runat="server" AutoGenerateColumns="False" DataSourceID="PaymentResultsData" HorizontalAlign="Justify" DataKeyNames="PaymentID,Id" HeaderText="Payments" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="PaymentID" HeaderText="PaymentID" InsertVisible="False" ReadOnly="True" SortExpression="PaymentID" Visible="False"/>
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" Visible="False"/>
            <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment"/>
            <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" SortExpression="PaymentDate"/>
            <asp:BoundField DataField="PaymentSource" HeaderText="PaymentSource" SortExpression="PaymentSource" Visible="False"/>
            <asp:BoundField DataField="CheckPaypalNumber" HeaderText="Check/Paypal Number" SortExpression="CheckPaypalNumber"/>
            <asp:BoundField DataField="PaypalTransaction" HeaderText="Paypal Transaction" SortExpression="PaypalTransaction" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
            <asp:BoundField DataField="Type" HeaderText="Payment Source" SortExpression="Type" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <asp:GridView ID="OupsDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="OupsID" DataSourceID="OupsResultsData" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="OupsID" HeaderText="OupsID" InsertVisible="False" ReadOnly="True" SortExpression="OupsID"/>
            <asp:BoundField DataField="OupsTicketNumber" HeaderText="OUPS Ticket Number" SortExpression="OupsTicketNumber" />
            <asp:BoundField DataField="OupsNotifiedDate" HeaderText="OUPS Notified Date" SortExpression="OupsNotifiedDate" />
            <asp:BoundField DataField="OupsCheckedDate" HeaderText="OUPS Checked Date" SortExpression="OupsCheckedDate" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
    <br />


    <asp:HiddenField ID="hfPersonID" runat="server" />
    <asp:HiddenField ID="hfPropertyOwnerId" runat="server" />

    <asp:SqlDataSource ID="AddressSearchResultsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PropertyOwner.PropertyOwnerID, PropertyOwner.LastName, PropertyOwner.FirstName, PropertyOwner.StreetAddress, PropertyOwner.City, PropertyOwner.State, PropertyOwner.Zip, PropertyOwner.Email, PropertyOwner.Phone, PropertyOwner.RotaryMember, Trait.TraitDescription, Trait.TraitID, PropertyTraits.TraitID AS Expr1, PropertyTraits.PropertyOwnerID AS Expr2 FROM PropertyOwner INNER JOIN PropertyTraits ON PropertyOwner.PropertyOwnerID = PropertyTraits.PropertyOwnerID INNER JOIN Trait ON PropertyTraits.TraitID = Trait.TraitID WHERE (PropertyOwner.PropertyOwnerID = @PropertyOwnerID)" UpdateCommand="UPDATE [PropertyOwner] SET [LastName] = @LastName, [FirstName] = @FirstName, [StreetAddress] = @StreetAddress, [City] = @City, [State] = @State, [Zip] = @Zip, [Email] = @Email, [Phone] = @Phone, [RotaryMember] = @RotaryMember WHERE [PropertyOwnerID] = @original_PropertyOwnerID AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND [StreetAddress] = @original_StreetAddress AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([RotaryMember] = @original_RotaryMember) OR ([RotaryMember] IS NULL AND @original_RotaryMember IS NULL))" DeleteCommand="DELETE FROM [PropertyOwner] WHERE [PropertyOwnerID] = @original_PropertyOwnerID AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL)) AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND [StreetAddress] = @original_StreetAddress AND [City] = @original_City AND [State] = @original_State AND [Zip] = @original_Zip AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND (([RotaryMember] = @original_RotaryMember) OR ([RotaryMember] IS NULL AND @original_RotaryMember IS NULL))" InsertCommand="INSERT INTO [PropertyOwner] ([LastName], [FirstName], [StreetAddress], [City], [State], [Zip], [Email], [Phone], [RotaryMember]) VALUES (@LastName, @FirstName, @StreetAddress, @City, @State, @Zip, @Email, @Phone, @RotaryMember)" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_PropertyOwnerID" Type="Int32" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_StreetAddress" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_Zip" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_RotaryMember" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="RotaryMember" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPropertyOwnerId" Name="PropertyOwnerID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="RotaryMember" Type="Boolean" />
            <asp:Parameter Name="original_PropertyOwnerID" Type="Int32" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_StreetAddress" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_Zip" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_RotaryMember" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="OupsResultsData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Oups] WHERE [OupsID] = @original_OupsID AND [OupsTicketNumber] = @original_OupsTicketNumber AND (([OupsNotifiedDate] = @original_OupsNotifiedDate) OR ([OupsNotifiedDate] IS NULL AND @original_OupsNotifiedDate IS NULL)) AND (([OupsCheckedDate] = @original_OupsCheckedDate) OR ([OupsCheckedDate] IS NULL AND @original_OupsCheckedDate IS NULL))" InsertCommand="INSERT INTO [Oups] ([OupsTicketNumber], [OupsNotifiedDate], [OupsCheckedDate]) VALUES (@OupsTicketNumber, @OupsNotifiedDate, @OupsCheckedDate)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Oups] WHERE ([OupsID] = @OupsID)" UpdateCommand="UPDATE [Oups] SET [OupsTicketNumber] = @OupsTicketNumber, [OupsNotifiedDate] = @OupsNotifiedDate, [OupsCheckedDate] = @OupsCheckedDate WHERE [OupsID] = @original_OupsID AND [OupsTicketNumber] = @original_OupsTicketNumber AND (([OupsNotifiedDate] = @original_OupsNotifiedDate) OR ([OupsNotifiedDate] IS NULL AND @original_OupsNotifiedDate IS NULL)) AND (([OupsCheckedDate] = @original_OupsCheckedDate) OR ([OupsCheckedDate] IS NULL AND @original_OupsCheckedDate IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_OupsID" Type="Int32" />
            <asp:Parameter Name="original_OupsTicketNumber" Type="String" />
            <asp:Parameter DbType="Date" Name="original_OupsNotifiedDate" />
            <asp:Parameter DbType="Date" Name="original_OupsCheckedDate" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OupsTicketNumber" Type="String" />
            <asp:Parameter DbType="Date" Name="OupsNotifiedDate" />
            <asp:Parameter DbType="Date" Name="OupsCheckedDate" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="SleeveDetails" Name="OupsID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OupsTicketNumber" Type="String" />
            <asp:Parameter DbType="Date" Name="OupsNotifiedDate" />
            <asp:Parameter DbType="Date" Name="OupsCheckedDate" />
            <asp:Parameter Name="original_OupsID" Type="Int32" />
            <asp:Parameter Name="original_OupsTicketNumber" Type="String" />
            <asp:Parameter DbType="Date" Name="original_OupsNotifiedDate" />
            <asp:Parameter DbType="Date" Name="original_OupsCheckedDate" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SleeveOupsResultsData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Sleeve] WHERE [SleeveID] = @original_SleeveID AND [Active] = @original_Active AND [PropertyOwnerID] = @original_PropertyOwnerID AND (([LocationDescription] = @original_LocationDescription) OR ([LocationDescription] IS NULL AND @original_LocationDescription IS NULL)) AND [Latitude] = @original_Latitude AND [Longitude] = @original_Longitude AND (([OupsID] = @original_OupsID) OR ([OupsID] IS NULL AND @original_OupsID IS NULL)) AND (([InstalledDate] = @original_InstalledDate) OR ([InstalledDate] IS NULL AND @original_InstalledDate IS NULL)) AND (([ChangeDate] = @original_ChangeDate) OR ([ChangeDate] IS NULL AND @original_ChangeDate IS NULL)) AND (([Public] = @original_Public) OR ([Public] IS NULL AND @original_Public IS NULL)) AND (([Deliver] = @original_Deliver) OR ([Deliver] IS NULL AND @original_Deliver IS NULL)) AND (([ExpiredDate] = @original_ExpiredDate) OR ([ExpiredDate] IS NULL AND @original_ExpiredDate IS NULL)) AND (([SleeveName] = @original_SleeveName) OR ([SleeveName] IS NULL AND @original_SleeveName IS NULL))" InsertCommand="INSERT INTO [Sleeve] ([Active], [PropertyOwnerID], [LocationDescription], [Latitude], [Longitude], [OupsID], [InstalledDate], [ChangeDate], [Public], [Deliver], [ExpiredDate], [SleeveName]) VALUES (@Active, @PropertyOwnerID, @LocationDescription, @Latitude, @Longitude, @OupsID, @InstalledDate, @ChangeDate, @Public, @Deliver, @ExpiredDate, @SleeveName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT SleeveID, Active, PropertyOwnerID, LocationDescription, Latitude, Longitude, OupsID, InstalledDate, ChangeDate, [Public], Deliver, ExpiredDate, SleeveName FROM Sleeve WHERE (PropertyOwnerID = @PropertyOwnerID)" UpdateCommand="UPDATE [Sleeve] SET [Active] = @Active, [PropertyOwnerID] = @PropertyOwnerID, [LocationDescription] = @LocationDescription, [Latitude] = @Latitude, [Longitude] = @Longitude, [OupsID] = @OupsID, [InstalledDate] = @InstalledDate, [ChangeDate] = @ChangeDate, [Public] = @Public, [Deliver] = @Deliver, [ExpiredDate] = @ExpiredDate, [SleeveName] = @SleeveName WHERE [SleeveID] = @original_SleeveID AND [Active] = @original_Active AND [PropertyOwnerID] = @original_PropertyOwnerID AND (([LocationDescription] = @original_LocationDescription) OR ([LocationDescription] IS NULL AND @original_LocationDescription IS NULL)) AND [Latitude] = @original_Latitude AND [Longitude] = @original_Longitude AND (([OupsID] = @original_OupsID) OR ([OupsID] IS NULL AND @original_OupsID IS NULL)) AND (([InstalledDate] = @original_InstalledDate) OR ([InstalledDate] IS NULL AND @original_InstalledDate IS NULL)) AND (([ChangeDate] = @original_ChangeDate) OR ([ChangeDate] IS NULL AND @original_ChangeDate IS NULL)) AND (([Public] = @original_Public) OR ([Public] IS NULL AND @original_Public IS NULL)) AND (([Deliver] = @original_Deliver) OR ([Deliver] IS NULL AND @original_Deliver IS NULL)) AND (([ExpiredDate] = @original_ExpiredDate) OR ([ExpiredDate] IS NULL AND @original_ExpiredDate IS NULL)) AND (([SleeveName] = @original_SleeveName) OR ([SleeveName] IS NULL AND @original_SleeveName IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_SleeveID" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
            <asp:Parameter Name="original_PropertyOwnerID" Type="Int32" />
            <asp:Parameter Name="original_LocationDescription" Type="String" />
            <asp:Parameter Name="original_Latitude" Type="Double" />
            <asp:Parameter Name="original_Longitude" Type="Double" />
            <asp:Parameter Name="original_OupsID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_InstalledDate" />
            <asp:Parameter DbType="Date" Name="original_ChangeDate" />
            <asp:Parameter Name="original_Public" Type="Boolean" />
            <asp:Parameter Name="original_Deliver" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_ExpiredDate" />
            <asp:Parameter Name="original_SleeveName" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="PropertyOwnerID" Type="Int32" />
            <asp:Parameter Name="LocationDescription" Type="String" />
            <asp:Parameter Name="Latitude" Type="Double" />
            <asp:Parameter Name="Longitude" Type="Double" />
            <asp:Parameter Name="OupsID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="InstalledDate" />
            <asp:Parameter DbType="Date" Name="ChangeDate" />
            <asp:Parameter Name="Public" Type="Boolean" />
            <asp:Parameter Name="Deliver" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="ExpiredDate" />
            <asp:Parameter Name="SleeveName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPropertyOwnerId" Name="PropertyOwnerID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="PropertyOwnerID" Type="Int32" />
            <asp:Parameter Name="LocationDescription" Type="String" />
            <asp:Parameter Name="Latitude" Type="Double" />
            <asp:Parameter Name="Longitude" Type="Double" />
            <asp:Parameter Name="OupsID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="InstalledDate" />
            <asp:Parameter DbType="Date" Name="ChangeDate" />
            <asp:Parameter Name="Public" Type="Boolean" />
            <asp:Parameter Name="Deliver" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="ExpiredDate" />
            <asp:Parameter Name="SleeveName" Type="String" />
            <asp:Parameter Name="original_SleeveID" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
            <asp:Parameter Name="original_PropertyOwnerID" Type="Int32" />
            <asp:Parameter Name="original_LocationDescription" Type="String" />
            <asp:Parameter Name="original_Latitude" Type="Double" />
            <asp:Parameter Name="original_Longitude" Type="Double" />
            <asp:Parameter Name="original_OupsID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_InstalledDate" />
            <asp:Parameter DbType="Date" Name="original_ChangeDate" />
            <asp:Parameter Name="original_Public" Type="Boolean" />
            <asp:Parameter Name="original_Deliver" Type="Boolean" />
            <asp:Parameter DbType="Date" Name="original_ExpiredDate" />
            <asp:Parameter Name="original_SleeveName" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="PersonSearchResultsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buyer] WHERE ([BuyerID] = @BuyerID)" UpdateCommand="UPDATE [Buyer] SET [Active] = @Active, [LastName] = @LastName, [FirstName] = @FirstName, [StreetAddress] = @StreetAddress, [City] = @City, [State] = @State, [Zip] = @Zip, [Email] = @Email, [Phone] = @Phone, [BillType] = @BillType, [RotaryMember] = @RotaryMember WHERE [BuyerID] = @original_BuyerID AND [Active] = @original_Active AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND (([StreetAddress] = @original_StreetAddress) OR ([StreetAddress] IS NULL AND @original_StreetAddress IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([Zip] = @original_Zip) OR ([Zip] IS NULL AND @original_Zip IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND [BillType] = @original_BillType AND (([RotaryMember] = @original_RotaryMember) OR ([RotaryMember] IS NULL AND @original_RotaryMember IS NULL))" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Buyer] WHERE [BuyerID] = @original_BuyerID AND [Active] = @original_Active AND [LastName] = @original_LastName AND [FirstName] = @original_FirstName AND (([StreetAddress] = @original_StreetAddress) OR ([StreetAddress] IS NULL AND @original_StreetAddress IS NULL)) AND (([City] = @original_City) OR ([City] IS NULL AND @original_City IS NULL)) AND (([State] = @original_State) OR ([State] IS NULL AND @original_State IS NULL)) AND (([Zip] = @original_Zip) OR ([Zip] IS NULL AND @original_Zip IS NULL)) AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND (([Phone] = @original_Phone) OR ([Phone] IS NULL AND @original_Phone IS NULL)) AND [BillType] = @original_BillType AND (([RotaryMember] = @original_RotaryMember) OR ([RotaryMember] IS NULL AND @original_RotaryMember IS NULL))" InsertCommand="INSERT INTO [Buyer] ([Active], [LastName], [FirstName], [StreetAddress], [City], [State], [Zip], [Email], [Phone], [BillType], [RotaryMember]) VALUES (@Active, @LastName, @FirstName, @StreetAddress, @City, @State, @Zip, @Email, @Phone, @BillType, @RotaryMember)" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_BuyerID" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_StreetAddress" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_Zip" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_BillType" Type="String" />
            <asp:Parameter Name="original_RotaryMember" Type="Boolean" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="BillType" Type="String" />
            <asp:Parameter Name="RotaryMember" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPersonID" Name="BuyerID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Active" Type="Boolean" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="StreetAddress" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="Zip" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="Phone" Type="String" />
            <asp:Parameter Name="BillType" Type="String" />
            <asp:Parameter Name="RotaryMember" Type="Boolean" />
            <asp:Parameter Name="original_BuyerID" Type="Int32" />
            <asp:Parameter Name="original_Active" Type="Boolean" />
            <asp:Parameter Name="original_LastName" Type="String" />
            <asp:Parameter Name="original_FirstName" Type="String" />
            <asp:Parameter Name="original_StreetAddress" Type="String" />
            <asp:Parameter Name="original_City" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_Zip" Type="String" />
            <asp:Parameter Name="original_Email" Type="String" />
            <asp:Parameter Name="original_Phone" Type="String" />
            <asp:Parameter Name="original_BillType" Type="String" />
            <asp:Parameter Name="original_RotaryMember" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>
    

    <asp:SqlDataSource ID="OrderResultsData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Order] WHERE [OrderID] = @original_OrderID AND [OrderDate] = @original_OrderDate AND [SourceID] = @original_SourceID AND [SubYear] = @original_SubYear AND [Cost] = @original_Cost AND (([DiscountID] = @original_DiscountID) OR ([DiscountID] IS NULL AND @original_DiscountID IS NULL)) AND [Type] = @original_Type AND (([ConfirmationDate] = @original_ConfirmationDate) OR ([ConfirmationDate] IS NULL AND @original_ConfirmationDate IS NULL)) AND [FirstOccasionID] = @original_FirstOccasionID" InsertCommand="INSERT INTO [Order] ([OrderDate], [SourceID], [SubYear], [Cost], [DiscountID], [Type], [ConfirmationDate], [FirstOccasionID]) VALUES (@OrderDate, @SourceID, @SubYear, @Cost, @DiscountID, @Type, @ConfirmationDate, @FirstOccasionID)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Order].OrderID, [Order].OrderDate, [Order].SourceID, [Order].SubYear, [Order].Cost, [Order].DiscountID, [Order].Type, [Order].ConfirmationDate, [Order].FirstOccasionID, BuyerOrder.OrderID AS Expr1, Discount.DiscountReason, Source.SourceName, BuyerOrder.BuyerID, Source.SourceID AS Expr2, Discount.DiscountID AS Expr3, Occasion.OccasionName, Occasion.OccasionID FROM [Order] INNER JOIN BuyerOrder ON [Order].OrderID = BuyerOrder.OrderID INNER JOIN Source ON [Order].SourceID = Source.SourceID INNER JOIN Discount ON [Order].DiscountID = Discount.DiscountID INNER JOIN Occasion ON [Order].FirstOccasionID = Occasion.OccasionID WHERE (BuyerOrder.BuyerID = @BUYERID)" UpdateCommand="UPDATE [Order] SET [OrderDate] = @OrderDate, [SourceID] = @SourceID, [SubYear] = @SubYear, [Cost] = @Cost, [DiscountID] = @DiscountID, [Type] = @Type, [ConfirmationDate] = @ConfirmationDate, [FirstOccasionID] = @FirstOccasionID WHERE [OrderID] = @original_OrderID AND [OrderDate] = @original_OrderDate AND [SourceID] = @original_SourceID AND [SubYear] = @original_SubYear AND [Cost] = @original_Cost AND (([DiscountID] = @original_DiscountID) OR ([DiscountID] IS NULL AND @original_DiscountID IS NULL)) AND [Type] = @original_Type AND (([ConfirmationDate] = @original_ConfirmationDate) OR ([ConfirmationDate] IS NULL AND @original_ConfirmationDate IS NULL)) AND [FirstOccasionID] = @original_FirstOccasionID">
        <DeleteParameters>
            <asp:Parameter Name="original_OrderID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_OrderDate" />
            <asp:Parameter Name="original_SourceID" Type="Int32" />
            <asp:Parameter Name="original_SubYear" Type="Int32" />
            <asp:Parameter Name="original_Cost" Type="Double" />
            <asp:Parameter Name="original_DiscountID" Type="Int32" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter DbType="Date" Name="original_ConfirmationDate" />
            <asp:Parameter Name="original_FirstOccasionID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DbType="Date" Name="OrderDate" />
            <asp:Parameter Name="SourceID" Type="Int32" />
            <asp:Parameter Name="SubYear" Type="Int32" />
            <asp:Parameter Name="Cost" Type="Double" />
            <asp:Parameter Name="DiscountID" Type="Int32" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter DbType="Date" Name="ConfirmationDate" />
            <asp:Parameter Name="FirstOccasionID" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPersonID" Name="BUYERID" PropertyName="Value" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter DbType="Date" Name="OrderDate" />
            <asp:Parameter Name="SourceID" Type="Int32" />
            <asp:Parameter Name="SubYear" Type="Int32" />
            <asp:Parameter Name="Cost" Type="Double" />
            <asp:Parameter Name="DiscountID" Type="Int32" />
            <asp:Parameter Name="Type" Type="String" />
            <asp:Parameter DbType="Date" Name="ConfirmationDate" />
            <asp:Parameter Name="FirstOccasionID" Type="Int32" />
            <asp:Parameter Name="original_OrderID" Type="Int32" />
            <asp:Parameter DbType="Date" Name="original_OrderDate" />
            <asp:Parameter Name="original_SourceID" Type="Int32" />
            <asp:Parameter Name="original_SubYear" Type="Int32" />
            <asp:Parameter Name="original_Cost" Type="Double" />
            <asp:Parameter Name="original_DiscountID" Type="Int32" />
            <asp:Parameter Name="original_Type" Type="String" />
            <asp:Parameter DbType="Date" Name="original_ConfirmationDate" />
            <asp:Parameter Name="original_FirstOccasionID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="PaymentResultsData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Payment] WHERE [PaymentID] = @original_PaymentID AND [OrderID] = @original_OrderID AND [Payment] = @original_Payment AND [PaymentDate] = @original_PaymentDate AND [PaymentSource] = @original_PaymentSource AND (([CheckPaypalNumber] = @original_CheckPaypalNumber) OR ([CheckPaypalNumber] IS NULL AND @original_CheckPaypalNumber IS NULL)) AND (([PaypalTransaction] = @original_PaypalTransaction) OR ([PaypalTransaction] IS NULL AND @original_PaypalTransaction IS NULL))" InsertCommand="INSERT INTO [Payment] ([OrderID], [Payment], [PaymentDate], [PaymentSource], [CheckPaypalNumber], [PaypalTransaction]) VALUES (@OrderID, @Payment, @PaymentDate, @PaymentSource, @CheckPaypalNumber, @PaypalTransaction)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Payment.PaymentID, Payment.OrderID, Payment.Payment, Payment.PaymentDate, Payment.PaymentSource, Payment.CheckPaypalNumber, Payment.PaypalTransaction, PaymentSource.Id, PaymentSource.Type FROM Payment INNER JOIN PaymentSource ON Payment.PaymentSource = PaymentSource.Id WHERE (Payment.OrderID = @OrderID)" UpdateCommand="UPDATE [Payment] SET [OrderID] = @OrderID, [Payment] = @Payment, [PaymentDate] = @PaymentDate, [PaymentSource] = @PaymentSource, [CheckPaypalNumber] = @CheckPaypalNumber, [PaypalTransaction] = @PaypalTransaction WHERE [PaymentID] = @original_PaymentID AND [OrderID] = @original_OrderID AND [Payment] = @original_Payment AND [PaymentDate] = @original_PaymentDate AND [PaymentSource] = @original_PaymentSource AND (([CheckPaypalNumber] = @original_CheckPaypalNumber) OR ([CheckPaypalNumber] IS NULL AND @original_CheckPaypalNumber IS NULL)) AND (([PaypalTransaction] = @original_PaypalTransaction) OR ([PaypalTransaction] IS NULL AND @original_PaypalTransaction IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_PaymentID" Type="Int32" />
            <asp:Parameter Name="original_OrderID" Type="Int32" />
            <asp:Parameter Name="original_Payment" Type="Double" />
            <asp:Parameter DbType="Date" Name="original_PaymentDate" />
            <asp:Parameter Name="original_PaymentSource" Type="Int32" />
            <asp:Parameter Name="original_CheckPaypalNumber" Type="String" />
            <asp:Parameter Name="original_PaypalTransaction" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="Payment" Type="Double" />
            <asp:Parameter DbType="Date" Name="PaymentDate" />
            <asp:Parameter Name="PaymentSource" Type="Int32" />
            <asp:Parameter Name="CheckPaypalNumber" Type="String" />
            <asp:Parameter Name="PaypalTransaction" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="OrderDetails" Name="OrderID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="OrderID" Type="Int32" />
            <asp:Parameter Name="Payment" Type="Double" />
            <asp:Parameter DbType="Date" Name="PaymentDate" />
            <asp:Parameter Name="PaymentSource" Type="Int32" />
            <asp:Parameter Name="CheckPaypalNumber" Type="String" />
            <asp:Parameter Name="PaypalTransaction" Type="String" />
            <asp:Parameter Name="original_PaymentID" Type="Int32" />
            <asp:Parameter Name="original_OrderID" Type="Int32" />
            <asp:Parameter Name="original_Payment" Type="Double" />
            <asp:Parameter Name="original_PaymentDate" DbType="Date" />
            <asp:Parameter Name="original_PaymentSource" Type="Int32" />
            <asp:Parameter Name="original_CheckPaypalNumber" Type="String" />
            <asp:Parameter Name="original_PaypalTransaction" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

</asp:Content>

