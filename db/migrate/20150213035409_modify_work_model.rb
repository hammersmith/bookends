class ModifyWorkModel < ActiveRecord::Migration
  def change
    remove_column :works, :isbn, :integer
    remove_column :works, :remote_id, :string
    remove_column :works, :quantity, :integer
    remove_column :works, :category, :string

    rename_column :works, :format, :media_format

    add_column :works, :publisher, :string
    add_column :works, :published_on, :date
    add_column :works, :category_id, :integer
    add_column :works, :image_url, :string
  end
end
