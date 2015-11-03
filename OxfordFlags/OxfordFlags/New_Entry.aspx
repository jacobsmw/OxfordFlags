<%@ Page Title="New Entry" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New_Entry.aspx.vb" Inherits="OxfordFlags.New_Entry" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.<asp:Image ID="Image1" runat="server" />
    </h2>
    <p style="text-decoration: underline; font-size: large"><strong>Buyer</strong></p>
    <p>Name
        <input id="Text6" type="text" /></p>
    <p>Address <input id="Text5" type="text" /></p>
    <p>City <input id="Text4" type="text" /></p>
    <p>State <select id="Select1" name="D1">
            <option>WV</option>
            <option>OH</option>
        <%--Need to add all 50 states plus a select option
            we can then save this as a tool--%>
        </select></p>
    <p>Zip Code <input id="Text3" type="text" /></p>
    <p>Email <input id="Text2" type="text" /></p>
    <p>Phone <input id="Text1" type="text" /></p>
    <p>
        Rotary Member
        <input id="Checkbox2" type="checkbox" /></p>
    <p>
        &nbsp;</p>
    <p>
        Payment Method
        <select id="Select2" name="D2">
            <option></option>
        </select></p>
    <p>
        Date
        <select id="Select3" name="D3">
            <option></option>
        </select><select id="Select4" name="D4">
            <option></option>
        </select><select id="Select5" name="D5">
            <option></option>
        </select></p>
    <p>
        Source
        <select id="Select6" name="D6">
            <option></option>
        </select></p>
    <p>
        Discount
        <select id="Select7" name="D7">
            <option></option>
        </select></p>
    <p>
        First Holiday
        <input id="Text7" type="text" /></p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p style="font-size: large; text-decoration: underline">
        <strong>Sleeve</strong></p>
    <p>
        Property Owner
        <input id="Text16" type="text" /></p>
    <p>
        Address <input id="Text15" type="text" /></p>
    <p>
        City <input id="Text14" type="text" /></p>
    <p>
        State </p> <%--Put in State drop list--%>
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
        Sprinkler
        <input id="Checkbox3" type="checkbox" /></p>
    <p>
        Fence
        <input id="Checkbox4" type="checkbox" /></p>
    <p>
        &nbsp;</p>
    <p>
        Location Description<input id="Text8" type="text" /></p>
    <p>
        Latitude
        <input id="Text9" type="text" /></p>
    <p>
        Longitude
        <input id="Text10" type="text" /></p>
    <p>
        OUPS Notified </p> <%--put in date drop list--%>
    <p>
        OUPS Checked </p> <%--put in date drop list--%>
</asp:Content>
