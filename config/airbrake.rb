Airbrake.configure do |config|
  config.api_key = 'api-key'
  config.environment_name = ENV['RACK_ENV'] || "production"
end
