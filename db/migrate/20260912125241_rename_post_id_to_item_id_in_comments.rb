class RenamePostIdToItemIdInComments < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :comments, :posts
    rename_column :comments, :post_id, :item_id
    add_foreign_key :comments, :items
  end
end