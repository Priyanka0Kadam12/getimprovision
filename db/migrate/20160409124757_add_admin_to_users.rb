class AddAdminToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :admin
    add_column :users, :admin, :boolean, default: false

  end
  def self.down
    # You can't currently remove default values in Rails

  end
  def change
    change_column :users, :admin, :boolean, :default => false
  end
end
