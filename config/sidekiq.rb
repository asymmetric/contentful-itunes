Bundler.require :default

require_relative '../sidekiq/sync_worker'
require_relative '../app_list'

Sidekiq.configure_server do |config|
  config.redis = { namespace: 'contentful' }
end

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'contentful', size: 1 }
end
