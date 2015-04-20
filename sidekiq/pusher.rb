#!/usr/bin/env ruby

# custom whenever job definition for sidekiq
klass = ARGV[0]
require 'sidekiq'

Sidekiq::Client.push(class: klass, args: [])
