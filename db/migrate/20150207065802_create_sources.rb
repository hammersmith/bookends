class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :provider
      t.string :provider_key
      t.text :provider_url

      t.timestamps
    end
  end
end
