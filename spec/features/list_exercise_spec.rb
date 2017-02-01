require "rails_helper"

RSpec.feature "List Exercize" do
  before do
    @john = User.create!(email: "john@example.com", password: "foobar", password_confirmation: "foobar")
    @e1 = @john.exercises.create(duration_in_min: 20, workout: "My great workout", workout_date: Date.today)
    @e2 = @john.exercises.create(duration_in_min: 30, workout: "Another amazing workout", workout_date: 2.days.ago)
    @fred = User.create!(email: "fred@example.com", password: "foobar", password_confirmation: "foobar")
    @e1 = @fred.exercises.create(duration_in_min: 20, workout: "Fred's workout", workout_date: Date.today)
    @e2 = @fred.exercises.create(duration_in_min: 30, workout: "Fred working out", workout_date: 2.days.ago)
  end
  describe "visiting the lounge" do
    context "user has workouts" do

      it "lists the workouts for the user" do
        login_as(@john)
        visit "/"
        click_link "My Lounge"

        expect(page).to have_content("My great workout")
        expect(page).to have_content("Another amazing workout")

      end
      it "does not lists the workouts for another user" do
        login_as(@john)
        visit "/"
        click_link "My Lounge"

        expect(page).not_to have_content("Fred's workout")
        expect(page).not_to have_content("Fred working out")

      end
    end
    scenario "user has no workouts" do

      @john.exercises.delete_all
      login_as(@john)
      visit "/"
      click_link "My Lounge"

      expect(page).to have_content("You have no workouts logged yet")


    end
  end
end
