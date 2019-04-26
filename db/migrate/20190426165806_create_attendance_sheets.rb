class CreateAttendanceSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :attendance_sheets do |t|
      t.date :date

      t.timestamps
    end
  end
end
