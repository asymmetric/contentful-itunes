require 'rubygems'
require 'bundler'

Bundler.require

require 'sidekiq'


require 'sidekiq/web'
run Sidekiq::Web
