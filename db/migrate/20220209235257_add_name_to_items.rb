class AddNameToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :name, :string
    add_index :items, :name, unique: true
  end
end
