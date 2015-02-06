Imports System.Data.SqlClient

Public Class Chat
    Inherits BaseMainMaster

    Dim CNN As SqlConnection
    Dim cmd As SqlCommand

    Protected Overloads Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Literal1.Text = User.Identity.Name.Replace("@", "").Replace(".", "")
        'Literal1.Text = "alisafaei1990outlookcom"
        'get the pass word of the user.
        'Literal1: User
        'Literal3: Password -> Later: change this so that the password needs to be entered here. instead of bein here as the result of tht query.
        'Literal3: 
        CNN = New SqlConnection(ConfigurationManager.ConnectionStrings("DBConnection").ConnectionString)
        CNN.Open()
        cmd = New SqlCommand("SELECT pass FROM Users WHERE email=@mail", CNN)
        cmd.Parameters.Add("@mail", SqlDbType.NVarChar, 128).Value = User.Identity.Name
        Literal3.Text = cmd.ExecuteScalar()
        CNN.Close()
        'literal2.text should be the name of the person who we are calling.
        Literal2.Text = "pooresibzamini"
        'other.InnerText = "pooresibzamini"
        'Heloo there

        Dim friendList As List(Of FriendInList)
        'displays five friends:
        friendList = GetFriends(0, 5)

        FriendsInMain.DataSource = friendList
        FriendsInMain.DataBind()

        ' Literal1.Text = "test456"
        ' Literal2.Text = "بابک باب"
        'Literal3.Text = 123456
    End Sub

End Class