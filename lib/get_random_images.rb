def get_random_images
  collections = [
    151749,
    516071,
    949135,
    488514,
    1007074,
    1186428,
    1186428,
    966345,
    155679,
    415854,
    298137,
    298137,
    175083,
    1023843
  ]

  photos = Unsplash::Photo.random(:collections => [collections], :orientation => 'landscape', :count => 5)
  photos.each do |p|
    next unless Wallpaper.where(identifier: p.id).first.nil?

    w = Wallpaper.new
    w.identifier = p.id
    w.name = p.name
    w.description = p.description
    w.width = p.width
    w.height = p.height
    w.remote_image_url = p.urls.full
    w.fetched = DateTime.now
    w.save
  end
end
