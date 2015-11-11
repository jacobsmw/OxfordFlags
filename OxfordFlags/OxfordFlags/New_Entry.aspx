<%@ Page Title="New Entry" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Entry.aspx.vb" Inherits="OxfordFlags.New_Entry" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent" >

    <h3><%: "Buyer"%></h3>
    <p>
        <asp:Label ID="BuyerFirstNameLabel" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="BuyerFirstName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="BuyerFirstNameValidator" runat="server"
            ControlToValidate="BuyerFirstName"
            ErrorMessage="First name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="BuyerLastNameLabel" runat="server" Text="Last Name"></asp:Label>
        <input id="BuyerLastName" type="text" />
    </p>
    <p>
        <asp:Label ID="BuyerAddressLabel" runat="server" Text="Address"></asp:Label>
        <input id="BuyerAddress" type="text" />
    </p>
    <p>
        <asp:Label ID="BuyerCityLabel" runat="server" Text="City"></asp:Label>
        <input id="BuyerCity" type="text" />
    </p>
    <p>
        <asp:Label ID="BuyerStateLabel" runat="server" Text="State"></asp:Label>
        <input id="BuyerState" type="text">
    </p>
    <p>
        <asp:Label ID="BuyerZipCodeLabel" runat="server" Text="Zip Code"></asp:Label>
        <asp:TextBox ID="BuyerZipCode" runat="server"></asp:TextBox>
<%--        Zip Code 
        <input id="BuyerZip" type="text" /></p>--%>
        <asp:RegularExpressionValidator ID="BuyerZipCodeValidator" runat="server"
            ControlToValidate="BuyerZipCode"
            ErrorMessage="You must enter a valid zip code"
            ForeColor="Red"
            ValidationExpression="[0,9]{5}">
        </asp:RegularExpressionValidator>
    </p>
    <p>Email <input id="BuyerEmail" type="text" /></p>
    <p>Phone <input id="BuyerPhone" type="text" /></p>
    <p>
        <asp:CheckBox ID="BuyerRotaryMember" runat="server" Text="Rotary Member " TextAlign="Left" />
    </p>

    <hr />

    <h4><%: "Order"%></h4>

     <p>
        <asp:Label ID="OrderDate" runat="server" Text="Order Date"></asp:Label>
    </p>
    <p>
        Subscription Year  
    </p>
            <p>
                Order Type</p>
            <p>
                Confirmation Date</p>
            <p>
                Expire Date</p>
    

    <hr />

    <h3><%: "Payment"%></h3>

    <p>Base Price</p>
    <p>Payment Method<asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="PaymentSource" DataTextField="SourceName" DataValueField="SourceName">
        </asp:DropDownList>
        <asp:SqlDataSource ID="PaymentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SourceName] FROM [Source]"></asp:SqlDataSource>

    </p>
       <p>
        Discount
        <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="DiscountName" DataTextField="DiscountReason" DataValueField="DiscountReason">
        </asp:DropDownList>
        <asp:SqlDataSource ID="DiscountName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DiscountReason] FROM [Discount]"></asp:SqlDataSource>
            </p>
            <p>
                Amount Paid
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </p>
     <p>Payment Date<asp:Calendar ID="Calendar1" runat="server"></asp:Calendar></p>
 
    <p>
        First Holiday
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="OccasionName" DataValueField="OccasionName">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OccasionName] FROM [Occasion]"></asp:SqlDataSource>
            </p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    
    <hr />

    <h4><%: "Property"%></h4>   

    <p>
        Property Owner
        First Name
        <input id="Text16" type="text" /></p>
    <p>
        Property Owner Last Name <input id="Text18" type="text" /></p>
    <p>
        Address <input id="Text15" type="text" /></p>
    <p>
        City <input id="Text14" type="text" /></p>
    <p>
        State </p> <%--put in date drop list--%>
    <p>
        Zip Code
        <input id="Text13" type="text" /></p>
    <p>
        Email <input id="Text12" type="text" /></p>
    <p>
        Phone <input id="Text11" type="text" /></p>
    <p>
        Rotary Member<input id="Checkbox1" type="checkbox" /></p>
            <p>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="TraitDescription" DataValueField="TraitDescription">
                </asp:CheckBoxList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TraitDescription] FROM [Traits]"></asp:SqlDataSource>
            </p>
    <p>
        &nbsp;</p>
    
    <hr />

    <h3><%: "Sleeve"%></h3>

    <h4><%--put in date drop list--%></h4>
            
    <p>
        Location Description<input id="Text8" type="text" /></p>
    <p>
        Latitude
        <input id="Text9" type="text" /></p>
    <p>
        Longitude
        <input id="Text10" type="text" /></p>
    <p>
        OUPS Notified 
        </p>
            <p>
                OUPS Ticket Number</p> <%--put in date drop list--%>
    <p>
        OUPS Checked 
        </p>
            <p>
                Photo</p>
            <p>
                Install Date</p>
            <p>
                Change Date</p>
            <p>
                Public</p>
            <p>
                Deliver</p>
            <p>
                &nbsp;</p>
    <p>
                <input id="Submit1" type="submit" value="submit" /></p> <%--put in date drop list--%>
    </div>
    </div>
    </div>
</asp:Content>
