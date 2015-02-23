class WorkSearch

  FULL_TEXT_FIELDS = [:title, :author, :contains].freeze
  DEFAULT_BOOST = {
    title: 2.5,
    author: 2.0
  }.freeze

  def initialize(search_params)
    @search_params = parse_search_params(search_params)
  end

  def results
    return [] if @search_params.blank?

    search.results
  end

  private

  def parse_search_params(search_params)
    search_params.symbolize_keys.tap do |query|
      query.reject! { |_,v| v.blank? }
      filter_by_available = query.delete(:available) == '1'
      query[:available] = filter_by_available if filter_by_available
    end
  end

  def build_search_using(fields)
    Work.search do |query|
      constrain query, with: [:available, :media_format]
      fields.each do |field|
        query.fulltext @search_params[field] do |text|
          if field == :contains
            text.boost_fields DEFAULT_BOOST
          else
            text.fields(field)
            text.boost_fields field => DEFAULT_BOOST[field]
          end
        end
      end
    end
  end

  def constrain(query, with:)
    with.each do |field|
      query.with field, @search_params[field] if @search_params[field]
    end
  end

  def rename_contains
    @search_params[:description] = @search_params.delete(:contains)
  end

  def search
    text_search_fields = @search_params.keys & FULL_TEXT_FIELDS

    if text_search_fields.size == FULL_TEXT_FIELDS.size
      rename_contains
      text_search_fields.push(:description).delete(:contains)
    end

    build_search_using(text_search_fields)
  end

end
