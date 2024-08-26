require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DescontoInss
  class Application < Rails::Application
    config.load_defaults 7.2
    config.autoload_lib(ignore: %w[assets tasks])
    config.active_job.queue_adapter = :sidekiq
    config.time_zone = "Brasilia"
    config.i18n.default_locale = :'pt-BR'
  end
end
