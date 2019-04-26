class AddUpdatedByReferenceToAttendanceEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :attendance_entries, :updated_by, foreign_key: { to_table: :users }
  end
end
