Imports System.Data.SqlClient

Public Class Profile
    Inherits System.Web.UI.Page

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Dim Result As SqlDataReader
    Dim UserName As String = ""
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        Dim userCode As Integer
        If Request.QueryString("id") Is Nothing Then
            Response.End()
        Else
            userCode = Request.QueryString("id")
        End If
        CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        CNN.Open()
        CMD = New SqlCommand("SELECT email FROM Users WHERE code=@ID", CNN)
        CMD.Parameters.Add("@ID", SqlDbType.Int).Value = userCode
        UserName = CMD.ExecuteScalar()

        If UserName = User.Identity.Name Then
            Response.Redirect("MyProfile.aspx")
        End If

        Try
            CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
            CNN.Open()
            CMD = New SqlCommand("select * from Users where email=@email", CNN)
            CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
            CMD.Parameters("@email").Value = UserName
            Result = CMD.ExecuteReader()

            While (Result.HasRows())
                Try
                    Result.Read()

                    Literal1.Text = Result.GetValue(0).ToString()
                    Literal2.Text = Result.GetValue(1)

                Catch ex As Exception
                    Exit While
                End Try
            End While

            Result.Close()

            CMD = New SqlCommand("select * from Profiles where userID=@email", CNN)
            CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
            CMD.Parameters("@email").Value = UserName
            Result = CMD.ExecuteReader()

            While (Result.HasRows())
                Try
                    Result.Read()


                    Literal11.Text = Result.GetValue(1)
                    Literal4.Text = DirectCast(Result.GetValue(5), Date).ToString()
                    If Result.GetValue(4) = "m" Then
                        Literal3.Text = "آقا"
                    Else
                        Literal3.Text = "خانم"
                    End If
                    If Result.GetValue(8) = "s" Then
                        Literal8.Text = "مجرد"
                    Else
                        Literal8.Text = "متأهل"
                    End If
                    Literal12.Text = Result.GetValue(2).ToString()
                    Literal13.Text = Result.GetValue(10).ToString()
                    Literal14.Text = Result.GetValue(11).ToString()
                    Literal15.Text = Result.GetValue(12).ToString()
                    Literal7.Text = Result.GetValue(9).ToString()
                    Literal5.Text = Result.GetValue(6).ToString()
                    Literal6.Text = Result.GetValue(7).ToString()

                Catch ex As Exception
                    Exit While
                End Try
            End While
            Result.Close()

            Dim Asking As Boolean = True
            CMD = New SqlCommand("SELECT COUNT(*) FROM Friendships WHERE (Responder=@user AND Requester=@visitor) OR (Responder=@visitor AND Requester=@user)", CNN)
            CMD.Parameters.Add("@user", SqlDbType.NVarChar, 128).Value = UserName
            CMD.Parameters.Add("@visitor", SqlDbType.NVarChar, 128).Value = User.Identity.Name

            If CMD.ExecuteScalar() = 0 Then
                Accept.AlternateText = "پیشنهاد"
            Else
                CMD = New SqlCommand("SELECT isRequest,Responder FROM Friendships WHERE (Responder=@user AND Requester=@visitor) OR (Responder=@visitor AND Requester=@user)", CNN)
                CMD.Parameters.Add("@user", SqlDbType.NVarChar, 128).Value = UserName
                CMD.Parameters.Add("@visitor", SqlDbType.NVarChar, 128).Value = User.Identity.Name
                Result = CMD.ExecuteReader()

                Try
                    While Result.HasRows()
                        Result.Read()
                        If Result.GetValue(1).ToString() = UserName Then
                            Asking = True
                        Else
                            Asking = False
                        End If

                        If Asking Then
                            If Result.GetValue(0) = "d" Then
                                Accept.AlternateText = "پیشنهاد مجدد"
                            ElseIf Result.GetValue(0) = "y" Then
                                Accept.AlternateText = "درانتظار پاسخ"
                                Accept.Enabled = False
                            ElseIf Result.GetValue(0) = "n" Then
                                Accept.AlternateText = "ارسال پیام"
                            End If
                        Else
                            If Result.GetValue(0) = "d" Then
                                Accept.AlternateText = "پذیرفتن"
                                'ability to block here^
                            ElseIf Result.GetValue(0) = "y" Then
                                Accept.AlternateText = "پذیرفتن پیشنهاد"
                                ImageButton1.AlternateText = "رد پیشنهاد"
                                ImageButton1.Visible = True
                                ImageButton1.Enabled = True
                            ElseIf Result.GetValue(0) = "n" Then
                                Accept.AlternateText = "ارسال پیام"
                            End If
                        End If



                    End While
                Catch ex As Exception
                    Exit Try
                End Try
            End If


            CNN.Close()


        Catch ex As Exception
            Exit Try
        End Try

    End Sub

    Protected Sub Accept_Click(sender As Object, e As ImageClickEventArgs)

        If Accept.AlternateText = "پیشنهاد" Then

            CNN.Open()
            CMD = New SqlCommand("INSERT INTO Friendships (Requester, Responder, isRequest) VALUES(@me,@other,'y')", CNN)
            CMD.Parameters.Add("@me", SqlDbType.NVarChar, 128).Value = User.Identity.Name
            CMD.Parameters.Add("@other", SqlDbType.NVarChar, 128).Value = UserName
            CMD.ExecuteScalar()
            CNN.Close()

        ElseIf Accept.AlternateText = "پیشنهاد مجدد" Then
            CNN.Open()
            CMD = New SqlCommand("UPDATE Friendships SET isRequest='y' WHERE (Requester=@me AND Responder=@other)", CNN)
            CMD.Parameters.Add("@me", SqlDbType.NVarChar, 128).Value = User.Identity.Name
            CMD.Parameters.Add("@other", SqlDbType.NVarChar, 128).Value = UserName
            CMD.ExecuteScalar()
            CNN.Close()
        ElseIf Accept.AlternateText = "پذیرفتن" Then
            CNN.Open()
            CMD = New SqlCommand("UPDATE Friendships SET isRequest='n' WHERE (Requester=@other AND Responder=@me)", CNN)
            CMD.Parameters.Add("@me", SqlDbType.NVarChar, 128).Value = User.Identity.Name
            CMD.Parameters.Add("@other", SqlDbType.NVarChar, 128).Value = UserName
            CMD.ExecuteScalar()
            CNN.Close()
        ElseIf Accept.AlternateText = "پذیرفتن" Then
            CNN.Open()
            CMD = New SqlCommand("UPDATE Friendships SET isRequest='n' WHERE (Requester=@other AND Responder=@me)", CNN)
            CMD.Parameters.Add("@me", SqlDbType.NVarChar, 128).Value = User.Identity.Name
            CMD.Parameters.Add("@other", SqlDbType.NVarChar, 128).Value = UserName
            CMD.ExecuteScalar()
            CNN.Close()
        End If
        Response.Redirect("Profile.aspx?id=" + Request.QueryString("id"))
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        CNN.Open()
        CMD = New SqlCommand("UPDATE Friendships SET isRequest='d' WHERE (Requester=@other AND Responder=@me)", CNN)
        CMD.Parameters.Add("@me", SqlDbType.NVarChar, 128).Value = User.Identity.Name
        CMD.Parameters.Add("@other", SqlDbType.NVarChar, 128).Value = UserName
        CMD.ExecuteScalar()
        CNN.Close()
        Response.Redirect("Profile.aspx?id=" + Request.QueryString("id"))
    End Sub
End Class