module StoresInfo
  def fields
    original_fields = super.fields

    our_fields = {
      app_store_info:  AppStoreInfo.fetch(original_fields, @settings[:country_code]),
      play_store_info: PlayStoreInfo.fetch(original_fields, @settings[:country_code])
    }

    original_fields.merge our_fields
  end
end
