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
        $("#<%=txtSearch.ClientID %>").autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: '<%=ResolveUrl("~/Service.asmx/GetCustomers") %>',
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
                $("#<%=hfCustomerId.ClientID %>").val(i.item.val);
            },
            minLength: 1
        });
    });
</script>
</head>
<body>
    <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
    <asp:HiddenField ID="hfCustomerId" runat="server" />
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick = "Submit" />
</body>
</html>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Not Clicked"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BuyerID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" />
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
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buyer]"></asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="BuyerID" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="BuyerID" HeaderText="BuyerID" InsertVisible="False" ReadOnly="True" SortExpression="BuyerID" />
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
</asp:Content>

