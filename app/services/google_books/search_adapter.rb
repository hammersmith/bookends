module GoogleBooks
  class SearchAdapter

    def initialize(data)
      @data = data
    end

    def translate
      @data.map do |entry|
        {}.tap do |result|
          volume = entry[:volumeInfo]
          result[:title] = volume[:title]
          result[:author] = volume[:authors].join(' ')
          result[:publisher] = volume[:publisher]
          result[:published_on] = volume[:publishedDate]
          result[:media_format] = volume[:printType].titleize
          result[:description] = volume[:description]

          image_urls = volume[:imageLinks] || {}
          result[:image_url] = image_urls[:thumbnail]

          result[:source] = {
            provider: 'google_books',
            provider_key: entry[:id],
            provider_url: entry[:selfLink]
          }

          result[:identifiers] = volume[:industryIdentifiers].map do |identifier|
            {
              code_type: identifier[:type].downcase,
              code: identifier[:identifier]
            }
          end
        end
      end
    end

  end
end
