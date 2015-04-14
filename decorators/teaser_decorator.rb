module TeaserDecorator
  def fields
    original_fields = super

    our_fields = {
      :contentful => ContentfulPresenter.run(app),
      :itunes => ItunesPresenter.run(app),
      :playstore => PlayStorePresenter.run(app)
    }

    our_fields.merge original_fields
  end
end
