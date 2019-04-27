class Student < ApplicationRecord
  belongs_to :standard
  has_many :attendance_entries

  validates_presence_of :roll_number, :name, :standard_id
  validates_format_of :primary_number, :with =>  /\d[0-9]\)*\z/ , :message => I18n.t('error.invalid', attribute: 'primary number')
  validates_format_of :secondary_number, :with =>  /\d[0-9]\)*\z/ , :message => I18n.t('error.invalid', attribute: 'secondary number'), if: :secondary_number
end
