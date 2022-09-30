class Camp < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :bookmarks
  has_many_attached :photos

  validates :name, :location, :start_date, :end_date, presence: true
  validates :description, length: { minimum: 20 }, allow_blank: false
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..10 }
  validates :photos, presence: true
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date

  private

  def start_date_cannot_be_in_the_past
    return unless start_date.present? && start_date < Date.today

    errors.add(:start_date, "can't be in the past")
  end

  def end_date_cannot_be_before_start_date
    return unless end_date.present? && end_date <= start_date + 7.days

    errors.add(:end_date, "can't be before start date and must be at least 7 days after start date")
  end
end
