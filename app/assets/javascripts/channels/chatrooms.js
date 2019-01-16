App.chatrooms = App.cable.subscriptions.create("ChatroomsChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    var active_chatroom;
    active_chatroom = $("[data-behavior='messages'][data-chatroom-id='" + data.chatroom_id + "']");
    if (active_chatroom.lenght > 0) {
      active_chatroom.append(data.message);
    } else {
      $("[data-behavior='chatroom-link'][data-chatroom-id='" + data.chatroom_id + "']").css("font-weight", "italic");
    }
  },

  send_message: function (chatroom_id, message) {
    return this.perform("send_message", {
      chatroom_id: chatroom_id,
      body: message
    });
  }
});
