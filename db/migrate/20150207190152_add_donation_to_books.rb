class AddDonationToBooks < ActiveRecord::Migration
  def change
    add_column :books, :donation, :integer
  end
end
