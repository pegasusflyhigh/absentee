class CreateAttendanceEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_entries do |t|
      t.boolean :is_present, default: true

      t.timestamps
    end
  end
end
