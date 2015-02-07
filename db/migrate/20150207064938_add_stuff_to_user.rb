class AddStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_staff, :Boolean
    add_column :users, :lt_username, :string
    add_column :users, :country, :string
    add_column :users, :how_referred, :text
    add_column :users, :kid_info, :text
    add_column :users, :book_prefs, :text
    add_column :users, :homeschooled, :string
    add_column :users, :delivery_method, :string
    add_column :users, :shipping_addr1, :text
    add_column :users, :shipping_addr2, :text
    add_column :users, :courier_email, :string
  end
end
