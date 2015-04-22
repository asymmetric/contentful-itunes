class ItunesStoreFetcher
  include HTTParty
  base_uri 'http://itunes.apple.com'
  format :json

  DEFAULT_CONTENTFUL_LOCALE = "en-US"

  def self.run(fields, locale)
    ios_info = {}
    country_code = parse_country_code(locale)

    [:iOsUniversalId, :iOsTabletId, :iOsPhoneId ].each do |item_name|
      if (fields[item_name])
        app_store_id = fields[item_name][DEFAULT_CONTENTFUL_LOCALE]
        device_type = item_name[3..-3].downcase

        result = get("/#{country_code}/lookup", query: { id: app_store_id })

        if result['resultCount'].to_i > 0
          ios_info[device_type] = result['results'][0]
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
