class School < ApplicationRecord
  has_many :standards
  has_many :users
end
