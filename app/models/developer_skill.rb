class DeveloperSkill < ApplicationRecord
  belongs_to :developer
  belongs_to :skill
  validates :years_of_experience, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }
end
