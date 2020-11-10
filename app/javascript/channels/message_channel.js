import consumer from "./consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p>${data.content.user_id.nickname}</p><p>${data.content.created_at}</p><p>${data.content.content}</p>`;
    const messages = document.getElementById('messages');
    const newMessage = document.getElementById('notice_content');
    messages.insertAdjacentHTML('afterbegin', html);
    newMessage.value='';
  }
});
