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

  searchable do
    text :title, as: :title_substring_text
    text :author, as: :author_substring_text
    text :description, :media_format
    boolean :available do
      books.any?(&:available?)
    end
  end

  after_touch :index
end
