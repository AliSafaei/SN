Imports System.Data.SqlClient

Public Class MyProfile
    Inherits System.Web.UI.Page

    Dim CNN As SqlConnection
    Dim CMD As SqlCommand
    Dim Result As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '___________________________

        Try
            CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
            CNN.Open()
            CMD = New SqlCommand("select * from Users where email=@email", CNN)
            CMD.Parameters.Add("@email", SqlDbType.NVarChar, 128)
            CMD.Parameters("@email").Value = User.Identity.Name
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
            CMD.Parameters("@email").Value = User.Identity.Name
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

            CNN.Close()


        Catch ex As Exception
            Exit Try
        End Try
        

    End Sub

    Protected Sub ImageButton1_Click(sender As Object, e As EventArgs) Handles ImageButton1.ServerClick
        Response.Redirect("EditMyProfile.aspx")
    End Sub
End Class