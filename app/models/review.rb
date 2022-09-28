class Review < ApplicationRecord
  belongs_to :camp

  validates :content, :rating, presence: true
end
