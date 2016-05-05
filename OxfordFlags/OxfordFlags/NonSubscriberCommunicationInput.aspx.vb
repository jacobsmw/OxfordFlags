Public Class NonSubscriberCommunicationInput
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Dim tbl2 As dsTableAdapters.spSelectPhotoBySleeveIDTableAdapter = New dsTableAdapters.spSelectPhotoBySleeveIDTableAdapter()
    Private Property vYear As String
    Private Property i As Integer
    Private Property bPrice As String
    Private Property eDiscount As String
    Private Property mDiscount As String
    Private Property qty As Integer
    Private Property earlyRenew As String 'for calculations of early vs not early.
    Private Property lateRenew As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub NonSubscriberCommunicationInputSearchButton_Click(sender As Object, e As EventArgs) Handles NonSubscriberCommunicationInputSearchButton.Click
        vYear = SubscriptionYear.Text
        bPrice = basePrice.Text
        eDiscount = EarlyDiscount.Text
        mDiscount = multiDiscount.Text
        'SleeveLabel.Text = "Pressed"
        Dim db As dsTableAdapters.spReportNotRenewedTableAdapter = New dsTableAdapters.spReportNotRenewedTableAdapter
        Dim rs As ds.spReportNotRenewedRow

        Dim sb As New StringBuilder


        '''  --SELECT [PropertyOwner].FirstName, [PropertyOwner].LastName, [PropertyOwner].StreetAddress, [PropertyOwner].City, [PropertyOwner].[State], [PropertyOwner].Zip, [PropertyOwner].Phone,
        '''--[Sleeve].Latitude, [Sleeve].Longitude, [Sleeve].LocationDescription, [Sleeve].SleeveID --,used for PHOTO  

        sb.Append("<table>")
        sb.Append("<tr style='padding: 10px'>")

        sb.Append("<td style='padding: 10px'>") : sb.Append("email") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("FirstName") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("WholeName") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Location") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Address") : sb.Append("</td style='padding: 10px'>")

        sb.Append("<td style='padding: 10px'>") : sb.Append("CityStateZip") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Phone") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("qty") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Extend") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("LateExtend") : sb.Append("</td style='padding: 10px'>")
        'above were the critical sections

        sb.Append("<td style='padding: 10px'>") : sb.Append("Lastname") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Comm Type") : sb.Append("</td style='padding: 10px'>") 'comm type is bill type



        'sb.Append("<td style='padding: 10px'>") : sb.Append("SLEEVE COUNT") : sb.Append("</td>")

        sb.Append("</tr>")




        'For Each rs In db.GetData(basePrice.Text, EarlyDiscount.Text, multiDiscount.Text, vYear)
        For Each rs In db.GetData(vYear)



            sb.Append("<tr>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Email) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.FirstName) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.FirstName) : sb.Append(" ") : sb.Append(rs.LastName) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>")
            ''all of their properties
            Dim db2 As dsTableAdapters.spReportSleevesPerPropertyByBuyerIdTableAdapter = New dsTableAdapters.spReportSleevesPerPropertyByBuyerIdTableAdapter
            Dim rs2 As ds.spReportSleevesPerPropertyByBuyerIdRow
            i = 0
            earlyRenew = 0
            lateRenew = 0
            qty = 0

            For Each rs2 In db2.GetData(rs.BuyerID, vYear)

                qty = qty + rs2.Sleeves
                lateRenew = lateRenew + bPrice + ((bPrice - mDiscount) * (rs2.Sleeves - 1))
                earlyRenew = earlyRenew + (bPrice - eDiscount) + ((bPrice - mDiscount - eDiscount) * (rs2.Sleeves - 1))
                If (i > 0) Then

                    sb.Append(", ") : sb.Append(rs2.StreetAddress)
                    i = 1
                End If
                If (i < 1) Then

                    sb.Append(rs2.StreetAddress)

                End If
                i = 1


            Next
            rs2 = Nothing
            db2.Connection.Close()
            db2 = Nothing
            sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.StreetAddress) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.City) : sb.Append(" ") : sb.Append(rs.State) : sb.Append(" ") : sb.Append(rs.Zip) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Phone) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(qty) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(earlyRenew) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(lateRenew) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.LastName) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.BillType) : sb.Append("</td style='padding: 10px'>")





            sb.Append("</tr>")
            'sb.Append("</table>")
            'sb.Append("<table>")

        Next

        sb.Append("</table>")

        rs = Nothing
        db.Connection.Close()
        db = Nothing


        OutputLabel.Text = sb.ToString


    End Sub



End Class