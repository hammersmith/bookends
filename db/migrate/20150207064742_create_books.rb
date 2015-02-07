class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :status
      t.string :condition
      t.date :created_at
      t.integer :donor_user_id
      t.integer :recipient_user_id
      t.date :sent_at
      t.integer :work_id

      t.timestamps
    end
  end
end
