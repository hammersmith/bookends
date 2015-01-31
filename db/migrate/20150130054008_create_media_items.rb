class CreateMediaItems < ActiveRecord::Migration
  def change
    create_table :media_items do |t|
      t.timestamps
      t.string  :remote_id
      t.string  :title
      t.string  :author
      t.text    :description
      t.string  :category
      t.string  :format
      t.integer :isbn
      t.integer :quantity
    end
  end
end
