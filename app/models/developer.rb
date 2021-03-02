class Developer < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: "User"
  has_many :bookings
  has_many :reviews, through: :booking
  has_many :developer_skills
  has_many :skills, through: :developer_skill
  validates :name, presence: true
end
