class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :status
      t.date :created_at
      t.date :ordered_at
      t.date :pulled_at
      t.date :shipped_at
      t.decimal :ship_cost
      t.date :paid_at
      t.decimal :paid_amt
      t.timestamps
    end
  end
end
