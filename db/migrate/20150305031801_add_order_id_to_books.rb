class AddOrderIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :order_id, :integer
    add_column :books, :donation_id, :integer
  end
end
