require 'test_helper'

class BookTest < UnitTestCase

  test 'should return available Books' do
    available_book = create :book, status: :available
    create :book, status: :reserved

    assert_equal [available_book], Book.available
  end

end
