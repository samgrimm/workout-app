require "rails_helper"

RSpec.feature "Delete Exercize" do
  before do
    @john = User.create!(email: "john@example.com", first_name: "John", last_name: "Doe", password: "foobar", password_confirmation: "foobar")
    @e = @john.exercises.create(duration_in_min: 40, workout: "PUMP", workout_date: Date.today)
    login_as(@john)
  end
  scenario "allows user to delete an exercise" do
    visit "/"
    click_link "My Lounge"
    click_link "delete_#{@e.id}"

    expect(page).to have_content("Exercise has been deleted")
    expect(page).not_to have_content("PUMP")

    expect(current_path).to eq(user_exercises_path(@john))

  end
end
