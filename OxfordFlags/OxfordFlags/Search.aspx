<%@ Page Title="Search" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.vb" Inherits="OxfordFlags.Search" %>


<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    
<html>
<head >
<title></title>
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


</head>
<body>
    <hr />

    <asp:DropDownList ID="SelectSearchType" runat="server" OnSelectedIndexChanged="SelectSearchType_SelectedIndexChanged" AutoPostBack="true">
        <asp:ListItem Value="0">Please Select Search Criteria</asp:ListItem>
        <asp:ListItem Value="1">Buyer</asp:ListItem>
        <asp:ListItem Value="2">Address</asp:ListItem>
    </asp:DropDownList>
    
    <br />
    <br />
    
    <asp:TextBox ID="PersonSearchBox" runat="server" CssClass="form-control" placeholder="Buyer Name"></asp:TextBox>
    <asp:Button ID="PersonSearchButton" runat="server" Text="Search" OnClick = "PersonSearch" HorizontalAlign="Justify"/>
    <asp:TextBox ID="AddressSearchBox" runat="server" CssClass="form-control" placeholder="Address"></asp:TextBox>
    <asp:Button ID="AddressSearchButton" runat="server" Text="Search" OnClick = "AddressSearch" HorizontalAlign="Justify"/>

    <br />
    
    <asp:DetailsView ID="BuyerDetails" runat="server" AutoGenerateRows="False" DataKeyNames="BuyerID" DataSourceID="PersonSearchResultsData" Height="50px" Width="125px" HorizontalAlign="Justify" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="BuyerID" HeaderText="Buyer ID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
            <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="Rotary Member" SortExpression="RotaryMember" />
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" Visible="false"/>
            <asp:BoundField DataField="SubYear" HeaderText="Subscription Year" SortExpression="SubYear" Visible="false"/>
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" Visible="false"/>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="false"/>
            <asp:BoundField DataField="ConfirmationDate" HeaderText="Confirmation Date" SortExpression="ConfirmationDate" Visible="false"/>
            <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" Visible="false"/>
            <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" SortExpression="PaymentDate" Visible="false"/>
            <asp:BoundField DataField="SleeveName" HeaderText="Sleeve Name" SortExpression="SleeveName" Visible="false"/>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Fields>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
    </asp:DetailsView>
    <asp:DetailsView ID="PropertyDetails" runat="server" AutoGenerateColumns="False" DataSourceID="AddressSearchResultsData" HorizontalAlign="Justify" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <EditRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="RotaryMember" SortExpression="RotaryMember" />
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName"/>
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active"/>
            <asp:BoundField DataField="LocationDescription" HeaderText="LocationDescription" SortExpression="LocationDescription"/>
            <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude"/>
            <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude"/>
            <asp:BoundField DataField="InstalledDate" HeaderText="InstalledDate" SortExpression="InstalledDate"/>
            <asp:BoundField DataField="ChangeDate" HeaderText="ChangeDate" SortExpression="ChangeDate"/>
            <asp:BoundField DataField="ExpiredDate" HeaderText="ExpiredDate" SortExpression="ExpiredDate"/>
            <asp:CheckBoxField DataField="Deliver" HeaderText="Deliver" SortExpression="Deliver"/>
            <asp:BoundField DataField="OupsTicketNumber" HeaderText="OupsTicketNumber" SortExpression="OupsTicketNumber"/>
            <asp:BoundField DataField="OupsNotifiedDate" HeaderText="OupsNotifiedDate" SortExpression="OupsNotifiedDate"/>
            <asp:BoundField DataField="OupsCheckedDate" HeaderText="OupsCheckedDate" SortExpression="OupsCheckedDate"/>
        </Fields>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
    </asp:DetailsView>
    
    <br />
    
    <asp:GridView ID="OrderDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="BuyerID" DataSourceID="PersonSearchResultsData" HorizontalAlign="Justify" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:BoundField DataField="BuyerID" HeaderText="Buyer ID" SortExpression="BuyerID" InsertVisible="False" ReadOnly="True" Visible="false"/>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" Visible="false"/>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" Visible="false"/>
            <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress" Visible="false"/>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="false"/>
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="false"/>
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" Visible="false"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="false"/>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" Visible="false"/>
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="Rotary Member" SortExpression="RotaryMember" Visible="false"/>
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
            <asp:BoundField DataField="SubYear" HeaderText="Subscription Year" SortExpression="SubYear" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="ConfirmationDate" HeaderText="Confirmation Date" SortExpression="ConfirmationDate" />
            <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" Visible="false"/>
            <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" SortExpression="PaymentDate" Visible="false"/>
            <asp:BoundField DataField="SleeveName" HeaderText="Sleeve Name" SortExpression="SleeveName" Visible="false"/>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <asp:GridView ID="SleeveOupsDetails" runat="server" AutoGenerateColumns="False" DataSourceID="AddressSearchResultsData" HorizontalAlign="Justify" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName"/>
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName"/>
            <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress"/>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City"/>
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"/>
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email"/>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone"/>
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="RotaryMember" SortExpression="RotaryMember"/>
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
            <asp:BoundField DataField="LocationDescription" HeaderText="LocationDescription" SortExpression="LocationDescription" />
            <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
            <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude" />
            <asp:BoundField DataField="InstalledDate" HeaderText="InstalledDate" SortExpression="InstalledDate" />
            <asp:BoundField DataField="ChangeDate" HeaderText="ChangeDate" SortExpression="ChangeDate" />
            <asp:BoundField DataField="ExpiredDate" HeaderText="ExpiredDate" SortExpression="ExpiredDate" />
            <asp:CheckBoxField DataField="Deliver" HeaderText="Deliver" SortExpression="Deliver" />
            <asp:BoundField DataField="OupsTicketNumber" HeaderText="OupsTicketNumber" SortExpression="OupsTicketNumber" />
            <asp:BoundField DataField="OupsNotifiedDate" HeaderText="OupsNotifiedDate" SortExpression="OupsNotifiedDate" />
            <asp:BoundField DataField="OupsCheckedDate" HeaderText="OupsCheckedDate" SortExpression="OupsCheckedDate" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>

    <br />

    <asp:GridView ID="PaymentSleeveDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="BuyerID" DataSourceID="PersonSearchResultsData" HorizontalAlign="Justify" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3">
        <Columns>
            <asp:BoundField DataField="BuyerID" HeaderText="Buyer ID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" Visible="false"/>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" Visible="false"/>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" Visible="false"/>
            <asp:BoundField DataField="StreetAddress" HeaderText="Street Address" SortExpression="StreetAddress" Visible="false"/>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="false"/>
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="false"/>
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" Visible="false"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="false"/>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" Visible="false"/>
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="Rotary Member" SortExpression="RotaryMember" Visible="false"/>
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" Visible="false"/>
            <asp:BoundField DataField="SubYear" HeaderText="Subscription Year" SortExpression="SubYear" Visible="false"/>
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" Visible="false"/>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="false"/>
            <asp:BoundField DataField="ConfirmationDate" HeaderText="Confirmation Date" SortExpression="ConfirmationDate" Visible="false"/>
            <asp:BoundField DataField="Payment" HeaderText="Payment" SortExpression="Payment" />
            <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" SortExpression="PaymentDate" />
            <asp:BoundField DataField="PaymentSource" HeaderText="Payment Source" SortExpression="PaymentSource" />
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
        </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#007DBB" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#00547E" />
    </asp:GridView>
    <br />
    </body>
</html>

    <asp:HiddenField ID="hfPersonID" runat="server" />
    <asp:HiddenField ID="hfPropertyOwnerId" runat="server" />

    <asp:SqlDataSource ID="AddressSearchResultsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSearchAddressResults" SelectCommandType="StoredProcedure" UpdateCommand="spEditAddressSeacrh" UpdateCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPropertyOwnerId" Name="PROPERTYID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="LASTNAME" Type="String" />
            <asp:Parameter Name="FIRSTNAME" Type="String" />
            <asp:Parameter Name="STREETADDRESS" Type="String" />
            <asp:Parameter Name="CITY" Type="String" />
            <asp:Parameter Name="STATE" Type="String" />
            <asp:Parameter Name="ZIP" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="PHONE" Type="String" />
            <asp:Parameter Name="ROTARYMEMBER" Type="Boolean" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="PersonSearchResultsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSearchBuyerResults" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPersonID" Name="BUYERID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    

    </asp:Content>

