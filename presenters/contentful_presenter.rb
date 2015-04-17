class ContentfulPresenter
  def self.build(fields)
    contentful_fields = fields[:contentful_fields]
    itunes_fields = fields[:itunes_fields]
    image_urls = extract_image_urls(itunes_fields)

    contentful_fields.merge({
      longDescription: itunes_fields["description"],
      galleryTablet:   image_urls[:tablet],
      galleryPhone:    image_urls[:phone]
    })
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
end
