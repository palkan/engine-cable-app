import * as ActionCable from "@rails/actioncable";

(function() {
  this.App || (this.App = {});

  const uid = (Date.now() + ((Math.random() * 100)|0)).toString();

  const cableUrl = document.head.querySelector(`meta[name='action-cable-url']`).getAttribute('content');
  App.cable = ActionCable.createConsumer(`${cableUrl}?uid=${uid}`);
  App.cable.uid = uid;

  const martiansUrl = document.head.querySelector(`meta[name='martians-cable-url']`).getAttribute('content');
  App.martians_cable = ActionCable.createConsumer(`${martiansUrl}?martian=1&uid=${uid}`);
  App.martians_cable.uid = uid;

}).call(window);
