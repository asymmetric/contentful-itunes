class App
  attr_reader :settings
  attr_reader :contentful_id

  def initialize(contentful_entry, settings)
    @contentful_entry = contentful_entry
    @settings = settings
  end

  def fields
    {
      contentful_id: @contentful_entry.sys[:id],
      contentful_fields: @contentful_entry.fields
    }
  end

  private
  # TODO this is a workaround for a problem in contentful: if the entry is
  # localized, we only get the localized fields, not the unlocalized ones
  def all_fields
    @all_fields ||= @contentful_entry.fields_for_query
  end
end
