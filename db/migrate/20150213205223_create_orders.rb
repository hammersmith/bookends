class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.timestamps
      t.integer  :user_id
      t.string   :status
      t.date     :created_on
      t.date     :ordered_on
      t.date     :pulled_on
      t.date     :shipped_on
      t.decimal  :ship_cost
      t.date     :paid_on
      t.decimal  :paid_amt
    end
  end
end
