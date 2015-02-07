class DropMediaItem < ActiveRecord::Migration
  def change
    drop_table :media_item
  end
end
