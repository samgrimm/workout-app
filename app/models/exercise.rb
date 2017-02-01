class Exercise < ApplicationRecord
  belongs_to :user

  validates :workout_date, presence: true
  validates :workout, presence: true
  validates :duration_in_min, numericality: {greater_than: 0.0}
end
