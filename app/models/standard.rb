class Standard < ApplicationRecord
  has_many :attendance_sheets
  has_many :students
end
