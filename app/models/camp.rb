class Camp < ApplicationRecord
  SUPPLIES = ["Nevera", "Madera", "Camping chair", "Camping Lanterns"]
  has_many :reviews, dependent: :destroy
  has_many :supplies, through: :camp_supplies

  validates :title, presence: true, uniqueness: true
end
