class Student < ApplicationRecord
  belongs_to :standard
  has_many :attendance_entries

  validates_format_of :primary_number, :with =>  /\d[0-9]\)*\z/ , :message => "Mobile number not valid!"
  validates_format_of :secondary_number, :with =>  /\d[0-9]\)*\z/ , :message => "Mobile number not valid!"
  validates :primary_number, :secondary_number, length: { is: 10 }
end
