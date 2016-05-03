Imports System.Web
Imports System.Web.UI
Imports Microsoft.AspNet.Identity
Imports Microsoft.AspNet.Identity.EntityFramework
Imports Microsoft.AspNet.Identity.Owin
Imports Microsoft.Owin.Security
Imports Owin

Partial Public Class Login
    Inherits Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If User.Identity.IsAuthenticated Then
            Response.Redirect("~/Main_Menu")
        End If
    End Sub

    Protected Sub LogIn(sender As Object, e As EventArgs)
        If IsValid Then
            ' Validate the user password
            Dim manager = Context.GetOwinContext().GetUserManager(Of ApplicationUserManager)()
            Dim user As ApplicationUser = manager.Find(Email.Text, Password.Text)
            If user IsNot Nothing Then
                IdentityHelper.SignIn(manager, user, RememberMe.Checked)
                ' IdentityHelper.RedirectToReturnUrl(Request.QueryString("ReturnUrl"), Response)
                Response.Redirect("~/Main_Menu")
            Else
                FailureText.Text = "Invalid username or password."
                ErrorMessage.Visible = True
            End If
        End If
    End Sub
End Class
