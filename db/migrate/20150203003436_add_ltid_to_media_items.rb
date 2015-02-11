class AddLtidToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :ltid, :string
  end
end
