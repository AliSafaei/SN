<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Main.Master" CodeBehind="Chat.aspx.vb" Inherits="SocialNetwork.Chat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/SIPml5.js"></script>
    <script type="text/javascript">
        var sipStack;
        var session;
        function init() {
            SIPml.init(
            function (e) {
                var eventsListener = function (e) {
                    if (e.type == 'started') {

                    }
                    else if (e.type == 'i_new_message') { // incoming new SIP MESSAGE (SMS-like)
                        acceptMessage(e);
                    }
                    else if (e.type == 'i_new_call') { // incoming audio/video call
                        e.newSession.accept(); // e.newSession.reject() to reject the call

                    }
                }
                sipStack = new SIPml.Stack({
                    realm: 'sip2sip.info', // mandatory: domain name
                    impi: document.getElementById("ContentPlaceHolder1_Literal1").innerHTML, // mandatory: authorization name (IMS Private Identity)
                    impu: 'sip:' + document.getElementById("ContentPlaceHolder1_Literal1").innerHTML + '@sip2sip.info', // mandatory: valid SIP Uri (IMS Public Identity)
                    password: document.getElementById("ContentPlaceHolder1_Literal3").innerHTML, // optional
                    //display_name: 'Bob legend', // optional
                    websocket_proxy_url: 'ws://ns313841.ovh.net:14060', // optional
                    outbound_proxy_url: 'udp://proxy.sipthor.net', // optional
                    enable_rtcweb_breaker: false, // optional
                    events_listener: { events: '*', listener: eventsListener }, // optional: '*' means all events
                    sip_headers: [ // optional
                            { name: 'User-Agent', value: 'IM-client/OMA1.0 sipML5-v1.0.0.0' },
                            { name: 'Organization', value: 'Doubango Telecom' }
                    ]
                }
                   );

                sipStack.start();

                
            });

        }

        function cal() {
            var callSession = sipStack.newSession('call-audiovideo', {
                video_local: document.getElementById('video-local'), // <video id="video-local" .../>
                video_remote: document.getElementById('video-remote'), // <video id="video-remote" .../>

                audio_remote: document.getElementById('audio-remote') // <audio id="audio-remote" .../>
            });
            callSession.call(document.getElementById("ContentPlaceHolder1_Literal2").innerHTML);
        }


        function Regist() {
            session = sipStack.newSession('register', {
                expires: 200,
                //events_listener: { events: '*', listener: onSipEventSession },
                sip_caps: [
                            { name: '+g.oma.sip-im', value: null },
                            { name: '+audio', value: null },
                            { name: 'language', value: '\"en,fr\"' }
                ]
            });

            session.register();
        }


        function PublishPresence() {
            var publishSession;
            var eventsListener = function (e) {
                console.info('session event = ' + e.type);
            }
            var publishPresence = function () {
                publishSession = sipStack.newSession('publish', {
                    events_listener: { events: '*', listener: eventsListener } // optional: '*' means all events
                });
                var contentType = 'application/pidf+xml';
                var content = '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n' +
                                '<presence xmlns=\"urn:ietf:params:xml:ns:pidf\"\n' +
                                    ' xmlns:im=\"urn:ietf:params:xml:ns:pidf:im\"' +
             	                    ' entity=\"sip:'+ document.getElementById("ContentPlaceHolder1_Literal1").innerHTML + '@sip2sip.info'+">\n'" +
                                    '<tuple id=\"s8794\">\n' +
                                    '<status>\n' +
                                    '   <basic>open</basic>\n' +
                                    '   <im:im>away</im:im>\n' +
                                    '</status>\n' +
                                    '<contact priority=\"0.8\">tel:+33600000000</contact>\n' +
                                    '<note  xml:lang=\"fr\">Bonjour de Paris :)</note>\n' +
                                    '</tuple>\n' +
   	                            '</presence>';

                // send the PUBLISH request
                publishSession.publish(content, contentType, {
                    expires: 200,
                    sip_caps: [
                                    { name: '+g.oma.sip-im' },
                                    { name: '+sip.ice' },
                                    { name: 'language', value: '\"en,fr\"' }
                    ],
                    sip_headers: [
                                    { name: 'Event', value: 'presence' },
                                    { name: 'Organization', value: 'Doubango Telecom' }
                    ]
                });
            }

        }

    </script>

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:label ID="Literal1" runat="server"></asp:label>
    <asp:label ID="Literal2" runat="server"></asp:label>
    <asp:label ID="Literal3" runat="server"></asp:label><p></p>
    <a class="Buttons" href="#me" id="me" onclick="init()">Start the Chat System</a><p></p>
    <a class="Buttons" href="#you" id="you" onclick="Regist()">Register to the Chat System</a><p></p>
    <a class="Buttons" href="#other" id="other" onclick="cal()">Call</a><p></p>
    <div id="ChatBox">

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
<table class="RightColTable">
    <h6 style="background-color:#000000;color:#ffffff;">چت باکس</h6>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"></th>
                    <td class="FriendsMemberD"></td>
                    <th class="FriendsMemberH"><audio id="audio-remote"></audio></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"></th>
                    <td class="FriendsMemberD"></td>
                    <th class="FriendsMemberH"><video id="video-local"  style='height:30%;width:90%;'></video></th>
                </tr>
                <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"></th>
                    <td class="FriendsMemberD"></td>
                    <th class="FriendsMemberH"><video id="video-remote" style='height:30%;width:30%;' ></video></th>
                </tr>
    <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"></th>
                    <td class="FriendsMemberD"></td>
                    <th class="FriendsMemberH"><a id="call" href="#me" onclick="ShowMore(5)" class="ImgButtons">me</a></th>
                </tr>
    <tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"></th>
                    <td class="FriendsMemberD"></td>
                    <th class="FriendsMemberH"><a id="who" href="#me" onclick="ShowMore(5)" class="ImgButtons">who</a></th>
                </tr><tr class="FriendsMemberR">
                    <th class="FriendsMemberH2"></th>
                    <td class="FriendsMemberD"></td>
                    <th class="FriendsMemberH"><a id="Regme" href="#me" onclick="ShowMore(5)" class="ImgButtons">بیشتر</a></th>
                </tr>
            </table>
        
    </div>

</asp:Content>
