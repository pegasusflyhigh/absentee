class AddActiveToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :active, :boolean
  end
end
