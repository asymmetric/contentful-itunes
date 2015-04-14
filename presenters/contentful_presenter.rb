class ContentfulPresenter
  def self.run(app)
    if app[:contentful_fields].present?
      contentful_info = app[:contentful_fields]

      { 
        title: contentful_info["nameIntern"],
        short_description: contentful_info["shortDescription"],
        images: contentful_info["gallery"],
        promo_video: contentful_info["promoVideo"]
      }
    end
  end
end
