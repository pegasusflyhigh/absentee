class Role < ApplicationRecord
  validates_uniqueness_of :name
end
