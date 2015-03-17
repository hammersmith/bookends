require 'test_helper'

class GoogleBooksSearchTest < UnitTestCase

  test 'should parse search query' do
    search = GoogleBooksSearch.new(
      'title'       => 'test',
      'author'      => 'someone',
      'description' => ''
    )

    expected = {
      title:  'test',
      author: 'someone'
    }

    assert_equal expected, search.instance_variable_get(:@query)
  end

  test 'should build appropriate query' do
    search = GoogleBooksSearch.new(
      title: 'Go Down Moses',
      author: 'William Faulkner',
      contains: 'some text'
    )

    expected = {
      q: 'some text intitle:Go Down Moses inauthor:William Faulkner'
    }

    assert_equal expected, search.send(:build_query)
  end

  test 'should not perform blank search' do
    gb_search = GoogleBooksSearch.new({})

    assert_equal [], gb_search.search
  end

  test 'should perform search' do
    stub_request(
      :get,
      "#{GoogleBooks.url}?key=#{GoogleBooks.api_key}&q=Go+Down+Moses"
    ).to_return(body: '{"items":"results"}')

    gb_search = GoogleBooksSearch.new(
      contains: 'Go Down Moses'
    )

    assert_equal 'results', gb_search.search
  end

end
