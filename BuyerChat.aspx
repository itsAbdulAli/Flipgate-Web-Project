<%@ Page Title="" Language="C#" MasterPageFile="~/buyerMasterPage.Master" AutoEventWireup="true" CodeBehind="BuyerChat.aspx.cs" Inherits="DB_PROJ.BuyerChat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head_" runat="server">
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="Style.css" rel="stylesheet" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="header" runat="server">
    <asp:Label ID="DisplayEmail" runat="server" Text="UserName" ></asp:Label>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body_" runat="server">
   


<!------ Include the above in your HEAD tag ---------->
    <link href="chatStyle.css" rel="stylesheet" />
         <div class="container">
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <div class="section-header">
                                        <h1>MESSAGES</h1>
                                        </div>
            </div>
           
          </div>
          <div class="inbox_chat">
            <div class="chat_list">
              <div class="chat_people">

                <div class="chat_ib">
                    <asp:Button ID="Chat_1" CssClass="btn" runat ="server" Text="Dummy Name"></asp:Button>
              </div>
                  </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
               
                <div class="chat_ib">
                   <asp:Button ID="Chat_2" CssClass="btn" runat ="server" Text="Dummy Name"></asp:Button>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
           
                <div class="chat_ib">
                   <asp:Button ID="Chat_3" CssClass="btn" runat ="server" Text="Dummy Name"></asp:Button>

                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history">

              <div class="outgoing_msg">
              <div class="sent_msg">
               <p> <asp:Label ID="Message_1" runat="server" Text="This is outgoing message"></asp:Label></p>
                <span class="time_date"> <asp:Label ID="Time_1" runat="server" Text="11:01 AM    |    Today"></asp:Label> </span> </div>
            </div>
            <div class="incoming_msg">

              <div class="received_msg">
                <div class="received_withd_msg">
                  <p> <asp:Label ID="Message_2" runat="server" Text="This is incoming message"></asp:Label></p>
                <span class="time_date"> <asp:Label ID="Time_2" runat="server" Text="11:01 AM    |    Today"></asp:Label> </span> </div>
              </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
             <asp:TextBox ID="TextBox1" Text="Type a message" CssClass="write_msg" runat="server"></asp:TextBox>
              <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      
    </div></div>
</asp:Content>
