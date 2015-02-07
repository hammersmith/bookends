class RemoveDonorIdFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :donor_user_id, :string
  end
end
