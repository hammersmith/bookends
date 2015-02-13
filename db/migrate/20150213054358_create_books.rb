class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.timestamps
      t.integer :work_id
      t.string  :status
      t.string  :condition
    end
  end
end
