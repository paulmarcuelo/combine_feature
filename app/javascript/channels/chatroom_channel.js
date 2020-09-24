import { Subscription } from "@rails/actioncable";
import consumer from "./consumer"

document.addEventListener("turbolinks:load", () => {
  $(document).ready(function(){
    var room_name = $('#room_name').attr('room-name')
    if (this.subscription) consumer.subscriptions.remove(this.subscription);

    var subscription = consumer.subscriptions.create({ channel: "ChatroomChannel", room: room_name}, {
      connected() {
        // Called when the subscription is ready for use on the server
        console.log('Connected')
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
        console.log('Disconnected')
      },

      received(data) {
        // Called when there's incoming data on the websocket for this channel
        $('#messages').append(data['message'])
      }
    });
    this.subscription = subscription
  })
  
})


