require 'test_helper'

class BooksControllerTest < ControllerTestCase

  def setup
    sign_in create(:user)
  end

  test 'should set blank new book' do
    assert_no_difference 'Book.count' do
      get :new
    end

    assert_response :success
    assert_template 'books/new'
    assert_instance_of Book, assigns(:book)
  end

  test 'should search google' do
    stub_request(
      :get,
      "#{GoogleBooks.url}?key=#{GoogleBooks.api_key}&q=Text+intitle:Harry Potter+inauthor:JK Rowling+isbn:1234567"
    ).to_return(body: File.read('fixtures/google_books_response.json'))

    search_params = {
      title: 'Harry Potter',
      author: 'JK Rowling',
      contains: 'Text',
      identifiers: '1234567',
    }

    xhr :get, :search_google, works_search: search_params.merge(bogus: 'stuff')

    assert_response :success
    assert_template :search_google
    search_results = JSON.parse(@response.body, symbolize_names: true)
    assert_equal 'Harry Potter and the Prisoner of Azkaban', search_results[:works].first[:title]
  end

end
