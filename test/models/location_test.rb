require 'test_helper'

class LocationTest < UnitTestCase

  test 'validate presence of attributes' do
    location = Location.new
    assert_not_predicate location, :valid?
    assert_equal ["can't be blank"], location.errors.messages[:name]
    assert_equal ["can't be blank"], location.errors.messages[:shelf]
    assert_equal ["can't be blank"], location.errors.messages[:color]
  end

end
