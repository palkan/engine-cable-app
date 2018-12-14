// require chat

class Martians extends Chat {
  connect() {
    this.channel = App.martians_cable.subscriptions.create("Martians::HumanChannel",
    {
      connected: this.channelConnected.bind(this),
      received: this.channelReceived.bind(this),
    });
  }

  channelConnected() {
    console.info("Connected to martians");
    this.connected = true;
  }

  channelReceived(data) {
    let kind;
    if (data.uid === App.martians_cable.uid) {
      kind = 'owned';
    } else if (data.uid === 'martian') {
      kind = 'martian';
    }
    this.addMessage(data.message, kind);
  }
}
