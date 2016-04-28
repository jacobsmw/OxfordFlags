Public Class CustomerReportInput
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Private Property vYear As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub CustomerInputSearchButton_Click(sender As Object, e As EventArgs) Handles CustomerReportInputSearchButton.Click
        vYear = SubscriptionYear.Text
        Dim db As dsTableAdapters.spReportCustomerReportTableAdapter = New dsTableAdapters.spReportCustomerReportTableAdapter
        Dim rs As ds.spReportCustomerReportRow

        Dim sb As New StringBuilder

        sb.Append("<table style='thin black line'>")
        sb.Append("<tr>")
        sb.Append("<td>") : sb.Append("FirstName") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td>") : sb.Append("LastName") : sb.Append("</td style='padding: 10px'>")
        'sb.Append("<td style='padding: 10px'>") : sb.Append("SLEEVE COUNT") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("PAID") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Amount Due") : sb.Append("</td>")
        sb.Append("</tr>")
        For Each rs In db.GetData(vYear)
            sb.Append("<tr>")
            sb.Append("<td>") : sb.Append(rs.FirstName) : sb.Append("</td>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.LastName) : sb.Append("</td>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.AmountPaid) : sb.Append("</td>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.AmountDue) : sb.Append("</td>")


            sb.Append("</tr>")
        Next

        sb.Append("</table>")

        rs = Nothing
        db.Connection.Close()
        db = Nothing


        lblCustomerReport.Text = sb.ToString


    End Sub

End Class