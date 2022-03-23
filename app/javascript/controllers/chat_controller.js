import { Controller } from "@hotwired/stimulus";

export default class ChatController extends Controller {
  static get targets() {
    return ['messages', 'input'];
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

  addMessage(msg, kind) {
    this.cleanupWelcomeMessage();
    const element = document.createElement('p')
    element.textContent = msg;
    element.classList.add('message', 'row');
    if (kind) element.classList.add(kind);
    this.messagesTarget.appendChild(element);
  }

  cleanupWelcomeMessage() {
    const firstChild = this.messagesTarget.children[0];

    if (firstChild.tagName.toLowerCase() === "em") {
      this.messagesTarget.removeChild(firstChild);
    }
  }
}
