class RenameMediaItemToWork < ActiveRecord::Migration
  def change
    rename_table :media_items, :works
  end
end
