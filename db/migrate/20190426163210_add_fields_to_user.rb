class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role, :string
    add_column :users, :name, :string
    add_column :users, :mobile_number, :string
    add_column :users, :active, :boolean
  end
end
