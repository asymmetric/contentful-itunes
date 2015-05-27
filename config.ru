require 'rubygems'
require 'bundler'

Bundler.require :default, ENV['APP_ENV'] || 'development'

require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'contentful', size: 1 }
end

require 'sidekiq/web'
run Sidekiq::Web
