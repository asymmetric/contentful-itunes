class AppList
  def initialize(settings)
    @settings = settings
    Contentful::Management::Client.new(settings[:access_token])

    @contentful = Contentful::Management::Space.find(settings[:space])
  end

  def all(stores_info = true)
    @contentful.entries.all.map { |app| get(app.sys[:id], stores_info) }
  end

  def teasers(stores_info = true)
    @contentful.entries.all.map { |app| teaser(app.sys[:id], stores_info) }
  end

  private
  def get(app_id, stores_info = true)
    fields = @contentful.entries.find(app_id).fields

    app = App.new(fields, @settings)

    app = app.extend(StoresInfo) if stores_info

    app.fields
  end
end
