class ContentfulPresenter
  def self.build(fields)
    contentful_fields = fields[:contentful_fields]
    itunes_fields     = fields[:itunes_fields]["universal"]

    contentful_fields.merge({
      longDescription: itunes_fields["description"]
    })
  end
end
