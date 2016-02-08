<%@ Page Title="Edit Entry" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Edit_Entry.aspx.vb" Inherits="OxfordFlags.New_Entry" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

<ul class="nav nav-tabs">
        <li class="active"><a data-toggle="tab" href="#BuyerInfo">Buyer</a></li>
        <li><a data-toggle="tab" href="#OrderInfo">Order</a></li>
        <li><a data-toggle="tab" href="#PropertyOwnerInfo">Property Owner</a></li>
        <li><a data-toggle="tab" href="#SleeveInfo">Sleeve</a></li>
        <li><a data-toggle="tab" href="#PaymentInfo">Payment</a></li>
    </ul>

     <div class="tab-content">
        <div id="BuyerInfo" class="tab-pane fade in active">
            <h3><%: "Sleeve"%></h3>

            <p>
                <asp:Label ID="BuyerFirstNameLabel" runat="server" Text="First Name"></asp:Label>
                <asp:TextBox ID="BuyerFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BuyerFirstNameEnteredValidator" runat="server"
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
                <asp:RequiredFieldValidator ID="BuyerLastNameEnteredValidator" runat="server"
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
        </div>
        
        <div id="OrderInfo" class="tab-pane fade">
            <h3><%: "Payment"%></h3>
            <p>
                <asp:Label ID="OrderDateLabel" runat="server" Text="Order Date"></asp:Label>
                <asp:TextBox ID="OrderDate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="OrderDateEnteredValidator" runat="server"
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
                <asp:DropDownList ID="OrderSourceDropDownList" runat="server" DataSourceID="OrderSourceList" DataTextField="SourceName" DataValueField="SourceID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="OrderSourceList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SourceName], [SourceID] FROM [Source]"></asp:SqlDataSource>
            </p>
            <p>
                <asp:Label ID="SubscriptionYearLabel" runat="server" Text="Subscription Year"></asp:Label>
                <asp:TextBox ID="OrderSubscriptionYear" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="SubscriptionYearEnteredValidator" runat="server"
                    ControlToValidate="OrderSubscriptionYear"
                    ErrorMessage="Subscription year is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="SubscriptionYearFormatValidator" runat="server"
                    ControlToValidate="OrderSubscriptionYear"
                    ErrorMessage="You must enter a valid year."
                    ForeColor="Red"
                    ValidationExpression="^[0-9]{4}$">
                </asp:RegularExpressionValidator>
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
                <asp:TextBox ID="OrderConfirmationDate" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="ConfirmationDateFormatValidator" runat="server"
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="OrderConfirmationDate"
                    ErrorMessage="You must enter a valid date."
                    ForeColor="Red">
                </asp:CompareValidator>
            </p>
            <p>
                <asp:Label ID="ExpireDateLabel" runat="server" Text="Expire Date"></asp:Label>
                <asp:TextBox ID="OrderExpireDate" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="ExpireDateFormatValidator" runat="server"
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="OrderExpireDate"
                    ErrorMessage="You must enter a valid date."
                    ForeColor="Red">
                </asp:CompareValidator>
            </p>
        </div>
        
        <div id="PropertyOwnerInfo" class="tab-pane fade">
            <h3><%: "Property Owner"%></h3>
           
            <p>
                <asp:Label ID="PropertyFirstNameLabel" runat="server" Text="Property Owner First Name"></asp:Label>
                <asp:TextBox ID="PropertyOwnerFirstName" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="PropertyFirstNameFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerFirstName"
                    ErrorMessage="You must enter a valid first name."
                    ForeColor="Red"
                    ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="PropertyLastNameLabel" runat="server" Text="Property Owner Last Name"></asp:Label>
                <asp:TextBox ID="PropertyOwnerLastName" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="PropertyLastNameFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerLastName"
                    ErrorMessage="You must enter a valid last name."
                    ForeColor="Red"
                    ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="PropertyAddressLabel" runat="server" Text="Address"></asp:Label>
                <asp:TextBox ID="PropertyOwnerAddress" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PropertyAddressEnteredValidator" runat="server"
                    ControlToValidate="PropertyOwnerAddress"
                    ErrorMessage="Address is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PropertyAddressFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerAddress"
                    ErrorMessage="You must enter a valid address."
                    ForeColor="Red"
                    ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="PropertyCityLabel" runat="server" Text="City"></asp:Label>
                <asp:TextBox ID="PropertyOwnerCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PropertyCityEnteredValidator" runat="server"
                    ControlToValidate="PropertyOwnerCity"
                    ErrorMessage="City is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PropertyCityFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerCity"
                    ErrorMessage="You must enter a valid city."
                    ForeColor="Red"
                    ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="ProprtyStateLabel" runat="server" Text="State"></asp:Label>
                <asp:TextBox ID="PropertyOwnerState" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PropertyStateEnteredValidator" runat="server"
                    ControlToValidate="PropertyOwnerState"
                    ErrorMessage="State is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PropertyStateFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerState"
                    ErrorMessage="You must enter a valid state abreviation"
                    ForeColor="Red"
                    ValidationExpression="[a-zA-Z]{2}">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="PropertyZipCodeLabel" runat="server" Text="Zip Code"></asp:Label>
                <asp:TextBox ID="PropertyOwnerZipCode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PropertyZipCodeEnteredValidator" runat="server"
                    ControlToValidate="PropertyOwnerZipCode"
                    ErrorMessage="Zip Code is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="PropertyZipCodeFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerZipCode"
                    ErrorMessage="You must enter a valid zip code"
                    ForeColor="Red"
                    ValidationExpression="[0-9]{5}">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="PropertyEmailLabel" runat="server" Text="Email"></asp:Label>
                <asp:TextBox ID="PropertyOwnerEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="PropertyEmailFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerEmail"
                    ErrorMessage="You must enter a valid email."
                    ForeColor="Red"
                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="PropertyPhoneLabel" runat="server" Text="Phone"></asp:Label>
                <asp:TextBox ID="PropertyOwnerPhone" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="PropertyPhoneFormatValidator" runat="server"
                    ControlToValidate="PropertyOwnerPhone"
                    ErrorMessage="You must enter a valid phone number"
                    ForeColor="Red"
                    ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:CheckBox ID="PropertyOwnerRotaryMember" runat="server" Text="Rotary Member" TextAlign="Left" />
            </p>
            <p>
                <asp:Label ID="PropertyTraitsLabel" runat="server" Text="Property Traits"></asp:Label>
                <asp:CheckBoxList ID="PropertyTraits" runat="server" DataSourceID="Traits" DataTextField="TraitDescription" DataValueField="TraitID"></asp:CheckBoxList>
                <asp:SqlDataSource ID="Traits" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TraitID], [TraitDescription] FROM [Trait]"></asp:SqlDataSource>
            </p>
        </div>

        <div id="SleeveInfo" class="tab-pane fade">
            <h3><%: "Sleeve"%></h3>
            <p>
                <asp:Label ID="LocationDescriptionLabel" runat="server" Text="Location Description"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="SleeveLocationDescription" runat="server" Height="89px" Width="864px"></asp:TextBox>
            </p>
            <p>
                <asp:Label ID="SleevePhoto" runat="server" Text="Photo"></asp:Label>
            </p>
            <p id="uploadArea">
                <asp:FileUpload ID="FileUpload1" type="file" runat="server" />
                <asp:RegularExpressionValidator ID="ImageValidator1" runat="server" ControlToValidate="FileUpload1" ErrorMessage="Accepts only .jpg, .jpeg, .png, and .bmp file types" ForeColor="Red" ValidationExpression="(.+\.([Jj][Pp][Gg])|.+\.([Jj][Pp][Ee][Gg])|.+\.([Pp][Nn][Gg])|.+\.([Bb][Mm][Pp]))"></asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Button ID="AddAnotherImage" runat="server" Text="Add Another Image" OnClientClick="addImageUploadBox()" />
            </p>
            <p>
                <asp:Label ID="LatitudeLabel" runat="server" Text="Latitude"></asp:Label>
                <asp:TextBox ID="SleeveLatitude" runat="server" EnableTheming="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LatitudeEnteredValidator" runat="server"
                    ControlToValidate="SleeveLatitude"
                    ErrorMessage="Latitude is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="LatitudeFormatValidator" runat="server"
                    ControlToValidate="SleeveLatitude"
                    ErrorMessage="You must enter a valid latitude."
                    ForeColor="Red"
                    ValidationExpression="^\d{0,8}(.\d{0,6})?$">
                </asp:RegularExpressionValidator>
            <p>
                <asp:Label ID="LongitudeLabel" runat="server" Text="Longitude"></asp:Label>
                <asp:TextBox ID="SleeveLongitude" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="LongitudeEnteredValidator" runat="server"
                    ControlToValidate="SleeveLongitude"
                    ErrorMessage="Longitude is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="LongitudeFormatValidator" runat="server"
                    ControlToValidate="SleeveLongitude"
                    ErrorMessage="You must enter a valid longitude."
                    ForeColor="Red"
                    ValidationExpression="^\d{0,8}(.\d{0,6})?$">
                </asp:RegularExpressionValidator>
            <p>
                <asp:Label ID="OUPSNotifiedDateLabel" runat="server" Text="OUPS Notified Date"></asp:Label>
                <asp:TextBox ID="OupsNotifiedDate" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="OUPSNotifiedDateFormatValidator" runat="server"
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="OupsNotifiedDate"
                    ErrorMessage="You must enter a valid date."
                    ForeColor="Red">
                </asp:CompareValidator>
            </p>
            <p>
                <asp:Label ID="OUPSTicketNumberLabel" runat="server" Text="OUPS Ticket Number"></asp:Label>
                <asp:TextBox ID="OupsTicketNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="OUPSTicketNumberEnteredValidator" runat="server"
                    ControlToValidate="OupsTicketNumber"
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
                <asp:TextBox ID="OupsCheckedDate" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="OUPSCheckedDateFormatValidator" runat="server"
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="OupsCheckedDate"
                    ErrorMessage="You must enter a valid date."
                    ForeColor="Red">
                </asp:CompareValidator>
            </p>
            <p>
                <asp:Label ID="InstallDateLabel" runat="server" Text="Install Date"></asp:Label>
                <asp:TextBox ID="SleeveInstallDate" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="InstallDateFormatValidator" runat="server"
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="SleeveInstallDate"
                    ErrorMessage="You must enter a valid date."
                    ForeColor="Red">
                </asp:CompareValidator>
            </p>
            <p>
                <asp:Label ID="ChangeDateLabel" runat="server" Text="Change Date"></asp:Label>
                <asp:TextBox ID="SleeveChangeDate" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="ChangeDateFormatValidator" runat="server"
                    Type="Date"
                    Operator="DataTypeCheck"
                    ControlToValidate="SleeveChangeDate"
                    ErrorMessage="You must enter a valid date."
                    ForeColor="Red">
                </asp:CompareValidator>
            </p>
            <p>
                <asp:CheckBox ID="SleevePublic" runat="server" Text="Public" TextAlign="Left" />
            </p>
            <p>
                <asp:CheckBox ID="SleeveDeliver" runat="server" Text="Deliver" TextAlign="Left" Checked="True" />
            </p>
        </div>

        <div id="PaymentInfo" class="tab-pane fade">
            <h3><%: "Payment"%></h3>
            <p>
                <asp:Label ID="BasePriceLabel" runat="server" Text="Base Price"></asp:Label>
                <asp:TextBox ID="OrderBasePrice" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="BasePriceEnteredValidator" runat="server"
                    ControlToValidate="OrderBasePrice"
                    ErrorMessage="Base price is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="BasePriceFormatValidator" runat="server"
                    ControlToValidate="OrderBasePrice"
                    ErrorMessage="You must enter a valid price."
                    ForeColor="Red"
                    ValidationExpression="^\d+(\.\d\d)?$">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="OrderPaymentMethodLabel" runat="server" Text="Payment Method"></asp:Label>
                <asp:DropDownList ID="OrderPaymentMethod" runat="server" DataSourceID="OrderPaymentSource" DataTextField="SourceName" DataValueField="SourceID"></asp:DropDownList>
                <asp:SqlDataSource ID="OrderPaymentSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SourceName], [SourceID] FROM [Source]"></asp:SqlDataSource>

            </p>
            <p>
                <asp:Label ID="DiscountLabel" runat="server" Text="Discount"></asp:Label>
                <asp:DropDownList ID="OrderDiscount" runat="server" DataSourceID="DiscountName" DataTextField="DiscountReason" DataValueField="DiscountID"></asp:DropDownList>
                <asp:SqlDataSource ID="DiscountName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DiscountReason], [DiscountID] FROM [Discount]"></asp:SqlDataSource>
            </p>
            <p>
                <asp:Label ID="AmountPaidLabel" runat="server" Text="Amount Paid"></asp:Label>
                <asp:TextBox ID="PaymentAmountPaid" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="AmountPaidEnteredValidator" runat="server"
                    ControlToValidate="PaymentAmountPaid"
                    ErrorMessage="Amount paid is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="AmountPaidFormatValidator" runat="server"
                    ControlToValidate="PaymentAmountPaid"
                    ErrorMessage="You must enter a valid price."
                    ForeColor="Red"
                    ValidationExpression="^\d+(\.\d\d)?$">
                </asp:RegularExpressionValidator>
            </p>
            <p>
                <asp:Label ID="PaymentDateLabel" runat="server" Text="Payment Date"></asp:Label>
                <asp:TextBox ID="PaymentDate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PaymentDateEnteredValidator" runat="server"
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
                <asp:Label ID="OrderFirstOccasionLabel" runat="server" Text="First Occasion"></asp:Label>
                <asp:DropDownList ID="OrderFirstOccasion" runat="server" DataSourceID="OccasionName" DataTextField="OccasionName" DataValueField="OccasionID"></asp:DropDownList>
                <asp:SqlDataSource ID="OccasionName" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OccasionName], [OccasionID] FROM [Occasion]"></asp:SqlDataSource>
            </p>
            <p>
                &nbsp;</p>
            <p>
                <asp:Button ID="SubmitButton" runat="server" Text="Submit" />
            </p>
        </div>
    </div>

    <script type="text/javascript">
        function addImageUploadBox() {
            if (!document.getElementById || !document.createElement)
                return false;
            var uploadArea = document.getElementById("uploadArea");
            if (!uploadArea)
                return;
            var newLine = document.createElement("br");
            uploadArea.appendChild(newLine);
            var newUploadBox = document.createElement("input");
            newUploadBox.type = "file";
            newUploadBox.setAttribute("class", "fileUpload")
            if (!addImageUploadBox.lastAssignedId)
                addImageUploadBox.lastAssignedId = 2;
            newUploadBox.setAttribute("id", "FileUpload" + addImageUploadBox.lastAssignedId);
            newUploadBox.setAttribute("name", "FileUpload" + addImageUploadBox.lastAssignedId);
            uploadArea.appendChild(newUploadBox);
            addImageUploadBox.lastAssignedId++;
        }
    </script>

</asp:Content>