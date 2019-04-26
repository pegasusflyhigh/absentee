class AddStandardReferenceToAttendanceSheets < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendance_sheets, :standard, foreign_key: true
  end
end
