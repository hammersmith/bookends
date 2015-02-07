class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :book_qty
      t.decimal :cash_amt
      t.date :thanked_at

      t.timestamps
    end
  end
end
