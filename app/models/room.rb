class Room < ApplicationRecord
  has_many :attendances
  self.primary_key = :title
end
