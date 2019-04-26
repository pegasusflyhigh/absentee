class AddAttendanceSheetAndStudentReferenceToAttendanceEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendance_entries, :attendance_sheet, foreign_key: true
    add_reference :attendance_entries, :student, foreign_key: true
  end
end
