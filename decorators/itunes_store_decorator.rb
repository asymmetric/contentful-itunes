module ItunesStoreDecorator
  def fields
    original_fields = super
    store_info = ItunesStoreFetcher.run(original_fields[:contentful_fields], settings[:country_code])

    original_fields.merge(itunes_fields: store_info)
  end
end
