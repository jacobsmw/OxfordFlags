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
        <asp:RegularExpressionValidator ID="BuyerFirstNameFormatValidator" runat="server"
            ControlToValidate="BuyerFirstName"
            ErrorMessage="You must enter a valid first name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerLastNameLabel" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="BuyerLastName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="BuyerLastNameEnteredValidator" runat="server"
            ControlToValidate="BuyerLastName"
            ErrorMessage="Last Name is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="BuyerLastNameFormatValidator" runat="server"
            ControlToValidate="BuyerLastName"
            ErrorMessage="You must enter a valid last name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerAddressLabel" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="BuyerAddress" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerAddressFormatValidator" runat="server"
            ControlToValidate="BuyerAddress"
            ErrorMessage="You must enter a valid address."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerCityLabel" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="BuyerCity" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerCityFormatValidator" runat="server"
            ControlToValidate="BuyerCity"
            ErrorMessage="You must enter a valid city."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerStateLabel" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="BuyerState" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerStateFormatValidator" runat="server"
            ControlToValidate="BuyerState"
            ErrorMessage="You must enter a valid state abreviation"
            ForeColor="Red"
            ValidationExpression="[a-zA-Z]{2}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerZipCodeLabel" runat="server" Text="Zip Code"></asp:Label>
        <asp:TextBox ID="BuyerZipCode" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerZipCodeFormatValidator" runat="server"
            ControlToValidate="BuyerZipCode"
            ErrorMessage="You must enter a valid zip code"
            ForeColor="Red"
            ValidationExpression="[0-9]{5}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerEmailLabel" runat="server" Text="Email"></asp:Label>
        <asp:TextBox ID="BuyerEmail" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerEmailFormatValidator" runat="server"  
            ControlToValidate="BuyerEmail" 
            ErrorMessage="You must enter a valid email."
            ForeColor="Red"
            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="BuyerPhoneLabel" runat="server" Text="Phone"></asp:Label>
        <asp:TextBox ID="BuyerPhone" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="BuyerPhoneFormatValidator" runat="server"
            ControlToValidate="BuyerPhone"
            ErrorMessage="You must enter a valid phone number"
            ForeColor="Red"
            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
        </asp:RegularExpressionValidator>
    <p>
        <asp:CheckBox ID="BuyerRotaryMember" runat="server" Text="Rotary Member" TextAlign="Left" />
    </p>

    <hr />
    <h3><%: "Order"%></h3>
    <p>
        <asp:Label ID="OrderDateLabel" runat="server" Text="Order Date"></asp:Label>
        <asp:TextBox ID="OrderDate" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="OrderDateEnteredValidator" runat="server"
            ControlToValidate="OrderDate"
            ErrorMessage="Order date is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="OrderDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="OrderDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="OrderSource" runat="server" Text="Order Source"></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="OrderSourceList" DataTextField="SourceName" DataValueField="SourceName">
        </asp:DropDownList>
        <asp:SqlDataSource ID="OrderSourceList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SourceName] FROM [Source]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Label ID="SubscriptionYearLabel" runat="server" Text="Subscription Year"></asp:Label>
        <asp:TextBox ID="SubscriptionYear" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="SubscriptionYearEnteredValidator" runat="server"
            ControlToValidate="SubscriptionYear"
            ErrorMessage="Subscription year is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Label ID="OrderTypeLabel" runat="server" Text="Order Type"></asp:Label>
        <asp:DropDownList ID="OrderType" runat="server">
            <asp:ListItem>New</asp:ListItem>
            <asp:ListItem>Renew</asp:ListItem>
            <asp:ListItem>Increase</asp:ListItem>
            <asp:ListItem>Decrease</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:Label ID="ConfirmationDateLabel" runat="server" Text="Confirmation Date"></asp:Label>
        <asp:TextBox ID="ConfirmationDate" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="ConfirmationDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="ConfirmationDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="ExpireDateLabel" runat="server" Text="Expire Date"></asp:Label>
        <asp:TextBox ID="ExpireDate" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="ExpireDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="ExpireDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    </p>

    <hr />
    <h3><%: "Payment"%></h3>
    <p>
        <asp:Label ID="BasePriceLabel" runat="server" Text="Base Price"></asp:Label>
        <asp:TextBox ID="BasePrice" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="BasePriceEnteredValidator" runat="server"
            ControlToValidate="BasePrice"
            ErrorMessage="Base price is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="BasePriceFormatValidator" runat="server"  
            ControlToValidate="BasePrice" 
            ErrorMessage="You must enter a valid price."
            ForeColor="Red"
            ValidationExpression="^\d+(\.\d\d)?$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PaymentMethodLabel" runat="server" Text="Payment Method"></asp:Label>
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
        <asp:RequiredFieldValidator id="AmountPaidEnteredValidator" runat="server"
            ControlToValidate="AmountPaid"
            ErrorMessage="Amount paid is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="AmountPaidFormatValidator" runat="server"  
            ControlToValidate="AmountPaid" 
            ErrorMessage="You must enter a valid price."
            ForeColor="Red"
            ValidationExpression="^\d+(\.\d\d)?$">
        </asp:RegularExpressionValidator>
     </p>
     <p>
        <asp:Label ID="PaymentDateLabel" runat="server" Text="Payment Date"></asp:Label>
        <asp:TextBox ID="PaymentDate" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator id="PaymentDateEnteredValidator" runat="server"
            ControlToValidate="PaymentDate"
            ErrorMessage="Payment date is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="PaymentDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="PaymentDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    <p>
        <asp:Label ID="FirstHolidayLabel" runat="server" Text="First Holiday"></asp:Label>
        <asp:DropDownList ID="FirstHoliday" runat="server" DataSourceID="HolidayName" DataTextField="OccasionName" DataValueField="OccasionName"></asp:DropDownList>
        <asp:SqlDataSource ID="HolidayName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OccasionName] FROM [Occasion]"></asp:SqlDataSource>
    </p>
    
    <hr />
    <h3><%: "Property"%></h3>   
    <p>
        <asp:Label ID="PropertyFirstNameLabel" runat="server" Text="Property Owner First Name"></asp:Label>
        <asp:TextBox ID="PropertyFirstName" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="PropertyFirstNameFormatValidator" runat="server"
            ControlToValidate="PropertyFirstName"
            ErrorMessage="You must enter a valid first name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PropertyLastNameLabel" runat="server" Text="Property Owner Last Name"></asp:Label>
        <asp:TextBox ID="PropertyLastName" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="PropertyLastNameFormatValidator" runat="server"
            ControlToValidate="PropertyLastName"
            ErrorMessage="You must enter a valid last name."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PropertyAddressLabel" runat="server" Text="Address"></asp:Label>
        <asp:TextBox ID="PropertyAddress" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyAddressEnteredValidator" runat="server"
            ControlToValidate="PropertyAddress"
            ErrorMessage="Address is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="PropertyAddressFormatValidator" runat="server"
            ControlToValidate="PropertyAddress"
            ErrorMessage="You must enter a valid address."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PropertyCityLabel" runat="server" Text="City"></asp:Label>
        <asp:TextBox ID="PropertyCity" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyCityEnteredValidator" runat="server"
            ControlToValidate="PropertyCity"
            ErrorMessage="City is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="PropertyCityFormatValidator" runat="server"
            ControlToValidate="PropertyCity"
            ErrorMessage="You must enter a valid city."
            ForeColor="Red"
            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="ProprtyStateLabel" runat="server" Text="State"></asp:Label>
        <asp:TextBox ID="PropertyState" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="PropertyStateEnteredValidator" runat="server"
            ControlToValidate="PropertyState"
            ErrorMessage="State is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="PropertyStateFormatValidator" runat="server"
            ControlToValidate="PropertyState"
            ErrorMessage="You must enter a valid state abreviation"
            ForeColor="Red"
            ValidationExpression="[a-zA-Z]{2}">
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
        <asp:RegularExpressionValidator ID="PropertyEmailFormatValidator" runat="server" 
            ControlToValidate="PropertyEmail" 
            ErrorMessage="You must enter a valid email."
            ForeColor="Red"
            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="PropertyPhoneLabel" runat="server" Text="Phone"></asp:Label>
        <asp:TextBox ID="PropertyPhone" runat="server"></asp:TextBox>
        <asp:RegularExpressionValidator ID="PropertyPhoneFormatValidator" runat="server"
            ControlToValidate="PropertyPhone"
            ErrorMessage="You must enter a valid phone number"
            ForeColor="Red"
            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:CheckBox ID="PropertyRotaryMember" runat="server" Text="Rotary Member" TextAlign="Left" />
    </p>
    <p>
        <asp:Label ID="PropertyTraitsLabel" runat="server" Text="Property Traits"></asp:Label>
        <asp:CheckBoxList ID="PropertyTraits" runat="server" DataSourceID="Traits" DataTextField="TraitDescription" DataValueField="TraitDescription"></asp:CheckBoxList>
        <asp:SqlDataSource ID="Traits" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TraitDescription] FROM [Traits]"></asp:SqlDataSource>
    </p>
    
    <hr />
    <h3><%: "Sleeve"%></h3>      
    <p>
        <asp:Label ID="LocationDescriptionLabel" runat="server" Text="Location Description"></asp:Label>
        </p>
        <p>
        <asp:TextBox ID="LocationDescription" runat="server" Height="89px" Width="864px"></asp:TextBox>
    </p>
    <p>
        <asp:Label ID="SleevePhoto" runat="server" Text="Photo"></asp:Label>
        <%-- How are we Handeling this? --%>
    </p>
    <p>
        <asp:Label ID="LatitudeLabel" runat="server" Text="Latitude"></asp:Label>
        <asp:TextBox ID="Latitude" runat="server" EnableTheming="False"></asp:TextBox>
        <asp:RequiredFieldValidator id="LatitudeEnteredValidator" runat="server"
            ControlToValidate="Latitude"
            ErrorMessage="Latitude is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="LatitudeFormatValidator" runat="server" 
            ControlToValidate="Latitude" 
            ErrorMessage="You must enter a valid latitude."
            ForeColor="Red"
            ValidationExpression="^\d{0,8}(.\d{0,6})?$">
        </asp:RegularExpressionValidator>
    <p>
        <asp:Label ID="LongitudeLabel" runat="server" Text="Longitude"></asp:Label>
        <asp:TextBox ID="Longitude" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="LongitudeEnteredValidator" runat="server"
            ControlToValidate="Longitude"
            ErrorMessage="Longitude is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="LongitudeFormatValidator" runat="server"  
            ControlToValidate="Longitude" 
            ErrorMessage="You must enter a valid longitude."
            ForeColor="Red"
            ValidationExpression="^\d{0,8}(.\d{0,6})?$">
        </asp:RegularExpressionValidator>
    <p>
        <asp:Label ID="OUPSNotifiedDateLabel" runat="server" Text="OUPS Notified Date"></asp:Label>
        <asp:TextBox ID="OUPSNotifiedDate" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="OUPSNotifiedDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="OUPSNotifiedDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="OUPSTicketNumberLabel" runat="server" Text="OUPS Ticket Number"></asp:Label>
        <asp:TextBox ID="OUPSTicketNumber" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator id="OUPSTicketNumberEnteredValidator" runat="server"
            ControlToValidate="OUPSTicketNumber"
            ErrorMessage="OUPS ticket number is a required field."
            ForeColor="Red">
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="OUPSTicketNumberFormatValidator" runat="server"
            ControlToValidate="OUPSTicketNumber"
            ErrorMessage="You must enter a valid ticket number"
            ForeColor="Red"
            ValidationExpression="[a-zA-Z0-9]{0,20}">
        </asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="OUPSCheckedDateLabel" runat="server" Text="OUPS Checked Date"></asp:Label>
        <asp:TextBox ID="OUPSCheckedDate" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="OUPSCheckedDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="OUPSCheckedDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="InstallDateLabel" runat="server" Text="Install Date"></asp:Label>
        <asp:TextBox ID="InstallDate" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="InstallDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="InstallDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    </p>
    <p>
        <asp:Label ID="ChangeDateLabel" runat="server" Text="Change Date"></asp:Label>
        <asp:TextBox ID="ChangeDate" runat="server"></asp:TextBox>
        <asp:CompareValidator ID="ChangeDateFormatValidator" runat="server"
            Type="Date"
            Operator="DataTypeCheck"
            ControlToValidate="ChangeDate"
            ErrorMessage="You must enter a valid date."
            ForeColor="Red">
        </asp:CompareValidator>
    </p>
    <p>
        <asp:CheckBox ID="PublicFlag" runat="server" Text="Public" TextAlign="Left" />
    </p>
    <p>
        <asp:CheckBox ID="DeliverEarly" runat="server" Text="Deliver Early" TextAlign="Left" />
    </p>
   
    
     <input id="Submit1" type="submit" value="Submit" />
    <p>&nbsp;</p>
    <p>
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Buyer]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" Text="Submit" />
    </p>
    
</asp:Content>
