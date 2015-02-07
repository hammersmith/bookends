class Work < ActiveRecord::Base
  has_many :books
  has_one :source
end
