class Beacon < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  validates :hardware_id, :title, presence: true
end
