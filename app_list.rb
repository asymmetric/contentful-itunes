require_relative 'app'
Dir["decorators/*.rb"].each { |file| require_relative file }
Dir["presenters/*.rb"].each { |file| require_relative file }

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
    @contentful.entries.all.map { |app| get(app.sys[:id], :as_teasers) }
  end

  private
  def get(app_id, teasers = false)
    fields = @contentful.entries.find(app_id).fields

    app = App.new(fields, @settings)

    app = app.extend(StoresDecorator)
    app = app.extend(TeaserDecorator) if teasers

    app.fields
  end

end
