Imports System.Web
Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization
Imports SocialNetwork.Items
Imports System.IO
Imports Newtonsoft.Json
Imports System.Security.Principal
Imports System.Web.Script.Services

Public Class EditProfile
    Implements System.Web.IHttpHandler
    Implements IRequiresSessionState

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand

    Public Class FriendInList

        Dim _Mail As String
        Dim _Name As String
        Dim _image As String
        Public Property Name As String
            Get
                Return _Name
            End Get
            Set(value As String)
                _Name = value
            End Set
        End Property

        Public Property Mail As String
            Get
                Return _Mail
            End Get
            Set(value As String)
                _Mail = value
            End Set
        End Property

        Public Property UserImage As String
            Get
                Return _image
            End Get
            Set(value As String)
                _image = value
            End Set
        End Property
    End Class
    Public Class Posts


        Dim _userCode As String = ""
        Dim userName As String = ""
        Dim _userImage As String = ""
        Dim _ShareLink As String = ""
        Dim _CommentLink As String = ""
        Dim _LikeLink As String = ""
        Dim _likeCount As Integer
        Public Property LikeCount As Integer
            Get
                Return _likeCount
            End Get
            Set(value As Integer)
                _likeCount = value
            End Set
        End Property

        Dim integerID As Integer
        Public Property intID As Integer
            Get
                Return integerID
            End Get
            Set(value As Integer)
                integerID = value
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

        Public Property Hide As Boolean
        Public Property User As String
            Get
                Return userName
            End Get
            Set(value As String)
                userName = value
            End Set
        End Property

        Public Property Code As String
            Get
                Return _userCode
            End Get
            Set(value As String)
                _userCode = value
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

    Public listOfFriends As List(Of FriendInList)

    <WebMethod>
    Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest


        Try
            If context.Request.QueryString("id") Is Nothing Then
                context.Response.End()
            End If

            'Dim json As UserStruct
            'json = JsonConvert.DeserializeObject(Of UserStruct)(a)
            Dim response As String = ""
            Dim postList As List(Of Posts)
            Dim Result As SqlDataReader
            Dim Friends As String = ""
            Select Case context.Request.QueryString("id")

                'show posts for the first time
                'these queries read all the posts from users and his friends.

                Case "1"
                    CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                    CNN.Open()
                    CMD = New SqlCommand("select Responder from Friendships where Requester=@email and isRequest='n'", CNN)
                    'select p.body,p.image,p.userID from Posts as p, Friendships as f where f.isRequest='n' and (p.userID = f.Requester or p.userID=f.Responder)
                    CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                    CMD.Parameters("@email").Value = context.User.Identity.Name
                    'CMD.Parameters.Add("@name", SqlDbType.NVarChar, 50)
                    'CMD.Parameters("@name").Value = json.Name
                    'CMD.Parameters.Add("@family", SqlDbType.NVarChar, 50)
                    'CMD.Parameters("@family").Value = json.Family
                    'CMD.ExecuteScalar()

                    'CMD = New SqlCommand("update Profiles set job=@job,gender=@gender,birthday=@birthday,marritalStatus=@m where userID=@email", CNN)
                    'CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                    'CMD.Parameters("@email").Value = json.Mail
                    'CMD.Parameters.Add("@job", SqlDbType.Text)
                    'CMD.Parameters("@job").Value = json.Job
                    'CMD.Parameters.Add("@gender", SqlDbType.Char)
                    'CMD.Parameters("@gender").Value = json.Gender

                    'CMD.Parameters.Add("@birthday", SqlDbType.Date)
                    'CMD.Parameters("@birthday").Value = json.Birthday
                    'CMD.Parameters.Add("@m", SqlDbType.NVarChar, 1)
                    'CMD.Parameters("@m").Value = json.MarritalStatus
                    Result = CMD.ExecuteReader()
                    Try
                        While Result.HasRows()
                            Result.Read()
                            Friends += "'" + Result.GetValue(0) + "'" + ", "
                        End While

                    Catch ex As Exception
                        Exit Try
                    End Try

                    CNN.Close()

                    CNN.Open()

                    CMD = New SqlCommand("select Requester from Friendships where Responder=@email and isRequest='n'", CNN)
                    'select p.body,p.image,p.userID from Posts as p, Friendships as f where f.isRequest='n' and (p.userID = f.Requester or p.userID=f.Responder)
                    CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                    CMD.Parameters("@email").Value = context.User.Identity.Name


                    Result = CMD.ExecuteReader()


                    Try
                        While Result.HasRows()
                            Result.Read()
                            Friends += "'" + Result.GetValue(0) + "'" + ", "
                        End While
                    Catch ex As Exception
                        Exit Try
                    End Try
                    Result.Close()
                    CNN.Close()
                    CNN.Open()
                    Friends += "'" + context.User.Identity.Name + "'"

                    postList = New List(Of Posts)


                    'getting the posts:

                    CMD = New SqlCommand("select * from Posts where userID in (" + Friends + ") order by dateOfCreation desc OFFSET @start ROWS FETCH NEXT 5 ROWS ONLY", CNN)
                    CMD.Parameters.Add("@start", SqlDbType.Int).Value = Int32.Parse(context.Request.QueryString("start"))
                    Result = CMD.ExecuteReader()

                    Try
                        While Result.HasRows()
                            Result.Read()

                            Dim post As New Posts

                            If Result.GetValue(2).ToString() = "" Then
                                post.Image = ""
                                post.Hide = True
                            Else
                                post.Image = "Images/PostImages/" + (Result.GetValue(2).ToString()).Replace(" ", "%20")
                                'escapestring replaces all characters
                                'Uri.EscapeDataString((Result.GetValue(2).ToString()))
                                post.Hide = False
                            End If

                            post.Body = Result.GetValue(1)
                            post.User = Result.GetValue(3).ToString()
                            post.UserImage = "Images/ProfileImages/T" + Result.GetValue(3).ToString() + ".jpg"
                            post.intID = Int32.Parse(Result.GetValue(0))
                            post.LikeCount = Int32.Parse(Result.GetValue(5))
                            postList.Add(post)

                        End While
                    Catch ex As Exception
                        Exit Try
                    End Try
                    Result.Close()

                    'getting the user names:
                    For Each U As Posts In postList

                        CMD = New SqlCommand("select name,familly,code from Users where email=@mail ", CNN)
                        CMD.Parameters.Add("@mail", SqlDbType.NVarChar, 128).Value = U.User
                        Result = CMD.ExecuteReader
                        Try
                            While Result.HasRows()
                                Result.Read()
                                U.User = Result.GetValue(0).ToString()
                                U.User += " " + Result.GetValue(1).ToString()
                                U.Code = Result.GetValue(2).ToString()
                            End While
                        Catch ex As Exception
                            Exit Try
                        End Try
                        Result.Close()
                    Next

                    response = JsonConvert.SerializeObject(postList)
                    context.Response.ContentType = "text/json"

                    CNN.Close()

                    'Show More Friends:
                    'TODO: Improve the first if. you want only the count so only get the counts.
                Case "2"

                    Dim start As Integer = Int32.Parse(context.Request.QueryString("start"))
                    Dim a As String = context.Request.PhysicalApplicationPath
                    If context.Request.QueryString("start") = 0 Then
                        start = GetFriends(0, 10, context.User.Identity.Name, a).Count()
                    End If


                    response = JsonConvert.SerializeObject(GetFriends(start, 10, context.User.Identity.Name, a))
                    context.Response.ContentType = "text/json"
                    'newBase.Dispose()


                    'Accepting Friend Requests
                Case "3"
                    Dim user As String = context.Request.QueryString("start")
                    CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                    CNN.Open()
                    CMD = New SqlCommand("UPDATE Friendships SET isRequest='n' WHERE Requester=@o AND Responder=@m", CNN)
                    CMD.Parameters.Add("@o", SqlDbType.NVarChar, 128).Value = user
                    CMD.Parameters.Add("@m", SqlDbType.NVarChar, 128).Value = context.User.Identity.Name
                    CMD.ExecuteScalar()
                    CNN.Close()

                    response = JsonConvert.SerializeObject("S")
                    context.Response.ContentType = "text/json"

                    'Rejecting Friend Requests
                Case "4"
                    Dim user As String = context.Request.QueryString("start")
                    CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                    CNN.Open()
                    CMD = New SqlCommand("UPDATE Friendships SET isRequest='d' WHERE Requester=@o AND Responder=@m", CNN)
                    CMD.Parameters.Add("@o", SqlDbType.NVarChar, 128).Value = user
                    CMD.Parameters.Add("@m", SqlDbType.NVarChar, 128).Value = context.User.Identity.Name
                    CMD.ExecuteScalar()
                    CNN.Close()

                    response = JsonConvert.SerializeObject("S")
                    context.Response.ContentType = "text/json"


                    'Like the post
                Case "5"

                    Dim po As New Posts
                    Dim user As String = context.Request.QueryString("start")
                    Dim Likes As String
                    Dim AlreadyVoted As Boolean = False
                    CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                    CNN.Open()
                    CMD = New SqlCommand("SELECT likes FROM Posts WHERE postCode=@o", CNN)
                    CMD.Parameters.Add("@o", SqlDbType.NVarChar, 128).Value = user
                    Likes = CMD.ExecuteScalar().ToString()
                    CNN.Close()
                    For Each e As String In Likes.Split(",")
                        If e = context.User.Identity.Name Then
                            AlreadyVoted = True
                            Exit For
                        End If
                    Next

                    If Not AlreadyVoted Then
                        Likes += "," + context.User.Identity.Name.ToString()
                        CNN.Open()
                        CMD = New SqlCommand("UPDATE Posts SET likeCount=likeCount+1, likes=@like WHERE postCode=@o", CNN)
                        CMD.Parameters.Add("@o", SqlDbType.NVarChar, 128).Value = user
                        CMD.Parameters.Add("@like", SqlDbType.Text).Value = Likes
                        CMD.ExecuteScalar()
                        CNN.Close()
                    End If

                    CNN.Open()
                    CMD = New SqlCommand("SELECT likeCount FROM Posts WHERE postCode=@o", CNN)
                    CMD.Parameters.Add("@o", SqlDbType.NVarChar, 128).Value = user
                    po.LikeCount = CMD.ExecuteScalar().ToString()
                    CNN.Close()
                    postList = New List(Of Posts)
                    postList.Add(po)
                    response = JsonConvert.SerializeObject(postList)
                    context.Response.ContentType = "text/json"


                    'LOAD POST INFO
                Case "6"

                    Dim po As New Posts
                    Dim user As String = context.Request.QueryString("start")
                    CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                    CNN.Open()
                    CMD = New SqlCommand("SELECT likeCount FROM Posts WHERE postCode=@o", CNN)
                    CMD.Parameters.Add("@o", SqlDbType.NVarChar, 128).Value = user
                    po.LikeCount = CMD.ExecuteScalar().ToString()
                    CNN.Close()
                    postList = New List(Of Posts)
                    postList.Add(po)
                    response = JsonConvert.SerializeObject(postList)
                    context.Response.ContentType = "text/json"

            End Select

            context.Response.Write(response)

        Catch ex As Exception
            Exit Try
        End Try


    End Sub

    ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
        Get
            Return False
        End Get
    End Property

    Public Function GetFriends(ByVal startPosition As Integer, ByVal HowMany As Integer, ByVal User As String, ByVal imagePath As String) As List(Of FriendInList)

        Dim Friends As String = ""
        Dim results As SqlDataReader
        listOfFriends = New List(Of FriendInList)()
        Dim count As Integer = 0
        Dim start As Integer = 0
        CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        CNN.Open()
        CMD = New SqlCommand("select Responder from Friendships where Requester=@email and isRequest='n'", CNN)
        CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        CMD.Parameters("@email").Value = User

        results = CMD.ExecuteReader()

        While results.HasRows() And count < HowMany
            Try

                results.Read()
                Friends += "'" + results.GetValue(0) + "'" + ", "
                If start = startPosition Then
                    Friends += "'" + results.GetValue(0) + "'" + ", "
                    count += 1

                    Dim FF As New FriendInList
                    'FF = New FriendInList()
                    FF.Mail = results.GetValue(0).ToString()
                    Try
                        If Not (FileLen(imagePath + "Images\ProfileImages\T" + results.GetValue(0).ToString() + ".jpg") = 0) Then
                            FF.UserImage = "Images/ProfileImages/T" + results.GetValue(0).ToString() + ".jpg"
                        End If
                    Catch ex As System.IO.FileNotFoundException
                        FF.UserImage = "ImgUserInProfile.jpg"
                    End Try
                    listOfFriends.Add(FF)
                Else
                    start += 1
                End If
            Catch ex As Exception
                Exit While
            End Try
        End While


        results.Close()
        CNN.Close()

        CNN.Open()

        CMD = New SqlCommand("select Requester from Friendships where Responder=@email and isRequest='n'", CNN)
        CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        CMD.Parameters("@email").Value = User


        results = CMD.ExecuteReader()



        While results.HasRows() And count < HowMany
            Try
                results.Read()
                Friends += "'" + results.GetValue(0) + "'" + ", "
                If start = startPosition Then
                    count += 1

                    Dim F As New FriendInList
                    'F = New FriendInList()
                    F.Mail = results.GetValue(0).ToString()
                    F.UserImage = ""
                    Try
                        If Not (FileLen(imagePath + "Images/ProfileImages/T" + results.GetValue(0).ToString() + ".jpg") = 0) Then
                            F.UserImage = "Images/ProfileImages/T" + results.GetValue(0).ToString() + ".jpg"
                        End If
                    Catch ex As System.IO.FileNotFoundException
                        F.UserImage = "ImgUserInProfile.jpg"
                    End Try
                    listOfFriends.Add(F)

                Else
                    start += 1
                End If

            Catch ex As Exception
                Exit While
            End Try
        End While

        results.Close()

        For Each U As FriendInList In listOfFriends

            CMD = New SqlCommand("select name,familly from Users where email=@mail ", CNN)
            CMD.Parameters.Add("@mail", SqlDbType.NVarChar, 128).Value = U.Mail
            results = CMD.ExecuteReader
            Try
                While results.HasRows()
                    results.Read()
                    U.Name = results.GetValue(0).ToString()
                    U.Name += " " + results.GetValue(1).ToString()

                End While
            Catch ex As Exception
                Exit Try
            End Try
            results.Close()
        Next


        CNN.Close()
        CNN.Open()

        Return listOfFriends
    End Function


End Class