class CreateExercises < ActiveRecord::Migration[5.0]
  def change
    create_table :exercises do |t|
      t.text :workout
      t.references :user, foreign_key: true
      t.integer :duration_in_min

      t.timestamps
    end
  end
end
