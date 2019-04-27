class Standard < ApplicationRecord
  belongs_to :school
  has_many :attendance_sheets
  has_many :students
  belongs_to :class_teacher, class_name: 'User', foreign_key: 'class_teacher_id' 
end
