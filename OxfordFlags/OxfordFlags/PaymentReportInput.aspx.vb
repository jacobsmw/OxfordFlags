Public Class PaymentReportInput
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Private Property i As Integer
    Private Property vYear As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub PaymentReportButton_Click(sender As Object, e As EventArgs) Handles PaymentReportInputSearchButton.Click
        vYear = SubscriptionYear.Text
        'SleeveLabel.Text = "Pressed"
        Dim db As dsTableAdapters.spReportSumOfPaymentTypesTableAdapter = New dsTableAdapters.spReportSumOfPaymentTypesTableAdapter
        Dim rs As ds.spReportSumOfPaymentTypesRow

        Dim sb As New StringBuilder


        '''  --SELECT [PropertyOwner].FirstName, [PropertyOwner].LastName, [PropertyOwner].StreetAddress, [PropertyOwner].City, [PropertyOwner].[State], [PropertyOwner].Zip, [PropertyOwner].Phone,
        '''--[Sleeve].Latitude, [Sleeve].Longitude, [Sleeve].LocationDescription, [Sleeve].SleeveID --,used for PHOTO  

        sb.Append("<table>")
        sb.Append("<tr style='padding: 10px'>")

        sb.Append("<td style='padding: 10px'>") : sb.Append("Type") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Paid") : sb.Append("</td style='padding: 10px'>")



        'sb.Append("<td style='padding: 10px'>") : sb.Append("SLEEVE COUNT") : sb.Append("</td>")

        sb.Append("</tr>")



        i = 0
        For Each rs In db.GetData(vYear)



            sb.Append("<tr>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.PaymentType) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Paid) : sb.Append("</td style='padding: 10px'>")

            i = i + rs.Paid

            ''all of their properties

            'sb.Append("</td style='padding: 10px'>")




            sb.Append("</tr>")
            'sb.Append("</table>")
            'sb.Append("<table>")

        Next



        sb.Append("</table>")
        sb.AppendLine(" ")
        sb.AppendLine(" ")
        sb.Append("    Total for year: ") : sb.Append(i)

        rs = Nothing
        db.Connection.Close()
        db = Nothing


        OutputLabel.Text = sb.ToString


    End Sub



End Class