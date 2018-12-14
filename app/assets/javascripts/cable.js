// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  const uid = (Date.now() + ((Math.random() * 100)|0)).toString();
  App.cable = ActionCable.createConsumer('/cable?uid=' + uid);
  App.cable.uid = uid;

}).call(this);
