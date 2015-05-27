Airbrake.configure do |config|
  config.api_key = ENV['AIRBRAKE_API_KEY']
  config.environment_name = ENV['RACK_ENV'] || "production"
end
