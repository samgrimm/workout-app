class AddWorkoutDateToExercises < ActiveRecord::Migration[5.0]
  def change
    add_column :exercises, :workout_date, :date
  end
end
