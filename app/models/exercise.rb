class Exercise < ApplicationRecord
  belongs_to :user

  validates :workout_date, presence: true
  validates :workout, presence: true
  validates :duration_in_min, numericality: {greater_than: 0.0}

  default_scope { where('workout_date > ?', 7.days.ago).order(workout_date: :desc)}
end
