require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'contentful', size: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { namespace: 'contentful' }
end

require 'sidekiq/web'
run Sidekiq::Web
