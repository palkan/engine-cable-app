import * as ActionCable from "@rails/actioncable";

(function() {
  this.App || (this.App = {});

  const uid = (Date.now() + ((Math.random() * 100)|0)).toString();
  App.cable = ActionCable.createConsumer('/cable?uid=' + uid);
  App.cable.uid = uid;

  App.martians_cable = ActionCable.createConsumer('/martians/cable?martian=1&uid=' + uid);
  App.martians_cable.uid = uid;

}).call(window);
