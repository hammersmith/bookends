module GoogleBooks

  config = YAML.load_file(Rails.root.join('config', 'google_books.yml'))[Rails.env]

  @@url = config['url']
  @@api_key = config['api_key']

  mattr_reader :url, :api_key

end
