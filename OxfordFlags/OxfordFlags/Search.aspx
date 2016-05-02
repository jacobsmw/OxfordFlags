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
    
    <asp:TextBox ID="PersonSearchBox" runat="server"></asp:TextBox>
    <asp:Button ID="PersonSearchButton" runat="server" Text="Search" OnClick = "PersonSearch" />

    <asp:TextBox ID="AddressSearchBox" runat="server"></asp:TextBox>
    <asp:Button ID="AddressSearchButton" runat="server" Text="Search" OnClick = "AddressSearch" />




    <br />
    <br />
    
    <asp:DetailsView ID="BuyerDetails" runat="server" AutoGenerateRows="False" DataKeyNames="BuyerID" DataSourceID="PersonSearchResultsData" Height="50px" Width="125px" HorizontalAlign="Justify">
        <Fields>
            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="RotaryMember" SortExpression="RotaryMember" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" Visible="false" />
            <asp:BoundField DataField="SubYear" HeaderText="SubYear" SortExpression="SubYear" Visible="false" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" Visible="false"/>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="false"/>
            <asp:BoundField DataField="ConfirmationDate" HeaderText="ConfirmationDate" SortExpression="ConfirmationDate" Visible="false"/>
            <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" Visible="false"/>
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName" Visible="false"/>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" ShowDeleteButton="True" />
        </Fields>
    </asp:DetailsView>
    
    <asp:DetailsView ID="PropertyDetails" runat="server" AutoGenerateColumns="False" DataSourceID="AddressSearchResultsData" HorizontalAlign="Justify" AutoGenerateRows="False">
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
            <asp:BoundField DataField="TraitDescription" HeaderText="TraitDescription" SortExpression="TraitDescription"/>
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName" />
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
    </asp:DetailsView>
    <br />
    <asp:GridView ID="OrderDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="BuyerID" DataSourceID="PersonSearchResultsData" HorizontalAlign="Justify">
        <Columns>
            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" SortExpression="BuyerID" InsertVisible="False" ReadOnly="True" Visible="false"/>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" Visible="false"/>
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" Visible="false"/>
            <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" Visible="false"/>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="false"/>
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="false"/>
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" Visible="false"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="false"/>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" Visible="false"/>
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="RotaryMember" SortExpression="RotaryMember" Visible="false"/>
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
            <asp:BoundField DataField="SubYear" HeaderText="SubYear" SortExpression="SubYear" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="ConfirmationDate" HeaderText="ConfirmationDate" SortExpression="ConfirmationDate" />
            <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" Visible="false"/>
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName" Visible="false"/>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:GridView ID="SleeveOupsDetails" runat="server" AutoGenerateColumns="False" DataSourceID="AddressSearchResultsData" HorizontalAlign="Justify">
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
            <asp:BoundField DataField="TraitDescription" HeaderText="TraitDescription" SortExpression="TraitDescription" />
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
    </asp:GridView>

            <br />
    <asp:GridView ID="PaymentSleeveDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="BuyerID" DataSourceID="PersonSearchResultsData" HorizontalAlign="Justify">
        <Columns>
            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" Visible="false"/>
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" Visible="false"/>
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" Visible="false"/>
            <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" Visible="false"/>
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" Visible="false"/>
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" Visible="false"/>
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" Visible="false"/>
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="false"/>
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" Visible="false"/>
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="RotaryMember" SortExpression="RotaryMember" Visible="false"/>
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" Visible="false"/>
            <asp:BoundField DataField="SubYear" HeaderText="SubYear" SortExpression="SubYear" Visible="false"/>
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" Visible="false"/>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" Visible="false"/>
            <asp:BoundField DataField="ConfirmationDate" HeaderText="ConfirmationDate" SortExpression="ConfirmationDate" Visible="false"/>
            <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" />
            <asp:BoundField DataField="SleeveName" HeaderText="SleeveName" SortExpression="SleeveName" />
            <asp:CommandField ShowEditButton="True" ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <br />
    </body>
</html>

    <asp:HiddenField ID="hfPersonID" runat="server" />
    <asp:HiddenField ID="hfPropertyOwnerId" runat="server" />

    <asp:SqlDataSource ID="AddressSearchResultsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSearchAddressResults" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPropertyOwnerId" Name="PROPERTYID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="PersonSearchResultsData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSearchResultsBuyer" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="hfPropertyOwnerId" Name="PROPERTYID" PropertyName="Value" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    

    </asp:Content>

