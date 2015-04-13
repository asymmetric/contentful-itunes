#!/usr/bin/env ruby

# custom whenever job definition for sidekiq
klass = ARGV[0]
require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { namespace: 'contentful', size: 1 }
end

Sidekiq::Client.push(class: klass, args: [])
