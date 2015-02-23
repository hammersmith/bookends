require 'test_helper'

class WorkSearchTest < UnitTestCase

  test 'should skip search without a query' do
    Work.class.expects(:search).never
    searcher = WorkSearch.new({})
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
  end

  test 'should search for Works' do
    searcher = WorkSearch.new(contains: 'text')
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :fulltext do
      fulltext 'text' do
        boost_fields title: 2.5, author: 2.0
      end
    end
  end

  test 'should search by title' do
    searcher = WorkSearch.new(title: 'Moses')
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :fulltext do
      fulltext 'Moses' do
        fields :title
        boost_fields title: 2.5
      end
    end
  end

end
