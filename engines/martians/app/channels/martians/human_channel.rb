module Martians
  class HumanChannel < Channel
    def subscribed
      stream_from "robots"
    end

    def speak(data)
      Martians::Engine.server.broadcast "robots", message: data["text"], uid: uid

      Martians::Engine.server.broadcast "robots", message: "Resistence is futile!", uid: "martian"
    end
  end
end
