class CreateIdentifiers < ActiveRecord::Migration
  def change
    create_table :identifiers do |t|
      t.timestamps
      t.integer :work_id
      t.string  :code
      t.string  :code_type
    end
  end
end
