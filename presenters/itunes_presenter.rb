class ItunesPresenter
  include Presenter

  def self.run(app)
    itunes_keys = [ 
      "artworkUrl512", 
      "trackName", 
      "formattedPrice", 
      "description", 
      "screenshotUrls", 
      "trackViewUrl"
    ]
    itunes = app[:app_store_info].present? ? app[:app_store_info]["universal"] : {}

    format_data(itunes, itunes_keys)
  end
end
