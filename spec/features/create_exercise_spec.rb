require "rails_helper"

RSpec.feature "Create Exercize" do
  before do
    @john = User.create!(email: "john@example.com", first_name: "John", last_name: "Doe", password: "foobar", password_confirmation: "foobar")
  end
  describe "visiting the homepage" do
    context "with valid inputs" do

      it "allows user to add an exercise" do
        login_as(@john)
        visit "/"
        click_link "My Lounge"
        click_link("New Workout")
        fill_in "Duration", with: 20
        fill_in "Workout Details", with: "Did 150 pushups"
        fill_in "Activity Date", with: "2017-02-01"

        click_button "Create Exercise"
        expect(page).to have_content("Exercise has been created")
        expect(page).to have_content("Did 150 pushups")
        exercise = Exercise.last
        expect(current_path).to eq(user_exercise_path(@john, exercise))
        expect(Exercise.last.user).to eq(@john)
      end
    end

    context "with invalid inputs" do

      it "allows user to add an exercise" do
        login_as(@john)
        visit "/"
        click_link "My Lounge"
        click_link("New Workout")
        fill_in "Duration", with: ""
        fill_in "Workout Details", with: ""
        fill_in "Activity Date", with: ""

        click_button "Create Exercise"
        expect(page).to have_content("Exercise has not been created")
        expect(page).to have_content("Duration in min is not a number")
        expect(page).to have_content("Workout can't be blank")
        expect(page).to have_content("Workout date can't be blank")
      end
    end
  end
end
