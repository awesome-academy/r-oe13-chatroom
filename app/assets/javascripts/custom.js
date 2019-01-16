$(document).on('turbolinks:load', function () {
  $('#new_message').on('keypress', function (e) {
    if (e && e.keyCode == 13){
      e.preventDefault();
      $(this).submit();
    }
  });

  $('#new_message').on('submit', function (e) {
    e.preventDefault();
    var body, chatroom_id;
    chatroom_id = $("[data-behavior='messages']").data("chatroom-id");
    body = $("#message_body");
    App.chatrooms.send_message(chatroom_id, body.val());
    body.val("");
  });
});

$(document).ready(function () {
  $('.reply-send').click(function(){
    $('#new_message').submit()
  });
  $('.message').scrollTop($(this).height());
  $(window).resize(function () {
    $('.bdfill').css('display', 'block');
  });
});
