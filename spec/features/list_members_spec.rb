require "rails_helper"


RSpec.feature "List Members" do
  before do
    @john = User.create!(email: "john@example.com", first_name: "John", last_name: "Doe", password: "foobar", password_confirmation: "foobar")
    @sara = User.create!(email: "sara@example.com", first_name: "Sara", last_name: "Mara", password: "foobar", password_confirmation: "foobar")
    login_as(@john)
    visit "/"
  end
  scenario "see a list of users" do
    expect(page).to have_content("List of Members")
    expect(page).to have_content("Sara Mara")
    expect(page).to have_content("John Doe")

  end
end
