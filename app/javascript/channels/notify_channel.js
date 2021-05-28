import consumer from "./consumer"

let notifyClient = document.addEventListener("turbolinks:load",function () {

  console.log("cargó");

  consumer.subscriptions.create("NotifyChannel", {
  connected() {
    // Called when the subscription is ready for use on the server

  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data);
   // new Notification(data["title"], body: data["body"]) 
  }
  });

  //document.querySelector("#").addEventListener("click", function () { });
  //Enviar mensaje al server de ws
});