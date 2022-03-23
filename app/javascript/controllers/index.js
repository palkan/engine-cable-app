// Import and register all your controllers from the importmap under controllers/*

import { application } from "controllers/application"
import MartiansController from "controllers/martians_controller";
import RobotsController from "controllers/robots_controller";

application.register('robots', RobotsController);
application.register('martians', MartiansController);

