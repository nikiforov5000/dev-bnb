class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, foreign_key: :renter_id, class_name: "Booking", dependent: :destroy
  has_many :developers, foreign_key: :owner_id, class_name: "Developer", dependent: :destroy
  has_many :reviews, through: :bookings
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A.*@.*\.com\z/ }
  validates :password, presence: true
end
