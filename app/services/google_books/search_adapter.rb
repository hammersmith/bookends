module GoogleBooks
  class SearchAdapter

    def initialize(data)
      @data = data
    end

    def translate
      @data.map do |entry|

        volume = entry[:volumeInfo]
        image_urls = volume[:imageLinks] || {}

        work = Work.new(
          title:        volume[:title],
          author:       volume[:authors].join(' '),
          publisher:    volume[:publisher],
          published_on: volume[:publishedDate],
          media_format: volume[:printType].titleize,
          description:  volume[:description],
          image_url:    image_urls[:thumbnail]
        )

        work.build_source(
          provider:     'google_books',
          provider_key: entry[:id],
          provider_url: entry[:selfLink]
        )

        (volume[:industryIdentifiers] || []).each do |identifier|
          work.identifiers.build(
            code_type: identifier[:type].downcase,
            code: identifier[:identifier]
          )
        end

        work
      end
    end

  end
end
