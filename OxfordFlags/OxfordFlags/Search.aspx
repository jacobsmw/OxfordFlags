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
        $("#<%=PersonSearch.ClientID%>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetPerson")%>',
                    data: "{ 'prefix': '" + request.term + "'}",
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
            $("#<%=OupsSearch.ClientID%>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetOups")%>',
                    data: "{ 'prefix': '" + request.term + "'}",
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
                $("#<%=hfOupsID.ClientID%>").val(i.item.val);
            },
            minLength: 1
        });
    });
</script>


</head>
<body>
    <hr />
    
    <asp:DropDownList ID="SearchTypeSelection" runat="server">
        <asp:ListItem Value="0">Property Owner</asp:ListItem>
        <asp:ListItem Value="1">Buyer</asp:ListItem>
        <asp:ListItem Value="2">OUPS Ticket Number</asp:ListItem>
        <asp:ListItem Value="3">Address</asp:ListItem>
    </asp:DropDownList>
    
    <br />
    
    <asp:TextBox ID="PersonSearch" runat="server"></asp:TextBox>
    <asp:HiddenField ID="hfPersonID" runat="server" />
    <asp:Button ID="PersonSearchButton" runat="server" Text="Search Person" OnClick = "SearchPerson" />

    <br />

    <asp:TextBox ID="OupsSearch" runat="server"></asp:TextBox>
    <asp:HiddenField ID="hfOupsID" runat="server" />
    <asp:Button ID="OupsSearchButton" runat="server" Text="Search OUPS Ticket" OnClick = "SearchOups" />


</body>
</html>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Not Clicked"></asp:Label>
    <br />
    <br />
    
    <asp:DetailsView ID="PersonResult" runat="server" AutoGenerateRows="False" DataKeyNames="BuyerID" DataSourceID="PersonDataSource" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" Visible="False" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="StreetAddress" HeaderText="StreetAddress" SortExpression="StreetAddress" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
            <asp:BoundField DataField="BillType" HeaderText="BillType" SortExpression="BillType" />
            <asp:CheckBoxField DataField="RotaryMember" HeaderText="RotaryMember" SortExpression="RotaryMember" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:DetailsView ID="OupsResult" runat="server" AutoGenerateRows="False" DataKeyNames="OupsID,SleeveID" DataSourceID="OupsDataSource" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="OupsID" HeaderText="OupsID" InsertVisible="False" ReadOnly="True" SortExpression="OupsID" />
            <asp:BoundField DataField="OupsTicketNumber" HeaderText="OupsTicketNumber" SortExpression="OupsTicketNumber" />
            <asp:BoundField DataField="OupsNotifiedDate" HeaderText="OupsNotifiedDate" SortExpression="OupsNotifiedDate" />
            <asp:BoundField DataField="OupsCheckedDate" HeaderText="OupsCheckedDate" SortExpression="OupsCheckedDate" />
            <asp:BoundField DataField="SleeveID" HeaderText="SleeveID" InsertVisible="False" ReadOnly="True" SortExpression="SleeveID" />
            <asp:CheckBoxField DataField="Active" HeaderText="Active" SortExpression="Active" />
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" SortExpression="OrderID" />
            <asp:BoundField DataField="PropertyOwnerID" HeaderText="PropertyOwnerID" SortExpression="PropertyOwnerID" />
            <asp:BoundField DataField="LocationDescription" HeaderText="LocationDescription" SortExpression="LocationDescription" />
            <asp:BoundField DataField="Latitude" HeaderText="Latitude" SortExpression="Latitude" />
            <asp:BoundField DataField="Longitude" HeaderText="Longitude" SortExpression="Longitude" />
            <asp:BoundField DataField="OupsID1" HeaderText="OupsID1" SortExpression="OupsID1" />
            <asp:BoundField DataField="InstalledDate" HeaderText="InstalledDate" SortExpression="InstalledDate" />
            <asp:BoundField DataField="ChangeDate" HeaderText="ChangeDate" SortExpression="ChangeDate" />
            <asp:CheckBoxField DataField="Public" HeaderText="Public" SortExpression="Public" />
            <asp:CheckBoxField DataField="Deliver" HeaderText="Deliver" SortExpression="Deliver" />
            <asp:BoundField DataField="ExpiredDate" HeaderText="ExpiredDate" SortExpression="ExpiredDate" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="PersonDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buyer]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="OupsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Oups], [Sleeve]"></asp:SqlDataSource>
    </asp:Content>

