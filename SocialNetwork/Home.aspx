<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Home.aspx.vb" Inherits="SocialNetwork.Home" MasterPageFile="~/Site.Master" %>

<asp:Content ID="Hi" ContentPlaceHolderID="head" runat="server">
    <script>

        function flip()
        {
            $("#hey").toggleClass("flip");
        }

        
    </script>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        #RegisterButton {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="hey" class="flip-container">
        <div class="flipper">
            <div class="front">
                <h6 style="background-color: #000000; color: #ffffff;">ورود</h6>
                    <table id="login" cellspacing="5">
                        <tr>
                            <td>
                                <asp:TextBox ID="EmailL" runat="server"></asp:TextBox>
                            </td>
                            <th>: ایمیل</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="PasswordL" TextMode="Password" runat="server"></asp:TextBox>
                            </td>
                            <th>: رمز عبور</th>
                        </tr>
                        <tr>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a runat="server" class="SubmitButtons" id="EnterButton" >ورود</a>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a href="#" class="SubmitButtons flipping" onclick="flip()">ثبت نام</a>
                            </td>
                        </tr>
                    </table>
            </div>
            <div class="back">
                    <h6 style="background-color: #000000; color: #ffffff;">ثبت نام</h6>
                    <table id="register" cellspacing="7">
                        <tr>
                            <td>
                                <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                            </td>
                            <th>: نام</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="FamilyName" runat="server"></asp:TextBox></td>
                            <th>: نام خانوادگی</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="EmailR" runat="server"></asp:TextBox>
                            </td>
                            <th>:ایمیل</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
                            </td>
                            <th>: شماره همراه</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="PasswordR" TextMode="Password" runat="server"></asp:TextBox>

                            </td>
                            <th>: رمز عبور</th>
                        </tr>
                        <tr>
                            <td class="auto-style1" colspan="2">
                                <asp:CheckBox ID="UserNameR" runat="server" />
                                با قوانین و مقررات سایت کاملا موافقم
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><a class="SubmitButtons" id="RegisterButton" runat="server">ثبت نام</a>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a href="#" class="SubmitButtons flipping" onclick="flip()">ورود</a></td>
                        </tr>
                    </table>
            </div>
        </div>

    </div>
    <asp:Literal ID="SipReg" runat="server"></asp:Literal>
</asp:Content>
