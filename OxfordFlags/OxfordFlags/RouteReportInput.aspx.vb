Public Class RouteReportInput
    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Private Property vYear As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub CustomerInputSearchButton_Click(sender As Object, e As EventArgs) Handles RouteReportSearchButton.Click
        vYear = SubscriptionYear.Text

        Dim db As dsTableAdapters.spReportDeliveryRoutesTableAdapter = New dsTableAdapters.spReportDeliveryRoutesTableAdapter
        Dim rs As ds.spReportDeliveryRoutesRow

        Dim sb As New StringBuilder


        'SELECT [Route].RouteColor, [Route].SortOrder, [PropertyOwner].StreetAddress, [PropertyOwner].FirstName, [PropertyOwner].LastName, [PropertyOwner].Phone, [Sleeve].LocationDescription, [Sleeve].SleeveID, [Route].Changed, [Route].Changed, [Route].PreviousColor-- new order , changed route
        sb.Append("<table>")
        sb.Append("<tr><td><b>") : sb.Append(DropDownList1.SelectedValue) : sb.Append("</b></td></tr>")
        sb.Append("</table>")

        sb.Append("<table>")
        sb.Append("<tr>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("RouteColor") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("SortOrder") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("StreetAddress") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("FirstName") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Lastname") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Phone") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("Location Description") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("SleeveId") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("RouteChanged") : sb.Append("</td>")
        sb.Append("<td style='padding: 10px'>") : sb.Append("PreviousRoute") : sb.Append("</td>")





        sb.Append("</tr>")
        For Each rs In db.GetData(vYear)
            sb.Append("<tr>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.RouteColor) : sb.Append("</td>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.SortOrder) : sb.Append("</td>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.StreetAddress) : sb.Append("</td>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.FirstName) : sb.Append("</td>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.LastName) : sb.Append("</td>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Phone) : sb.Append("</td>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.LocationDescription) : sb.Append("</td>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.SleeveID) : sb.Append("</td>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Changed) : sb.Append("</td>")

            If rs.IsPreviousColorNull Then
                sb.Append("<td style='padding: 10px'>") : sb.Append("") : sb.Append("</td>")

            End If
            If Not rs.IsPreviousColorNull Then
                sb.Append("<td style='padding: 10px'><font color='red'>") : sb.Append(rs.PreviousColor) : sb.Append("</font></td>")

            End If



            sb.Append("</tr>")
        Next

        sb.Append("</table>")

        rs = Nothing
        db.Connection.Close()
        db = Nothing


        OutputLabel.Text = sb.ToString


    End Sub

End Class