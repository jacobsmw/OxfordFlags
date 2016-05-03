<%@ Page Title="AddPhoto" Language="vb" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddPhoto.aspx.vb" Inherits="OxfordFlags.AddPhoto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <p>
                &nbsp;</p>
            <p>
                Address:
                <asp:TextBox ID="AddressInput" runat="server"></asp:TextBox>
        &nbsp;<asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-primary" />
                <br />
                <asp:ListBox ID="SleevesListBox" runat="server" DataSourceID="SleeveNamesDataSource" DataTextField="SleeveName" DataValueField="SleeveID"></asp:ListBox>
                <asp:SqlDataSource ID="SleeveNamesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spSelectSleevesByAddress" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="AddressInput" Name="Address" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </p>
        </ContentTemplate>
    </asp:UpdatePanel>
    <p>
        <asp:FileUpload ID="SleevePhotoFileUpload" runat="server" AllowMultiple="True" />
    </p>
    <p>
        <asp:Button ID="SubmitButton" runat="server" Text="Submit" CssClass="btn btn-primary" />
    </p>
</asp:Content>
