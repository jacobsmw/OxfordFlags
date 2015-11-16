<%@ Page Title="New Entry" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Entry.aspx.vb" Inherits="OxfordFlags.New_Entry" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent" >

    <h3><%: "Buyer"%></h3>
    <p>
        <asp:Label ID="BuyerFirstNameLabel" runat="server" Text="First Name"></asp:Label>
        <asp:TextBox ID="BuyerFirstName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="BuyerFirstNameEnteredValidator" runat="server"
            ControlToValidate="BuyerFirstName"
            ErrorMessage="First Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="BuyerLastNameLabel" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="BuyerLastName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="BuyerLastNameEnteredValidator" runat="server"
            ControlToValidate="BuyerLastName"
            ErrorMessage="Last Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="BuyerAddressLabel" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="BuyerAddress" runat="server"></asp:TextBox>
<%-- Is this needed? --%>
        <asp:RequiredFieldValidator id="BuyerAddressEnteredValidator" runat="server"
            ControlToValidate="BuyerAddress"
            ErrorMessage="Address is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="BuyerCityLabel" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="BuyerCity" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="BuyerStateLabel" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="BuyerState" runat="server"></asp:TextBox>
<%-- Is this needed? --%>
        <asp:RegularExpressionValidator ID="BuyerStateEnteredValidator" runat="server"
            ControlToValidate="BuyerState"
            ErrorMessage="You must enter a valid state abreviation"
            ForeColor="Red"
            ValidationExpression="[a,zA,Z]{2}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerZipCodeLabel" runat="server" Text="Zip Code"></asp:Label>
        <asp:TextBox ID="BuyerZipCode" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerZipCodeFormatValidator" runat="server"
            ControlToValidate="BuyerZipCode"
            ErrorMessage="You must enter a valid zip code"
            ForeColor="Red"
            ValidationExpression="[0,9]{5}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerEmailLabel" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="BuyerEmail" runat="server"></asp:TextBox>
<%-- Some form of validation based off email addresses --%>
    </p>
    <p>
        <asp:Label ID="BuyerPhoneLabel" runat="server" Text="Phone"></asp:Label>
        <asp:TextBox ID="BuyerPhone" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerPhoneFormatValidator" runat="server"
            ControlToValidate="BuyerPhone"
            ErrorMessage="You must enter a valid phone number"
            ForeColor="Red"
            ValidationExpression="[0,9]{9,10}">
        </asp:RegularExpressionValidator>
    <p>
        <asp:CheckBox ID="BuyerRotaryMember" runat="server" Text="Rotary Member " TextAlign="Left" />
    </p>

    <hr />
    <h3><%: "Order"%></h3>

    <p>
        <asp:Label ID="OrderDateLabel" runat="server" Text="Order Date"></asp:Label>
<%-- Put in text box for date type and add validation --%>
    </p>
    <p>
        <asp:Label ID="SubscriptionYearLabel" runat="server" Text="Subscription Year"></asp:Label>
<%-- Still need to figure out how to do this --%>
    </p>
    <p>
        <asp:Label ID="OrderTypeLabel" runat="server" Text="Order Type"></asp:Label>
<%-- this will be a linked drop box from a table --%>
    </p>
    <p>
        <asp:Label ID="ConfirmationDateLabel" runat="server" Text="Confirmation Date"></asp:Label>
<%-- Put in text box for date type and add validation --%>
    </p>
    <p>
        <asp:Label ID="ExpireDateLabel" runat="server" Text="Expire Date"></asp:Label>
<%-- Put in text box for date type and add validation --%>
    </p>

    <hr />
    <h3><%: "Payment"%></h3>

    <p>
        <asp:Label ID="BasePriceLabel" runat="server" Text="Base Price"></asp:Label>
        <asp:TextBox ID="BasePrice" runat="server"></asp:TextBox>
<%-- Some form of validation to make it a price --%>
    </p>
    <p>Payment Method
        <asp:Label ID="PaymentMethodLabel" runat="server" Text="PaymentMethod"></asp:Label>
        <asp:DropDownList ID="PaymentMethod" runat="server" DataSourceID="PaymentSource" DataTextField="SourceName" DataValueField="SourceName"></asp:DropDownList>
        <asp:SqlDataSource ID="PaymentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SourceName] FROM [Source]"></asp:SqlDataSource>

    </p>
    <p>
        <asp:Label ID="DiscountLabel" runat="server" Text="Discount"></asp:Label>
        <asp:DropDownList ID="Discount" runat="server" DataSourceID="DiscountName" DataTextField="DiscountReason" DataValueField="DiscountReason"></asp:DropDownList>
        <asp:SqlDataSource ID="DiscountName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DiscountReason] FROM [Discount]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="AmountPaidLabel" runat="server" Text="Amount Paid"></asp:Label>
        <asp:TextBox ID="AmountPaid" runat="server"></asp:TextBox>
<%-- Some form of validation to make it a price --%>
     </p>
     <p>
        <asp:Label ID="PaymentDateLabel" runat="server" Text="Payment Date"></asp:Label>
        <asp:TextBox ID="PaymentDate" runat="server"></asp:TextBox>
<%-- Some form of validation to make it a date --%>
    <p>
        First Holiday
        <asp:Label ID="FirstHolidayLabel" runat="server" Text="First Holiday"></asp:Label>
        <asp:DropDownList ID="FirstHoliday" runat="server" DataSourceID="HolidayName" DataTextField="OccasionName" DataValueField="OccasionName"></asp:DropDownList>
        <asp:SqlDataSource ID="HolidayName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OccasionName] FROM [Occasion]"></asp:SqlDataSource>
    </p>
    <%--What is this?--%>
    <p>
        &nbsp;
    </p>
    <p>
        &nbsp;
    </p>
    
    <hr />
    <h3><%: "Property"%></h3>   

    <p>
        <asp:Label ID="PropertyFirstNameLabel" runat="server" Text="Property Owner First Name"></asp:Label>
        <asp:TextBox ID="PropertyFirstName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyFirstNameEnteredValidator" runat="server"
            ControlToValidate="PropertyFirstName"
            ErrorMessage="First Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="PropertyLastNameLabel" runat="server" Text="Property Owner Last Name"></asp:Label>
        <asp:TextBox ID="PropertyFirstName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyFirstNameEnteredValidator" runat="server"
            ControlToValidate="PropertyFirstName"
            ErrorMessage="First Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="PropertyAddressLabel" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="PropertyAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyAddressEnteredValidator" runat="server"
            ControlToValidate="PropertyAddress"
            ErrorMessage="Address is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="PropertyCityLabel" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="PropertyCity" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="ProprtyStateLabel" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="PropertState" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyStateEnteredValidator" runat="server"
            ControlToValidate="PropertyState"
            ErrorMessage="State is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="PropertyStateFormatValidator" runat="server"
            ControlToValidate="PropertyState"
            ErrorMessage="You must enter a valid state abreviation"
            ForeColor="Red"
            ValidationExpression="[a,zA,Z]{2}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PropertyZipCodeLabel" runat="server" Text="Zip Code"></asp:Label>
        <asp:TextBox ID="PropertyZipCode" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyZipCodeEnteredValidator" runat="server"
            ControlToValidate="PropertyZipCode"
            ErrorMessage="Zip Code is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="PropertyZipCodeFormatValidator" runat="server"
            ControlToValidate="PropertyZipCode"
            ErrorMessage="You must enter a valid zip code"
            ForeColor="Red"
            ValidationExpression="[0,9]{5}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PropertyEmailLabel" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="PropertyEmail" runat="server"></asp:TextBox>
<%-- Is this a required field --%>
<%-- Some form of validation based off email addresses --%> 
    </p>
    <p>
        <asp:Label ID="PropertyPhoneLabel" runat="server" Text="Phone"></asp:Label>
        <asp:TextBox ID="PropertyPhone" runat="server"></asp:TextBox>
<%-- Is this a required field --%>
        <asp:RegularExpressionValidator ID="PropertyPhoneFormatValidator" runat="server"
            ControlToValidate="PropertyPhone"
            ErrorMessage="You must enter a valid phone number"
            ForeColor="Red"
            ValidationExpression="[0,9]{9,10}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PropertyRotaryMemberLabel" runat="server" Text="Rotary Member"></asp:Label>
        <input id="Checkbox1" type="checkbox" />
    </p>
    <p>
        <asp:Label ID="PropertyTraitsLabel" runat="server" Text="Property Traits"></asp:Label>
        <asp:CheckBoxList ID="PropertyTraits" runat="server" DataSourceID="Traits" DataTextField="TraitDescription" DataValueField="TraitDescription"></asp:CheckBoxList>
        <asp:SqlDataSource ID="Traits" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TraitDescription] FROM [Traits]"></asp:SqlDataSource>
    </p>
<%--What is this?--%>
    <p>
        &nbsp;
    </p>
    
    <hr />
    <h3><%: "Sleeve"%></h3>
            
    <p>
        <asp:Label ID="LocationDescriptionLabel" runat="server" Text="Location Description"></asp:Label>
<%-- Large text box and size limitation validator needed --%>
    </p>
    <p>
        <asp:Label ID="LatitudeLabel" runat="server" Text="Latitude"></asp:Label>
        <asp:TextBox ID="Latitude" runat="server"></asp:TextBox>
<%-- Lattitude limitation validator needed --%>
    <p>
        <asp:Label ID="LongitudeLabel" runat="server" Text="Longitude"></asp:Label>
        <asp:TextBox ID="Longitude" runat="server"></asp:TextBox>
<%-- Longitude limitation validator needed --%>
    <p>
        <asp:Label ID="OUPSNotifiedLabel" runat="server" Text="OUPS Notified Date"></asp:Label>
<%-- Put in text box for date type and add validation --%>
    </p>
    <p>
        <asp:Label ID="OUPSTicketNumberLabel" runat="server" Text="OUPS Ticket Number"></asp:Label>
        <asp:TextBox ID="OUPSTicketNumber" runat="server"></asp:TextBox>
<%-- size limitation validator needed --%>
    </p>
    <p>
        <asp:Label ID="OUPSCheckedLabel" runat="server" Text="OUPS Checked Date"></asp:Label>
<%-- Put in text box for date type and add validation --%>
    </p>
    <p>
        <asp:Label ID="OUPSTicketNumberLabel" runat="server" Text="OUPS Ticket Number"></asp:Label>
<%-- input type unclear so i'm not sure what to do here --%>
    </p>
    <p>
        <asp:Label ID="InstallDateLabel" runat="server" Text="Install Date"></asp:Label>
<%-- Put in text box for date type and add validation --%>
    </p>
    <p>
    <asp:Label ID="ChangeDateLabel" runat="server" Text="Change Date"></asp:Label>
<%-- Put in text box for date type and add validation --%>
    </p>
    <p>
        <asp:Label ID="PublicLabel" runat="server" Text="Public"></asp:Label>
<%-- checkbox needed --%>
    </p>
    <p>
        <asp:Label ID="DeliverLabel" runat="server" Text="Deliver"></asp:Label>
<%-- checkbox needed --%>
    </p>
<%-- What is this? --%>
    <p>
        &nbsp;
    </p>
    <p>
        <input id="SubmitForm" type="submit" value="submit" />
    </p> 
</asp:Content>
