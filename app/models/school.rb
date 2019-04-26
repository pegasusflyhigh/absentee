class School < ApplicationRecord
  has_many :users
  validates_presence_of :name
  validates_presence_of :registration_number
  validates_uniqueness_of :registration_number
end
