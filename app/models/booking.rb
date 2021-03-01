class Booking < ApplicationRecord
  belongs_to :developer
  belongs_to :renter, foreign_key: :renter_id, class_name: "User"
  has_many :reviews
  validates :project_name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true
  validate :end_date_cannot_be_before_start_date

  def end_date_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "end date cannot be before start date")
    end
  end
end
