class Book < ActiveRecord::Base
  belongs_to :work, touch: true
  has_one :order

  enum status: [:available, :reserved, :pulled, :shipped, :lost, :discarded]

end
