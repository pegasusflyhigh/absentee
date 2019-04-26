class AttendanceEntry < ApplicationRecord
  belongs_to :attendance_sheet
  belongs_to :student
end
