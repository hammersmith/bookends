class WorksController
  class SearchForm
    include ActiveModel::Model

    attr_accessor :query, :contains, :media_format, :title, :author, :available

    def self.model_name
      ActiveModel::Name.new(self, nil, 'works_search')
    end
  end
end
