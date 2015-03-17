module GoogleBooks
  class SearchProxy

    FIELD_MAPPING = {
      contains: '',
      title: 'intitle:',
      author: 'inauthor:',
      publisher: 'ininpublisher:',
      identifier: 'isbn:',
    }.freeze

    def initialize(query)
      @query = parse_search_params(query)
    end

    def search
      return [] if @query.blank?

      query_string = build_query.merge({ key: GoogleBooks.api_key })

      connection = Faraday.new
      response = connection.get GoogleBooks.url, query_string
      JSON.parse(response.body, symbolize_names: true)[:items]
    end

    private

    def parse_search_params(params)
      params.symbolize_keys.reject { |_,v| v.blank? }
    end

    def build_query
      search_parts = [].tap do |terms|
        FIELD_MAPPING.each do |bookend_key, google_field|
          terms << "#{google_field}#{@query[bookend_key]}" if @query[bookend_key]
        end
      end.join(' ')

      { q: search_parts }
    end

  end
end
