environment = ENV['APP_ENV'] || 'development'
Bundler.require :default, environment
Dotenv.load "../.env.#{environment}", "../.env"

require_relative 'airbrake'
require_relative '../sidekiq/sync_worker'
require_relative '../app_list'

Sidekiq.configure_server do |config|
  config.redis = { namespace: 'contentful' }
  config.error_handlers << Proc.new { |ex, context| Airbrake.notify_or_ignore(ex, context) }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'contentful', size: 1 }
end
