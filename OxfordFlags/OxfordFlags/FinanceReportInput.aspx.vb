Public Class FinanceReportInput
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Private Property vYear As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub CustomerInputSearchButton_Click(sender As Object, e As EventArgs) Handles FinanceReportInputSearchButton.Click
        vYear = SubscriptionYear.Text

        Dim db As dsTableAdapters.spReportFinancialTableAdapter = New dsTableAdapters.spReportFinancialTableAdapter
        Dim rs As ds.spReportFinancialRow

        Dim sb As New StringBuilder

        sb.Append("<table>")
        sb.Append("<tr>")
        sb.Append("<td>") : sb.Append("Expected") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td>") : sb.Append("Paid") : sb.Append("</td style='padding: 10px'>")
        sb.Append("</tr>")
        For Each rs In db.GetData(vYear)
            sb.Append("<tr>")
            sb.Append("<td>") : sb.Append(rs.Expected) : sb.Append("</td>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.PAID) : sb.Append("</td>")



            sb.Append("</tr>")
        Next

        sb.Append("</table>")

        rs = Nothing
        db.Connection.Close()
        db = Nothing


        lblFinancialReport.Text = sb.ToString


    End Sub

End Class