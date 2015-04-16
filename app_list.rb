require_relative 'app'
Dir["decorators/*.rb"].each { |file| require_relative file }
Dir["fetchers/*.rb"].each { |file| require_relative file }
Dir["presenters/*.rb"].each { |file| require_relative file }

class AppList
  APPS_TYPE = 'content-type-id'

  def initialize(settings)
    @settings = settings
    Contentful::Management::Client.new(settings[:access_token])

    @contentful = Contentful::Management::Space.find(settings[:space])
  end

  def pull
    @entries =
      @contentful.
        entries.
        all(content_type: apps_type)

    ContentfulPresenter.build(@data)
  end

  private
  def get(app_id)
    fields = @entries.find { |app| app.sys[:id] = app_id }.fields

    app = App.new(fields, @settings)

    app = app.extend(ItunesStoreDecorator)

    app.fields
  end

  def apps_type
    @settings[:apps_type] || APPS_TYPE
  end
end
