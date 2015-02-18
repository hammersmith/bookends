class Book < ActiveRecord::Base
  belongs_to :work
  has_one :order

  enum status: [:available, :reserved, :pulled, :shipped, :lost, :discarded]

end
