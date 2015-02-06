<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Profile.aspx.vb" Inherits="SocialNetwork.Profile" %>
<%@ MasterType VirtualPath="~/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
            <h6 style="background-color:#000000;color:#ffffff;"> معرفی
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>&nbsp;<asp:Literal ID="Literal1" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : نام</th>
                </tr>
                <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;</td>
                    <th> : نام خانولدگی</th>
                </tr>
                <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal3" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: جنسیت</th>
                </tr>
                    <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:Literal ID="Literal4" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: تاریخ تولد</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal5" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : مکان تولد</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal6" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : محل سکونت</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal7" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : درباره من</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal8" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th>: وضعیت تاهل</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal9" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;
                    </td>
                    <th>: خانواده ام</th>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Literal ID="Literal10" runat="server"></asp:Literal>
    &nbsp;&nbsp;&nbsp;  
                     </td>
                    <th> : دوستان صمیمی</th>
                </tr>
            </table>
            </div>
            <div id="Study">
            <h6 style="background-color:#000000;color:#ffffff;">تحصیلات
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td><asp:Literal ID="Literal13" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: نام دبستان</th>
                </tr>
                <tr>
                    <td><asp:Literal ID="Literal14" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : نام دبیرستان</th>
                </tr>
                <tr>
                    <td><asp:Literal ID="Literal15" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp;
                    </td>
                    <th> : دانشگاه</th>
                </tr>
            </table>
            </div>
	        <div id="Job">
            <h6 style="background-color:#000000;color:#ffffff;">شغل
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;
                            <asp:Literal ID="Literal11" runat="server"></asp:Literal>
&nbsp;&nbsp;&nbsp; 
                        <%-- فلان شغل در فلان جا با فلانی --%>
                    </td>
                    <th>: نام شغل</th>
                </tr>
            </table>
            </div>
	       <div id="Skills">
            <h6 style="background-color:#000000;color:#ffffff;">مهارتهای من
                </h6>
            <table style="float:right;margin-right:4%;text-align:right;">
                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp; 
                            <asp:Literal ID="Literal12" runat="server"></asp:Literal>
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
                <li class="Vertical"><a href="#Introduction">معرفی</a></li>
                <li class="Vertical"><a href="#Study">تحصیلات</a></li>
                <li class="Vertical"><a href="#Job">شغل</a></li>
                <li class="Vertical"><a href="#Skills">مهارت ها</a></li>
                <li class="Vertical"><a href="#Picture">آلبوم ها</a></li>
                <li class="Vertical"><a href="#MyPosts">پستها</a></li>
                <li class="Vertical"><a href="#Friends">دوستان</a></li>
                <li class="Vertical"><a href="#Favorites">علاقه مندی ها</a></li>
                 <li class="Vertical" >  <asp:ImageButton ID="Accept" CssClass="SubmitButtons" runat="server" OnClick="Accept_Click" AlternateText="ایجاد تغییر"/>
                     <asp:ImageButton ID="ImageButton1" CssClass="SubmitButtons" runat="server" AlternateText="ایجاد تغییر" OnClick="ImageButton1_Click" Enabled="false" Visible="false"/>
                 </li>
            </ul>
        </div>
    </div>


</asp:Content>
