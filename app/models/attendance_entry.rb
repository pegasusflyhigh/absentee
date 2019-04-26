class AttendanceEntry < ApplicationRecord
  belongs_to :attendance_sheet
  belongs_to :student
  belongs_to :updated_by, class_name: 'User'
  has_one :sms_detail
end
