Imports System.Data.SqlClient
Public Class Main1
    Inherits BaseMainMaster

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Dim Result As SqlDataReader

    Public MainPosts As List(Of Posts)
    'Public listOfFriends As List(Of FriendInList)

    'Public Class FriendInList

    '    Dim _Name As String
    '    Dim _image As String
    '    Public Property Name As String
    '        Get
    '            Return _Name
    '        End Get
    '        Set(value As String)
    '            _Name = value
    '        End Set
    '    End Property

    '    Public Property UserImage As String
    '        Get
    '            Return _image
    '        End Get
    '        Set(value As String)
    '            _image = value
    '        End Set
    '    End Property
    'End Class
    Public Class Posts

        Dim userName As String
        Dim userId As String
        Dim _userImage As String
        Dim _ShareLink As String
        Dim _CommentLink As String
        Dim _LikeLink As String

        Dim _load As String
        Public Property LoadInfo As String
            Get
                Return _load
            End Get
            Set(value As String)
                _load = value
            End Set
        End Property

        Public Property LikeLink As String
            Get
                Return _LikeLink
            End Get
            Set(value As String)
                _LikeLink = value
            End Set
        End Property
        Public Property ShareLink As String
            Get
                Return _ShareLink
            End Get
            Set(value As String)
                _ShareLink = value
            End Set
        End Property
        Public Property CommentLink As String
            Get
                Return _CommentLink
            End Get
            Set(value As String)
                _CommentLink = value
            End Set
        End Property

        Public Property Body As String
        Public Property Image As String
        Public Property User As String
            Get
                Return userName
            End Get
            Set(value As String)
                userName = value
            End Set
        End Property


        Public Property ID As String
            Get
                Return userId
            End Get
            Set(value As String)
                userId = value
            End Set
        End Property

        Public Property UserImage As String
            Get
                Return _userImage
            End Get
            Set(value As String)
                _userImage = value
            End Set
        End Property

    End Class
    Overloads Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'display five posts here

        Dim Friends As String = ""
        'listOfFriends = New List(Of FriendInList)()

        'CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        'CNN.Open()
        'CMD = New SqlCommand("select Responder from Friendships where Requester=@email and isRequest='n'", CNN)
        'CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        'CMD.Parameters("@email").Value = User.Identity.Name

        'Result = CMD.ExecuteReader()

        'While Result.HasRows()
        '    Try
        '        Result.Read()
        '        Friends += "'" + Result.GetValue(0) + "'" + ", "
        '        Dim FF As New FriendInList
        '        'FF = New FriendInList()
        '        FF.Name = Result.GetValue(0).ToString()
        '        Try
        '            If Not (FileLen(Request.PhysicalApplicationPath + "Images\ProfileImages\T" + Result.GetValue(0).ToString() + ".jpg") = 0) Then
        '                FF.UserImage = "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg"
        '            End If
        '        Catch ex As System.IO.FileNotFoundException
        '            FF.UserImage = "ImgUserInProfile.jpg"
        '        End Try
        '        listOfFriends.Add(FF)
        '    Catch ex As Exception
        '        Exit While
        '    End Try
        'End While


        'Result.Close()
        'CNN.Close()

        'CNN.Open()

        'CMD = New SqlCommand("select Requester from Friendships where Responder=@email and isRequest='n'", CNN)
        'CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        'CMD.Parameters("@email").Value = User.Identity.Name


        'Result = CMD.ExecuteReader()



        'While Result.HasRows()
        '    Try
        '        Result.Read()
        '        Friends += "'" + Result.GetValue(0) + "'" + ", "

        '        Dim F As New FriendInList
        '        'F = New FriendInList()
        '        F.Name = Result.GetValue(0).ToString()
        '        F.UserImage = ""
        '        Try
        '            If Not (FileLen(Request.PhysicalApplicationPath + "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg") = 0) Then
        '                F.UserImage = "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg"
        '            End If
        '        Catch ex As System.IO.FileNotFoundException
        '            F.UserImage = "ImgUserInProfile.jpg"
        '        End Try
        '        listOfFriends.Add(F)

        '    Catch ex As Exception
        '        Exit While
        '    End Try
        'End While

        'Result.Close()

        'CNN.Close()

        Dim friendList As List(Of FriendInList)
        'displays five friends:
        friendList = GetFriends(0, "All")
        For Each a As FriendInList In friendList
            Friends += "'" + a.Mail + "', "
        Next

        Friends += "'" + User.Identity.Name + "'"
        MainPosts = New List(Of Posts)()
        CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)

        CNN.Open()
        CMD = New SqlCommand("select top(5) * from Posts where userID in (" + Friends + ") order by dateOfCreation desc", CNN)
        Result = CMD.ExecuteReader()

        While (Result.HasRows())
            Try
                Result.Read()

                Dim NL As Posts
                NL = New Posts()
                If Result.GetValue(2).ToString() = "" Then
                    NL.Image = ""
                Else
                    NL.Image = "Images/PostImages/" + Result.GetValue(2)
                End If

                NL.Body = Result.GetValue(1)
                NL.User = Result.GetValue(3).ToString()

                If FileIO.FileSystem.FileExists("Images/ProfileImages/T" + Result.GetValue(3).ToString() + ".jpg") Then
                    NL.UserImage = "Images/ProfileImages/T" + Result.GetValue(3).ToString() + ".jpg"
                Else
                    NL.UserImage = ""
                End If


                NL.LikeLink = "Like(" + Result.GetValue(0).ToString() + "); return false;"
                NL.ShareLink = "Share(" + Result.GetValue(0).ToString() + "); return false;"
                NL.CommentLink = "Comment(" + Result.GetValue(0).ToString() + "); return false;"
                NL.LoadInfo = "LoadPostInfo(" + Result.GetValue(0).ToString() + "); return false;"

                MainPosts.Add(NL)

            Catch ex As Exception
                Exit While
            End Try

        End While

        Result.Close()
        CNN.Close()

        CNN.Open()

        For Each U As Posts In MainPosts

            CMD = New SqlCommand("select name,familly,code from Users where email=@mail ", CNN)
            CMD.Parameters.Add("@mail", SqlDbType.NVarChar, 128).Value = U.User
            Result = CMD.ExecuteReader
            Try
                While Result.HasRows()
                    Result.Read()
                    U.User = Result.GetValue(0).ToString()
                    U.User += " " + Result.GetValue(1).ToString()

                    U.ID = "Profile.aspx?id=" + Result.GetValue(2).ToString()
                End While
            Catch ex As Exception
                Exit Try
            End Try
            Result.Close()
        Next


        CNN.Close()
        Repeater1.DataSource = MainPosts
        Repeater1.DataBind()

        'get five friends to show in the main page.
        friendList = GetFriends(0, 5)

        If listOfFriends.Count() = 0 Then
            Dim FF As FriendInList
            FF = New FriendInList
            FF.Name = "شما هنوز دوستی انتخاب نکرده اید"
            FF.UserImage = ""
            listOfFriends.Add(FF)
        End If


        FriendsInMain.DataSource = listOfFriends
        FriendsInMain.DataBind()





    End Sub

    Protected Sub SendfPostButton_Click(sender As Object, e As EventArgs) Handles SendfPostButton.ServerClick
        Try
            If FileUpload1.HasFile() Or Not (PostTextBox.Value = Nothing) Then

                Dim QueryCmpl1 As String = ""
                Dim QueryCmpl2 As String = ""

                If FileUpload1.HasFiles() Then
                    QueryCmpl1 = ",image"
                    QueryCmpl2 = ",'" + Server.HtmlEncode(FileUpload1.FileName) + "'"
                    FileUpload1.SaveAs(Request.PhysicalApplicationPath + "Images\PostImages\" + Server.HtmlEncode(FileUpload1.FileName))
                End If

                'todo: if save succesfull : if file was only image
                CNN.Open()
                CMD = New SqlCommand("insert into Posts  (body,userID,dateOfCreation" + QueryCmpl1 + ") values(@adCode,@purchaseDate,@count" + QueryCmpl2 + ")", CNN)
                CMD.Parameters.Add("@adCode", SqlDbType.Text).Value = PostTextBox.Value
                CMD.Parameters.Add("@purchaseDate", SqlDbType.NVarChar, 128).Value = User.Identity.Name
                CMD.Parameters.Add("@count", SqlDbType.DateTime).Value = DateTime.Now()
                CMD.ExecuteScalar()

                CNN.Close()
                'id for iframe so that JS can hide it on laod

                Response.Redirect("Main.aspx", True)



            End If
        Catch ex As Exception
            Exit Try
        End Try

    End Sub

    Protected Sub Unnamed_Click(sender As Object, e As ImageClickEventArgs)

    End Sub
End Class