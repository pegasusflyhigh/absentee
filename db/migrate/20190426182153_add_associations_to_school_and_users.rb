class AddAssociationsToSchoolAndUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :school, index: true
    add_reference :users, :role, index: true
  end
end
