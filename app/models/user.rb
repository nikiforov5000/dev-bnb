class User < ApplicationRecord
  has_many :bookings, foreign_key: :renter_id, class_name: "Booking", dependent: :destroy
  has_many :developers, foreign_key: :owner_id, class_name: "Developer", dependent: :destroy
  has_many :reviews, through: :booking
  has_many :developer_skills, through: :developer
  has_many :skills, through: :developer_skill
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :password, presence: true
end
