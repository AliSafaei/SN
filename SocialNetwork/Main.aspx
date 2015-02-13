<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Main.aspx.vb" Inherits="SocialNetwork.Main1" ValidateRequest="false"%>
<%@ MasterType VirtualPath="~/Main.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function sendPost() {
            SetHidden();
            document.getElementById("ContentPlaceHolder1_SendfPostButton").click();
            return true;
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id="ColL">
        <div id="Search">
            <h6 style="background-color: #000000; color: #ffffff;">جستجوی دوستان و گروه ها   
                <asp:Image src="../ImgSearch.png" Width="20px" Height="10px" runat="server" /></h6>
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
            <h6 style="background-color: #000000; color: #ffffff;">دوستان پیشنهادی   
                <asp:Image src="../ImgSuggestFriend.png" Width="20px" Height="20px" runat="server" /></h6>
            <table class="RightColTable">
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
            </table>
        </div>
        <div id="GroupSuggestion">
            <h6 style="background-color: #000000; color: #ffffff;">گروه های پیشنهادی   
                <asp:Image src="../ImgSuggestGroup.png" Width="20px" Height="20px" runat="server" /></h6>
            <table class="RightColTable">
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
            </table>
        </div>
    </div>

    <div id="Posts" style="text-align: center; margin-bottom: 4px;">
        <h6 style="background-color: #000000; color: #ffffff;">پست</h6>
        <a href="#" class="btn btn-lg btn-success Buttons"
                    data-toggle="modal"
                    data-target="#basicModal">ارسال پست جدید</a>

        <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-close"></i></button>
                        <h4 class="modal-title" id="myModalLabel">پست جدید</h4>
                    </div>
                    <div class="modal-body">
                        <h3>:نگارش</h3>
                        <%--<div class="SendPostBox">--%>
                            <div class="wmd-panel">
                                <div id="wmd-button-bar"></div>
                                <textarea  id="wmd-input" class="wmd-input" >
                                </textarea>
                            </div>
                            <div id="wmd-preview" class="wmd-panel wmd-preview" >

                            </div>

                <br />
:آپلود عکس
                   <asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn-default btn" />
                <br />
             
                
                
            </p>
            <%--<asp:LinkButton CssClass="SubmitButtons" ID="UploadPictureButton" runat="server"></asp:LinkButton>--%>
<%--        </div>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-sm btn-default" data-dismiss="modal">شاید دفعه بعد</button>
                        <button type="button" class="btn-success btn-lg Buttons btn btn-default" onclick="sendPost()">فرستادن</button>
                        <button type="button" class="btn btn-default " style="visibility:hidden;" id="SendfPostButton" runat="server"></button>
                    </div>
                </div>
            </div>
        </div><asp:HiddenField ID="PostTextBox" runat="server" ></asp:HiddenField>
        <hr />

        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="PostBox" style="width: 90%; text-align: center; margin-left: 5%;">
                    <h6 style="text-align: right; color: #650e0e; opacity: 0.8;"><%# Eval("User")%>  
                        <%--<asp:ImageButton CssClass="ImgUserInPost" src=<%# Eval("UserImage")%>  Width="40px" Height="40px" runat="server"/>--%>
                      <asp:HyperLink CssClass="ImgUserInPost" ImageUrl=<%# Eval("UserImage")%> NavigateUrl=<%# Eval("ID")%>  Width="40px" Height="40px"  runat="server"></asp:HyperLink></h6>
                    <asp:image ID="Image1" Width="90%" Height="80%" runat="server" ImageUrl=<%# Eval("Image")%> Visible=<%# Not (Eval("Image").ToString() = "")%>/>
                    <p style="text-align: right;"><%# Eval("Body")%></p>
                    <p style="text-align: left; font-size: 50%;">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgLike.png" Width="20px" Height="20px" runat="server" OnClientClick=<%# Eval("LikeLink")%> OnLoad=<%# Eval("LoadInfo")%>/><span class=<%# Eval("LikeLink").ToString().Replace("(", "").Replace(")", "").Replace(";", "")%>>0</span>
                        <asp:ImageButton ID="ImgComment" CssClass="ImgButtons" src="../ImgComment.png" Width="20px" Height="20px" runat="server" /><span class=<%# Eval("ShareLink").ToString().Replace("(", "").Replace(")", "").Replace(";", "")%>>0</span>
                        <asp:ImageButton ID="ImgShare" CssClass="ImgButtons" src="../ImgShare.png" Width="20px" Height="20px" runat="server" /><span class=<%# Eval("CommentLink").ToString().Replace("(", "").Replace(")", "").Replace(";", "")%>>0</span></p>
                                          
                    <hr />
                    
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <a id="me" href="#me" onclick="ShowMore(5)" class="SubmitButtons">بیشتر</a>
    </div> 
    
                      
    <div id="ColR">
        <div id="FriendsList">
            <h6 style="background-color: #000000; color: #ffffff;">فهرست دوستان   
                <asp:Image src="../ImgSuggestFriend.png" Width="20px" Height="20px" runat="server" /></h6>
            <table class="RightColTable">
                <asp:Repeater runat="server" ID="FriendsInMain">
                    <ItemTemplate>
                        <tr class="FriendsMemberR">
                            <th class="FriendsMemberH2">
                                <asp:ImageButton CssClass="ImgButtons" src="../ImgMessage2.png" Width="20px" Height="15px" runat="server" /></th>
                            <td class="FriendsMemberD">
                                <asp:Literal runat="server" Text='<%# Eval("Name")%>'></asp:Literal></td>
                            <th class="FriendsMemberH">
                                <asp:Image ID="Image1" Width="30px" Height="30px" runat="server" ImageUrl='<%# Eval("UserImage")%>' Visible='<%# Not (Eval("UserImage").ToString() = "")%>' /></th>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
        <div id="GroupsList">
            <h6 style="background-color: #000000; color: #ffffff;">فهرست گروه ها   
                <asp:Image src="../ImgSuggestGroup.png" Width="20px" Height="20px" runat="server" /></h6>
            <table class="RightColTable">
                <tr class="FriendsMemberR"> 
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgMessage2.png" Width="20px" Height="15px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgMessage2.png" Width="20px" Height="15px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgMessage2.png" Width="20px" Height="15px" runat="server" /></th>
                    <td class="FriendsMemberD">به زودی</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
            </table>
        </div>
        
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="inPageScripts" runat="server">
    
</asp:Content>
