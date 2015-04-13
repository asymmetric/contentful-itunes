class App
  attr_reader :settings

  def initialize(fields, settings)
    @fields = fields
    @settings = settings
  end

  def fields
    {
      contentful_fields: fields
    }
  end
end
