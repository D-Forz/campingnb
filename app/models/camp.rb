class Camp < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many_attached :photos

  validates :name, :address, :start_date, :end_date, presence: true
  validates :description, length: { minimum: 20 }, allow_blank: false
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :capacity, presence: true, numericality: { only_integer: true }, inclusion: { in: 1..10 }
  validates :photos, presence: true, length: { maximum: 5 }
  validate :start_date_cannot_be_in_the_past
  validate :end_date_cannot_be_before_start_date
  validate :images_type

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def start_date_cannot_be_in_the_past
    return unless start_date.present? && start_date < Date.today

    errors.add(:start_date, "can't be in the past")
  end

  def end_date_cannot_be_before_start_date
    return unless end_date.present? && end_date <= start_date + 7.days

    errors.add(:end_date, "can't be before start date and must be at least 7 days after start date")
  end

  def images_type
    return unless photos.attached?

    photos.each do |photo|
      errors.add(:photos, 'needs to be a JPEG or PNG') unless photo.content_type.in?(%('image/jpeg image/png'))
    end
  end
end
