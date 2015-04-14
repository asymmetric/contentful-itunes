module StoresDecorator
  def fields
    original_fields = super

    our_fields = {
      app_store_info:  AppStoreInfo.fetch(original_fields, settings[:country_code]),
      play_store_info: PlayStoreInfo.fetch(original_fields, settings[:play_store_api_token], settings[:country_code])
    }

    original_fields.merge our_fields
  end
end