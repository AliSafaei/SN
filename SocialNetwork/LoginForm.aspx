<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LoginForm.aspx.vb" Inherits="SocialNetwork.LoginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <ul>
                <li id="Logo">LOGO</li>
                <li class="Login"><asp:TextBox ID="EmailL" runat="server"></asp:TextBox> : ایمیل</li>
                <li class="Login"><asp:TextBox ID="PasswordL" TextMode="Password" runat="server"></asp:TextBox> : رمز عبور</li>
                <li class="Login"><asp:ImageButton ID="EnterButton" runat="server" /></li>
            </ul>
    </div>
    </form>
</body>
</html>
