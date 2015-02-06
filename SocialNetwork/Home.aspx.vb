
Imports System
Imports System.Data.SqlClient
Public Class Home
    Inherits System.Web.UI.Page

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub EnterButton_Click(sender As Object, e As EventArgs) Handles EnterButton.ServerClick
        Try
            Dim queryResult As String
            CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
            CNN.Open()
            CMD = New SqlCommand("select pass from Users where email=@email", CNN)
            CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
            CMD.Parameters("@email").Value = EmailL.Text
            queryResult = CMD.ExecuteScalar()
            CNN.Close()

            If Not (queryResult Is Nothing) Then
                If PasswordL.Text = queryResult Then
                    'create user session.
                    FormsAuthentication.RedirectFromLoginPage(EmailL.Text, True)
                    Response.Redirect("Main.aspx", False)
                Else
                    Response.Redirect("Home.aspx", False)
                End If
            Else
                Response.Redirect("Home.aspx", False)
            End If
        Catch ex As Exception
            Response.Redirect("Home.aspx", False)
            Exit Try
        End Try


    End Sub

    Protected Sub RegisterButton_Click(sender As Object, e As EventArgs) Handles RegisterButton.ServerClick

        Try
            If Not ((EmailR.Text = "") Or (PasswordR.Text = "")) Then
                Dim queryResult As String

                CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                CNN.Open()
                CMD = New SqlCommand("select pass from Users where email=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = EmailR.Text
                queryResult = CMD.ExecuteScalar()

                If (queryResult Is Nothing) Then
                    CMD = New SqlCommand("insert into Users values(@name,@family,@email,@phone,@pass)", CNN)
                    CMD.Parameters.Add("@name", SqlDbType.NVarChar, 50)
                    CMD.Parameters("@name").Value = Name.Text
                    CMD.Parameters.Add("@family", SqlDbType.NVarChar, 50)
                    CMD.Parameters("@family").Value = FamilyName.Text
                    CMD.Parameters.Add("@phone", SqlDbType.NVarChar, 11)
                    CMD.Parameters("@phone").Value = PhoneNumber.Text
                    CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                    CMD.Parameters("@email").Value = EmailR.Text
                    CMD.Parameters.Add("@pass", SqlDbType.NVarChar, 50)
                    CMD.Parameters("@pass").Value = PasswordR.Text
                    queryResult = CMD.ExecuteScalar()

                    'todo login the user with the specified credentials and then: redirect to ProfilePage (if it doesn't do that itself)
                    'todo add captha

                    CMD = New SqlCommand("insert into Profiles (userID) values(@email)", CNN)
                    CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                    CMD.Parameters("@email").Value = EmailR.Text
                    queryResult = CMD.ExecuteScalar()
                    CNN.Close()
                    FormsAuthentication.RedirectFromLoginPage(EmailR.Text, True)
                Else
                    CNN.Close()
                    Response.Redirect("Home.aspx", False)
                End If



            End If



            'SipReg.Text = "<iframe src='https://enrollment.sipthor.net/enrollment.phtml?email=" + EmailR.Text + "&password=" + PasswordR.Text + "&display_name=" + Name.Text + " " + FamilyName.Text + "&username=" + EmailR.Text.Replace("@", "").Replace(".", "") + "' hidden='true'></ifram>"



        Catch ex As Exception
            Exit Try
        End Try
        'todo: check for validation errors. null values.


    End Sub
End Class