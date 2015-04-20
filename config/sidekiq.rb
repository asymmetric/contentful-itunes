Bundler.require

require_relative '../sidekiq/sync_worker'
require_relative '../app_list'

Sidekiq.configure_server do |config|
  config.redis = { namespace: 'contentful' }
end
