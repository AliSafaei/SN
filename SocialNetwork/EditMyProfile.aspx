<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="EditMyProfile.aspx.vb" Inherits="SocialNetwork.EditMyProfile"  %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
    <ajaxToolkit:ToolkitScriptManager runat="server"></ajaxToolkit:ToolkitScriptManager>
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
            <h6 style="background-color:#000000;color:#ffffff;">معرفی
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
                                <asp:RadioButton ID="RadioButton3" runat="server" GroupName="2" Text="آقا" />
                                <asp:RadioButton ID="RadioButton4" runat="server" GroupName="2" Text="خانم" />
                            </p>
    &nbsp;&nbsp;&nbsp; 
                    </td>
                    <th>: جنسیت</th>
                </tr>
                    <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
                        
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
                                <asp:RadioButton ID="RadioButton1" runat="server" GroupName="1" Text="مجرد" />
                                <asp:RadioButton ID="RadioButton2" runat="server" GroupName="1" Text="متأهل" />
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
            <h6 style="background-color:#000000;color:#ffffff;">تحصیلات
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
            <h6 style="background-color:#000000;color:#ffffff;">شغل
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
            <h6 style="background-color:#000000;color:#ffffff;">مهارتهای من
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
            <div style="display:block">
                <table border="0" style="width: 99%; border-collapse: collapse;">
                         <tbody>
                             <tr>
                                 <td>
                                   <h6>:تغییر عکس پروفایل</h6>
                                 </td>
                             </tr>
                             <tr>
                                 <td  colspan="2">
                                     <%--<ajaxToolkit:AjaxFileUpload runat="server" ID="FileUpload" MaximumNumberOfFiles="1" AllowedFileTypes="JPG, JPEG" Mode="Client" />--%>
                                     <asp:FileUpload ID="FileUpload" runat="server" AllowMultiple="false" />
                                 </td>
                             </tr>
                         </tbody>
                     </table>

                <table>
                 <tr><td colspan="3">
                  
                               </td></tr></table> 
                    
             </div>    <%-- <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>--%>
                       
               <%--</ContentTemplate></asp:UpdatePanel>--%>
                   
                    
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
            <h6 style="background-color:#000000;color:#ffffff;">دوستانم</h6>
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
        <div id="TabOfProfile">
            <h6 style="background-color: #000000; color: #ffffff;">مرا بشناسید</h6>
            <ul class="tabNavigation">
                <li class="Vertical"><a href="#Introduction">معرفی</a></li>
                <li class="Vertical"><a href="#Study">تحصیلات</a></li>
                <li class="Vertical"><a href="#Job">شغل</a></li>
                <li class="Vertical"><a href="#Skills">مهارت ها</a></li>
                <li class="Vertical"><a href="#Picture">آلبوم ها</a></li>
                <li class="Vertical"><a href="#MyPosts">پستها</a></li>
                <li class="Vertical"><a href="#Friends">دوستان</a></li>
                <li class="Vertical"><a href="#Favorites">علاقه مندی ها</a></li>
                <li class="Vertical">
                    <button runat="server" id="ImageButton1" class="btn btn-lg btn-success btn-default">اعمال تغییرات</button></li>
            </ul>
        </div>
    </div>

</asp:Content>
