class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.timestamps
      t.string  :provider
      t.string  :provider_key
      t.string  :provider_url
      t.integer :work_id
    end
  end
end
