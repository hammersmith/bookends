class WorkSearch

  def self.search(query:)
    search = Work.search do
      fulltext query
    end

    search.results
  end

end
