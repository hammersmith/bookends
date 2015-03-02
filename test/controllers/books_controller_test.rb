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

end
