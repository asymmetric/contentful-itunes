class PlayStoreFetcher
  include HTTParty
  base_uri 'http://api.playstoreapi.com/v1.1/apps'
  format :json

  def self.run(fields, token, country_code)
    if id = fields[:gpUniversalId]
      get("/#{id}", query: { hl: country_code, key: token })
    else
      {}
    end
  end
end
