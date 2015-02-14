class Location < ActiveRecord::Base
  has_many :works

  validates :name, :shelf, :color, presence: true
end
