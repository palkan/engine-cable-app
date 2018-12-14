module Martians
  class << self
    def cable
      @cable ||= ActionCable::Server::Configuration.new
    end
  end

  class Engine < ::Rails::Engine
    isolate_namespace Martians

    class << self
      def server
        @server ||= ActionCable::Server::Base.new(config: Martians.cable)
      end
    end

    config.martians_cable = Martians.cable
    config.martians_cable.mount_path = "/cable"
    config.martians_cable.connection_class = -> { Martians::Connection }

    initializer "martians.cable.config" do |app|
      config_path = Rails.root.join("config", "martians_cable.yml")
      Martians.cable.cable = app.config_for(config_path).with_indifferent_access
    end

    initializer "martians.cable.logger" do
      Martians.cable.logger ||= ::Rails.logger
    end
  end
end
