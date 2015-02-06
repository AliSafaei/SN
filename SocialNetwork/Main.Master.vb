Imports System.Data.SqlClient

Public Class Main
    Inherits System.Web.UI.MasterPage

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Dim Result As SqlDataReader

    Public Property Name As String
        Get
            Return _Name.Text
        End Get
        Set(value As String)
            _Name.Text = value
        End Set
    End Property
    Public Property SubName
        Get
            Return _SubName.Text
        End Get
        Set(value)
            _SubName.Text = value
        End Set
    End Property
    Public Property Job
        Get
            Return _job.Text
        End Get
        Set(value)
            _job.Text = value
        End Set
    End Property
    Public Property HomeTown
        Get
            Return _HomeTown.Text
        End Get
        Set(value)
            _HomeTown.Text = value
        End Set
    End Property

    Public Property Image As String
        Get
            Return ImgUserProfile.Attributes.Item("src")
        End Get
        Set(value As String)
            ImgUserProfile.Attributes.Item("src") = value
        End Set
    End Property
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            If Context.Request.QueryString("id") Is Nothing Then
                Try
                    If Not (FileLen(Request.PhysicalApplicationPath + "Images\ProfileImages\T" + Context.User.Identity.Name + ".jpg") = 0) Then
                        ImgUserProfile.Attributes.Item("src") = "Images/ProfileImages/T" + Context.User.Identity.Name + ".jpg"
                    End If
                Catch ex As System.IO.FileNotFoundException
                    ImgUserProfile.Attributes.Item("src") = "ImgUserPicture.jpg"
                End Try

                CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                CNN.Open()
                CMD = New SqlCommand("select * from Users where email=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = Context.User.Identity.Name
                Result = CMD.ExecuteReader()

                While (Result.HasRows())
                    Try
                        Result.Read()
                        _Name.Text = Result.GetValue(0).ToString()
                        _Name.Text += " " + Result.GetValue(1).ToString()

                    Catch ex As Exception
                        Exit While
                    End Try
                    _SubName.Text = _Name.Text
                End While

                Result.Close()
                CMD = New SqlCommand("select job,currentTown from Profiles where userID=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = Context.User.Identity.Name
                Result = CMD.ExecuteReader()

                While (Result.HasRows())
                    Try
                        Result.Read()
                        _job.Text = Result.GetValue(0).ToString()
                        _HomeTown.Text = Result.GetValue(1).ToString()

                    Catch ex As Exception
                        Exit While
                    End Try
                End While

                Result.Close()
            Else

                Dim UserName As String
                Dim userCode As Integer
                userCode = Request.QueryString("id")

                CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                CNN.Open()
                CMD = New SqlCommand("SELECT email FROM Users WHERE code=@ID", CNN)
                CMD.Parameters.Add("@ID", SqlDbType.Int).Value = userCode
                UserName = CMD.ExecuteScalar()

                Try
                    If Not (FileLen(Request.PhysicalApplicationPath + "Images\ProfileImages\T" + UserName + ".jpg") = 0) Then
                        ImgUserProfile.Attributes.Item("src") = "Images/ProfileImages/T" + UserName + ".jpg"
                    End If
                Catch ex As System.IO.FileNotFoundException
                    ImgUserProfile.Attributes.Item("src") = "ImgUserPicture.jpg"
                End Try


                CMD = New SqlCommand("select * from Users where email=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = UserName
                Result = CMD.ExecuteReader()

                While (Result.HasRows())
                    Try
                        Result.Read()
                        _SubName.Text = Result.GetValue(0).ToString()
                        _SubName.Text += " " + Result.GetValue(1).ToString()

                    Catch ex As Exception
                        Exit While
                    End Try
                End While


                Result.Close()
                CMD = New SqlCommand("select job,currentTown from Profiles where userID=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = UserName
                Result = CMD.ExecuteReader()

                While (Result.HasRows())
                    Try
                        Result.Read()
                        _job.Text = Result.GetValue(0).ToString()
                        _HomeTown.Text = Result.GetValue(1).ToString()

                    Catch ex As Exception
                        Exit While
                    End Try
                End While

                Result.Close()
                CMD = New SqlCommand("select * from Users where email=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = Context.User.Identity.Name
                Result = CMD.ExecuteReader()

                While (Result.HasRows())
                    Try
                        Result.Read()
                        _Name.Text = Result.GetValue(0).ToString()
                        _Name.Text += " " + Result.GetValue(1).ToString()

                    Catch ex As Exception
                        Exit While
                    End Try
                End While
                Result.Close()

            End If


        Catch ex As Exception
            Exit Try
        End Try
        
    End Sub

    Protected Sub ImgMore_Click(sender As Object, e As ImageClickEventArgs) Handles ImgMore.Click
        Response.Redirect("Main.aspx")
    End Sub

    Protected Sub ViewUserInfo_Click(sender As Object, e As ImageClickEventArgs) Handles ViewUserInfo.Click
        Response.Redirect("MyProfile.aspx")
    End Sub

    Protected Sub ImgFriend_Click(sender As Object, e As ImageClickEventArgs) Handles ImgFriend.Click
        Response.Redirect("Friends.aspx")
    End Sub


    Protected Sub hi_ServerClick(sender As Object, e As EventArgs)
        FormsAuthentication.SignOut()
        Response.Redirect("Home.aspx")
    End Sub
End Class