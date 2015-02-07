class Order < ActiveRecord::Base
  has_many :books
  belongs_to :recipient, foreign_key: 'user_id', class_name: 'User'
end
