Public Class GPSOutput
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()

    Private Property vYear As String
    Private Property i As Integer
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

    Protected Sub GPSOutputButton_Click(sender As Object, e As EventArgs) Handles GPSOutputSearchButton.Click
        vYear = SubscriptionYear.Text
        'SleeveLabel.Text = "Pressed"
        Dim db As dsTableAdapters.spReportGPSOutputTableAdapter = New dsTableAdapters.spReportGPSOutputTableAdapter
        Dim rs As ds.spReportGPSOutputRow

        Dim sb As New StringBuilder


        '[dbo].[Sleeve].SleeveID, [dbo].[Route].RouteColor, [dbo].[Sleeve].Latitude, [dbo].[Sleeve].Longitude, [dbo].[PropertyOwner].FirstName, [Route].SortOrder
        sb.Append("<table>")
        sb.Append("<tr style='padding: 10px'>")

        sb.Append("<td style='padding: 10px'>") : sb.Append("Name") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Color") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Latitude") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Longitude") : sb.Append("</td style='padding: 10px'>")





        'sb.Append("<td style='padding: 10px'>") : sb.Append("SLEEVE COUNT") : sb.Append("</td>")

        sb.Append("</tr>")




        For Each rs In db.GetData(vYear)



            sb.Append("<tr>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.SleeveID) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.RouteColor) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Latitude) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Longitude) : sb.Append("</td style='padding: 10px'>")



            sb.Append("</td style='padding: 10px'>")







            ' sb.Append("</tr>")


        Next

        sb.Append("</table>")

        rs = Nothing
        db.Connection.Close()
        db = Nothing


        OutputLabel.Text = sb.ToString


    End Sub



End Class