
Imports System
Imports System.Data.SqlClient
Public Class LoginForm
    Inherits System.Web.UI.Page

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub EnterButton_Click(sender As Object, e As ImageClickEventArgs) Handles EnterButton.Click

        Dim queryResult As String
        CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        CNN.Open()
        CMD = New SqlCommand("select pass from Users where email=@email", CNN)
        CMD.Parameters.Add("@email", SqlDbType.NVarChar, 50)
        CMD.Parameters("@email").Value = EmailL.Text
        queryResult = CMD.ExecuteScalar()
        CNN.Close()

        If Not (queryResult Is Nothing) Then
            If PasswordL.Text = queryResult Then
                'create user session.
                FormsAuthentication.RedirectFromLoginPage(PasswordL.Text, True)
            End If
        End If

    End Sub
End Class