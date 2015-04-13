module StoresInfo
  def initialize
  end

  def fields
    original_fields = super.fields
    play_store_info = original_fields[:gpUniversalId].blank ? {} : get_play_store_info(item[:contentful_fields][:gpUniversalId])

    our_fields = {
      app_store_info: get_app_store_info(original_fields),
      play_store_info: play_store_info
    }

    original_fields.merge our_fields
  end
end
