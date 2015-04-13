class App
  def initialize(fields)
    @fields = fields
  end

  def fields
    {
      contentful_fields: fields
    }
  end
end
