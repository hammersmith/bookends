class Identifier < ActiveRecord::Base
  belongs_to :work, touch: true
end
