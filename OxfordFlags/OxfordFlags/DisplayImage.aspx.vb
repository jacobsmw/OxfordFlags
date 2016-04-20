Public Class DisplayImage
    Inherits System.Web.UI.Page

    Dim tbl As dsTableAdapters.spSelectPhotoBySleeveIDTableAdapter = New dsTableAdapters.spSelectPhotoBySleeveIDTableAdapter()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub LoadImages(ByVal sender As Object, ByVal e As System.EventArgs) Handles SleevesListBox.SelectedIndexChanged
        PlaceHolder1.Controls.Clear()
        For Each Row As DataRow In tbl.GetData(SleevesListBox.SelectedValue)
            Dim i As Image = New Image()
            i.ImageUrl = "~\Images\" & Row.Field(Of String)("Photo")
            i.Height = 200
            i.Width = 200
            PlaceHolder1.Controls.Add(i)
            PlaceHolder1.Controls.Add(New HtmlGenericControl("br"))
        Next
    End Sub

End Class