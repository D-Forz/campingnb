class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :camps, dependent: :destroy
  has_many :bookings
  has_many :bookmarks
  has_many :reviews, through: :camps

  def full_name
    "#{first_name} #{last_name}"
  end

  def owner?(camp)
    camp.user == self
  end

  def booked?(camp)
    camp.bookings.where(user: self).any?
  end

  def bookmarked?(camp)
    camp.bookmarks.where(user: self).any?
  end

  def reviewed?(camp)
    camp.reviews.where(user: self).any?
  end
end
