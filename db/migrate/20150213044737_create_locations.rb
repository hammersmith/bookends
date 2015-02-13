class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.timestamps
      t.string :name
      t.string :shelf
      t.string :color
    end

    rename_column :works, :category_id, :location_id
  end
end
