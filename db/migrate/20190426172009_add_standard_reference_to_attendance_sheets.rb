class AddStandardReferenceToAttendanceSheets < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendance_sheets, :standard, foreign_key: { to_table: :attendance_sheets }
  end
end
