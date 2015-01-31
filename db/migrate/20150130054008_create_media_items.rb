class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.timestamps
      t.string  :title
      t.string  :type
      t.string  :author
      t.integer :isbn
    end
  end
end
