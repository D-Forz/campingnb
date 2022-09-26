class Booking < ApplicationRecord
  belongs_to :camp
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start_date, :end_date, presence: true
end
