module Presenter
  private
  def format_data(store, data)
    {
      title_image: store[data[0]],
      title: store[data[1]],
      price: store[data[2]],
      long_description: store[data[3]],
      images: store[data[4]],
      link: store[data[5]]
    }
  end
end
