class RemovecountFromlike < ActiveRecord::Migration
  def change
    remove_column :likes, :count, :integer
  end
end
