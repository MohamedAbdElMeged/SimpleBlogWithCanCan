class AddColumnToPostsComments < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :posts, :author_id, :integer, default: false
    add_column :comments, :author_id, :integer, default: false


  end
end
