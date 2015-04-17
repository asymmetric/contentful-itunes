module ItunesStoreDecorator
  def fields
    original_fields = super
    store_info = ItunesStoreFetcher.run(all_fields, settings[:locale])

    original_fields.merge(itunes_fields: store_info)
  end
end
