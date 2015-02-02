class AddFieldsToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :pub, :string
    add_column :media_items, :date, :string
    add_column :media_items, :tags, :string
    add_column :media_items, :collections, :string
    add_column :media_items, :isbns, :string
  end
end
