json.works @works do |work|
  json.(work, :title, :author, :description, :media_format, :publisher, :published_on, :image_url)
  json.location do
    json.(work.location, :name, :shelf, :color)
  end
end
