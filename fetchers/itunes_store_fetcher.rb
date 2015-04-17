class ItunesStoreFetcher
  include HTTParty
  base_uri 'http://itunes.apple.com'
  format :json

  def self.run(fields, locale)
    ios_info = {}
    country_code = parse_country_code(locale)

    [:iOsUniversalId, :iOsPhoneId, :iOsTabletId].each do |item_name|
      if (fields[item_name])
        app_store_id = fields[item_name]
        item_slug = item_name[3..-3].downcase

        result = get("/#{country_code}/lookup", query: { id: app_store_id })

        if result['resultCount'].to_i > 0
          ios_info[item_slug] = result['results'][0]
        end
      end
    end

    ios_info
  end

  private
  def self.parse_country_code(locale)
    locale.split('-').last.downcase
  end
end