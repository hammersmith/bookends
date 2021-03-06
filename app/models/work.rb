class Work < ActiveRecord::Base

  MEDIA_FORMATS = %w(Book CD DVD)

  belongs_to :location
  has_many :identifiers
  has_many :books
  has_one :source

  validates :title, :author, :media_format, :location, presence: true
  validates :media_format, inclusion: { in: MEDIA_FORMATS, message: '%{value} is not a valid format' }
  validates :published_on, date: true

  scope :available, -> { where(id: Book.available.select(:work_id)) }

  after_touch :index!

  searchable do
    text :title, as: :title_substring_text
    text :author, as: :author_substring_text
    text :description
    boolean :available, using: :available?
    string :media_format
    string :identifiers, multiple: true, using: :identifying_codes
  end

  def available?
    books.available.exists?
  end

  def identifying_codes
    identifiers.pluck(:code)
  end

end
