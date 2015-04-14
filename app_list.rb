class AppList
  def initialize(settings)
    @settings = settings
    Contentful::Management::Client.new(settings[:access_token])

    @contentful = Contentful::Management::Space.find(settings[:space])
  end

  def all
    @contentful.entries.all.map { |app| get(app.sys[:id]) }
  end

  def teasers
    @contentful.entries.all.map { |app| get(app.sys[:id]) }
  end

  private
  def get(app_id)
    fields = @contentful.entries.find(app_id).fields

    app = App.new(fields, @settings)

    app = app.extend(StoresDecorator)

    app.fields
  end
end
