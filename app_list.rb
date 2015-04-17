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
    contentful_entries =
      @contentful.
        entries.
        all(content_type: apps_type)

    @data = contentful_entries.map do |entry|
      entry.locale = @settings[:locale]
      get_stores_data(entry)
    end
  end

  def push
    @data.each do |app_fields|
      contentful_entry = @contentful.entries.find(app_fields[:contentful_id])
      contentful_entry.locale = @settings[:locale]

      contentful_entry.update ContentfulPresenter.build(app_fields)
    end
  end

  private
  def get_stores_data(contentful_entry)
    app = App.new(contentful_entry, @settings)

    app.extend(ItunesStoreDecorator)

    app.fields
  end

  def apps_type
    @settings[:apps_type] || APPS_TYPE
  end
end
