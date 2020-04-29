import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
  	console.log("Hey, you are connected. You can chat now!");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    console.log("Hey, You are disconnected from chat channel!");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var messages = $('#chatbox');
    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
    // Called when there's incoming data on the websocket for this channel
  }
});
  