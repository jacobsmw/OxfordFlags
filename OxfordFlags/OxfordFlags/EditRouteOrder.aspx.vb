Public Class EditRouteOrder
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    'Move up
    Private Sub MoveUp(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UpButton.Click
        'Make sure our item is not the first one on the list.
        If PropertyOwnersListBox.SelectedIndex > 0 Then
            Dim I = PropertyOwnersListBox.SelectedIndex - 1
            PropertyOwnersListBox.Items.Insert(I, PropertyOwnersListBox.SelectedItem)
            PropertyOwnersListBox.Items.RemoveAt(PropertyOwnersListBox.SelectedIndex + 2)
            PropertyOwnersListBox.SelectedIndex = I
        End If
    End Sub

    'Move down
    Private Sub MoveDown(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DownButton.Click
        'Make sure our item is not the last one on the list.
        If PropertyOwnersListBox.SelectedIndex < PropertyOwnersListBox.Items.Count - 1 Then
            'Insert places items above the index you supply, since we want
            'to move it down the list we have to do + 2
            Dim I = PropertyOwnersListBox.SelectedIndex + 2
            PropertyOwnersListBox.Items.Insert(I, PropertyOwnersListBox.SelectedItem)
            PropertyOwnersListBox.Items.RemoveAt(PropertyOwnersListBox.SelectedIndex)
            PropertyOwnersListBox.SelectedIndex = I - 1
        End If
    End Sub

    Private Sub UpdateSortOrder(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SubmitButton.Click
        Dim tbl As dsTableAdapters.StoredProcedureTableAdapter = New dsTableAdapters.StoredProcedureTableAdapter()
        Dim i = 1
        For Each item As ListItem In PropertyOwnersListBox.Items
            tbl.spUpdateSortOrder(item.Value, i)
            i = i + 1
        Next
        Response.Redirect("~/Tools")
    End Sub


End Class