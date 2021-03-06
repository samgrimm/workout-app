require "rails_helper"


RSpec.feature "Sign In User" do
  before do
    @john = User.create!(email: "john@example.com", first_name: "John", last_name: "Doe", password: "foobar", password_confirmation: "foobar")
  end
  scenario "with valid credentials" do
    visit "/"

    click_link "Sign in"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button "Log in"
    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@john.full_name}")
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")
  end

end
