<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProfileEdit.aspx.vb" Inherits="SocialNetwork.ProfileEdit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Style.css" rel="stylesheet" />
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {
            $('ul.tabNavigation').each(function () {
                var $active, $content, $links = $(this).find('a');
                $active = $($links.filter('[href="' + location.hash + '"]')[0] || $links[0]);
                $active.addClass('active');
                $content = $($active.attr('href'));

                $links.not($active).each(function () {
                    $($(this).attr('href')).hide();
                });

                // Bind the click event handler
                $(this).on('click', 'a', function (e) {
                    $active.removeClass('active');
                    $content.hide("slow");
                    $active = $(this);
                    $content = $($(this).attr('href'));
                    $active.addClass('active');
                    $content.show("slow");
                    e.preventDefault();
                });
            });
        });

    </script> 
    <script type="text/javascript">
        function update(id) {
            var dataToSend = {
                "Mail": $("#Mail").val(),
                "Name": $("#TextBox1").val(),
                "Family":$("#TextBox2").val(),
                "Job":$("#TextBox1").val(),
                "Birthday": $("#TextBox1").val(),
                "Gender":$("#TextBox1").val(),
                "MarritalStatus":$("#TextBox1").val(),
                "HomeTown":$("#TextBox1").val(),
                "CurrentTown":$("#TextBox1").val(),
                "School":$("#TextBox1").val(),
                "Highschool":$("#TextBox1").val(),
                "Skills":$("#TextBox1").val(),
                "University":$("#TextBox1").val(),
                "AboutMe":$("#TextBox1").val(),
            }

            $.ajax(
            {
                type: "POST",
                async: true,
                url: 'ProfileEdit.aspx',
                data: "",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    console.log("SUCCESS:" + msg);

                },
                error: function (msg) {
                    console.log("error:" + msg);
                }
            });
        }
    </script>    
    <title>Profile</title>
</head>
<body>
    <form id="Form1" runat="server">

    <div id="Header">
        <div class="LeftPartOfHeader">
            <asp:ImageButton ID="ImgLogo" CssClass="ImgButtons" src="../ImgLogo.png"  Width="100px" Height="20px" runat="server" />
            <asp:ImageButton ID="ImgMessage" CssClass="ImgButtons" src="../ImgMessage.png" Width="20px" Height="20px" runat="server" />
            <asp:ImageButton ID="ImgFriend" CssClass="ImgButtons" src="../ImgFriend.png" Width="20px" Height="20px" runat="server" />
        </div>
        <div class="RightPartOfHeader">
            <asp:LinkButton id="UserName" CssClass="Buttons" runat="server"><asp:Literal ID="userNameText" runat="server"></asp:Literal></asp:LinkButton>
            <asp:ImageButton ID="ImgMore" CssClass="ImgButtons" src="../ImgMore.png" Width="20px" Height="20px" runat="server" />
        </div>
    </div>         

    <div id="SubHeader">
        <div class="RightPartOfHeader">
                <table style="float:left;text-align:right;margin-top:7px;">
                    <tr class="ImgButtons"><td>حسین لطیفی</td><th><asp:ImageButton src="../ImgUserName.png" Width="12px" Height="12px" runat="server" /></th></tr>
                    <tr class="ImgButtons"><td>آمل</td><th><asp:ImageButton src="../ImgUserCity.png" Width="12px" Height="12px" runat="server" /></th></tr>
                    <tr class="ImgButtons"><td>کارشناس کامپیوتر</td><th><asp:ImageButton src="../ImgUserJob.png" Width="12px" Height="12px" runat="server" /></th></tr>
                </table>
                <asp:Image ID="ImgUserProfile" src="../ImgUserPicture.jpg" Width="100px" Height="100px" runat="server" />
        </div>
        <div class="LeftPartOfHeader">
            <div>
                <table>
                    <tr style="background-color:#000000; color:#ffffff;">
                        <th><asp:ImageButton class="ImgButtons" ID="ViewUserPicture" src="../ImgViewUserPicture.png" Width="30px" Height="20px" runat="server" /></th>
                        <td style="text-align:right; border-left:5px solid #c9e802; border-right:2px solid #c9e802; opacity:0.6;">عکس ها</td>
                    </tr>
                    <tr style="background-color:#000000; color:#ffffff;">
                        <th><asp:ImageButton class="ImgButtons" ID="ViewUserInfo" src="../ImgViewUserInfo.png" Width="30px" Height="20px" runat="server" /></th>
                        <td style="text-align:right; border-left:5px solid #c9e802; border-right:2px solid #c9e802; opacity:0.6;">پروفایل</td>
                    </tr>
                    <tr style="background-color:#000000; color:#ffffff;">
                        <th><asp:ImageButton class="ImgButtons" ID="AddToFriendList" src="../ImgAddToFriendList.png" Width="30px" Height="20px" runat="server" /></th>
                        <td style="text-align:right; border-left:5px solid #c9e802; border-right:2px solid #c9e802; opacity:0.6;">پیشنهاد</td>
                    </tr>
                </table>
            </div>
        </div>        
    </div>
<div id="ColL">
        <div id="Search">
            <h6 style="background-color:#000000;color:#ffffff;">جستجوی دوستان و گروه ها    <asp:Image src="../ImgSearch.png" Width="20px" Height="10px" runat="server" /></h6>
            <table class="RightColTable">
                <tr>
                    <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
                </tr>
                <tr>
                    <asp:LinkButton CssClass="SubmitButtons" ID="SearchButton" runat="server">جستجو</asp:LinkButton>
                </tr>
            </table>
        </div>
        <div id="FriendSuggestion">
            <h6 style="background-color:#000000;color:#ffffff;">دوستان پیشنهادی    <asp:Image src="../ImgSuggestFriend.png" Width="20px" Height="20px" runat="server" /></h6>
            <table class="RightColTable">
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"><asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">دوست پیشنهادی اول</td>
                    <th class="FriendsMemberH"><asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"><asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">دوست پیشنهادی دوم</td>
                    <th class="FriendsMemberH"><asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"><asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">دوست پیشنهادی سوم</td>
                    <th class="FriendsMemberH"><asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
            </table>
        </div>
        <div id="GroupSuggestion">
            <h6 style="background-color:#000000;color:#ffffff;">گروه های پیشنهادی    <asp:Image src="../ImgSuggestGroup.png" Width="20px" Height="20px" runat="server" /></h6>
            <table class="RightColTable">
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"><asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">گروه پیشنهادی اول</td>
                    <th class="FriendsMemberH"><asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"><asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">گروه پیشنهادی دوم</td>
                    <th class="FriendsMemberH"><asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"><asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">گروه پیشنهادی سوم</td>
                    <th class="FriendsMemberH"><asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
            </table>
        </div>
    </div>          
    <div id="ShowInfo" style="text-align:center;margin-bottom:4px;" >


           	<div id="Introduction">
            <h6 style="background-color:#000000;color:#ffffff;">معرفی<asp:ImageButton ID="ImageButton1" runat="server" AlternateText="اعمال تغییرات" OnClick="ImageButton1_Click" />
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : نام</th>
                </tr>
                <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;</td>
                    <th> : نام خانولدگی</th>
                </tr>
                <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <p>
                                <asp:RadioButton ID="RadioButton3" runat="server" GroupName="1" Text="آقا" />
                                <asp:RadioButton ID="RadioButton4" runat="server" GroupName="1" Text="خانم" />
                            </p>
    &nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: جنسیت</th>
                </tr>
                    <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="300px" Style="margin-top: 28px">
                                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                                        <OtherMonthDayStyle ForeColor="#999999" />
                                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                                        <TodayDayStyle BackColor="#CCCCCC" />
                                    </asp:Calendar>

                                </ContentTemplate>
                            </asp:UpdatePanel>
                             
    &nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: تاریخ تولد</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                               
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : مکان تولد</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : محل سکونت</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                                
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : درباره من</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p>
                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="1" Text="متأهل" />
                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="1" Text="مجرد" />
                            </p>
                               
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th>: وضعیت تاهل</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th>: خانواده ام</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;  
                     </td>
                    <th> : دوستان صمیمی</th>
                </tr>
            </table>
            </div>
            <div id="Study">
            <h6 style="background-color:#000000;color:#ffffff;">تحصیلات<asp:ImageButton ID="ImageButton5" runat="server" AlternateText="ایجاد تغییر"/>
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: نام دبستان</th>
                </tr>
                <tr>
                    <td> <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : نام دبیرستان</th>
                </tr>
                <tr>
                    <td><asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : دانشگاه</th>
                </tr>
            </table>
            </div>
	        <div id="Job">
            <h6 style="background-color:#000000;color:#ffffff;">شغل<asp:ImageButton ID="ImageButton6" runat="server" AlternateText="ایجاد تغییر"/>
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; 
                        <%-- فلان شغل در فلان جا با فلانی --%>
                    </td>
                    <th>: نام شغل</th>
                </tr>
            </table>
            </div>
	       <div id="Skills">
            <h6 style="background-color:#000000;color:#ffffff;">مهارتهای من<asp:ImageButton ID="ImageButton7" runat="server" AlternateText="ایجاد تغییر"/>
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp; 
                            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: نام مهارت</th>
                </tr>
            </table>
            </div>
	       <div id="Picture">
            <h6 style="background-color:#000000;color:#ffffff;">آلبوم های من</h6>
            <table>
                <tr>
                    <td>

                    </td>
                    <th>

                    </th>
                </tr>
                <tr>
                    <td>

                    </td>
                    <th>

                    </th>
                </tr>
                <tr>
                    <td>

                    </td>
                    <th>

                    </th>
                </tr>
            </table>
        </div>
	    <div id="MyPosts">
            <h6 style="background-color:#000000;color:#ffffff;">پستهای ارسالی من</h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>

                    </td>
                    <th>

                    </th>
                </tr>
            </table>
        </div>
	    <div id="Friends">
            <h6 style="background-color:#000000;color:#ffffff;">پستهای ارسالی من>دوستانم</h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>

                    </td>
                    <th>

                    </th>
                </tr>
            </table>
        </div>
	    <div id="Favorites">
            <h6 style="background-color:#000000;color:#ffffff;">علاقه مندیهایم</h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>
                        <p>: فیلم و سریال</p>
                        <%-- نام فیلم و سریال --%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>: موسیقی</p>
                        <%-- نام گروه یا شخس --%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>: کتاب</p>
                        <%-- عناوین کتب --%>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>: سایر علاقه مندیها</p>
                        <%-- عنوان تفریح یا مهارت یا هرچیز دیگر جذاب --%>
                    </td>
                </tr>
            </table>
        </div>
        </div>
        <div id="ColR">
        <div id="TabOfProfile" >
            <h6 style="background-color:#000000;color:#ffffff;">مرا بشناسید</h6>
            <ul class="tabNavigation">
                <li class="Vertical"><a href="#Introduction">Introduction</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton8" runat="server" /></li>
                <li class="Vertical"><a href="#Study">Study</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton9" runat="server" /></li>
                <li class="Vertical"><a href="#Job">Job</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton10" runat="server" /></li>
                <li class="Vertical"><a href="#Skills">Skills</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton11" runat="server" /></li>
                <li class="Vertical"><a href="#Picture">Pictures</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton12" runat="server" /></li>
                <li class="Vertical"><a href="#MyPosts" onclick="update(1)">Posts</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton13" runat="server" /></li>
                <li class="Vertical"><a href="#Friends">Friends</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton14" runat="server" /></li>
                <li class="Vertical"><a href="#Favorites">Favorites</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImageButton15" runat="server" /></li>
            </ul>
            <asp:TextBox ID="mail" runat="server"></asp:TextBox>
        </div>
    </div>
    <div id="Footer">
        <div id="TopContentOfFooter">
            <div id="Col1" class="FooterContent">
                <h3>ارتباط بیشتر</h3>
                <hr />
                <ul>
                    <li class="FooterList">تماس با ما</li>
                    <li class="FooterList">راهنمای سایت</li>
                </ul>
            </div>
            <div id="Col2" class="FooterContent">
                <h3>بیشتر بدانید</h3>
                <hr />
                <ul>
                    <li class="FooterList">سوالات متداول</li>
                    <li class="FooterList">قوانین سایت</li>
                    <li class="FooterList">اطمینان از دریافت ایمیل ها</li>
                </ul>
            </div>
            <div id="Col3" class="FooterContent">
                <h3>سایر خدمات</h3>
                <hr />
                <ul>
                    <li class="FooterList">تماس با واحد پشتیبانی</li>
                </ul>
            </div>
        </div>
        <div id="CenterContentOfFooter"><hr /></div>
        <div id="BottomContentOfFooter">
            <div id="Col4" class="FooterContent">
                <p>کلیه حقوق این اثر متعلق به شرکت ایکس است.</p>
            </div>
            <div id="Col5" class="FooterContent">
                
            </div>
            <div id="Col6" class="FooterContent">
                
            </div>
        </div>
    </div> 
    </form>
    
</body>
</html>
