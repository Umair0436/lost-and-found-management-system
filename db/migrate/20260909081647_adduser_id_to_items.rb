class AdduserIdToItems < ActiveRecord::Migration[8.1]
  def change
    add_column :items, :user_id, :integer
  end
end
