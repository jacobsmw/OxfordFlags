Public Class SleeveDataSheets

    Inherits System.Web.UI.Page
    Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
    Dim tbl2 As dsTableAdapters.spSelectPhotoBySleeveIDTableAdapter = New dsTableAdapters.spSelectPhotoBySleeveIDTableAdapter()
    Private Property vYear As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub CustomerInputSearchButton_Click(sender As Object, e As EventArgs) Handles SleeveDataSheetsButton.Click

        'SleeveLabel.Text = "Pressed"
        Dim db As dsTableAdapters.spReportSleeveDataSheetsTableAdapter = New dsTableAdapters.spReportSleeveDataSheetsTableAdapter
        Dim rs As ds.spReportSleeveDataSheetsRow

        Dim sb As New StringBuilder


        '''  --SELECT [PropertyOwner].FirstName, [PropertyOwner].LastName, [PropertyOwner].StreetAddress, [PropertyOwner].City, [PropertyOwner].[State], [PropertyOwner].Zip, [PropertyOwner].Phone,
        '''--[Sleeve].Latitude, [Sleeve].Longitude, [Sleeve].LocationDescription, [Sleeve].SleeveID --,used for PHOTO  

        For Each rs In db.GetData()

            sb.Append("<table>")
            sb.Append("<tr style='border-top:1pt solid black;'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append("PROPERTYOWNERFirstName") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("LastName") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("Address") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("CITY") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("State") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("Zip") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("Phone") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("Latitude") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("Longitude") : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append("LocationDescription") : sb.Append("</td style='padding: 10px'>")
            'sb.Append("<td style='padding: 10px'>") : sb.Append("SLEEVE COUNT") : sb.Append("</td>")

            sb.Append("</tr>")

            sb.Append("<tr>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.FirstName) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.LastName) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.StreetAddress) : sb.Append("</td style='padding: 10px'>")

            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.City) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.State) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Zip) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Phone) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Latitude) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.Longitude) : sb.Append("</td style='padding: 10px'>")
            sb.Append("<td style='padding: 10px'>") : sb.Append(rs.LocationDescription) : sb.Append("</td style='padding: 10px'>")
            ' sb.Append(@"<img src=""http://localhost:22279/Images/19blitzcrank_in_flames.jpg"" />");
            sb.Append("</tr>")
            sb.Append("</table>")
            sb.Append("<table>")
            For Each Row As DataRow In tbl2.GetData(rs.SleeveID)
                'sb.Append("<br></br>")

                'sb.Append("<td>") : sb.Append(rs.FirstName) : sb.Append("</td>")
                Dim i As Image = New Image()

                sb.Append("<tr>")

                i.ImageUrl = "\Images\" & Row.Field(Of String)("Photo")
                i.Height = 200
                i.Width = 200
                sb.Append("<td style='padding: 10px'>")
                sb.Append("<img src='" + i.ImageUrl + "'/>")
                ' sb.Append("<td style='padding: 10px'>") : sb.Append(i.ImageUrl) : sb.Append("</td>")
                sb.Append("</td>")
                sb.Append("</tr>")
                ' sb.Append("<br>") : sb.Append("</br>")
                ' PlaceHolder1.Controls.Add(i)
                ' PlaceHolder1.Controls.Add(New HtmlGenericControl("br"))
            Next
            'sb.Append("<td style='padding: 10px'>") : sb.Append(PlaceHolder1) : sb.Append("</td>")

            sb.Append("</table>")

        Next

        sb.Append("</table>")

        rs = Nothing
        db.Connection.Close()
        db = Nothing


        OutputLabel.Text = sb.ToString


    End Sub



End Class