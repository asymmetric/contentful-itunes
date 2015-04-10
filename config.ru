require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { namespace: 'contentful' }
end

require 'sidekiq/web'
run Sidekiq::Web
