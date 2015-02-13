class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :first_name
      t.string :last_name
      t.string :lt_name
      t.string :work_country
      t.string :how_referred
      t.string :kid_info
      t.string :book_prefs
      t.boolean :homeschooled
      t.string :delivery_method
      t.integer :primary_ship_addr
      t.integer :secondary_ship_addr
      t.string :courier_email

      t.timestamps
    end
  end
end
