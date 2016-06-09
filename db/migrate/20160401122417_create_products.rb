class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      
      t.integer :likes
      t.text :comments

      t.timestamps
    end
  end
end
