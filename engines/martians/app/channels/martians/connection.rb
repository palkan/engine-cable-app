module Martians
  class Connection < ActionCable::Connection::Base
    identified_by :uid

    def connect
      self.uid = request.params[:uid]
      logger.add_tags(self.uid)

      return reject_unauthorized_connection if request.params[:martian].nil?
      logger.info "connected to martians"
    end
  end
end
