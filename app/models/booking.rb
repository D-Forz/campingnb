class Booking < ApplicationRecord
  belongs_to :camp
  belongs_to :user

  validates :start_date, :end_date, presence: true, uniqueness: { scope: :camp_id }
  validates_inclusion_of :start_date, :end_date, in: :camp_start_date_range
  validate :booking_overlapping?

  private

  def camp_start_date_range
    (camp.start_date..camp.end_date)
  end

  def booking_overlapping?
    if Booking.where(camp_id:).where.not(id:).where("start_date <= ? AND end_date >= ?", end_date, start_date).any?
      errors.add(:start_date, "and end date overlap with another booking")
    end
  end
end
