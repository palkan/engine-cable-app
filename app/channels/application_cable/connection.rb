module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uid

    def connect
      self.uid = request.params[:uid]
      logger.add_tags(self.uid)
      logger.info "connected"
    end
  end
end
