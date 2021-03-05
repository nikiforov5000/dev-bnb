class Review < ApplicationRecord
  belongs_to :booking
  has_one :developer, through: :booking
  has_one :user, through: :booking
  validates :title, presence: true, length: { in: 3..16 }
  validates :content, presence: true, length: { in: 3..500 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
