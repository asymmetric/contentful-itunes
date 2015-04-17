class App
  attr_reader :settings
  attr_reader :contentful_id

  def initialize(contentful_entry, settings)
    @fields = contentful_entry.fields
    @contentful_id = contentful_entry.sys[:id]
    @settings = settings
  end

  def fields
    {
      contentful_id: @contentful_id,
      contentful_fields: @fields
    }
  end
end
