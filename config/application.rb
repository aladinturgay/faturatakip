require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module KurumsalTakip
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.1

    config.autoload_lib(ignore: %w[assets tasks])

    
    
    
    
    
    
    
  end
end
