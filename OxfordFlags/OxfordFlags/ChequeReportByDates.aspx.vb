Public Class ChequeReportByDates
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Private Property sDate As Date
    Private Property eDate As Date
    Private Property i As Single ' a float. 
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub ChequeSearchButton_Click(sender As Object, e As EventArgs) Handles ChequeByDatesSearchButton.Click
        sDate = StartDate.Text
        eDate = EndDate.Text
        Dim db As dsTableAdapters.spReportChequeInDatesTableAdapter = New dsTableAdapters.spReportChequeInDatesTableAdapter
        Dim rs As ds.spReportChequeInDatesRow

        Dim sb As New StringBuilder
        'edit based off what he wants as the output.
        sb.Append("<table style='thin black line'>")
        sb.Append("<tr>")
        sb.Append("<td>") : sb.Append("ChequeNumber") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Amount") : sb.Append("</td style='padding: 10px'>")
        
        sb.Append("</tr>")
        i = 0
        For Each rs In db.GetData(sDate, eDate)
            sb.Append("<tr>")
            sb.Append("<td>") : sb.Append(rs.CheckPaypalNumber) : sb.Append("</td>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Payment) : sb.Append("</td>")
            i = i + rs.Payment

            


            sb.Append("</tr>")
        Next

        sb.Append("</table>")
        sb.Append("Total for cheque within dates: ") : sb.Append(i)
        rs = Nothing
        db.Connection.Close()
        db = Nothing


        OutputLabel.Text = sb.ToString


    End Sub


End Class