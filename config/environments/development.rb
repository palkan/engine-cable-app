Rails.application.configure do
  # Specify AnyCable WebSocket server URL to use by JS client
  config.after_initialize do
    if AnyCable::Rails.enabled?
      config.action_cable.url = ActionCable.server.config.url = ENV.fetch("CABLE_URL", "ws://localhost:8080/cable")
      config.martians_cable.url = ENV.fetch("MARTIANS_CABLE_URL", "ws://localhost:8081/martians")

      AnyCable.connection_factory = AnyCable::Rails::ConnectionFactory.new do
        map "/cable" do
          ApplicationCable::Connection
        end

        map "/martians" do
          Martians::Connection
        end
      end
    end
  end
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true
end
