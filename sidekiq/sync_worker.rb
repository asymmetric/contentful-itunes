class SyncWorker
  include Sidekiq::Worker

  SETTINGS = {
    access_token: "access-token",
    space: "space-id",
    apps_type: 'content-type-id'
  }

  def perform
    %w/de-DE/.each do |locale|
      puts "synching locale #{locale}"
      app_list = AppList.new SETTINGS.merge locale: locale
      app_list.sync
    end

    puts "done"
  end
end
