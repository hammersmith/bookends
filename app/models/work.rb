class Work < ActiveRecord::Base
  belongs_to :location
  has_many :identifiers
  has_many :books
  has_one :source
end
