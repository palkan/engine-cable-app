//= require_tree ./controllers

const application = Stimulus.Application.start();

application.register('robots', Robots);
application.register('martians', Martians);
