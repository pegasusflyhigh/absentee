class AttendanceSheet < ApplicationRecord
  belongs_to :standard
  has_many :attendance_entries
 
  accepts_nested_attributes_for :attendance_entries
end
