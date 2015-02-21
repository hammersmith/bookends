require 'test_helper'

class WorkSearchTest < UnitTestCase

  test 'should search for Works' do
    results = WorkSearch.search(query: 'stuff')
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :fulltext, 'stuff'
  end

end
