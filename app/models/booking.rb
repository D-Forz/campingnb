class Booking < ApplicationRecord
  belongs_to :camp
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validates :start_date, :end_date, uniqueness: { scope: :camp_id }, in: :camp_start_date_range
  validates_inclusion_of :start_date, in: :camp_start_date_range

  private

  def camp_start_date_range
    (camp.start_date..camp.end_date)
  end
end
