require_relative '../config/sidekiq'

class SyncWorker
  include Sidekiq::Worker

  SETTINGS = {
    access_token: ENV['CONTENTFUL_ACCESS_TOKEN'],
    space: ENV['CONTENTFUL_SPACE_ID'],
    apps_type: ENV['CONTENTFUL_APPS_TYPE']
  }

  LOCALES = %w/
    de-DE
    de-AT
    de-CH
    se-SE
    no-NO
    dk-DK
    pl-PL
    nl-NL
    nl-BE
  /

  def perform
    LOCALES.each do |locale|
      puts "synching locale #{locale}"
      app_list = AppList.new SETTINGS.merge locale: locale
      app_list.sync
    end

    puts "done"
  end
end
