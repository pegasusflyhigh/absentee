class Standard < ApplicationRecord
  belongs_to :school
  has_many :attendance_sheets
  has_many :students
end
