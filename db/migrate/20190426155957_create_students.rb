class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.integer :roll_number
      t.string :name
      t.string :primary_number
      t.string :secondary_number
      t.string :preferred_language

      t.timestamps
    end
  end
end
