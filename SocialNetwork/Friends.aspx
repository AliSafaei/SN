<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Friends.aspx.vb" Inherits="SocialNetwork.Friends" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

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
                    <td class="FriendsMemberD">دوست پیشنهادی اول</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">دوست پیشنهادی دوم</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">دوست پیشنهادی سوم</td>
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
                    <td class="FriendsMemberD">گروه پیشنهادی اول</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">گروه پیشنهادی دوم</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2">
                        <asp:ImageButton CssClass="ImgButtons" src="../ImgAdd.png" Width="20px" Height="20px" runat="server" /></th>
                    <td class="FriendsMemberD">گروه پیشنهادی سوم</td>
                    <th class="FriendsMemberH">
                        <asp:Image Width="30px" Height="30px" runat="server" /></th>
                </tr>
            </table>
        </div>
    </div>


    

    <div id="Posts" style="align-content: center; align-self: center;">

        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <div id="<%# Eval("Mail").ToString().Replace("@", "").Replace(".", "")%>" class="PostBox" style="width: 90%; text-align: center; margin-left: 5%;">
                    <h6 style="text-align: right; color: #650e0e; opacity: 0.8;"><%# Eval("Name")%>
                        <asp:HyperLink CssClass="ImgUserInPost" ImageUrl=<%# Eval("UserImage")%> NavigateUrl=<%# Eval("ID")%>   ImageHeight="40px" ImageWidth="40px"  runat="server"></asp:HyperLink></h6>
                    .به شما پیشنهاد دوستی داده است<br />
                    <a href="#Decline" onclick="Accept('<%# Eval("Mail")%>','<%# Eval("Mail").ToString().Replace("@", "").Replace(".", "")%>')" class="SubmitButtons">پذیرفتن</a>
                    <a href="#Decline" onclick="Decline('<%# Eval("Mail")%>','<%# Eval("Mail").ToString().Replace("@", "").Replace(".", "")%>')" class="SubmitButtons">رد</a>
                    <hr />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <h6 style="background-color: #000000; color: #ffffff;">جستجو</h6>
        <div class="SendPostBox">
            <asp:TextBox ID="PostTextBox" runat="server" Style="max-width: 90%; min-width: 90%; max-height: 250px; min-height: 250px;"></asp:TextBox>

            <p>
                <asp:LinkButton CssClass="SubmitButtons" ID="SendfPostButton" runat="server">جستجو</asp:LinkButton>
            </p>
        </div>
        <hr />

        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
                <div class="PostBox" style="width: 90%; text-align: center; margin-left: 5%;">
                    <h6 style="text-align: right; color: #650e0e; opacity: 0.8;"><%# Eval("Name")%>
                        <asp:HyperLink CssClass="ImgUserInPost" ImageUrl=<%# Eval("UserImage")%> NavigateUrl=<%# Eval("ID")%>  ImageWidth="40px" ImageHeight="40px"  runat="server"></asp:HyperLink></h6>

                    <hr />
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <%--<asp:ImageButton runat="server" ID="me" AlternateText="بیشتر" BackColor="White"/>--%>
        <a id="me" href="#me" onclick="ShowMoreFriends(0)" class="SubmitButtons">بیشتر</a>
    </div> 
</asp:Content>
