<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PublicViewProfile.aspx.vb" Inherits="SocialNetwork.PublicViewProfile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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

        <div id="Totalprofile">

            <div id="ColL">
                <div id="Search">
                    <h3>Search</h3>
                </div>
                <div id="FriendSuggestion">
                    <h3>Friend Suggestion</h3>
                </div>
                <div id="GroupSuggestion">
                    <h3>Group Seggeustion</h3>
                </div>
            </div>        
            <div id="ProfileFUKAC">
                <h3>Profile</h3>
            </div>
            <div id="ColR">
                <div id="Chat">
                    <h3>Chat</h3>
                </div>
                <div id="ProfileFUKACMenu">
                    <h3>Advanced</h3>
                    <p class="Vertical"><asp:ImageButton ID="ImgIntroductionButton" runat="server" /></p>
                    <p class="Vertical"><asp:ImageButton ID="ImgStudyButton" runat="server" /></p>
                    <p class="Vertical"><asp:ImageButton ID="ImgJobButton" runat="server" /></p>
                    <p class="Vertical"><asp:ImageButton ID="ImgSkillsButton" runat="server" /></p>
                    <p class="Vertical"><asp:ImageButton ID="ImgPicturesButton" runat="server" /></p>
                    <p class="Vertical"><asp:ImageButton ID="ImgPostsButton" runat="server" /></p>
                    <p class="Vertical"><asp:ImageButton ID="ImgFriendsButton" runat="server" /></p>
                    <p class="Vertical"><asp:ImageButton ID="ImgFavoritesButton" runat="server" /></p>
                </div>
            </div>
       </div>

       <div id="footer">  
          <p>&copy; Copyright 2014</p> 
       </div> 
    </form>
</body>
</html>