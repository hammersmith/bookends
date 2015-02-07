class Book < ActiveRecord::Base
  belongs_to :work
  belongs_to :order
  belongs_to :donation
  belongs_to :recipient, foreign_key: 'user_id', class_name: 'User'
end
