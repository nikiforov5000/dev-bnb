class Booking < ApplicationRecord
  belongs_to :developer
  belongs_to :user, foreign_key: :renter_id, class_name: "User"
  has_many :reviews
  validates :project_name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_price, presence: true
  validates :total_price, numericality: { greater_than: 0 }
  validates :status, presence: true
  validates :end_date_cannot_be_before_start_date

  def end_date_cannot_be_before_start_date
    if :end_date < :start_date
      errors.add(:end, "end date cannot be before start date")
    end
  end
end
