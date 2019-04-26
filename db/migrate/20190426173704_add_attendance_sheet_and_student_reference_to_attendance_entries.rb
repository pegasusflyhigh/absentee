class AddAttendanceSheetAndStudentReferenceToAttendanceEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendance_entries, :attendance_sheet, foreign_key: { to_table: :attendance_entries }
    add_reference :attendance_entries, :student, foreign_key: { to_table: :attendance_entries }
  end
end
