// require chat

class Robots extends Chat {
  connect() {
    this.channel = App.cable.subscriptions.create("Robots::BeepChannel",
    {
      connected: this.channelConnected.bind(this),
      received: this.channelReceived.bind(this),
    });
  }

  channelConnected() {
    console.info("Connected to robots");
    this.connected = true;
  }

  channelReceived(data) {
    let kind;
    if (data.uid === App.cable.uid) {
      kind = 'owned';
    } else if (data.uid === 'robot') {
      kind = 'bot';
    }
    this.addMessage(data.message, kind);
  }
}
