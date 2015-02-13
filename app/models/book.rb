class Book < ActiveRecord::Base
  belongs_to :work
  has_one :order
end
