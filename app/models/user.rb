class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :camps, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :camps

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def owner?(camp)
    camp.user == self
  end

  def reviewed?(camp)
    camp.bookings.where(user: self).any? && camp.reviews.where(user: self).empty?
  end

  def booked?(camp)
    camp.bookings.where(user: self).any?
  end
end
