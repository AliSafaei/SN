Imports System.Data.SqlClient


Public Class ProfileEdit
    Inherits System.Web.UI.Page

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Dim Result As SqlDataReader
    Public Mail As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Mail = User.Identity.Name

        'CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        'CNN.Open()
        'CMD = New SqlCommand("select * from Users where email=@email", CNN)
        'CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
        'CMD.Parameters("@email").Value = User.Identity.Name
        'Result = CMD.ExecuteReader()

        'While (Result.HasRows())
        '    Try
        '        Result.Read()
        '        userNameText.Text = Result.GetValue(0).ToString()

        '    Catch ex As Exception
        '        Exit While
        '    End Try
        'End While
        
    End Sub

    Protected Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs) Handles RadioButton1.CheckedChanged

    End Sub


    Protected Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs) Handles ImageButton1.Click
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
        CMD.Parameters.Add("@m", SqlDbType.NVarChar, 128)

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

        Response.Redirect("Profile.aspx")
        CNN.Close()

    End Sub
End Class