class AddStandardReferenceToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :standard, foreign_key: { to_table: :students }
  end
end
