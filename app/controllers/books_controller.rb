class BooksController < ApplicationController

  def new
    @book = Book.new
    @search_form = WorksController::SearchForm.new
  end

end
