class ContentfulPresenter
  def self.build(fields)
    contentful_fields = fields[:contentful_fields]
    itunes_fields = fields[:itunes_fields]

    if !itunes_fields.empty?
      image_urls = extract_image_urls(itunes_fields)
      description = extract_description(itunes_fields)

      contentful_fields.merge({
        longDescription: description,
        galleryTablet:   image_urls[:tablet],
        galleryPhone:    image_urls[:phone]
      })
    else
      nil
    end

  end

  private
  def self.extract_image_urls(fields)
    phone = tablet = {}

    if fields["universal"]
      phone = fields["universal"]["screenshotUrls"]
      tablet = fields["universal"]["ipadScreenshotUrls"]
    else
      if fields["tablet"]
        tablet = fields["tablet"]["ipadScreenshotUrls"]
      end
      if fields["phone"]
        phone = fields["phone"]["screenshotUrls"]
      end
    end

    { phone: phone, tablet: tablet }
  end

  def self.extract_description(fields)
    hash = fields["universal"] || fields["tablet"] || fields["phone"]

    hash["description"]
  end
end
