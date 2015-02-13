class Work < ActiveRecord::Base
  has_many :identifiers
  belongs_to :location
end
