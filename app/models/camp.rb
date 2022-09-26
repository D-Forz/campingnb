class Camp < ApplicationRecord
  belongs_to :user

  has_many :bookings
  has_many :bookmarks
end
