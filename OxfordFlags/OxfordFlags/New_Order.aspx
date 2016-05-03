<%@ Page Title="New Order" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Order.aspx.vb" Inherits="OxfordFlags.New_Order" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <div id="Tabs" role="tabpanel">
            <ul class="nav nav-tabs" role="tablist">
                <li><a role="tab" data-toggle="tab" href="#OrderInfo">Order</a></li>
                <li><a role="tab" data-toggle="tab" href="#BuyerInfo">Buyers</a></li>
                <li><a role="tab" data-toggle="tab" href="#PropertyOwnerInfo">Property Owner</a></li>
                <li><a role="tab" data-toggle="tab" href="#SleeveInfo">Sleeves</a></li>
            </ul>

            <div class="tab-content">

                <div id="OrderInfo" role="tabpanel" class="tab-pane fade in active">
                    <h1>Order Information</h1>
                    <div class="form-group">
                        <asp:Label ID="OrderDateLabel" runat="server" Text="Date: " CssClass="col-x2-2"></asp:Label>
                        <asp:TextBox ID="OrderDateInput" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                        <asp:CompareValidator ID="OrderDateFormatValidator" runat="server"
                            Type="Date"
                            Operator="DataTypeCheck"
                            ControlToValidate="OrderDateInput"
                            ErrorMessage="You must enter a valid date."
                            ForeColor="Red">
                        </asp:CompareValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderCostLabel" runat="server" Text="Cost: " CssClass="col-x2-2"></asp:Label>
                        <asp:TextBox ID="OrderCostInput" runat="server" CssClass="form-control" placeholder="45.00"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="OrderCostFormatValidator" runat="server"
                            ControlToValidate="OrderCostInput"
                            ErrorMessage="You must enter a valid price."
                            ForeColor="Red"
                            ValidationExpression="^\d+(\.\d\d)?$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderAmountPaidLabel" runat="server" Text="Amount Paid: " CssClass="col-x2-2"></asp:Label>
                        <asp:TextBox ID="OrderAmountPaidInput" runat="server" CssClass="form-control" placeholder="If no payment, input 00.00"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="OrderAmountPaidFormatValidator" runat="server"
                            ControlToValidate="OrderAmountPaidInput"
                            ErrorMessage="You must enter a valid price."
                            ForeColor="Red"
                            ValidationExpression="^\d+(\.\d\d)?$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderPaymentSourceLabel" runat="server" Text="Payment Type: " CssClass="col-x2-2"></asp:Label><br />
                        <asp:DropDownList ID="OrderPaymentSourceDropDownList" runat="server" DataSourceID="OrderPaymentSourceDataSource" DataTextField="Type" DataValueField="Id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="OrderPaymentSourceDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [PaymentSource]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderPaymentMemoLabel" runat="server" Text="Check # / Paypal ID: " CssClass="col-x2-2"></asp:Label>
                        <asp:TextBox ID="OrderPaymentMemoInput" runat="server" CssClass="form-control" placeholder="Check # or PayPal ID"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderDiscountLabel" runat="server" Text="Discount: " CssClass="col-x2-2"></asp:Label>
                        <asp:DropDownList ID="OrderDiscountDropDownList" runat="server" DataSourceID="OrderDiscountSource" DataTextField="DiscountReason" DataValueField="DiscountID"></asp:DropDownList>
                        <asp:SqlDataSource ID="OrderDiscountSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [DiscountReason], [DiscountID] FROM [Discount]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderSourceLabel" runat="server" Text="Source: " CssClass="col-x2-2"></asp:Label>
                        <asp:DropDownList ID="OrderSourceDropDownList" runat="server" DataSourceID="OrderSourceSource" DataTextField="SourceName" DataValueField="SourceID"></asp:DropDownList>
                        <asp:SqlDataSource ID="OrderSourceSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [SourceName], [SourceID] FROM [Source]"></asp:SqlDataSource>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderSubscriptionYearLabel" runat="server" Text="Subscription Year: " CssClass="col-x2-2"></asp:Label>
                        <asp:TextBox ID="OrderSubscriptionYearInput" runat="server" CssClass="form-control" placeholder="yyyy"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="SubscriptionYearFormatValidator" runat="server"
                            ControlToValidate="OrderSubscriptionYearInput"
                            ErrorMessage="You must enter a valid year."
                            ForeColor="Red"
                            ValidationExpression="^[0-9]{4}$">
                        </asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="OrderFirstOccasionLabel" runat="server" Text="First Occasion: " CssClass="col-x2-2"></asp:Label>
                        <asp:DropDownList ID="OrderFirstOccasionDropDownList" runat="server" DataSourceID="OrderFirstOccasionSource" DataTextField="OccasionName" DataValueField="OccasionID"></asp:DropDownList>
                        <asp:SqlDataSource ID="OrderFirstOccasionSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [OccasionName], [OccasionID] FROM [Occasion]"></asp:SqlDataSource>
                    </div>
                </div>

                <div id="BuyerInfo" role="tabpanel" class="tab-pane fade">
                    <h1>Buyer Information</h1>
                    <asp:Table ID="BuyerFormatTable" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                        <div id="BuyerForm">
                            <asp:Label ID="BuyerLabel" runat="server" Text="Buyer: " CssClass="col-x2-2"></asp:Label>
                            <asp:DropDownList ID="BuyerDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="BuyerSource" DataTextField="Name" DataValueField="BuyerID">
                                <asp:ListItem Value="0">New</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="BuyerSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT BuyerID, CONCAT( LastName, ', ', FirstName) AS Name FROM [Buyer] WHERE ([Active] = '1')"></asp:SqlDataSource>
            
                            <div class="form-group">
                                <asp:Label ID="BuyerFirstNameLabel" runat="server" Text="First Name: " CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="BuyerFirstNameInput" runat="server" CssClass="form-control" placeholder="John"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="BuyerFirstNameFormatValidator" runat="server"
                                    ControlToValidate="BuyerFirstNameInput"
                                    ErrorMessage="You must enter a valid first name."
                                    ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="BuyerLastNameLabel" runat="server" Text="Last Name: " CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="BuyerLastNameInput" runat="server" CssClass="form-control" placeholder="Smith"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="BuyerLastNameFormatValidator" runat="server"
                                    ControlToValidate="BuyerLastNameInput"
                                    ErrorMessage="You must enter a valid last name."
                                    ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="BuyerAddressLabel" runat="server" Text="Address: " CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="BuyerAddressInput" runat="server" CssClass="form-control" placeholder="123 Ohio Road"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="BuyerAddressFormatValidator" runat="server"
                                    ControlToValidate="BuyerAddressInput"
                                    ErrorMessage="You must enter a valid address."
                                    ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="BuyerCityLabel" runat="server" Text="City: " CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="BuyerCityInput" runat="server" CssClass="form-control" placeholder="Oxford"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="BuyerCityFormatValidator" runat="server"
                                    ControlToValidate="BuyerCityInput"
                                    ErrorMessage="You must enter a valid city."
                                    ForeColor="Red"
                                    ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="BuyerStateLabel" runat="server" Text="State: " CssClass="col-x2-2"></asp:Label>
                                <asp:DropDownList ID="BuyerStateDropDownList" runat="server">
                                    <asp:ListItem>AL</asp:ListItem>
                                    <asp:ListItem>AK</asp:ListItem>
                                    <asp:ListItem>AZ</asp:ListItem>
                                    <asp:ListItem>AR</asp:ListItem>
                                    <asp:ListItem>CA</asp:ListItem>
                                    <asp:ListItem>CO</asp:ListItem>
                                    <asp:ListItem>CT</asp:ListItem>
                                    <asp:ListItem>DE</asp:ListItem>
                                    <asp:ListItem>DC</asp:ListItem>
                                    <asp:ListItem>FL</asp:ListItem>
                                    <asp:ListItem>GA</asp:ListItem>
                                    <asp:ListItem>HI</asp:ListItem>
                                    <asp:ListItem>ID</asp:ListItem>
                                    <asp:ListItem>IL</asp:ListItem>
                                    <asp:ListItem>IN</asp:ListItem>
                                    <asp:ListItem>IA</asp:ListItem>
                                    <asp:ListItem>KS</asp:ListItem>
                                    <asp:ListItem>KY</asp:ListItem>
                                    <asp:ListItem>LA</asp:ListItem>
                                    <asp:ListItem>ME</asp:ListItem>
                                    <asp:ListItem>MD</asp:ListItem>
                                    <asp:ListItem>MA</asp:ListItem>
                                    <asp:ListItem>MI</asp:ListItem>
                                    <asp:ListItem>MN</asp:ListItem>
                                    <asp:ListItem>MS</asp:ListItem>
                                    <asp:ListItem>MO</asp:ListItem>
                                    <asp:ListItem>MT</asp:ListItem>
                                    <asp:ListItem>NE</asp:ListItem>
                                    <asp:ListItem>NV</asp:ListItem>
                                    <asp:ListItem>NH</asp:ListItem>
                                    <asp:ListItem>NJ</asp:ListItem>
                                    <asp:ListItem>NM</asp:ListItem>
                                    <asp:ListItem>NY</asp:ListItem>
                                    <asp:ListItem>NC</asp:ListItem>
                                    <asp:ListItem>ND</asp:ListItem>
                                    <asp:ListItem Selected="True">OH</asp:ListItem>
                                    <asp:ListItem>OK</asp:ListItem>
                                    <asp:ListItem>OR</asp:ListItem>
                                    <asp:ListItem>PA</asp:ListItem>
                                    <asp:ListItem>RI</asp:ListItem>
                                    <asp:ListItem>SC</asp:ListItem>
                                    <asp:ListItem>SD</asp:ListItem>
                                    <asp:ListItem>TN</asp:ListItem>
                                    <asp:ListItem>TX</asp:ListItem>
                                    <asp:ListItem>UT</asp:ListItem>
                                    <asp:ListItem>VT</asp:ListItem>
                                    <asp:ListItem>VA</asp:ListItem>
                                    <asp:ListItem>WA</asp:ListItem>
                                    <asp:ListItem>WV</asp:ListItem>
                                    <asp:ListItem>WI</asp:ListItem>
                                    <asp:ListItem>WY</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="BuyerZipCodeLabel" runat="server" Text="Zip Code: " CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="BuyerZipCodeInput" runat="server" CssClass="form-control" placeholder="45056"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="BuyerZipCodeFormatValidator" runat="server"
                                    ControlToValidate="BuyerZipCodeInput"
                                    ErrorMessage="You must enter a valid zip code"
                                    ForeColor="Red"
                                    ValidationExpression="[0-9]{5}">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="BuyerEmailLabel" runat="server" Text="Email: " CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="BuyerEmailInput" runat="server" CssClass="form-control" placeholder="email@email.com"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="BuyerEmailFormatValidator" runat="server"
                                    ControlToValidate="BuyerEmailInput"
                                    ErrorMessage="You must enter a valid email."
                                    ForeColor="Red"
                                    ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="BuyerPhoneLabel" runat="server" Text="Phone: " CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="BuyerPhoneInput" runat="server" CssClass="form-control" placeholder="2345678910"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="BuyerPhoneFormatValidator" runat="server"
                                    ControlToValidate="BuyerPhoneInput"
                                    ErrorMessage="You must enter a valid phone number"
                                    ForeColor="Red"
                                    ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:CheckBox ID="BuyerRotaryMemberInput" runat="server" Text="Rotary Member" TextAlign="Left" />
                            </div>
                        </div>
                        </asp:TableCell>
                        <asp:TableCell>
                        <div id="BuyerButtons">
                            <asp:Button ID="BuyerAddButton" runat="server" CssClass="btn btn-primary" Text="Add" Width="75px" HorizontalAlign="Right"/>
                            <br />
                            <asp:Button ID="BuyerRemoveButton" runat="server" CssClass="btn btn-primary" Text="Remove" Width="75px" HorizontalAlign="Right"/>
                        </div>
                        </asp:TableCell>
                        <asp:TableCell >
                        <div id="BuyerDisplay">
                            <asp:ListBox ID="BuyerListBox" runat="server" Width="200px" HorizontalAlign="Right"></asp:ListBox>
                        </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                </div>

                <div id="PropertyOwnerInfo" role="tabpanel" class="tab-pane fade">
                    <h1>Property Owner Information</h1>
                    <asp:Table ID="PropertyOwnerFormatTable" runat="server">
                        <asp:TableRow>
                            <asp:TableCell>
                                <div id="PropertyOwnerForm">
                                    <asp:Label ID="PropertyOwnerLabel" runat="server" Text="Property Owner: " CssClass="col-x2-2"></asp:Label>
                                    <asp:DropDownList ID="PropertyOwnerDropDownList" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="PropertyOwnerSource" DataTextField="Name" DataValueField="PropertyOwnerID">
                                        <asp:ListItem Value="0">New</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="PropertyOwnerSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PropertyOwnerID, CONCAT( LastName, ', ', FirstName) AS Name FROM [PropertyOwner]"></asp:SqlDataSource>
            
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerFirstNameLabel" runat="server" Text="First Name: " CssClass="col-x2-2"></asp:Label>
                                        <asp:TextBox ID="PropertyOwnerFirstNameInput" runat="server" CssClass="form-control" placeholder="John"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="PropertyOwnerFirstNameFormatValidator" runat="server"
                                            ControlToValidate="PropertyOwnerFirstNameInput"
                                            ErrorMessage="You must enter a valid first name."
                                            ForeColor="Red"
                                            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerLastNameLabel" runat="server" Text="Last Name: " CssClass="col-x2-2"></asp:Label>
                                        <asp:TextBox ID="PropertyOwnerLastNameInput" runat="server" CssClass="form-control" placeholder="Smith"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="PropertyOwnerLastNameFormatValidator" runat="server"
                                            ControlToValidate="PropertyOwnerLastNameInput"
                                            ErrorMessage="You must enter a valid last name."
                                            ForeColor="Red"
                                            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerAddressLabel" runat="server" Text="Address: " CssClass="col-x2-2"></asp:Label>
                                        <asp:TextBox ID="PropertyOwnerAddressInput" runat="server" CssClass="form-control" placeholder="123 Ohio Road"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="PropertyOwnerAddressFormatValidator" runat="server"
                                            ControlToValidate="PropertyOwnerAddressInput"
                                            ErrorMessage="You must enter a valid address."
                                            ForeColor="Red"
                                            ValidationExpression="^[a-zA-Z0-9''-'\s]{0,50}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerCityLabel" runat="server" Text="City: " CssClass="col-x2-2"></asp:Label>
                                        <asp:TextBox ID="PropertyOwnerCityInput" runat="server" CssClass="form-control" placeholder="Oxford"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="PropertyOwnerCityFormatValidator" runat="server"
                                            ControlToValidate="PropertyOwnerCityInput"
                                            ErrorMessage="You must enter a valid city."
                                            ForeColor="Red"
                                            ValidationExpression="^[a-zA-Z''-'\s]{0,25}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerStateLabel" runat="server" Text="State: " CssClass="col-x2-2"></asp:Label>
                                        <asp:DropDownList ID="PropertyOwnerStateDropDownList" runat="server">
                                            <asp:ListItem>AL</asp:ListItem>
                                            <asp:ListItem>AK</asp:ListItem>
                                            <asp:ListItem>AZ</asp:ListItem>
                                            <asp:ListItem>AR</asp:ListItem>
                                            <asp:ListItem>CA</asp:ListItem>
                                            <asp:ListItem>CO</asp:ListItem>
                                            <asp:ListItem>CT</asp:ListItem>
                                            <asp:ListItem>DE</asp:ListItem>
                                            <asp:ListItem>DC</asp:ListItem>
                                            <asp:ListItem>FL</asp:ListItem>
                                            <asp:ListItem>GA</asp:ListItem>
                                            <asp:ListItem>HI</asp:ListItem>
                                            <asp:ListItem>ID</asp:ListItem>
                                            <asp:ListItem>IL</asp:ListItem>
                                            <asp:ListItem>IN</asp:ListItem>
                                            <asp:ListItem>IA</asp:ListItem>
                                            <asp:ListItem>KS</asp:ListItem>
                                            <asp:ListItem>KY</asp:ListItem>
                                            <asp:ListItem>LA</asp:ListItem>
                                            <asp:ListItem>ME</asp:ListItem>
                                            <asp:ListItem>MD</asp:ListItem>
                                            <asp:ListItem>MA</asp:ListItem>
                                            <asp:ListItem>MI</asp:ListItem>
                                            <asp:ListItem>MN</asp:ListItem>
                                            <asp:ListItem>MS</asp:ListItem>
                                            <asp:ListItem>MO</asp:ListItem>
                                            <asp:ListItem>MT</asp:ListItem>
                                            <asp:ListItem>NE</asp:ListItem>
                                            <asp:ListItem>NV</asp:ListItem>
                                            <asp:ListItem>NH</asp:ListItem>
                                            <asp:ListItem>NJ</asp:ListItem>
                                            <asp:ListItem>NM</asp:ListItem>
                                            <asp:ListItem>NY</asp:ListItem>
                                            <asp:ListItem>NC</asp:ListItem>
                                            <asp:ListItem>ND</asp:ListItem>
                                            <asp:ListItem Selected="True">OH</asp:ListItem>
                                            <asp:ListItem>OK</asp:ListItem>
                                            <asp:ListItem>OR</asp:ListItem>
                                            <asp:ListItem>PA</asp:ListItem>
                                            <asp:ListItem>RI</asp:ListItem>
                                            <asp:ListItem>SC</asp:ListItem>
                                            <asp:ListItem>SD</asp:ListItem>
                                            <asp:ListItem>TN</asp:ListItem>
                                            <asp:ListItem>TX</asp:ListItem>
                                            <asp:ListItem>UT</asp:ListItem>
                                            <asp:ListItem>VT</asp:ListItem>
                                            <asp:ListItem>VA</asp:ListItem>
                                            <asp:ListItem>WA</asp:ListItem>
                                            <asp:ListItem>WV</asp:ListItem>
                                            <asp:ListItem>WI</asp:ListItem>
                                            <asp:ListItem>WY</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerZipCodeLabel" runat="server" Text="Zip Code: " CssClass="col-x2-2"></asp:Label>
                                        <asp:TextBox ID="PropertyOwnerZipCodeInput" runat="server" CssClass="form-control" placeholder="45056"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="PropertyOwnerZipCodeFormatValidator" runat="server"
                                            ControlToValidate="PropertyOwnerZipCodeInput"
                                            ErrorMessage="You must enter a valid zip code"
                                            ForeColor="Red"
                                            ValidationExpression="[0-9]{5}">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerEmailLabel" runat="server" Text="Email: " CssClass="col-x2-2"></asp:Label>
                                        <asp:TextBox ID="PropertyOwnerEmailInput" runat="server" CssClass="form-control" placeholder="email@email.com"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="PropertyOwnerEmailFormatValidator" runat="server"
                                            ControlToValidate="PropertyOwnerEmailInput"
                                            ErrorMessage="You must enter a valid email."
                                            ForeColor="Red"
                                            ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyOwnerPhoneLabel" runat="server" Text="Phone: " CssClass="col-x2-2"></asp:Label>
                                        <asp:TextBox ID="PropertyOwnerPhoneInput" runat="server" CssClass="form-control" placeholder="2345678910"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="PropertyOwnerPhoneFormatValidator" runat="server"
                                            ControlToValidate="PropertyOwnerPhoneInput"
                                            ErrorMessage="You must enter a valid phone number"
                                            ForeColor="Red"
                                            ValidationExpression="^[01]?[- .]?(\([2-9]\d{2}\)|[2-9]\d{2})[- .]?\d{3}[- .]?\d{4}$">
                                        </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="form-group">
                                        <asp:CheckBox ID="PropertyOwnerRotaryMemberInput" runat="server" Text="Rotary Member" TextAlign="Left" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="PropertyTraitsLabel" runat="server" Text="Property Traits" CssClass="col-x2-2"></asp:Label>
                                        <asp:CheckBoxList ID="PropertyTraits" runat="server" DataSourceID="Traits" DataTextField="TraitDescription" DataValueField="TraitID"></asp:CheckBoxList>
                                        <asp:SqlDataSource ID="Traits" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [TraitID], [TraitDescription] FROM [Trait]"></asp:SqlDataSource>
                                    </div>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell>
                                <div id="PropertyOwnerButtons">
                                    <asp:Button ID="PropertyOwnerAddButton" runat="server" CssClass="btn btn-primary" Text="Add" Width="75px" HorizontalAlign="Right"/>
                                    <br />
                                    <asp:Button ID="PropertyOwnerRemoveButton" runat="server" CssClass="btn btn-primary" Text="Remove" Width="75px" HorizontalAlign="Right"/>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell>
                                <div id="PropertyOwnerDisplay">
                                    <asp:ListBox ID="PropertyOwnerListBox" runat="server" Width="200px" HorizontalAlign="Right"></asp:ListBox>
                                </div>
                            </asp:TableCell>
                        </asp:TableRow>    
                    </asp:Table>
                </div>

                <div id="SleeveInfo" role="tabpanel" class="tab-pane fade">
                    <h1>Sleeve Information</h1>
                    <asp:Table ID="SleeveFormatTable" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                        <div id="SleeveForm">
                            <div class="form-group">
                                Property: <asp:DropDownList ID="SleevePropertyDropDownList" runat="server"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="SleeveLocationDescriptionLabel" runat="server" Text="Location Desciption:" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="SleeveLocationDescriptionInput" runat="server" Height="89px" Width="864px" CssClass="form-control" placeholder="Describe the location of the sleeve on the property"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="SleeveLatitudeLabel" runat="server" Text="Latitude" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="SleeveLatitudeInput" runat="server" EnableTheming="False" CssClass="form-control" placeholder="XXX.XXXXXX"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="SleeveLatitudeFormatValidator" runat="server"
                                    ControlToValidate="SleeveLatitudeInput"
                                    ErrorMessage="You must enter a valid latitude."
                                    ForeColor="Red"
                                    ValidationExpression="^\d{0,8}(.\d{0,6})?$">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="SleeveLongitudeLabel" runat="server" Text="Latitude" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="SleeveLongitudeInput" runat="server" EnableTheming="False" CssClass="form-control" placeholder="XXX.XXXXXX"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="SleeveLongitudeFormatValidator" runat="server"
                                    ControlToValidate="SleeveLongitudeInput"
                                    ErrorMessage="You must enter a valid longitude."
                                    ForeColor="Red"
                                    ValidationExpression="^\d{0,8}(.\d{0,6})?$">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="OupsNotifiedDateLabel" runat="server" Text="OUPS Notified Date:" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="OupsNotifiedDateInput" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                <asp:CompareValidator ID="OupsNotifiedDateFormatValidator" runat="server"
                                    Type="Date"
                                    Operator="DataTypeCheck"
                                    ControlToValidate="OupsNotifiedDateInput"
                                    ErrorMessage="You must enter a valid date."
                                    ForeColor="Red">
                                </asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="OupsTicketNumberLabel" runat="server" Text="OUPS Ticket Number:" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="OupsTicketNumberInput" runat="server" CssClass="form-control" placeholder="Enter the ticket number"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="OupsTicketNumberFormatValidator" runat="server"
                                    ControlToValidate="OupsTicketNumberInput"
                                    ErrorMessage="You must enter a valid ticket number"
                                    ForeColor="Red"
                                    ValidationExpression="[a-zA-Z0-9]{0,20}">
                                </asp:RegularExpressionValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="OupsCheckedDateLabel" runat="server" Text="OUPS Checked Date:" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="OupsCheckedDateInput" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                <asp:CompareValidator ID="OupsCheckedDateFormatValidator" runat="server"
                                    Type="Date"
                                    Operator="DataTypeCheck"
                                    ControlToValidate="OupsCheckedDateInput"
                                    ErrorMessage="You must enter a valid date."
                                    ForeColor="Red">
                                </asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="SleeveInstallDateLabel" runat="server" Text="Install Date:" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="SleeveInstallDateInput" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                <asp:CompareValidator ID="SleeveInstallDateFormatValidator" runat="server"
                                    Type="Date"
                                    Operator="DataTypeCheck"
                                    ControlToValidate="SleeveInstallDateInput"
                                    ErrorMessage="You must enter a valid date."
                                    ForeColor="Red">
                                </asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="SleeveChangeDateLabel" runat="server" Text="Change Date" CssClass="col-x2-2"></asp:Label>
                                <asp:TextBox ID="SleeveChangeDateInput" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
                                <asp:CompareValidator ID="SleeveChangeDateFormatValidator" runat="server"
                                    Type="Date"
                                    Operator="DataTypeCheck"
                                    ControlToValidate="SleeveChangeDateInput"
                                    ErrorMessage="You must enter a valid date."
                                    ForeColor="Red">
                                </asp:CompareValidator>
                            </div>
                            <div class="form-group">
                                <asp:CheckBox ID="SleevePublicCheckbox" runat="server" Text="Public" TextAlign="Left" />
                            </div>
                            <div class="form-group">
                                <asp:CheckBox ID="SleeveDeliverCheckbox" runat="server" Text="Deliver" TextAlign="Left" Checked="True" />
                            </div>
                        </div>
                        </asp:TableCell>
                        <asp:TableCell>
                        <div id="SleeveButtons">
                            <asp:Button ID="SleeveAddButton" runat="server" CssClass="btn btn-primary" Text="Add" Width="75px" HorizontalAlign="Right"/>
                            <br />
                            <asp:Button ID="SleeveRemoveButton" runat="server" CssClass="btn btn-primary" Text="Remove" Width="75px" HorizontalAlign="Right"/>
                        </div>
                        </asp:TableCell>
                        <asp:TableCell>
                        <div id="SleeveDisplay">
                            <asp:ListBox ID="SleeveListBox" runat="server" Width="200px" HorizontalAlign="Right"></asp:ListBox>
                        </div>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
                    <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-primary" Text="Submit" />
                </div>
            
            </div>
        </div>
        <asp:HiddenField ID="TabName" runat="server" />

        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript">
        Sys.Application.add_load(fixTab);
        function fixTab(sender, args) {
            var tabName = $("[id*=TabName]").val() != "" ? $("[id*=TabName]").val() : "#OrderInformation";
            $('#Tabs a[href="#' + tabName + '"]').tab('show');
            $("#Tabs a").click(function () {
                $("[id*=TabName]").val($(this).attr("href").replace("#", ""));
            });
        }
    </script>
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
