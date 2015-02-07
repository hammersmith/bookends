class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :publisher
      t.date :published_at

      t.timestamps
    end
  end
end
