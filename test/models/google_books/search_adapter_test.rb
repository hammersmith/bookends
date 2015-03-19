require 'test_helper'

module GoogleBooks
  class SearchAdapterTest < UnitTestCase

    test 'should translate data' do
      google_data = JSON.parse(File.read('test/models/google_books/sample_response.json'), symbolize_names: true)

      adapter = SearchAdapter.new(google_data)
      expected = [
        {
          title: 'Harry Potter and the Prisoner of Azkaban',
          author: 'J.K. Rowling',
          publisher: 'Pottermore',
          published_on: '2012-03-27',
          media_format: 'Book',
          description: google_data.first[:volumeInfo][:description],
          image_url: 'http://books.google.com/books/content?id=Sm5AKLXKxHgC&printsec=frontcover&img=1&zoom=1&source=gbs_api',
          source: {
            provider: 'google_books',
            provider_key: 'Sm5AKLXKxHgC',
            provider_url: 'https://www.googleapis.com/books/v1/volumes/Sm5AKLXKxHgC'
          },
          identifiers: [
            { code_type: 'isbn_13', code: '9781781100295' },
            { code_type: 'isbn_10', code: '1781100292' }
          ]
        }
      ]

      assert_equal expected, adapter.translate
    end

  end
end
