<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ProfilesMain.aspx.vb" Inherits="SocialNetwork.ProfilesMain" %>

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Profile.aspx.vb" Inherits="SocialNetwork.Profile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

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

    
    <title>Profile</title>
    <link href="style.css" type="text/css" rel="stylesheet"/>
</head>
<body> 
    <form id="frmProfile" runat="server">
	    <div id="header">
            <p id="Logo">LOGO</p>
        	<div id="Notification">    
        		<ul>
        			<li><asp:ImageButton ID="MessageButton" runat="server" /></li>    
        			<li><asp:ImageButton ID="NotificationButton" runat="server" /></li>        
        			<li><asp:ImageButton ID="FriendButton" runat="server" /></li>
                    <li><asp:ImageButton CssClass="PopUp" ID="MenuButton" runat="server" /></li>  
       			</ul>  
        	</div> 
        </div>
         
  
       <div id="ShowInfo" >


           	<div id="Introduction">
            <h3>معرفی</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="Name">
                        <p>&nbsp;<asp:Literal ID="Literal1" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : نام</p>
                        <%-- نام کوچک --%>
                        <asp:ImageButton CssClass="ImgEdit"  ID="ChangeName" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="LastName">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal2" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : نام خانولدگی</p>
                        <%-- نام خانوادگی --%>
                        <asp:ImageButton CssClass="ImgEdit"  ID="ChangeLastName" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="Gender">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal3" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : جنسیت</p>
                        <%-- جنسیت --%>
                        <asp:ImageButton CssClass="ImgEdit"  ID="ChangeGender" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="Birthday">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal4" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : تاریخ تولد</p>
                        <%-- تاریخ تولد--%>
                        <asp:ImageButton CssClass="ImgEdit"  ID="ChangeBirthday" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="BornAt">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal5" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : مکان تولد</p>
                        <%-- متولد کدام مکان --%>
                        <asp:ImageButton CssClass="ImgEdit"  ID="ChangeBornAt" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="Habitat">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal6" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : محل سکونت</p>
                        <%-- محل سکونت فعلی --%>
                        <asp:ImageButton CssClass="ImgEdit"  ID="ChangeHabitat" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="AboutMe">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal7" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : درباره من</p>
                        <%--درباره من --%>
                        <asp:ImageButton CssClass="ImgEdit"  ID="ChangeAboutMe" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="Relationship">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal8" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : وضعیت تاهل</p>
                        <%--متاهل ، مجرد --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddRelationship" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="FamiliesMembers">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal9" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : خانواده ام</p>
                        <%--افراد خانواده --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddFamily" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="CloseFriends">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal10" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : دوستان صمیمی</p>
                        <%--دوستان صمیمی --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddCloseFriend" runat="server" />
                    </div>
                </li>
            </ul>
            </div>
            <div id="Study">
            <h3>تحصیلات</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="School">
                        <p>: نام دبستان</p>
                        <%-- مدرسه ابتدایی فلان در فلان جا و فلان مکان با فلانی --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="ChangeSchool" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="HighSchool">
                        <p>: نام دبیرستان</p>
                        <%-- دبیرستان فلان و فلان و فلان --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="ChangeHighSchool" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="University">
                        <p>: دانشگاه</p>
                        <%-- دانشگاه فلان دانشکده فلا در سلا فلا و در فلان ج ا  با فلانی --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddUniversity" runat="server" />
                    </div>
                </li>
            </ul>
        </div>
	    <div id="Job">
            <h3>شغل</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="NameOfJob">
                        <p>&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal11" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; : نام شغل</p>
                        <%-- فلان شغل در فلان جا با فلانی --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddJob" runat="server" />
                    </div>
                </li>
            </ul>
        </div>
	    <div id="Skills">
            <h3>مهارتهای من</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="TitleOfSkill">
                        <p>&nbsp;&nbsp;&nbsp;&nbsp; : نام مهارت</p>
                        <%-- فلان مهارت را از فلان جا با فلانی کسب کردهام --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddSkill" runat="server" />
                    </div>
                </li>
            </ul>
        </div>
	    <div id="Picture">
            <h3>آلبوم های من</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="Albumes">
                        <p>: آلبوم ها</p>
                        <%-- فلان آلبوم در فلان جا با فلانی --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddAlbume" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="OtherPics">
                        <p>: عکسهای متفرقه</p>
                        <%-- فلان آلبوم در فلان جا با فلانی --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddOtherPics" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="OfferPics">
                        <p>: عکسهای تقدیمی</p>
                        <%-- فلان عکس تقدیم به فلانی --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddOfferPics" runat="server" />
                    </div>
                </li>
            </ul>
        </div>
	    <div id="Posts">
            <h3>پستهای ارسالی من</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="ShowingPosts">
                        <p>: نمایش پستهای ارسالی من ، بر اساس تاریخ</p>
                        <%-- تمام پستها را بر اساس تاریخ نشان دهد --%>
                    </div>
                </li>
            </ul>
        </div>
	    <div id="Friends">
            <h3>دوستانم</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="ShowingFriends">
                        <p>: دوستان</p>
                        <%-- نمایش هر دوست با این مشخصات : فلانی متولد فلان از فلان جا --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddFriend" runat="server" />
                    </div>
                </li>
            </ul>
        </div>
	    <div id="Favorites">
            <h3>علاقه مندیهایم</h3>
            <ul>
                <li class="ClassOfPrimp">
                    <div id="Film">
                        <p>: فیلم و سریال</p>
                        <%-- نام فیلم و سریال --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddFilm" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="Music">
                        <p>: موسیقی</p>
                        <%-- نام گروه یا شخس --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddMusic" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="Book">
                        <p>: کتاب</p>
                        <%-- عناوین کتب --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddBook" runat="server" />
                    </div>
                </li>
                <li class="ClassOfPrimp">
                    <div id="OtherFavorite">
                        <p>: سایر علاقه مندیها</p>
                        <%-- عنوان تفریح یا مهارت یا هرچیز دیگر جذاب --%>
                        <asp:ImageButton CssClass="ImgAdd"  ID="AddOtherFavorite" runat="server" />
                    </div>
                </li>
            </ul>
        </div>
      </div>

      <div id="TabOfProfile" >
            <h4>مرا بشناسید</h4>
            <ul class="tabNavigation">
                <li class="Vertical"><a href="#Introduction">Introduction</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnIntroduction" runat="server" /></li>
                <li class="Vertical"><a href="#Study">Study</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnStudy" runat="server" /></li>
                <li class="Vertical"><a href="#Job">Job</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnJob" runat="server" /></li>
                <li class="Vertical"><a href="#Skills">Skills</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnSkills" runat="server" /></li>
                <li class="Vertical"><a href="#Picture">Pictures</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnPictures" runat="server" /></li>
                <li class="Vertical"><a href="#Posts">Posts</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnPosts" runat="server" /></li>
                <li class="Vertical"><a href="#Friends">Friends</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnFriends" runat="server" /></li>
                <li class="Vertical"><a href="#Favorites">Favorites</a><asp:ImageButton ImageUrl="\Img\Intro.png" ID="ImgBtnFavorites" runat="server" /></li>
            </ul>
      </div>

      <div id="footer">  
          <p>&copy; Copyright 2014</p> 
      </div> 
    </form>
</body>
</html>
