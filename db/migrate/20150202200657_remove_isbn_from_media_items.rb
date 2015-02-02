class RemoveIsbnFromMediaItems < ActiveRecord::Migration
  def change
    remove_column :media_items, :isbn, :int
  end
end
