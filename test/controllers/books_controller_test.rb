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
    search_params = {
      title: 'Go Down Moses',
      author: 'William Faulkner',
      contains: 'Text',
      identifiers: '1234567',
    }

    expected_results = {
      works: [ { title: 'Go Down Moses' } ]
    }

    searcher = mock(search: expected_results)
    GoogleBooks::SearchProxy.expects(:new).with(search_params).returns(searcher)

    get :search_google, works_search: search_params.merge(bogus: 'stuff')

    assert_response :success
    search_results = JSON.parse(@response.body, symbolize_names: true)
    assert_equal expected_results, search_results
  end

end
