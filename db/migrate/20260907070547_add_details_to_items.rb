class AddDetailsToItems < ActiveRecord::Migration[8.1]
  def change
    add_column :items, :description, :text
    add_column :items, :location, :string
    add_column :items, :status, :string
  end
end
