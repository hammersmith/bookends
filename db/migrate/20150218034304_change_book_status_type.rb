class ChangeBookStatusType < ActiveRecord::Migration
  def up
    change_column :books, :status, :integer, default: 0
  end

  def down
    change_column :books, :status, :string
  end
end
