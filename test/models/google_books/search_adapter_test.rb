require 'test_helper'

module GoogleBooks
  class SearchAdapterTest < UnitTestCase

    test 'should translate data' do
      google_data = JSON.parse(File.read('fixtures/google_books_response.json'), symbolize_names: true)[:items]

      adapter = SearchAdapter.new(google_data)

      expected_work = Work.new(
        title:        'Harry Potter and the Prisoner of Azkaban',
        author:       'J.K. Rowling',
        publisher:    'Pottermore',
        published_on: '2012-03-27',
        media_format: 'Book',
        description:  google_data.first[:volumeInfo][:description],
        image_url:    'http://books.google.com/books/content?id=Sm5AKLXKxHgC&printsec=frontcover&img=1&zoom=1&source=gbs_api'
      )

      expected_work.build_source(
        provider:     'google_books',
        provider_key: 'Sm5AKLXKxHgC',
        provider_url: 'https://www.googleapis.com/books/v1/volumes/Sm5AKLXKxHgC'
      )

      identifiers = [
        { code_type: 'isbn_13', code: '9781781100295' },
        { code_type: 'isbn_10', code: '1781100292' },
      ]

      identifiers.each do |identifier|
        expected_work.identifiers.build(identifier)
      end

      actual_work = adapter.translate.first
      assert_equal expected_work.attributes, actual_work.attributes
      assert_equal expected_work.source.attributes, actual_work.source.attributes
      assert_equal expected_work.identifiers[0].attributes, actual_work.identifiers[0].attributes
      assert_equal expected_work.identifiers[1].attributes, actual_work.identifiers[1].attributes
    end

  end
end
