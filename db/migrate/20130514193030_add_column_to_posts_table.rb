class AddColumnToPostsTable < ActiveRecord::Migration
  def up
    add_column :posts, :secure_hex, :string
  end

  def down
    remove_column :posts, :secure_hex, :string
  end
end
