class AddPublisherPublishedDateToMediaItems < ActiveRecord::Migration
  def change
    add_column :media_items, :publisher, :string
    add_column :media_items, :publishedDate, :date
  end
end
