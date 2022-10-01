class Review < ApplicationRecord
  belongs_to :camp
  belongs_to :user

  validates :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 0..5 }
end
