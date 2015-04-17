class App
  attr_reader :settings
  attr_reader :contentful_id

  def initialize(contentful_entry, settings)
    @fields = contentful_entry.fields
    @all_fields = contentful_entry.fields_for_query
    @contentful_id = contentful_entry.sys[:id]
    @settings = settings
  end

  def fields
    {
      contentful_id: @contentful_id,
      contentful_fields: @fields
    }
  end

  private
  # TODO this is a workaround for a problem in contentful: if the entry is
  # localized, we only get the localized fields, not the unlocalized ones
  def all_fields
    @all_fields
  end
end
