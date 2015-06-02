require_relative 'presenter'

class PlayStorePresenter
  include Presenter

  def self.run(app)
    playstore_keys = [ 
      "logo", 
      "appName", 
      "price", 
      "description", 
      "thumbnails", 
      "playStoreUrl"
    ]   
    playstore = app[:play_store_info] || {}

    format_data(playstore, playstore_keys)
  end
end
