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

  test 'should search by author' do
    searcher = WorkSearch.new(author: 'Faulkner')
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :fulltext do
      fulltext 'Faulkner' do
        fields :author
        boost_fields author: 2.0
      end
    end
  end

  test 'should search by two fields' do
    searcher = WorkSearch.new(title: 'Moses', author: 'Faulkner')
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :fulltext do
      fulltext 'Moses' do
        fields :title
        boost_fields title: 2.5
      end
      fulltext 'Faulkner' do
        fields :author
        boost_fields author: 2.0
      end
    end
  end

  test 'should search by three fields' do
    searcher = WorkSearch.new(title: 'Moses', author: 'Faulkner', contains: 'book')
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :fulltext do
      fulltext 'Moses' do
        fields :title
        boost_fields title: 2.5
      end
      fulltext 'Faulkner' do
        fields :author
        boost_fields author: 2.0
      end
      fulltext 'book' do
        fields :description
      end
    end
  end

  test 'should search with attributes if given' do
    searcher = WorkSearch.new(available: '1', media_format: 'Book')
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :with, :available, true
    assert_has_search_params Sunspot.session, :with, :media_format, 'Book'
  end

  test 'should search by ISBN if given' do
    searcher = WorkSearch.new(identifiers: '9781234567890')
    assert_instance_of WorkSearch, searcher

    results = searcher.results
    assert_equal [], results
    assert_is_search_for Sunspot.session, Work
    assert_has_search_params Sunspot.session, :with, :identifiers, '9781234567890'
  end

end
