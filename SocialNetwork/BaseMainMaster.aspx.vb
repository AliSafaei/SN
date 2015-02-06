Imports System.Data.SqlClient

Public Class BaseMainMaster
    Inherits System.Web.UI.Page
    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Dim Result As SqlDataReader

    Public listOfFriends As List(Of FriendInList)
    Public listOfRequests As List(Of FriendInList)

    Public Class FriendInList

        Dim _id As String
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

        Public Property ID As String
            Get
                Return _id
            End Get
            Set(value As String)
                _id = value
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
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Public Function GetFriends(ByVal startPosition As Integer, ByVal HowMany As Object) As List(Of FriendInList)


        'changed the parameter to object so that we can count for the situation where all the friends are required.
        'need to change the second function in the same way.

        Dim Friends As String = ""
        listOfFriends = New List(Of FriendInList)()
        Dim count As Integer = 0
        Dim start As Integer = 0
        Dim requestedCount As Integer
        CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        CNN.Open()
        CMD = New SqlCommand("select Responder from Friendships where Requester=@email and isRequest='n'", CNN)
        CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        CMD.Parameters("@email").Value = User.Identity.Name

        If Not (HowMany.ToString() = "All") Then
            requestedCount = HowMany
        Else
            requestedCount = count + 1
        End If

        Result = CMD.ExecuteReader()
        While Result.HasRows() And count < requestedCount
            Try

                Result.Read()
                Friends += "'" + Result.GetValue(0) + "'" + ", "
                If start = startPosition Then
                    count += 1
                    If HowMany = "All" Then
                        requestedCount += 1
                    End If
                    Dim FF As New FriendInList
                    'FF = New FriendInList()
                    FF.Mail = Result.GetValue(0).ToString()
                    Try
                        If (FileIO.FileSystem.FileExists(Request.PhysicalApplicationPath + "Images\ProfileImages\T" + Result.GetValue(0).ToString() + ".jpg")) Then
                            FF.UserImage = "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg"
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


        Result.Close()
        CNN.Close()

        CNN.Open()

        CMD = New SqlCommand("select Requester from Friendships where Responder=@email and isRequest='n'", CNN)
        CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        CMD.Parameters("@email").Value = User.Identity.Name


        Result = CMD.ExecuteReader()



        While Result.HasRows() And count < requestedCount
            Try
                Result.Read()
                Friends += "'" + Result.GetValue(0) + "'" + ", "
                If start = startPosition Then
                    count += 1
                    If HowMany = "All" Then
                        requestedCount += 1
                    End If

                    Dim F As New FriendInList
                    'F = New FriendInList()
                    F.Mail = Result.GetValue(0).ToString()
                    F.UserImage = ""
                    Try
                        If Not (FileLen(Request.PhysicalApplicationPath + "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg") = 0) Then
                            F.UserImage = "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg"
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

        Result.Close()

        For Each U As FriendInList In listOfFriends

            CMD = New SqlCommand("select name,familly,code from Users where email=@mail ", CNN)
            CMD.Parameters.Add("@mail", SqlDbType.NVarChar, 128).Value = U.Mail
            Result = CMD.ExecuteReader
            Try
                While Result.HasRows()
                    Result.Read()
                    U.Name = Result.GetValue(0).ToString()
                    U.Name += " " + Result.GetValue(1).ToString()
                    U.ID = "Profile.aspx?id=" + Result.GetValue(2).ToString()
                End While
            Catch ex As Exception
                Exit Try
            End Try
            Result.Close()
        Next


        CNN.Close()
        CNN.Open()

        Return listOfFriends
    End Function


    'TODO: both get functions do similar jobs. make them one function.
    Public Function GetRequests(ByVal startPosition As Integer, ByVal HowMany As Integer) As List(Of FriendInList)

        Dim Friends As String = ""
        listOfRequests = New List(Of FriendInList)()
        Dim count As Integer = 0
        Dim start As Integer = 0
        CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        CNN.Open()
        CMD = New SqlCommand("select Responder from Friendships where Requester=@email and isRequest='y'", CNN)
        CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        CMD.Parameters("@email").Value = User.Identity.Name

        Result = CMD.ExecuteReader()

        While Result.HasRows() And count < HowMany
            Try

                Result.Read()
                Friends += "'" + Result.GetValue(0) + "'" + ", "
                If start = startPosition Then
                    count += 1

                    Dim FF As New FriendInList
                    'FF = New FriendInList()
                    FF.Mail = Result.GetValue(0).ToString()
                    Try
                        If Not (FileLen(Request.PhysicalApplicationPath + "Images\ProfileImages\T" + Result.GetValue(0).ToString() + ".jpg") = 0) Then
                            FF.UserImage = "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg"
                        End If
                    Catch ex As System.IO.FileNotFoundException
                        FF.UserImage = "ImgUserInProfile.jpg"
                    End Try
                    listOfRequests.Add(FF)
                Else
                    start += 1
                End If

            Catch ex As Exception
                Exit While
            End Try
        End While


        Result.Close()
        CNN.Close()

        CNN.Open()

        CMD = New SqlCommand("select Requester from Friendships where Responder=@email and isRequest='y'", CNN)
        CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        CMD.Parameters("@email").Value = User.Identity.Name


        Result = CMD.ExecuteReader()



        While Result.HasRows() And count < HowMany
            Try
                Result.Read()
                Friends += "'" + Result.GetValue(0) + "'" + ", "
                If start = startPosition Then
                    count += 1

                    Dim F As New FriendInList
                    'F = New FriendInList()
                    F.Mail = Result.GetValue(0).ToString()
                    F.UserImage = ""
                    Try
                        If Not (FileLen(Request.PhysicalApplicationPath + "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg") = 0) Then
                            F.UserImage = "Images/ProfileImages/T" + Result.GetValue(0).ToString() + ".jpg"
                        End If
                    Catch ex As System.IO.FileNotFoundException
                        F.UserImage = "ImgUserInProfile.jpg"
                    End Try
                    listOfRequests.Add(F)

                Else
                    start += 1
                End If

            Catch ex As Exception
                Exit While
            End Try
        End While

        Result.Close()

        For Each U As FriendInList In listOfRequests

            CMD = New SqlCommand("select name,familly,code from Users where email=@mail ", CNN)
            CMD.Parameters.Add("@mail", SqlDbType.NVarChar, 128).Value = U.Mail
            Result = CMD.ExecuteReader
            Try
                While Result.HasRows()
                    Result.Read()
                    U.Name = Result.GetValue(0).ToString()
                    U.Name += " " + Result.GetValue(1).ToString()
                    U.ID = "Profile.aspx?id=" + Result.GetValue(2).ToString()

                End While
            Catch ex As Exception
                Exit Try
            End Try
            Result.Close()
        Next


        CNN.Close()
        CNN.Open()

        Return listOfRequests
    End Function
End Class