json.works @works do |work|
  json.(work, :title, :author, :description, :media_format, :publisher, :published_on, :image_url)

  json.source do
    json.(work.source, :provider, :provider_key, :provider_url)
  end

  json.identifiers work.identifiers do |identifier|
    json.(identifier, :code_type, :code)
  end
end
