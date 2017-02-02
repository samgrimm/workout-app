require "rails_helper"

RSpec.feature "Edit Exercize" do
  before do
    @john = User.create!(email: "john@example.com", first_name: "John", last_name: "Doe", password: "foobar", password_confirmation: "foobar")
    @e = @john.exercises.create(duration_in_min: 40, workout: "PUMP", workout_date: Date.today)
    login_as(@john)
  end
  scenario "allows user to edit an exercise" do
    visit "/"
    click_link "My Lounge"
    path = "/users/#{@john.id}/exercises/#{@e.id}/edit"
    link = "a[href=\'#{path}\']"

    find(link).click

    fill_in "Duration", with: 20
    fill_in "Workout Details", with: "Did 150 pushups"
    fill_in "Activity Date", with: "2017-02-01"

    click_button "Update Exercise"
    expect(page).to have_content("Exercise has been updated")
    expect(page).to have_content("Did 150 pushups")

    expect(current_path).to eq(user_exercise_path(@john, @e))
    expect(page).to have_content(20)

  end
end
