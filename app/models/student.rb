class Student < ApplicationRecord
  belongs_to :standard
  has_many :attendance_entries
end
