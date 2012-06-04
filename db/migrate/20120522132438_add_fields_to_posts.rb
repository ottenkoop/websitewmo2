class AddFieldsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :category_id, :integer
  end

  def down
  	remove_index :posts, :category
  end
end
