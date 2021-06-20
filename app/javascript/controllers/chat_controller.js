import { Controller } from 'stimulus';
import consumer from '../channels/consumer';

export default class extends Controller {
  static targets = ['booking'];

  connect() {

    var scroll = document.getElementById("chat_booking");
    scroll.scrollTop = scroll.scrollHeight;

    this.channel = consumer.subscriptions.create(
    {
      channel: "ChatChannel",
      booking_id: this.bookingTarget.dataset.booking,
    },
    {
      connected: this._connected.bind(this),
      disconnected: this._disconnected.bind(this),
      received: this._received.bind(this),
    }

    );
  }

  _connected() {}

  _disconnected() {}

  _received(data) {
    document.getElementById("message_body").value = ""
    const element = this.bookingTarget
    element.innerHTML = data
    var scroll = document.getElementById("chat_booking");
    scroll.scrollTop = scroll.scrollHeight;

  }

}