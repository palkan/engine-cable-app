module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :uid

    def connect
      return reject_unauthorized_connection if request.params[:martian].present?

      self.uid = request.params[:uid]
      logger.add_tags(self.uid)
      logger.info "connected"
    end
  end
end
