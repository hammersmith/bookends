class AddIsbnToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :isbn, :string
  end
end
