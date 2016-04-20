Public Class AddPhoto
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not User.Identity.IsAuthenticated Then
            Response.Redirect("~/Account/Login")
        End If
    End Sub

    Protected Sub Submit(ByVal sender As Object, ByVal e As System.EventArgs) Handles SubmitButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
        Dim fileName = ""
        For Each file In SleevePhotoFileUpload.PostedFiles
            fileName = SleevesListBox.SelectedValue & file.FileName
            tbl.spAddNewPhoto(SleevesListBox.SelectedValue, fileName)
            file.SaveAs(Server.MapPath("~\Images\" & fileName))
        Next
        Response.Redirect("AddPhoto")
    End Sub

End Class