Imports System.Data.SqlClient
Imports System.Drawing.Image
Imports System.Drawing

Public Class EditMyProfile
    Inherits System.Web.UI.Page

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Dim Result As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '___________________________

        Try
            If Session.Item("Change") Is Nothing Then
                CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
                CNN.Open()
                CMD = New SqlCommand("select * from Users where email=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = User.Identity.Name
                Result = CMD.ExecuteReader()

                While (Result.HasRows())
                    Try
                        Result.Read()

                        TextBox1.Text = Result.GetValue(0).ToString()
                        TextBox2.Text = Result.GetValue(1)

                    Catch ex As Exception
                        Exit While
                    End Try
                End While

                Result.Close()

                CMD = New SqlCommand("select * from Profiles where userID=@email", CNN)
                CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
                CMD.Parameters("@email").Value = User.Identity.Name
                Result = CMD.ExecuteReader()

                While (Result.HasRows())
                    Try
                        Result.Read()


                        TextBox11.Text = Result.GetValue(1)
                        Calendar1.SelectedDate = DirectCast(Result.GetValue(5), Date)
                        Calendar1.VisibleDate = DirectCast(Result.GetValue(5), Date)
                        If Result.GetValue(4) = "m" Then
                            RadioButton4.Checked = True
                        Else
                            RadioButton3.Checked = True
                        End If
                        If Result.GetValue(7) = "s" Then
                            RadioButton2.Checked = True
                        Else
                            RadioButton1.Checked = True
                        End If
                        TextBox15.Text = Result.GetValue(2).ToString()
                        TextBox12.Text = Result.GetValue(10).ToString()
                        TextBox13.Text = Result.GetValue(11).ToString()
                        TextBox14.Text = Result.GetValue(12).ToString()
                        TextBox7.Text = Result.GetValue(9).ToString()
                        TextBox5.Text = Result.GetValue(6).ToString()
                        TextBox6.Text = Result.GetValue(7).ToString()
                        'Master.ProfileImage = "Images/ProfileImages/T" + Result.GetValue(13).ToString()

                    Catch ex As Exception
                        Exit While
                    End Try
                End While

                CNN.Close()
                Session.Add("Change", "Me")
            End If

        Catch ex As Exception
            Exit Try
        End Try

        
    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As EventArgs) Handles ImageButton1.ServerClick
        Try

            CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
            CNN.Open()
            CMD = New SqlCommand("update Users set name=@name,familly=@family where email=@email", CNN)
            CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
            CMD.Parameters("@email").Value = User.Identity.Name
            CMD.Parameters.Add("@name", SqlDbType.NVarChar, 50)
            CMD.Parameters("@name").Value = TextBox1.Text
            CMD.Parameters.Add("@family", SqlDbType.NVarChar, 50)
            CMD.Parameters("@family").Value = TextBox2.Text
            CMD.ExecuteScalar()

            CMD = New SqlCommand("update Profiles set job=@job,gender=@gender,birthday=@birthday,marritalStatus=@m,skills=@skills,homeTown=@hometown,currentTown=@currenttown,aboutMe=@aboutme,school=@school,highschool=@highschool,university=@university where userID=@email", CNN)
            CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
            CMD.Parameters("@email").Value = User.Identity.Name
            CMD.Parameters.Add("@job", SqlDbType.Text)
            CMD.Parameters("@job").Value = TextBox11.Text
            CMD.Parameters.Add("@gender", SqlDbType.Char)
            If RadioButton4.Checked() Then
                CMD.Parameters("@gender").Value = "m"
            Else
                CMD.Parameters("@gender").Value = "f"
            End If

            CMD.Parameters.Add("@birthday", SqlDbType.Date)
            CMD.Parameters("@birthday").Value = Calendar1.SelectedDate
            CMD.Parameters.Add("@m", SqlDbType.Char)

            If RadioButton1.Checked() Then
                CMD.Parameters("@m").Value = "m"
            Else
                CMD.Parameters("@m").Value = "s"
            End If

            CMD.Parameters.Add("@skills", SqlDbType.Text).Value = TextBox15.Text
            CMD.Parameters.Add("@hometown", SqlDbType.NVarChar, 50).Value = TextBox5.Text
            CMD.Parameters.Add("@currenttown", SqlDbType.NVarChar, 50).Value = TextBox6.Text
            CMD.Parameters.Add("@school", SqlDbType.NVarChar, 50).Value = TextBox12.Text
            CMD.Parameters.Add("@aboutme", SqlDbType.NVarChar, 200).Value = TextBox7.Text
            CMD.Parameters.Add("@highschool", SqlDbType.NVarChar, 50).Value = TextBox13.Text
            CMD.Parameters.Add("@university", SqlDbType.NVarChar, 50).Value = TextBox14.Text
            CMD.ExecuteScalar()
            CNN.Close()


            If FileUpload.HasFile Then
                Dim fileExt As String = System.IO.Path.GetExtension(FileUpload.FileName)
                If fileExt = ".jpg" Or fileExt = ".png" Or fileExt = ".jpeg" Then
                    Dim Path As String = "Images\ProfileImages\" + User.Identity.Name

                    If System.IO.File.Exists(MapPath(Path + ".jpg")) Then
                        System.IO.File.Delete(MapPath(Path + ".jpg"))

                        Path = "Images\ProfileImages\T" + User.Identity.Name
                        System.IO.File.Delete(MapPath(Path + ".jpg"))
                    End If
                    If System.IO.File.Exists(MapPath(Path + ".png")) Then
                        System.IO.File.Delete(MapPath(Path + ".png"))
                        Path = "Images\ProfileImages\T" + User.Identity.Name
                        System.IO.File.Delete(MapPath(Path + ".png"))

                    End If
                    If System.IO.File.Exists(MapPath(Path + ".jpeg")) Then
                        System.IO.File.Delete(MapPath(Path + ".jpeg"))
                        Path = "Images\ProfileImages\T" + User.Identity.Name
                        System.IO.File.Delete(MapPath(Path + ".jpeg"))
                    End If
                    Path = "Images\ProfileImages\" + User.Identity.Name + fileExt
                    FileUpload.SaveAs(MapPath(Path))

                    Dim BM As Bitmap = System.Drawing.Image.FromFile(MapPath(Path))
                    Path = "Images\ProfileImages\T" + User.Identity.Name + fileExt
                    'ThumbNail Size: 50,50
                    Dim Thumbnail As Image = BM.GetThumbnailImage(200, 200, New GetThumbnailImageAbort(AddressOf CallBa), IntPtr.Zero)
                    Thumbnail.Save(MapPath(Path))
                Else
                    'delete the file.. or reject the process
                    'notify the user that she can only use the jpeg, and png files for her profile image.
                End If
            End If
            Session.Remove("Change")
            Response.Redirect("MyProfile.aspx")

        Catch ex As Exception
            Exit Try
        End Try

    End Sub

    'Protected Sub FileUpload_UploadComplete(sender As Object, e As AjaxControlToolkit.AjaxFileUploadEventArgs) Handles FileUpload.UploadComplete

    '        'todo: only allows jpeg files for profile pictures.
    '    Dim Path As String = "Images\/ProfileImages\/" + User.Identity.Name + e.ContentType
    '        FileUpload.SaveAs(MapPath(Path))

    '        Dim BM As Bitmap = System.Drawing.Image.FromFile(MapPath(Path))
    '    Path = "Images\/ProfileImages\/T" + User.Identity.Name + e.ContentType
    '        'ThumbNail Size: 50,50
    '    Dim Thumbnail As Image = BM.GetThumbnailImage(200, 200, New GetThumbnailImageAbort(AddressOf CallBa), IntPtr.Zero)
    '        Thumbnail.Save(MapPath(Path))


    'End Sub

    Public Function CallBa as Boolean
        Return False
    End Function

End Class