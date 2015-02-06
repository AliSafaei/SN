Imports System.Data.SqlClient

Public Class Friends
    Inherits BaseMainMaster

    Overloads Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        'in main.aspx : inherit the same class
        'for each items in the list add the mail property to the string 
        'then at the end add the user mail to the string.


        Dim requests As List(Of FriendInList) = GetRequests(0, 10)
        Repeater2.DataSource = requests
        Repeater2.DataBind()

        Dim friends As List(Of FriendInList) = GetFriends(0, 10)
        Repeater1.DataSource = friends
        '[me].OnClientClick = "ShowMore(" + friends.Count().ToString() + ")"
        Repeater1.DataBind()
    End Sub

End Class