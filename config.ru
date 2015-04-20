require 'rubygems'
require 'bundler'

Bundler.require :default

require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'contentful', size: 1 }
end

require 'sidekiq/web'
run Sidekiq::Web
