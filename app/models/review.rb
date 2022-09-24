class Review < ApplicationRecord
  belongs_to :user
  belongs_to :camp

  validates :rating, presence: true
end
