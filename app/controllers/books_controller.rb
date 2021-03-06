class BooksController < ApplicationController

  def new
    @book = Book.new
    @search_form = WorksController::SearchForm.new
  end

  def search_google
    searcher = GoogleBooks::SearchProxy.new(google_search_params)
    adapter = GoogleBooks::SearchAdapter.new(searcher.search)
    @works = adapter.translate
  end

  private

  def google_search_params
    params.require(:works_search).permit(:contains, :title, :author, :identifiers).symbolize_keys
  end

end
