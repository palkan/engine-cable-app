const application = Stimulus.Application.start();

application.register('robots', class extends Stimulus.Controller {
  static get targets() {
    return ['messages', 'input'];
  }

  connect() {
    this.channel = App.cable.subscriptions.create("RobotsChannel",
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
    const owned = data.uid === App.cable.uid;
    this.addMessage(data.message, owned);
  }

  handleMessage(e) {
    e.preventDefault();
    if (!this.connected) return;
    this.sendMessage(this.inputTarget.value);
    this.inputTarget.value = '';
  }

  sendMessage(msg) {
    this.channel.perform("speak", { text: msg });
  }

  addMessage(msg, owned) {
    this.cleanupWelcomeMessage();
    const element = document.createElement('p')
    element.textContent = msg;
    element.classList.add('message');
    if (owned) element.classList.add('owned');
    this.messagesTarget.appendChild(element);
  }

  cleanupWelcomeMessage() {
    const firstChild = this.messagesTarget.children[0];

    if (firstChild.tagName.toLowerCase() === "em") {
      this.messagesTarget.removeChild(firstChild);
    }
  }
});
