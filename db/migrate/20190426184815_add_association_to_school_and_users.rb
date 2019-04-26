class AddAssociationToSchoolAndUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :school, index: true, foreign_key: true
    add_reference :users, :role, index: true, foreign_key: true
  end
end
