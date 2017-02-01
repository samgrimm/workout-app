require "rails_helper"

RSpec.feature "Create Homepage" do
  describe "visiting the homepage" do
    context "user goes to the homepage" do

      it "allow user to see the homepage" do
        visit "/"
        expect(page).to have_link("Home")
        expect(page).to have_link("Athletes Den")
        expect(page).to have_content("Workout Lounge!")
        expect(page).to have_content("Show off your workout!")
      end
    end
  end
end
