Public Class CustomerByAddress
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Private Property vYear As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GPSOutputButton_Click(sender As Object, e As EventArgs) Handles CustomerByAddressSearchButton.Click
        vYear = SubscriptionYear.Text
        'SleeveLabel.Text = "Pressed"
        Dim db As dsTableAdapters.spReportCustomerByStreetAddressTableAdapter = New dsTableAdapters.spReportCustomerByStreetAddressTableAdapter
        Dim rs As ds.spReportCustomerByStreetAddressRow

        Dim sb As New StringBuilder


        'SELECT DISTINCT [Buyer].FirstName, [Buyer].LastName, [Buyer].StreetAddress, Substring([Buyer].StreetAddress, PatIndex('%[^0-9]%', [Buyer].StreetAddress), 999) As Street, cast(Left([Buyer].StreetAddress, PatIndex('%[^0-9]%', [Buyer].StreetAddress)) as int) As HouseNum


        sb.Append("<table>")
        sb.Append("<tr style='padding: 10px'>")

        sb.Append("<td style='padding: 10px'>") : sb.Append("Street") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("House#") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("LastName") : sb.Append("</td style='padding: 10px'>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("FirstName") : sb.Append("</td style='padding: 10px'>")





        'sb.Append("<td style='padding: 10px'>") : sb.Append("SLEEVE COUNT") : sb.Append("</td>")

        sb.Append("</tr>")




        For Each rs In db.GetData(vYear)



            sb.Append("<tr>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Street) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.HouseNum) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.LastName) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.FirstName) : sb.Append("</td style='padding: 10px'>")



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