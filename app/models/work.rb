class Work < ActiveRecord::Base

  MEDIA_FORMATS = %w(Book CD DVD)

  belongs_to :location
  has_many :identifiers
  has_many :books
  has_one :source

  validates :title, :author, :media_format, presence: true
  validates :media_format, inclusion: { in: MEDIA_FORMATS, message: '%{value} is not a valid format' }
end
