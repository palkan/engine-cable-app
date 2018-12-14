module Robots
  class BeepChannel < ApplicationCable::Channel
    def subscribed
      stream_from "robots"
    end

    def speak(data)
      ActionCable.server.broadcast "robots", message: data["text"], uid: uid
      
      probably_respond
    end

    private

    def probably_respond
      return unless rand > 0.4

      ActionCable.server.broadcast "robots", message: some_message, uid: "robot"
    end

    def some_message
      Faker::StarWars.public_send(%i[wookiee_sentence quote].sample)
    end
  end
end
